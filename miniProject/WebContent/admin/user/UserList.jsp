<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.input-group {
	width: 400px
}
</style>

<div class="container">
	<h2>회원리스트</h2>
	<form name="frm" method="post" action="adminMemberSearch.do">
		<div class="input-group">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-user"></i></span> <input id="email" type="text"
				class="form-control" name="key" placeholder="회원명">
		</div>
		<Br>
		<button type="submit" class="btn btn-default">검색</button>




		<div class="table-responsive">
			<table class="table">

				<thead>
					<tr>
						<th>아이디(탈퇴여부)</th>
						<th>이름</th>


						<th style="width: 400px">주소</th>
						<th>전화</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${memberList.size()<=0 }">
							<tr>
								<td width="100%" colspan="5" align="center">회원이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>

							<c:forEach items="${memberList }" var="memberVO">
								<tr>
									<td><a href="#" data-toggle="modal"
										data-target="#${memberVO.id }">${memberVO.id}</a>
										<div class="modal fade" id="${memberVO.id }" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h2 class="modal-title">회원 상세 정보</h2>
													</div>
													<div class="modal-body">
													<div class=""table-responsive">
														<table id="list" class="table">

															<tbody>
																<tr>
																	<th style="width: 200px">아이디(탈퇴여부)</th>
																	<td>${memberVO.id}<c:choose>
																			<c:when test='${memberVO.useyn=="y"}'>
																				<input type="checkbox" name="useyn"
																					disabled="disabled">
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" name="useyn"
																					checked="checked" disabled="disabled">
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
														<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
														</div>
													</div>
												</div>
											</div>
										</div> <c:choose>
											<c:when test='${memberVO.useyn=="y"}'>
												<input type="checkbox" name="useyn" disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="useyn" checked="checked"
													disabled="disabled">
											</c:otherwise>
										</c:choose></td>
									<td>${memberVO.name}</td>

									<td>${memberVO.address}</td>
									<td>${memberVO.phone}</td>

								</tr>
							</c:forEach>

							<tr>
								<td colspan="4" style="text-align: center;">${paging}</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</form>
</div>
</body>
</html>
























