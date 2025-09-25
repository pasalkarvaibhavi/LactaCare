package com.lactacare.dao;

import com.lactacare.model.Donation;
import com.lactacare.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonationDAO {

    public void saveDonation(Donation d) throws Exception {
        String sql = "INSERT INTO donations(order_id, payer_name, email, phone, amount, message, razorpay_id, status) VALUES (?,?,?,?,?,?,?,?)";
        try (Connection con = DBUtil.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, d.getOrderId());
            ps.setString(2, d.getPayerName());
            ps.setString(3, d.getEmail());
            ps.setString(4, d.getPhone());
            ps.setDouble(5, d.getAmount());
            ps.setString(6, d.getMessage());
            ps.setString(7, d.getRazorpayId());
            ps.setString(8, d.getStatus());
            ps.executeUpdate();
        }
    }

    public List<Donation> getAllDonations() throws Exception {
        List<Donation> list = new ArrayList<>();
        String sql = "SELECT * FROM donations ORDER BY created_at DESC";
        try (Connection con = DBUtil.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Donation d = new Donation();
                d.setOrderId(rs.getString("order_id"));
                d.setPayerName(rs.getString("payer_name"));
                d.setEmail(rs.getString("email"));
                d.setPhone(rs.getString("phone"));
                d.setAmount(rs.getDouble("amount"));
                d.setMessage(rs.getString("message"));
                d.setRazorpayId(rs.getString("razorpay_id"));
                d.setStatus(rs.getString("status"));
                d.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(d);
            }
        }
        return list;
    }
}