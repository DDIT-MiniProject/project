	
	$(function(){		
		$('#popAlram .pop_close, #popConfirm .pop_close').click(function(){
			$('.bgLayer').remove();
			$('#popAlram, #popConfirm').hide(300);
			return false;
		});					
	});

	
	// 아침메뉴 장바구니 담기 및 단일주문시 체크 (12월 20일부로 아침메뉴 없어짐)
	morning_menu = function(index) {
		
		var nowTime = new Date().format("HHmm");
		
		if (location.href.indexOf("/menu/BreakFast") != -1 && (nowTime < "0500" || nowTime > "1000")
		   || (location.href.indexOf("/menu/all") != -1 && $(".item_class_id").eq(index).val() == "00007") && (nowTime < "0500" || nowTime > "1000") 
		   || location.href.indexOf("/order/payment") != -1 || location.href.indexOf("/order/memberOrder") != -1 
		   || location.href.indexOf("/order/nonMemberOrder") != -1 || location.href.indexOf("/mypage/reOrder") != -1) {
			
			$.ajax({
				type 		: 	'POST',
				url			:	'/store/check_everytime_branch',		
				contentType	:	'application/x-www-form-urlencoded; charset=UTF-8',
				dataType	: 	'json',
				success		:	function(data) {			
											
					var msg = "아침메뉴는 <span class='t_red'>05:00~10:00</span> 까지 판매됩니다.<br />";
					
					if (data.length > 0) {
						var result = "";
						for (var i = 0; i < data.length; i++) {						
							if (i == 0) {
								result = data[i].branch_name;
							} else {
								result += ", "+data[i].branch_name;
							}						
						}
						
						msg += "24시간 배달매장 설정 시 "+result+"으로<br />설정하셔야 합니다.";
						
					} else {						
						msg += "24시간 배달가능한 매장이 없습니다.";
					}	
					
					pop_alert_open(msg);
				}			
			});			
			return false;
			
		} else {
			return true;
		}		
	};
	
	
	// 회원주문 및 비회원주문 24시간 매장 체크
	check_morning_branch = function(url) {
		
		var branch_id = "";
		var check_branch = "N";
		var nowDate = new Date().format("yyyyMMdd");	
		var nowTime = new Date().format("HHmm");
		
		if (url == "member") {
			branch_id = ".branch_id_view";
		} else if (url = "nonMember") { 
			branch_id = "#cust_branch_id";
		}	
				 
		// 저녁 10시부터 12시까지는 12시까지 배달 가능한 4개매장 체크
		if (parseInt(nowTime) >= 2200 || parseInt(nowTime) < 0001) {
			
			$.ajax({
				url : "/store/check_everytime_branch"
				,dataType : "json"
				,async : false			// 전역변수 셋팅
				,contentType : 'application/x-www-form-urlencoded; charset=UTF-8'
				,type : 'POST' 
				,success : function(data) {		
					if (data.length > 0) {	
						for (var i = 0; i < data.length; i++) {
							if (data[i].branch_code == $(branch_id).val()) {
								check_branch = "Y";
								break;								
							} else {
								check_branch = "X";
							}
						}	
					} else {
						check_branch = "X";
					}						
				}				
			});	
		
		// 저녁 12시부터 아침 10시전까지는 전 매장 타임오버(배달 안함)
		} else if (parseInt(nowTime) >= 0001 && parseInt(nowTime) < 1000) {
		
			if (nowDate == "20141229" && $(branch_id).val() == "00000226" && (parseInt(nowTime) > 0900 && parseInt(nowTime) < 1000)) 
				check_branch = "Test";	
			else 
				check_branch = "TimeOver";
			
		}	
		
		return check_branch;				
	};
	
	
	// 팝업 경고메세지 띄움
	pop_alert_open = function(msg) {

		$('#contents').after('<span class=bgLayer></span>');
		$("#popAlram").attr("style", "margin-top:-100px;display:block;border:1px solid #000;");
		
		$("#alert_msg").empty();
		$("#alert_msg").append("<strong>"+msg+"</strong>");
		
	};
	
	
	// 선택 레이어 호출
	pop_alert_confirm = function(msg, handler, param) {
		
		$('#contents').after('<span class=bgLayer></span>');
		$("#popConfirm").attr("style", "margin-top:-100px;display:block;border:1px solid #000;z-index: 999999;");
		
		$("#confirm_msg").empty();
		$("#confirm_msg").append("<strong>"+msg+"</strong>");
		
		$("#confirm_url, #cancel_url").off('click.one');
		$("#confirm_url, #cancel_url").on('click.one', { key:param }, handler);
		// one 이벤트는 딱 한번만 실행되고 사라진다.
	};
	
