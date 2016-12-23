var useraddrCnt = 0;
// 주소검색 완료후 매장 좌표가 바뀌면
	function naverMapChange() {
		try {
			$("#map").empty();
			naverMapGrid($("#naverMap_y").val(),  $("#naverMap_x").val());
			$('#branch_not_msg').css("display", "none");
			$('#branch_select_msg').css("display", "block");
		} catch (e) {
			//(e);
		}
		
	};
	
	
	function getUserAddrList(){
		//('getUserAddrList');
		$.ajax({
			 type : 'POST'
			,url : "/member/getCustDeliveryAddrList.json"			
			,contentType : 'application/x-www-form-urlencoded; charset=UTF-8'			
			,dataType : "json" 
			,success : function(data) {		
				console.log(data);
				//(data);
				// 전역변수 데이터 담기
				//model.object = data;
				var html = "";
				
				useraddrCnt = 0;
				$('#memberOrderAddrListTr').empty()
				
				if (data.length > 0) {																		
					$.each(data, function(i) {
						var addr_name = '';
						if(data[i].addr_name == null || data[i].addr_name == 'undefined'){
							addr_name = '이름없음';
						}else{
							addr_name = data[i].addr_name;
						}
						var listhtml = 	'<tr>'	
						 +'<td>'
		                     +'<label>'
		                     	+'<input class="radio" id="setUserSelectADdress" name="setUserSelectADdress" type="radio" value="{=member_user_list_seq}"/>'
		                        +'<span class="lbl"></span>'
		                      +'</label>'
		                  +'</td>'
		                  +'<td>'
		                  +'<strong>{=addr_name}</strong>'
		                  +'</td>'
		                  +'<td>{=member_addr_full} {=addr_desc}</td>'
		                  +'<td>{=member_branch_name}</td>'
		                  +'<td>'
		                  +'<div id="useraddrlistitem{=member_user_list_seq}">'
		                  +'<a href="javascript:selectDelOrderStore(\'{=member_user_list_seq}\');" class="button white w60 h25" >삭제</a>'
		                  + '<input type="hidden" value="{=addr_desc}"/>'
							+ '<input type="hidden" class="member_addr_si" 	value="{=si}" />'
							+ '<input type="hidden" class="member_addr_gu" 	value="{=gu}" />'
							+ '<input type="hidden" class="member_addr_dong" 	value="{=dong}" />'
							+ '<input type="hidden" class="member_addr_li" 	value="{=ri}" />'
							+ '<input type="hidden" class="member_branch_id" value="{=member_branch_id}" />'
							+ '<input type="hidden" class="member_branch_name" value="{=member_branch_name}" />'
							+ '<input type="hidden" class="member_branch_addr" value="{=member_branch_addr}" />'				
							+ '<input type="hidden" class="member_branch_time" value="{=member_branch_time}" />'
							+ '<input type="hidden" class="member_addr_flag"	value="{=member_addr_flag}" />'
							+ '<input type="hidden" class="member_addr_full" 	value="{=member_addr_full}" />'
							+ '<input type="hidden" class="member_addr_desc"	value="{=member_addr_desc}" />'
							+ '<input type="hidden" class="member_addr_idx" 	 value="{=member_addr_idx}" />'
							+ '<input type="hidden" class="member_addr_point_x" value="{=member_addr_point_x}" />'
							+ '<input type="hidden" class="member_addr_point_y" value="{=member_addr_point_y}" />'
							+ '<input type="hidden" class="member_naver_x" 	 value="{=member_naver_x}" />'
							+ '<input type="hidden" class="member_naver_y" 	 value="{=member_naver_y}" />'
							+ '<input type="hidden" class="member_site_cd" 	 value="{=member_site_cd}" />'
							+ '<input type="hidden" class="member_site_key" 	 value="{=member_site_key}" />'
							+ '<input type="hidden" class="member_user_list_seq" 	 value="{=member_user_list_seq}" />'
							+ '<input type="hidden" class="member_user_bunji" 	 value="{=member_user_bunji}" />'
							+ '<input type="hidden" class="member_user_building" 	 value="{=member_user_building}" />'
							+ '<input type="hidden" class="member_user_search_cd" 	 value="{=member_user_search_cd}" />'
							+ '<input type="hidden" class="member_user_place_name" 	 value="{=member_user_place_name}" />'
						  +'</td>'
		                  +'</tr>';
						
						
						/**
						var listhtml = '<tr><td class="">'
							+ '{=addr_name}:{=member_addr_full}</td><td>{=addr_desc}</td>'
							+ '<td>'
							+ '<div id="useraddrlistitem{=member_user_list_seq}">'
							+ '<a href="javascript:selectSetOrderStore(\'{=member_user_list_seq}\');" class="button white w80 h25 btn_store btn_selstore{=member_user_list_seq}">주소선택</a>'
							+ '<a href="javascript:selectDelOrderStore(\'{=member_user_list_seq}\');" class="button white w80 h25 btn_store_del">주소삭제</a>'
							+ '<input type="hidden" value="{=addr_desc}"/>'
							+ '<input type="hidden" class="member_addr_si" 	value="{=si}" />'
							+ '<input type="hidden" class="member_addr_gu" 	value="{=gu}" />'
							+ '<input type="hidden" class="member_addr_dong" 	value="{=dong}" />'
							+ '<input type="hidden" class="member_addr_li" 	value="{=ri}" />'
							+ '<input type="hidden" class="member_branch_id" value="{=member_branch_id}" />'
							+ '<input type="hidden" class="member_branch_name" value="{=member_branch_name}" />'
							+ '<input type="hidden" class="member_branch_addr" value="{=member_branch_addr}" />'				
							+ '<input type="hidden" class="member_branch_time" value="{=member_branch_time}" />'
							+ '<input type="hidden" class="member_addr_flag"	value="{=member_addr_flag}" />'
							+ '<input type="hidden" class="member_addr_full" 	value="{=member_addr_full}" />'
							+ '<input type="hidden" class="member_addr_desc"	value="{=member_addr_desc}" />'
							+ '<input type="hidden" class="member_addr_idx" 	 value="{=member_addr_idx}" />'
							+ '<input type="hidden" class="member_addr_point_x" value="{=member_addr_point_x}" />'
							+ '<input type="hidden" class="member_addr_point_y" value="{=member_addr_point_y}" />'
							+ '<input type="hidden" class="member_naver_x" 	 value="{=member_naver_x}" />'
							+ '<input type="hidden" class="member_naver_y" 	 value="{=member_naver_y}" />'
							+ '<input type="hidden" class="member_site_cd" 	 value="{=member_site_cd}" />'
							+ '<input type="hidden" class="member_site_key" 	 value="{=member_site_key}" />'
							+ '<input type="hidden" class="member_user_list_seq" 	 value="{=member_user_list_seq}" />'
							+ '<input type="hidden" class="member_user_bunji" 	 value="{=member_user_bunji}" />'
							+ '<input type="hidden" class="member_user_building" 	 value="{=member_user_building}" />'
							+ '<input type="hidden" class="member_user_search_cd" 	 value="{=member_user_search_cd}" />'
							+ '<input type="hidden" class="member_user_place_name" 	 value="{=member_user_place_name}" />'
							+ '</div>'
							+ '</td></tr>';
							**/
						////(data[i].address_cd);	
						/**if(data[i].address_cd =='01'){**/
							listhtml =listhtml.replace(/{=si}/g, data[i].dong_si)
							.replace(/{=gu}/g, data[i].dong_gu)
							.replace(/{=dong}/g, data[i].dong_dong)
							.replace(/{=ri}/g, data[i].dong_append);
						/**}else if(data[i].address_cd =='02'){
							listhtml=listhtml.replace(/{=si}/g, data[i].gil_si)
							.replace(/{=gu}/g, data[i].gil_gu)
							.replace(/{=dong}/g, data[i].gil_gil)
							.replace(/{=ri}/g, data[i].gil_append);
						}**/
					
						
						listhtml=listhtml.replace(/{=addr_name}/g, addr_name)
						.replace(/{=member_addr_full}}/g, data[i].address_basic)
						.replace(/{=addr_desc}/g, data[i].dong_gil_desc)	
						.replace(/{=member_branch_id}/g, data[i].branch_id)
						.replace(/{=member_branch_name}/g, data[i].branch_name)
						.replace(/{=member_branch_addr}/g, data[i].branch_address)
						.replace(/{=member_branch_time}/g, createtimeData(data[i].branch_open_time,data[i].branch_end_time))
						.replace(/{=member_addr_flag}/g, data[i].address_cd)
						.replace(/{=member_addr_full}/g, data[i].address_basic)
						.replace(/{=member_addr_desc}/g, data[i].dong_gil_desc)
						.replace(/{=member_addr_idx}/g, data[i].cust_branch_idx)
						.replace(/{=member_addr_point_x}/g, data[i].point_x)
						.replace(/{=member_addr_point_y}/g, data[i].point_y)
						.replace(/{=member_naver_x}/g, data[i].branch_naver_x)
						.replace(/{=member_naver_y}/g, data[i].branch_naver_y)
						.replace(/{=member_site_cd}/g, data[i].se_site_cd)
						.replace(/{=member_site_key}/g, data[i].se_site_key)
						.replace(/{=member_user_list_seq}/g, data[i].addr_seq)
						.replace(/{=member_user_bunji}/g, data[i].bunji)
						.replace(/{=member_user_building}/g, data[i].building)
						.replace(/{=member_user_search_cd}/g, data[i].search_cd)
						.replace(/{=member_user_place_name}/g, (data[i].search_cd=="J")? data[i].bunji:data[i].building)
					
							
						var checked = (i=="0")? "checked":"";
						html += listhtml;
						useraddrCnt ++;
						////(html);
						/**html += "<li>";
						html += "<label>";
						html += "<input type='radio' class='radio' name='addli' "+checked+" value='"+data[i].addr_seq+"'/>";
						html += "<span class='lbl'> 주소명: "+addr_name+"</span>";
						html += "<span class='lbl'>"+data[i].address_basic+" "+data[i].dong_gil_desc+"</span>";
						html += "<span>매장 : <i>"+data[i].branch_name+"</i></span>";
						html += "</label>";
						html += "</li>";**/
					});				
				} else {
					html = "";
					/**html += "<li>";
					html += "<label>";
					html += "<span class='lbl'>등록된 매장정보가 없습니다. 새로운 배달지를 추가할수 있습니다.</span>";
					html += "</label>";
					html += "</li>";**/
				}
				$('#memberOrderAddrListTr').empty().append(html);
				$("#setUserSelectADdress").unbind("change");
				$("input[name='setUserSelectADdress']").change(function() {
					var radioValue = $(this).val();
					var result = selectSetOrderStore(radioValue);
					if(!result){
						$(this).attr("checked", false);
					}
				});
			}
		});
	}

	function createtimeData(str1 , str2){
		var strReturn = str1 + '~' + str2;
		try {
			if(str1.length == 4 && str2.length == 4){
				console.log(str1);
				var time1 = str1.substring(0,2);
				console.log(str1);
				var time2 = str1.substring(2,4);
				
				var times1 = time1 +':' +time2 ;
				console.log(times1);
				var time3 = str2.substring(0,2);
				var time4 = str2.substring(2,4);
				var times2 = time3 +':' +time4 ;
				
				strReturn = times1 + ' ~ ' +times2;
			}
		} catch (e) {
			return strReturn;
		}
		return strReturn;
	}
	
	
	
$(document).ready(function() {		
	
	if($('.branch_name_view').text() == "-"){
		$('#branch_select_msg').css("display", "none");
	} else {
		$('#branch_not_msg').css("display", "none");
	}
	
	getUserAddrList();
	
	// 매장선택 버튼 누를시 해당 매장/배달주소값 설정
	
	
	
	// 페이지 호출 후 값 세팅
	for (var i = 0; i < $(".member_branch_id").length; i++) {
		if ($(".member_branch_id").eq(i).val() == $("#se_addr_branch_id").val()) {
			$(".member_branch_id").eq(i).next().addClass('active');
		}	
	}
	//주소 추가 버튼
	$('#open_zipcode_div_btn_order').click(function() {
		openPopUpAddADDR();
	});
	
	// 다음버튼 누를시
	$('#memberOrder_nextBtn').click(function() {

		//var basket_count = $(".cart_btn").children("span").text();
		
		// popup.js 추가 24시간매장 체크 (2014.10.06 채용석 추가), 12월 20일부터 24시간 매장 없음
		/*if ($('#memberOrder_nextBtn').text() != "메뉴선택" && check_morning_branch("member") == "N") {
			
			morning_menu();
			
		} */ 
		
		if ($('#cust_id').val() != "test@test.com" ) {
			if($('#cust_branch_id').val() != "009999" ){
				if ($('#memberOrder_nextBtn').text() != "메뉴선택" && check_morning_branch("member") == "X") {
					pop_alert_open("현재 선택하신 매장의 딜리버리 서비스 가능 시간은<br /><span class='t_red'>오전 10시 ~ 오후 22시</span> 까지 입니다.");
					return;
			
				} else if ($('#memberOrder_nextBtn').text() != "메뉴선택" && check_morning_branch("member") == "TimeOver") {
			
					pop_alert_open("현재 24시간 배달가능한 매장이 없습니다.<br />지금은 모든 매장의 딜리버리 서비스를 이용하실 수 없습니다.");
					return;
				}
			}		
		} 
				
		var pay_money = parseInt($("#price_add_total").val());
	
		// 다른 주소값을 선택하였을때는 값이 존재함, 다시 디폴트 매장을 선택해도 존재함
		if ($("#cust_address_cd").val() != "") {
			
			var result_addr_detail= $('#cust_addr_detail').val();
			
			var params = {
	    		new_area_code         : $("#cust_area_code").val(),	
	    		new_addr_flag         : $("#cust_address_cd").val(),
	    		
	    		new_addr_sido         : $("#cust_dong_si").val(),
	    		new_addr_gugun        : $("#cust_dong_gu").val(),
	    		new_addr_dong         : $("#cust_dong_dong").val(),
	    		new_addr_li           : $("#cust_dong_append").val(),
	    		
	    		new_addr_place_name   : $("#cust_place_name").val(),
	    		new_addr_full         : $("#cust_addr_full").val(),
	    		new_addr_desc         : result_addr_detail,
	    		
	    		new_addr_search_cd    : $("#cust_search_cd").val(),
	    		new_addr_bunji        : $("#cust_bunji").val(),
	    		new_addr_building     : $("#cust_building").val(),
	    		
	    		new_addr_point_x      : $("#cust_point_x").val(),
	    		new_addr_point_y      : $("#cust_point_y").val(),
	    		
	    		new_addr_branch_id    : $("#cust_branch_id").val(),
	    		new_addr_branch_name  : $("#cust_branch_name").val(),
	    		
        		new_branch_idx   : $("#cust_branch_idx").val(),
        		new_branch_x     : $("#cust_branch_x").val(),
        		new_branch_y     : $("#cust_branch_y").val(),
        		new_branch_time  : $("#cust_branch_time").val(),
        		new_branch_addr_full : $("#cust_branch_addr_full").val(),
        		new_branch_site_cd  : $("#cust_branch_site_cd").val(),
        		new_branch_site_key : $("#cust_branch_site_key").val()
	    		
			};
			console.log(params);
			$.ajax({
				type 		: 	'POST',
				url			:	'/order/setNewAddr_session',			
				contentType	:	'application/x-www-form-urlencoded; charset=UTF-8',
				data 		:	params,
				dataType	: 	'json',
				success		:	function(data) {
					
					if (data == "1") {
						if (pay_money >= 8000 || $("#order_type").val() == 'unitOrder') {
							if ($('.branch_name_view').text().indexOf("-") > -1) {
								$('#branch_not_msg').css("display", "block");
								return false;
							}
							location.href = "/order/payment";
						} else {
							location.href = "/menu/SpecialOffer";
						}
					}
			    },
				error : function(xhr, status, message){
					window.alert("다음버튼 클릭시 요청 실패입니다.");
					////(message);
				}					
			});
			
		// 매장, 주소를 변경하지 않고 바로 다음을 누를때
		} else {
			 if (pay_money >= 8000 || $("#order_type").val() == 'unitOrder'){
				 if ($('.branch_name_view').text().indexOf("-") > -1) {
					$('#branch_not_msg').css("display", "block");
					return false;
				}
				location.href = "/order/payment";
			} else {
				location.href = "/menu/SpecialOffer";
			}
		}
					
	});
});

/**정준호 추가**/
function deleteOrderStoreList(event){
	if(event.currentTarget.id == "confirm_url"){
		$.ajax({
			 type : 'POST'
			,url : "/member/deleteDeliveryAddr.json"			
			,contentType : 'application/x-www-form-urlencoded; charset=UTF-8'	
			,data : {addr_seq : event.data.key}
			,dataType : "html"
			,beforeSend : function() {
				
			}
			,success : function(data) {
				if (data > 0) {
					// 배달지 가져오기
					getUserAddrList();								
				}
			}
			,complete : function() {
				
			}
		});
	}
}

function selectDelOrderStore(seq){
	pop_alert_confirm("해당 배달주소를 삭제하시겠습니까?", deleteOrderStoreList, seq);
}

function selectSetOrderStore(seq){
	var storeInfodiv = $('#useraddrlistitem'+seq);
	//(storeInfodiv);
	var result = "not equal";
	var selcx = storeInfodiv.find(".member_addr_point_x").val();
	var selcy = storeInfodiv.find(".member_addr_point_y").val();
	var params = {
	  		cx	:	selcx,
	  		cy	:	selcy
	 };	
	
	//(params);
	$.ajax({				
		url : "/store/getContain"
	   ,dataType: "json"
	   ,contentType	:	'application/x-www-form-urlencoded; charset=UTF-8'
       ,type: 'POST' 
       ,data: params
       ,async: false
       ,success: function(data) {	
    	   //(data);
    		if(data.length>0){
    			
    			var idx = data[0].idx;
    			var memeber_branch_id = storeInfodiv.find(".member_branch_id").val().substring(3,8);
    			
    			if (idx.length > 6) {
    				//앞 두번째에서 다섯자리
    				idx = idx.substring(1,6);
    			} else {
    				//처음부터 다섯자리
    				idx = idx.substring(0,5);
    			}
    			console.log(idx);
    			//(idx);
    			//(memeber_branch_id);
    			// 좌표로 검색한 매장과 기존 매장이 일치하지 않을 경우
    			if (idx != memeber_branch_id) {		    						    				
    				result = "not equal";
    			} else {
    				result = "success";
    			} 
    			
    			if(memeber_branch_id == '999'){
    				result = "success"
    			}
    		}
       }
	});
	
	if (result == "success") {				
		$('.btn_store').removeClass('active');
		storeInfodiv.find('.btn_selstore'+seq).addClass('active');
		////(storeInfodiv.parents().find('.btn_stroe'));
		
		// View 설정
		$(".branch_id_view").val(storeInfodiv.find(".member_branch_id").val());
		$(".branch_name_view").text(storeInfodiv.find(".member_branch_name").val());
		$(".branch_addr_view").text(storeInfodiv.find(".member_branch_addr").val());
		$(".branch_time_view").text(storeInfodiv.find(".member_branch_time").val());
		$("#select_branch_name").text(storeInfodiv.find(".member_branch_name").val());
		
		// 네이버 지도 좌표 x, y 설정
		$("#naverMap_x").val(storeInfodiv.find(".member_naver_x").val());
		$("#naverMap_y").val(storeInfodiv.find(".member_naver_y").val());
		
		// 사용자 선택 값 세팅
		$("#cust_address_cd").val(storeInfodiv.find(".member_addr_flag").val());
					
		$("#cust_dong_si").val(storeInfodiv.find(".member_addr_si").val());
		
		$("#cust_dong_gu").val(storeInfodiv.find(".member_addr_gu").val());
		$("#cust_dong_dong").val(storeInfodiv.find(".member_addr_dong").val());
		$("#cust_dong_append").val(storeInfodiv.find(".member_addr_li").val());
					
		$("#cust_addr_full").val(storeInfodiv.find(".member_addr_full").val());
		$("#cust_addr_detail").val(storeInfodiv.find(".member_addr_desc").val());
		
		$("#cust_branch_id").val(storeInfodiv.find(".member_branch_id").val());
		$("#cust_branch_name").val(storeInfodiv.find(".member_branch_name").val());

		$("#cust_branch_idx").val(storeInfodiv.find(".member_addr_idx").val());
		$("#cust_point_x").val(storeInfodiv.find(".member_addr_point_x").val());
		$("#cust_point_y").val(storeInfodiv.find(".member_addr_point_y").val());
		
		$("#cust_branch_time").val(storeInfodiv.find(".member_branch_time").val());
		$("#cust_branch_addr_full").val(storeInfodiv.find(".member_branch_addr").val());
		$("#cust_branch_site_cd").val(storeInfodiv.find(".member_site_cd").val());
		$("#cust_branch_site_key").val(storeInfodiv.find(".member_site_key").val());
		$("#cust_branch_x").val(storeInfodiv.find(".member_naver_x").val());
		$("#cust_branch_y").val(storeInfodiv.find(".member_naver_y").val());
		
		
		$("#cust_place_name").val(storeInfodiv.find(".member_user_place_name").val());
		$("#cust_search_cd").val(storeInfodiv.find(".member_user_search_cd").val());
		$("#cust_bunji").val(storeInfodiv.find(".member_user_bunji").val());
		$("#cust_building").val(storeInfodiv.find(".member_user_building").val());
		
		//매장선택 버튼 클릭시 지도에 매장위치 보여주기
		$('#map').empty();
		naverMapGrid(storeInfodiv.find(".member_naver_y").val(), storeInfodiv.find(".member_naver_x").val());
		
		$('#branch_not_msg').css("display", "none");
		$('#branch_select_msg').css("display", "");	
		return true;
	} else if (result == "not equal") {
		pop_alert_open("죄송합니다. 매장 변경으로 인해 배달이 불가능합니다.<br>다른 매장을 선택해 주십시요.");
		return false;
	} else {
		pop_alert_open("죄송합니다. 배달구역 변경으로 인해 배달이 불가능한 지역입니다.");
		return false;
	}	
}


function openPopUpAddADDR(){
	if(useraddrCnt > 4){
		pop_alert_open('고객 주소는 최대 5개까지만 등록 가능 합니다.');
	}else{
		var _this =$('#open_zipcode_div_btn_order');
	    var vCont = '#zipcode_div';
		var mh =  $(vCont).outerHeight();
		
	        $('#contents').after('<span class=bgLayer></span>');
	        $('.bgLayer').fadeTo('fast', 0.6, function() {
	            $(vCont).css({'margin-top':-(mh/2)}).show(300, function() {
	                $(this).attr('tabIndex',0).focus();
	            });

	            $(vCont).find('.pop_close').click(function() {
	                $('.bgLayer').remove();   
	                $('.item_order_amt').val($('.item_price').val());
	                $('.item_qty').val("1");
					$(this).parents('.pop_layer').hide(300,function(){
						$(this).removeAttr('tabindex');
					});
	                _this.focus();
					return false;
	            });
	        });		
			return false;

	}
}
