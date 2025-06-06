package com.lactacare.dao;

import com.lactacare.model.DonorStats;
import com.lactacare.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.time.Period;

public class DDashboardDAO {
    public DonorStats getDonorStats(int userId) throws SQLException {
        int totalDonations = 0;            
        int totalVolume = 0;
        String donorDuration = "0 days";
        
        String sql = "SELECT COUNT(*), COALESCE(SUM(amount_ml), 0) " +
                     "FROM inventory_transactions " +
                     "WHERE donor_id = ? AND type = 'donation'";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                totalDonations = rs.getInt(1);
                totalVolume = rs.getInt(2);
            }
        }
        
        String durationSql = "SELECT MIN(transaction_date) FROM inventory_transactions WHERE donor_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(durationSql)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Date firstDonation = rs.getDate(1);
                if (firstDonation != null) {
                    LocalDate start = firstDonation.toLocalDate();
                    Period period = Period.between(start, LocalDate.now());
                    donorDuration = period.getYears() + " years, " + 
                                   period.getMonths() + " months";
                }
            }
        }
        
        return new DonorStats(totalDonations, totalVolume, donorDuration);
    }
}