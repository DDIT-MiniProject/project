<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<h2>상품 삭제</h2>
<form name='frm' method="post" action="adminProductDelete.do">
 <div class="form-group">
      <label for="usr">상품번호:</label>
      <input type="text" class="form-control" name="pseq" value="${productVO.pseq }" readonly />
    </div>

<div class="form-group">
      <label for="usr">상품명:</label>
      <input type="text" class="form-control" name="name" value="${productVO.name }" readonly/>
      
    </div>
    
 <div class="form-group">
      <label for="usr">상품종류:</label>
      <input type="text" class="form-control" name="kind" value="${productVO.kind }" readonly/>
    </div>
    
 <div class="form-group">
      <label for="usr">가격:</label>
      <input type="text" class="form-control" name="price1" value="${productVO.price1 }" readonly/>
    </div>
    <br>
    
    <button type="submit" class="btn btn-default">삭제</button>
    <br> 
    
    

</form>

</body>
</html>
