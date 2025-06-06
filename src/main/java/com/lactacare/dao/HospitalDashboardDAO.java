package com.lactacare.dao;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lactacare.model.MilkRequest;
import com.lactacare.util.DBUtil;

import java.util.ArrayList;

public class HospitalDashboardDAO {
    
    public Map<String, Integer> getRequestCounts(int hospitalId) throws SQLException {
        Map<String, Integer> counts = new HashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM milk_requests WHERE hospital_id = ? GROUP BY status";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, hospitalId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    counts.put(rs.getString("status"), rs.getInt("count"));
                }
            }
        }
        return counts;
    }

    public List<MilkRequest> getRecentRequests(int hospitalId, int limit) throws SQLException {
        List<MilkRequest> requests = new ArrayList<>();
        String sql = "SELECT id, baby_name, milk_type, quantity_ml, status, request_date " +
                     "FROM milk_requests WHERE hospital_id = ? ORDER BY request_date DESC LIMIT ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, hospitalId);
            stmt.setInt(2, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MilkRequest request = new MilkRequest();
                    request.setId(rs.getInt("id"));
                    request.setBabyName(rs.getString("baby_name"));
                    request.setMilkType(rs.getString("milk_type"));
                    request.setQuantity(rs.getInt("quantity_ml"));
                    request.setStatus(rs.getString("status"));
                    request.setRequestDate(rs.getTimestamp("request_date"));
                    requests.add(request);
                }
            }
        }
        return requests;
    }
}