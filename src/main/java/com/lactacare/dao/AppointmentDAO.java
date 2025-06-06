
package com.lactacare.dao;

import com.lactacare.model.Appointment;
import com.lactacare.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;

public class AppointmentDAO {

    public static Appointment getLatestAppointment(int donorId) {
        String sql = "SELECT * FROM appointments " +
                     "WHERE donor_id = ? " +
                     "ORDER BY appointment_date DESC, id DESC " +
                     "LIMIT 1";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, donorId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Appointment appointment = new Appointment();
                    appointment.setId(rs.getInt("id"));
                    appointment.setUserId(rs.getInt("user_id"));
                    appointment.setDonorId(rs.getInt("donor_id"));
                    appointment.setType(rs.getString("type"));
                    appointment.setDate(rs.getDate("appointment_date").toLocalDate());
                    appointment.setTimeSlot(rs.getString("time_slot"));
                    appointment.setNotes(rs.getString("notes"));
                    appointment.setStatus(rs.getString("status"));
                    return appointment;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean hasPendingAppointment(int donorId) {
        String sql = "SELECT COUNT(*) FROM appointments WHERE donor_id = ? " +
                     "AND status = 'scheduled' " +
                     "AND appointment_date >= CURRENT_DATE";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, donorId);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean isSlotBooked(int donorId, LocalDate date, String timeSlot) {
        String sql = "SELECT COUNT(*) FROM appointments " +
                     "WHERE donor_id = ? AND appointment_date = ? AND time_slot = ? " +
                     "AND status = 'scheduled'";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, donorId);
            pstmt.setDate(2, Date.valueOf(date));
            pstmt.setString(3, timeSlot);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int createAppointment(Appointment appointment) {
        String sql = "INSERT INTO appointments (user_id, donor_id, type, appointment_date, time_slot, notes, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, 'scheduled') RETURNING id";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, appointment.getUserId());
            pstmt.setInt(2, appointment.getDonorId());
            pstmt.setString(3, appointment.getType());
            pstmt.setDate(4, Date.valueOf(appointment.getDate()));
            pstmt.setString(5, appointment.getTimeSlot());
            pstmt.setString(6, appointment.getNotes());
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public static Appointment getAppointmentById(int id) {
        String sql = "SELECT * FROM appointments WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Appointment appointment = new Appointment();
                    appointment.setId(rs.getInt("id"));
                    appointment.setUserId(rs.getInt("user_id"));
                    appointment.setDonorId(rs.getInt("donor_id"));
                    appointment.setType(rs.getString("type"));
                    appointment.setDate(rs.getDate("appointment_date").toLocalDate());
                    appointment.setTimeSlot(rs.getString("time_slot"));
                    appointment.setNotes(rs.getString("notes"));
                    appointment.setStatus(rs.getString("status"));
                    return appointment;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}