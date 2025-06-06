 package com.lactacare.dao;

import com.lactacare.model.Appointment;
import com.lactacare.util.DBUtil;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class adminAppointmentDAO {
    
    public static List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
       
        
        String sql = "SELECT a.id, d.full_name AS donor_name, a.appointment_date, " +
                "a.type, a.time_slot, a.status, a.milk_amount, a.test_result " +
                "FROM appointments a " +
                "JOIN donors d ON a.donor_id = d.id " +
                "ORDER BY a.appointment_date DESC";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Appointment appt = new Appointment();
                appt.setId(rs.getInt("id"));
                appt.setDonorName(rs.getString("donor_name"));
                appt.setDate(rs.getObject("appointment_date", LocalDate.class));
                appt.setType(rs.getString("type"));
                appt.setTimeSlot(rs.getString("time_slot"));
                appt.setStatus(rs.getString("status"));
                
                int milkAmount = rs.getInt("milk_amount");
                appt.setMilkAmount(rs.wasNull() ? null : milkAmount);
                
                appt.setTestResult(rs.getString("test_result"));
                appointments.add(appt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public static void updateAppointmentStatus(int id) {
        String sql = "UPDATE appointments SET status = 'completed' WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void recordMilkTest(int id, String testResult, int milkAmount) {
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); 

            String updateAppointmentSql = "UPDATE appointments SET test_result = ?, milk_amount = ? WHERE id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(updateAppointmentSql)) {
                pstmt.setString(1, testResult);
                pstmt.setInt(2, milkAmount);
                pstmt.setInt(3, id);
                pstmt.executeUpdate();
            }

            if ("accepted".equals(testResult)) {
                int donorId = getDonorIdForAppointment(conn, id);
                
                String insertTransactionSql = "INSERT INTO inventory_transactions (" +
                    "type, donor_id, appointment_id, amount_ml, transaction_date, expiration_date" +
                    ") VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_DATE + INTERVAL '6 months')";
                
                try (PreparedStatement pstmt = conn.prepareStatement(insertTransactionSql)) {
                    pstmt.setString(1, "donation");
                    pstmt.setInt(2, donorId);
                    pstmt.setInt(3, id);
                    pstmt.setInt(4, milkAmount);
                    pstmt.executeUpdate();
                }
            }

            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    private static int getDonorIdForAppointment(Connection conn, int appointmentId) throws SQLException {
        String sql = "SELECT donor_id FROM appointments WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, appointmentId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("donor_id");
                }
            }
        }
        throw new SQLException("Donor not found for appointment: " + appointmentId);
    }
}