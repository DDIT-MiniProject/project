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
						<h1>상품등록</h1>  
						<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
						인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
						<form name="frm" method="post" enctype="multipart/form-data">
						<table id="list">
						<tr>
						  <th>상품분류</th>
						  <td colspan="5">
						  <select name="kind">
						    <c:forEach items="${kindList}" var="kind" varStatus="status">
						      <option value="${status.count}">${kind}</option>
						   </c:forEach>
						  </select>      
						<tr>
						  <th>상품명</th>
						  <td width="343" colspan="5">
						       <input type="text" name="name" size="47" maxlength="100" value="킬힐">
						  </td>
						</tr>
						<tr>
						  <th>원가[A]</th>
						  <td width="70">
						    <input type="text" name="price1" size="11" onKeyUp='NumFormat(this)' value="10000">
						  </td>
						  <th>판매가[B]</th>
						  <td width="70">
						     <input type="text" name="price2" size="11" onBlur="go_ab()" onKeyUp='NumFormat(this)' value="20000">
						  </td>
						  <th>[B-A]</th>
						    <td width="72">
						      <input type="text" name="price3" size="11" readonly onKeyUp='NumFormat(this)'>
						    </td>
						  </tr>
						    
						  <tr>
						    <th>상세설명</th>
						    <td colspan="5">
						      <textarea name="content" rows="8" cols="70" >이뻐요</textarea>
						    </td>
						  </tr>
						  <tr>
						    <th>상품이미지</th>
						    <td width="343" colspan="5">
						<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
						      <input type="file" name="image">
						    </td>
						  </tr>    
						</table>
						<input class="btn" type="button" value="등록" onClick="go_save()">           
						<input class="btn" type="button" value="취소" onClick="go_mov()">
						</form> 
						</article>





			</div>
      </div>

   </form>

</body>
</html>
