<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>아이디 중복 체크</title>
<style type="text/css">
#wrap {
	margin: 0 20px;
	padding-top: auto;
	font-family: "1훈하얀고양이" ,"Times New Roman", Georgia, Serif;
	font-size: 15pt;
}
h1 {
	font-family: "Times New Roman", Times, serif;
	font-size: 45px;
	color: #CCC;
	font-weight: normal;
}
input[type=button], input[type=submit] {
	float: right;
}
</style>
<script type="text/javascript">
	function id_ok(form) {
		opener.form.id.value = "${id}";
		opener.form.reid.value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap">
		<h1>ID 중복확인</h1>
		<form method=post style="margin-right: 0" action="idCheckForm.do">
			User ID <input type=text name="id" value="${id}">
					<input type=submit value="검색" class="btn btn-warning btn-sm"><br>
				<div style="margin-top: 20px">
				<c:if test="${message == 1}">
					<script type="text/javascript">
						opener.document.formm.id.value =${id};
					</script>
        			${id}는 이미 사용중인 아이디입니다.
      			</c:if>
				<c:if test="${message==-1}">
       				${id}는 사용 가능한 ID입니다.
        	<input type="button" class="btn btn-warning btn-sm" value="사용하기" onclick="id_ok(this.form)">
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>
