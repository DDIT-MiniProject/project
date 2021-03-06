<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
  $(function(){
	$('#qnaBtn').click(function(){
	   $(location).attr('href','adminProductList.do');	
	});  
  
  });
  </script>
</head>
<body>
<br>


<form name="frm" method="post" enctype="multipart/form-data" action="adminProductInsert.do">
<div class="container">
<div id="center">
  <h2>상품 등록</h2>
  <h3>Taste is King</h3>            
  <table id="list" class="table table-condensed">
    <thead>
      <tr>
        <th width="100px">상품분류</th>
        <td><select name="kind">
        <c:forEach items="${kindList }" var="kind" varStatus="status">
          <option value="${status.count }">${kind }
          
          </option>
          
        </c:forEach>
        </select></td>
       <%--  <th>
        <c:choose>
        <c:when test="${kind eq '스페셜오퍼'}">
        <input type="text" name=kind value="12">
        </c:when>
        
        <c:when test="${kind eq '딜리버리팩'}">
        <input type="text" name=kind value="13">
        </c:when>
        
        
        <c:when test="${kind eq '딜리버리'}">
        <input type="text" name=kind value="12">
        </c:when>
        
        
        <c:when test="${kind eq '스페셜오퍼'}">
        <input type="text" name=kind value="12">
        </c:when>
        
        
        <c:when test="${kind eq '스페셜오퍼'}">
        <input type="text" name=kind value="12">
        </c:when>
        </c:choose>
        </th> --%>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>상품명</th>
        <td><input type="text" class="form-control" name="name"></td>
      </tr>
      <tr>
        <th>가격</th>
        <td><input type="text" class="form-control" name="price2"></td>
      </tr>
      <tr>
        <th>상세설명</th>
        <td><textarea class="form-control" name="content" ></textarea></td>
      </tr>
      <tr>
    <th>상품이미지</th>
    <td>
   
      <input type="file" name="image">
    </td>
  </tr>    
            
      </tbody>
      </table>
      
      <button type="submit" class="btn btn-default">등록</button>
      <button type="button" class="btn btn-default" id="qnaBtn">취소</button>
      </div>
      </div>
      </form>
</body>
</html>
