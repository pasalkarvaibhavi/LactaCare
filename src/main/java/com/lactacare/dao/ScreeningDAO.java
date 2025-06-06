package com.lactacare.dao;

import com.lactacare.model.Screening;
import com.lactacare.util.DBUtil;

import java.sql.*;

public class ScreeningDAO {

    public Screening getLatestScreening(int donorId) throws SQLException {
        String sql = "SELECT * FROM screenings WHERE donor_id = ? ORDER BY submission_date DESC LIMIT 1";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, donorId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapScreening(rs);
                }
            }
        }
        return null;
    }

    public void createScreening(Screening screening) throws SQLException {
        String sql = "INSERT INTO screenings (donor_id, baby_dob, excess_milk, recent_illness, medications, " +
                     "infectious_diseases, chronic_illness, transplant, smoke, alcohol, diet_type, travel, " +
                     "consent1, consent2, consent3, consent4, status, disqualification_reasons, eligibility_expiry, user_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, screening.getDonorId());
            stmt.setDate(2, new java.sql.Date(screening.getBabyDob().getTime()));
            stmt.setString(3, screening.getExcessMilk());
            stmt.setString(4, screening.getRecentIllness());
            stmt.setString(5, screening.getMedications());
            stmt.setString(6, screening.getInfectiousDiseases());
            stmt.setString(7, screening.getChronicIllness());
            stmt.setString(8, screening.getTransplant());
            stmt.setString(9, screening.getSmoke());
            stmt.setString(10, screening.getAlcohol());
            stmt.setString(11, screening.getDietType());
            stmt.setString(12, screening.getTravel());
            stmt.setBoolean(13, screening.isConsent1());
            stmt.setBoolean(14, screening.isConsent2());
            stmt.setBoolean(15, screening.isConsent3());
            stmt.setBoolean(16, screening.isConsent4());
            stmt.setString(17, screening.getStatus());
            stmt.setString(18, screening.getDisqualificationReasons());
            stmt.setDate(19, screening.getEligibilityExpiry() != null ?
                    new java.sql.Date(screening.getEligibilityExpiry().getTime()) : null);
            stmt.setInt(20, screening.getUserId());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        screening.setId(generatedKeys.getInt(1));
                    }
                }
            }
        }
    }

    private Screening mapScreening(ResultSet rs) throws SQLException {
        Screening screening = new Screening();
        screening.setId(rs.getInt("id"));
        screening.setDonorId(rs.getInt("donor_id"));
        screening.setUserId(rs.getInt("user_id"));
        screening.setBabyDob(rs.getDate("baby_dob"));
        screening.setExcessMilk(rs.getString("excess_milk"));
        screening.setRecentIllness(rs.getString("recent_illness"));
        screening.setMedications(rs.getString("medications"));
        screening.setInfectiousDiseases(rs.getString("infectious_diseases"));
        screening.setChronicIllness(rs.getString("chronic_illness"));
        screening.setTransplant(rs.getString("transplant"));
        screening.setSmoke(rs.getString("smoke"));
        screening.setAlcohol(rs.getString("alcohol"));
        screening.setDietType(rs.getString("diet_type"));
        screening.setTravel(rs.getString("travel"));
        screening.setConsent1(rs.getBoolean("consent1"));
        screening.setConsent2(rs.getBoolean("consent2"));
        screening.setConsent3(rs.getBoolean("consent3"));
        screening.setConsent4(rs.getBoolean("consent4"));
        screening.setSubmissionDate(rs.getTimestamp("submission_date"));
        screening.setStatus(rs.getString("status"));
        screening.setDisqualificationReasons(rs.getString("disqualification_reasons"));
        screening.setEligibilityExpiry(rs.getDate("eligibility_expiry"));
        return screening;
    }
}
