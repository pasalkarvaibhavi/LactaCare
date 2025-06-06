package com.lactacare.dao;

import com.lactacare.model.MilkRequest;
import com.lactacare.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class adminMilkRequestDAO {
    public static List<MilkRequest> getAllMilkRequests() {
        List<MilkRequest> requests = new ArrayList<>();
        String sql = "SELECT mr.id, mr.hospital_id, mr.baby_name, mr.quantity_ml, "
                   + "mr.urgency_level, mr.status, mr.prescription_path, mr.request_date, "
                   + "h.name AS hospital_name "
                   + "FROM milk_requests mr "
                   + "JOIN hospitals h ON mr.hospital_id = h.id "
                   + "ORDER BY mr.request_date DESC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                MilkRequest request = new MilkRequest();
                request.setId(rs.getInt("id"));
                request.setHospitalId(rs.getInt("hospital_id"));
                request.setHospitalName(rs.getString("hospital_name"));
                request.setBabyName(rs.getString("baby_name"));
                request.setQuantity(rs.getInt("quantity_ml"));
                request.setUrgencyLevel(rs.getString("urgency_level"));
                request.setStatus(rs.getString("status"));
                request.setPrescriptionPath(rs.getString("prescription_path"));
                request.setRequestDate(rs.getTimestamp("request_date"));
                requests.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }

    public static MilkRequest getMilkRequestById(int requestId) {
        String sql = "SELECT * FROM milk_requests WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, requestId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    MilkRequest request = new MilkRequest();
                    request.setId(rs.getInt("id"));
                    request.setHospitalId(rs.getInt("hospital_id"));
                    request.setQuantity(rs.getInt("quantity_ml"));
                    request.setStatus(rs.getString("status"));
                    return request;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateRequestStatus(int requestId, String status) {
        String sql = "UPDATE milk_requests SET status = ? WHERE id = ?";
        try (Connection conn =DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, requestId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}