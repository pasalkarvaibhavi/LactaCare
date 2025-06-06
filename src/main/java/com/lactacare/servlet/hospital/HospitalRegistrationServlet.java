package com.lactacare.servlet.hospital;

import com.lactacare.dao.HospitalDAO;
import com.lactacare.dao.UserDAO;
import com.lactacare.dao.impl.HospitalDAOImpl;
import com.lactacare.dao.impl.UserDAOImpl;
import com.lactacare.model.User;
import com.lactacare.model.Hospital;
import com.lactacare.util.DBUtil;
import com.lactacare.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/register/hospital")
public class HospitalRegistrationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDao = new UserDAOImpl();
    private HospitalDAO hospitalDao = new HospitalDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false);

         
            User user = new User();
            user.setEmail(request.getParameter("email"));
            user.setPassword(PasswordUtil.hashPassword(request.getParameter("password")));
            user.setRole("hospital");
            userDao.saveUser(user);

           
            Hospital hospital = new Hospital();
            hospital.setUserId(user.getId());
            hospital.setName(request.getParameter("name"));
            hospital.setLicenseId(request.getParameter("licenseId"));
            hospital.setContactPerson(request.getParameter("contactPerson"));
            hospital.setContactNumber(request.getParameter("contactNumber"));
            hospital.setAddress(request.getParameter("address"));
            hospital.setHasMilkbank(Boolean.parseBoolean(
                request.getParameter("hasMilkbank")));
            hospitalDao.saveHospital(hospital);

            conn.commit();
            response.sendRedirect(request.getContextPath() + "/login.jsp?success=Hospital+registered+successfully");


        } catch (Exception e) {
            DBUtil.rollback(conn);
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("/hospital_register.jsp").forward(request, response);
            
        } finally {
            DBUtil.close(conn);
        }
    }
}