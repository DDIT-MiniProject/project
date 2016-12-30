<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>버거킹 딜리버리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background: white;
}

body {
	text-align: center;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display";
	letter-spacing: 5px;
}

p {
	font-family: "Playfair Display";
	letter-spacing: 5px;
}

body {
	font-family: "Times New Roman", Georgia, Serif;
}
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	/* width: 100%; /* Set width to 100% */ */
	margin: auto;
	min-height: 200px;
	/* height:500px; */
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

#SmartApp {
	background: #ff9900;
	color: white;
}

#SNS {
	background: #ff9900;
	color: white;
}

#table0 {
	margin: auto;
}

.slide {
	margin-left: 15%;
	margin-right: 15%;
	height: 500px;
}

/* event style 한번 만들어 보았습니다 by Lim*/
.popup {
	position: relative;
	display: inline-block;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	font-size: 30pt;
	color: #ff9900;
}

.popup .popuptext {
	visibility: hidden;
	width: 160px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 8px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -80px;
	font-size: 30px;
}

.popup .popuptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}
.popup .show {
	visibility: visible;
	-webkit-animation: fadeIn 1s;
	animation: fadeIn 1s;
}
@
-webkit-keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}


</style>
</head>
<body>
	<!-- carousel 영역 -->
	<%-- 
	<div id="event">
	<br>
	<h2>눌러보는데 말이야~살살눌러야되~알았어?</h2>
	<br>
		<div class="popup" onclick="myFunction()">
			<img src="<%=request.getContextPath()%>/images/New.gif"/><span class="popuptext" id="myPopup"><img src="<%=request.getContextPath()%>/images/setmenu/콰트로치즈와퍼세트.png"/></span>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="popup" onclick="myFunction1()">
			<img src="<%=request.getContextPath()%>/images/New.gif"/><span class="popuptext" id="myPopup1"><img src="<%=request.getContextPath()%>/images/specialmenu/리치테이스트팩1.png"/></span>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="popup" onclick="myFunction2()">
			<img src="<%=request.getContextPath()%>/images/New.gif"/><span class="popuptext" id="myPopup2"><img src="<%=request.getContextPath()%>/images/setmenu/콰트로치즈와퍼세트.png"/></span>
		</div>
		</div>

		<script>
			function myFunction() {
				var popup = document.getElementById('myPopup');
				popup.classList.toggle('show');
			}
			function myFunction1() {
				var popup1 = document.getElementById('myPopup1');
				popup1.classList.toggle('show');
			}
			function myFunction2() {
				var popup2 = document.getElementById('myPopup2');
				popup2.classList.toggle('show');
			}
		</script> --%>
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="<%=request.getContextPath()%>/images/ca_01.jpg"
					alt="세상에서 가장맛있는 햄버거" style="height: 500px;">
				<div class="carousel-caption">
					<p>Delivery</p>
				</div>
			</div>

			<div class="item">
				<img src="<%=request.getContextPath()%>/images/ca_02.jpg"
					alt="세상에서 가장맛있는 햄버거" style="height: 500px;">
				<div class="carousel-caption">
					<p>Event : 12.01~12.31</p>
				</div>
			</div>
			<div class="item">
				<img src="<%=request.getContextPath()%>/images/ca_03.jpg"
					alt="세상에서 가장맛있는 햄버거" style="height: 500px;">
				<div class="carousel-caption">
					<h3>New</h3>
				</div>
			</div>
			<div class="item">
				<img src="<%=request.getContextPath()%>/images/ca_04.jpg"
					alt="세상에서 가장맛있는 햄버거" style="height: 500px;">
				<div class="carousel-caption">
					<h3>New</h3>
					<p>16.900원</p>
				</div>
			</div>
		</div>
		<!-- carousel 영역 -->

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>


	<br>
	<div class="row">
		<table id="table0">
			<tr id="SmartApp">
				<td><video src="<%=request.getContextPath()%>/video/할라피뇨.mp4"
						controls="controls"
						poster="<%=request.getContextPath()%>/images/videoMain.jpg"
						width="480" height="270" autoplay="autoplay" loop="loop"></video>
				</td>
				<td>
					<p>TASTE IS KING</p>
					<p>
						<strong>SMART APP</strong>
					</p>
					<p class="img">
						<a
							href="https://itunes.apple.com/us/app/beogeoking/id1017567032?l=es&mt=8"
							target="_blank" title="새창열림"><img
							src="<%=request.getContextPath()%>/images/btn_ios.png"
							alt="ios 버거킹 앱 다운" /></a> <a
							href="https://play.google.com/store/apps/details?id=kr.co.burgerkinghybrid"
							target="_blank" title="새창열림"><img
							src="<%=request.getContextPath()%>/images/btn_android.png"
							alt="안드로이드 버거킹 앱 다운" /></a>
					</p>
					<p>
						<span>버거킹 앱 바로받기</span>
					</p>
				</td>
				<td>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;</td>

				<td id="SNS"><video
						src="<%=request.getContextPath()%>/video/통새우와퍼.mp4"
						controls="controls"
						poster="<%=request.getContextPath()%>/images/videoMain01.jpg"
						width="480" height="270" autoplay="autoplay" loop="loop"></video></td>
				<td>
					<p>BURGERKING</p>
					<p>
						<strong>SNS</strong>
					</p>
					<p class="img">
						<a href="//twitter.com/burgerking_kor" target="_blank"
							title="새창열림"><img
							src="<%=request.getContextPath()%>/images/btn_twt.png"
							alt="버거킹 트위터" /></a> <a href="//www.facebook.com/burgerkingkorea"
							target="_blank" title="새창열림"><img
							src="<%=request.getContextPath()%>/images/btn_fb.png"
							alt="버거킹 페이스북" /></a> <a
							href="//www.youtube.com/channel/UCEKRI0fipK4LEgV98nI2CQA "
							target="_blank" title="새창열림"><img
							src="<%=request.getContextPath()%>/images/btn_ytv.png"
							alt="버거킹 유튜브" /></a>
					</p>
					<p>
						버거킹<br> 소셜네트워크 <br>바로가기
					</p>
				</td>
			</tr>


		</table>
	</div>
</body>
</html>
