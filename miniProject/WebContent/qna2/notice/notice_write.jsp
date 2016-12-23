<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#abc{
font-size: 30pt;

}
</style>
</head>
<body>
<form action="qnaWrite2.do" method="post">
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
					<tr>
						<td>이름 </td>
						<td><input type="text" name="bName" size = "50"> </td>
					</tr>
					<tr>
						<td>제목 </td>
						<td><input type="text" name="bTitle" size = "50"> </td>
					</tr>
					<tr>
						<td>내용 </td>
						<td><textarea name="bContent" rows="10" ></textarea> </td>
					</tr>
					<tr >
						<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="qnaNotice.do">목록보기</a></td>
					</tr>
				</table>
				
	        </div>
		</div>
	</div>
</form>

</body>
</html>
