package com.lactacare.servlet.hospital;

import com.lactacare.dao.MilkRequestHistoryDAO;
import com.lactacare.model.MilkRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/request-history")
public class RequestHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("hospitalId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int hospitalId = (Integer) session.getAttribute("hospitalId");
        String status = request.getParameter("status");
        Date startDate = null;
        Date endDate = null;
        
        try {
            String dateFrom = request.getParameter("dateFrom");
            String dateTo = request.getParameter("dateTo");
            
            if (dateFrom != null && !dateFrom.isEmpty()) {
                startDate = Date.valueOf(dateFrom);
            }
            if (dateTo != null && !dateTo.isEmpty()) {
                endDate = Date.valueOf(dateTo);
            }
        } catch (IllegalArgumentException e) {
           
        }

        MilkRequestHistoryDAO dao = new MilkRequestHistoryDAO();
        try {
            List<MilkRequest> requests = dao.getRequestsByHospital(
                hospitalId, status, startDate, endDate
            );
            request.setAttribute("requests", requests);
        } catch (Exception e) {
            request.setAttribute("error", "Error fetching request history");
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("/request_history.jsp").forward(request, response);
    }
}