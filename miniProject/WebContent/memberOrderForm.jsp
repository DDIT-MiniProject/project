<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
<style>
table {
	border: 1px black solid;
}
</style>
</head>
<body>
	<form action="">
		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-2 sidenav">
					<p>
						<img src="<%=request.getContextPath()%>/images/버거킹회원유무.png"
							id="memberCheck">
					</p>
					<p>
						<a href="orderMenu.do">회원주문</a>
					</p>
					<p>
						<a href="<%=request.getContextPath()%>/orderForm.jsp">비회원주문</a>
					</p>
					<p>
                  		<a href="orderMenu.do">스페셜오퍼</a>
              		 </p>
				</div>
				<div class="col-sm-8 text-left">
					<table id="loginTable">
						<tr>
							<td colspan="4">
							<h1>BURGER KING 회원 주문</h1>
							</td>
						</tr>
						<tr>
							<td>
							<input type="button" class="btn btn-warning btn-lg"	value="주문하기" />
							<input type="button" class="btn btn-primary btn-lg"value="홈으로" onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/>
							</td>
						</tr>
					</table>
				 <c:forEach items="${productList}" var="productVO">
		   			<a href="#"><img src="<%=request.getContextPath()%>/images/specialmenu/${productVO.name }.png" width="180px" height="190px"></a>
   				 </c:forEach>
   				 
					<video src="<%=request.getContextPath()%>/video/콰트로치즈와퍼.mp4"controls="controls"
					width="1000" height="400" autoplay="autoplay" loop="loop"></video>
				</div>
			</div>
		</div>

	</form>

</body>
</html>
