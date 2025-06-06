
package com.lactacare.servlet.donor;

import com.lactacare.dao.AppointmentDAO;
import com.lactacare.model.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/appointment")
public class GetAppointment extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (donorId == null || userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Appointment latestAppointment = AppointmentDAO.getLatestAppointment(donorId);
        if (latestAppointment != null) {
            session.setAttribute("latestAppointment", latestAppointment);
        }

        boolean hasPending = AppointmentDAO.hasPendingAppointment(donorId);
        request.setAttribute("hasPendingAppointment", hasPending);
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
            session.setAttribute("successMessage", successMessage);
           
        }

        request.getRequestDispatcher("appointment.jsp").forward(request, response);
    }
}