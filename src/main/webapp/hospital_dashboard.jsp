<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital Dashboard - LactaCare</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
:root {
	--primary-blue: #0e0c2a;
	--soft-blue: #96c8fb;
	--soft-pink: #96005d;
	--soft-gray: #f0f0f0;
	--white: #ffffff;
	--light-blue: rgba(150, 200, 251, 0.08);
	--success: #10b981;
	--warning: #f59e0b;
	--danger: #ef4444;
	--text-primary: #1f2937;
	--text-secondary: #6b7280;
	--border-color: #e5e7eb;
	--shadow-sm: 0 1px 2px 0 rgb(0 0 0/ 0.05);
	--shadow-md: 0 4px 6px -1px rgb(0 0 0/ 0.1), 0 2px 4px -2px
		rgb(0 0 0/ 0.1);
	--shadow-lg: 0 10px 15px -3px rgb(0 0 0/ 0.1), 0 4px 6px -4px
		rgb(0 0 0/ 0.1);
	--radius-sm: 0.375rem;
	--radius-md: 0.5rem;
	--radius-lg: 0.75rem;
}

.summary-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
	gap: 1rem;
	margin-bottom: 2rem;
}

.summary-card {
	background: rgb(240, 244, 255);
	padding: 1.5rem;
	border-radius: var(--radius-lg);
	text-align: center;
	box-shadow: var(--shadow-md);
}

.summary-card h3 {
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 0.5rem;
	color: var(--primary-blue);
}

.summary-card p {
	font-size: 0.875rem;
	opacity: 0.9;
	color: var(--soft-pink);
	margin: 0;
}

.btn {
	padding: 0.5rem 1rem;
	border: none;
	border-radius: var(--radius-md);
	cursor: pointer;
	font-weight: 500;
	font-size: 0.875rem;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
	transition: all 0.2s ease;
	line-height: 1.5;
}

.btn-primary {
	background-color: var(--soft-pink);
	color: var(--white);
}

.btn-primary:hover {
	background-color: #7a0049;
	transform: translateY(-1px);
}

.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 1rem;
}

.table th, .table td {
	padding: 0.75rem;
	text-align: left;
	border-bottom: 1px solid var(--border-color);
}

.table th {
	background-color: var(--soft-gray);
	font-weight: 600;
	color: var(--primary-blue);
}

.badge {
	padding: 0.25rem 0.5rem;
	border-radius: var(--radius-sm);
	font-size: 0.75rem;
	font-weight: 500;
}

.badge-pending {
	background-color: var(--warning);
	color: var(--white);
}

.badge-approved {
	background-color: var(--success);
	color: var(--white);
}

.badge-rejected {
	background-color: var(--danger);
	color: var(--white);
}

.badge-fulfilled {
	background-color: #3b82f6;
	color: white;
}

@media ( max-width : 768px) {
	.sidebar-toggle {
		display: block;
	}
	.sidebar {
		transform: translateX(-100%);
	}
	.sidebar.show {
		transform: translateX(0);
	}
	.main-content {
		margin-left: 0;
		max-width: 100vw;
		padding: 0.75rem;
	}
	.summary-cards {
		grid-template-columns: repeat(2, 1fr);
	}
	.table-responsive {
		overflow-x: auto;
	}
}

@media ( max-width : 480px) {
	.summary-cards {
		grid-template-columns: 1fr;
	}
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
						style="height: 50px" alt="LactaCare" />
				</div>
			</div>
			<div class="user-section">
				<span class="user-name"
					style="color: #0e0c2a; font-weight: 700; font-size: 17px">Hi,${sessionScope.name}</span>
				<button class="btn btn-outline btn-sm ms-2"
					style="background-color: #96005d; color: aliceblue"
					onclick="logout()">Logout</button>
			</div>
		</div>
	</header>

	<nav class="sidebar" id="sidebar">
		<ul class="sidebar-menu">
			<li><a href="${pageContext.request.contextPath}/dashboard"
				class="active"> <i class="fas fa-chart-bar"></i> Dashboard
			</a></li>
			<li><a href="hospital-profile"> <i class="fas fa-hospital"></i>
					Hospital Profile
			</a></li>
			<li><a href="requestmilk.jsp"> <i class="fas fa-plus-circle"></i>
					Request Milk
			</a></li>
			<li><a href="request_history.jsp"> <i class="fas fa-history"></i>
					Request History
			</a></li>
			<li><a href="#" onclick="logout()"> <i
					class="fas fa-sign-out-alt"></i> Logout
			</a></li>
		</ul>
	</nav>

	<main class="main-content" id="mainContent">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title" style="color: #96005d;">
					<i class="fas fa-chart-bar"></i> Hospital Dashboard
				</h2>
			</div>
			<div class="card-body">
				<div class="summary-cards">
					<div class="summary-card">
						<h3>${totalRequests}</h3>
						<p>Total Requests</p>
					</div>
					<div class="summary-card">
						<h3>${pendingRequests}</h3>
						<p>Pending Requests</p>
					</div>
					<div class="summary-card">
						<h3>${approvedRequests}</h3>
						<p>Approved Requests</p>
					</div>
					<div class="summary-card">
						<h3>${rejectedRequests}</h3>
						<p>Rejected Requests</p>
					</div>
				</div>

				<div class="d-flex justify-content-between align-items-center mb-3">
					<h6>Recent Requests</h6>
					<a href="requestmilk.jsp" class="btn btn-primary"> <i
						class="fas fa-plus"></i> Request Milk
					</a>
				</div>

				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>Request ID</th>
								<th>Baby Name</th>
								<th>Type</th>
								<th>Quantity</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody id="recentRequestsTable">
							<c:choose>
								<c:when test="${not empty recentRequests}">
									<c:forEach items="${recentRequests}" var="request">
										<tr>
											<td>REQ-${request.id}</td>
											<td>${request.babyName}</td>
											<td>${request.milkType}</td>
											<td>${request.quantity}ml</td>
											<td><c:choose>
													<c:when test="${request.status == 'Pending'}">
														<span class="badge badge-pending">Pending</span>
													</c:when>
													<c:when test="${request.status == 'Approved'}">
														<span class="badge badge-approved">Approved</span>
													</c:when>
													<c:when test="${request.status == 'Rejected'}">
														<span class="badge badge-rejected">Rejected</span>
													</c:when>
													<c:when test="${request.status == 'Fulfilled'}">
														<span class="badge badge-fulfilled">Fulfilled</span>
													</c:when>
													<c:otherwise>
														<span class="badge">${request.status}</span>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center">No recent requests
											found</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>
	<script>
    
      
        function logout() {
            if (confirm("Are you sure you want to logout?")) {
                alert("Logging out...");
                setTimeout(() => {
                    window.location.href = "index.jsp";
                }, 1000);
            }
        }
    </script>
</body>
</html>