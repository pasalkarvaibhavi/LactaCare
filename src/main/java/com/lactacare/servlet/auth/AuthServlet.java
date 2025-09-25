package com.lactacare.servlet.auth;

import com.lactacare.dao.UserDAO;
import com.lactacare.dao.DonorDAO; 
import com.lactacare.dao.impl.UserDAOImpl;
import com.lactacare.dao.impl.DonorDAOImpl;
import com.lactacare.dao.impl.HospitalDAOImpl;
import com.lactacare.model.User;
import com.lactacare.model.Donor; 
import com.lactacare.model.Hospital;
import com.lactacare.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/auth/login")
public class AuthServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDao = new UserDAOImpl();
    private DonorDAO donorDao = new DonorDAOImpl(); 
    private HospitalDAOImpl hospitalDao = new HospitalDAOImpl(); 
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            User user = userDao.findByEmail(email);
            
            if (user != null && 
                PasswordUtil.checkPassword(password, user.getPassword()) && 
                user.getRole().equalsIgnoreCase(role)) {
                
                HttpSession session = request.getSession();
                session.setAttribute("userId", user.getId());
                session.setAttribute("role", user.getRole()); 
                
                if ("donor".equalsIgnoreCase(role)) {
                    Donor donor = donorDao.getDonorByUserId(user.getId());
                    if (donor != null) {
                        session.setAttribute("donorId", donor.getId());
                    } else {
                        response.sendRedirect(request.getContextPath() + "/donor-registration.jsp");
                        return;
                    }
                }
                
                if ("hospital".equalsIgnoreCase(role)) {
                    Hospital hospital = hospitalDao.getHospitalByUserId(user.getId());
                    if (hospital != null) {
                        session.setAttribute("hospitalId", hospital.getId());
                    } else {
                        response.sendRedirect(request.getContextPath() + "/hospital-registration.jsp");
                        return;
                    }
                }
                
                switch(user.getRole().toLowerCase()) {
                    case "donor":
                        response.sendRedirect(request.getContextPath() + "/donordashboard");
                        break;
                    case "hospital":
                        response.sendRedirect(request.getContextPath() + "/dashboard");
                        break;
                    case "admin":
                        response.sendRedirect(request.getContextPath() + "/Adashboard");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/login.jsp?error=Invalid+role");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=Invalid+credentials");
            }
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage());
        }
    }
}