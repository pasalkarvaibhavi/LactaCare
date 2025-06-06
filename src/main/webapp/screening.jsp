<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lactacare.model.Screening"%>
<%
Screening screening = (Screening) request.getAttribute("screening");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Health Screening - Milk Bank</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
.status-badge {
	padding: 3px 8px;
	border-radius: 12px;
	font-size: 0.85rem;
	font-weight: 600;
}

.status-eligible {
	background-color: #d4edda;
	color: #155724;
}

.status-ineligible {
	background-color: #f8d7da;
	color: #721c24;
}

.status-pending {
	background-color: #fff3cd;
	color: #856404;
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

	<!-- Sidebar -->
	<nav class="sidebar" id="sidebar">
		<ul class="sidebar-menu">
			<li><a href="donordashboard"> <i class="fas fa-chart-bar"></i>
					Dashboard
			</a></li>
			<li><a href="profile"> <i class="fas fa-user-circle"></i>
					Profile
			</a></li>
			<li><a href="screening" class="active"> <i
					class="fas fa-heartbeat"></i> Screening
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
		<div class="card">
			<div class="card-header">
				<h2 class="card-title" style="color: green;">
					<i class="fas fa-clipboard-check"></i> Health Screening
					Questionnaire
				</h2>
			</div>
			<!-- Messages -->
			<c:if test="${not empty success}">
				<div class="alert alert-success m-3">${success}</div>

			</c:if>
			<c:if test="${not empty error}">
				<div class="alert alert-danger m-3">${error}</div>
			</c:if>
			<c:if test="${not empty errors}">
            
            <
                <div class="alert alert-danger m-3">
					<ul>
						<c:forEach items="${errors}" var="error">
							<li>${error}</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

			<div class="card-body">
				<form id="screeningForm" action="submitScreening" method="post">

					<input type="hidden" name="donor_id"
						value="${sessionScope.donorId}" /> <input type="hidden"
						name="user_id" value="${sessionScope.userId}" />


					<div class="form-section">
						<h4 class="form-section-title">🍼 Lactation Information</h4>


						<div id="babyInfoSection">
							<div class="form-group">
								<label class="form-label" for="babyDob">Baby's Date of
									Birth*</label> <input type="date" class="form-control" name="babyDob"
									value="${screening.babyDob != null ? screening.babyDob : ''}"
									id="babyDob">
							</div>


							<div class="form-group">
								<label class="form-label">Are you producing more milk
									than your baby needs? *</label>
								<div class="radio-group">
									<div class="radio-option">
										<input type="radio" id="excessMilkYes" name="excessMilk"
											value="Yes" ${screening.excessMilk == 'Yes' ? 'checked' : ''}>
										<label for="excessMilkYes">Yes</label>
									</div>
									<div class="radio-option">
										<input type="radio" id="excessMilkNo" name="excessMilk"
											value="No" ${screening.excessMilk == 'No' ? 'checked' : ''}>
										<label for="excessMilkNo">No</label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="form-section">
						<h4 class="form-section-title">🏥 Health & Medical History</h4>

						<div class="form-group">
							<label class="form-label">Have you had fever or major
								illness in the last 14 days? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="recentIllnessYes" name="recentIllness"
										value="Yes"
										${screening.recentIllness == 'Yes' ? 'checked' : ''}>
									<label for="recentIllnessYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="recentIllnessNo" name="recentIllness"
										value="No" ${screening.recentIllness == 'No' ? 'checked' : ''}>
									<label for="recentIllnessNo">No</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="form-label">Are you currently on any
								prescription or over-the-counter medications? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="medicationsYes" name="medications"
										value="Yes" ${screening.medications == 'Yes' ? 'checked' : ''}>
									<label for="medicationsYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="medicationsNo" name="medications"
										value="No" ${screening.medications == 'No' ? 'checked' : ''}>
									<label for="medicationsNo">No</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="form-label">Have you ever tested positive
								for HIV, Hepatitis B, or Hepatitis C? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="infectiousDiseasesYes" value="Yes"
										name="infectiousDiseases"
										${screening.infectiousDiseases == 'Yes' ? 'checked' : ''}>
									<label for="infectiousDiseasesYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="infectiousDiseasesNo" value="No"
										name="infectiousDiseases"
										${screening.infectiousDiseases == 'No' ? 'checked' : ''}>
									<label for="infectiousDiseasesNo">No</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="form-label">Do you have any chronic
								illnesses (e.g., diabetes, thyroid, cancer)? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="chronicIllnessYes" value="Yes"
										name="chronicIllness"
										${screening.chronicIllness == 'Yes' ? 'checked' : ''}>
									<label for="chronicIllnessYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="chronicIllnessNo" value="No"
										name="chronicIllness"
										${screening.chronicIllness == 'No' ? 'checked' : ''}>
									<label for="chronicIllnessNo">No</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="form-label">Have you received any organ or
								tissue transplant? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="transplantYes" value="Yes"
										name="transplant"
										${screening.transplant == 'Yes' ? 'checked' : ''}> <label
										for="transplantYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="transplantNo" value="No"
										name="transplant"
										${screening.transplant == 'No' ? 'checked' : ''}> <label
										for="transplantNo">No</label>
								</div>
							</div>
						</div>
					</div>

					<div class="form-section">
						<h4 class="form-section-title">🥗 Lifestyle & Diet</h4>

						<div class="form-group">
							<label class="form-label">Do you smoke or use tobacco
								products? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="smokeYes" value="Yes" name="smoke"
										${screening.smoke == 'Yes' ? 'checked' : ''}> <label
										for="smokeYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="smokeNo" value="No" name="smoke"
										${screening.smoke == 'No' ? 'checked' : ''}> <label
										for="smokeNo">No</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="form-label">Do you consume alcohol or
								recreational drugs? *</label>
							<div class="radio-group">
								<div class="radio-option">
									<input type="radio" id="alcoholYes" value="Yes" name="alcohol"
										${screening.alcohol == 'Yes' ? 'checked' : ''}> <label
										for="alcoholYes">Yes</label>
								</div>
								<div class="radio-option">
									<input type="radio" id="alcoholNo" value="No" name="alcohol"
										${screening.alcohol == 'No' ? 'checked' : ''}> <label
										for="alcoholNo">No</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="form-label" for="dietType">Do you follow a
								vegetarian or non-vegetarian diet? *</label> <select
								class="form-control" id="dietType" name="dietType" required>
								<option value="">Select diet type</option>
								<option value="vegetarian"
									${screening.dietType == 'Vegetarian' ? 'checked' : ''}>Vegetarian</option>
								<option value="non-vegetarian"
									${screening.dietType == 'Non-Vegetarian' ? 'checked' : ''}>Non-Vegetarian</option>
								<option value="vegan"
									${screening.dietType == 'Vegan' ? 'checked' : ''}>Vegan</option>
								<option value="pescatarian"
									${screening.dietType == 'Pescatarian' ? 'checked' : ''}>Pescatarian</option>

							</select>
						</div>



						<div class="form-section">
							<h4 class="form-section-title">✈️ Travel History</h4>
							<div class="form-group">
								<label class="form-label">Have you traveled
									internationally in the last 6 months? *</label>
								<div class="radio-group">
									<div class="radio-option">
										<input type="radio" id="travelYes" name="travel" value="Yes"
											${screening.travel == 'Yes' ? 'checked' : ''}> <label
											for="travelYes">Yes</label>
									</div>
									<div class="radio-option">
										<input type="radio" id="travelNo" name="travel" value="No"
											${screening.travel == 'No' ? 'checked' : ''}> <label
											for="travelNo">No</label>
									</div>
								</div>
							</div>
						</div>


						<div class="form-section">
							<h4 class="form-section-title">📋 Consent & Declaration</h4>

							<div class="consent-section">
								<div class="consent-item">
									<input type="checkbox" id="consent1" name="consent1"
										${screening.consent1 ? 'checked' : ''} required> <label
										for="consent1" class="consent-text"> I confirm all the
										above details are true and I understand this information will
										be reviewed by medical professionals. </label>
								</div>
								<div class="consent-item">
									<input type="checkbox" id="consent2" name="consent2"
										${screening.consent2 ? 'checked' : ''} required> <label
										for="consent2" class="consent-text"> I give consent
										for my health information to be used for donor eligibility
										screening. </label>
								</div>
								<div class="consent-item">
									<input type="checkbox" id="consent3" name="consent3"
										${screening.consent3 ? 'checked' : ''} required> <label
										for="consent3" class="consent-text"> I understand that
										my milk will be tested for safety and quality before being
										distributed to recipients. </label>
								</div>
								<div class="consent-item">
									<input type="checkbox" id="consent4" name="consent4"
										${screening.consent4 ? 'checked' : ''} required> <label
										for="consent4" class="consent-text"> I agree to notify
										the milk bank immediately if my health status changes or if I
										become ineligible to donate. </label>
								</div>
							</div>
						</div>

						<!-- Status Card -->
						<div class="card mt-3"
							style="background-color: #e7f5ff; border: 1px solid #c5e3fc;">
							<div class="card-body card-compact">
								<h5 class="mb-2" style="color: #96005d;">Current Screening
									Status</h5>
								<c:choose>
									<c:when test="${not empty screening}">
										<div class="row">
											<div class="col-md-6">
												<p class="mb-1">
													<strong>Last Screening:</strong>
													<fmt:formatDate value="${screening.submissionDate}"
														pattern="MMM dd, yyyy" />
												</p>
												<p class="mb-1">
													<strong>Status:</strong> <span
														class="status-badge status-${fn:toLowerCase(screening.status)}">
														${screening.status} </span>
												</p>
											</div>
											<div class="col-md-6">
												<c:if test="${not empty nextDueDate}">
													<p class="mb-1">
														<strong>Next Screening Due:</strong>
														<fmt:formatDate value="${nextDueDate}"
															pattern="MMM dd, yyyy" />
													</p>
												</c:if>
												<p class="mb-0">
													<strong>Frequency:</strong> Every 1 month
												</p>
											</div>
										</div>
										<c:if test="${not empty screening.disqualificationReasons}">
											<p class="mt-2 mb-0">
												<strong>Reasons:</strong>
												${screening.disqualificationReasons}
											</p>
										</c:if>
									</c:when>
									<c:otherwise>
										<p class="mb-0">No screening records found. Please
											complete your first screening.</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="text-center mt-4">
							<button type="submit" class="btn btn-primary">Submit
								Screening</button>
							<button type="button" class="btn btn-outline ms-3"
								onclick="window.location.href='dashboard.html'">Cancel</button>
						</div>
				</form>
			</div>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>
	<c:if test="${formDisabled}">
		<script>
    
    function logout() {
  	  if (confirm("Are you sure you want to logout?")) {
  	    showToast("Logging out...", "success")
  	    setTimeout(() => {
  	      window.location.href = "index.jsp"
  	    }, 1000)
  	  }
  	}
    
    const statusCard = form.querySelector('.card-compact');
    const message = document.createElement('div');
    message.className = 'alert alert-info mt-3';
    message.innerHTML = 'Your screening is up to date. Next screening due on <strong>' +
        '<fmt:formatDate value="${nextDueDate}" pattern="MMM dd, yyyy"/></strong>';
    statusCard.parentNode.insertBefore(message, statusCard.nextSibling);
    
    const submitBtn = form.querySelector('button[type="submit"]');
    submitBtn.textContent = 'Already Submitted';
    submitBtn.disabled = true;
    submitBtn.classList.remove('btn-primary');
    submitBtn.classList.add('btn-secondary');
});
    </script>
	</c:if>
</body>
</html>
