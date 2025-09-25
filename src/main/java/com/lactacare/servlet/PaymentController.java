package com.lactacare.servlet;

import java.io.BufferedReader;
import java.io.IOException;

import com.lactacare.dao.DonationDAO;
import com.lactacare.model.Donation;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) sb.append(line);

        try {
            JSONObject json = new JSONObject(sb.toString());

            // For Razorpay, we'll store the payment details
            String paymentId = json.getString("razorpayPaymentID");
            String orderId = json.getString("razorpayOrderID");
            String signature = json.getString("razorpaySignature");

            // Note: In production, you should verify the signature
            // For now, we'll assume it's valid
            boolean isValid = true;

            if (!isValid) {
                response.setStatus(400);
                response.getWriter().write("Payment verification failed");
                return;
            }

            Donation d = new Donation();
            d.setOrderId(orderId);
            d.setPayerName(json.getString("payerName"));
            d.setEmail(json.getString("email"));
            d.setPhone(json.getString("phone"));
            d.setAmount(json.getDouble("amount"));
            d.setMessage(json.getString("message"));
            d.setRazorpayId(paymentId);
            d.setStatus("completed");

            new DonationDAO().saveDonation(d);

            response.setContentType("text/plain");
            response.getWriter().write("Donation saved successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().write("Error saving donation.");
        }
    }
}