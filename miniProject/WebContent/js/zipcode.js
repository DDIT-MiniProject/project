/*<!DOCTYPE html> 
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>회원 주문 | 버거킹 딜리버리</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<!-- 기본으로 사용하는 css / javascript / meta 정보 분리 -->
	<!-- Head -->
	




<!-- <meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
 -->
<meta name="viewport" content="width=986"/>
<meta name="keywords" content="버거킹 딜리버리"/>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" media="all" />
<link rel="stylesheet" href="/css/contents.css" media="all" />
<!--[if lte IE 8]>
	  <link rel="stylesheet" href="/css/ie.css" />
<![endif]-->

<script type="text/javascript" src="/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="/js/lib/modernizr-2.6.2.min.js"></script>
<!--[if lt IE 9]>
	<script src="/js/lib/html5Shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="/js/plugins.js"></script>
<script type="text/javascript" src="/js/ui_script.js"></script>
<script type="text/javascript" src="/js/burgerKing/common/cartView.js"></script>
<script type="text/javascript" src="/js/burgerKing/common/zipcode.js"></script>
<script type="text/javascript" src="/js/burgerKing/common/commonCart.js?v=1482286129360"></script>

<script type="text/javascript" src="/js/common/string.js"></script>
<script type="text/javascript" src="/js/burgerKing/common/popup.js"></script>
		
<!-- 경고창 팝업 -->

 <!-- JSTL 라이브러리 선언문 -->

<!-- pop_layer -->
<!-- <a href="#pop_alert" class="button pop_open" id="pop_alert_open" style="display:none;"></a> -->

<!-- s:14.09.26 -->
	<article id="popAlram" class="pop_wrap pop_layer">
		<header class="pop_head">			
			<h1>알람</h1>
		</header>
		<section class="pop_cont">
			<div>
				<div class="pt10 pb10 t_center">
					<p class="f14" id="alert_msg">팝업메세지 내용란</p> 
				</div>
				<p class="button_area mt10">
					<a href="#" class="pop_close button org w120">확인</a>
				</p>
			</div>
		</section>
		<footer class="pop_foot">
			<a href="#" class="pop_close">팝업 닫기</a>
		</footer>
	</article>
<!-- e:14.09.26 -->

	<article id="popConfirm" class="pop_wrap pop_layer">
		<header class="pop_head">			
			<h1>알람</h1>
		</header>
		<section class="pop_cont">
			<div>
				<div class="pt10 pb10 t_center">
					<p class="f14" id="confirm_msg">팝업메세지 내용란</p> 
				</div>
				<p class="button_area mt10">
					<a href="#" id="confirm_url" class="pop_close button org w120">확인</a>
					<a href="#" id="cancel_url" class="pop_close button org w120">취소</a>
				</p>
			</div>
		</section>		
	</article>

	<!-- //Head -->

	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=6f6e5647870420fabe33b7b565b0c1ee"></script> <!-- delivery 실제 -->
	<!-- <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&amp;key=374dfb52e2d4d0a1c86b5fb223549571"></script>--><!-- 테스트용 -->
 	<script type="text/javascript" src="/js/burgerKing/common/naverMap.js"></script>
	<script type="text/javascript" src="/js/burgerKing/order/memberOrder.js"></script>	
</head>

<body>
	<!-- skipNavi -->
	<div id="skipNavi">
		<a href="#container">본문 바로가기</a>
		<a href="#gnb">주메뉴 바로가기</a>
		<a href="#footer">사이트정보 바로가기</a>
	</div>
	<!-- //skipNavi -->

	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		



<script src="/js/burgerKing/common/rsamode.js"></script>

<script>
	var RSAModulus = "8113e0a836ab2d3e4054c6726f9875e626384517abb5ab74355d4c0a40cd010e21a40767ac61e96919fae0717bbbd6c871b874b0c58bae3525b5979ee36aa426b1fe16744f3b5f8e7bab42d77e24137b27d08c8398bdb9dcf11cc1e84652a5ecb0f49a3579f878c1b28e494f962a3af56a283549539d05afb734ad40b98684dd";
	var RSAExponent = "10001";
</script>
<form id="encModeForm" hidden="true">
</form>

 <header id="header">
 	<div class="inner">
 		<h1 id="logo"><a href="/main">버거킹</a></h1>
 		
 		<div  class="head_util">
			<ul>
				
					
						<!-- 로그아웃 -->
						<li><a href="#" class="btn_logout">로그아웃</a>
							<div class="layer_box logout_box">
								<form id="logoutForm"><input type="hidden" name="logoutPath" id="logoutPath" value=""/></form>
								<p>로그아웃하시겠습니까?
									<a href="#"  id="logout_Btn">로그아웃</a>
									<a href="#" class="logout_close">취소</a>
								</p>
								<i></i>
							</div>
						</li>							
						<!-- //로그아웃 -->	
						<li><a href="/mypage/myPage">마이페이지</a></li>
						<li><a href="/mypage/myOrderList">주문확인</a></li>
					
					
				 
			</ul>			
		</div>	
		
		<nav id="gnb">
			<ul>
		
			
			
				<li class="gnb01"><a href="/order/memberOrder" class="newSession">ORDER</a></li>
			
			
			
			
				<li class="gnb02"><a href="/menu/SpecialOffer">MENU</a></li>
				<li class="gnb03"><a href="/store/searchStore">STORE</a></li>
				<li class="gnb05"><a href="/customer/faq">FAQ</a></li>
			</ul>
		</nav>
		<div class="head_call">
			<!-- <p>딜리버리 전화주문</p>
			<p class="call">1599-0505</p> -->
			<img src="/images/common/head_call.gif" alt="1599-0505" />
		</div>
		
		<section class="cart_box">
			<!-- 장바구니 -->
			




<a class="cart_btn" href="#"><img src="/images/common/head_cart.png" alt="" /> 장바구니(0)</a>
<form id="cart_view_form">
		
		<input type="hidden" name="itemDatas"  class="itemDatas"   id="itemDatas"  value="" />				 <!-- 주문하기 클릭시 단일제품 정보 저장 -->
		<input type="hidden" name="toppingDatas"  class="toppingDatas"   id="toppingDatas"  value="" /> <!-- 주문하기 클릭시 토핑제품 정보 저장 -->
		<input type="hidden" name="order_id" 	 id="quick_order_id"  value="1612211108219821176642" />
		<input type="hidden" name="goUrl" 	 class="goUrl"  id="goUrl" 	value=""  />
	
	

</form>
	<input type="hidden" id="quick_cart_price" value="0"/>



<!-- 장바구니 담고 로딩후에 카트클릭후 전체금액 계산 -->
<script type="text/javascript">

	// 퀵카트 제품 클릭시 상세보기
	$('.new_cart > li > a').click(function(){					
		$(this).parent().addClass('on').siblings().removeClass('on')
		return false;
	});	

	$('#price_all').text(price_calculation().money() + "원");		
	$('.cart_btn').trigger('click');

 	if ($('.cart_view').css('display') == "block") {

		var cartTimer = null;
		
		clearTimeout(cartTimer);
		
		cartTimer = setTimeout(function(){		// 장바구니 담고 2초후 닫기
			$('.btn_cartClose').trigger('click');
	    },2000);     
	}	 
		
	quick_cart_check(price_calculation());
	
</script>		


			<!-- 장바구니 -->
		</section>
	</div>		
</header>  




	<script>
	$(document).ready(function(){
		//로그아웃 버튼 클릭시 
		$("#logout_Btn").click(function(){
			
			//이전페이지 경로 기억해서 로그아웃하고 이동하기
			var logoutPath_arr = location.href.split("/");
			var logoutPath = "/"+logoutPath_arr[logoutPath_arr.length-2]+"/"+logoutPath_arr[logoutPath_arr.length-1];
			$("#logoutPath").val(logoutPath);
 
			frm = document.getElementById("logoutForm"); 
			frm.target = "_self";
			frm.action = "/login/logoutProcess";
			frm.submit();
		});
	});	
	</script>


		<!-- //header -->

		<!-- container -->
		<div id="container" class="full">		
		
			<!-- lnb -->
			<aside id="lnb" class="hide">
				<div>
					<h1><img alt="ORDER" />ORDER</h1>
				</div>
			</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/main">HOME</a></li>
					<li>
						<span>버거킹 회원</span>
					</li>
					<li><span>회원 주문</span></li>
					<li><strong>매장 선택</strong></li>
				</ul>
				<div id="cont_tit">
					<h1>회원 주문</h1>
				</div>
				
				<form action="">
				<div class="full_order">
					<div class="form_list">
						<h2 class="cont_tit tit3">배달매장정보</h2>
						<div>
							<table class="tbl_style">
								<caption>배달 매장 정보</caption>
								<colgroup>
									<col />
									<col style="width:40%" />
									<col style="width:30%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">매장명</th>
										<th scope="col">매장위치</th>
										<th scope="col">배달가능시간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
											<td class="branch_name_view">-<input type="hidden" class="branch_id_view" value=""></td>
											<td class="branch_addr_view">-</td>
											<td class="branch_time_view">-</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="form_list">
						<h2 class="cont_tit tit3">배달주소</h2>
						<div>
							<p class="mb10"><strong style="color:#222;">이전 고객님이 이용한 배달주소지 중 원하시는 배달지를 선택해 주세요. 배달지는 최대 5개까지 등록가능합니다.</strong></p>
							<table class="tbl_style">
								<caption>최근배달주소 리스트 - 주소, 매장선택여부를 확인</caption>
								<colgroup>
									<col style="width:10%" />
									<col style="width:20%" />
							  		<col style="width:auto" />
							  		<col style="width:15%" />
							  		<col style="width:15%" />
								</colgroup>
								<thead>
										<tr>
											<th scope="col">선택</th>
											<th scope="col">주소지</th>											
									  		<th scope="col">주소</th>
											<th scope="col">매장명</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<!-- 자주주문하는 매장 리스트 보여줌-->
										<!--  <tbody id= "memberOrderAddrListTr"> -->
										<tbody id="memberOrderAddrListTr">
											
										</tbody>
							</table>
							<div class="mt30 hidden">
								<!--  <div class="f_left">
									<p id="branch_select_msg">입력하신 주소의 배달가능 매장입니다.<span class="t_red" id="select_branch_name"></span> 매장이 선택 되었습니다.</p>
									<p id="branch_not_msg"><span class="t_red" >매장을 선택하신 후 주문을 진행해 주세요.</span></p>
								</div> -->
								<div class="t_center">
								
									<!-- 네이버 지도 좌표 값 -->
									<input type="hidden" id="naverMap_x" value="126.9239892" />		<!-- 매장이 없을경우 여의도점 기본설정 -->
									<input type="hidden" id="naverMap_y" value="37.5204924" />
								
																		
									<input type="hidden" id="cust_id" value="vallo_follow@naver.com" />			
									<input type="hidden" id="order_type" value="" />
									<input type="hidden" id="price_add_total" value="0" />
								
									<!--
									<input type="hidden" name="new_addr_flag"		id="cust_address_cd"  	value="" />
									<input type="hidden" name="new_area_code"		id="cust_area_code"  	value="" />
														
									<input type="hidden" name="new_addr_sido" 		id="cust_dong_si" 	 	value="" />
									<input type="hidden" name="new_addr_gugun" 		id="cust_dong_gu" 		value="" />
									<input type="hidden" name="new_addr_dong" 		id="cust_dong_dong"  	value="" />
									<input type="hidden" name="new_addr_li" 		id="cust_dong_append"	value="" />
									<input type="hidden" name="new_addr_place_name" id="cust_place_name" 	value="" />				
									
									<input type="hidden" name="new_addr_search_cd" 	id="cust_search_cd" 	value="" />
									<input type="hidden" name="new_addr_bunji" 		id="cust_bunji" 		value="" />
									<input type="hidden" name="new_addr_building" 	id="cust_building" 		value="" />
									
									<input type="hidden" name="new_addr_point_x" 	id="cust_point_x" 		value="" />
									<input type="hidden" name="new_addr_point_y" 	id="cust_point_y" 		value="" />
									
									<input type="hidden" name="new_addr_full" 		id="cust_addr_full" 	value="" />
									<input type="hidden" name="new_addr_desc" 		id="cust_addr_detail" 	value="" />
									
									<input type="hidden" name="new_addr_branch_id" 	id="cust_branch_id" 	value="" />
									<input type="hidden" name="new_addr_branch_name" id="cust_branch_name" 	value="" />									
									<input type="hidden" name="new_addr_branch_idx"  id="cust_branch_idx" 	value="" />
									<input type="hidden" name="new_addr_branch_x" 	 id="cust_branch_x" 	value="" />
									<input type="hidden" name="new_addr_branch_y" 	 id="cust_branch_y" 	value="" />
									<input type="hidden" name="new_addr_branch_time" id="cust_branch_time" 	value="" />
									<input type="hidden" name="new_addr_branch_addr_full" 	 id="cust_branch_addr_full" 	value="" />
									<input type="hidden" name="new_branch_site_cd" 	 id="cust_branch_site_cd" 	value="" />
									<input type="hidden" name="new_branch_site_key"  id="cust_branch_site_key" 	value="" />
									-->
									
									<input type="hidden" name="new_addr_flag"		id="cust_address_cd"  	value="" />
									<input type="hidden" name="new_area_code"		id="cust_area_code"  	value="" />
														
									<input type="hidden" name="new_addr_sido" 		id="cust_dong_si" 	 	value="" />
									<input type="hidden" name="new_addr_gugun" 		id="cust_dong_gu" 		value="" />
									<input type="hidden" name="new_addr_dong" 		id="cust_dong_dong"  	value="" />
									<input type="hidden" name="new_addr_li" 		id="cust_dong_append"	value="" />
									<input type="hidden" name="new_addr_place_name" id="cust_place_name" 	value="" />				
									
									<input type="hidden" name="new_addr_search_cd" 	id="cust_search_cd" 	value="" />
									<input type="hidden" name="new_addr_bunji" 		id="cust_bunji" 		value="" />
									<input type="hidden" name="new_addr_building" 	id="cust_building" 		value="" />
									
									<input type="hidden" name="new_addr_point_x" 	id="cust_point_x" 		value="" />
									<input type="hidden" name="new_addr_point_y" 	id="cust_point_y" 		value="" />
									
									<input type="hidden" name="new_addr_full" 		id="cust_addr_full" 	value="" />
									<input type="hidden" name="new_addr_desc" 		id="cust_addr_detail" 	value="" />
									
									<input type="hidden" name="new_addr_branch_id" 	id="cust_branch_id" 	value="" />
									<input type="hidden" name="new_addr_branch_name" id="cust_branch_name" 	value="" />									
	
									<!-- 네이버 좌표값 세팅해주어야함 -->
									<input type="hidden" name="new_addr_branch_idx"  id="cust_branch_idx" 	value="" />
									<input type="hidden" name="new_addr_branch_x" 	 id="cust_branch_x" 	value="" />
									<input type="hidden" name="new_addr_branch_y" 	 id="cust_branch_y" 	value="" />
									<input type="hidden" name="new_addr_branch_time" id="cust_branch_time" 	value="" />
									<input type="hidden" name="new_addr_branch_addr_full" 	 id="cust_branch_addr_full" 	value="" />
									
									<input type="hidden" name="new_branch_site_cd" 	 id="cust_branch_site_cd" 	value="" />
									<input type="hidden" name="new_branch_site_key"  id="cust_branch_site_key" 	value="" />
									
									
									
									
										
										
										
											<a href="#" id="memberOrder_nextBtn" class="button org h50 w200">메뉴선택</a>
										
											
									
									
									<!-- <a href="#zipcode_div" class="pop_open button w120 gray ml6">배송지추가</a> -->
									<a href="javascript:void(0);" id="open_zipcode_div_btn_order"  class="button gray h50 w200">배송지추가</a>
											
									<!-- 주소찾기 팝업 -->
									
 <!-- JSTL 라이브러리 선언문 -->

<!-- pop_layer -->
<article id="zipcode_div" class="pop_wrap pop_layer">
	<!-- pop_head -->
	<header class="pop_head">			
		<h1>주소입력</h1>
	</header>
	<!-- //pop_head -->

	<!-- 주소검색 구분코드 결과 값 (신/구주소) -->
	<input type="hidden" id="search_address_flag" 	value=""/>
	
	<!-- 처음 검색시 결과 값 -->
	<input type="hidden" id="search_result_code"  	value="" />
	<input type="hidden" id="search_result_sido"  	value="" />
	<input type="hidden" id="search_result_gugun"  	value="" />
	<input type="hidden" id="search_result_dong"  	value="" />
	<input type="hidden" id="search_result_li"  	value="" />
	<input type="hidden" id="search_result_fullname" value="" />
	
	<!-- 두번째 검색시 결과 값 -->
	<input type="hidden" id="search_result_bunji"  	 value="" />
	<input type="hidden" id="search_result_building" value="" />
	<input type="hidden" id="search_result_point_x"  value="" />
	<input type="hidden" id="search_result_point_y"  value="" />
	<input type="hidden" id="search_result_place_name" value="" />
	<input type="hidden" id="search_result_search_cd"  value="" />
	
	
	<!-- 배달가능매장 카이네스 idx(배달구역) 값 -->
	<input type="hidden" id="search_result_branch_idx"  value="" />
	
	<!-- 매장검색결과 매장코드 결과 값 (TB_Branch_Info) -->
	<input type="hidden" id="search_result_branch_id"   value="" />
	<input type="hidden" id="search_result_branch_name" value="" />
	<input type="hidden" id="search_result_branch_x" value="" />
	<input type="hidden" id="search_result_branch_y" value="" />
	<input type="hidden" id="search_result_branch_time" value="" />
	<input type="hidden" id="search_result_branch_addr_full" value="" />
	<input type="hidden" id="search_result_branch_site_cd" value="" />
	<input type="hidden" id="search_result_branch_site_key" value="" />
	<input type="hidden" id="search_result_branch_delivery_time" value="" />
	<!-- 매장 저장명 -->
	<input type="hidden" id="search_addr_user_name"  value="" />
	
	<!-- 아직 사용처 모름 -->
	<input type="hidden" id="search_result_branch_sector" 	value="" />
	<input type="hidden" id="search_result_extra_time"  	value="" />
	<input type="hidden" id="search_dong_name"  			value="" />
	<input type="hidden" id="search_building_name"  		value="" />
	<input type="hidden" id="search_result_desc"  			value="" />
	<input type="hidden" id="search_result_seq" 			value="" />
	
	<!-- pop_cont -->
	<section class="pop_cont zipcode_cont">
		<div>
			<p class="mb10"><input type="text" autocomplete="off" style="width:396px" placeholder="주소 이름" title="주소 이름" id="UseraAddrName" maxlength="50"/>
			</p>
		
			<ul class="tabmenu tabMotion kainessTab">
				<li class="on"><a href="#tabCon1">지번주소</a></li>
				<li><a href="#tabCon2">도로명주소</a></li>
			</ul>								
			
			<!-- 탭내용1 -->
			<div id="tabCon1" class="tab_cont">
				<p class="mb10"><input type="text" autocomplete="off" class="kainess_enter wid1" placeholder="동 입력" title="동 입력" id="searchDongAddress"/>
					<a href="#" class="kainess_search_Btn button gray">동 검색</a>
				</p>
				<p class="mb10"><input type="text" autocomplete="off" class="kainess_enter wid2" placeholder="지번 또는 건물명 입력" title="지번 또는 건물명 입력" id="searchBunjiAddress"/>
					<a href="#" class="kainess_search_d2_Btn button gray">지번검색</a>
					<a href="#" class="kainess_search_d2_Btn button gray">건물명검색</a>		
					<!-- 사용시 앞버튼 '번지검색'으로 명칭수정<a href="#" class="kainess_search_d2_Btn button gray ml10">건물명검색</a> -->
				</p>
			</div>
			<!-- //탭내용1 -->

			<!-- 탭내용2 -->
			<div  id="tabCon2" class="tab_cont">					
				<p class="mb10"><input type="text" autocomplete="off" class="kainess_enter wid1" placeholder="도로명 입력" title="도로명 입력" id="searchDoroAddress"/>
					<a href="#" class="kainess_search_Btn searchDoroBtn button gray">도로명검색</a>
				</p>
				<p class="mb10"><input type="text" autocomplete="off" class="kainess_enter wid1" placeholder="지번 또는 건물명 입력" title="지번 또는 건물명 입력" id="searchJibunAddress"/>
					<a href="#" class="kainess_search_g2_Btn button gray">건물번호검색</a>
					<a href="#" class="kainess_search_g2_Btn button gray" style="display:none;">건물명검색</a>				
					<!-- 사용시 앞버튼 '건물번호검색'으로 명칭수정<a href="#" class="kainess_search_g2_Btn button gray ml10">건물명검색</a> -->
				</p>
			</div>
			<!-- //탭내용2 -->
			
			<!-- 검색내용 -->
			<div class="mb10 zipcode_list">
				<ul id="addressList" style="overflow:hidden;">
					<!-- 주소 검색 결과 보여지는 위치 -->
				</ul>
			</div>
			<!-- //검색내용 -->
			<p class="mb10"><input type="text" autocomplete="off" style="width:396px" placeholder="상세주소 입력" title="동 호수 등 상세주소 입력" id="kainess_addressDetail" maxlength="50"/></p>
			<p class="button_area mt10">
				<a href="#" class="button org w120" id="addressSubmit">확인</a>
				<a href="#" class="pop_close button w120 gray addr_pop_close">취소</a>
			</p>
		</div>			
	</section>
	<!-- pop_foot -->
	<footer class="pop_foot">
		<a href="#" class="pop_close addr_pop_close">팝업 닫기</a>
	</footer>
</article>	
<!-- //pop_layer -->
									<!-- 주소찾기 팝업 -->
								</div>
							</div>
						</div>
					</div>
					<div class="form_list">
						<h2 class="cont_tit tit3">매장위치정보</h2>
						<div id="map"  style="border:1px solid #000; width:833px; height:338px;"><!-- 네이버 지도 생성 --></div>
					</div>
				</div>
				</form>
			</section>
			<!-- //contents -->
		</div>
		<!-- //container -->
		
		<!-- s:푸터 -->
		

<script type="text/javascript" src="/js/burgerKing/common/footerNotice.js"></script>

<script>
	// 구글 분석 (어떤경로를 통해, 방문자수 등등) 	
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments);},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m);
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-54439145-1', 'auto');
	ga('require', 'displayfeatures');
	ga('send', 'pageview');	 
</script>

<footer id="footer">			
	<div class="foot_util">
		<div class="inner">
			<ul>
				<li><a href="/customer/faq">FAQ</a></li>
				<li><a href="/footer/terms">이용약관</a></li>
				<li><a href="/footer/privacy"><strong>개인정보취급방침</strong></a></li>
				<li><a href="/common/siteMap">사이트맵</a></li>
				<li><a href="/customer/notice">공지사항</a></li>
				<!-- <li><a href="#">사이버상담실</a></li> -->
				<!-- <li><a href="#">법적고지</a></li> -->
				<!-- <li><a href="#">브랜드사이트</a></li> -->
			</ul>
		</div>
	</div>
	<div class="inner">
		<div class="copyright">	
			<p><strong>Copyright 2012 BKR Co., Ltd. All right Reserved</strong></p>
			<p><span>(주)BKR</span> <span>대표이사 문영주</span> <span>사업자 등록번호 101-86-76277</span> <span>서울 종로구 삼봉로 71 G 타워 2층</span> <span>주식회사 비케이알</span></p>
			<p><span>TEL 02-6331-8282</span> <span>FAX 02-3775-4325</span></p>
		</div>
	</div>
</footer>
 
		<!-- e:푸터 -->				
	</div>
	<!-- //wrap -->
</body>
</html>
*/
