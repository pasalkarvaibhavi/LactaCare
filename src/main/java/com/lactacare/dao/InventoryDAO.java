package com.lactacare.dao;

import com.lactacare.model.InventoryRecord;
import com.lactacare.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO {
    public static List<InventoryRecord> getInventoryRecords() {
        List<InventoryRecord> records = new ArrayList<>();
        String sql = "SELECT "
                   + "CASE "
                   + "  WHEN it.type = 'donation' THEN d.full_name "
                   + "  WHEN it.type = 'delivery' THEN h.name "
                   + "END AS user_name, "
                   + "it.transaction_date, "
                   + "it.amount_ml, "
                   + "CASE "
                   + "  WHEN it.type = 'donation' AND it.expiration_date >= CURRENT_DATE THEN 'Fresh' "
                   + "  WHEN it.type = 'donation' THEN 'Expired' "
                   + "  ELSE 'Delivered' "
                   + "END AS status, "
                   + "CASE it.type "
                   + "  WHEN 'donation' THEN 'Donation' "
                   + "  ELSE 'Delivery' "
                   + "END AS record_type "
                   + "FROM inventory_transactions it "
                   + "LEFT JOIN donors d ON it.donor_id = d.id "
                   + "LEFT JOIN hospitals h ON it.hospital_id = h.id "
                   + "ORDER BY it.transaction_date DESC";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                InventoryRecord record = new InventoryRecord();
                record.setUserName(rs.getString("user_name"));
                record.setDate(rs.getTimestamp("transaction_date"));
                record.setAmountMl(rs.getInt("amount_ml"));
                record.setStatus(rs.getString("status"));
                record.setRecordType(rs.getString("record_type"));
                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }

    public static int getTotalAvailableMilk() {
        String sql = "SELECT "
                   + "(SELECT COALESCE(SUM(amount_ml), 0) "
                   + " FROM inventory_transactions "
                   + " WHERE type = 'donation' AND expiration_date >= CURRENT_DATE) "
                   + "- "
                   + "(SELECT COALESCE(SUM(amount_ml), 0) "
                   + " FROM inventory_transactions "
                   + " WHERE type = 'delivery') AS total_ml";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt("total_ml");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}