<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">      
<meta charset="utf-8">
<title>비밀번호 찾기</title>
<style type="text/css">
body{
	background: black;
	color: white;
}
#idd{
	color: black;
}
#popup{   
    padding: 0 10px;
    padding-top: auto;
	font-family: "1훈하얀고양이" ,"Times New Roman", Georgia, Serif;
	font-size: 15pt;
	background: black; 
}
#popup h1 {
   font-family: "Times New Roman", Times, serif;
   font-size: 45px;
   color: #CCC;
   font-weight: normal;
}
table#idcode {
    border-collapse:collapse;    /* border 사이의 간격 없앰 */   
    border-top: 3px solid  #fff;  
    border-bottom: 3px solid  #fff;
    width: 100%;  
    margin-top: 15px; 
}
table#idcode th, table#idcode td{   
   text-align: center;
   border-bottom: 1px dotted  #fff;  
   color:#FFF;   
}
table th, td{
  padding: 10px;
}
table#idcode  a{
    display:block; 
    height:20px;
    text-decoration:none;
    color:#fff;
    padding: 10px;
}
table#zipcode a:hover{
    color: #F90;
    font-weight: bold;
}
</style>
<script type="text/javascript">
function result(pwd,name,email,phone) {
	/* alert(zipNum); */
   	  opener.document.form.pwd.value=pwd;
	  opener.document.form.name.value=name
	  /* +" "+email+" "+phone; */
   self.close();
};
</script>
</head>
<body>
<div id="popup">
  <h1>아이디로 회원정보 찾기</h1>
  <form method=post name=formm action="findPwd.do">
    아아디 : <input name="id" type="text" id="idd">
            <input type="submit" value="찾기"  class="submit">
  </form>
  <table id="idcode">
    <tr>
      <th>패스워드</th>
      <th>이름</th>
      <th>이메일</th>
      <th>연락처</th>
    </tr>
    <c:forEach items="${memberList}" var="MemberVO">
    <tr>
      <td>${MemberVO.pwd}</td>
        <td>
<a href="#" onclick="return result('${MemberVO.name}','${MemberVO.email}', '${MemberVO.phone}'">
           ${MemberVO.name} ${MemberVO.email} ${MemberVO.phone} 
          </a>
        </td>
    </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>
