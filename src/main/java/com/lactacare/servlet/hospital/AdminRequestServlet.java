package com.lactacare.servlet.hospital;

import com.lactacare.dao.InventoryTransactionDAO;
import com.lactacare.dao.MilkRequestDAO;
import com.lactacare.dao.adminMilkRequestDAO;
import com.lactacare.model.MilkRequest;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/request")
public class AdminRequestServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        int requestId = Integer.parseInt(request.getParameter("id"));

        switch (action) {
            case "approve":
                adminMilkRequestDAO.updateRequestStatus(requestId, "Approved");
                break;
                
            case "reject":
                adminMilkRequestDAO.updateRequestStatus(requestId, "Rejected");
                break;
                
            case "fulfill":
                MilkRequest req = adminMilkRequestDAO.getMilkRequestById(requestId);
                if (req != null && "Approved".equals(req.getStatus())) {
                    InventoryTransactionDAO.recordDelivery(
                        req.getHospitalId(), 
                        requestId, 
                        req.getQuantity()
                    );
                    adminMilkRequestDAO.updateRequestStatus(requestId, "Fulfilled");
                }
                break;
        }

        response.sendRedirect(request.getContextPath() + "/admin_request.jsp");
    }
}