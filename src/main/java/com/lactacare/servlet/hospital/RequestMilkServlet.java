package com.lactacare.servlet.hospital;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.UUID;

import com.lactacare.dao.MilkRequestDAO;
import com.lactacare.model.MilkRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/request-milk")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, 
    maxFileSize = 1024 * 1024 * 5,   
    maxRequestSize = 1024 * 1024 * 10 
)
public class RequestMilkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String UPLOAD_BASE_DIR = "D:\\GITHUB REPOSITORY\\LactaCare\\src\\main\\webapp\\prescriptions";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        Integer hospitalId = (Integer) session.getAttribute("hospitalId");

        if (userId == null || hospitalId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String babyName = request.getParameter("babyName");
        String gender = request.getParameter("gender");
        Date babyDob = Date.valueOf(request.getParameter("dateOfBirth"));
        double weight = Double.parseDouble(request.getParameter("weight"));
        String birthCondition = request.getParameter("birthCondition");
        String healthNotes = request.getParameter("healthNotes");
        String doctorName = request.getParameter("doctorName");
        String milkType = request.getParameter("milkType");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String urgency = request.getParameter("urgencyLevel");
        String reason = request.getParameter("requestReason");
        
        Part filePart = request.getPart("prescription");
        String fileName = UUID.randomUUID().toString() + "_" + getFileName(filePart);
        
        File uploadDir = new File(UPLOAD_BASE_DIR);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String filePath = UPLOAD_BASE_DIR + File.separator + fileName;
        filePart.write(filePath);
        
        System.out.println("[LactaCare] File stored at: " + filePath);
        
        String prescriptionPath = "prescriptions/" + fileName;

        MilkRequest milkRequest = new MilkRequest();
        milkRequest.setHospitalId(hospitalId);
        milkRequest.setUserId(userId);
        milkRequest.setBabyName(babyName);
        milkRequest.setBabyGender(gender);
        milkRequest.setBabyDob(babyDob);
        milkRequest.setBabyWeight(weight);
        milkRequest.setBirthCondition(birthCondition);
        milkRequest.setHealthNotes(healthNotes);
        milkRequest.setDoctorName(doctorName);
        milkRequest.setMilkType(milkType);
        milkRequest.setQuantity(quantity);
        milkRequest.setUrgencyLevel(urgency);
        milkRequest.setRequestReason(reason);
        milkRequest.setPrescriptionPath(prescriptionPath);

        try {
            MilkRequestDAO dao = new MilkRequestDAO();
            boolean success = dao.addMilkRequest(milkRequest);

            if (success) {
                session.setAttribute("successMessage", "Milk request submitted successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to submit milk request. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Database error: " + e.getMessage());
        } 
        
        request.getRequestDispatcher("requestmilk.jsp").forward(request, response);
    }
    
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
