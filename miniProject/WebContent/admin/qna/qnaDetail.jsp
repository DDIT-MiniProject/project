<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="/admin/header.jsp"%> --%>

<script type="text/javascript">
  $(function(){
	$('#qnaBtn').click(function(){
	   $(location).attr('href','adminQnaList.do');	
	});  
  
  });
  </script>

<br>
<br>
	<h1>Q&amp;A 답변</h1>
	<form name="frm" method="post" action="adminQnaReply.do?qseq=${qnaVO.qseq }">
		<input type="hidden" name="qseq">

		<div class="container">
			<table class="table">
				<thead>
				    <tr>
				     <th>글 번호</th>
				     <td><input type="text" class="form-control" name="qseq" value="${qnaVO.qseq }" readonly></td>
				    </tr>
					<tr>
						<th width="100px">제목  </th>
						<td >${qnaVO.subject}${qnaVO.rep}</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th>등록일</th>
						<td><fmt:formatDate value="${qnaVO.indate}" /></td>
					</tr>
				</thead>
				<thead>
					<tr>
						<th>내용</th>
						<td>${qnaVO.content}</td>
					</tr>
				</thead>
			</table>
			<c:choose>
			<c:when test="${qnaVO.rep=='1' }">
		
		
		<table id="orderList">
					
					<tr>
						<td colspan="2"><textarea name="reply" rows="7" cols="50"></textarea>
							<button type="submit" class="btn btn-default">저장</button></td>
					</tr>
				</table>
				<br>
			</c:when>
			<c:otherwise>
				<table id="orderList">
					<tr>
						<th>댓글:</th>
						<td>${qnaVO.reply}</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>

<button type="button" class="btn btn-default" id="qnaBtn">목록</button>
</div>
</form>






<%-- <%@ include file="/admin/footer.jsp"%> --%>
</body>
</html>
