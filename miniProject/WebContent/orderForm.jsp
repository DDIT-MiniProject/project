<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 주문 | 버거킹 딜리버리</title>
<script>
/* 	function non_order_go(form){
		var test = document.getElementById('checkNonMember');
		if($(checkNonMember).prop("checked")){
			alert("주문완료되었습니다.");
		}else{
			alert("수집목적 동의에 체크를 해주세요");		
		}
	} */
	function mem_order_go(form){
		/*var test = document.getElementById('checkNonMember');
		 if(test.prop("checked")){
			alert("수집목적 동의에 체크를 해주세요");
			form.test.focus()
		}else if ($(checkNonMember).prop("checked")){
			return true; */
		if(!document.getElementById('checkNonMember').checked){
			alert("수집목적 동의에 체크를 해주세요");
		}else if(form.zipNum.value == ""){
			alert("주소를 검색하여 입력하여 주세요");
			form.searchAddr.focus()
		}else if(form.addr1.value == ""){
			alert("주소를 검색하여 입력해 주세요");
			form.searchAddr.focus()
		}else if(form.addr2.value == ""){
			alert("상세주소를 입력해 주세요");
			form.addr2.focus()
		}else if (form.phone1.value == ""){
			alert("연락처를 입력해 주세요");
			form.phone1.focus()
		}else if(form.phone2.value ==""){
			alert("연락처를 입력해 주세요");
			form.phone2.focus()
		}else{
			alert("주문완료되었습니다.");
			// 수정 해야됨 action --> order -- > DB insert
			form.action = "orderInsert.do";
			form.submit();
		}
	};
	function searchZip(form){
		  var url = "findZipNumm.do";
		  window.open( url, "_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300, top=300, left=300, ");
	};
	
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
	<form name="form" action="order.do">
		<table>
			<tr>
				<td colspan="10">
					<div id="non_member_order">
						<strong><span>버거킹 주문하기</span></strong>
					</div>
				</td>
			</tr>

			<tr>
				<td><h5>버거킹 이용약관</h5></td>
				<td><textarea title="버거킹 이용약관" rows="5" cols="70" readonly>
1.	수집하는 개인정보 항목
   	- 전화번호, 성명, 주소
   	
2.	수집 목적 
	① 성명, 주소: 제품의 전달, 청구서, 정확한 제품 배송지의 확보.
	
3.	개인정보 보유기간 
	① 계약 또는 청약철회 등에 관한 기록 : 6개월
	② 대금결제 및 재화 등의 공급에 관한 기록 : 1년
	③ 소비자의 불만 또는 분쟁처리에 관한 기록 : 1년
	
4.	비회원 주문 시 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 
	사용되지 않습니다.	
	기타 자세한 사항은 '개인정보취급방침'을 참고하여주시기 바랍니다.
		</textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input id="checkNonMember" type="checkbox" class="checkbox" />
					개인정보동의, 개인정보 수집 및 이용에 모두 동의합니다.</td>
				<td></td>
			</tr>
			<tr>
				<td><h5>주소 입력</h5></td>
				<td><input type="text" name="zipNum"  size="20" placeholder="우편번호(자동입력)" readonly/>
					<input type="button" name="searchAddr" class="btn btn-warning" value="주소검색" onclick="searchZip(this.form)"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="addr1"  size="33" placeholder="주소검색 버튼을 눌러주세요(자동입력)" readonly/>
					</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="addr2" size="33" placeholder="상세주소를 입력해주세요"/></td>
				<td></td>
			</tr>
			
			<tr>
				<td><h5>연락처 입력</h5></td>
				<td>
				<select>
					<option>010</option>
					<option>011</option>
					<option>016</option>
				</select>
				<input type="text" name="phone1" id="phone1" size="10" />-
				<input type="text" name="phone2" id="phone2" size="10" />
				<!-- <button type="button" class="btn btn-warning">확인</button> -->
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<!-- <input type="button" class="btn btn-warning btn-lg" value="비회원 주문하기" onclick="non_order_go(this.form)"/> -->
					<input type="button" class="btn btn-warning btn-lg" value="주문하기" onclick="mem_order_go(this.form)"/>
					<!-- <input type="button" class="btn btn-warning btn-lg" value="주문하기" onclick="mem_order_go(this.form)"/> -->
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
