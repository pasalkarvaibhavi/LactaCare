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
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">

<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.hero-section {
	display: flex;
	align-items: center;
	flex-direction: row;
	justify-content: space-between;
	height: 80vh;
	padding: 0 7%;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 5px;
}

.hero-content {
	max-width: 50%;
	text-align: center;
}

.hero-content h1 {
	margin-top: -20px;
	font-size: 3rem;
	color: #000153;
}

.hero-content h3 {
	margin-top: -40px;
	font-size: 1.5rem;
	color: #2c2c2c;
}

.hero-content h4 {
	margin-top: -40px;
	color: #707070;
}

.hero-content p {
	font-size: 1rem;
	margin-top: 0;
	color: #34495e;
}

.cta-buttons {
	display: flex;
	gap: 2rem;
}

.cta-buttons a {
	padding: 0.8rem 1.5rem;
	text-decoration: none;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: bold;
	color: #fff;
	transition: background-color 0.3s ease;
}

.hero-content .button1 {
	background-color: #96005d;;
}

.hero-content .button2 {
	background-color: #000153;
	margin-left: 25px;
}

.hero-content .button1:hover, .hero-content .button2:hover {
	background-color: #0482ff;
}

.hero-content .button1, .hero-content .button2 {
	padding: 0.8rem 1.5rem;
	border: none;
	border-radius: 5px;
	font-size: 1.1rem;
	cursor: pointer;
	color: #fff;
}

.hero-image {
	max-width: 45%;
}

.hero-image img {
	width: 100%;
	border-radius: 10px;
}

@media ( max-width : 1024px) {
	.hero-section {
		flex-direction: column;
		text-align: center;
		height: auto;
	}
	.hero-content {
		max-width: 100%;
		text-align: center;
	}
	.hero-content p {
		font-size: 1rem;
		margin-top: 15px;
		margin-bottom: 25px;
		color: #34495e;
	}
	.hero-image {
		max-width: 80%;
	}
	.hero-image img {
		margin-top: 25px;
		margin-bottom: 25px;
	}
}

@media ( max-width : 768px) {
	.hero-section {
		flex-direction: column;
		height: auto;
	}
	.hero-content h1 {
		font-size: 2.5rem;
	}
	.hero-content h3 {
		font-size: 1.2rem;
	}
	.hero-content p {
		font-size: 1rem;
		margin-top: 15px;
		margin-bottom: 25px;
		color: #34495e;
	}
	.hero-content h4 {
		font-size: 1rem;
	}
	.button1, .button2 {
		padding: 0.6rem 1rem;
		font-size: 0.9rem;
	}
	.hero-image {
		max-width: 80%;
	}
	.hero-image img {
		margin-top: 15px;
		width: 100%;
		margin-bottom: 25px;
	}
}

@media ( max-width : 480px) {
	.hero-content h1 {
		font-size: 2.9rem;
	}
	.hero-content h3 {
		font-size: 1.4rem;
	}
	.hero-content h4 {
		font-size: 0.8rem;
	}
	.hero-content p {
		font-size: 1rem;
		margin-top: 15px;
		margin-bottom: 25px;
		color: #34495e;
	}
	.button1, .button2 {
		padding: 0.5rem 0.8rem;
		flex-direction: column;
		margin-top: 20px;
		font-size: 0.8rem;
	}
	.button2 {
		margin-right: 25px;
	}
}

.hero-slider {
	flex: 0 0 47%;
	position: relative;
	height: 320px;
	border-radius: 10px;
	overflow: hidden;
	margin-top: 5px;
	margin-left: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.slider-container {
	width: 100%;
	height: 100%;
	position: relative;
}

.slider-slide {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: opacity 1s ease;
	background-size: cover;
	background-position: center;
}

.slider-slide.active {
	opacity: 1;
}

.slider-controls {
	position: absolute;
	bottom: 20px;
	left: 0;
	width: 100%;
	display: flex;
	justify-content: center;
	gap: 10px;
	z-index: 10;
}

.slider-dot {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, 0.5);
	cursor: pointer;
	transition: all 0.3s ease;
}

.slider-dot.active {
	background-color: white;
	transform: scale(1.2);
}

.slider-prev, .slider-next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	font-size: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	z-index: 10;
	transition: all 0.3s ease;
}

.slider-prev {
	left: 10px;
}

.slider-next {
	right: 10px;
}

.slider-prev:hover, .slider-next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

.slider {
	position: relative;
	background-color: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	width: 100%;
	overflow: hidden;
}

.slider-wrapper {
	display: flex;
	transition: transform 0.5s ease;
}

.slide {
	display: flex;
	width: 100%;
	min-width: 100%;
}

.slide-image {
	flex: 0 0 40%;
	position: relative;
	padding: 30px;
	padding-left: 70px;
}

.slide-image img {
	width: 100%;
	height: auto;
	max-height: 200px;
	object-fit: cover;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(10, 4, 104, 0.8);
	transition: transform 0.3s ease;
}

.slide-image img:hover {
	transform: scale(1.05);
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.slide-content {
	flex: 1;
	padding: 40px;
	padding-left: -30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.slide-title {
	font-size: 24px;
	text-align: center;
	color: rgb(7, 2, 102);
	font-weight: bold;
	margin-bottom: 10px;
}

.slide-text {
	font-size: 16px;
	color: rgb(72, 29, 80);
	line-height: 1.5;
}

.slider-button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(172, 0, 126, 0.8);
	border: none;
	cursor: pointer;
	padding: 10px;
	font-size: 24px;
	z-index: 10;
}

.prev {
	left: 10px;
}

.next {
	right: 10px;
}

@media ( max-width : 600px) {
	.slide {
		flex-direction: column;
	}
	.slide-image {
		flex: 0 0 auto;
		padding: 20px;
		text-align: center;
	}
	.slide-image img {
		max-height: 150px;
	}
	.slide-content {
		padding: 20px;
		text-align: center;
	}
	.slide-title {
		font-size: 20px;
	}
	.slide-text {
		font-size: 14px;
	}
	.slider-button {
		font-size: 20px;
		padding: 8px;
	}
}

@media ( min-width : 600px) and (max-width: 900px) {
	.slide-image {
		flex: 0 0 50%;
		padding: 20px;
	}
	.slide-image img {
		max-height: 180px;
	}
	.slide-content {
		padding: 30px;
	}
	.slide-title {
		font-size: 22px;
	}
	.slide-text {
		font-size: 15px;
	}
}

@media ( min-width : 900px) {
	.slide-image {
		flex: 0 0 40%;
	}
	.slide-content {
		padding: 40px;
	}
	.slide-title {
		font-size: 24px;
	}
	.slide-text {
		font-size: 16px;
	}
}

.about-us {
	display: flex;
	flex-wrap: wrap; 
	align-items: center;
	justify-content: space-between;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	margin: 20px 0;
}

.about-us-content {
	flex: 1;
	padding: 20px;
	text-align: left;
}

.about-us-content h2 {
	font-size: 28px; 
	font-weight: bold;
	color: #0a0468;
	margin-bottom: 15px;
}

.about-us-content p {
	font-size: 16px;
	line-height: 1.6;
	color: #555;
	margin-bottom: 20px;
}

.learn-more-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #0a0468;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.learn-more-button:hover {
	background-color: #5a4cc6;
}

.about-us-image {
	flex: 0 0 40%;
	text-align: center;
	padding: 20px;
}

.about-us-image img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

@media ( max-width : 768px) {
	.about-us {
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	.about-us-content {
		padding: 20px 0;
	}
	.about-us-content h2 {
		font-size: 24px;
		text-align: center;
	}
	.about-us-content p {
		font-size: 14px;
		text-align: center;
	}
	.about-us-image {
		flex: 0 0 auto;
		padding: 0;
	}
	.learn-more-button {
		display: flex;
		justify-content: center;
		align-items: center;
	}
}

@media ( max-width : 480px) {
	.about-us-content h2 {
		font-size: 20px;
		text-align: center;
	}
	.about-us-content p {
		text-align: center;
		font-size: 12px;
	}
	.learn-more-button {
		font-size: 14px;
		padding: 8px 16px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
}

.donation-section {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 40px 20px;
	background-color: #0e0c2a;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.8);
	color: #fcf1f1; 
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	margin: 20px 0;
	text-align: center;
}

.donation-content h2 {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 15px;
	color: #ffffff; 
}

.donation-content p {
	font-size: 18px;
	line-height: 1.8;
	margin-bottom: 25px;
	color: #ebebeb;
}

.donate-button {
	display: inline-block;
	padding: 15px 30px;
	background-color: #308c14;
	color: #fff;
	text-decoration: none;
	font-size: 18px;
	font-weight: bold;
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.donate-button:hover {
	background-color: #19124a;
	transform: scale(1.05);
}

@media ( max-width : 768px) {
	.donation-content h2 {
		font-size: 28px;
	}
	.donation-content p {
		font-size: 16px;
	}
	.donate-button {
		font-size: 16px;
		padding: 12px 25px;
	}
}

@media ( max-width : 480px) {
	.donation-content h2 {
		font-size: 24px;
	}
	.donation-content p {
		font-size: 14px;
	}
	.donate-button {
		font-size: 14px;
		padding: 10px 20px;
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
    <svg fill="#ffffff" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
        <path d="M47.74,22H2.26L5.61,11.12A2.98216,2.98216,0,0,1,8.48,9H15.05c-.03.33-.05.66-.05,1a9.93438,9.93438,0,0,0,2.01,6H16a1,1,0,0,0,0,2H34a1,1,0,0,0,0-2H32.99A9.93438,9.93438,0,0,0,35,10c0-.34-.02-.67-.05-1h6.57a2.98209,2.98209,0,0,1,2.87,2.12ZM28.61475,29a4.08076,4.08076,0,0,0-2.90723,1.208,1.03055,1.03055,0,0,1-1.415,0A4.08076,4.08076,0,0,0,21.38525,29a4.12359,4.12359,0,0,0-4.1123,4.126c0,4.38574,5.93652,8.542,7.727,9.69629,1.79053-1.1543,7.727-5.31055,7.727-9.69629A4.12359,4.12359,0,0,0,28.61475,29ZM38,29a.99974.99974,0,0,0,1,1h9v5H39a1,1,0,0,0,0,2h9v5H39a1,1,0,0,0,0,2h9v1a3.00328,3.00328,0,0,1-3,3H5a3.00328,3.00328,0,0,1-3-3V44h9a1,1,0,0,0,0-2H2V37h9a1,1,0,0,0,0-2H2V30h9a1,1,0,0,0,0-2H2V24H48v4H39A.99974.99974,0,0,0,38,29Zm-3.273,4.126A6.12619,6.12619,0,0,0,28.61475,27,6.05647,6.05647,0,0,0,22.5,33.126,6.12619,6.12619,0,0,0,28.61475,39.252,6.12619,6.12619,0,0,0,34.727,33.126Z"/>
    </svg>
    Donate
</button>
			</ul>
		</nav>
	</header>

	<section class="hero-section">
		<div class="hero-content">
			<p>
				<b>“MOMS HELPING MOMS”</b>
			</p>
			<h1>
				Donate Milk <br>Save Child
			</h1>
			<br>
			<h3>Human Milk Banks are the lifeline for many babies.</h3>
			<br>
			<br>
			<h4>Do you have surplus breast milk that you would like to
				donate or you want receive milk ?</h4>
			<br> <a href="donor_register.jsp"><button class="button1">Become
					a Donor</button></a> <a href="hospital_register.jsp"><button class="button2">Receive
					Milk - Hospitals</button></a>
		</div>
		<!-- <div class="hero-image">
            <img src="src/feeding-premature-baby-1.webp" alt="Mother and baby">
        </div> -->
		<div class="hero-slider">
			<div class="slider-container" id="heroSlider">
				<div class="slider-slide active"
					style="background-image: url('src/feeding-premature-baby-1.webp')"></div>
				<div class="slider-slide"
					style="background-image: url('src/1.jpeg')"></div>
				<div class="slider-slide"
					style="background-image: url('src/2.jpeg')"></div>
				<div class="slider-slide"
					style="background-image: url('src/3.jpeg')"></div>
			</div>

			<button class="slider-prev" id="sliderPrevBtn">❮</button>
			<button class="slider-next" id="sliderNextBtn">❯</button>

			<div class="slider-controls" id="sliderControls"></div>
		</div>
	</section>

	 <div class="slider">
        <div class="slider-wrapper">
            <div class="slide">
                <div class="slide-image">
                    <img src="src/1.jpeg" alt="Slide 1">
                    <div class="overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="slide-title">Promoting Healthy Starts</div>
                    <div class="slide-text">
                        Breast milk is the ideal first nourishment for infants. Human Milk Bank is committed to ensuring that all newborns, particularly premature and medically fragile ones, receive the vital nutrition and protective benefits of breast milk.
                    </div>
                </div>
            </div>
            <div class="slide">
                <div class="slide-image">
                    <img src="src/k5.jpg" alt="Slide 2">
                    <div class="overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="slide-title">The Importance of Donor Milk</div>
                    <div class="slide-text">
                        When a mother’s milk isn’t available, donor milk serves as a safe and effective alternative. Screened and pasteurized to ensure safety, it delivers essential nutrients and immune-boosting properties to support a baby’s growth and health.

                    </div>
                </div>
            </div>
            <div class="slide">
                <div class="slide-image">
                    <img src="src/2.jpeg" alt="Slide 3">
                    <div class="overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="slide-title">Is Donated Milk Safe?</div>
                    <div class="slide-text">Human milk banks carefully screen and test potential donors, following strict protocols similar to blood banks. Donated milk is pasteurized to eliminate harmful bacteria and viruses while preserving most of its beneficial properties, including 70% of its immune protection. This ensures the milk is safe and nutritious for babies.
                      </div>
                </div>
            </div>

            <div class="slide">
                <div class="slide-image">
                    <img src="src/4.jpeg" alt="Slide 4">
                    <div class="overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="slide-title">Save Lives by Becoming a Donor</div>
                    <div class="slide-text">
                        Your breast milk can make a profound difference. Healthy mothers with extra milk can donate to support families in need. Join a caring community that provides life-changing nourishment to vulnerable infants.</div>
                </div>
            </div>

            <div class="slide">
                <div class="slide-image">
                    <img src="src/3.jpeg" alt="Slide 3">
                    <div class="overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="slide-title">Supporting Families in Their Time of Need
                    </div>
                    <div class="slide-text">
                        Our Human Milk Bank works with hospitals, NICUs, and individual families to supply donor milk. Whether it’s a short-term requirement or a longer-term solution, we’re here to help ensure your baby receives optimal nutrition.

                    </div>
                </div>
            </div>

            <div class="slide">
                <div class="slide-image">
                    <img src="src/two.webp" alt="Slide 3">
                    <div class="overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="slide-title">Making a Lasting Impact Together</div>
                    <div class="slide-text">
                        By supporting our Human Milk Bank, you’re contributing to a healthier future for countless infants. Get involved by donating milk, volunteering, or advocating for our mission to give every child the strongest start in life.</div>
                </div>
            </div>
        </div>
        <!-- Navigation Buttons -->
        <button class="slider-button prev">❮</button>
        <button class="slider-button next">❯</button>
    </div>
    
	<div class="donation-section">
		<div class="donation-content">
			<h2>"Your Gift Can Change Lives - Donate Money"</h2>
			<p>Your support enables us to deliver essential donor milk to
				fragile and premature newborns. Together, we can ensure every baby
				gets the healthiest start possible. Every contribution counts!</p>
			<a href="donation.jsp" class="donate-button">Donate Now</a>
		</div>
	</div>

	<div class="about-us">
		<div class="about-us-content">
			<h2>Who we are ?</h2>
			<p>At our Human Milk Bank, we are committed to providing
				life-saving donor milk to newborns who need it most. Our mission is
				to ensure that every baby, especially those born prematurely or
				critically ill, receives the vital nutrition and immune support that
				only breast milk can offer. Together, we’re creating healthier
				futures, one baby at a time.</p>
			<a href="learn.jsp" class="learn-more-button">Learn More</a>
		</div>
		<div class="about-us-image">
			<img src="src/lactacare-high-resolution-logo2.png" alt="About Us">
		</div>
	</div>



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
			<li><a href=""><ion-icon name="mail-outline"></ion-icon>
					</ion-icon></a></li>
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
       
	 let currentIndex = 0;
	 const slides = document.querySelectorAll('.slide');
	 const totalSlides = slides.length;

	 document.querySelector('.next').addEventListener('click', () => {
	     currentIndex = (currentIndex + 1) % totalSlides;
	     updateSlider();
	 });

	 document.querySelector('.prev').addEventListener('click', () => {
	     currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
	     updateSlider();
	 });

	 function updateSlider() {
	     const sliderWrapper = document.querySelector('.slider-wrapper');
	     const offset = -currentIndex * 100; // Move the slider left by 100% of the current index
	     sliderWrapper.style.transform = `translateX(${offset}%)`;
	 }

  
        function toggleMenu() {
            const navMenu = document.getElementById('navMenu');
            navMenu.classList.toggle('active');
        }

        const sliderSlides = document.querySelectorAll('.slider-slide');
        const sliderPrevBtn = document.getElementById('sliderPrevBtn');
        const sliderNextBtn = document.getElementById('sliderNextBtn');
        const sliderControls = document.getElementById('sliderControls');
        let currentSlide = 0;
        let sliderInterval;

     
        sliderSlides.forEach((_, index) => {
            const dot = document.createElement('div');
            dot.classList.add('slider-dot');
            if (index === 0) dot.classList.add('active');
            
            dot.addEventListener('click', () => {
                goToSlide(index);
                resetSliderInterval();
            });
            
            sliderControls.appendChild(dot);
        });

        function goToSlide(index) {
     
            sliderSlides[currentSlide].classList.remove('active');
            document.querySelectorAll('.slider-dot')[currentSlide].classList.remove('active');
            
            currentSlide = index;
            sliderSlides[currentSlide].classList.add('active');
            document.querySelectorAll('.slider-dot')[currentSlide].classList.add('active');
        }

        function nextSlide() {
            let index = currentSlide + 1;
            if (index >= sliderSlides.length) index = 0;
            goToSlide(index);
        }
        function prevSlide() {
            let index = currentSlide - 1;
            if (index < 0) index = sliderSlides.length - 1;
            goToSlide(index);
        }

        function resetSliderInterval() {
            clearInterval(sliderInterval);
            sliderInterval = setInterval(nextSlide, 5000);
        }

        sliderPrevBtn.addEventListener('click', () => {
            prevSlide();
            resetSliderInterval();
        });
        
        sliderNextBtn.addEventListener('click', () => {
            nextSlide();
            resetSliderInterval();
        });

       
        resetSliderInterval();
    </script>

</body>
</html>

