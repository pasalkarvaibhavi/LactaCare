<%@ page 
    import="com.lactacare.dao.adminMilkRequestDAO, 
            com.lactacare.model.MilkRequest, 
            java.util.List" 
%>
<%
HttpSession session1 = request.getSession(false);
Integer userId = (session1 != null) ? (Integer) session1.getAttribute("userId") : null;

if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}

List<MilkRequest> requests = adminMilkRequestDAO.getAllMilkRequests();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Milk Requests - LactaCare Admin</title>
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


        .card-header {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid var(--border-color);
            background-color: var(--soft-gray);
        }

        .card-title {
            color: rgb(3, 97, 3);
            font-size: 1rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
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

        .btn-success {
            background-color: var(--success);
            color: var(--white);
        }

        .btn-success:hover {
            background-color: #059669;
        }

        .btn-danger {
            background-color: var(--danger);
            color: var(--white);
        }

        .btn-danger:hover {
            background-color: #dc2626;
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

        .filter-tabs {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }

        .filter-tab {
            padding: 0.5rem 1rem;
            background-color: var(--white);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            cursor: pointer;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .filter-tab.active {
            background-color: var(--soft-pink);
            color: var(--white);
            border-color: var(--soft-pink);
        }

        .filter-tab:hover {
            background-color: var(--soft-gray);
        }

        .filter-tab.active:hover {
            background-color: #7a0049;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1050;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal.show {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-dialog {
            background-color: var(--white);
            border-radius: var(--radius-lg);
            max-width: 600px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            color: var(--primary-blue);
            font-weight: 600;
            margin: 0;
        }

        .modal-body {
            padding: 1.25rem;
        }

        .modal-footer {
            padding: 1rem 1.25rem;
            border-top: 1px solid var(--border-color);
            display: flex;
            gap: 0.5rem;
            justify-content: flex-end;
        }

        .prescription-placeholder {
            width: 100%;
            height: 400px;
            background-color: var(--soft-gray);
            border: 2px dashed var(--border-color);
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: var(--radius-md);
            color: var(--text-secondary);
            font-size: 1rem;
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

            .filter-tabs {
                flex-direction: column;
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
                <a href="admin_requests.jsp" class="active">
                    <i class="fas fa-hospital"></i>
                    Hospital Requests
                </a>
            </li>
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
            <h4 style="color: var(--primary-blue); font-weight: 700; font-size:1.3;margin-bottom: 0.5rem;">Manage and Process hospital milk requests</h4>
        </div>

        <div class="filter-tabs">
            <div class="filter-tab active" onclick="filterRequests('all')">All</div>
            <div class="filter-tab" onclick="filterRequests('pending')">Pending</div>
            <div class="filter-tab" onclick="filterRequests('approved')">Approved</div>
            <div class="filter-tab" onclick="filterRequests('rejected')">Rejected</div>
            <div class="filter-tab" onclick="filterRequests('fulfilled')">Fulfilled</div>
        </div>

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-hospital-alt"></i>
                    Milk Requests
                </h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" id="requestsTable">
                        <thead>
                            <tr>
                                <th>Request ID</th>
                                <th>Hospital</th>
                                <th>Baby Name</th>
                                <th>Quantity (ml)</th>
                                <th>Urgency</th>
                                <th>Status</th>
                                <th>Prescription</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (MilkRequest req : requests) { %>
                            <tr data-id="<%= req.getId() %>" data-status="<%= req.getStatus().toLowerCase() %>">
                                <td>REQ<%= String.format("%03d", req.getId()) %></td>
                                <td><%= req.getHospitalName() %></td>
                                <td><%= req.getBabyName() %></td>
                                <td><%= req.getQuantity() %></td>
                                <td>
                                    <span class="badge 
                                        <%= "High".equals(req.getUrgencyLevel()) ? "badge-danger" : 
                                              "Medium".equals(req.getUrgencyLevel()) ? "badge-warning" : "badge-success" %>">
                                        <%= req.getUrgencyLevel() %>
                                    </span>
                                </td>
                                <td>
                                    <span class="badge 
                                        <%= "Pending".equals(req.getStatus()) ? "badge-warning" : 
                                              "Approved".equals(req.getStatus()) ? "badge-success" : 
                                              "Rejected".equals(req.getStatus()) ? "badge-danger" : "badge-primary" %>">
                                        <%= req.getStatus() %>
                                    </span>
                                </td>
                                <td>
                                    <button class="btn btn-outline btn-sm" 
                                        onclick="viewPrescription('<%= req.getPrescriptionPath() %>')">
                                        View
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </td>
                                <td>
                                    <% if ("Pending".equals(req.getStatus())) { %>
                                        <button class="btn btn-success btn-sm" 
                                            onclick="approveRequest(<%= req.getId() %>)">Approve</button>
                                        <button class="btn btn-danger btn-sm ms-1" 
                                            onclick="rejectRequest(<%= req.getId() %>)">Reject</button>
                                    <% } else if ("Approved".equals(req.getStatus())) { %>
                                        <button class="btn btn-primary btn-sm" 
                                            onclick="deliverMilk(<%= req.getId() %>)">Deliver</button>
                                    <% } else { %>
                                        <span class="text-muted">
                                            <%= "Fulfilled".equals(req.getStatus()) ? "Completed" : "Rejected" %>
                                        </span>
                                    <% } %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    
    <div class="modal" id="prescriptionModal">
        <div class="modal-dialog">
            <div class="modal-header">
                <h5 class="modal-title">Prescription - Request <span id="modalRequestId"></span></h5>
                <button type="button" class="btn-close" onclick="closeModal()">&times;</button>
            </div>
            <div class="modal-body">
                <div class="prescription-placeholder">
                    <div class="text-center">
                        <i class="fas fa-file-medical fa-3x mb-3"></i>
                        <p>Prescription Document</p>
                        <small class="text-muted">This is a placeholder for the prescription PDF/image</small>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline" onclick="closeModal()">Close</button>
                <button type="button" class="btn btn-primary" onclick="downloadPrescription()">Download</button>
            </div>
        </div>
    </div>
   
    <script src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function logout() {
        if (confirm("Are you sure you want to logout?")) {
            showToast("Logging out...", "success");
            setTimeout(() => {
                window.location.href = "login.jsp";
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

    function filterRequests(status) {
        const table = document.getElementById("requestsTable");
        const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
        
        document.querySelectorAll('.filter-tab').forEach(tab => {
            tab.classList.remove('active');
        });
        event.target.classList.add('active');

        for (const row of rows) {
            const rowStatus = row.getAttribute('data-status');
            if (status == 'all' || rowStatus == status) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
    }

    function updateRequestStatus(requestId, action) {
        fetch('<%= request.getContextPath() %>/admin/request', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'action=' + action + '&id=' + requestId
        })
        .then(response => {
            if (response.ok) {
                return response.text();
            }
            throw new Error('Network response was not ok');
        })
        .then(data => {
            if (data === 'success') {
                location.reload(); 
            } else {
                showToast('Update failed: ' + data, 'error');
            }
        })
        .catch(error => {
            showToast('Error: ' + error.message, 'error');
        });
    }

   
    function approveRequest(requestId) {
        if (confirm('Are you sure you want to approve this request?')) {
            updateRequestStatus(requestId, 'approve');
        }
    }

    function rejectRequest(requestId) {
        if (confirm('Are you sure you want to reject this request?')) {
            updateRequestStatus(requestId, 'reject');
        }
    }

    function deliverMilk(requestId) {
        if (confirm('Confirm milk delivery? This will reduce inventory.')) {
            updateRequestStatus(requestId, 'fulfill');
        }
    }

    function viewPrescription(path) {
        window.open(path, '_blank'); 
    }

    function closeModal() {
        document.getElementById('prescriptionModal').classList.remove('show');
    }

    function downloadPrescription() {
        showToast('Prescription downloaded successfully');
        closeModal();
    }

    
    document.addEventListener('DOMContentLoaded', () => {
        document.getElementById('prescriptionModal').addEventListener('click', (event) => {
            if (event.target === event.currentTarget) {
                closeModal();
            }
        });
        
     
        document.getElementById('sidebarToggle').addEventListener('click', () => {
            document.getElementById('sidebar').classList.toggle('show');
        });
    });

    </script>
</body>
</html>