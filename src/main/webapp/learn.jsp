<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UNDERSTAND HUMAN MILK BANK</title>
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">
<!-- <link rel="stylesheet" href="css/learn.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
:root {
	--primary-blue: #0e0c2a;
	--soft-blue: #96c8fb;
	--soft-pink: #96005d;
	--soft-gray: #f0f0f0;
	--white: #ffffff;
}

body {
	color: #333;
	background-color: var(--white);
	margin: 0;
	padding: 0;
}

/* Awareness Page Specific Styles */
.awareness-hero {
	background-color: #f9f9f9;
	padding: 60px 0;
	text-align: center;
	background-image: linear-gradient(rgba(255, 255, 255, 0.9),
		rgba(255, 255, 255, 0.9)), url('src/feeding-premature-baby-1.webp');
	background-size: cover;
	background-position: center;
}

.awareness-hero h1 {
	color: var(--primary-blue);
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.awareness-hero p {
	color: #555;
	font-size: 1.2rem;
	max-width: 800px;
	margin: 0 auto 30px;
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

.importance-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 30px;
}

.importance-item {
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	padding: 30px;
	text-align: center;
	transition: all 0.3s ease;
}

.importance-item:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.importance-icon {
	width: 70px;
	height: 70px;
	background-color: #f0f4ff;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	color: #96005d;
	font-size: 30px;
}

.importance-item h3 {
	font-size: 1.2rem;
	color: #0a0468;
	margin-bottom: 15px;
}

.importance-item p {
	color: #666;
	font-size: 0.9rem;
}

.myth-fact-table {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.myth-fact-table .table {
	margin-bottom: 0;
}

.myth-fact-table th {
	background-color: var(--primary-blue);
	color: white;
	text-align: center;
	padding: 15px;
}

.myth-fact-table td {
	padding: 15px;
	vertical-align: middle;
}

.myth-fact-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.myth-fact-table .myth-icon {
	color: #dc3545;
	margin-right: 10px;
}

.myth-fact-table .fact-icon {
	color: #28a745;
	margin-right: 10px;
}

/* Process Timeline */
.process-timeline {
	position: relative;
	max-width: 1200px;
	margin: 0 auto;
}

.process-timeline::after {
	content: '';
	position: absolute;
	width: 4px;
	background-color: #96005d;
	top: 0;
	bottom: 0;
	left: 50%;
	margin-left: -2px;
}

.timeline-item {
	padding: 10px 40px;
	position: relative;
	width: 50%;
	box-sizing: border-box;
}

.timeline-item:nth-child(odd) {
	left: 0;
}

.timeline-item:nth-child(even) {
	left: 50%;
}

.timeline-content {
	padding: 20px;
	background-color: #fff;
	position: relative;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.timeline-item:nth-child(odd) .timeline-content::after {
	content: '';
	position: absolute;
	right: -10px;
	top: 20px;
	width: 20px;
	height: 20px;
	background-color: #fff;
	transform: rotate(45deg);
	box-shadow: 5px -5px 5px rgba(0, 0, 0, 0.1);
}

.timeline-item:nth-child(even) .timeline-content::after {
	content: '';
	position: absolute;
	left: -10px;
	top: 20px;
	width: 20px;
	height: 20px;
	background-color: #fff;
	transform: rotate(45deg);
	box-shadow: -5px 5px 5px rgba(0, 0, 0, 0.1);
}

.timeline-item::after {
	content: '';
	position: absolute;
	width: 25px;
	height: 25px;
	right: -17px;
	background-color: #96005d;
	border: 4px solid #f0f4ff;
	top: 15px;
	border-radius: 50%;
	z-index: 1;
}

.timeline-item:nth-child(even)::after {
	left: -8px;
}

.timeline-content h3 {
	color: #0a0468;
	margin-bottom: 10px;
}

.timeline-content p {
	color: #666;
}

.faq-accordion .accordion-button:not(.collapsed) {
	background-color: var(--primary-blue);
	color: white;
}

.faq-accordion .accordion-button:focus {
	box-shadow: none;
	border-color: var(--primary-blue);
}

.testimonial-card {
	border-radius: 10px;
	background-color: #fff;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	height: 100%;
}

.testimonial-card:hover {
	transform: translateY(-5px);
}

.testimonial-card .card-body {
	padding: 25px;
}

.testimonial-card .avatar {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 15px;
}

.testimonial-card .quote {
	font-style: italic;
	color: #555;
	margin-bottom: 15px;
}

.testimonial-card .author {
	font-weight: bold;
	color: var(--primary-blue);
}

@media ( max-width : 992px) {
	.section-title h2 {
		font-size: 2.2rem;
	}
	.process-timeline::after {
		left: 31px;
	}
	.timeline-item {
		width: 100%;
		padding-left: 70px;
		padding-right: 25px;
	}
	.timeline-item:nth-child(even) {
		left: 0;
	}
	.timeline-item:nth-child(odd) .timeline-content::after, .timeline-item:nth-child(even) .timeline-content::after
		{
		display: none;
	}
	.timeline-item::after {
		left: 15px;
	}
}

@media ( max-width : 768px) {
	.logo img {
		max-width: 120px;
	}
	.awareness-hero h1 {
		font-size: 2rem;
	}
	.awareness-hero p {
		font-size: 1rem;
	}
	.section-title {
		font-size: 1.5rem;
	}
	.footer-section {
		flex: 1 1 100%;
	}
	.milk-bank-card {
		padding: 20px 15px;
	}
	.timeline-item {
		padding-left: 50px;
	}
}

@media ( max-width : 480px) {
	.awareness-hero h1 {
		font-size: 1.8rem;
	}
	.awareness-hero p {
		font-size: 0.9rem;
	}
	.section-title {
		font-size: 1.3rem;
	}
	.process-step .step-number {
		width: 40px;
		height: 40px;
		font-size: 1.2rem;
	}
	.social-share a {
		width: 40px;
		height: 40px;
		font-size: 1.2rem;
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
				<li><a href="center.html"> <svg version="1.0"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 55 75"
							fill="#ffffff" stroke="#ffffff">
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
				<li><a href="learn.jsp"> <svg fill="#ffffff" version="1.1"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 580.643 580.643"
							stroke="#ffffff">
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

	<section class="awareness-hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Why Human Milk Banks Matter: Every Drop Saves a Life</h1>
					<p>Learn the purpose, process, and power of human milk
						donation. Educate yourself and spread the word about how donated
						breast milk helps save vulnerable newborns.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<h2 class="section-title">What is a Human Milk Bank?</h2>
			<div class="row">
				<div class="col-lg-12">
					<div class="info-card">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-md-4 text-center mb-4 mb-md-0">
									<i class="fas fa-hospital"
										style="font-size: 5rem; color: var(--soft-pink);"></i>
								</div>
								<div class="col-md-8">
									<p>A Human Milk Bank is a specialized service that
										collects, screens, processes, and distributes donated human
										milk. The milk is provided by nursing mothers who have been
										carefully screened and have excess milk beyond what their own
										babies need.</p>
									<p>The donated milk is pasteurized to eliminate potential
										pathogens while preserving most of its nutritional and
										immunological properties. It is then frozen and stored until
										it is needed by vulnerable infants.</p>
									<div class="alert alert-info mt-3">
										<i class="fas fa-info-circle me-2"></i> <strong>Human
											milk banks support NICUs, orphanages, and babies who cannot
											access mother's milk.</strong>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>

	<section class="section">
		<div class="container">
			<div class="section-title">
				<h2>The Milk Donation Process</h2>
				<p>From donor to recipient: How human milk makes its journey</p>
			</div>

			<div class="process-timeline">
				<div class="timeline-item">
					<div class="timeline-content">
						<h3>1. Screening</h3>
						<p>Potential donors undergo health interviews, provide health
							history, and complete blood tests to ensure they meet strict
							safety criteria.</p>
					</div>
				</div>

				<div class="timeline-item">
					<div class="timeline-content">
						<h3>2. Collection</h3>
						<p>Approved donors express milk at home using clean
							techniques, freeze it, and either drop it off or have it
							collected by the milk bank.</p>
					</div>
				</div>

				<div class="timeline-item">
					<div class="timeline-content">
						<h3>3. Processing</h3>
						<p>At the milk bank, donations are thawed, pooled from
							multiple donors, analyzed for nutritional content, and bottled.</p>
					</div>
				</div>

				<div class="timeline-item">
					<div class="timeline-content">
						<h3>4. Pasteurization</h3>
						<p>Milk undergoes Holder pasteurization (62.5°C for 30
							minutes) to eliminate harmful bacteria while preserving most
							beneficial components.</p>
					</div>
				</div>

				<div class="timeline-item">
					<div class="timeline-content">
						<h3>5. Quality Testing</h3>
						<p>Post-pasteurization testing ensures milk is free from
							bacteria and confirms its nutritional profile before approval for
							distribution.</p>
					</div>
				</div>

				<div class="timeline-item">
					<div class="timeline-content">
						<h3>6. Distribution</h3>
						<p>Processed milk is stored frozen and then distributed to
							hospitals, NICUs, and individual recipients with a prescription
							as needed.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>

	<section class="section">
		<div class="container">
			<div class="section-title">
				<h2>The Importance of Donor Milk</h2>
				<p>Why human milk is often called "liquid gold" for vulnerable
					infants</p>
			</div>

			<div class="importance-grid">
				<div class="importance-item">
					<div class="importance-icon">
						<i class="fas fa-dna"></i>
					</div>
					<h3>Nutritionally Superior</h3>
					<p>Human milk provides the perfect balance of nutrients, easily
						digestible proteins, and bioactive compounds that cannot be
						replicated in formula. It's specially designed for human babies.</p>
				</div>

				<div class="importance-item">
					<div class="importance-icon">
						<i class="fas fa-shield-alt"></i>
					</div>
					<h3>Boosts Immunity</h3>
					<p>Donor milk contains antibodies and immune factors that help
						protect vulnerable babies from infections, reducing the risk of
						serious complications like necrotizing enterocolitis.</p>
				</div>

				<div class="importance-item">
					<div class="importance-icon">
						<i class="fas fa-heartbeat"></i>
					</div>
					<h3>Saves Premature Lives</h3>
					<p>For premature infants, human milk can be life-saving. It
						reduces the risk of serious intestinal conditions and infections
						while supporting optimal brain development.</p>
				</div>

				<div class="importance-item">
					<div class="importance-icon">
						<i class="fas fa-baby"></i>
					</div>
					<h3>Supports Medical Crises</h3>
					<p>Babies with certain medical conditions, allergies, or who
						have undergone surgeries often thrive better on human milk,
						showing faster recovery and fewer complications.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<h2 class="section-title">Myths vs. Facts</h2>
			<div class="row">
				<div class="col-lg-12">
					<div class="myth-fact-table">
						<table class="table">
							<thead>
								<tr>
									<th width="50%">Myth</th>
									<th width="50%">Fact</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><i class="fas fa-times-circle myth-icon"></i> "Only
										surplus milk is accepted"</td>
									<td><i class="fas fa-check-circle fact-icon"></i> "Even
										small amounts are valuable and can make a difference"</td>
								</tr>
								<tr>
									<td><i class="fas fa-times-circle myth-icon"></i> "Donated
										milk is risky and unsafe"</td>
									<td><i class="fas fa-check-circle fact-icon"></i> "Milk is
										fully screened, tested, and pasteurized to ensure safety"</td>
								</tr>
								<tr>
									<td><i class="fas fa-times-circle myth-icon"></i>
										"Pasteurization destroys all beneficial properties"</td>
									<td><i class="fas fa-check-circle fact-icon"></i> "Most
										immune factors and nutritional benefits are preserved after
										pasteurization"</td>
								</tr>
								<tr>
									<td><i class="fas fa-times-circle myth-icon"></i> "Working
										mothers can't donate milk"</td>
									<td><i class="fas fa-check-circle fact-icon"></i> "Working
										mothers can and do donate milk successfully"</td>
								</tr>
								<tr>
									<td><i class="fas fa-times-circle myth-icon"></i> "The
										donation process is complicated"</td>
									<td><i class="fas fa-check-circle fact-icon"></i> "The
										process is streamlined with support provided at every step"</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<h2 class="section-title">Frequently Asked Questions</h2>
			<div class="row">
				<div class="col-lg-12">
					<div class="accordion faq-accordion" id="faqAccordion">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">Who
									can donate milk?</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
								<div class="accordion-body">Healthy lactating mothers who
									have excess milk beyond what their baby needs can donate.
									Donors must pass health screenings, be non-smokers, not
									regularly use medication or herbal supplements, and be willing
									to undergo blood tests. Most milk banks accept donations from
									mothers with babies under one year old.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingTwo">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">How
									is donor milk used?</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
								<div class="accordion-body">Donor milk is primarily used
									for premature or sick infants in neonatal intensive care units
									(NICUs). It's also provided to babies with medical conditions,
									those who have undergone intestinal surgeries, infants with
									formula intolerance, and babies whose mothers are temporarily
									unable to breastfeed due to illness or medication.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingThree">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									Is donor milk safe?</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
								<div class="accordion-body">Yes, donor milk from
									established milk banks is very safe. Donors are carefully
									screened with health questionnaires and blood tests. The milk
									is pasteurized to eliminate harmful bacteria and viruses while
									preserving most beneficial components. After pasteurization,
									samples are tested to ensure they meet strict safety standards
									before being distributed.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingFour">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">
									Can working moms donate?</button>
							</h2>
							<div id="collapseFour" class="accordion-collapse collapse"
								aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
								<div class="accordion-body">Many working mothers
									successfully donate milk. Milk banks understand the challenges
									of balancing work and pumping, and they don't require minimum
									donation amounts. You can collect milk over time and arrange
									drop-offs or pickups that fit your schedule. Some milk banks
									even provide storage containers and coordinate courier services
									for your convenience.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingFive">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFive"
									aria-expanded="false" aria-controls="collapseFive">
									What happens after I donate?</button>
							</h2>
							<div id="collapseFive" class="accordion-collapse collapse"
								aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
								<div class="accordion-body">After you donate, your milk is
									pooled with milk from other donors, pasteurized, tested for
									quality and safety, and then frozen for storage. It's then
									distributed to hospitals and families with prescriptions. Many
									milk banks provide donors with information about how their milk
									has helped babies, and some offer certificates acknowledging
									the life-saving gift you've provided.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5 bg-light">
		<div class="container">
			<h2 class="section-title">Real Stories</h2>
			<div class="row">
				<div class="col-lg-6 mb-4">
					<div class="testimonial-card">
						<div class="card-body text-center">
							<img src="src/motherbaby.jpg" alt="Mother Avatar" class="avatar">
							<p class="quote">"I never knew my extra milk could save a
								life. After learning about milk donation, I became a regular
								donor. Knowing that my milk helps premature babies thrive gives
								me immense joy and purpose."</p>
							<p class="author">- Aarti, mother of 3-month-old</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="testimonial-card">
						<div class="card-body text-center">
							<img src="src/surgeon.jpg" alt="Doctor Avatar" class="avatar">
							<p class="quote">"As a NICU doctor, I've seen firsthand how
								donor milk transforms outcomes for our tiniest patients. The
								difference in recovery rates and reduced complications is
								remarkable. Human milk banks are essential partners in our
								care."</p>
							<p class="author">- Dr. Sharma, Neonatologist</p>
						</div>
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


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
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
</html>