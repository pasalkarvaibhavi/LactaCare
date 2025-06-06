<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Milk - LactaCare</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            --border-color: #dddede;
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
            color: green;
            font-size: 1.2rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-title {
            color: var(--soft-pink);
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--soft-blue);
        }

	.alert {
    animation: slideIn 0.3s forwards;
}

@keyframes slideIn {
    from { transform: translateX(100%); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
}
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: rgb(3, 3, 119);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            transition: border-color 0.2s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--soft-blue);
            box-shadow: 0 0 0 3px rgba(150, 200, 251, 0.1);
        }

        .form-select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            background-color: var(--white);
            transition: border-color 0.2s ease;
        }

        .form-select:focus {
            outline: none;
            border-color: var(--soft-blue);
            box-shadow: 0 0 0 3px rgba(150, 200, 251, 0.1);
        }

        .file-upload {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .file-upload input[type="file"] {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-upload-label {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 2rem;
            border: 2px dashed var(--border-color);
            border-radius: var(--radius-md);
            background-color: var(--soft-gray);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .file-upload-label:hover {
            border-color: var(--soft-blue);
            background-color: var(--light-blue);
        }

        .file-info {
            margin-top: 0.5rem;
            font-size: 0.75rem;
            color: var(--text-secondary);
        }

        .error-message {
            color: var(--danger);
            font-size: 0.75rem;
            margin-top: 0.25rem;
            display: none;
        }

        .success-message {
            color: var(--success);
            font-size: 0.75rem;
            margin-top: 0.25rem;
            display: none;
        }

        .urgency-high {
            color: var(--danger);
            font-weight: 600;
        }

        .urgency-medium {
            color: var(--warning);
            font-weight: 600;
        }

        .urgency-low {
            color: var(--success);
            font-weight: 600;
        }

        .is-invalid {
            border-color: var(--danger) !important;
        }

        .is-valid {
            border-color: var(--success) !important;
        }

        .feedback-icon {
            position: absolute;
            right: 10px;
            top: 35px;
            display: none;
        }
    </style>
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
                <a href="requestmilk.jsp" class="active">
                    <i class="fas fa-plus-circle"></i>
                    Request Milk
                </a>
            </li>
            <li>
                <a href="request_history.jsp">
                    <i class="fas fa-history"></i>
                    Request History
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
    <div id="alertContainer" style="position: fixed; top: 80px; right: 20px; z-index: 1100; max-width: 400px;">
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
            ${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
</div>
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">
                    <i class="fas fa-plus-circle"></i>
                    Request Milk
                </h2>
            </div>
            <div class="card-body">
                <form id="milkRequestForm" action="request-milk" method="post" enctype="multipart/form-data">
                
                    <div class="mb-4">
                        <h3 class="section-title">
                            <i class="fas fa-baby"></i>
                            Baby Information
                        </h3>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="babyName" class="form-label">Baby Full Name *</label>
                                    <input type="text" class="form-control" id="babyName"  name="babyName" required>
                                    <div class="error-message" id="babyNameError">Baby name is required</div>
                                    <div class="success-message" id="babyNameSuccess">Looks good!</div>
                                </div>
                            </div>
                        </div>
                          
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="gender" class="form-label">Gender *</label>
                                    <select id="gender" name="gender" class="form-control" required>
                                        <option value="">-- Select Gender --</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="other">Other</option>
                                    </select>
                                    <div class="error-message" id="genderError">Please select gender</div>
                                    <div class="success-message" id="genderSuccess">Looks good!</div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="dateOfBirth" class="form-label">Date of Birth *</label>
                                    <input type="date" name="dateOfBirth" class="form-control" id="dateOfBirth" required>
                                    <div class="error-message" id="dateOfBirthError">Date of birth is required</div>
                                    <div class="success-message" id="dateOfBirthSuccess">Looks good!</div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="weight" class="form-label">Babies Weight (kg) *</label>
                                    <input type="number"  name="weight" class="form-control" id="weight" step="0.1" min="0.5" max="10" required>
                                    <div class="error-message" id="weightError">Valid weight is required (0.5-10kg)</div>
                                    <div class="success-message" id="weightSuccess">Looks good!</div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="birthCondition" class="form-label">Birth Condition *</label>
                                    <select class="form-select" name="birthCondition" id="birthCondition" required>
                                        <option value="">Select condition</option>
                                        <option value="premature">Premature</option>
                                        <option value="underweight">UnderWeight</option>
                                        <option value="normal">Normal</option>
                                        <option value="other">Other</option>
                                    </select>
                                    <div class="error-message" id="birthConditionError">Please select birth condition</div>
                                    <div class="success-message" id="birthConditionSuccess">Looks good!</div>
                                 </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="healthNotes" class="form-label">Health Notes</label>
                            <textarea class="form-control" id="healthNotes" name="healthNotes" rows="3" placeholder="Any additional health information about the baby..."></textarea>
                        </div>
                    </div>

                    
                    <div class="mb-4">
                        <h3 class="section-title">
                            <i class="fas fa-clipboard-list"></i>
                            Milk Request Information
                        </h3>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="doctorName" class="form-label">Prescribed Doctor's Name *</label>
                                    <input type="text" class="form-control" name="doctorName" id="doctorName" required>
                                    <div class="error-message" id="doctorNameError">Doctor's name is required</div>
                                    <div class="success-message" id="doctorNameSuccess">Looks good!</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="milkType" class="form-label">Type of Milk *</label>
                                    <select class="form-select" name="milkType"  id="milkType" required>
                                        <option value="">Select milk type</option>
                                        <option value="colostrum">Colostrum</option>
                                        <option value="transitional">Transitional</option>
                                        <option value="mature">Mature</option>
                                    </select>
                                    <div class="error-message" id="milkTypeError">Please select milk type</div>
                                    <div class="success-message" id="milkTypeSuccess">Looks good!</div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="quantity" class="form-label">Quantity (ml) *</label>
                                    <input type="number" name="quantity"  class="form-control" id="quantity" min="50" max="2000" required>
                                    <div class="error-message" id="quantityError">Valid quantity is required (50-2000ml)</div>
                                    <div class="success-message" id="quantitySuccess">Looks good!</div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="urgencyLevel"  class="form-label">Urgency Level *</label>
                                    <select class="form-select" name="urgencyLevel" id="urgencyLevel" required>
                                        <option value="">Select urgency</option>
                                        <option value="low" class="urgency-low">Low</option>
                                        <option value="medium" class="urgency-medium">Medium</option>
                                        <option value="high" class="urgency-high">High</option>
                                    </select>
                                    <div class="error-message" id="urgencyLevelError">Please select urgency level</div>
                                    <div class="success-message" id="urgencyLevelSuccess">Looks good!</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="requestReason" class="form-label">Reason for Request *</label>
                                <textarea class="form-control" name="requestReason" id="requestReason" rows="4" placeholder="Please provide detailed reason for this milk request..." required></textarea>
                                <div class="error-message" id="requestReasonError">Reason for request is required</div>
                                <div class="success-message" id="requestReasonSuccess">Looks good!</div>
                             </div>
                        </div>
                           
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="prescription" class="form-label">Doctor's Prescription *</label>
                                <div class="file-upload">
                                    <input type="file" id="prescription" accept=".pdf,.jpg,.jpeg,.png" name="prescription" required>
                                    <label for="prescription" class="file-upload-label">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                        <span>Click to upload prescription</span>
                                    </label>
                                </div>
                                <div class="file-info">Accepted formats: PDF, JPG, PNG (Max 5MB)</div>
                                <div class="error-message" id="prescriptionError">Prescription file is required</div>
                                <div class="success-message" id="prescriptionSuccess">Looks good!</div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center gap-3 mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-paper-plane me-2"></i>
                            Submit Request
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">
                            <i class="fas fa-undo me-2"></i>
                            Reset Form
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
       
        document.addEventListener("DOMContentLoaded", () => {
            setMinDate();
            initializeForm();
        });

        function setMinDate() {
            const dateInput = document.getElementById("dateOfBirth");
            const today = new Date();
            const maxDate = today.toISOString().split('T')[0];
            const minDate = new Date(today.getTime() - (365 * 24 * 60 * 60 * 1000)).toISOString().split('T')[0];
            
            dateInput.setAttribute("max", maxDate);
            dateInput.setAttribute("min", minDate);
        }

        function initializeForm() {
            const form = document.getElementById("milkRequestForm");
            const prescriptionInput = document.getElementById("prescription");
            
            
            const requiredFields = form.querySelectorAll("input[required], select[required], textarea[required]");
            requiredFields.forEach(field => {
                field.addEventListener("blur", () => validateField(field));
                field.addEventListener("input", () => {
                    clearFieldFeedback(field);
                    if (field.value.trim()) validateField(field);
                });
            });
            
          
            prescriptionInput.addEventListener("change", function() {
                validateField(this);
                const file = this.files[0];
                const label = this.nextElementSibling;
                
                if (file) {
                    if (file.size > 5 * 1024 * 1024) {
                        showError("prescription", "File size must be less than 5MB");
                        this.value = "";
                        return;
                    }
                    
                    label.innerHTML = `<i class="fas fa-check-circle"></i> ${file.name}`;
                    label.style.borderColor = "var(--success)";
                    label.style.backgroundColor = "rgba(16, 185, 129, 0.1)";
                    showSuccess("prescription", "File selected");
                } else {
                    label.innerHTML = `<i class="fas fa-cloud-upload-alt"></i> Click to upload prescription`;
                    label.style.borderColor = "var(--border-color)";
                    label.style.backgroundColor = "var(--soft-gray)";
                }
            });

        }

        function validateField(field) {
            const fieldId = field.id;
            const value = field.value;
            let isValid = true;
            let errorMessage = "";
            
            clearFieldFeedback(field);
            
            switch(fieldId) {
                case "babyName":
                case "doctorName":
                    if (!value.trim()) {
                        errorMessage = fieldId === "babyName" 
                            ? "Baby name is required" 
                            : "Doctor's name is required";
                        isValid = false;
                    } else if (!/^[A-Za-z\s]+$/.test(value.trim())) {
                        errorMessage = "Name can only contain letters and spaces";
                        isValid = false;
                    }
                    break;
                    
                case "dateOfBirth":
                    if (!value) {
                        errorMessage = "Date of birth is required";
                        isValid = false;
                    } else {
                        const birthDate = new Date(value);
                        const today = new Date();
                        if (birthDate > today) {
                            errorMessage = "Birth date cannot be in the future";
                            isValid = false;
                        }
                    }
                    break;
                    
                case "weight":
                    if (!value || value < 0.5 || value > 3) {
                        errorMessage = "Weight must be between 0.5 and 3 kg";
                        isValid = false;
                    }
                    break;
                    
                case "quantity":
                    if (!value || value < 50 || value > 2000) {
                        errorMessage = "Quantity must be between 50 and 2000 ml";
                        isValid = false;
                    }
                    break;
                    
                case "gender":
                case "birthCondition":
                case "milkType":
                case "urgencyLevel":
                    if (!value) {
                        errorMessage = "Selection is required";
                        isValid = false;
                    }
                    break;
                    
                case "requestReason":
                    if (!value.trim()) {
                        errorMessage = "Reason for request is required";
                        isValid = false;
                    } else if (value.trim().length < 10) {
                        errorMessage = "Please provide more details (at least 10 characters)";
                        isValid = false;
                    }
                    break;
                    
                case "prescription":
                    if (!field.files || field.files.length === 0) {
                        errorMessage = "Prescription file is required";
                        isValid = false;
                    } else {
                        const file = field.files[0];
                        const ext = file.name.split('.').pop().toLowerCase();
                        const validExts = ['pdf', 'jpg', 'jpeg', 'png'];
                        
                        if (!validExts.includes(ext)) {
                            errorMessage = "Invalid file format. Accepted: PDF, JPG, PNG";
                            isValid = false;
                        } else if (file.size > 5 * 1024 * 1024) {
                            errorMessage = "File size must be less than 5MB";
                            isValid = false;
                        }
                    }
                    break;
            }
            
            if (!isValid) {
                showError(fieldId, errorMessage);
                field.classList.add("is-invalid");
                field.classList.remove("is-valid");
            } else {
                showSuccess(fieldId, "Looks good!");
                field.classList.add("is-valid");
                field.classList.remove("is-invalid");
            }
            
            return isValid;
        }

        function showError(fieldId, message) {
            const errorElement = document.getElementById(fieldId + "Error");
            
            if (errorElement) {
                errorElement.textContent = message;
                errorElement.style.display = "block";
            }
            
            const successElement = document.getElementById(fieldId + "Success");
           
            if (successElement) successElement.style.display = "none";
          
        }

        function showSuccess(fieldId, message) {
            const successElement = document.getElementById(fieldId + "Success");
          
            
            if (successElement) {
                successElement.textContent = message;
                successElement.style.display = "block";
            }
            
            
          
            const errorElement = document.getElementById(fieldId + "Error");
            
            if (errorElement) errorElement.style.display = "none";
        }

        function clearFieldFeedback(field) {
            const fieldId = field.id;
    
            field.classList.remove("is-invalid", "is-valid");
            
            const errorElement = document.getElementById(fieldId + "Error");
            const successElement = document.getElementById(fieldId + "Success");
          
            if (errorElement) errorElement.style.display = "none";
            if (successElement) successElement.style.display = "none";
        }

        function resetForm() {
            if (confirm("Are you sure you want to reset the form? All entered data will be lost.")) {
                const form = document.getElementById("milkRequestForm");
                form.reset();
                
                const prescriptionLabel = document.querySelector(".file-upload-label");
                prescriptionLabel.innerHTML = `<i class="fas fa-cloud-upload-alt"></i> Click to upload prescription`;
                prescriptionLabel.style.borderColor = "var(--border-color)";
                prescriptionLabel.style.backgroundColor = "var(--soft-gray)";
                
                const fields = form.querySelectorAll("input, select, textarea");
                fields.forEach(field => {
                    clearFieldFeedback(field);
                    field.classList.remove("is-invalid", "is-valid");
                });
            }
        }
        document.addEventListener('DOMContentLoaded', () => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                setTimeout(() => {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                }, 1000);
            });
        });
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