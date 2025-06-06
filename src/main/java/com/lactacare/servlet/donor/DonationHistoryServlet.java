package com.lactacare.servlet.donor;

import com.lactacare.model.DonationRecord;
import com.lactacare.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/donation-history")
public class DonationHistoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (donorId == null || userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        List<DonationRecord> donations = new ArrayList<>();
        int total = 0, accepted = 0, pending = 0, rejected = 0;

        String sql = "SELECT appointment_date, milk_amount, type, test_result " +
                     "FROM appointments " +
                     "WHERE donor_id = ? " +
                     "ORDER BY appointment_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, donorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                DonationRecord record = new DonationRecord();
                record.setDate(rs.getDate("appointment_date"));
                record.setVolume(rs.getInt("milk_amount"));
                record.setType(rs.getString("type"));
                record.setTest_result(rs.getString("test_result"));
                donations.add(record);

                total++;

                String result = record.getTest_result();
                if (result == null || result.trim().isEmpty()) {
                    pending++;
                } else {
                    switch (result.trim().toLowerCase()) {
                        case "accepted":
                            accepted++;
                            break;
                        case "rejected":
                            rejected++;
                            break;
                        default:
                            pending++;
                            break;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching donation history");
        }

        request.setAttribute("donations", donations);
        request.setAttribute("total", total);
        request.setAttribute("accepted", accepted);
        request.setAttribute("pending", pending);
        request.setAttribute("rejected", rejected);

        request.getRequestDispatcher("/donation_history.jsp").forward(request, response);
    }
}
