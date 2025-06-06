package com.lactacare.servlet.hospital;

import com.lactacare.dao.HospitalDashboardDAO;
import com.lactacare.model.MilkRequest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/dashboard")
public class HospitalDashboardServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
		 HttpSession session = request.getSession();
	        Integer userId = (Integer) session.getAttribute("userId");
	        Integer hospitalId = (Integer) session.getAttribute("hospitalId");

	        if (userId == null || hospitalId == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }
	        
	        System.out.println("Hospital ID: " + hospitalId); 
        HospitalDashboardDAO dao = new HospitalDashboardDAO();
        
        try {
           
            Map<String, Integer> counts = dao.getRequestCounts(hospitalId);
            
            
            int total = counts.values().stream().mapToInt(Integer::intValue).sum();
            
           
            List<MilkRequest> recentRequests = dao.getRecentRequests(hospitalId, 5);
            
            
            request.setAttribute("totalRequests", total);
            request.setAttribute("pendingRequests", counts.getOrDefault("Pending", 0));
            request.setAttribute("approvedRequests", counts.getOrDefault("Approved", 0));
            request.setAttribute("rejectedRequests", counts.getOrDefault("Rejected", 0));
            request.setAttribute("recentRequests", recentRequests);
            
        } catch (SQLException e) {
            request.setAttribute("error", "Error loading dashboard data");
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("/hospital_dashboard.jsp").forward(request, response);
    }
}