<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   
<script>
function menu_go(){
	location.href="menuForm.do";
};
function update_go(pk,idx){
	var id = "cnt"+idx;
	var su = document.getElementById(id).value;
	location.href="cartUpdate.do?cseq="+pk+"&cnt="+su;
};
function delte_go(){
	location.href="deleteCart.do?cseq=${cartVO.cseq }";
};
function order_go(){
	location.href="orderForm.do";
}
</script>
<style>

.input-group {
	width: 400px
}
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
   height: 450px
}

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
   .row.content {
      height: auto;
   }
}
#memberCheck{
   width: auto;
}
#loginTable{
   padding: auto;
   margin: auto;
   width: 80%;
   color: gray;
}

table{
	text-align : center;
}

table #total{
	text-align : right;
}
table .total{
	height : 50px;
	font-size: 20px;
	font-weight: bold;
}
table th{
	text-align : center;
	width : 1px;
}
</style>

</head>
<body>
<c:if test="${!empty sessionScope.message }">
	<script>
		alert('${message}');
	</script>	
	<c:remove var="message" scope="session"/>
</c:if>

<form action="">
      <div class="container-fluid text-center">
         <div class="row content">
            <div class="col-sm-2 sidenav">
               <p>
                  <img src="<%=request.getContextPath()%>/images/cart_sub.png" id="memberCheck">
               </p>
              
            </div>
            <div class="col-sm-8 text-left">
            	<h1>장바구니</h1>
				<hr color="grey"/>
				<ul>
					<li>주문서를 작성하기 전에 선택하신 상품명, 수량 및 가격이 정확한지 확인해 주세요.</li>
					<li>비회원의 경우 장바구니에 담긴 상품은 브라우저 종료 시 자동으로 삭제되오니, 상품 리스트를 보관하시려면 회원가입 후 장바구니에 보관하여 주시기 바랍니다.</li>
					<li>버거킹 딜리버리 서비스는 배달 가능 주소 내 서비스를 제공합니다. 배달주소 변경 시 장바구니 상품은 삭제됩니다.
					<li>버거킹 최소 배달 금액은 8,000원 입니다.</li>
				</ul>
				<hr color="grey"/>
				<table class="table">
					<tr>
						<th>상품명</th>
						<th>수량</th>
						<th>상품가격</th>
						<th>비고</th>
						
						<c:forEach items="${cartList}" var="cartVO" varStatus="status">
						<tr>
							<td><img src="<%=request.getContextPath()%>/images/menu/${cartVO.pname }.png" width="30px" height="30px"/>${cartVO.pname }</td>
							<%-- <td>${cartVO.quantity }</td> --%>
							<td>
							<select name="quantity" id="cnt${status.index }">
	              					<c:forEach var="i" begin="1" end="10">
	              						<c:choose>
	              							<c:when test="${cartVO.quantity eq i }">
	              								<option selected=${i }>${i }</option>
	              							</c:when>
	              							<c:otherwise>
	              								<option>${i}</option>
	              							</c:otherwise>
	              						</c:choose>
	              					</c:forEach>
              					</select>
              				</td>
							<td>${cartVO.price2*cartVO.quantity }원</td>
							<td><a href="#" onclick="update_go(${cartVO.cseq},${status.index })">수정</a>/<a href="deleteCart.do?cseq=${cartVO.cseq }">삭제</a></td>
							<!-- <td>
								<button type="button" class="btn btn-warning btn-sm" onclick="">수정</button>/
								<button type="button" class="btn btn-primary btn-sm" onclick="delete_go()">삭제</button>
							</td> -->
						</tr>
						
						</c:forEach>
						<tr class="total">
							<td colspan=3 id="total">총가격  :</td>
							<td>${totalPrice }원</td>
							
						</tr>
						<tr height="50">
							<td colspan="4">
								<button type="button" class="btn btn-warning btn-sm" onclick="menu_go()">메뉴로 돌아가기</button>&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-primary btn-sm" onclick="order_go()">주문하기</button>
							</td>
						</tr>
						
					</tr>
				</table>
            </div>
         </div>
      </div>

   </form>



</body>
</html>
