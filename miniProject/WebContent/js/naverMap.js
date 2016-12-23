	
/* naver */
function naverMapGrid(branch_y, branch_x){
		
	 // 지도 생성
    var oPoint = new nhn.api.map.LatLng(branch_y, branch_x);
    nhn.api.map.setDefaultPoint('LatLng');
    oMap = new nhn.api.map.Map('map' ,{
                            point : oPoint,
                            zoom : 12,
                            enableWheelZoom : true,
                            enableDragPan : true,
                            enableDblClickZoom : false,
                            mapMode : 0,
                            activateTrafficMap : false,
                            activateBicycleMap : false,
                            minMaxLevel : [ 1, 14 ],
                            size : new nhn.api.map.Size(833, 400)
   				 });
        
    // 마커 생성
    var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
    	mapZoom.setPosition({left:20, bottom:20}); // - 줌 컨트롤 위치 지정.
    	oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
    
    var oSize = new nhn.api.map.Size(28, 37);
    var oOffset = new nhn.api.map.Size(14, 37);
    var oIcon = new nhn.api.map.Icon('/images/common/burgerking_marker.png', oSize, oOffset);
    // - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
    // - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
    // - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.
    
    var oMarker1 = null;
    
    if($('.branch_name_view').text() == "-"){
    	oMarker1 = new nhn.api.map.Marker(oIcon, { title : '버거킹 동여의도점' });  // 기본매장 마커 생성 
    } else {
    	oMarker1 = new nhn.api.map.Marker(oIcon, { title : '버거킹 '+$('.branch_name_view').text()});  // 마커 생성
    }
    
	 	oMarker1.setPoint(oPoint); 		// 마커 표시할 좌표 선택
	 	oMap.addOverlay(oMarker1); 	// 마커를 지도위에 표현 
	 var oLabel1 = new nhn.api.map.MarkerLabel(); 		// - 마커 라벨 선언. 
	 	oMap.addOverlay(oLabel1); 		// - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
	 	oLabel1.setVisible(true, oMarker1); 	// 마커 라벨 보이기 
	
	}  
	/* naver map script end */	
	
	
	$(document).ready(function(){
		naverMapGrid($("#naverMap_y").val(), 	$("#naverMap_x").val());
	});
	
