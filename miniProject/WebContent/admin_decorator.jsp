<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
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

#hh{
    width:225px;
    height:400px;
   
}

</style>

</head>
<body>
	<!-- 헤더 -->
	<nav class="navbar navbar-inverse">
	 <div class="container-fluid">
		<div class="w3-top">
			<ul class="w3-navbar w3-white w3-wide w3-card-2">
				<li><a href="#home" class="w3-margin-left"><img
						src="<%=request.getContextPath()%>/images/log.png"></a></li>
				<li class="w3-right w3-hide-small"><a href="<%=request.getContextPath() %>/index.do"> <span
						class="glyphicon glyphicon-log-in"></span>Logout
				</a>
				<br><a href="adminMain.do"> <span class="glyphicon glyphicon-user"></span>Admin
				</a></li>
				<li><a href="#about" class="w3-left"><img src="<%=request.getContextPath()%>/images/order.png"></a> 
					<a href="menuForm.do" class="w3-left"><img src="<%=request.getContextPath()%>/images/menu.png"></a> 
					<a href="#contact" class="w3-left w3-margin-right"><img src="<%=request.getContextPath()%>/images/store.png"></a> 
					<a href="#FAQ" class="w3-left w3-margin-right"><img src="<%=request.getContextPath()%>/images/faq.png"></a>
					</li>
					
			</ul>
		</div>
		</div>
		</nav>
		
		<div class="container-fluid text-center">    
 
  <div class="row content">
 
    <div class="col-sm-2 sidenav">
    <table>
    <tr>
    <th>
    
      <nav id="sub_menu">
      
      <br>
      <div class="container">
  <div class="well" id="hh">
   <br>   
 <h3><span class="glyphicon glyphicon-cog"></span> Setting </h3>
<br>
<ul>

<li><h4><span class="glyphicon glyphicon-gift"></span><a href='adminProductList.do'> Product</a></h4></li>
<li><h4><span class="glyphicon glyphicon-shopping-cart"></span><a href='adminOrderList.do'> Order</a></h4></li>
<li><h4><span class="glyphicon glyphicon-user"></span><a href='adminMemberList.do'> User</a></h4></li>
<li><h4><span class="glyphicon glyphicon-question-sign"></span><a href='adminQnaList.do'> Q&amp;A</a></h4></li>
</ul>
</div>
</div>
</nav>
</th>
</tr>
</table>
    </div>
    <div class="col-sm-8 text-left"> 
     <decorator:body />
    </div>
  </div>
</div>
<br>
	<!-- 헤더 -->
	
	<footer class="container-fluid text-center">
		<p>Copyright 2012 BKR Co., Ltd. All right Reserved (주)BKR 대표이사 문영주
			사업자 등록번호 101-86-76277 서울 종로구 삼봉로 71 G 타워 2층 주식회사 비케이알 TEL
			02-6331-8282 FAX 02-3775-4325</p>
	</footer>

</body>
</html>
