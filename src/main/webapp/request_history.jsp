<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page import="java.util.List" %>
<%@ page import="com.lactacare.model.MilkRequest" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request History - LactaCare</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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

        .card-title {
            color: green;
            font-size: 1.2rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card-body {
            padding: 1.25rem;
        }

        .filters-section {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            align-items: center;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .filter-label {
            font-size: 0.75rem;
            font-weight: 500;
            color: var(--primary-blue);
        }

        .form-control, .form-select {
            padding: 0.5rem 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            transition: border-color 0.2s ease;
        }

        .form-control:focus, .form-select:focus {
            outline: none;
            border-color: var(--soft-blue);
            box-shadow: 0 0 0 3px rgba(150, 200, 251, 0.1);
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

        .btn-secondary {
            background-color: var(--soft-gray);
            color: var(--text-primary);
            border: 1px solid var(--border-color);
        }

        .btn-secondary:hover {
            background-color: var(--border-color);
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
        }

        .table th {
            background-color: var(--soft-gray);
            font-weight: 600;
            color: var(--primary-blue);
            position: sticky;
            top: 0;
        }

        .table tbody tr:hover {
            background-color: var(--light-blue);
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

        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
            color: var(--text-secondary);
        }

        .empty-state-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
        }

        .pagination button {
            padding: 0.5rem 0.75rem;
            border: 1px solid var(--border-color);
            background-color: var(--white);
            color: var(--text-primary);
            border-radius: var(--radius-md);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .pagination button:hover:not(:disabled) {
            background-color: var(--soft-blue);
            color: var(--primary-blue);
        }

        .pagination button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .pagination .active {
            background-color: var(--soft-pink);
            color: var(--white);
            border-color: var(--soft-pink);
        }

        @media (max-width: 768px) {
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

            .filters-section {
                flex-direction: column;
                align-items: stretch;
            }

            .table-responsive {
                overflow-x: auto;
            }

            .table th,
            .table td {
                padding: 0.5rem;
                font-size: 0.8125rem;
            }
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
                    <img src="${pageContext.request.contextPath}/src/lactacare-high-resolution-logo2.png" style="height: 50px" alt="LactaCare" />
                </div>
            </div>
            <div class="user-section">
                <span class="user-name" style="color: #0e0c2a; font-weight: 700; font-size: 17px">Hi, ${sessionScope.fullName}</span>
                <button class="btn btn-outline btn-sm ms-2" style="background-color: #96005d; color: aliceblue" onclick="logout()">
                    Logout
                </button>
            </div>
        </div>
    </header>

    <nav class="sidebar" id="sidebar">
        <ul class="sidebar-menu">
            <li>
                <a href="dashboard">
                    <i class="fas fa-chart-bar"></i>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="hospital-profile">
                    <i class="fas fa-hospital"></i>
                    Hospital Profile
                </a>
            </li>
            <li>
                <a href="requestmilk.jsp">
                    <i class="fas fa-plus-circle"></i>
                    Request Milk
                </a>
            </li>
            <li>
                <a href="request_history.jsp" class="active">
                    <i class="fas fa-history"></i>
                    Request History
                </a>
            </li>
            <li>
                <a href="logout" onclick="logout()">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </li>
        </ul>
    </nav>

   <main class="main-content" id="mainContent">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">
                    <i class="fas fa-history"></i>
                    Request History
                </h2>
            </div>
            <div class="card-body">
               <form id="filterForm" action="${pageContext.request.contextPath}/request-history" method="GET">
                    <div class="container mt-4">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-3">
                                <label for="statusFilter" class="form-label">Status Filter</label>
                                <select class="form-select" id="statusFilter" name="status">
                                    <option value="">All Statuses</option>
                                    <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                    <option value="Approved" ${param.status == 'Approved' ? 'selected' : ''}>Approved</option>
                                    <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                                    <option value="Fulfilled" ${param.status == 'Fulfilled' ? 'selected' : ''}>Fulfilled</option>
                                </select>
                            </div>
                            
                            <div class="col-md-3">
                                <label for="dateFrom" class="form-label">Date From</label>
                                <input type="date" class="form-control" id="dateFrom" name="dateFrom" value="${param.dateFrom}">
                            </div>
                            
                            <div class="col-md-3">
                                <label for="dateTo" class="form-label">Date To</label>
                                <input type="date" class="form-control" id="dateTo" name="dateTo" value="${param.dateTo}">
                            </div>
                            
                            <div class="col-md-3 d-grid">
                                <button type="submit" class="btn btn-primary mt-md-2">
                                    <i class="fas fa-filter"></i> Apply Filters
                                </button>
                            </div>
                        </div> 
                    </div>
                </form>
                
                <div class="container mt-3">
                    <div class="row">
                        <div class="col-md-12 d-grid">
                            <button class="btn btn-primary" onclick="generateReport()">
                                <i class="fas fa-download"></i> Download Report
                            </button>
                        </div>
                    </div>
                </div>

                <div class="table-responsive mt-4">
                    <table class="table" id="requestsTable">
                        <thead>
                            <tr>
                                <th>Request ID</th>
                                <th>Baby Name</th>
                                <th>Type of Milk</th>
                                <th>Quantity</th>
                                <th>Status</th>
                                <th>Submission Date</th>
                                <th>Urgency</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<MilkRequest> requests = (List<MilkRequest>) request.getAttribute("requests");
                                if (requests != null && !requests.isEmpty()) {
                                    for (MilkRequest req : requests) {
                                        String badgeClass = "";
                                        switch(req.getStatus()) {
                                            case "Pending": badgeClass = "badge-pending"; break;
                                            case "Approved": badgeClass = "badge-approved"; break;
                                            case "Rejected": badgeClass = "badge-rejected"; break;
                                            case "Fulfilled": badgeClass = "badge-fulfilled"; break;
                                            default: badgeClass = "badge-pending";
                                        }
                            %>
                            <tr>
                                <td>REQ<%= String.format("%04d", req.getId()) %></td>
                                <td><%= req.getBabyName() %></td>
                                <td><%= req.getMilkType() %></td>
                                <td><%= req.getQuantity() %>ml</td>
                                <td><span class="badge <%= badgeClass %>"><%= req.getStatus() %></span></td>
                                <td><%= req.getRequestDate().toLocalDateTime().toLocalDate() %></td>
                                <td><%= req.getUrgencyLevel() %></td>
                            </tr>
                            <% 
                                    }
                                } else { 
                            %>
                            <tr>
                                <td colspan="7">
                                    <div class="empty-state">
                                        <div class="empty-state-icon">
                                            <i class="fas fa-search"></i>
                                        </div>
                                        <h4>No requests found</h4>
                                        <p>Try adjusting your search criteria or create a new request.</p>
                                        <a href="requestmilk.jsp" class="btn btn-primary mt-3">
                                            <i class="fas fa-plus"></i>
                                            Create New Request
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function generateReport() {
        const form = document.getElementById('filterForm');
        const status = form.elements['status'].value;
        const dateFrom = form.elements['dateFrom'].value;
        const dateTo = form.elements['dateTo'].value;
        
        const url = `${pageContext.request.contextPath}/report?status=${status}&dateFrom=${dateFrom}&dateTo=${dateTo}`;
        window.location.href = url;
    }
    
    function logout() {
        if (confirm("Are you sure you want to logout?")) {
            alert("Logging out...");
            setTimeout(() => {
                window.location.href = "index.jsp";
            }, 1000);
        }
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        document.getElementById('statusFilter').value = urlParams.get('status') || '';
        document.getElementById('dateFrom').value = urlParams.get('dateFrom') || '';
        document.getElementById('dateTo').value = urlParams.get('dateTo') || '';
    });
</script>
    
    <script src="js/main.js"></script>
    
    
</body>
</html>