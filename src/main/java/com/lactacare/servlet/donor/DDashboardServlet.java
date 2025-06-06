package com.lactacare.servlet.donor;

import com.lactacare.dao.DDashboardDAO;
import com.lactacare.dao.ScreeningDAO;
import com.lactacare.model.DonorStats;
import com.lactacare.model.Screening;
import com.lactacare.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/donordashboard")
public class DDashboardServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
		HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (donorId == null || userId==null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        DDashboardDAO dashboardDAO = new DDashboardDAO();
        ScreeningDAO screeningDAO = new ScreeningDAO();
        
        try {
            DonorStats stats = dashboardDAO.getDonorStats(donorId);
            request.setAttribute("stats", stats);
            

             Screening screening = screeningDAO.getLatestScreening(donorId);
            request.setAttribute("screening", screening);
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading dashboard data");
        }
        
        request.getRequestDispatcher("donor_dashboard.jsp").forward(request, response);
    }
}