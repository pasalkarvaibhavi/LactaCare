package com.lactacare.dao;

import java.sql.*;

import com.lactacare.util.DBUtil;

public class InventoryTransactionDAO {
    public static void recordDelivery(int hospitalId, int requestId, int amountMl) {
        String sql = "INSERT INTO inventory_transactions "
                   + "(type, hospital_id, request_id, amount_ml) "
                   + "VALUES ('delivery', ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, hospitalId);
            stmt.setInt(2, requestId);
            
            stmt.setInt(3, amountMl);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}