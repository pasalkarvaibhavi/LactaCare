<%@ page
	import="com.lactacare.dao.adminAppointmentDAO, com.lactacare.model.Appointment, java.util.List"%>
<%

HttpSession session1 = request.getSession();
Integer userId = (Integer) session1.getAttribute("userId");

if (userId == null) {
	response.sendRedirect("login.jsp"); 
	return;
}
System.out.print("User ID" + userId);

if ("POST".equals(request.getMethod())) {
	String action = request.getParameter("action");
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.print("ID" + id);

	if ("complete".equals(action)) {
		adminAppointmentDAO.updateAppointmentStatus(id);
	} else if ("test".equals(action)) {
		String testResult = request.getParameter("testResult");
		int milkAmount = "accepted".equals(testResult) ? Integer.parseInt(request.getParameter("milkAmount")) : 0;
		adminAppointmentDAO.recordMilkTest(id, testResult, milkAmount);
	}

	response.sendRedirect("admin_appointments.jsp");
	return;
}

List<Appointment> appointments = adminAppointmentDAO.getAllAppointments();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Donor Appointments - LactaCare Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<style>
:root {
	--primary-blue: #0e0c2a;
	--soft-blue: #96c8fb;
	--soft-pink: #96005d;
	--soft-gray: #f0f0f0;
	--white: #ffffff;
	--success: #10b981;
	--warning: #f59e0b;
	--danger: #ef4444;
}

body {
	font-family: 'Inter', sans-serif;
	background-color: var(--soft-gray);
}

.badge {
	padding: 0.25rem 0.5rem;
	border-radius: 0.25rem;
	font-size: 0.75rem;
}

.badge-warning {
	background-color: var(--warning);
}

.badge-success {
	background-color: var(--success);
}

.btn-sm {
	padding: 0.25rem 0.5rem;
	font-size: 0.8rem;
}

.btn-success {
	background-color: var(--success);
}

.btn-danger {
	background-color: var(--danger);
}

.btn-primary {
	background-color: var(--soft-pink);
}

.table th {
	background-color: var(--soft-gray);
}
</style>
</head>
<body>
	
	<header class="header">
		<div class="header-content">
			<div class="d-flex align-items-center">
				<button class="sidebar-toggle me-3" id="sidebarToggle">☰</button>
				<div class="logo">
					<img src="src/lactacare-high-resolution-logo2.png"
						style="height: 50px" alt="" />
				</div>
			</div>
			<div class="user-section">
				<span class="user-name"
					style="color: #0e0c2a; font-weight: 700; font-size: 17px">Hi,
					LactaCare Admin</span>
				<button class="btn btn-outline btn-sm ms-2"
					style="background-color: #96005d; color: aliceblue"
					onclick="logout()">Logout</button>
			</div>
		</div>
	</header>

	<nav class="sidebar" id="sidebar">
		<ul class="sidebar-menu">
			<li><a href="Adashboard"> <i
					class="fas fa-chart-bar"></i> Dashboard
			</a></li>
			<li><a href="admin_appointments.jsp" class="active"> <i
					class="fas fa-calendar-alt"></i> Appointments
			</a></li>
			<li><a href="admin_request.jsp"> <i class="fas fa-hospital"></i>
					Hospital Requests
			</a></li>
			<li><a href="inventory"> <i class="fas fa-boxes"></i>
					Milk Inventory
			</a></li>
			<li><a href="#" onclick="logout()"> <i
					class="fas fa-sign-out-alt"></i> Logout
			</a></li>
		</ul>
	</nav>

	<main class="main-content" id="mainContent">
		<div class="text-center mb-4">
			<h1
				style="color:#0e0c2a; font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Manage
				and Track Donor Appointments</h1>
		</div>

		<div class="card">
			<div class="card-header bg-white">
				<h5 class="card-title mb-0" style="color:green">
					<i class="fas fa-calendar-check me-2"></i> Donor Appointments
				</h5>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>Donor</th>
								<th>Date</th>
								<th>Type</th>
								<th>Time</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Appointment appt : appointments) {
							%>
							<tr>
								<td>APT<%=String.format("%03d", appt.getId())%></td>
								<td><%=appt.getDonorName()%></td>
								<td><%=appt.getDate()%></td>
								<td><%=appt.getType()%></td>
								<td><%=appt.getTimeSlot()%></td>
								<td>
									<%
									if ("scheduled".equals(appt.getStatus())) {
									%> <span
									class="badge badge-warning">Pending</span>
									<button class="btn btn-success btn-sm ms-2"
										onclick="completeAppointment(<%=appt.getId()%>)">
										Complete</button> <%
 } else {
 %> <span class="badge badge-success">Completed</span>
									<%
									}
									%>
								</td>
								<td>
									<%
									if ("completed".equals(appt.getStatus())) {
										if (appt.getTestResult() == null) {
									%>
									<button class="btn btn-primary btn-sm"
										onclick="openTestModal(<%=appt.getId()%>)">Test
										Milk</button> <%
 } else if ("accepted".equals(appt.getTestResult())) {
 %>
									<span class="text-success">Accepted (<%=appt.getMilkAmount()%>
										ml)
								</span> <%
 } else {
 %> <span class="text-danger">Rejected</span> <%
 }
 } else {
 %>
									<button class="btn btn-primary btn-sm" disabled>Test
										Milk</button> <%
 }
 %>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<div class="modal fade" id="milkTestModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Milk Quality Test</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="testAppointmentId" value="">
					<div class="mb-3">
						<label class="form-label">Test Result</label> <select
							class="form-select" id="testResult">
							<option value="accepted">Accept Milk</option>
							<option value="rejected">Reject Milk</option>
						</select>
					</div>
					<div class="mb-3" id="amountField">
						<label class="form-label">Milk Amount (ml)</label> <input
							type="number" class="form-control" id="milkAmount" value="150">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary"
						onclick="saveTestResult()">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<script src="js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	    
	    
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	    <script>
	        const milkTestModal = new bootstrap.Modal('#milkTestModal');
	        
	        function submitForm(action, id, testResult = null, milkAmount = null) {
	            const form = document.createElement('form');
	            form.method = 'POST';
	            form.action = 'admin_appointments.jsp';
	            
	            const actionInput = document.createElement('input');
	            actionInput.type = 'hidden';
	            actionInput.name = 'action';
	            actionInput.value = action;
	            form.appendChild(actionInput);
	            
	            const idInput = document.createElement('input');
	            idInput.type = 'hidden';
	            idInput.name = 'id';
	            idInput.value = id;
	            form.appendChild(idInput);
	            
	            if (testResult) {
	                const resultInput = document.createElement('input');
	                resultInput.type = 'hidden';
	                resultInput.name = 'testResult';
	                resultInput.value = testResult;
	                form.appendChild(resultInput);
	            }
	            
	            if (milkAmount !== null) {
	                const amountInput = document.createElement('input');
	                amountInput.type = 'hidden';
	                amountInput.name = 'milkAmount';
	                amountInput.value = milkAmount;
	                form.appendChild(amountInput);
	            }
	            
	            document.body.appendChild(form);
	            form.submit();
	        }

	        function completeAppointment(appointmentId) {
	            submitForm('complete', appointmentId);
	        }

	        function saveTestResult() {
	            const appointmentId = document.getElementById('testAppointmentId').value;
	            const testResult = document.getElementById('testResult').value;
	            const milkAmount = testResult === 'accepted' ? 
	                document.getElementById('milkAmount').value : 0;
	            
	            submitForm('test', appointmentId, testResult, milkAmount);
	        }

	        function openTestModal(appointmentId) {
	            document.getElementById('testAppointmentId').value = appointmentId;
	            milkTestModal.show();
	        }

	        document.getElementById('testResult').addEventListener('change', function() {
	            const amountField = document.getElementById('amountField');
	            amountField.style.display = this.value === 'accepted' ? 'block' : 'none';
	        });
	       
	        
	        function logout() {
	            window.location.href = 'index.jsp';
	        }
    </script>
</body>
</html>