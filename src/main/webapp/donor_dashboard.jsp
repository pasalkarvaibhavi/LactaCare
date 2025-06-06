<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lactacare.model.DonorStats" %>
<%@ page import="com.lactacare.model.Screening" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ page import="com.lactacare.model.Screening"%>
<%
DonorStats stats = (DonorStats) request.getAttribute("stats");
Screening screening = (Screening) request.getAttribute("screening");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Donor Dashboard - Milk Bank</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
  --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
  --radius-sm: 0.375rem;
  --radius-md: 0.5rem;
  --radius-lg: 0.75rem;
}

.impact-stats {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
	gap: 1rem;
	height:60%;
}

.impact-stat {
	text-align: center;
	box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
	padding: 1rem !important;
	background-color: var(--white);
	border-radius: var(--radius-md);
	border: 1px solid rgba(150, 200, 251, 0.2);
	margin-bottom: 60px;
	height:90%;
}

.impact-stat-label
{
	color:var(--soft-pink);
	font-size:1.1rem !important;
}
.impact-stat-value
{
  margin-bottom:60px;
}
 .badge-fulfilled {
    background-color: #3b82f6;
    color: white;
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
					${sessionScope.fullName}</span>
				<button class="btn btn-outline btn-sm ms-2"
					style="background-color: #96005d; color: aliceblue"
					onclick="logout()">Logout</button>
			</div>
		</div>
	</header>

	<nav class="sidebar" id="sidebar">
		<ul class="sidebar-menu">
			<li><a href="donordashboard" class="active"> <i
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
			<li><a href="donation-history"> <i class="fas fa-history"></i>
					History
			</a></li>
			<li><a href="#" onclick="logout()"> <i
					class="fas fa-sign-out-alt"></i> Logout
			</a></li>
		</ul>
	</nav>

	<main class="main-content" id="mainContent">
		<div class="impact-section">
			<div class="impact-stats">
				<div class="impact-stat">
					<div class="impact-stat-value">${stats.totalDonations}</div>
					<div class="impact-stat-label">Total Donations</div>
				</div>
				<div class="impact-stat">
					<div class="impact-stat-value">${stats.totalVolume}ml</div>
					<div class="impact-stat-label">Total Volume</div>
				</div>
				<div class="impact-stat">
					<div class="impact-stat-value">${stats.donorDuration}</div>
					<div class="impact-stat-label">Donor Since</div>
				</div>
			</div>
			
				
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
    function logout() {
    	  if (confirm("Are you sure you want to logout?")) {
    	    showToast("Logging out...", "success")
    	    setTimeout(() => {
    	      window.location.href = "index.jsp"
    	    }, 1000)
    	  }
    	}
    </script>
	<script src="js/main.js"></script>

</body>
</html>
