<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaview</title>

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
         <div class="row content">
            <div class="col-sm-2 sidenav">
               <p>
                  <img src="<%=request.getContextPath()%>/images/FAQ2.png" id="memberCheck">
               </p>
               <p>
                  <a href="<%=request.getContextPath()%>/qna/qnaView.jsp">FAQ</a>
               </p>
               <p>
                  <a href="<%=request.getContextPath()%>/qna/notice/notice.jsp">공지사항</a>
               </p>
               
               
               
            </div>
           
           
            <div class="col-sm-8 text-left">
          
               <article>
<h1>상품리스트</h1>	
<form name="frm" method="post">
<table>
  <tr>
  <td width="642">
      상품명 
     <input type="text" name="key">
     <input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
     <input class="btn" type="button" name="btn_total" value="전체보기 " onClick="go_total()">
     <input class="btn" type="button" name="btn_write" value="상품등록" onClick="go_wrt()">
  </td>
  </tr>
</table>
<table id="productList">
    <tr>
        <th>번호</th><th>상품명</th><th>원가</th><th>판매가</th><th>등록일</th><th>사용유무</th>
    </tr>
    <c:choose>
    <c:when test="${productListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        등록된 상품이 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>
	<c:forEach items="${productList}" var="productVO">
    <tr>
      <td height="23" align="center" >${productVO.pseq}</td>
      <td style="text-align: left; padding-left: 50px; padding-right: 0px;">   
        <a href="#" onClick="go_detail('${tpage}', '${productVO.pseq}')">
    	 ${productVO.name}     
   		</a>
   	  </td>
      <td><fmt:formatNumber value="${productVO.price1}"/></td>
      <td><fmt:formatNumber value="${productVO.price2}"/></td>
      <td><fmt:formatDate value="${productVO.indate}"/></td>
      <td>
      	<c:choose>
   	 		<c:when test='${productVO.useyn=="y"}'>사용</c:when>
   	 		<c:otherwise>미사용</c:otherwise>   	 		
   	 	</c:choose>	 
   	  </td> 
    </tr>
    </c:forEach>
    <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
	</c:otherwise>	
</c:choose>  
</table>
</form> 
</article>
               




			</div>
      </div>

   </form>

</body>
</html>
