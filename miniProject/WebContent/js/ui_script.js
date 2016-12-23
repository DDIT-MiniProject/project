
$(function(){ 
	//pageTitle();
	gnbActive();
	lnbMotion();
	lnbActive();
	cartBtn();
	topBtn();
	tapMotion();
	layerCtrl();
	formStyle();
	inputFile();	
	menuCtrl();
	snsCtrl();
	etcCtrl();

	//placeholder
	$(":input[placeholder]").placeholder();

});


/* page title */
function pageTitle(){
	var titTxt = $('#location > li > strong').text();

	if($('#location').size() > 0){
		document.title = titTxt + ' | ' + '버거킹 딜리버리';
	}else{
		document.title = '버거킹 딜리버리';
	}
}

/*gnb*/
function gnbActive(){	
	var gnbTxt = $('#gnb a');
	var current = $.trim($('#lnb h1 img').attr('alt'));	

	gnbTxt.each(function() {
		 if ( $(this).text() == current) {
			$(this).parent().addClass('active');
		}
	}); 
}

/*lnb*/
function lnbActive(){	
	var lnbTxt = $('#lnb a');
	var current = $.trim($('#location > li > strong').text());	

	if($('#lnb').size() > 0){
		lnbTxt.each(function() {
			 if ( $(this).text() == current) {
				$(this).parents('li').addClass('active');
			}
		});
	} 
}
function lnbMotion(){
	if($('#lnb').size() > 0){
		var tip = $('#lnb').offset().top;
		$(window).scroll(function(){
			var top = $(this).scrollTop();
			if( top > (tip-10)){
				//$('#lnb').css({'position':'absolute','top':(top - 125)})
				$('#lnb').addClass('fixed');
			}else{
				//$('#lnb').removeAttr('style');
				$('#lnb').removeClass('fixed');
			}
		});		
	}
	
	$('.lnb_open').click(function(){
		$('.open_view').show(500);
		return false;
	});

	$('.lnb_close').click(function(){
		$('.open_view').hide(500,function(){
			$('.lnb_open').focus();
		});
		return false;
	});
}


/*장바구니*/
function cartBtn(){
	$(document).on("click",'.cart_btn', function(){
		$('.cart_view').show(500);
		return false;
	});

	$(document).on("click", '.btn_cartClose', function(){
		$('.cart_view').hide(500,function(){
			$('.cart_btn').focus();
		});
		return false;
	});
}

/*폼요소*/
function formStyle(){
	$('label .checkbox,label .radio').focus(function(){
		$(this).parent().addClass('hover');
	}).blur(function(){
		$(this).parent().removeClass('hover');
	});
}
function inputFile(){
	$('.input_file > input').click(function(){
		$('.btn_file input').trigger('click');
	});

	$('.input_file > input').focus(function(){
		$('.btn_file input').trigger('click');
	});
	
	$('.btn_file .btn').click(function(e){
		e.preventDefault();
		$('.btn_file input').trigger('click');
	});
	
	$('.btn_file input').change(function(){
		$('.input_file > input').val($(this).val());
	});
}


/* TOP 버튼 */
function topBtn() {
    var settings = {
            button      : '#toTop',
            text        : '컨텐츠 상단으로 이동',
            min         : 100,
            fadeIn      : 400,
            fadeOut     : 400,
            scrollSpeed : 800,
            easingType  : 'easeInOutExpo'
        },
        oldiOS     = false,
        oldAndroid = false;

    if( /(iPhone|iPod|iPad)\sOS\s[0-4][_\d]+/i.test(navigator.userAgent) ) { oldiOS = true; }
    if( /Android\s+([0-2][\.\d]+)/i.test(navigator.userAgent) ) { oldAndroid = true; }
    $('body').append('<a href="#" id="' + settings.button.substring(1) + '" title="' + settings.text + '">' + settings.text + '</a>');
    $( settings.button ).on('click', function( e ){
        $('html, body').animate({ scrollTop : 0 }, settings.scrollSpeed, settings.easingType );
        e.preventDefault();
    })
    .on('mouseenter', function() {
        $( settings.button ).addClass('hover');
    })
    .on('mouseleave', function() {
        $( settings.button ).removeClass('hover');
    });

    $(window).scroll(function() {
        var position = $(window).scrollTop();
        if( oldiOS || oldAndroid ) {
            $( settings.button ).css({
                'position' : 'absolute',
                'top'      : position + $(window).height()
            });
        }
        if ( position > settings.min ) { $( settings.button ).fadeIn( settings.fadeIn );  }
        else { $( settings.button ).fadeOut( settings.fadeOut );  }
    });
}


/* Tap */
function tapMotion(){	
	$('.tabMotion a').click(function() {
		var href = $(this).attr('href');		
		$(href).show().siblings('.tab_cont').hide();;
		$(this).parent().addClass('on').siblings().removeClass('on');
		return false;
    });

	if($('.tabMotion').size() > 0){
		$('.tabMotion li').eq(0).children('a').trigger('click');;
	}

	$('.tabMotion2 > li > a').click(function() {		
		$(this).parent().addClass('on').siblings().removeClass('on');
		return false;
    });
	 
	if($('.tabMotion2').size() > 0){
		$('.tabMotion2 > li').eq(0).children('a').trigger('click');;
	}
}

/*메뉴*/
function menuCtrl() {
	$('.product_list li').hover(function () {
		$(this).addClass('hover');
		$(this).children('div').stop().hide().slideDown();
	},function () {
		$(this).removeClass('hover');
		$(this).children('div').removeAttr('style');
	});

	$('.product_list li > a').focus(function () {		
		$(this).parent().addClass('hover').siblings().removeClass('hover').children('.list_cont').removeAttr('style');
		$(this).siblings().stop().hide().slideDown();
	});

	$('.product_list li:last-child .btn_view').blur(function () {
		$(this).parent().parent().removeClass('hover');
		$(this).parent().stop().removeAttr('style');
	});
	
}


/*레이어 팝업*/
 function layerCtrl() {
	 $(document).on("click",'.pop_open', function() {
        var _this =$(this);
        var vCont = _this.attr('href');
		var mh =  $(vCont).outerHeight();
		//console.log(mh);

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
	});
}

/* SNS 퍼가기 */
function snsCtrl(){
    $('.btn_fb').click(function() {
        snsLinker(0,$(this));
        return false;
    });

    $('.btn_twt').click(function() {
        snsLinker(1,$(this));
        return false;
    });

    $('.btn_m2day').click(function() {
        snsLinker(2,$(this));
        return false;
    });
};

function snsLinker(idx,tar){
    var url   = "";
    var title = document.title;
	var _this = tar;
	var link; 

	if(_this.hasClass('list_sns')){
		var linkTxt  = _this.parent().siblings('a').attr('href');
		link  = 'http://www.kidsnkeys.co.kr' + linkTxt;
	}else{
		link  = document.location;
	}

	//console.log(link);

     switch(idx)
     {
          //페이스북
          case 0 : url = "http://www.facebook.com/sharer.php?u="+link+"&t="+encodeURIComponent(title);break;
          //트위터
          case 1 : url = "http://twitter.com/home?status="+encodeURIComponent(title)+" : "+link; break;
          //미투데이
          case 2 : url = "http://me2day.net/posts/new?new_post[body]='" + encodeURIComponent(title)+"' : "+ link +"&new_post[tags]="+encodeURIComponent("sns달기 테스트"); break;
     }

     var retPop = window.open(url,'sns','height=500px, width=750px');
     if(retPop == null){
          alert("팝업 차단을 사용안함으로 설정해주시기 바랍니다.");
     }
     return false;
}

/*기타*/
 function etcCtrl(){
	//로그아웃
	$('.btn_logout').click(function() {
		$('.logout_box').show(500);
		return false;
	});
	$('.logout_close').click(function() {
		$('.logout_box').hide(500,function(){
			$('.btn_logout').focus();
		});
		return false;
	});
	
	//딜리버리 안내
	$('.delibery_open').click(function() {
		$('.delibery_box').show(500);
		return false;
	});
	$('.delibery_close').click(function() {
		$('.delibery_box').hide(500,function(){
			$('.delibery_open').focus();
		});
		return false;
	});
	//QNA 
	$('.qna_motion dt a').click(function() {
		if($(this).parents('.qna_motion').hasClass('tbl_style')){			
			$(this).parents('tr').toggleClass('on').siblings().removeClass('on');
			$(this).parent().next().slideToggle(300).parents('tr').siblings().find('dd').slideUp(300);;
		}else{
			$(this).parent('dt').toggleClass('on').siblings('dt').removeClass('on');
			$(this).parent().next().slideToggle(300).siblings('dd').slideUp(300);
		}		
		return false;
	});
	$('.qna_motion dd .btn_close').click(function() {		
		$('.qna_motion').find('.on').removeClass('on');
		$('.qna_motion dd').slideUp(300);
		return false;
	});

	//인쇄
	$('.btn_print').click(function() {
		window.print();
		return false;
	});

 }
 
 function serverToday(){ 
	  var xmlHttp; 
	  //분기하지 않으면 IE에서만 작동된다. 
	  if (window.XMLHttpRequest) { // IE 7.0 이상, 크롬, 파이어폭스일 경우 분기 
		xmlHttp = new XMLHttpRequest(); 
		xmlHttp.open('HEAD',window.location.href.toString(),false);
		xmlHttp.setRequestHeader("Content-Type", "text/html"); 
		xmlHttp.send(''); 
	  }else if (window.ActiveXObject) { 
		xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
		xmlHttp.open('HEAD',window.location.href.toString(),false);
		xmlHttp.setRequestHeader("Content-Type", "text/html"); 
		xmlHttp.send(''); 
	  } 
	  var st = xmlHttp.getResponseHeader("Date");
	  var curDate = new Date(st); 
	  var curDateFmt; var year = curDate.getFullYear(); 
	  var month = curDate.getMonth()+1; 
	  var day = curDate.getDate(); 
	  var hours = curDate.getHours(); 
	  var minutes = curDate.getMinutes(); 
	  if(parseInt(month) < 10){ 
		month = 0 + "" + month; 
	  } 
	  if(parseInt(day) < 10){ 
		day = 0 + "" + day; 
	  } 
	  if(parseInt(hours) < 10){ 
		hours = 0 + "" + hours; 
	  } if(parseInt(minutes) < 10){ 
		minutes = 0 + "" + minutes; 
	  } 
	//  curDateFmt = parseInt(year + "" + month + "" + day + "" + hours + "" + minutes); 
	  curDateFmt = parseInt(year + "" + month + "" + day); 
	  return curDateFmt; 
}
 var serverDate=serverToday();
	
