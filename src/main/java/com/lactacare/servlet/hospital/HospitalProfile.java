package com.lactacare.servlet.hospital;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import com.lactacare.util.DBUtil;

@WebServlet("/hospital-profile")
public class HospitalProfile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {

	    HttpSession session = request.getSession();
	    Integer userId = (Integer) session.getAttribute("userId");

	    if (userId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    try (Connection conn = DBUtil.getConnection()) {
	        String sql = "SELECT u.email, h.name, h.license_id, h.contact_person, h.contact_number, h.address " +  
	                     "FROM users u " +
	                     "JOIN hospitals h ON u.id = h.user_id " +
	                     "WHERE u.id = ?";

	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            String name = rs.getString("name");
	            session.setAttribute("name", name);

	            request.setAttribute("name", name);
	            request.setAttribute("licenseId", rs.getString("license_id"));
	            request.setAttribute("contactPerson", rs.getString("contact_person"));
	            request.setAttribute("contactNumber", rs.getString("contact_number"));
	            request.setAttribute("address", rs.getString("address"));
	            request.setAttribute("email", rs.getString("email"));

	           
	        } else {
	            System.out.println("No hospital found for userId: " + userId);
	            response.sendRedirect("h_profile.jsp?error=not_found");
	            return;
	        }

	        request.getRequestDispatcher("/hospital-profile.jsp").forward(request, response);

	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect("hospital-profile.jsp?error=database_error");
	    }
	}
}
