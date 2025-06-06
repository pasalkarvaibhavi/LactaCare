
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
import java.time.LocalDate;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    
        response.sendRedirect("appointment");
    }
	protected void doPost (HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");
        Integer userId = (Integer) session.getAttribute("userId");
        
        session.removeAttribute("screening");
        session.removeAttribute("nextDueDate");
        
        if (donorId == null || userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String type = request.getParameter("appointmentType");
        String dateStr = request.getParameter("appointmentDate");
        String timeSlot = request.getParameter("timeSlot");
        String notes = request.getParameter("notes");
        String status = request.getParameter("status");
        
        boolean hasErrors = false;
        LocalDate appointmentDate = null;
        
        // Validate appointment type
        if (type == null || (!type.equals("home") && !type.equals("center"))) {
            request.setAttribute("typeError", "Please select a valid appointment type");
            hasErrors = true;
        }
        
        // Validate date
        if (dateStr == null || dateStr.isEmpty()) {
            request.setAttribute("dateError", "Appointment date is required");
            hasErrors = true;
        } else {
            try {
                appointmentDate = LocalDate.parse(dateStr);
                if (appointmentDate.isBefore(LocalDate.now())) {
                    request.setAttribute("dateError", "Cannot book appointments in the past");
                    hasErrors = true;
                }
            } catch (Exception e) {
                request.setAttribute("dateError", "Invalid date format");
                hasErrors = true;
            }
        }
        
        // Validate time slot
        if (timeSlot == null || timeSlot.isEmpty() || !isValidTimeSlot(timeSlot)) {
            request.setAttribute("timeError", "Please select a valid time slot");
            hasErrors = true;
        }
        
       
        boolean hasPending = AppointmentDAO.hasPendingAppointment(donorId);
        if (hasPending) {
            request.setAttribute("hasPendingAppointment", true);
        }
        
     
        if (!hasErrors && !hasPending) {
            if (AppointmentDAO.isSlotBooked(donorId, appointmentDate, timeSlot)) {
                request.setAttribute("timeError", "This time slot is already booked");
                hasErrors = true;
            }
        }
        
        if (hasErrors || hasPending) {
            request.setAttribute("appointmentType", type);
            request.setAttribute("appointmentDate", dateStr);
            request.setAttribute("timeSlot", timeSlot);
            request.setAttribute("notes", notes);
            request.setAttribute("status", status);
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
            return;
        }
        
        
        Appointment appointment = new Appointment(
            userId, 
            donorId, 
            type, 
            appointmentDate, 
            timeSlot, 
            notes, 
            status
           
        );
        
       
        int appointmentId = AppointmentDAO.createAppointment(appointment);
        
        if (appointmentId != -1) {
           
            session.setAttribute("successMessage", "Appointment booked successfully!");
            response.sendRedirect("appointment");
        } else {
            request.setAttribute("errorMessage", "Failed to book appointment. Please try again.");
            request.setAttribute("appointmentType", type);
            request.setAttribute("appointmentDate", dateStr);
            request.setAttribute("timeSlot", timeSlot);
            request.setAttribute("notes", notes);
            request.getRequestDispatcher("appointment.jsp").forward(request, response);
        }
    }
    
    private boolean isValidTimeSlot(String timeSlot) {
        String[] validSlots = {
            "09:00-10:00", "10:00-11:00", "11:00-12:00",
            "14:00-15:00", "15:00-16:00", "16:00-17:00"
        };
        for (String slot : validSlots) {
            if (slot.equals(timeSlot)) {
                return true;
            }
        }
        return false;
    }
}