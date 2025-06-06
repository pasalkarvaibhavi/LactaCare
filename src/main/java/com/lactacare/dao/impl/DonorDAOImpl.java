package com.lactacare.dao.impl;

import com.lactacare.dao.DonorDAO;
import com.lactacare.model.Donor;
import com.lactacare.util.DBUtil;
import java.sql.*;

public class DonorDAOImpl implements DonorDAO {

    @Override
    public void saveDonor(Donor donor) throws SQLException {
        String sql = "INSERT INTO donors (user_id, full_name, contact, dob, address, lactation_status) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, donor.getUserId());
            stmt.setString(2, donor.getFullName());
            stmt.setString(3, donor.getContact());
            stmt.setDate(4, new java.sql.Date(donor.getDob().getTime()));
            stmt.setString(5, donor.getAddress());
            stmt.setString(6, donor.getLactationStatus());
            
            stmt.executeUpdate();
        }
    }

    @Override
    public Donor getDonorByUserId(int userId) throws SQLException {
        String sql = "SELECT * FROM donors WHERE user_id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Donor donor = new Donor();
                    donor.setId(rs.getInt("id"));
                    donor.setUserId(rs.getInt("user_id"));
                    donor.setFullName(rs.getString("full_name"));
                    donor.setContact(rs.getString("contact"));
                    donor.setDob(rs.getDate("dob"));
                    donor.setAddress(rs.getString("address"));
                    donor.setLactationStatus(rs.getString("lactation_status"));
                    return donor;
                }
            }
            return null;
        }
    }
}

