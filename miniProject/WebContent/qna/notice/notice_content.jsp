<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
#abc{
font-size: 10pt;

}
</style>
</head>
<body>
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
                  <a href="<%=request.getContextPath()%>/qnaNotice.do">공지사항</a>
               </p>
               <p>
                  <a href="<%=request.getContextPath()%>/qnaNotice2.do">일반게시판</a>
               </p>
               
            </div>
           
           
            <div class="col-sm-8 text-left">
          
               <table width="500" cellpadding="0" cellspacing="0" border="1" class="table" id="abc">
		<form action="modify.do" method="post" accept-charset="UTF-8">
			<input type="hidden" name="bId" value="${content_view.bId}">
			<tr>
				<td> 번호 </td>
				<td> ${content_view.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${content_view.bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" value="${content_view.bName}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" value="${content_view.bTitle}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" name="bContent" >${content_view.bContent}</textarea></td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="qnaNotice.do">목록보기</a> &nbsp;&nbsp; <a href="delete.do?bId=${content_view.bId}">삭제</a> &nbsp;&nbsp;</td>
			</tr>
		</form>
	</table>
            
	         </div>
	      </div>
	      </div>
</body>
</html>
