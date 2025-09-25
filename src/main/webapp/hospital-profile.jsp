<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital Profile - LactaCare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    

    <header class="header">
        <div class="header-content">
            <div class="d-flex align-items-center">
                <button class="sidebar-toggle me-3" id="sidebarToggle">☰</button>
                <div class="logo">
                    <img src="src/lactacare-high-resolution-logo2.png" style="height: 50px" alt="LactaCare Logo" />
                </div>
            </div>
            <div class="user-section">
                <span class="user-name" style="color: #0e0c2a; font-weight: 700; font-size: 17px">
                    Hi, ${sessionScope.name}
                </span>
                <button class="btn btn-outline btn-sm ms-2" 
                        style="background-color: #96005d; color: aliceblue"
                        onclick="logout()">
                    Logout
                </button>
            </div>
        </div>
    </header>

    <nav class="sidebar" id="sidebar">
        <ul class="sidebar-menu">
            <li><a href="dashboard"><i class="fas fa-chart-bar"></i> Dashboard</a></li>
            <li><a href="hospital-profile" class="active"><i class="fas fa-user-circle"></i> Profile</a></li>
            <li><a href="requestmilk.jsp"><i class="fas fa-calendar-check"></i> Request Milk</a></li>
            <li><a href="request-history"><i class="fas fa-history"></i> History</a></li>
            <li><a href="#" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

   
    <main class="main-content" id="mainContent">
    <c:if test="${not empty param.success}">
        <div class="alert alert-success">Profile updated successfully!</div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger">Error: ${param.error}</div>
    </c:if>
        <div class="card">
        
            <div class="card-header">
                <h2 class="card-title" style="color: #96005d">
                    <i class="fas fa-hospital"></i> Hospital Profile
                </h2>
            </div>
            <div class="card-body">
                <form id="hospitalProfileForm" action="hospital-profile-update" method="POST">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="hospitalName" class="form-label">Hospital Name *</label>
                                <input type="text" class="form-control" id="hospitalName" name="name" 
                                    value="${name}" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                    value="${email}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="licenseId" class="form-label">License ID *</label>
                                <input type="text" class="form-control" id="licenseId" name="licenseId" 
                                    value="${licenseId}" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="contactPerson" class="form-label">Contact Person Name *</label>
                                <input type="text" class="form-control" id="contactPerson" name="contactPerson" 
                                    value="${contactPerson}" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="contactNumber" class="form-label">Contact Number *</label>
                                <input type="tel" class="form-control" id="contactNumber" name="contactNumber" 
                                    value="${contactNumber}" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="form-label" for="address">Address *</label>
                                <textarea class="form-control" id="address" name="address" 
                                    rows="4" required>${address}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-0">
                        <button type="submit" class="btn btn-primary">Update Profile</button>
                        <button type="button" class="btn btn-outline ms-3"
                                onclick="window.location.href='hospital_dashboard.jsp'">
                            Cancel
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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