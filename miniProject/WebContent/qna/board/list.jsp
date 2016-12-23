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
   <div class="container-fluid text-center">
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
               <p>
                  <a href="<%=request.getContextPath()%>/qna/board/list.jsp">일반게시판</a>
               </p>
               
               
            </div>
           
           
            <div class="col-sm-8 text-left">
          
               
               
				  <h1><strong>FAQ</strong></h1>



				<table width="500" cellpadding="0" cellspacing="0" border="1">
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>날짜</td>
						<td>히트</td>
					</tr>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.bId}</td>
							<td>${dto.bName}</td>
							<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach>
								<a href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
							<td>${dto.bDate}</td>
							<td>${dto.bHit}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><a href="write_view.do">글작성</a></td>
					</tr>
				</table>








			</div>
      </div>
      </div>

   </form>

</body>

</html>

