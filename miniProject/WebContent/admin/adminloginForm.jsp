<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#aa{
  width: 400px; /* 정렬하려는 요소의 넓이를 반드시 지정 */
  margin: 0 auto;
}
</style>



</head>
<body>
<c:if test="${!empty message }">
	<script>
		alert('${message}');
	</script>	
</c:if>

<br>
<br>

<br>
<br>
<br>
<br>
<div class="container">
  <h3 text align="center">Admin Login</h3>
  <hr color="BLACK">
  <form id="aa" method="post" action="adminLogin.do">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="email" type="text" class="form-control" name="workerId" placeholder="ID">
    </div>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" name="workerPwd" placeholder="Password">
    </div>
    <br>
    <button type="submit" class="btn btn-default">Login</button>
    <button type="button" class="btn btn-default">Cancel</button>
    
    </form>
    </div>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<Br>
<br>
<br>
<Br>
  




</body>
</html>
