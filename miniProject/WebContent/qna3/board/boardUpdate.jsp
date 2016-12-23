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
<h1>상품수정</h1>  
<form name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="pseq" value="${productVO.pseq}">
<input type="hidden" name="code" >
<input type="hidden" name="nonmakeImg" value="${productVO.image}">
<table id="list">
  <tr>
    <th>상품분류</th>
    <td colspan="5">
    <select name="kind">
      <c:forEach items="${kindList}" var="kind" varStatus="status">
        <c:choose>
          <c:when test="${productVO.kind==status.count}">
            <option value="${status.count}" selected="selected">${kind}</option>
          </c:when>
          <c:otherwise>
            <option value="${status.count}">${kind}</option>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </select> 
    </td>
  </tr>
  <tr>
    <th>상품명</th>
    <td width="343" colspan="5">
      <input type="text" name="name" size="47" maxlength="100" value="${productVO.name}">
    </td>
  </tr>
  <tr>
    <th>원가[A]</th>
    <td width="70">        
      <input type="text" name="price1" size="11" onKeyUp='NumFormat(this)' value="${productVO.price1}">
    </td>
    <th>판매가[B]</th>
    <td width="70">
      <input type="text" name="price2" size="11" onBlur="go_ab()" onKeyUp='NumFormat(this)' value="${productVO.price2}">
    </td>
    <th>[B-A]</th>
    <td width="72">
      <input type="text" name="price3" size="11" readonly onKeyUp='NumFormat(this)'>
    </td>
  </tr>
  <tr>
    <th>베스트상품</th>
    <td>
      <c:choose>
        <c:when test='${productVO.bestyn=="y"}'>
          <input type="checkbox" name="bestyn" value="y" checked="checked">
        </c:when>
        <c:otherwise>
          <input type="checkbox" name="bestyn" value="n">
        </c:otherwise>
      </c:choose>
    </td>        
    <th>사용유무</th>
    <td>
      <c:choose>
        <c:when test='${productVO.useyn=="y"}'>
          <input type="checkbox" name="useyn" value="y" checked="checked">
        </c:when>
      <c:otherwise>
        <input type="checkbox" name="useyn" value="n">
      </c:otherwise>
    </c:choose>
    </td>
  </tr>
  <tr>
    <th>상세설명</th>
    <td colspan="5">
      <textarea name="content" rows="8" cols="70" >${productVO.content}</textarea>
    </td>
  </tr>
  <tr>
    <th>상품이미지</th>
    <td colspan="5">
      <img src="<c:url value="/product_images"/>/${productVO.image}" width="200pt" />     
      <br>
      <input type="file" name="image">
    </td> 
  </tr>    
</table>
<input class="btn" type="button" value="수정" onClick="go_mod_save('${tpage}','${productVO.pseq}')">           
<input class="btn" type="button" value="취소" onClick="go_mov()">
</form> 
</article>
               




			</div>
      </div>

   </form>

</body>
</html>
