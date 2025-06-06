package com.lactacare.servlet.hospital;

import com.lactacare.dao.MilkRequestHistoryDAO;
import com.lactacare.model.MilkRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("hospitalId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int hospitalId = (Integer) session.getAttribute("hospitalId");
        String status = request.getParameter("status");
        Date startDate = null;
        Date endDate = null;
        
        try {
            String dateFrom = request.getParameter("dateFrom");
            String dateTo = request.getParameter("dateTo");
            
            if (dateFrom != null && !dateFrom.isEmpty()) {
                startDate = Date.valueOf(dateFrom);
            }
            if (dateTo != null && !dateTo.isEmpty()) {
                endDate = Date.valueOf(dateTo);
            }
        } catch (IllegalArgumentException e) {
            // Handle invalid date format
        }

        MilkRequestHistoryDAO dao = new MilkRequestHistoryDAO();
        try {
            List<MilkRequest> requests = dao.getRequestsByHospital(
                hospitalId, status, startDate, endDate
            );
            
            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", 
                "attachment; filename=\"milk_requests_" + 
                new SimpleDateFormat("yyyyMMdd").format(new java.util.Date()) + ".csv\"");
            
            OutputStream out = response.getOutputStream();
            out.write("Request ID,Baby Name,Milk Type,Quantity (ml),Status,Submission Date,Urgency\n".getBytes());
            
            for (MilkRequest req : requests) {
                String line = String.format("REQ%04d,%s,%s,%d,%s,%s,%s\n",
                    req.getId(),
                    escapeCsv(req.getBabyName()),
                    escapeCsv(req.getMilkType()),
                    req.getQuantity(),
                    escapeCsv(req.getStatus()),
                    new SimpleDateFormat("yyyy-MM-dd").format(req.getRequestDate()),
                    escapeCsv(req.getUrgencyLevel()));
                out.write(line.getBytes());
            }
            out.flush();
            
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating report");
            e.printStackTrace();
        }
    }
    
    private String escapeCsv(String input) {
        if (input == null) return "";
        return input.contains(",") ? "\"" + input + "\"" : input;
    }
}