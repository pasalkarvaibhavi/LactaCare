<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - LactaCare</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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

        .card {
            background-color: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
            overflow: hidden;
        }

        .card-header {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid var(--border-color);
            background-color: var(--soft-gray);
        }

        .card-title {
            color: var(--primary-blue);
            font-size: 1rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card-body {
            padding: 1.25rem;
        }

        .stats-card {
            background: linear-gradient(135deg, var(--white), #f8fafc);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .stats-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 1.5rem;
            color: white;
        }

        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .stats-label {
            color: var(--text-secondary);
            font-size: 0.875rem;
            font-weight: 500;
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

        .btn-sm {
            padding: 0.375rem 0.75rem;
            font-size: 0.8125rem;
        }

        .btn-primary {
            background-color: var(--soft-pink);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: #7a0049;
            transform: translateY(-1px);
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--border-color);
            color: var(--text-primary);
        }

        .btn-outline:hover {
            background-color: var(--soft-gray);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .table th,
        .table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            font-size: 0.875rem;
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

        .badge-success {
            background-color: var(--success);
            color: white;
        }

        .badge-warning {
            background-color: var(--warning);
            color: white;
        }

        .badge-danger {
            background-color: var(--danger);
            color: white;
        }

        .badge-primary {
            background-color: var(--soft-blue);
            color: var(--primary-blue);
        }

        @media (max-width: 768px) {
            
            .main-content {
                margin-left: 0;
                max-width: 100vw;
                padding: 0.75rem;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
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
            <img
              src="src/lactacare-high-resolution-logo2.png"
              style="height: 50px"
              alt=""
            />
          </div>
        </div>
        <div class="user-section">
          <span
            class="user-name"
            style="color: #0e0c2a; font-weight: 700; font-size: 17px"
            >Hi, LactaCare Admin</span
          >
          <button
            class="btn btn-outline btn-sm ms-2"
            style="background-color: #96005d; color: aliceblue"
            onclick="logout()"
          >
            Logout
          </button>
        </div>
      </div>
    </header>

    <nav class="sidebar" id="sidebar">
        <ul class="sidebar-menu">
            <li>
    <a href="Adashboard" class="active">
        <i class="fas fa-chart-bar"></i>
        Dashboard
    </a>
  </li>
            <li>
                <a href="admin_appointments.jsp">
                    <i class="fas fa-calendar-alt"></i>
                    Appointments
                </a>
            </li>
            <li><a href="admin_request.jsp"> <i class="fas fa-hospital"></i>
					Hospital Requests
			</a></li>
            <li>
                <a href="inventory">
                    <i class="fas fa-boxes"></i>
                    Milk Inventory
                </a>
            </li>
            <li>
                <a href="#" onclick="logout()">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </li>
        </ul>
    </nav>

    <main class="main-content" id="mainContent">
        <div class="text-center mb-4">
            <h2 style="color: var(--primary-blue); font-weight: 700; margin-bottom: 0.5rem;">Admin Dashboard</h6>
            <p style="color: var(--text-secondary);">Welcome to LactaCare Management System</p>
        </div>

       
        <div class="row g-4 mb-4" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1rem;">
    <div class="stats-card">
        <div class="stats-icon" style="background-color: #3b82f6;">
            <i class="fas fa-users"></i>
        </div>
        <div class="stats-number" style="color: #3b82f6;">
            ${dashboardData.totalDonors}
        </div>
        <div class="stats-label">Total Donors</div>
    </div>

    <div class="stats-card">
        <div class="stats-icon" style="background-color: var(--success);">
            <i class="fas fa-tint"></i>
        </div>
        <div class="stats-number" style="color: var(--success);">
            <fmt:formatNumber value="${dashboardData.totalMilk}" pattern="#,##0"/>
        </div>
        <div class="stats-label">Milk in Inventory (ml)</div>
    </div>

    <div class="stats-card">
        <div class="stats-icon" style="background-color: #8b5cf6;">
            <i class="fas fa-hospital-user"></i>
        </div>
        <div class="stats-number" style="color: #8b5cf6;">
            ${dashboardData.totalHospitals}
        </div>
        <div class="stats-label">Total Hospital Partners</div>
    </div>

    <div class="stats-card">
        <div class="stats-icon" style="background-color: var(--danger);">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        <div class="stats-number" style="color: var(--danger);">
            ${dashboardData.expiredMilk}
        </div>
        <div class="stats-label">Expired Milk Units</div>
    </div>
</div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
        function logout() {
            if (confirm("Are you sure you want to logout?")) {
                showToast("Logging out...", "success");
                setTimeout(() => {
                    window.location.href = "/login.html";
                }, 1000);
            }
        }

        function showToast(message, type = "success") {
            const existingToast = document.querySelector(".toast");
            if (existingToast) {
                existingToast.remove();
            }

            const toast = document.createElement("div");
            toast.className = `toast ${type == "error" ? "error" : ""}`;
            toast.style.cssText = `
                position: fixed;
                top: 80px;
                right: 1rem;
                background-color: ${type == "error" ? "var(--danger)" : "var(--success)"};
                color: white;
                padding: 0.75rem 1rem;
                border-radius: var(--radius-md);
                box-shadow: var(--shadow-lg);
                transform: translateX(100%);
                transition: transform 0.3s ease;
                z-index: 1001;
                font-size: 0.875rem;
                font-weight: 500;
            `;
            toast.textContent = message;

            document.body.appendChild(toast);

            setTimeout(() => {
                toast.style.transform = "translateX(0)";
            }, 100);

            setTimeout(() => {
                toast.style.transform = "translateX(100%)";
                setTimeout(() => {
                    toast.remove();
                }, 300);
            }, 3000);
        }
    </script>
</body>
</html>