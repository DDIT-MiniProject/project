<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
  .input-group{width:400px}
 
  </style>
  <script type="text/javascript">
  $(function(){
	$('#savebtn').click(function(){
	   $(location).attr('href','adminOrderSave.do');	
	});  
  
  });
  </script>

 

  <div class="container">
  <h2>주문리스트</h2>
  <form name="frm" method="post" action="adminOrderSearch.do">
<div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-shopping-cart"></i></span>
      <input id="email" type="text" class="form-control" name="key" placeholder="주문자 성명">
    </div>
    <br>
    <button type="submit" class="btn btn-default">검색</button>
    
    
    
                                                                                      
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>배송번호(배송여부)</th>
        <th>주문자</th>
        <th>상품명</th>
        <th>수량</th>
        <th>우편번호</th>
        <th>배송지</th>
        <th>전화</th>
        <th>주문일</th>
      </tr>
    </thead>
     <tbody>
   <c:forEach items="${orderList}" var="orderVO">
  <tr>
    <td>
      <c:choose>
        <c:when test='${orderVO.result=="1"}'>
        <span style="font-weight: bold; color: red">${orderVO.odseq}</span>
        (<input type="checkbox" name="result" value="${orderVO.odseq}"> 미처리)
        </c:when>
        <c:otherwise>
          <span style="font-weight: bold; color: green">${orderVO.odseq}</span>
          (<input type="checkbox" checked="checked" disabled="disabled">처리완료)
        </c:otherwise>
      </c:choose>
    </td>
    <td>${orderVO.mname}</td> <td>${orderVO.pname}</td>
    <td>${orderVO.quantity}</td> <td>${orderVO.zipNum}</td>
    <td>${orderVO.address}</td>  <td>${orderVO.phone}</td>
    <td><fmt:formatDate value="${orderVO.indate}" /></td>
  </tr>
  </c:forEach>
  </tbody>
  </table>
  
  <input type="button" class="btn btn-default" style="width: 200px"
      value="배송처리(입금확인)" id="savebtn">
    
     </div>    
</form>
     
     </div>
     
    
     
      
      
    
    
    
    </body>
    
   
    </html>

  






















