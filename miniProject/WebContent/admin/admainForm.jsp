<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta charset="utf-8">
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 	function savebtnClick(form){
 		form.action="adminOrderList.do";
 		form.method='post';
 		form.submit();
 	}
  </script>
  <style>
  #maintable{
  width:0px;
  margin:auto;
  }
  
  
  </style>
</head>
<body>
<form>
<h1 style="text-align:center">Admin Main</h1>
<hr>
<table id="maintable">
<tr>
<td>
  
<h3>주문 리스트 <span class="label label-danger">${orderResult }</span>  <input type="button" class="btn btn-default" style="width: 100px"
      value="더보기" id="savebtn" onclick="savebtnClick(this.form);"> </h3>      
  <table class="table">
    <thead>
      <tr>
        <th>주문번호(결제여부)</th>
        <th>주문자</th>
        <th>상품명</th>
        <th>전화</th>
        <th>주문일</th>
      </tr>
    </thead>
     <tbody>
   <c:forEach items="${orderList}" var="orderVO">
  <tr>
    <td>
      <c:choose>
        <c:when test='${orderVO.result=="1"}'>
        <span style="font-weight: bold; color: red">${orderVO.odseq}</span>
        (<input type="checkbox" name="result" value="${orderVO.odseq}" disabled="disabled"> 미처리)
        </c:when>
        <c:otherwise>
          <span style="font-weight: bold; color: green">${orderVO.odseq}</span>
          (<input type="checkbox" name="result" checked="checked" disabled="disabled">처리완료)
        </c:otherwise>
      </c:choose>
    </td>
    <td>${orderVO.mname}</td> <td>${orderVO.pname}</td>
   <td>${orderVO.phone}</td>
    <td><fmt:formatDate value="${orderVO.indate}" /></td>
  </tr>
  </c:forEach>
  </tbody>
  </table>
  
 
    
   
     
     </td>
     <td>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </td>
     <td>
     <h3>Qna 리스트 <span class="label label-danger">${qnaResult }</span>  <input type="button" class="btn btn-default" style="width: 100px"
      value="더보기" id="savebtn" onclick="savebtnClick(this.form);"> </h3>   
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
     </td>
     
     </table>  

     </form>
 
    

</body>
</html>