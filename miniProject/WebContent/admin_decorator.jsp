<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<decorator:head />
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


.form-control{
width:200px;
}

#center{
width:500px;
margin: auto;
}



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


#table0 {
	margin: auto;
}

html, body {
	height: 100%
}

body {
	margin: 0
}

#body {
	min-height: 90%
}

#content {
	padding-bottom: 1.9em
}

#foot {
	margin-top: -1.9em;
	height: 1.9em
}
</style>

</head>
<body>
	<!-- 헤더 -->
	<div id="body">
		<div class="w3-top">
			<ul class="w3-navbar w3-white w3-wide w3-card-2">
				<li><a href="<%=request.getContextPath()%>/index.jsp"
					class="w3-margin-left"><img
						src="<%=request.getContextPath()%>/images/log.png"></a></li>
				<li class="w3-right w3-hide-small"><c:choose>
						<c:when test="${sessionScope.loginUser ne null}">
							<a href="logout.do"> <span class="glyphicon glyphicon-log-in"></span>Logout
							</a>
							<br>

							<a href="adminMain.do"> <span
								class="glyphicon glyphicon-user"></span>Admin
							</a>
						</c:when>
						<c:otherwise>
							<a href="adminLogout.do"> <span
								class="glyphicon glyphicon-log-in"></span>Logout
							</a>
							
							<a href="adminMain.do"> <span
								class="glyphicon glyphicon-user"></span>Admin
							</a>
						</c:otherwise>
					</c:choose></li>

				<li><a href="adminOrderList.do" class="w3-left"><img
						src="<%=request.getContextPath()%>/images/order.png"></a> <a
					href="adminProductList.do" class="w3-left"><img
						src="<%=request.getContextPath()%>/images/menu.png"></a> <a
					href="adminStoreSearch.do"
					class="w3-left w3-margin-right"><img
						src="<%=request.getContextPath()%>/images/store.png"></a> <a
					href="adminQnaList.do"
					class="w3-left w3-margin-right"><img
						src="<%=request.getContextPath()%>/images/faq.png"></a> 
				   <a href="adminMemberList.do" class="w3-left w3-margin-right"><img src="<%=request.getContextPath()%>/images/user.jpg" style="width:100px;height:70px"></a>		
			</ul>
		</div>

		<div id="content">
			<!-- 헤더 -->
			<decorator:body />
		</div>
	</div>
	<div id="foot">
		<footer class="container-fluid text-center">
			<p>Copyright 2012 BKR Co., Ltd. All right Reserved (주)BKR 대표이사
				문영주 사업자 등록번호 101-86-76277 서울 종로구 삼봉로 71 G 타워 2층 주식회사 비케이알 TEL
				02-6331-8282 FAX 02-3775-4325</p>
		</footer>
	</div>
</body>
</html>
