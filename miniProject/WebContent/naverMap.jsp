<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>네이버 지도를 달아보자 : 네이버 지도 api 키 발급 받기와 지도 생성하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
</head>
<body>


	<!-- 예제 시작 -->

	<!-- 
키는 발급받은 것으로 변경해 주세요.
localhost 도메인으로 테스트 하신다면 cpw9RMOfkmb0qIa7Vz23 키를 사용해 보세요.
localhost 에서 동작하도록 생성해둔 키 입니다.
-->
	<!-- <script src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=xVmefpl0uQOwv3mBNFn_"></script>
 -->
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=xVmefpl0uQOwv3mBNFn_"></script>


	<!-- 아래 div 에 지도를 생성합니다 -->
	<div id="map" style="width: 700px; height: 400px;"></div>

	<script type="text/javascript">
	// 대전 시청점 x=127.3895211 y=36.3509882
		var mapOptions = {
			center : new naver.maps.LatLng(36.3509397, 127.3873025),
			zoom : 20
			
		} 
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(36.3509397, 127.3873025),
		    zoom: 20
		});

		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(36.3509397, 127.3873025),
		    map: map,
		    icon: '<%=request.getContextPath()%>/images/pin.png'
		});
		/* var markerOptions = {
			    position:new naver.maps.LatLng(37.3595704, 127.105399),
			    map: map,
			    
			};
		naver.maps.Event.addListener(map, 'click', function(e) {
		    marker.setPosition(e.latlng);
		}); */
		
		

		/* // 아주 간단한 지도 생성 예제
		new nhn.api.map.Map('nmap', { // nmap 은 지도가 생성될 요소의 id값 입니다 (원하시는 데로 네이밍!)
			point : new nhn.api.map.LatLng(37.2900533, 127.1036797) // 위도, 경도 설정 (이 값을 가운데로 하여 지도 생성)
		});
		var marker = new naver.maps.Marker('nmap',{
		    position: new naver.maps.LatLng(37.2900533, 127.1036797),
		    map: map
		}); */
	</script>

	<!-- 예제 종료 -->


</body>
</html>