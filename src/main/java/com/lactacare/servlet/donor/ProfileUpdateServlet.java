package com.lactacare.servlet.donor;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import com.lactacare.util.DBUtil;

@WebServlet("/profile-update")
public class ProfileUpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            
            String userSql = "UPDATE users SET email = ? WHERE id = ?";
            PreparedStatement userStmt = conn.prepareStatement(userSql);
            userStmt.setString(1, request.getParameter("email"));
            userStmt.setInt(2, userId);
            userStmt.executeUpdate();

           
            String donorSql = "UPDATE donors SET full_name=?, contact=?, dob=?, address=? " +
                            "WHERE user_id=?";
            PreparedStatement donorStmt = conn.prepareStatement(donorSql);
            donorStmt.setString(1, request.getParameter("fullName"));
            donorStmt.setString(2, request.getParameter("phone"));
            donorStmt.setDate(3, Date.valueOf(request.getParameter("birthDate")));
            donorStmt.setString(4, request.getParameter("address"));
            donorStmt.setInt(5, userId);
            donorStmt.executeUpdate();
            
            String fetchSql = "SELECT full_name FROM donors WHERE user_id=?";
            PreparedStatement fetchStmt = conn.prepareStatement(fetchSql);
            fetchStmt.setInt(1, userId);
            ResultSet rs = fetchStmt.executeQuery();
            		
            		if (rs.next()) {
                        
                        session.setAttribute("fullName", rs.getString("full_name"));
                    }
            
          
            response.sendRedirect("profile?success=true");
            
        } catch (SQLException | IllegalArgumentException e) {
            e.printStackTrace();
            response.sendRedirect("profile?error=update");
        }
    }
}