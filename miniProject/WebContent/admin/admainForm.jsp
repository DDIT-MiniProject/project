<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta charset="utf-8">
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #tt{width:30px}
 
  </style>
</head>
<body>
 <form name="frm" method="post" action="adminMemberList.do">
<div class="container">
 <br>
  <div class="well">
 
	  <h1><strong>환영합니다. 'Admin'님.</strong></h1>
  	  <h3>오늘 하루 기분은 어떠신가요???</h3>
  <button type="submit" class="btn btn-success">Manage Users>></button>
  </div>
</div>

<table class="table table-hover">
    <thead>
      <tr>
        <th><h3><strong>Total Users</strong></h3></th>
        <th><h3><strong>New Orders</strong></h3></th>
        <th><h3><strong>New Q&amp;A</strong></h3></th>
      </tr>   
    </thead>
     <tbody>
      <tr>
        <td> <span class="badge"><h3>${result }</h3></span></td>
        <td> <span class="badge"><h3>12</h3></span></td>
        <td> <span class="badge"><h3>12</h3></span></td>
      </tr>
      </tbody>
    </table>
    <br><br>
    <h1>Pending Users</h1>
    <table class="table table-bordered">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Email</th>
        <th>Email</th>
        <th>Email</th>
      </tr>
    </thead>
     <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
        <td><button type="button" class="btn btn-success">Success</button><br>
        <button type="button" class="btn btn-danger">Danger</button>
        </td>
      </tr>
      </tbody>
    </table>
    
    
    
</form>
</body>
</html>
