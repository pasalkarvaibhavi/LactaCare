package com.lactacare.dao;

import com.lactacare.model.MilkRequest;
import com.lactacare.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MilkRequestHistoryDAO {
    public List<MilkRequest> getRequestsByHospital(int hospitalId, String status, 
                                                  Date startDate, Date endDate) throws SQLException {
        List<MilkRequest> requests = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT id, baby_name, milk_type, quantity_ml, status, request_date, urgency_level " +
            "FROM milk_requests WHERE hospital_id = ?"
        );
        
        List<Object> params = new ArrayList<>();
        params.add(hospitalId);
        
        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
            params.add(status);
        }
        
        if (startDate != null) {
            sql.append(" AND request_date >= ?");
            params.add(new Timestamp(startDate.getTime()));
        }
        
        if (endDate != null) {
            sql.append(" AND request_date <= ?");
            params.add(new Timestamp(endDate.getTime() + 86400000));
        }
        
        sql.append(" ORDER BY request_date DESC");
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MilkRequest request = new MilkRequest();
                    request.setId(rs.getInt("id"));
                    request.setBabyName(rs.getString("baby_name"));
                    request.setMilkType(rs.getString("milk_type"));
                    request.setQuantity(rs.getInt("quantity_ml"));
                    request.setStatus(rs.getString("status"));
                    request.setRequestDate(rs.getTimestamp("request_date"));
                    request.setUrgencyLevel(rs.getString("urgency_level"));
                    requests.add(request);
                }
            }
        }
        return requests;
    }
}