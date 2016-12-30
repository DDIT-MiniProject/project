<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BURGERKING MENU</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
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
.modal-body{
	margin-left: 130px;
}
</style>
<script>
function cart_go(pk,idx){
	var id = "cnt"+idx;
	var su = document.getElementById(id).value;
	location.href="cartInsert.do?pseq="+pk+"&quantity="+su;
};
function order_go(){
	location.href="orderForm.do";
}
</script>
</head>
<body>
   <form action="">
      <div class="container-fluid text-center">
         <div class="row content">
            <div class="col-sm-2 sidenav">
               <p>
                  <img src="images/menu2.png" id="memberCheck">
               </p>
               <p>
                  <a href="menuForm.do">스페셜오퍼</a>
               </p>
               <p>
                  <a href="deliveryPack.do">딜리버리팩</a>
               </p>
               <p>
                  <a href="setMenu.do">세트메뉴</a>
               </p>
               <p>
                  <a href="burgerMenu.do">버거</a>
               </p>
               <p>
                  <a href="sideMenu.do">사이드</a>
               </p>
               <p>
                  <a href="drinkMenu.do">드링크</a>
               </p>
            </div>
            
            <div class="container">
            <div class="col-sm-8 text-left">
            	<strong><h2>사이드메뉴 SIDE MENU</h2></strong>
               <p>
                  <img src="images/주문시유의사항.png" id="warning">
               </p>
               <div>
               	  <%-- <a href="#"><img src="<%=request.getContextPath()%>/images/delivery/듀오팩.png" width="180px" height="190px"></a>
               	  <a href="#"><img src="<%=request.getContextPath()%>/images/delivery/싱글팩.png" width="180px" height="190px"></a> --%>
               	  
               	  <c:forEach items="${productList}" var="productVO">
  
     			 <%-- <a href="menuDetail.do?pseq=${productVO.pseq }"><img src="images/menu/${productVO.name }.png" width="180px" height="190px"></a> --%>
     			 <a href="#" data-toggle="modal"	data-target="#${productVO.pseq }"><img	src="images/menu/${productVO.name }.png" width="150px"
								height="170px"></a>
							<!-- Modal -->
							<div class="modal fade" id="${productVO.pseq }" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">${productVO.name }</h4>
										</div>
										<div class="modal-body">
											<img src="./images/menu/${productVO.name }.png" width="300px" height="320px" /><br>
											<span>
											
											수량 : <select name="quantity" id="cnt${status.index }">
	              									<c:forEach var="i" begin="1" end="10">
	              										<option>${i}</option>
	              									</c:forEach>
              									</select>&nbsp;&nbsp;
              								
											<button type="button" class="btn btn-warning btn-lg" onclick="cart_go(${productVO.pseq},${status.index })">장바구니</button>&nbsp;&nbsp;
											<button type="button" class="btn btn-primary btn-lg" onclick="order_go()">주문하기</button>
											</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>

   				 </c:forEach>
   				 </div>
               	  
               	 </div>
            </div>
         </div>
      </div>

   </form>

</body>
</html>
