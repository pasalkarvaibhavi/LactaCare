<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Boolean hasPendingAppointment = (Boolean) request.getAttribute("hasPendingAppointment");
    // appointment = (Appointment) request.getAttribute("latestAppointment");
    if(hasPendingAppointment == null) hasPendingAppointment = false;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - LactaCare</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .appointment-type {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        .type-option {
            border: 2px solid #ddd;
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .type-option:hover {
            border-color: #6f42c1;
        }
        .type-option.selected {
            border-color: #6f42c1;
            background-color: #e9e3f8;
        }
        .error-message {
            color: #dc3545;
            font-size: 0.875em;
            margin-top: 0.25rem;
        }
        .summary-card {
            background-color: #e8f4ff;
            border-left: 2px solid #96005d;
        }
        .past-date {
            background-color: #f8d7da !important;
        }
        .btn-disabled {
            background-color: #6c757d !important;
            cursor: not-allowed !important;
            opacity: 0.65;
        }
        .warning-card {
            background-color: #fff3cd;
            border-left: 4px solid #ffc107;
        }
        .disabled-overlay {
            position: relative;
        }
        .disabled-overlay::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.7);
            z-index: 1;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="d-flex align-items-center">
                <button class="sidebar-toggle me-3" id="sidebarToggle">☰</button>
                <div class="logo">
                    <img src="src/lactacare-high-resolution-logo2.png" style="height: 50px" alt="LactaCare Logo">
                </div>
            </div>
            <div class="user-section">
                <span class="user-name" style="color: #0e0c2a; font-weight: 700; font-size: 17px">
                    Hi, ${sessionScope.fullName}
                </span>
                <button class="btn btn-outline btn-sm ms-2" style="background-color: #96005d; color: aliceblue"
                    onclick="logout()">
                    Logout
                </button>
            </div>
        </div>
    </header>

    <nav class="sidebar" id="sidebar">
        <ul class="sidebar-menu">
            <li>
                <a href="donordashboard">
                    <i class="fas fa-chart-bar"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="profile">
                    <i class="fas fa-user-circle"></i> Profile
                </a>
            </li>
            <li>
                <a href="screening">
                    <i class="fas fa-heartbeat"></i> Screening
                </a>
            </li>
            <li>
                <a href="appointment" class="active">
                    <i class="fas fa-calendar-check"></i> Book Appointment
                </a>
            </li>
            <li>
                <a href="donation-history">
                    <i class="fas fa-history"></i> Donation History
                </a>
            </li>
            <li>
                <a href="#" onclick="logout()">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </nav>

   
    <main class="main-content" id="mainContent">
       
        <c:if test="${not empty sessionScope.latestAppointment}">
            <div class="card summary-card mb-4">
                <div class="card-header">
                    <h3 class="mb-0" style="color:#96005d">Your Appointment Details</h3>
                </div>
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-md-4 fw-bold">Appointment ID:</div>
                        <div class="col-md-8">${sessionScope.latestAppointment.id}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-4 fw-bold">Type:</div>
                        <div class="col-md-8">
                            <c:choose>
                                <c:when test="${sessionScope.latestAppointment.type eq 'home'}">Home Collection</c:when>
                                <c:when test="${sessionScope.latestAppointment.type eq 'center'}">At Center</c:when>
                                <c:otherwise>${sessionScope.latestAppointment.type}</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-4 fw-bold">Date:</div>
                        <div class="col-md-8">${sessionScope.latestAppointment.date}</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-4 fw-bold">Time Slot:</div>
                        <div class="col-md-8">${sessionScope.latestAppointment.timeSlot}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 fw-bold">Notes:</div>
                        <div class="col-md-8">${not empty sessionScope.latestAppointment.notes ? latestAppointment.notes : 'None'}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 fw-bold">Status:</div>
                        <div class="col-md-8">${not empty sessionScope.latestAppointment.status ? latestAppointment.status : 'None'}</div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.hasPendingAppointment}">
            <div class="card warning-card mb-4">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-exclamation-triangle me-3" style="font-size: 1.5rem; color: #856404;"></i>
                        <div>
                            <h5 class="mb-1" style="color: #856404;">Pending Appointment Exists</h5>
                            <p class="mb-0">You have a pending appointment that needs to be completed before you can book a new one.</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i> ${sessionScope.successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i> ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="card ${hasPendingAppointment ? 'disabled-overlay' : ''}">
            <div class="card-header">
                <h2 class="card-title" style="color:green;"><i class="fas fa-calendar-check"></i>
                Book Your Donation Appointment</h2>
            </div>
            <div class="card-body">
                <form id="appointmentForm" action="BookAppointmentServlet" method="POST">
                    <!-- Appointment Type -->
                    <div class="form-group">
                        <label class="form-label">Select Appointment Type *</label>
                        <c:if test="${not empty typeError}">
                            <div class="error-message">${typeError}</div>
                        </c:if>
                        <div class="appointment-type">
                            <div class="type-option ${param.appointmentType eq 'home' ? 'selected' : ''}" 
                                 onclick="${!hasPendingAppointment ? 'selectType(\'home\')' : ''}">
                                <input type="radio" id="typeHome" name="appointmentType" value="home" 
                                    ${param.appointmentType eq 'home' ? 'checked' : ''}
                                    ${hasPendingAppointment ? 'disabled' : ''}>
                                <div style="font-size: 2rem; margin-bottom: 0.5rem;">🏠</div>
                                <h5>Home Collection</h5>
                                <p class="text-muted">Our team will visit your home to collect the donation</p>
                            </div>
                            <div class="type-option ${param.appointmentType eq 'center' ? 'selected' : ''}" 
                                 onclick="${!hasPendingAppointment ? 'selectType(\'center\')' : ''}">
                                <input type="radio" id="typeCenter" name="appointmentType" value="center" 
                                    ${param.appointmentType eq 'center' ? 'checked' : ''}
                                    ${hasPendingAppointment ? 'disabled' : ''}>
                                <div style="font-size: 2rem; margin-bottom: 0.5rem;">🏥</div>
                                <h5>At Center</h5>
                                <p class="text-muted">Visit our donation center for the appointment</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label" for="appointmentDate">Select Date *</label>
                                <c:if test="${not empty dateError}">
                                    <div class="error-message">${dateError}</div>
                                </c:if>
                                <input type="date" class="form-control ${not empty dateError ? 'is-invalid' : ''}" 
                                       id="appointmentDate" name="appointmentDate" 
                                       value="${param.appointmentDate}" 
                                       ${hasPendingAppointment ? 'disabled' : ''} required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label" for="timeSlot">Select Time Slot *</label>
                                <c:if test="${not empty timeError}">
                                    <div class="error-message">${timeError}</div>
                                </c:if>
                                <select class="form-control ${not empty timeError ? 'is-invalid' : ''}" 
                                    id="timeSlot" name="timeSlot" 
                                    ${hasPendingAppointment ? 'disabled' : ''} required>
                                    <option value="">Choose a time slot</option>
                                    <option value="09:00-10:00" ${param.timeSlot eq '09:00-10:00' ? 'selected' : ''}>9:00 AM - 10:00 AM</option>
                                    <option value="10:00-11:00" ${param.timeSlot eq '10:00-11:00' ? 'selected' : ''}>10:00 AM - 11:00 AM</option>
                                    <option value="11:00-12:00" ${param.timeSlot eq '11:00-12:00' ? 'selected' : ''}>11:00 AM - 12:00 PM</option>
                                    <option value="14:00-15:00" ${param.timeSlot eq '14:00-15:00' ? 'selected' : ''}>2:00 PM - 3:00 PM</option>
                                    <option value="15:00-16:00" ${param.timeSlot eq '15:00-16:00' ? 'selected' : ''}>3:00 PM - 4:00 PM</option>
                                    <option value="16:00-17:00" ${param.timeSlot eq '16:00-17:00' ? 'selected' : ''}>4:00 PM - 5:00 PM</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="notes">Additional Notes</label>
                        <textarea class="form-control" id="notes" name="notes" rows="3" 
                            placeholder="Any special instructions or notes for the appointment..."
                            ${hasPendingAppointment ? 'disabled' : ''}>${param.notes}</textarea>
                    </div>

                    <div class="card mt-4" style="background-color: #e9e3f8;">
                        <div class="card-body">
                            <h5 class="mb-2" style="color: #96005d;">Appointment Summary</h5>
                            <div id="appointmentSummary">
                                <p class="text-muted">Please select appointment details above to see the summary.</p>
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary btn-lg"
                            ${hasPendingAppointment ? 'disabled id="disabledButton"' : ''}>
                            Confirm Appointment
                        </button>
                        <button type="button" class="btn btn-secondary btn-lg ms-3" 
                            onclick="window.location.href='donor_dashboard.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            const dateInput = document.getElementById('appointmentDate');
            if(dateInput) {
                dateInput.min = today;
                
                if(dateInput.value && dateInput.value < today) {
                    dateInput.classList.add('past-date');
                }
            }
            
            const disabledButton = document.getElementById('disabledButton');
            if (disabledButton) {
                disabledButton.classList.add('btn-disabled');
            }
            
            updateSummary();
        });

        function selectType(type) {
            if(<%= hasPendingAppointment %>) return; 
            
            document.querySelectorAll('.type-option').forEach(function(opt) {
                opt.classList.remove('selected');
            });
            
            const selectedOption = document.querySelector('.type-option:nth-child(' + (type === 'home' ? '1' : '2') + ')');
            if (selectedOption) {
                selectedOption.classList.add('selected');
            }
            
            const radioId = 'type' + type.charAt(0).toUpperCase() + type.slice(1);
            const radio = document.getElementById(radioId);
            if (radio) {
                radio.checked = true;
            }
            
            updateSummary();
        }

        function updateSummary() {
            const type = document.querySelector('input[name="appointmentType"]:checked');
            const date = document.getElementById('appointmentDate')?.value;
            const time = document.getElementById('timeSlot')?.value;
            const notes = document.getElementById('notes')?.value;
            
            let summaryHTML = '';
            
            if (type || date || time) {
                summaryHTML = '<dl class="row">';
                
                if (type) {
                    summaryHTML +=
                        '<dt class="col-sm-4">Type:</dt>' +
                        '<dd class="col-sm-8">' + (type.value === 'home' ? 'Home Collection' : 'At Center') + '</dd>';
                }
                
                if (date) {
                    summaryHTML +=
                        '<dt class="col-sm-4">Date:</dt>' +
                        '<dd class="col-sm-8">' + date + '</dd>';
                }
                
                if (time) {
                    const timeText = time.replace(/(\d{2}:\d{2})-(\d{2}:\d{2})/, 
                        function(match, p1, p2) { 
                            return formatTime(p1) + ' - ' + formatTime(p2);
                        });
                    summaryHTML +=
                        '<dt class="col-sm-4">Time Slot:</dt>' +
                        '<dd class="col-sm-8">' + timeText + '</dd>';
                }
                
                if (notes) {
                    summaryHTML +=
                        '<dt class="col-sm-4">Notes:</dt>' +
                        '<dd class="col-sm-8">' + notes + '</dd>';
                }
                
                summaryHTML += '</dl>';
            } else {
                summaryHTML = '<p class="text-muted">Please select appointment details above to see the summary.</p>';
            }
            
            const summaryContainer = document.getElementById('appointmentSummary');
            if(summaryContainer) {
                summaryContainer.innerHTML = summaryHTML;
            }
        }

        function formatTime(timeStr) {
            if(!timeStr) return '';
            
            const parts = timeStr.split(':');
            if (parts.length < 2) return timeStr;
            
            const hour = parseInt(parts[0], 10);
            const minutes = parts[1];
            const period = hour >= 12 ? 'PM' : 'AM';
            const formattedHour = hour % 12 || 12;
            return formattedHour + ':' + minutes + ' ' + period;
        }

        document.getElementById('appointmentDate')?.addEventListener('change', updateSummary);
        document.getElementById('timeSlot')?.addEventListener('change', updateSummary);
        document.getElementById('notes')?.addEventListener('input', updateSummary);
        
        const typeInputs = document.querySelectorAll('input[name="appointmentType"]');
        if (typeInputs) {
            typeInputs.forEach(function(input) {
                input.addEventListener('change', updateSummary);
            });
        }

        const form = document.getElementById('appointmentForm');
        if (form) {
            form.addEventListener('submit', function(event) {
                if(<%= hasPendingAppointment %>) {
                    event.preventDefault();
                    alert('You have a pending appointment. Please complete it before booking a new one.');
                    return;
                }
                
                let isValid = true;
                const today = new Date().toISOString().split('T')[0];
                const dateInput = document.getElementById('appointmentDate');
                
                document.querySelectorAll('.is-invalid').forEach(function(el) {
                    el.classList.remove('is-invalid');
                });
                
                if (!document.querySelector('input[name="appointmentType"]:checked')) {
                    isValid = false;
                    const typeContainer = document.querySelector('.appointment-type');
                    if (typeContainer) {
                        typeContainer.classList.add('border', 'border-danger', 'rounded', 'p-1');
                    }
                } else {
                    const typeContainer = document.querySelector('.appointment-type');
                    if (typeContainer) {
                        typeContainer.classList.remove('border', 'border-danger', 'rounded', 'p-1');
                    }
                }
                
                if (!dateInput.value) {
                    isValid = false;
                    dateInput.classList.add('is-invalid');
                } else if (dateInput.value < today) {
                    isValid = false;
                    dateInput.classList.add('is-invalid', 'past-date');
                }
                
                const timeSlot = document.getElementById('timeSlot');
                if (!timeSlot.value) {
                    isValid = false;
                    timeSlot.classList.add('is-invalid');
                }
                
                if (!isValid) {
                    event.preventDefault();
                    alert('Please fill in all required fields correctly.');
                }
            });
        }
        
        function logout() {
      	  if (confirm("Are you sure you want to logout?")) {
      	    showToast("Logging out...", "success")
      	    setTimeout(() => {
      	      window.location.href = "index.jsp"
      	    }, 1000)
      	  }
      	}
    </script>
</body>
</html>