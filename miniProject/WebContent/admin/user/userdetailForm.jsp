<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<br>


	<form name="frm" method="post" enctype="multipart/form-data"
		action="adminProductInsert.do">
		<div class="container">
			<div id="center">
				<h2>회원상세정보</h2>
				<h3>Taste is King</h3>
				<table id="list" class="table table-condensed">
					
					<tbody>
						<tr>
							<th style="width:200px">아이디(탈퇴여부)</th>
							<td>${memberVO.id}<c:choose>
									<c:when test='${memberVO.useyn=="y"}'>
										<input type="checkbox" name="useyn" disabled="disabled">
									</c:when>
									<c:otherwise>
										<input type="checkbox" name="useyn" checked="checked"
											disabled="disabled">
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${memberVO.name }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${memberVO.email }</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>${memberVO.zipNum }</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${memberVO.address }</td>
						</tr>
						<tr>
							<th>전화</th>
							<td>${memberVO.phone }</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td><fmt:formatDate value="${memberVO.indate}" /></td>
						</tr>

					</tbody>
				</table>


				<button type="button" class="btn btn-default" id="qnaBtn">취소</button>
			</div>
		</div>
	</form>
</body>
</html>
