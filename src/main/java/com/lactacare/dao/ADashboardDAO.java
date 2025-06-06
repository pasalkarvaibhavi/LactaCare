package com.lactacare.dao;

import com.lactacare.model.ADashboard;
import com.lactacare.util.DBUtil;
import java.sql.*;

public class ADashboardDAO {
	public static ADashboard getDashboardData() {
		ADashboard data = new ADashboard();
		System.out.println("Fetching dashboard data...");

		String donorsSql = "SELECT COUNT(*) AS count FROM donors";
		
		String hospitalsSql = "SELECT COUNT(*) AS count FROM hospitals";
		
		String milkSql = "SELECT " + "(SELECT COALESCE(SUM(amount_ml), 0) " + " FROM inventory_transactions "
				+ " WHERE type = 'donation' AND expiration_date >= CURRENT_DATE) " + "- "
				+ "(SELECT COALESCE(SUM(amount_ml), 0) " + " FROM inventory_transactions "
				+ " WHERE type = 'delivery') AS total_ml";

		String expiredSql = "SELECT COALESCE(SUM(amount_ml), 0) AS total_expired " + "FROM inventory_transactions "
				+ "WHERE type = 'donation' AND expiration_date < CURRENT_DATE";

		try (Connection conn = DBUtil.getConnection(); Statement stmt = conn.createStatement()) {

			try (ResultSet rs = stmt.executeQuery(donorsSql)) {
				if (rs.next())
					data.setTotalDonors(rs.getInt("count"));
			}

			try (ResultSet rs = stmt.executeQuery(hospitalsSql)) {
				if (rs.next())
					data.setTotalHospitals(rs.getInt("count"));
			}

			try (ResultSet rs = stmt.executeQuery(milkSql)) {
				if (rs.next())
					data.setTotalMilk(rs.getInt("total_ml"));
			}

			try (ResultSet rs = stmt.executeQuery(expiredSql)) {
				if (rs.next())
					data.setExpiredMilk(rs.getInt("total_expired"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
}