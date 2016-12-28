<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>네이버 지도를 달아보자 : 네이버 지도 api 키 발급 받기와 지도 생성하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
</head>
<body>

<div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	<a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="http://ktsmemo.cafe24.com/s/naver_map/1" target="_blank">http://ktsmemo.cafe24.com/s/naver_map/1</a>
</div>


<!-- 예제 시작 -->

<!-- 
키는 발급받은 것으로 변경해 주세요.
localhost 도메인으로 테스트 하신다면 cpw9RMOfkmb0qIa7Vz23 키를 사용해 보세요.
localhost 에서 동작하도록 생성해둔 키 입니다.
-->
<script src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=xVmefpl0uQOwv3mBNFn_"></script>


<!-- 아래 div 에 지도를 생성합니다 -->
<div id="nmap" style="width:800px; height:600px;"></div>

<script type="text/javascript">

	// 아주 간단한 지도 생성 예제
	new nhn.api.map.Map('nmap', { // nmap 은 지도가 생성될 요소의 id값 입니다 (원하시는 데로 네이밍!)
		point : new nhn.api.map.LatLng(37.2900533, 127.1036797) // 위도, 경도 설정 (이 값을 가운데로 하여 지도 생성)
	});

</script>

<!-- 예제 종료 -->


</body>
</html>