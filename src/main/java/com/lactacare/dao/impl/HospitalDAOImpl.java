package com.lactacare.dao.impl;

import com.lactacare.dao.HospitalDAO;
import com.lactacare.model.Hospital;
import com.lactacare.util.DBUtil;
import java.sql.*;

public class HospitalDAOImpl implements HospitalDAO {

    @Override
    public void saveHospital(Hospital hospital) throws SQLException {
        String sql = "INSERT INTO hospitals (user_id, name, license_id, contact_person, "
                   + "contact_number, address, has_milkbank) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, hospital.getUserId());
            stmt.setString(2, hospital.getName());
            stmt.setString(3, hospital.getLicenseId());
            stmt.setString(4, hospital.getContactPerson());
            stmt.setString(5, hospital.getContactNumber());
            stmt.setString(6, hospital.getAddress());
            stmt.setBoolean(7, hospital.isHasMilkbank());
            
            stmt.executeUpdate();
        }
    }

    @Override
    public Hospital getHospitalByUserId(int userId) throws SQLException {
        String sql = "SELECT * FROM hospitals WHERE user_id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Hospital hospital = new Hospital();
                    hospital.setId(rs.getInt("id"));
                    hospital.setUserId(rs.getInt("user_id"));
                    hospital.setName(rs.getString("name"));
                    hospital.setLicenseId(rs.getString("license_id"));
                    hospital.setContactPerson(rs.getString("contact_person"));
                    hospital.setContactNumber(rs.getString("contact_number"));
                    hospital.setAddress(rs.getString("address"));
                    hospital.setHasMilkbank(rs.getBoolean("has_milkbank"));
                    return hospital;
                }
            }
            return null;
        }
    }
}