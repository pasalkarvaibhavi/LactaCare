package com.lactacare.dao;

import com.lactacare.model.MilkRequest;
import com.lactacare.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MilkRequestDAO {
    private Connection connection;

    public MilkRequestDAO() throws SQLException {
        connection = DBUtil.getConnection();
    }

    public boolean addMilkRequest(MilkRequest request) {
        String sql = "INSERT INTO milk_requests (hospital_id, user_id, baby_name, baby_gender, baby_dob, baby_weight, "
                   + "birth_condition, health_notes, doctor_name, milk_type, quantity_ml, urgency_level, "
                   + "request_reason, prescription_path) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, request.getHospitalId());
            statement.setInt(2, request.getUserId());
            statement.setString(3, request.getBabyName());
            statement.setString(4, request.getBabyGender());
            statement.setDate(5, request.getBabyDob());
            statement.setDouble(6, request.getBabyWeight());
            statement.setString(7, request.getBirthCondition());
            statement.setString(8, request.getHealthNotes());
            statement.setString(9, request.getDoctorName());
            statement.setString(10, request.getMilkType());
            statement.setInt(11, request.getQuantity());
            statement.setString(12, request.getUrgencyLevel());
            statement.setString(13, request.getRequestReason());
            statement.setString(14, request.getPrescriptionPath());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<MilkRequest> getRequestsByHospital(int hospitalId) {
        List<MilkRequest> requests = new ArrayList<>();
        String sql = "SELECT * FROM milk_requests WHERE hospital_id = ? ORDER BY request_date DESC";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, hospitalId);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    MilkRequest request = new MilkRequest();
                   
                    request.setId(rs.getInt("id"));
                    request.setBabyName(rs.getString("baby_name"));
                    request.setRequestDate(rs.getTimestamp("request_date"));
                    request.setMilkType(rs.getString("milk_type"));
                    request.setQuantity(rs.getInt("quantity_ml"));
                    request.setUrgencyLevel(rs.getString("urgency_level"));
                    request.setStatus(rs.getString("status"));
                    requests.add(request);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }
}