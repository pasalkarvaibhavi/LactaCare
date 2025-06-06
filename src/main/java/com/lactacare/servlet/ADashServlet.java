 package com.lactacare.servlet;


import com.lactacare.dao.ADashboardDAO;
import com.lactacare.model.ADashboard;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Adashboard")
public class ADashServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        ADashboard data = ADashboardDAO.getDashboardData();
        request.setAttribute("dashboardData", data);
        request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
    }
}