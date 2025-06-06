package com.lactacare.servlet.donor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.lactacare.dao.ScreeningDAO;
import com.lactacare.model.Screening;

@WebServlet("/screening")
public class ScreeningServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");
        Integer userId = (Integer) session.getAttribute("userId");
        
        session.removeAttribute("screening");
        session.removeAttribute("nextDueDate");
        
        if (donorId == null || userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            ScreeningDAO screeningDAO = new ScreeningDAO();
            Screening latestScreening = screeningDAO.getLatestScreening(donorId);
            
            if (latestScreening != null) {
                session.setAttribute("screening", latestScreening);
                
                if (latestScreening.getSubmissionDate() != null) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(latestScreening.getSubmissionDate());
                    cal.add(Calendar.MONTH, 1);
                    Date nextDueDate = cal.getTime();
                    session.setAttribute("nextDueDate", nextDueDate);
                }
                
                if ("Eligible".equals(latestScreening.getStatus())) {
                    Date today = new Date();
                    if (latestScreening.getEligibilityExpiry() != null && 
                        today.before(latestScreening.getEligibilityExpiry())) {
                        request.setAttribute("formDisabled", true);
                    }
                }
            }
            
            request.getRequestDispatcher("/screening.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}