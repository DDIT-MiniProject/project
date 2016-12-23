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
<script type="text/javascript">
$(function(){
	$('#totalBtn').click(function(){
		$(location).attr('href', 'adminProductInsertForm.do');
	});
});
</script>
<div class="container">
	<h2>상품리스트</h2>
	<form name="frm" method="post"
		action="adminProductSearch.do?tpage=${tpage }">
		<div class="input-group">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-gift"></i></span> <input id="email" type="text"
				class="form-control" name="key" placeholder="상품명">
		</div>
		<Br>
		<button type="submit" class="btn btn-default">검색</button>
		<button type="button" class="btn btn-default" id="totalBtn">상품등록</button>
		


		<div class="table-responsive">
			<table class="table">

				<thead>
					<tr>
						<th>번호</th>
						<th>상품분류</th>
						<th>상품명</th>
						<th>가격</th>
						<th>제품등록일</th>
						<th>구분<th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${productList.size()<=0 }">
							<tr>
								<td width="100%" colspan="5" align="center">등록된 상품이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>

							<c:forEach items="${productList }" var="productVO">
								<tr>
									<td align="center">${productVO.pseq }</td>
									
									
									<td><c:choose><c:when test="${productVO.kind eq '12'}">스페셜오퍼</c:when>
									<c:when test="${productVO.kind eq '13'}">딜리버리팩</c:when>
									<c:when test="${productVO.kind eq '14'}">세트메뉴</c:when>
									<c:when test="${productVO.kind eq '15'}">버거</c:when>
									<c:when test="${productVO.kind eq '16'}">사이드</c:when>
									<c:when test="${productVO.kind eq '17'}">드링크</c:when>
									<c:otherwise>${productVO.kind }</c:otherwise>
									</c:choose>
									</td>
									<td><a href="#"
										onClick="go_detail('${tpage}', '${productVO.pseq}')">
											${productVO.name} </a></td>
									<td><fmt:formatNumber value="${productVO.price2}" /></td>
									<td><fmt:formatDate value="${productVO.indate}" /></td>
									<td><a href="adminProductUpdateForm.do?pseq=${productVO.pseq }">수정</a>
									/<a href="adminProductDeleteForm.do?pseq=${productVO.pseq }">삭제</a></td>
								</tr>
							</c:forEach>

							<tr>
								<td colspan="5" style="text-align: center;">${paging}</td>
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
























