<!--  %@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LactaCare</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">

<style>
:root {
	--primary-blue: #0e0c2a;
	--soft-blue: #96c8fb;
	--soft-pink: #96005d;
	--soft-gray: #f0f0f0;
	--white: #ffffff;
}

body {
	font-family: 'Arial', sans-serif;
	color: #333;
	background-color: var(--white);
	margin: 0;
	padding: 0;
}

/* Donation Page Specific Styles */
.donation-hero {
	background-color: #f7f7f7;
	padding: 60px 0;
	background-image: linear-gradient(rgba(255, 255, 255, 0.9),
		rgba(255, 255, 255, 0.9)), url('src/feeding-premature-baby-1.webp');
	background-size: cover;
	background-position: center;
}

.donation-hero h1 {
	color: var(--primary-blue);
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.donation-hero p {
	color: #555;
	font-size: 1.2rem;
	max-width: 800px;
	margin: 0 auto 30px;
}

.donation-btn {
	background-color: var(--soft-pink);
	color: white;
	border: none;
	padding: 12px 30px;
	font-size: 1.1rem;
	border-radius: 30px;
	font-weight: bold;
	transition: all 0.3s ease;
}

.donation-btn:hover {
	background-color: var(--primary-blue);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	color: white;
}

.impact-card {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	margin-bottom: 20px;
	border: none;
	height: 100%;
}

.impact-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.impact-card .card-body {
	padding: 25px;
}

.impact-card .icon {
	font-size: 3rem;
	color: var(--soft-pink);
	margin-bottom: 15px;
}

.donation-form {
	background-color: white;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.96);
}

.donation-form .form-label {
	font-weight: 500;
	color: var(--soft-pink);
	margin-bottom: 5px;
}

.donation-form .form-control:focus {
	border-color: var(--soft-pink);
	box-shadow: 0 0 0 0.25rem rgba(150, 0, 93, 0.25);
}

.section-title {
	color: var(--primary-blue);
	text-align: center;
	margin-bottom: 40px;
	font-weight: bold;
	position: relative;
	padding-bottom: 15px;
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

.donation-form .submit-btn {
	background-color: var(--soft-pink);
	color: white;
	border: none;
	padding: 12px 30px;
	font-size: 1.1rem;
	border-radius: 30px;
	font-weight: bold;
	width: 100%;
	margin-top: 20px;
	transition: all 0.3s ease;
}

.donation-form .submit-btn:hover {
	background-color: var(--primary-blue);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

@media ( max-width : 768px) {
	.donation-hero h1 {
		font-size: 2rem;
	}
	.donation-hero p {
		font-size: 1rem;
	}
	.donate {
		color: #040404;
		font-size: 25px;
		background-color: #26ff00;
		border: none;
		border-radius: 10px;
		margin-top: 12px;
		margin-bottom: 16px;
	}
	.footer-section {
		flex: 1 1 100%;
	}
}

@media ( max-width : 480px) {
	.donation-hero h1 {
		font-size: 1.8rem;
	}
	.donation-hero p {
		font-size: 0.9rem;
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
				<li><a href="learn.jsp">  <svg
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

	<section class="donation-hero">
		<div class="container text-center">
			<h1>Your Contribution Can Help Save a Life</h1>
			<p>Not every mother can donate milk, but everyone can help.
				Support our mission to protect newborns through your financial
				contribution.</p>
			<a href="#donationForm" class="btn donation-btn"> <i
				class="fas fa-heart me-2"></i> Donate Now
			</a>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<h2 class="text-center mb-5 section-title">How Your Donation
				Helps</h2>
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-flask"></i>
							</div>
							<h3>Milk Pasteurization Equipment</h3>
							<p>Your donation helps purchase and maintain specialized
								equipment needed to safely pasteurize donor milk.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-truck"></i>
							</div>
							<h3>Transport & Cold Chain Supply</h3>
							<p>Funds support the safe collection and distribution of
								donor milk to hospitals and families in need.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-hospital-alt"></i>
							</div>
							<h3>Free Milk for Underprivileged NICUs</h3>
							<p>Your generosity provides life-saving donor milk to
								hospitals serving vulnerable communities.</p>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-user-md"></i>
							</div>
							<h3>Training for Lactation Counselors</h3>
							<p>Donations fund training programs for healthcare
								professionals to better support breastfeeding mothers.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	
	<section id="donationForm" class="py-5">
		<div class="container">
			<h2 class="text-center mb-5 section-title">Make Your Donation</h2>
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<div class="donation-form">
						<form id="donationFormElement">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="fullName" class="form-label">Full Name</label> <input
										type="text" class="form-control" id="fullName"
										placeholder="Enter your full name" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="email" class="form-label">Email Address</label> <input
										type="email" class="form-control" id="email"
										placeholder="Enter your email" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="phone" class="form-label">Phone Number</label> <input
										type="tel" class="form-control" id="phone"
										placeholder="Enter your phone number">
								</div>
								<div class="col-md-6 mb-3">
									<label for="donationAmount" class="form-label">Donation
										Amount (₹)</label> <input type="number" class="form-control"
										id="donationAmount" min="100" required>
									<div class="form-text">Minimum donation amount is ₹100</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="donationMessage" class="form-label">Message
									(Optional)</label>
								<textarea class="form-control" id="donationMessage" rows="3"
									placeholder="Why are you donating? Add a personal message..."></textarea>
							</div>


							<button type="submit" class="submit-btn">
								Donate Money<span id="donateButtonAmount"></span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>



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

</body>
</body>

</html-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LactaCare</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">

<style>
:root {
	--primary-blue: #0e0c2a;
	--soft-blue: #96c8fb;
	--soft-pink: #96005d;
	--soft-gray: #f0f0f0;
	--white: #ffffff;
}

body {
	font-family: 'Arial', sans-serif;
	color: #333;
	background-color: var(--white);
	margin: 0;
	padding: 0;
}

/* Donation Page Specific Styles */
.donation-hero {
	background-color: #f7f7f7;
	padding: 60px 0;
	background-image: linear-gradient(rgba(255, 255, 255, 0.9),
		rgba(255, 255, 255, 0.9)), url('src/feeding-premature-baby-1.webp');
	background-size: cover;
	background-position: center;
}

.donation-hero h1 {
	color: var(--primary-blue);
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.donation-hero p {
	color: #555;
	font-size: 1.2rem;
	max-width: 800px;
	margin: 0 auto 30px;
}

.donation-btn {
	background-color: var(--soft-pink);
	color: white;
	border: none;
	padding: 12px 30px;
	font-size: 1.1rem;
	border-radius: 30px;
	font-weight: bold;
	transition: all 0.3s ease;
}

.donation-btn:hover {
	background-color: var(--primary-blue);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	color: white;
}

.impact-card {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	margin-bottom: 20px;
	border: none;
	height: 100%;
}

.impact-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.impact-card .card-body {
	padding: 25px;
}

.impact-card .icon {
	font-size: 3rem;
	color: var(--soft-pink);
	margin-bottom: 15px;
}

.donation-form {
	background-color: white;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.96);
}

.donation-form .form-label {
	font-weight: 500;
	color: var(--soft-pink);
	margin-bottom: 5px;
}

.donation-form .form-control:focus {
	border-color: var(--soft-pink);
	box-shadow: 0 0 0 0.25rem rgba(150, 0, 93, 0.25);
}

.section-title {
	color: var(--primary-blue);
	text-align: center;
	margin-bottom: 40px;
	font-weight: bold;
	position: relative;
	padding-bottom: 15px;
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

.donation-form .submit-btn {
	background-color: var(--soft-pink);
	color: white;
	border: none;
	padding: 12px 30px;
	font-size: 1.1rem;
	border-radius: 30px;
	font-weight: bold;
	width: 100%;
	margin-top: 20px;
	transition: all 0.3s ease;
}

.donation-form .submit-btn:hover {
	background-color: var(--primary-blue);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* Payment Section Styles */
.payment-section {
	margin-top: 30px;
	padding: 20px;
	border-radius: 10px;
	background-color: #f9f9f9;
	border: 1px solid #e0e0e0;
}

.payment-section h4 {
	color: var(--primary-blue);
	margin-bottom: 15px;
}

#payment-button {
	background-color: var(--soft-pink);
	color: white;
	border: none;
	padding: 12px 30px;
	font-size: 1.1rem;
	border-radius: 30px;
	font-weight: bold;
	width: 100%;
	transition: all 0.3s ease;
}

#payment-button:hover {
	background-color: var(--primary-blue);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

#payment-button:disabled {
	background-color: #ccc;
	cursor: not-allowed;
	transform: none;
	box-shadow: none;
}

@media ( max-width : 768px) {
	.donation-hero h1 {
		font-size: 2rem;
	}
	.donation-hero p {
		font-size: 1rem;
	}
	.donate {
		color: #040404;
		font-size: 25px;
		background-color: #26ff00;
		border: none;
		border-radius: 10px;
		margin-top: 12px;
		margin-bottom: 16px;
	}
	.footer-section {
		flex: 1 1 100%;
	}
}

@media ( max-width : 480px) {
	.donation-hero h1 {
		font-size: 1.8rem;
	}
	.donation-hero p {
		font-size: 0.9rem;
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
			<!-- Hamburger Button -->
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
				<li><a href="center.html"> <!-- Your SVG for Centers --> <svg
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
							d="M47.74,22H2.26L5.61,11.12A2.98216,2.98216,0,0,1,8.48,9H15.05c-.03.33-.05.66-.05,1a9.93438,9.93438,0,0,0,2.01,6H16a1,1,0,0,0,0,2H34a1,1,0,0,0,0-2H32.99A9.93438,9.93438,0,0,0,35,10c0-.34-.02-.67-.05-1h6.57a2.98209,2.98209,0,0,1,2.87,2.12ZM28.61475,29a4.08076,4.08076,0,0,0-2.90723,1.208,1.03055,1.03055,0,0,0-1.415,0A4.08076,4.08076,0,0,0,21.38525,29a4.12359,4.12359,0,0,0-4.1123,4.126c0,4.38574,5.93652,8.542,7.727,9.69629,1.79053-1.1543,7.727-5.31055,7.727-9.69629A4.12359,4.12359,0,0,0,28.61475,29ZM38,29a.99974.99974,0,0,0,1,1h9v5H39a1,1,0,0,0,0,2h9v5H39a1,1,0,0,0,0,2h9v1a3.00328,3.00328,0,0,1-3,3H5a3.00328,3.00328,0,0,1-3-3V44h9a1,1,0,0,0,0-2H2V37h9a1,1,0,0,0,0-2H2V30h9a1,1,0,0,0,0-2H2V24H48v4H39A.99974.99974,0,0,0,38,29Zm-3.273,4.126A6.12619,6.12619,0,0,0,28.61475,27,6.05647,6.05647,0,0,0,22.5,33.126,6.12619,6.12619,0,0,0,28.61475,39.252,6.12619,6.12619,0,0,0,34.727,33.126Z" />
    </svg>
					Donate
				</button>
			</ul>
		</nav>
	</header>

	<section class="donation-hero">
		<div class="container text-center">
			<h1>Your Contribution Can Help Save a Life</h1>
			<p>Not every mother can donate milk, but everyone can help.
				Support our mission to protect newborns through your financial
				contribution.</p>
			<a href="#donationForm" class="btn donation-btn"> <i
				class="fas fa-heart me-2"></i> Donate Now
			</a>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<h2 class="text-center mb-5 section-title">How Your Donation
				Helps</h2>
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-flask"></i>
							</div>
							<h3>Milk Pasteurization Equipment</h3>
							<p>Your donation helps purchase and maintain specialized
								equipment needed to safely pasteurize donor milk.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-truck"></i>
							</div>
							<h3>Transport & Cold Chain Supply</h3>
							<p>Funds support the safe collection and distribution of
								donor milk to hospitals and families in need.</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-hospital-alt"></i>
							</div>
							<h3>Free Milk for Underprivileged NICUs</h3>
							<p>Your generosity provides life-saving donor milk to
								hospitals serving vulnerable communities.</p>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-3 mb-4">
					<div class="impact-card">
						<div class="card-body text-center">
							<div class="icon">
								<i class="fas fa-user-md"></i>
							</div>
							<h3>Training for Lactation Counselors</h3>
							<p>Donations fund training programs for healthcare
								professionals to better support breastfeeding mothers.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Donation Form Section -->
	<section id="donationForm" class="py-5">
		<div class="container">
			<h2 class="text-center mb-5 section-title">Make Your Donation</h2>
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<div class="donation-form">
						<form id="donationFormElement">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="fullName" class="form-label">Full Name</label> <input
										type="text" class="form-control" id="fullName"
										placeholder="Enter your full name" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="email" class="form-label">Email Address</label> <input
										type="email" class="form-control" id="email"
										placeholder="Enter your email" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="phone" class="form-label">Phone Number</label> <input
										type="tel" class="form-control" id="phone"
										placeholder="Enter your phone number">
								</div>
								<div class="col-md-6 mb-3">
									<label for="donationAmount" class="form-label">Donation
										Amount (₹)</label> <input type="number" class="form-control"
										id="donationAmount" min="100" required>
									<div class="form-text">Minimum donation amount is ₹100</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="donationMessage" class="form-label">Message
									(Optional)</label>
								<textarea class="form-control" id="donationMessage" rows="3"
									placeholder="Why are you donating? Add a personal message..."></textarea>
							</div>

							
								
								<input type="hidden" id="paymentStatus" name="paymentStatus" value="unpaid">
								<input type="hidden" id="paymentId" name="paymentId" value="">

								<button id="payment-button" class="btn btn-primary w-100" type="button">Make a Donation</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
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

	<!-- Load Razorpay checkout.js -->
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

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
        
        // Razorpay Integration
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("payment-button").addEventListener("click", function () {
                // Get form values
                var fullName = document.getElementById("fullName").value;
                var email = document.getElementById("email").value;
                var phone = document.getElementById("phone").value;
                var amount = document.getElementById("donationAmount").value;
                var message = document.getElementById("donationMessage").value;

                // Validate form
                if (!fullName || !email || !amount || amount < 100) {
                    alert("Please fill all required fields with minimum donation ₹100.");
                    return;
                }

                // Create Razorpay options
                var options = {
                    "key": "rzp_test_AWbCxX14mGjWaN", // Replace with your Razorpay key
                    "amount": Number(amount) * 100, // Convert to paisa
                    "currency": "INR",
                    "name": "LactaCare Donation",
                    "description": "Donation for a good cause",
                    "handler": function (response) {
                        // On successful payment
                        document.getElementById("paymentId").value = response.razorpay_payment_id;
                        document.getElementById("paymentStatus").value = "Paid";
                        document.getElementById("payment-button").disabled = true;
                        
                        alert("Donation successful! Thank you for your generosity.");
                        
                        // Send data to backend
                        fetch("PaymentController", {
                            method: "POST",
                            headers: { "Content-Type": "application/json" },
                            body: JSON.stringify({
                                razorpayPaymentID: response.razorpay_payment_id,
                                razorpayOrderID: response.razorpay_order_id,
                                razorpaySignature: response.razorpay_signature,
                                payerName: fullName,
                                email: email,
                                phone: phone,
                                amount: amount,
                                message: message,
                                status: "completed"
                            })
                        }).then(r => r.text()).then(msg => {
                            console.log(msg);
                            alert("Thank you for your donation!");
                        });
                    },
                    "prefill": {
                        "name": fullName,
                        "email": email,
                        "contact": phone
                    },
                    "theme": {
                        "color": "#3399cc"
                    }
                };

                var rzp1 = new Razorpay(options);
                rzp1.open();
            });
        });
    </script>

</body>
</html>