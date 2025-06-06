package com.lactacare.servlet.donor;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import com.lactacare.util.DBUtil;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
         HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect if not logged in
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT u.email, d.full_name, d.contact, d.dob, d.address " +
                       "FROM users u " +
                       "JOIN donors d ON u.id = d.user_id " +
                       "WHERE u.id = ?";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
            	String fullName = rs.getString("full_name");
            	 session.setAttribute("fullName", fullName);
            	 
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("fullName", rs.getString("full_name"));
                request.setAttribute("phone", rs.getString("contact"));
                request.setAttribute("dob", rs.getDate("dob"));
                request.setAttribute("address", rs.getString("address"));
                
            }
            
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?error=database");
        }
    }
}