<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Donation History - Milk Bank</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
.status-eligible {
	background-color: #e6f4ea;
	color: #137333;
	padding: 3px 8px;
	border-radius: 12px;
	font-size: 0.85rem;
}

.status-pending {
	background-color: #fef7e0;
	color: #f9ab00;
	padding: 3px 8px;
	border-radius: 12px;
	font-size: 0.85rem;
}

.status-rejected {
	background-color: #fce8e6;
	color: #d93025;
	padding: 3px 8px;
	border-radius: 12px;
	font-size: 0.85rem;
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
					style="color: #0e0c2a; font-weight: 700; font-size: 17px">Hi,${sessionScope.fullName}
				</span>
				<button class="btn btn-outline btn-sm ms-2"
					style="background-color: #96005d; color: aliceblue"
					onclick="logout()">Logout</button>
			</div>
		</div>
	</header>

	<nav class="sidebar" id="sidebar">
		<ul class="sidebar-menu">
			<li><a href="donordashboard"> <i
					class="fas fa-chart-bar"></i> Dashboard
			</a></li>
			<li><a href="profile"> <i class="fas fa-user-circle"></i>
					Profile
			</a></li>
			<li><a href="screening"> <i class="fas fa-heartbeat"></i>
					Screening
			</a></li>
			<li><a href="appointment"> <i class="fas fa-calendar-check"></i>
					Book Appointment
			</a></li>
			<li><a href="donation-history" class="active"> <i
					class="fas fa-history"></i> History
			</a></li>
			<li><a href="#" onclick="logout()"> <i
					class="fas fa-sign-out-alt"></i> Logout
			</a></li>
		</ul>
	</nav>

	<main class="main-content" id="mainContent">
		<div class="card">
			<div
				class="card-header d-flex justify-content-between align-items-center">
				<h2 class="card-title" style="color: green;"><i class="fas fa-history"></i>
				Donation History</h2>
				<div>
					<select class="form-control d-inline-block w-auto"
						id="statusFilter">
						<option value="">All Status</option>
						<option value="accepted">Accepted</option>
						<option value="pending">Pending</option>
						<option value="rejected">Rejected</option>
					</select>
				</div>
			</div>
			<div class="card-body">
				<div class="row mb-4">
					<div class="col-md-3 text-center">
						<h4 class="text-primary">${total}</h4>
						<p class="text-muted">Total Donations</p>
					</div>
					<div class="col-md-3 text-center">
						<h4 class="text-success">${accepted}</h4>
						<p class="text-muted">Accepted</p>
					</div>
					<div class="col-md-3 text-center">
						<h4 class="text-warning">${pending}</h4>
						<p class="text-muted">Pending</p>
					</div>
					<div class="col-md-3 text-center">
						<h4 class="text-danger">${rejected}</h4>
						<p class="text-muted">Rejected</p>
					</div>
				</div>

				<div class="table-responsive">
					<table class="table" id="donationsTable">
						<thead>
							<tr>
								<th>Date</th>
								<th>Volume (ml)</th>
								<th>Type</th>
								<th>Test Result</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${donations}" var="donation">
								<tr>
									<td><fmt:formatDate value="${donation.date}"
											pattern="MMMM d, yyyy" /></td>
									<td>${donation.volume}</td>
									<td><c:choose>
											<c:when test="${donation.type == 'home'}">Home Collection</c:when>
											<c:otherwise>At Center</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${donation.test_result == 'accepted'}">
												<span class="status-badge status-eligible">Accepted</span>
											</c:when>
											<c:when test="${donation.test_result == 'rejected'}">
												<span class="status-badge status-rejected">Rejected</span>
											</c:when>
											<c:otherwise>
												<span class="status-badge status-pending">Pending</span>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="empty-state d-none" id="emptyState">
					<div style="font-size: 4rem; margin-bottom: 1rem;">📋</div>
					<h4>No donations found</h4>
					<p>
						You haven't made any donations yet. <a href="book.html">Book
							your first appointment</a> to get started!
					</p>
				</div>
			</div>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>
	<script>
	<script>
	document.getElementById('statusFilter').addEventListener('change', function() {
	    const status = this.value.toLowerCase();
	    const rows = document.querySelectorAll('#donationsTable tbody tr');
	    
	    rows.forEach(row => {
	        const rowStatus = row.querySelector('.status-badge').textContent.toLowerCase();
	        if (!status || rowStatus === status) {
	            row.style.display = '';
	        } else {
	            row.style.display = 'none';
	        }
	    });
	});
	</script>
	</script>
</body>
</html>
