<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 찾기폼</title>
<script>
	function go_login(form){
		form.action="login.do";
		form.submit();
	}
	function go_mem(form){
		var url = "findPwd.do";
		window.open( url, "_blank_1","toolbar=no, menubar=no, scrollbars=yes,"
						+"resizable=no, width=550, height=300, top=300, left=300, ");
	}
</script>
<style>
#non_member_order {
	font-size: 40pt;
	font-weight: bold;
	text-align: center;
}

table {
	margin-left: 30%;
	margin: auto;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<form name="form" action="login.do">
		<table>
			<tr>
			<td>
				아이디:
				</td>
				<td><input type="text" name="id" id="id" size="20" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			<td>
				비밀번호:
				</td>
				<td><input type="text" name="pwd" id="pwd" size="20" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<!-- <tr>
				<td>이름:</td>
				<td><input type="text" name="name" id="name" size="20" /></td>
			</tr> -->
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					
				</td>
				<td>
					<input type="button" class="btn btn-warning btn-lg" value="로그인" onclick="go_login(this.form)"/>
					<input type="button" class="btn btn-primary btn-lg" value="비밀번호찾기" onclick="go_mem(this.form)">
					<input type="button" class="btn btn-danger btn-lg" value="HOME"onclick="location.href='<%=request.getContextPath()%>/index.jsp'"/>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2">
					<video src="<%=request.getContextPath()%>/video/할라피뇨.mp4"controls="controls"
					poster="<%=request.getContextPath()%>/images/videoMain.jpg"
					width="700" height="400" autoplay="autoplay" loop="loop"></video>
				</td>
				</tr>
		</table>
	</form>
</body>

</html>
