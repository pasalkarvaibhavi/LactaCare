package com.lactacare.servlet.donor;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.lactacare.model.Screening;
import com.lactacare.util.*;
import com.lactacare.dao.*;


@WebServlet("/submitScreening")
public class SubmitScreeningServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (donorId == null || userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
//        
//        if (userId == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }

      
        String babyDobStr = request.getParameter("babyDob");
        String excessMilk = request.getParameter("excessMilk");
        String recentIllness = request.getParameter("recentIllness");
        String medications = request.getParameter("medications");
        String infectiousDiseases = request.getParameter("infectiousDiseases");
        String chronicIllness = request.getParameter("chronicIllness");
        String transplant = request.getParameter("transplant");
        String smoke = request.getParameter("smoke");
        String alcohol = request.getParameter("alcohol");
        String dietType = request.getParameter("dietType");
        String travel = request.getParameter("travel");
        boolean consent1 = "on".equals(request.getParameter("consent1"));
        boolean consent2 = "on".equals(request.getParameter("consent2"));
        boolean consent3 = "on".equals(request.getParameter("consent3"));
        boolean consent4 = "on".equals(request.getParameter("consent4"));

        List<String> errors = new ArrayList<>();
        if (babyDobStr == null || babyDobStr.isEmpty()) errors.add("Baby's date of birth is required");
        if (excessMilk == null) errors.add("Excess milk question is required");
        if (recentIllness == null) errors.add("Recent illness question is required");
        if (medications == null) errors.add("Medications question is required");
        if (infectiousDiseases == null) errors.add("Infectious diseases question is required");
        if (chronicIllness == null) errors.add("Chronic illness question is required");
        if (transplant == null) errors.add("Transplant question is required");
        if (smoke == null) errors.add("Smoke question is required");
        if (alcohol == null) errors.add("Alcohol question is required");
        if (dietType == null || dietType.isEmpty()) errors.add("Diet type is required");
        if (travel == null) errors.add("Travel question is required");
        if (!consent1) errors.add("Consent 1 is required");
        if (!consent2) errors.add("Consent 2 is required");
        if (!consent3) errors.add("Consent 3 is required");
        if (!consent4) errors.add("Consent 4 is required");

        if (!errors.isEmpty()) {
            session.setAttribute("errors", errors);
            response.sendRedirect("screening");
            return;
        }

        Date babyDob = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            babyDob = sdf.parse(babyDobStr);
        } catch (ParseException e) {
            errors.add("Invalid date format for baby's date of birth");
            session.setAttribute("errors", errors);
            response.sendRedirect("screening");
            return;
        }

        Screening screening = new Screening(
            donorId, userId, babyDob, excessMilk, recentIllness, medications,
            infectiousDiseases, chronicIllness, transplant, smoke, alcohol,
            dietType, travel, consent1, consent2, consent3, consent4
        );

        String status = "Eligible";
        List<String> disqualifications = new ArrayList<>();
        
        if ("Yes".equals(recentIllness)) disqualifications.add("Recent illness");
        if ("Yes".equals(medications)) disqualifications.add("Medications");
        if ("Yes".equals(infectiousDiseases)) disqualifications.add("Infectious diseases");
        if ("Yes".equals(chronicIllness)) disqualifications.add("Chronic illness");
        if ("Yes".equals(transplant)) disqualifications.add("Organ transplant");
        if ("Yes".equals(smoke)) disqualifications.add("Tobacco use");
        if ("Yes".equals(alcohol)) disqualifications.add("Alcohol/drug use");
        if ("Yes".equals(travel)) disqualifications.add("Recent international travel");
        
        if (!disqualifications.isEmpty()) {
            status = "Ineligible";
            screening.setDisqualificationReasons(String.join(", ", disqualifications));
        }
        screening.setStatus(status);

                if ("Eligible".equals(status)) {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH, 1);
            screening.setEligibilityExpiry(cal.getTime());
        }

        try {
            ScreeningDAO screeningDAO = new ScreeningDAO();
            screeningDAO.createScreening(screening);
            session.setAttribute("success", "Screening submitted successfully!");
           
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: " + e.getMessage());
        }
        
        response.sendRedirect("screening");
    }
}