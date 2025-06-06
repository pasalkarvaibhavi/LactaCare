package com.lactacare.servlet.contact;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import com.lactacare.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@jakarta.servlet.annotation.WebServlet("/ContactServlet")
public class ContactServlet extends jakarta.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");

            conn = DBUtil.getConnection();
            String sql = "INSERT INTO contact_messages(full_name, email, phone, subject, message, submitted_at) "
                       + "VALUES (?, ?, ?, ?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, phone.isEmpty() ? null : phone);
            pstmt.setString(4, subject);
            pstmt.setString(5, message);
            pstmt.setTimestamp(6, new java.sql.Timestamp(new Date().getTime()));
            
            int result = pstmt.executeUpdate();
            
            if(result > 0) {
                response.sendRedirect(request.getContextPath() + "/index.jsp?success=true");
            } else {
                request.setAttribute("error", "Failed to save contact information");
                request.getRequestDispatcher("/contact.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
        } finally {
        	DBUtil.close(conn);
        }
    }
}