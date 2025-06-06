package com.lactacare.servlet.hospital;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import com.lactacare.util.DBUtil;

@WebServlet("/hospital-profile-update")
public class HospitalProfileUpdate extends HttpServlet {
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

            String hospitalSql = "UPDATE hospitals SET name=?, license_id=?, contact_person=?, contact_number=?, address=? " +
                                 "WHERE user_id=?";
            PreparedStatement hospitalStmt = conn.prepareStatement(hospitalSql);
            hospitalStmt.setString(1, request.getParameter("name"));
            hospitalStmt.setString(2, request.getParameter("licenseId"));
            hospitalStmt.setString(3, request.getParameter("contactPerson"));
            hospitalStmt.setString(4, request.getParameter("contactNumber"));
            hospitalStmt.setString(5, request.getParameter("address"));
            hospitalStmt.setInt(6, userId);
            hospitalStmt.executeUpdate();
            
            String fetchSql = "SELECT name FROM hospitals WHERE user_id=?";
            PreparedStatement fetchStmt = conn.prepareStatement(fetchSql);
            fetchStmt.setInt(1, userId);
            ResultSet rs = fetchStmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("name", rs.getString("name"));
            }

            response.sendRedirect("hospital-profile?success=true");

        } catch (SQLException | IllegalArgumentException e) {
            e.printStackTrace();
            response.sendRedirect("hospital-profile?error=update");
        }
    }
}
