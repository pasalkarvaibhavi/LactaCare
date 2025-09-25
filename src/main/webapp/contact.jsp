<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LactaCare</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">

<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

main {
	padding: 40px 20px;
	background-color: white;
}

:root {
	--primary-blue: #0e0c2a;
	--soft-blue: #96c8fb;
	--soft-pink: #96005d;
	--soft-gray: #f0f0f0;
	--white: #ffffff;
}

.contact-hero {
	background-color: #f7f7f7;
	padding: 10px 0;
	background-image: linear-gradient(rgba(255, 255, 255, 0.9),
		rgba(255, 255, 255, 0.9)),
		url('https://placeholder.pics/svg/1500x500');
	background-size: cover;
	background-position: center;
}

.contact-hero h1 {
	text-align: center;
	color: var(--primary-blue);
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.contact-hero p {
	color: #555;
	font-size: 1.2rem;
	max-width: 800px;
	margin: 0 auto 30px;
}

.contact-container {
	display: flex;
	flex-wrap: wrap;
	gap: 30px;
}

.contact-info {
	flex: 1;
	min-width: 300px;
}

.contact-form-container {
	flex: 2;
	min-width: 300px;
}

.info-grid {
	display: flex;
	flex-direction: column;
	gap: 20px;
	animation: fadeInUp 1s ease-out;
}

.info-grid div {
	background:var(--primary-blue) ;
	padding: 20px;
	border: 1px solid #ffffff;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgb(19, 6, 104);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.info-grid div:hover {
	transform: translateY(-10px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
.info-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	padding: 20px;
	background-color: var(--primary-blue);
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.info-grid h3 {
	text-align: center;
	margin: 0 0 10px;
	color: white;
	font-size: 1.5rem;
	font-weight: 600;
}

/* Paragraph style */
.info-grid p {
	color:white;
	font-size: 1rem;
	line-height: 1.6;
	text-align: justify;
}

.info-grid a {
	color: #f8b400;
	text-decoration: none;
	transition: color 0.3s ease, transform 0.3s ease;
	font-weight: 500;
}

.info-grid a:hover {
	color: #d19600;
	text-decoration: underline;
	transform: scale(1.05);
}


@media (max-width: 600px) {
	.info-grid h3 {
		font-size: 1.25rem;
	}
	.info-grid p {
		font-size: 0.95rem;
	}
}

.contact-form {
	background: hsl(0, 0%, 100%);
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 8px 10px rgba(98, 97, 97, 0.979);
	background-image: linear-gradient(rgba(255, 255, 255, 0.9),
		rgba(255, 255, 255, 0.9)),
		url('https://placeholder.pics/svg/1500x500');
	animation: fadeIn 1.5s ease-out;
	height: 100%;
}

.contact-form h2 {
	text-align: center;
	margin-bottom: 10px;
	margin-top: -5px;
	font-size: 2rem;
	color: #2b0048;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: 600;
	color: #96005d;
}

.button, input, textarea, select {
	width: 100%;
	padding:6px 7px;
	margin-top: 1px;
	border: 1px solid #1c1b1b;
	border-radius: 8px;
	font-size: 1rem;
	font-family: 'Roboto', Arial, sans-serif;
}

input:focus, textarea:focus, select:focus {
	border-color: #760476;
	box-shadow: 0 0 2px rgba(248, 0, 232, 0.5);
	outline: none;
	transition: box-shadow 0.3s ease, border-color 0.3s ease;
}

textarea {
	resize: vertical;
}

.button {
	background: #09022b;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 1.2rem;
	font-weight: bold;
	padding: 12px;
	border-radius: 8px;
	transition: background 0.3s ease, transform 0.2s ease;
}

.button:hover {
	background: linear-gradient(135deg, #000007, #0a0700);
	transform: translateY(-3px);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}


@media (max-width: 992px) {
	.contact-container {
		flex-direction: column;
	}
	.contact-info, .contact-form-container {
		width: 100%;
	}
}

@media (max-width: 768px) {
	.contact-hero h1 {
		font-size: 2rem;
	}
	.contact-hero p {
		font-size: 1rem;
	}
	.contact-form h2 {
		font-size: 1.5rem;
	}
}

@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(20px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

@keyframes fadeIn {
	from {
		opacity: 0;
	}
	to {
		opacity: 1;
	}
}
</style>
</head>
<body>
	<header class="header">
		<div class="top-header">
			<div class="logo">
				<img src="src/lactacare-high-resolution-logo2.png" alt="Logo">
				<a href="login.jsp"
					style="color: white; background-color: #4CAF50; padding: 8px 16px; text-decoration: none; border-radius: 5px; font-family: Arial, sans-serif;">Login</a>
			</div>
		</div>
		<nav class="nav-menu">
			<div class="hamburger" id="hamburger">
				<span></span> <span></span> <span></span>
			</div>
			<ul id="nav-ul">
				<li><a href="index.jsp"> <svg fill="#ffffff"
							viewBox="0 0 2500 2520" xmlns="http://www.w3.org/2000/svg"
							stroke="#ffffff">
                            <g>
							<path
								d="M960.16 1083.131c-92.279 0-167.374-75.095-167.374-167.373 0-92.28 75.095-167.374 167.374-167.374s167.374 75.095 167.374 167.374c0 92.278-75.095 167.373-167.374 167.373ZM960.16 0 28 932.049l79 79 127.874-127.985V1920h557.912v-557.912h334.748V1920h557.912V883.064l127.874 127.985 79-79L960.16 0Z"
								fill-rule="evenodd" /></g>
                        </svg> Home
				</a></li>
				<li><a href="center.html"> <svg
							version="1.0" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 55 75" fill="#ffffff" stroke="#ffffff">
                            <g>
                                <circle fill="#ffffff" cx="32" cy="14"
								r="3" />
                                <path fill="#ffffff"
								d="M4,25h56c1.794,0,3.368-1.194,3.852-2.922c0.484-1.728-0.242-3.566-1.775-4.497l-28-17 C33.438,0.193,32.719,0,32,0s-1.438,0.193-2.076,0.581l-28,17c-1.533,0.931-2.26,2.77-1.775,4.497C0.632,23.806,2.206,25,4,25z M32,9c2.762,0,5,2.238,5,5s-2.238,5-5,5s-5-2.238-5-5S29.238,9,32,9z" />
                                <rect x="34" y="27" fill="#ffffff"
								width="8" height="25" />
                                <rect x="46" y="27" fill="#ffffff"
								width="8" height="25" />
                                <rect x="22" y="27" fill="#ffffff"
								width="8" height="25" />
                                <rect x="10" y="27" fill="#ffffff"
								width="8" height="25" />
                                <path fill="#ffffff"
								d="M4,58h56c0-2.209-1.791-4-4-4H8C5.791,54,4,55.791,4,58z" />
                                <path fill="#ffffff"
								d="M63.445,60H0.555C0.211,60.591,0,61.268,0,62v2h64v-2C64,61.268,63.789,60.591,63.445,60z" />
                            </g>
                        </svg> Centers
				</a></li>
				<li><a href="learn.jsp"> <!-- Your SVG for Learn --> <svg
							fill="#ffffff" version="1.1" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 580.643 580.643" stroke="#ffffff">
                            <g>
                                <path
								d="M251.256,237.591c37.166,0,67.042-30.048,67.042-66.977c0.043-37.037-29.876-66.999-67.042-66.999 c-36.908,0-66.869,29.962-66.869,66.999C184.387,207.587,214.349,237.591,251.256,237.591z" />
                                <path
								d="M305.032,248.506H197.653c-19.198,0-34.923,17.602-34.923,39.194v107.854c0,1.186,0.604,2.243,0.669,3.473h175.823 c0.129-1.229,0.626-2.286,0.626-3.473V287.7C339.912,266.108,324.187,248.506,305.032,248.506z" />
                                <path
								d="M431.588,269.559c29.832,0,53.754-24.008,53.754-53.668s-23.922-53.711-53.754-53.711 c-29.617,0-53.582,24.051-53.582,53.711C377.942,245.53,401.972,269.559,431.588,269.559z" />
                                <path
								d="M474.708,278.317h-86.046c-15.445,0-28.064,14.107-28.064,31.472v86.413c0,0.928,0.453,1.812,0.518,2.826h141.03 c0.065-1.014,0.496-1.898,0.496-2.826v-86.413C502.707,292.424,490.11,278.317,474.708,278.317z" />
                                <path
								d="M71.011,269.559c29.789,0,53.733-24.008,53.733-53.668S100.8,162.18,71.011,162.18c-29.638,0-53.603,24.051-53.603,53.711 S41.373,269.559,71.011,269.559L71.011,269.559z" />
                                <path
								d="M114.109,278.317H27.977C12.576,278.317,0,292.424,0,309.789v86.413c0,0.928,0.453,1.812,0.539,2.826h141.03 c0.065-1.014,0.475-1.898,0.475-2.826v-86.413C142.087,292.424,129.489,278.317,114.109,278.317z" />
                            </g>
                        </svg> Learn
				</a></li>
				<li><a href="contact.jsp"> <svg viewBox="0 0 20 20"
							version="1.1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff"
							stroke="#ffffff">

              <g id="SVGRepo_bgCarrier" stroke-width="0" />

              <g id="SVGRepo_tracerCarrier" stroke-linecap="round"
								stroke-linejoin="round" />

              <g id="SVGRepo_iconCarrier">
                <title>call [#ffffff]</title>
                <desc>Created with Sketch.</desc>
                <defs> </defs>
                <g id="Page-1" stroke="none" stroke-width="1"
								fill="none" fill-rule="evenodd">
                  <g id="Dribbble-Light-Preview"
								transform="translate(-103.000000, -7321.000000)" fill="#ffffff">
                    <g id="icons"
								transform="translate(56.000000, 160.000000)">
                      <path
								d="M61.7302966,7173.99596 C61.2672966,7175.40296 59.4532966,7176.10496 58.1572966,7175.98796 C56.3872966,7175.82796 54.4612966,7174.88896 52.9992966,7173.85496 C50.8502966,7172.33496 48.8372966,7169.98396 47.6642966,7167.48896 C46.8352966,7165.72596 46.6492966,7163.55796 47.8822966,7161.95096 C48.3382966,7161.35696 48.8312966,7161.03996 49.5722966,7161.00296 C50.6002966,7160.95296 50.7442966,7161.54096 51.0972966,7162.45696 C51.3602966,7163.14196 51.7112966,7163.84096 51.9072966,7164.55096 C52.2742966,7165.87596 50.9912966,7165.93096 50.8292966,7167.01396 C50.7282966,7167.69696 51.5562966,7168.61296 51.9302966,7169.09996 C52.6632966,7170.05396 53.5442966,7170.87696 54.5382966,7171.50296 C55.1072966,7171.86196 56.0262966,7172.50896 56.6782966,7172.15196 C57.6822966,7171.60196 57.5872966,7169.90896 58.9912966,7170.48196 C59.7182966,7170.77796 60.4222966,7171.20496 61.1162966,7171.57896 C62.1892966,7172.15596 62.1392966,7172.75396 61.7302966,7173.99596 C61.4242966,7174.92396 62.0362966,7173.06796 61.7302966,7173.99596"
								id="call-[#ffffff]"> </path>
                    </g>
                  </g>
                </g>
              </g>

            </svg> Contact Us
				</a></li>
				<button class="donate" onclick="window.location.href='donation.jsp'">
					<svg fill="#ffffff" viewBox="0 0 64 64"
						xmlns="http://www.w3.org/2000/svg">
        <path
							d="M47.74,22H2.26L5.61,11.12A2.98216,2.98216,0,0,1,8.48,9H15.05c-.03.33-.05.66-.05,1a9.93438,9.93438,0,0,0,2.01,6H16a1,1,0,0,0,0,2H34a1,1,0,0,0,0-2H32.99A9.93438,9.93438,0,0,0,35,10c0-.34-.02-.67-.05-1h6.57a2.98209,2.98209,0,0,1,2.87,2.12ZM28.61475,29a4.08076,4.08076,0,0,0-2.90723,1.208,1.03055,1.03055,0,0,1-1.415,0A4.08076,4.08076,0,0,0,21.38525,29a4.12359,4.12359,0,0,0-4.1123,4.126c0,4.38574,5.93652,8.542,7.727,9.69629,1.79053-1.1543,7.727-5.31055,7.727-9.69629A4.12359,4.12359,0,0,0,28.61475,29ZM38,29a.99974.99974,0,0,0,1,1h9v5H39a1,1,0,0,0,0,2h9v5H39a1,1,0,0,0,0,2h9v1a3.00328,3.00328,0,0,1-3,3H5a3.00328,3.00328,0,0,1-3-3V44h9a1,1,0,0,0,0-2H2V37h9a1,1,0,0,0,0-2H2V30h9a1,1,0,0,0,0-2H2V24H48v4H39A.99974.99974,0,0,0,38,29Zm-3.273,4.126A6.12619,6.12619,0,0,0,28.61475,27,6.05647,6.05647,0,0,0,22.5,33.126,6.12619,6.12619,0,0,0,28.61475,39.252,6.12619,6.12619,0,0,0,34.727,33.126Z" />
    </svg>
					Donate
				</button>
			</ul>
		</nav>
	</header>

	<section class="contact-hero">
		<div class="container text-center">
			<h1>Contact Us</h1>
			<p>We are here to support and guide you in your journey of giving
				and receiving the gift of life.</p>
		</div>
	</section>
	
	<%
    String success = request.getParameter("success");
    String error = (String) request.getAttribute("error");
    if ("true".equals(success)) {
%>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Your message has been sent successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
    } else if (error != null) {
%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
    }
%>

	<main class="container">
		<div class="contact-container">
			<section class="contact-info">
				<div class="info-grid">
					<div>
						<h3>Phone</h3>
						<p>General: +1 234 567 89</p>
						<p>Donor Support: +1 12 2121 21</p>
						<p>Recipient Support: +1 123456789</p>
					</div>
					<div>
						<h3>Email</h3>
						<p>
							General: <a href="mailto:info@lactaCare.com">info@lactaCare.com</a>
						</p>
						<p>
							Donor Assistance: <a href="mailto:donor.support@lactacare.com">donor.lactaCare.com</a>
						</p>
						<p>
							Recipient: <a
								href="mailto:recipient@lactacare.com">receiverlactaCare.com</a>
						</p>
					</div>
					<div>
						<h3>Address</h3>
						<p>1234 LifeCare Buiding,</p>
						<p>Pune City, Maharashtra, 411121</p>
					</div>
				</div>
			</section>

			<section class="contact-form-container">
				<div class="contact-form">
					<h5 class="text-center">Send Us a Message</h5>
					<form id="contactForm" action="ContactServlet" method="post">
						<div class="form-group">
							<label for="name">Full Name *</label> <input type="text" id="name"
								name="full_name" placeholder="Full Name" required>
							<div class="invalid-feedback">Please enter a valid name</div>
							<div class="valid-feedback">Looks good!</div>
						</div>

						<div class="form-group">
							<label for="email">Email Address *</label> <input type="email"
								id="email" name="email" placeholder="xyz@gmail.com" required>
							<div class="invalid-feedback">Please enter a valid email
								address</div>
							<div class="valid-feedback">Looks good!</div>
						</div>

						<div class="form-group">
							<label for="phone">Phone Number</label> <input type="tel" id="phone"
								name="phone" placeholder="+XXXXXXXXXX" required>
							<div class="invalid-feedback">Please enter a valid 10-digit
								Indian phone number</div>
							<div class="valid-feedback">Looks good!</div>
						</div>

						<div class="form-group">
							<label for="subject">Subject *</label> <input type="text"
								id="subject" name="subject" placeholder="Enter Subject" required>
							<div class="invalid-feedback">Subject must be at least 5
								characters</div>
							<div class="valid-feedback">Looks good!</div>
						</div>


						<div class="form-group">
							<label for="message">Message *</label>
							<textarea id="message" name="message" rows="3"
								placeholder="Type your message here!" required></textarea>
							<div class="invalid-feedback">Message must be at least 10
								characters</div>
							<div class="valid-feedback">Looks good!</div>
						</div>

						<button class="button" type="submit">Submit</button>
					</form>
				</div>
			</section>
		</div>
	</main>

	<footer class="footer">
		<div class="footer-container">
			<div class="footer-section">
				<h2>LactaCare</h2>
				<p>We are dedicated to supporting the health and well-being of
					infants through the provision of safe and accessible donor human
					milk.</p>
			</div>

			<div class="footer-section">
				<h3>Quick Links</h3>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="learn.jsp">Learn</a></li>
					<li><a href="donation.jsp">Donate Money</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</div>

			<div class="footer-section">
				<h3>Services</h3>
				<ul>
					<li><a href="login.jsp">Login</a></li>
					<li><a href="donor_register.jsp">Donar Registration</a></li>
					<li><a href="hospital_register.jsp">Request Milk</a></li>
					<li><a href="center.html">Search Milk Banks Centers</a> </a></li>
				</ul>
			</div>


			<div class="footer-section">
				<h3>Contact Us</h3>
				<p>
					Email: <a href="mailto:info@lactaCare.org">info@lactaCare.org</a>
				</p>
				<p>
					Phone: <a href="tel:+123456789">+1 234 567 89</a>
				</p>
				<p>Address: 123 Milk Bank. Pune City</p>
			</div>
		</div>
		<ul class="footer-icons">
			<li><a href=""><ion-icon name="logo-facebook"></ion-icon></a></li>
			<li><a href=""><ion-icon name="logo-instagram"></ion-icon></a></li>
			<li><a href=""><ion-icon name="mail-outline"></ion-icon> </ion-icon></a></li>
			<li><a href=""><ion-icon name="logo-linkedin"></ion-icon></a></li>
		</ul>
		<div class="footer-bottom">
			<p>&copy; 2024 Human Milk Bank Management System. All Rights
				Reserved.</p>
		</div>
	</footer>

	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>

	<script>
        const hamburger = document.getElementById('hamburger');
        const navUl = document.getElementById('nav-ul');
        hamburger.addEventListener('click', function() {
            hamburger.classList.toggle('active');
            navUl.classList.toggle('active');
        });
       
        document.querySelectorAll('.nav-menu ul li a').forEach(link => {
            link.addEventListener('click', () => {
                if(window.innerWidth <= 1024) {
                    hamburger.classList.remove('active');
                    navUl.classList.remove('active');
                }
            });
        });
    </script>
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("contactForm");
        const fields = {
            name: document.getElementById('name'),
            email: document.getElementById('email'),
            phone: document.getElementById('phone'),
            subject: document.getElementById('subject'),
            message: document.getElementById('message')
        };

        Object.keys(fields).forEach(fieldId => {
            fields[fieldId].addEventListener('input', function() {
                clearValidation(this);
                validateField(this);
            });
        });

        form.addEventListener("submit", function (e) {
            let isValid = true;
            
            Object.keys(fields).forEach(fieldId => {
                if (!validateField(fields[fieldId])) {
                    isValid = false;
                }
            });

            if (!isValid) {
                e.preventDefault();
                showFormError("Please correct the errors in the form");
            }
        });

        function validateField(field) {
            let isValid = true;
            let value = field.value.trim();

            switch(field.id) {
            case 'name':
            	
            	const nameRegex = /^[A-Za-z](?:[A-Za-z\t ]*[A-Za-z])?$/;
            	const cleaned = value.replace(/[\t ]+/g, ' ').trim(); // normalize spaces/tabs
            	
            	isValid = nameRegex.test(cleaned) && cleaned.length >= 3;
            	
            	

                break;
                case 'email':
                    const emailRegex = /^[A-Za-z][A-Za-z0-9._%+-]*@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
                    isValid = emailRegex.test(value);
                    break;

                case 'phone':
                    if (value) {
                        const cleanPhone = value.replace(/[^\d+]/g, '');
                        field.value = cleanPhone;
                        isValid = /^[6-9]\d{9}$/.test(cleanPhone);

                    } else {
                        isValid = true;
                    }
                    break;

                case 'subject':
                    isValid = value.length >= 5;
                    break;

                case 'message':
                    isValid = value.length >= 10;
                    break;
            }

            if (isValid) {
                showValid(field);
            } else {
                showError(field, getErrorMessage(field.id));
            }

            return isValid;
        }

        function getErrorMessage(fieldId) {
            switch(fieldId) {
                case 'name': return 'Minimum 3 letters (no numbers/special chars)';
                case 'email': return 'Invalid email format';
                case 'phone': return 'Invalid Indian phone number';
                case 'subject': return 'Subject must be at least 5 characters';
                case 'message': return 'Message must be at least 10 characters';
                default: return 'This field is invalid';
            }
        }

        function showError(field, message) {
            const errorDiv = field.nextElementSibling;
            const validDiv = errorDiv.nextElementSibling;
            errorDiv.textContent = message;
            field.classList.add('is-invalid');
            errorDiv.style.display = 'block';
            validDiv.style.display = 'none';
        }

        function showValid(field) {
            const errorDiv = field.nextElementSibling;
            const validDiv = errorDiv.nextElementSibling;
            field.classList.add('is-valid');
            validDiv.style.display = 'block';
            errorDiv.style.display = 'none';
        }

        function clearValidation(field) {
            const errorDiv = field.nextElementSibling;
            const validDiv = errorDiv.nextElementSibling;
            field.classList.remove('is-invalid', 'is-valid');
            errorDiv.style.display = 'none';
            validDiv.style.display = 'none';
        }

        function showFormError(message) {
            const errorDiv = document.createElement('div');
            errorDiv.className = 'alert alert-danger';
            errorDiv.textContent = message;
            form.prepend(errorDiv);
            setTimeout(() => errorDiv.remove(), 5000);
        }
    });
    </script>

</body>
</body>
</html>