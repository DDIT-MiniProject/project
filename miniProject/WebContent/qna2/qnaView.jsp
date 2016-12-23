<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 유무 확인 페이지</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
#container{
   padding: auto;
   margin: auto;
   width: 80%;
   height: 80%;
   color: gray;
   border: 1px solid blue;
}
</style>
</head>
<body>
   <form action="">
   <div class="container-fluid text-center">
         <div class="row content">
            <div class="col-sm-2 sidenav">
               <p>
                  <img src="<%=request.getContextPath()%>/images/FAQ2.png" id="memberCheck">
               </p>
               <p>
                  <a href="<%=request.getContextPath()%>/qnaView.do">FAQ</a>
               </p>
               <p>
                  <a href="<%=request.getContextPath()%>/qnaNotice.do">공지사항</a>
               </p>
               <p>
                  <a href="<%=request.getContextPath()%>/qna/board/list.jsp">일반게시판</a>
               </p>
               
               
            </div>
           
           
            <div class="col-sm-8 text-left">
          
               
               
				  <h1><strong>FAQ</strong></h1>
				  
					<div class="container">
					  <h2>자주 묻는 질문</h2>
					  <div class="panel-group">
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" href="#collapse1">Q 매장에서 판매하는 모든 메뉴를 배달하나요?</a>
					        </h4>
					      </div>
					      <div id="collapse1" class="panel-collapse collapse">
					        <div class="panel-body">배달이 어려운 일부 디저트 메뉴를 제외하고, 버거킹 매장에서 판매하고 있는 대부분의 제품을 배달해 드리고 있습니다. 
					        메뉴 창에서 주문이 가능한 제품을 확인하실 수 있습니다.</div>
					      </div>
					    </div>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Q 주문 가능한 최소 금액이 있나요?</a>
					        </h4>
					      </div>
					      <div id="collapse2" class="panel-collapse collapse">
					        <div class="panel-body">예, 버거킹 딜리버리 서비스는 최소 주문 금액제도에 따라, 8000원 이상 주문 시에 서비스 받으실 수 있습니다.</div>
					      </div>
					    </div>
					    <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Q 가격은 어떻게 확인이 가능한가요?</a>
					        </h4>
					      </div>
					      <div id="collapse3" class="panel-collapse collapse">
					        <div class="panel-body">제품 주문 시에 가격을 확인할 수 있으며, 버거킹 가격 정책에 따라 매장 가격과 배달 시 가격은 다르게 책정되어 있습니다.</div>
					      </div>
					    </div>
					     <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Q 배달 가능한 시간은 어떻게 되는지요?</a>
					        </h4>
					      </div>
					      <div id="collapse4" class="panel-collapse collapse">
					        <div class="panel-body">전매장이 동일하게 오전 10시에서 오후 10시까지 딜리버리 서비스를 제공하고 있습니다. 매장 상황에 따라 배달이 어려운 경우 주문시 안내를 드리고 있으며, 
					        기상 악화시에는 배달 라이더들의 안전을 위해 배달이 중단, 제한, 지연 될 수 있습니다.</div>
					      </div>
					    </div>
					     <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Q 배달 시간이 얼마나 걸리나요?</a>
					        </h4>
					      </div>
					      <div id="collapse5" class="panel-collapse collapse">
					        <div class="panel-body">버거킹 딜리버리 서비스의 배달 시간은 기상조건이나 주문량 및 매장 상황에 따라 소요 시간이 다르며, 
					        고객님의 주문 시에 배달 가능한 예상 시간을 미리 안내드리고 있습니다. 안내 드린 시간 내 음식을 제공할 수 있도록 노력하겠습니다.</div>
					      </div>
					    </div>
					     <div class="panel panel-default">
					      <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Q 주문을 변경,취소하고 싶은데 가능하나요?</a>
					        </h4>
					      </div>
					      <div id="collapse6" class="panel-collapse collapse">
					        <div class="panel-body">완료된 주문의 취소, 변경을 원하시는 경우 1599-0505로 연락 후 가능 여부를 확인받으실 수 있습니다.</div>
					      </div>
					    </div>
					    
					  </div> 
					
					</div>
				  
				  
				  
				  
               
            
            
            
         </div>
      </div>
      </div>

   </form>

</body>
</html>
