<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% String successMsg = request.getParameter("success"); %>
<% if (successMsg != null) { %>
    <script>
        alert("<%= successMsg %>");
    </script>
<% } %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LactaCare - Login</title>
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

.split-screen {
	min-height: 80vh;
	background: var(--soft-gray);
}

.brand-side {
	background: linear-gradient(45deg, var(--primary-blue), #1a1738);
	color: white;
	padding: 2rem;
}

.login-side {
	background: white;
	padding: 1rem;
	border-radius: 8px;
	box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	margin: 1rem auto;
}

.form-label {
	font-weight: 600;
	color: var(--primary-blue);
	font-size: 0.8rem;
	margin-bottom: 0.3rem;
}

.form-control {
	border: 1px solid var(--primary-blue);
	border-radius: 6px;
	padding: 0.5rem 1rem;
	font-size: 0.9rem;
	height: calc(1.5em + 1rem);
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

.invalid-feedback {
	font-size: 0.75rem;
	color: var(--invalid-red);
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

.btn-login {
	background: var(--primary-blue);
	color: white;
	padding: 0.75rem 1rem;
	border-radius: 6px;
	font-weight: 600;
	transition: opacity 0.2s;
}

.password-toggle {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: var(--primary-blue);
	z-index: 5;
}

.section-title::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 80px;
	height: 3px;
	background-color: var(--soft-pink);
}

.input-group {
	position: relative;
}

@media ( max-width : 768px) {
	.brand-side {
		display: none;
	}
	.login-side {
		margin: 1rem;
		padding: 1.5rem;
	}
}
</style>
</head>
<body>
	<div class="container-fluid split-screen">
		<div class="row min-vh-100">
			<div
				class="col-md-6 brand-side d-flex align-items-center justify-content-center">
				<div class="text-center">
					<img src="src/lactacare-high-resolution-logo2.png" alt="Logo"
						style="height: 80px;" class="mb-4">
					<h2 class="mb-3">LactaCare Portal</h2>
					<p class="lead">Human Milk Bank Management System</p>
				</div>
			</div>

			<div
				class="col-md-6 d-flex align-items-center justify-content-center">
				<div class="login-side w-100">
					<h3 class="mb-3"
						style="color: var(--soft-pink); font-weight: 600; font-size: 1.8rem;">
						User Login</h3>
					<form action="${pageContext.request.contextPath}/auth/login"
						method="POST" id="loginForm" novalidate>

						<div class="mb-2">
							<label class="form-label">Enter Email</label>
							<div class="input-group">
								<input type="text" class="form-control" id="username"
									name="email" required
									pattern="^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$|^[a-zA-Z0-9_]{3,}$">
								<div class="invalid-feedback">Please enter a valid email
									or username</div>
								<div class="valid-feedback">Looks good!</div>
							</div>
						</div>

						<div class="mb-2">
							<label class="form-label">Password</label>
							<div class="input-group">
								<input type="password" class="form-control" id="password"
									name="password" required minlength="6"> <i
									class="fas fa-eye password-toggle"
									onclick="togglePassword('password')"></i>
								<div class="invalid-feedback">Password must be at least 6
									characters</div>
								<div class="valid-feedback">Secure password</div>
							</div>
						</div>

						<!-- Role Selection -->
						<div class="mb-4">
							<label class="form-label">Select Role</label> <select
								class="form-select" id="role" name="role" required>
								<option value="">Choose Role</option>
								<option value="admin">Admin</option>
								<option value="donor">Donor</option>
								<option value="hospital">Hospital</option>
							</select>
							<div class="invalid-feedback">Please select your role</div>
						</div>

						<button type="submit" class="btn btn-login w-100 mb-2">
							<i class="fas fa-sign-in-alt me-2"></i>Login
						</button>

						<div class="text-center pt-3">
							<p class="text-muted mb-2">Don't have an account?</p>
							<div class="d-flex justify-content-center gap-3">
								<a href="donor_register.jsp" class="text-decoration-none"
									style="color: var(--soft-pink);"> Register as Donor </a> <span
									class="text-muted">|</span> <a href="hospital_register.jsp"
									class="text-decoration-none" style="color: var(--soft-pink);">
									Register Hospital </a> <span class="text-muted">|</span> <a
									href="index.jsp" class="text-decoration-none"
									style="color: var(--soft-pink);"> Home </a>
							</div>
						</div>
					</form>
					<div id="alertContainer" class="mt-3"></div>
				</div>
			</div>
		</div>
	</div>

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		function togglePassword(fieldId) {
			const field = document.getElementById(fieldId);
			const type = field.getAttribute('type') === 'password' ? 'text'
					: 'password';
			field.setAttribute('type', type);
			field.nextElementSibling.classList.toggle('fa-eye-slash');
		}

		document.getElementById('username').addEventListener('input',
				function() {
					const isValid = this.checkValidity();
					toggleValidation(this, isValid);
				});

		document.getElementById('password').addEventListener('input',
				function() {
					const isValid = this.checkValidity();
					toggleValidation(this, isValid);
				});

		document.getElementById('role').addEventListener('change', function() {
			const isValid = this.checkValidity();
			toggleValidation(this, isValid);
		});

		function toggleValidation(element, isValid) {
			const feedback = element.parentElement
					.querySelector('.invalid-feedback');
			const validFeedback = element.parentElement
					.querySelector('.valid-feedback');

			if (isValid) {
				element.classList.remove('is-invalid');
				element.classList.add('is-valid');
				feedback.style.display = 'none';
				validFeedback.style.display = 'block';
			} else {
				element.classList.remove('is-valid');
				element.classList.add('is-invalid');
				feedback.style.display = 'block';
				validFeedback.style.display = 'none';
			}
		}
	</script >
</body>
</html>