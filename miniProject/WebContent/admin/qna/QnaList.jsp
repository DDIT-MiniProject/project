<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <Br>
  <br>
  <h2>Q&amp;A 리스트</h2>                                                                                      
  <div class="table-responsive">   
  <form>       
  <table class="table">
    <thead>
      <tr>
				<th>번호(답변여부)</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${qnaList}" var="qnaVO">
      <tr>
					<td>${qnaVO.qseq} <c:choose>
							<c:when test='${qnaVO.rep=="1"}'>(미처리)</c:when>
							<c:otherwise>(답변처리완료)</c:otherwise>
						</c:choose>
					</td>
					<td><a href="adminQnaDetail.do?qseq=${qnaVO.qseq}">
							${qnaVO.subject} </a></td>
					<td>${qnaVO.id}</td>
					<td><fmt:formatDate value="${qnaVO.indate}" /></td>
				</tr>
			</c:forEach>
    </tbody>
  </table>
  </form>
  </div>

</div>


</body>
</html>
