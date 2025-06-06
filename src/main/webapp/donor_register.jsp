<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isELIgnored="false" %>
<% String errorMsg = (String) request.getAttribute("error"); %>
<% if (errorMsg != null) { %>
    <script>
        alert("<%= errorMsg %>");
    </script>
<% } %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Donor Registration - LactaCare</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
	--primary-blue: #0e0c2a;
	--soft-pink: #96005d;
	--soft-gray: #e1e1e1;
	--valid-green: #28a745;
	--invalid-red: #dc3545;
}

body {
	background: var(--soft-gray);
	font-family: 'Inter', sans-serif;
	min-height: 100vh;
	display: flex;
	align-items: center;
	font-size: 0.9rem;
}

.registration-container {
	max-width: 600px;
	background: white;
	border-radius: 8px;
	padding: 1.5rem;
	margin: 0 auto;
	box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
}

.form-header {
	color: var(--soft-pink);
	font-weight: 600;
	border-bottom: 2.5px solid var(--primary-blue);
	padding-bottom: 0.25rem;
	margin-bottom: 1.5rem;
}

.form-label {
	font-weight: 600;
	color: var(--primary-blue);
	font-size: 0.85rem;
	margin-bottom: 0.15rem;
}

.form-control {
	border: 1px solid var(--primary-blue);
	border-radius: 6px;
	padding: 0.1rem 0.4rem;
	font-size: 0.85rem;
	height: calc(1.5em + 0.75rem);
}

.form-control:focus {
	border-color: var(--primary-blue);
	box-shadow: 0 0 0 0.2rem rgba(14, 12, 42, 0.25);
}

.is-valid {
	border-color: var(--valid-green) !important;
}

.is-invalid {
	border-color: var(--invalid-red) !important;
}

.form-group {
	position: relative;
	margin-bottom: 0.2rem;
}

.invalid-feedback {
	position: absolute;
	bottom: -1.2rem;
	left: 0;
	display: block !important;
	opacity: 0;
	transition: opacity 0.2s ease;
}

.invalid-feedback.show {
	opacity: 1;
}

.valid-feedback {
	display: none;
	bottom: -1.2rem;
}

.invalid-feedback {
	font-size: 0.75rem;
	color: var(--invalid-red);
	line-height: 1.2;
	display: none;
}

.invalid-feedback.show {
	display: block;
}

.valid-feedback {
	display: none;
	color: var(--valid-green);
	font-size: 0.75rem;
}

.btn-register {
	background: var(--primary-blue);
	color: white;
	padding: 0.5rem 1rem;
	border-radius: 6px;
	font-size: 0.9rem;
	transition: opacity 0.2s;
}

.radio-group {
	display: flex;
	gap: 1rem;
	flex-wrap: wrap;
}

.form-check-input:checked {
	background-color: var(--primary-blue);
	border-color: var(--primary-blue);
}

.form-check-input.is-invalid {
	border-color: var(--invalid-red);
}

.password-toggle {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	z-index: 5;
	color: var(--primary-blue);
}

.password-input-group {
	position: relative;
}

</style>
</head>
<body>
	<div class="container">
		<div class="registration-container">
			<div class="form-header text-center mb-3">
				<h5 class="mb-1" style="font-size: 1.4rem; font-weight: 600;">
					<i class="fas fa-hands-holding-child me-1"></i>Donor Registration
				</h5>
				<small class="text-muted">Become a life-saving donor</small>
			</div>

			<form action="${pageContext.request.contextPath}/register/donor"
				method="POST" id="donorForm" novalidate>
				<div class="row g-2">

					<div class="col-md-6 mb-1">
						<div class="form-group">
							<label class="form-label">Full Name</label> <input type="text"
								class="form-control" id="fullName" name="fullName" required
								minlength="3">
							<div class="invalid-feedback">Only alphabetic characters
								allowed</div>
							<div class="valid-feedback">Looks good!</div>
						</div>
					</div>

					<div class="col-md-6 mb-1">
						<div class="form-group">
							<label class="form-label">Contact Number</label> <input
								type="tel" class="form-control" name="contact"
								id="contactNumber" required maxlength="10">
							<div class="invalid-feedback">Valid 10-digit number
								required</div>
							<div class="valid-feedback">Valid contact number</div>
						</div>
					</div>

					<div class="col-md-6 mb-1">
						<div class="form-group">
							<label class="form-label">Email</label> <input type="email"
								class="form-control" name="email" id="email" required>
							<div class="invalid-feedback">Valid email required</div>
							<div class="valid-feedback">Valid email</div>
						</div>
					</div>

					<div class="col-md-6 mb-1">
						<div class="form-group">
							<label class="form-label">Mother Date of Birth</label> <input
								type="date" class="form-control" name="dob" id="dob" required>
							<div class="invalid-feedback">Must be 18+ years old</div>
							<div class="valid-feedback">Valid date</div>
						</div>
					</div>

					<div class="col-md-6 mb-1">
						<div class="form-group">
							<label class="form-label">Password</label>
							<div class="password-input-group">
								<input type="password" class="form-control" name="password"
									id="password" required minlength="6"> <i
									class="fas fa-eye password-toggle"
									onclick="togglePassword('password')"></i>
							</div>
							<div class="invalid-feedback">Minimum 6 characters required</div>
							<div class="valid-feedback">Secure password</div>
						</div>
					</div>

					<div class="col-md-6 mb-1">
						<div class="form-group">
							<label class="form-label">Confirm Password</label>
							<div class="password-input-group">
								<input type="password" class="form-control" id="confirmPassword"
									required> <i class="fas fa-eye password-toggle"
									onclick="togglePassword('confirmPassword')"></i>
							</div>
							<div class="invalid-feedback">Passwords must match</div>
							<div class="valid-feedback">Passwords match</div>
						</div>
					</div>

					<div class="col-12 mb-1">
						<div class="form-group">
							<label class="form-label">Address</label>
							<textarea class="form-control" id="address" name="address"
								rows="2" required minlength="10" style="height: 70px"></textarea>
							<div class="invalid-feedback">Minimum 10 characters
								required</div>
							<div class="valid-feedback">Valid address</div>
						</div>
					</div>

				<div class="col-12 mb-2">
                    <div class="form-group">
                        <label class="form-label">Lactation Status</label>
                        <div class="radio-group">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="currently_lactating" 
                                    name="lactationStatus" id="current" required>
                                <label class="form-check-label" for="current">Currently Lactating</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="recently_stopped" 
                                    name="lactationStatus" id="recent" required>
                                <label class="form-check-label" for="recent">Recently Stopped</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="planning_to_donate" 
                                    name="lactationStatus" id="planning" required>
                                <label class="form-check-label" for="planning">Planning to Donate</label>
                            </div>
                        </div>
                        <div class="invalid-feedback">Please select lactation status</div>
                    </div>
                </div>


					<div class="col-12 mt-2">
						<button type="submit" class="btn-register w-100">
							<i class="fas fa-user-plus me-1"></i>Register Now
						</button>
					</div>

					<div class="col-12 text-center mt-2">

						Already registered? <a href="login.jsp"
							class="text-decoration-none" style="color: var(--soft-pink);">Login
							here </a><span>Or</span> <a href="index.jsp"
							class="text-decoration-none" style="color: var(--soft-pink);">
							Home </a>


					</div>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        
        function togglePassword(fieldId) {
            const passwordField = document.getElementById(fieldId);
            const icon = passwordField.nextElementSibling;
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            icon.classList.toggle('fa-eye-slash');
        }

        
        document.getElementById('fullName').addEventListener('input', function(e) {
            let value = e.target.value.replace(/[^A-Za-z ]/g, '').replace(/\s+/g, ' ');
            value = value.toLowerCase().replace(/(?:^|\s)\S/g, a => a.toUpperCase());
            this.value = value;
            const isValid = /^[A-Za-z ]{3,}$/.test(value);
            toggleValidation(this, isValid);
        });

        
        document.getElementById('contactNumber').addEventListener('input', function(e) {
            this.value = this.value.replace(/\D/g, '').slice(0, 10);
            const isValid = this.value.length === 10;
            toggleValidation(this, isValid);
        });

       
        document.getElementById('email').addEventListener('input', function(e) {
            let emailValue = this.value.replace(/^\d+/g, '');
            const parts = emailValue.split('@');
            if (parts.length > 1) {
                emailValue = parts[0] + '@' + parts[1].toLowerCase();
            }
            this.value = emailValue;
            const isValid = /^[A-Za-z][A-Za-z0-9._%+-]*@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/.test(emailValue);
            toggleValidation(this, isValid);
            if (!isValid) {
                this.nextElementSibling.textContent = emailValue.length === 0 
                    ? 'Email is required' 
                    : 'Email must start with a letter and be valid';
            }
        });

        document.getElementById('password').addEventListener('input', function(e) {
            const isValid = this.value.length >= 6;
            toggleValidation(this, isValid);
            validatePasswordMatch();
        });

        document.getElementById('confirmPassword').addEventListener('input', function(e) {
            validatePasswordMatch();
        });

        function validatePasswordMatch() {
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');
            const passwordsMatch = password.value === confirmPassword.value;

            toggleValidation(confirmPassword, passwordsMatch && confirmPassword.value !== '');
            
            if (password.value.length >= 6) {
                toggleValidation(password, true);
            }
        }

        
        document.getElementById('dob').addEventListener('change', function() {
            const dob = new Date(this.value);
            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const monthDiff = today.getMonth() - dob.getMonth();
            
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                age--;
            }
            
            const isValid = age >= 18;
            toggleValidation(this, isValid);
        });

        
        document.getElementById('address').addEventListener('input', function(e) {
            let value = e.target.value.replace(/[^A-Za-z0-9 .,/-]/g, '');
            value = value.toLowerCase().replace(/(?:^|\s)\S/g, a => a.toUpperCase());
            this.value = value;
            const isValid = value.length >= 10;
            toggleValidation(this, isValid);
        });

        
        document.querySelectorAll('input[name="status"]').forEach(radio => {
            radio.addEventListener('change', () => {
                const isValid = document.querySelector('input[name="status"]:checked') !== null;
                const container = document.querySelector('.radio-group');
                const feedback = document.querySelector('#lactationFeedback');
                
                if (isValid) {
                    container.classList.remove('is-invalid');
                    feedback.classList.remove('show');
                } else {
                    container.classList.add('is-invalid');
                    feedback.classList.add('show');
                }
            });
        });

        function toggleValidation(element, isValid) {
            const feedback = element.parentElement.nextElementSibling || element.nextElementSibling;
            const validFeedback = feedback.nextElementSibling;
            
            if (element.id === 'confirmPassword') {
                const password = document.getElementById('password');
                if (password.value === '' && element.value === '') {
                    isValid = false;
                    feedback.textContent = 'Confirm password is required';
                } else {
                    feedback.textContent = password.value !== element.value 
                        ? 'Passwords must match' 
                        : 'Passwords match';
                }
            }

            if (isValid) {
                element.classList.remove('is-invalid');
                element.classList.add('is-valid');
                feedback.classList.remove('show');
                validFeedback.style.display = 'block';
            } else {
                element.classList.remove('is-valid');
                element.classList.add('is-invalid');
                feedback.classList.add('show');
                validFeedback.style.display = 'none';
            }
        }

        
    </script>
</body>
</html>