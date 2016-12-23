<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<decorator:head/>
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
	padding-top: 8%;
}
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
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
	background: #ffbf80;
	color: white;
}

#table0 {
	margin: auto;
}
</style>

</head>
<body>
	<!-- 헤더 -->
		<div class="w3-top">
			<ul class="w3-navbar w3-white w3-wide w3-card-2">
				<li><a href="<%=request.getContextPath()%>/index.jsp" class="w3-margin-left"><img
						src="<%=request.getContextPath()%>/images/log.png"></a></li>
				<li class="w3-right w3-hide-small">
				<c:choose>
					<c:when test="${sessionScope.loginUser ne null}">
						<br>
						<a href="logout.do"> <span class="glyphicon glyphicon-log-in"></span>Logout</a>
						<br>
					</c:when>
					
					<c:otherwise>
						<a href="loginForm.do"> <span class="glyphicon glyphicon-log-in"></span>Login</a>
						<a href="joinForm.do"> <span class="glyphicon glyphicon-log-in"></span>Join</a>
						<a href="admin/adminLoginForm.do"> <span class="glyphicon glyphicon-user"></span>Admin</a>
					</c:otherwise>
				</c:choose>

				</li>
				
				<li>
					<a href="loginForm.do" class="w3-left"><img src="<%=request.getContextPath()%>/images/order.png"></a> 
					<a href="<%=request.getContextPath()%>/menuForm.do"	class="w3-left"><img src="<%=request.getContextPath()%>/images/menu.png"></a> 
					<a href="<%=request.getContextPath()%>/storeForm.do" class="w3-left w3-margin-right"><img src="<%=request.getContextPath()%>/images/store.png"></a> 
					<a href="<%=request.getContextPath()%>/qnaView.do"  class="w3-left w3-margin-right"><img src="<%=request.getContextPath()%>/images/faq.png"></a>
					<a href="<%=request.getContextPath()%>/cartForm.do" class="w3-right w3-margin-left"><img src="<%=request.getContextPath()%>/images/cart1.png"></a>
				</li>
			</ul>
		</div>
	<!-- 헤더 -->
	<decorator:body/>
	<footer class="container-fluid text-center">
		<p>Copyright 2012 BKR Co., Ltd. All right Reserved (주)BKR 대표이사 문영주
			사업자 등록번호 101-86-76277 서울 종로구 삼봉로 71 G 타워 2층 주식회사 비케이알 TEL
			02-6331-8282 FAX 02-3775-4325</p>
	</footer>

</body>
</html>
