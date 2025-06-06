package com.lactacare.servlet;

import com.lactacare.dao.InventoryDAO;
import com.lactacare.model.InventoryRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/inventory")
public class InventoryServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<InventoryRecord> records = InventoryDAO.getInventoryRecords();
        int totalMilk = InventoryDAO.getTotalAvailableMilk();
        
        request.setAttribute("inventoryRecords", records);
        request.setAttribute("totalMilk", totalMilk);
        
        request.getRequestDispatcher("/admin_inventory.jsp").forward(request, response);
    }
}