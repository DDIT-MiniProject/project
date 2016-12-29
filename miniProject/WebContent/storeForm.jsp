<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 유무 확인 페이지</title>
<script type="text/javascript">
function searchCheck(form){
	var key = form.key.value;
	form.action = "searchStore.do?key="+key;
	form.submit();
}

</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=xVmefpl0uQOwv3mBNFn_"></script>
	
	
<style>
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
}
table{
	width:90%; 
	cellpadding:5; 
	cellspacing:0;
	border:1; 
	align:center;
	border-collapse:collapse; 
	border:1px gray solid;
}
#dd {
	margin-top: 30px;
	margin-left: 60px;
}
#map{
	margin-left: center;
	margin: auto;
}
</style>
</head>
<body>
	<form>
		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-2 sidenav">
					<p>
						<img src="<%=request.getContextPath()%>/images/storeSearch.png">
					</p>
					<p>
						<a href="<%=request.getContextPath()%>/storeForm.jsp">배달매장찾기</a>
					</p>
					<p>
						<%-- <a href="<%=request.getContextPath()%>/orderForm.jsp">비회원주문 /</a> --%>
						<a href="<%=request.getContextPath()%>/menuForm.do">회원주문</a>
					</p>
				</div>
				<div class="col-sm-8 text-left" id="dd">
					<h1>BURGER KING 배달매장찾기</h1>
					<h3>해당 주소를 입력하세요</h3>
				<table>
					<tr>
						<td>
							<input type="text" name="key" placeholder="동을 입력해주세요" /> 
							<input class="btn btn-danger btn-md" type="button" value="검색" onclick="searchCheck(this.form)" />
	      				</td>
	      			</tr>
	      		</table>
	      		<table>
					<tr>
    					<th>매장명</th>
    					<th>주소</th>
    					<th>이용가능시간</th>
    					<th>매장위치</th>
    				</tr>
    			<c:forEach var="store" items="${storeList }" varStatus="status">
					<tr>
    					<td>${store.name }</td>
    					<td>${store.address }</td>
    					<td>${store.time }</td>
    					<td><a href='${store.url }' target="_blank" class='button h25 white w60'>확인하기</a></td>
    				</tr>
    			</c:forEach>
    				<tr>
    					<td colspan="6" style="text-align: center;"> ${paging} </td>
    				</tr>
    				<tr>
    				<td colspan="3">
					<%-- <video src="<%=request.getContextPath()%>/video/통새우와퍼.mp4"width="700" height="400" autoplay="autoplay"></video> --%>
					
					</td>
					</tr>
				</table>
				</div>
			</div>
		</div>
		<div id="map" style="width: 1100px; height: 400px;"></div>

	</form>
	
	<!--                                                           -->
	<script>
	//이곳에서 작업이 이루어져서 div에 뿌려주면되는데... id = map x,y값 입력해서 map 뿌려줘보자.
	var mapOptions = {
			center : new naver.maps.LatLng(36.3509397, 127.3873025),
			zoom : 20
			
		} 
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(36.3509397, 127.3873025),
		    zoom: 20
		});

		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(36.3509397, 127.3873025),
		    map: map,
		    icon: '<%=request.getContextPath()%>/images/pin.png'
		});
	</script>
<!--                                                           -->
</body>
</html>
