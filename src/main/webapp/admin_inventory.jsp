<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Milk Inventory - LactaCare Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Styles remain unchanged from your original file */
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

        .inventory-summary {
            background:  var(--primary-blue);
            color: var(--white);
            padding: 2rem;
            border-radius: var(--radius-lg);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .inventory-total {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .inventory-label {
            font-size: 1.125rem;
            opacity: 0.9;
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
            font-size: 0.95rem;
        }

        .table th {
            background-color: var(--soft-gray);
            font-weight: 600;
            color: var(--primary-blue);
            cursor: pointer;
            user-select: none;
        }

        .table th:hover {
            background-color: #e0e0e0;
        }

        .table th.sortable::after {
            content: ' ↕';
            opacity: 0.5;
        }

        .table th.sort-asc::after {
            content: ' ↑';
            opacity: 1;
        }

        .table th.sort-desc::after {
            content: ' ↓';
            opacity: 1;
        }

        .status-fresh {
            color: var(--success);
            font-weight: 600;
        }

        .status-expired {
            color: var(--danger);
            font-weight: 600;
        }

        .record-icon {
            font-size: 1rem;
            margin-right: 0.5rem;
        }

        .record-added {
            color: var(--success);
        }

        .record-delivered {
            color: var(--danger);
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        @media (max-width: 768px) {
            
            .controls {
                flex-direction: column;
                align-items: stretch;
            }

            .inventory-total {
                font-size: 2rem;
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
                <a href="Adashboard">
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
            <li>
                <a href="admin_request.jsp">
                    <i class="fas fa-hospital"></i>
                    Hospital Requests
                </a>
            </li>
            <li>
                <a href="inventory" class="active">
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
            <h1 style="color: var(--primary-blue); font-weight: 700; font-size:1.5rem; margin-bottom: 0.5rem;">Track and Manage Milk Inventory</h1>
        </div>

        <div class="inventory-summary">
            <div class="inventory-total" id="totalInventory">
                <fmt:formatNumber value="${totalMilk}" pattern="#,##0"/>
            </div>
            <div class="inventory-label">Total Milk Available (ml)</div>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="controls">
                    <div>
                        <h5 style="color: rgb(1, 93, 1) ;"><i class="fas fa-list"></i> Milk Records</h5>
                    </div>
                    <div>
                        <button class="btn btn-primary" onclick="downloadReport()">
                            <i class="fas fa-download"></i>
                            Download Report
                        </button>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" id="inventoryTable">
                        <thead>
                            <tr>
                                <th class="sortable" onclick="sortTable(0)">User Name</th>
                                <th class="sortable" onclick="sortTable(1)">Date</th>
                                <th class="sortable" onclick="sortTable(2)">Milk Amount (ml)</th>
                                <th class="sortable" onclick="sortTable(3)">Status</th>
                                <th>Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="record" items="${inventoryRecords}">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${record.recordType == 'Donation'}">
                                                <i class="fas fa-plus record-icon record-added"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-minus record-icon record-delivered"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        ${record.userName}
                                    </td>
                                    <td><fmt:formatDate value="${record.date}" pattern="yyyy-MM-dd"/></td>
                                    <td>${record.amountMl}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${record.status == 'Fresh'}">
                                                <span class="status-fresh">${record.status}</span>
                                            </c:when>
                                            <c:when test="${record.status == 'Expired'}">
                                                <span class="status-expired">${record.status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-fresh">${record.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${record.recordType}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

<script src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function logout() {
            if (confirm("Are you sure you want to logout?")) {
                showToast("Logging out...", "success");
                setTimeout(() => {
                    window.location.href = "index.jsp";
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

        let sortDirection = {};

        function sortTable(columnIndex) {
            const table = document.getElementById("inventoryTable");
            const tbody = table.getElementsByTagName("tbody")[0];
            const rows = Array.from(tbody.getElementsByTagName("tr"));
            const headers = table.getElementsByTagName("th");
            
            for (let header of headers) {
                header.classList.remove('sort-asc', 'sort-desc');
            }
            
            const currentDirection = sortDirection[columnIndex] || 'asc';
            const newDirection = currentDirection == 'asc' ? 'desc' : 'asc';
            sortDirection[columnIndex] = newDirection;
            
            headers[columnIndex].classList.add(newDirection == 'asc' ? 'sort-asc' : 'sort-desc');
            
            rows.sort((a, b) => {
                let aValue = a.cells[columnIndex].textContent.trim();
                let bValue = b.cells[columnIndex].textContent.trim();
                
                if (columnIndex == 1) { 
                    aValue = new Date(aValue);
                    bValue = new Date(bValue);
                } else if (columnIndex == 2) { 
                    aValue = parseInt(aValue);
                    bValue = parseInt(bValue);
                }
                
                if (aValue < bValue) {
                    return newDirection == 'asc' ? -1 : 1;
                } else if (aValue > bValue) {
                    return newDirection == 'asc' ? 1 : -1;
                } else {
                    return 0;
                }
            });
            
            rows.forEach(row => tbody.appendChild(row));
            
            showToast(`Table sorted by ${headers[columnIndex].textContent} (${newDirection}ending)`);
        }

        function downloadReport() {
            const table = document.getElementById("inventoryTable");
            const rows = table.getElementsByTagName("tr");
            let csvContent = "data:text/csv;charset=utf-8,";
            
            const headers = [];
            for (let cell of rows[0].cells) {
                headers.push(cell.textContent.trim());
            }
            csvContent += headers.join(",") + "\n";
            
            for (let i = 1; i < rows.length; i++) {
                const row = [];
                for (let cell of rows[i].cells) {
                    let cellText = cell.textContent.trim();
                    cellText = cellText.replace(/[+−]/g, '').trim(); 
                    row.push('"' + cellText + '"');
                }
                csvContent += row.join(",") + "\n";
            }
            
            const encodedUri = encodeURI(csvContent);
            const link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "lactacare_inventory_" + new Date().toISOString().split('T')[0] + ".csv");
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            
            showToast("Inventory report downloaded successfully");
        }

        document.addEventListener("DOMContentLoaded", () => {
            
        });
    </script>
</body>
</html>