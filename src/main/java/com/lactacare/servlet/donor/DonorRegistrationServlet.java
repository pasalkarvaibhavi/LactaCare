package com.lactacare.servlet.donor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import com.lactacare.dao.UserDAO;
import com.lactacare.dao.DonorDAO;
import com.lactacare.dao.impl.UserDAOImpl;
import com.lactacare.dao.impl.DonorDAOImpl;
import com.lactacare.model.User;
import com.lactacare.model.Donor;
import com.lactacare.util.DBUtil;
import com.lactacare.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register/donor")
public class DonorRegistrationServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
    
    private UserDAO userDao = new UserDAOImpl();
    private DonorDAO donorDao = new DonorDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); 

            User user = new User();
            user.setEmail(request.getParameter("email"));
            user.setPassword(PasswordUtil.hashPassword(request.getParameter("password")));
            user.setRole("donor");
            userDao.saveUser(user);

           
            Donor donor = new Donor();
            donor.setUserId(user.getId());
            donor.setFullName(request.getParameter("fullName"));
            donor.setContact(request.getParameter("contact"));
            donor.setDob(Date.valueOf(request.getParameter("dob")));
            donor.setAddress(request.getParameter("address"));
            donor.setLactationStatus(request.getParameter("lactationStatus"));
            donorDao.saveDonor(donor);

              conn.commit();  
            
              response.sendRedirect(request.getContextPath() + "/login.jsp?success=Donor+registered+successfully");

     
        } catch (Exception e) {
            DBUtil.rollback(conn);
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("/donor_register.jsp").forward(request, response);
        } finally {
            DBUtil.close(conn);
        }
    }
}
