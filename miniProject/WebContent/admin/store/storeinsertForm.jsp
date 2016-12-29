<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function searchCheck(form){
	
	form.action = "adminStoreSearch.do";
	form.submit();
}		
</script>
<style>
#fmt{
 width:600px;
 margin:auto;
}
</style>
</head>
<body>
<form id="fmt" method="post" action="adminStoreInsert.do">
<h2>신규 매장 등록</h2>
<br>
  <div class="form-group">
    <label for="email">매장명:(예:xx점)</label>
    <input type="text" class="form-control" name="name">
  </div>
  <div class="form-group">
    <label for="pwd">주소 :</label>
    <input type="text" class="form-control" name="address">
  </div>
  <div class="form-group">
    <label for="pwd">이용 가능 시간:(예:10:00~23:00)</label>
    <input type="text" class="form-control" name="time">
  </div>
  
  <button type="submit" class="btn btn-default">등록</button>
  <button type="button" class="btn btn-default" onclick="searchCheck(this.form)">돌아가기</button>
</form>



</body>
</html>