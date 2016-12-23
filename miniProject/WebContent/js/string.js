
      /*--------------------------------------------------------------------------------*\
       *  JavaScript framework, version 2.0
       *
      *  Date : 2006. 08. 15.
      *  Copyright 2004-2007 by Vricks Studio. All right reserved.
      *  @author Jeff Yang routine@vricks.com
      *  자주 쓰이는 스트링 관련 prototype관련 정리
     \*--------------------------------------------------------------------------------*/
     
    /*---------------------------------------------------------------------------------*\
     *  String prototype
    \*---------------------------------------------------------------------------------*/
        //-----------------------------------------------------------------------------
        // 문자의 좌, 우 공백 제거
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.trim = function() {
           return this.replace(/(^\s*)|(\s*$)/g, "");
        };
        //-----------------------------------------------------------------------------
        // 문자의 좌 공백 제거
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.ltrim = function() {
           return this.replace(/(^\s*)/, "");
        };
       //-----------------------------------------------------------------------------
        // 문자의 우 공백 제거
        // @return : String
        //-----------------------------------------------------------------------------
       String.prototype.rtrim = function() {
           return this.replace(/(\s*$)/, "");    
        };
        //-----------------------------------------------------------------------------
       // 문자열의 byte 길이 반환
        // @return : int
        //-----------------------------------------------------------------------------
        String.prototype.byte = function() {
           var cnt = 0;
           for (var i = 0; i < this.length; i++) {
                if (this.charCodeAt(i) > 127)
                   cnt += 2;
                else
                   cnt++;
            }
           return cnt;
       };
       //-----------------------------------------------------------------------------
        // 정수형으로 변환
       // @return : String
        //-----------------------------------------------------------------------------
       String.prototype.int = function() {
           if(!isNaN(this)) {
               return parseInt(this);
            }
           else {
                return null;    
           }
        };
       //-----------------------------------------------------------------------------
        // 숫자만 가져 오기
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.num = function() {
            return (this.trim().replace(/[^0-9]/g, ""));
        };
        //-----------------------------------------------------------------------------
        // 숫자에 3자리마다 , 를 찍어서 반환
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.money = function() {
            var num = this.replace(/(^\s*)|(\s*$)/g, "");
            while((/(-?[0-9]+)([0-9]{3})/).test(num)) {
                num = num.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
            }
            return num;
        };
        
        function changeMoney(str) {

            var num = str.replace(/(^\s*)|(\s*$)/g, "");
            while((/(-?[0-9]+)([0-9]{3})/).test(num)) {
                num = num.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
            }
            return num;
        }
        
        //-----------------------------------------------------------------------------
        // 핸프돈마다 - 를 찍어서 반환
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.phone = function() {
            var num = this.trim();
            
            if(num.length == 10) {
            	var num1 = num.substring(0, 3);
            	var num2 = num.substring(3, 6);
            	var num3 = num.substring(6, 10);
            	
	            num = num1 + "-" + num2 + "-" + num3;
            }
            else if(num.length == 11) {
            	var num1 = num.substring(0, 3);
            	var num2 = num.substring(3, 7);
            	var num3 = num.substring(6, 11);
            	
	            num = num1 + "-" + num2 + "-" + num3;
            }
            return num;
        };
        
      //-----------------------------------------------------------------------------
     // 날짜 - 를 찍어서 반환  ex)2014-05-20
     // @return : String
     //-----------------------------------------------------------------------------
             String.prototype.date = function() {
                 var date = this.trim();
                 
                 if(date.length == 8) {
                 	var date1 = date.substring(0, 4);
                 	var date2 = date.substring(4, 6);
                 	var date3 = date.substring(6, 8);
                 	
                 	date = date1 + "-" + date2 + "-" + date3;
                 }
                 return date;
             };

        
        //-----------------------------------------------------------------------------
        // 숫자의 자리수(cnt)에 맞도록 반환
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.digits = function(cnt) {
            var digit = "";
            if (this.length < cnt) {
                for(var i = 0; i < cnt - this.length; i++) {
                    digit += "0";
                }
            }
            return digit + this;
        };
        //-----------------------------------------------------------------------------
        // " -> &#34; ' -> &#39;로 바꾸어서 반환
        // @return : String
        //-----------------------------------------------------------------------------
        String.prototype.quota = function() {
            return this.replace(/"/g, "&#34;").replace(/'/g, "&#39;");
       };
        //-----------------------------------------------------------------------------
        // 파일 확장자만 가져오기
       // @return : String
      //-----------------------------------------------------------------------------
      String.prototype.ext = function() {
           return (this.indexOf(".") < 0) ? "" : this.substring(this.lastIndexOf(".") + 1, this.length);    
       };
       //-----------------------------------------------------------------------------
       // URL에서 파라메터 제거한 순수한 url 얻기
       // @return : String
       //-----------------------------------------------------------------------------    
       String.prototype.uri = function() {
           var arr = this.split("?");
           arr = arr[0].split("#");
           return arr[0];    
       };
   
   /*---------------------------------------------------------------------------------*\
    *  각종 체크 함수들
   \*---------------------------------------------------------------------------------*/
      
       //-----------------------------------------------------------------------------
       // 정규식에 쓰이는 특수문자를 찾아서 이스케이프 한다.
       // @return : String
       //-----------------------------------------------------------------------------
       String.prototype.remove = function(pattern) {
           return (pattern == null) ? this : eval("this.replace(/[" + pattern.meta() + "]/g, \"\")");
       };
       //-----------------------------------------------------------------------------
       // 최소 최대 길이인지 검증
       // str.isLength(min [,max])
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isLength = function() {
           var min = arguments[0];
           var max = arguments[1] ? arguments[1] : null;
           var success = true;
           if(this.length < min) {
               success = false;
           }
           if(max && this.length > max) {
               success = false;
           }
           return success;
       };

       function maxLengthCheck(object) {
           if (object.value.length > object.maxLength)
           	object.value = object.value.slice(0, object.maxLength); 
       };
       //-----------------------------------------------------------------------------
       // 최소 최대 바이트인지 검증
       // str.isByteLength(min [,max])
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isByteLength = function() {
           var min = arguments[0];
           var max = arguments[1] ? arguments[1] : null;
           var success = true;
           if(this.byte() < min) {
               success = false;
           }
           if(max && this.byte() > max) {
               success = false;
           }
           return success;
       };
       //-----------------------------------------------------------------------------
       // 공백이나 널인지 확인
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isBlank = function() {
           var str = this.trim();
           for(var i = 0; i < str.length; i++) {
               if ((str.charAt(i) != "\t") && (str.charAt(i) != "\n") && (str.charAt(i)!="\r")) {
                   return false;
               }
           }
           return true;
       };
       //-----------------------------------------------------------------------------
       // 숫자로 구성되어 있는지 학인
       // arguments[0] : 허용할 문자셋
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isNum = function() {
           return (/^[0-9]+$/).test(this.remove(arguments[0])) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 영어만 허용 - arguments[0] : 추가 허용할 문자들
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isEng = function() {
           return (/^[a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 숫자와 영어만 허용 - arguments[0] : 추가 허용할 문자들
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isEngNum = function() {
           return (/^[0-9a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 숫자와 영어만 허용 - arguments[0] : 추가 허용할 문자들
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isNumEng = function() {
           return this.isEngNum(arguments[0]);
       };
       //-----------------------------------------------------------------------------
       // 아이디 체크 영어와 숫자만 체크 첫글자는 영어로 시작 - arguments[0] : 추가 허용할 문자들
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isUserid = function() {
           return (/^[a-zA-z]{1}[0-9a-zA-Z]+$/).test(this.remove(arguments[0])) ? true : false;
      };
       //-----------------------------------------------------------------------------
       // 한글 체크 - arguments[0] : 추가 허용할 문자들
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isKor = function() {
           return (/^[가-힣]+$/).test(this.remove(arguments[0])) ? true : false;
       };
       
       String.prototype.isKorEng = function() {
           return (/^[a-zA-Z가-힣]+$/).test(this.remove(arguments[0])) ? true : false;
       };
       

       //-----------------------------------------------------------------------------
       // 영어숫자한글만 허용 - arguments[0] : 추가 허용할 문자들
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isEngKorNum = function() {
           return (/^[0-9a-zA-Z가-힣]+$/).test(this.remove(arguments[0])) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 주민번호 체크 - arguments[0] : 주민번호 구분자
       // XXXXXX-XXXXXXX
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isJumin = function() {
    	   var arg = null;
    	   
    	   if(this.indexOf("-", 0) != -1) {
    		   arg = "-";
    	   } else {
    		   arg = "";    		   
    	   }
    	   
           var jumin = eval("this.match(/[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[1234]{1}[0-9]{6}$/)");
           if(jumin == null) {
               return false;
           }
           else {
               jumin = jumin.toString().num().toString();
           }
           // 생년월일 체크
           var birthYY = (parseInt(jumin.charAt(6)) == (1 ||2)) ? "19" : "20";
           birthYY += jumin.substr(0, 2);
           var birthMM = jumin.substr(2, 2) - 1;
           var birthDD = jumin.substr(4, 2);
           var birthDay = new Date(birthYY, birthMM, birthDD);
           if(birthDay.getYear() % 100 != jumin.substr(0,2) || birthDay.getMonth() != birthMM || birthDay.getDate() != birthDD) {
               return false;
           }        
           var sum = 0;
           var num = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
           var last = parseInt(jumin.charAt(12));
           for(var i = 0; i < 12; i++) {
               sum += parseInt(jumin.charAt(i)) * num[i];
           }
           return ((11 - sum % 11) % 10 == last) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 외국인 등록번호 체크 - arguments[0] : 등록번호 구분자
       // XXXXXX-XXXXXXX
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isForeign = function() {
           var arg = arguments[0] ? arguments[0] : "";
           var jumin = eval("this.match(/[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[5678]{1}[0-9]{1}[02468]{1}[0-9]{2}[6789]{1}[0-9]{1}$/)");
           if(jumin == null) {
               return false;
           }
           else {
               jumin = jumin.toString().num().toString();
           }
           // 생년월일 체크
           var birthYY = (parseInt(jumin.charAt(6)) == (5 || 6)) ? "19" : "20";
           birthYY += jumin.substr(0, 2);
          var birthMM = jumin.substr(2, 2) - 1;
           var birthDD = jumin.substr(4, 2);
           var birthDay = new Date(birthYY, birthMM, birthDD);
           if(birthDay.getYear() % 100 != jumin.substr(0,2) || birthDay.getMonth() != birthMM || birthDay.getDate() != birthDD) {
               return false;
           }
          if((parseInt(jumin.charAt(7)) * 10 + parseInt(jumin.charAt(8))) % 2 != 0) {
               return false;
           }
           var sum = 0;
           var num = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
           var last = parseInt(jumin.charAt(12));
           for(var i = 0; i < 12; i++) {
               sum += parseInt(jumin.charAt(i)) * num[i];
           }
           return (((11 - sum % 11) % 10) + 2 == last) ? true : false;
       };    
       //-----------------------------------------------------------------------------
       // 사업자번호 체크 - arguments[0] : 등록번호 구분자
       // 
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isBiznum = function() {
    	   var arg = null;
    	   
    	   if(this.indexOf("-", 0) != -1) {
    		   arg = "-";
    	   } else {
    		   arg = "";    		   
    	   }
    	   
           var biznum = eval("this.match(/[0-9]{3}" + arg + "[0-9]{2}" + arg + "[0-9]{5}$/)");
           if(biznum == null) {
               return false;
           }
           else {
               biznum = biznum.toString().num().toString();
           }
           var sum = parseInt(biznum.charAt(0));
           var num = [0, 3, 7, 1, 3, 7, 1, 3];
           for(var i = 1; i < 8; i++) sum += (parseInt(biznum.charAt(i)) * num[i]) % 10;
           sum += Math.floor(parseInt(parseInt(biznum.charAt(8))) * 5 / 10);
           sum += (parseInt(biznum.charAt(8)) * 5) % 10 + parseInt(biznum.charAt(9));
           return (sum % 10 == 0) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 법인 등록번호 체크 - arguments[0] : 등록번호 구분자
       // XXXXXX-XXXXXXX
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isCorpnum = function() {
          var arg = arguments[0] ? arguments[0] : "";
           var corpnum = eval("this.match(/[0-9]{6}" + arg + "[0-9]{7}$/)");
           if(corpnum == null) {
               return false;
           }
           else {
               corpnum = corpnum.toString().num().toString();
           }
           var sum = 0;
           var num = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2];
           var last = parseInt(corpnum.charAt(12));
           for(var i = 0; i < 12; i++) {
               sum += parseInt(corpnum.charAt(i)) * num[i];
           }
           return ((10 - sum % 10) % 10 == last) ? true : false;
       };
       //-----------------------------------------------------------------------------
       // 이메일의 유효성을 체크
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isEmail = function() {
           return (/\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/).test(this.trim());
       };
       //-----------------------------------------------------------------------------
       // 전화번호 체크 - arguments[0] : 전화번호 구분자
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isPhone = function() {
    	   var arg = null;
    	   
    	   if(this.indexOf("-", 0) != -1) {
    		   arg = "-";
    	   } else {
    		   arg = "";    		   
    	   }
    	   
           return eval("(/(02|0[3-9]{1}[0-9]{1})" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(this)");
       };
       //-----------------------------------------------------------------------------
       // 핸드폰번호 체크 - arguments[0] : 핸드폰 구분자
       // @return : boolean
       //-----------------------------------------------------------------------------
       String.prototype.isMobile = function() {
    	   var arg = null;
    	   
    	   if(this.indexOf("-", 0) != -1) {
    		   arg = "-";
    	   } else {
    		   arg = "";    		   
    	   }
    	   
           return eval("(/01[016789]" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(this)");
 	};
 	//-----------------------------------------------------------------------------
    // 우편번호 체크 - arguments[0]  : 우편번호 구분자
    // @return : boolean
    //-----------------------------------------------------------------------------
    String.prototype.isPost = function() {
 	   var arg = null;
 	   
 	   if(this.indexOf("-", 0) != -1) {
 		   arg = "-";
 	   } else {
 		   arg = "";    		   
 	   }
 	   
        return eval("(/([0-9]{3})" + arg + "[0-9]{3}$/).test(this)");
    };
    
 // 컨트롤 시프트 알트키 잡기
    function notCtrl() {
    	if(event.ctrlKey == true) {
    		 event.returnValue = false;
    	 }
    	if(event.shiftKey == true) {
    		 event.returnValue = false;
    	 }
    	if(event.altKey == true) {
    		 event.returnValue = false;
    	 }    	
    }
    
    // 오직 숫자만! 체크!
    function onlyNumber(){
    	 var key = null;
    	 key = event.keyCode;
    		 
    	 //alert(key);
    	 // 8 : 백스페이트
    	 // 9 : 탭
    	 // 13 : enter
    	 // 35 : End, 36 : Home
    	 // 37 : <-, 39 : ->
    	 // 44 : , 46 : .
    	 // 45 : Inert, 46 : delete    	 
    	 // 144 : numlock
    	 // 190 : 
    	 if(!	(key==8		||
    			 key==9		||
    			 key==13	||
    			 key==35	||
    			 key==36	||
    			 key==37	||
    			 key==39	||
    			 key==45	||
    			 key==46	||
    			 key==144	||
    			(key>=48&&key<=57)	||
    			//(key>=96&&key<=105)	||
    			key==190)){
    		 
    		 //alertPopup('숫자만 입력 가능합니다');

    		 if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
    	 }
    }
    
    function onlyEnglish(field) {
    	var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; // 유효한 값
    	var ok = "yes";
    	var temp;
    	
    	for (var i=0; i<field.length; i++) {
    		temp = "" + field.substring(i, i+1);
    		
    		if (valid.indexOf(temp) == "-1") ok = "no";
    	}
    	
    	if (ok == "no") {
    		alertPopup("영문자만 입력 가능합니다");
    		field.focus();
    		field.select();
    	}
    }
    
    function next(target, next, size) {
    	
    	if(target.value.length == size) {
    		next.focus();
    	}
    }
	
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	
		
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	
	
	function dateToString(date) {
		
		var str = "";
		str += date.getFullYear();
		str += "-";
		
		var month = date.getMonth()+1;
		
		if(month < 10) {
			str += "0" + month;
		}
		else {
			str += month;
		}
		str += "-";
		
		var day = date.getDate();
		
		if(day < 10) {
			str += "0" + day;
		}
		else {
			str += day;
		}
		
		//alert("DEBUG >>>>> year : " + date.getFullYear() + "month : " + month + "day : " + day);
		return str;
	}
	
	//시작일, 종료일 체크
	function onCheckDate(startDatePicker, endDatePicker) {
		
		var nowDate = new Date();
		//alert("DEBUG >>>> now : " + nowDate);
		
		var startDate = null;
		var endDate = null;
		
		if(startDatePicker.val() != "") {
			var startYear 	= startDatePicker.val().substring(0, 4); 
			var startMonth 	= startDatePicker.val().substring(5, 7); 
			var startDay 	= startDatePicker.val().substring(8, 10); 
			//alert("DEBUG >>>>> Year : " + startYear + ", Month : " + startMonth + ", Day : " + startDay);
			
			startDate  	= new Date(startYear, startMonth-1, startDay);
			
			if(startDate < nowDate) {
				alert("오늘 이후의 일만 선택이 가능합니다.");
				startDate.setDate(nowDate.getDate() + 1);
				startDatePicker.val(dateToString(startDate));
			}
		}
		
		if(endDatePicker.val() != "") {
			var endYear 	= endDatePicker.val().substring(0, 4); 
			var endMonth 	= endDatePicker.val().substring(5, 7); 
			var endDay 		= endDatePicker.val().substring(8, 10); 
			//alert("DEBUG >>>>> Year : " + endYear + ", Month : " + endMonth + ", Day : " + endDay);
			
			endDate  = new Date(endYear, endMonth-1, endDay);
			
			if(endDate < nowDate) {
				alert("오늘 이후의 일만 선택이 가능합니다.");
				
				endDate = nowDate;
				endDate.setDate(nowDate.getDate() + 1);
				endDatePicker.val(dateToString(endDate));
			}
		}
			           			
		if(startDatePicker.val() != "" && endDatePicker.val() != "") {
		
			//alert(	"DEBUG >>>>> StartDate : " + startDate + "\n" +	"DEBUG >>>>> EndDate : " + endDate);  
			if(startDate >= endDate) {
				alert("시작일은 종료일보다 이전일이어야 합니다.");
				
				endDate = startDate;
				endDate.setDate(startDate.getDate() + 1);
				endDatePicker.val(dateToString(endDate));
			}
		}
	}
	
	function onCheckDate2(startDatePicker, endDatePicker) {
				
		var startDate = null;
		var endDate = null;
		
		if(startDatePicker.val() != "") {
			var startYear 	= startDatePicker.val().substring(0, 4); 
			var startMonth 	= startDatePicker.val().substring(5, 7); 
			var startDay 	= startDatePicker.val().substring(8, 10); 
			//alert("DEBUG >>>>> Year : " + startYear + ", Month : " + startMonth + ", Day : " + startDay);
			
			startDate  	= new Date(startYear, startMonth-1, startDay);
		}
		
		if(endDatePicker.val() != "") {
			var endYear 	= endDatePicker.val().substring(0, 4); 
			var endMonth 	= endDatePicker.val().substring(5, 7); 
			var endDay 		= endDatePicker.val().substring(8, 10); 
			//alert("DEBUG >>>>> Year : " + endYear + ", Month : " + endMonth + ", Day : " + endDay);
			
			endDate  = new Date(endYear, endMonth-1, endDay);
		}
			           			
		if(startDatePicker.val() != "" && endDatePicker.val() != "") {
		
			//alert(	"DEBUG >>>>> StartDate : " + startDate + "\n" +	"DEBUG >>>>> EndDate : " + endDate);  
			if(startDate >= endDate) {
				alert("시작일은 종료일보다 이전일이어야 합니다.");
				
				endDate = startDate;
				endDate.setDate(startDate.getDate() + 1);
				endDatePicker.val(dateToString(endDate));
			}
		}
	}
	
	//만 나이 계산
	function calcAge(birth) {
		
		var date = new Date();
		var year = date.getFullYear();
		var month = (date.getMonth() + 1);
		var day = date.getDate();
		
		if(month < 10) month = '0' + month;
		if(day < 10) day = '0' + day;
		var monthDay = month + day;
		
		birth = birth.replace('-', '').replace('-', '');
		var birthdayy = birth.substr(0, 4);
		var birthdaymd = birth.substr(4, 4);
		
		var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
		return age;
		
	} 
	
	//남은 기간 연산 문자열
	function timeLengthByString(startDateString, endDateString) {
		
		var startDateYear = startDateString.substring(0, 4);
		var startDateMonth = startDateString.substring(4, 6);
		var startDateDay = startDateString.substring(6, 8);

		var endDateYear = endDateString.substring(0, 4);
		var endDateMonth = endDateString.substring(4, 6);
		var endDateDay = endDateString.substring(6, 8);
		
		var startDate = new Date(startDateYear, startDateMonth, startDateDay);
		var endDate = new Date(endDateYear, endDateMonth, endDateDay);
		
		return timeLengthByDate(startDate, endDate);
	}
	
	//남은 기간 연산 Date
	function timeLengthByDate(startDate, endDate) {
		
		var remainDate = endDate.getTime() - startDate.getTime();
		var remainDay = remainDate / (1000 * 60 * 60 * 24);
		
		return remainDay;		
	}
	
	//운영체제 정보 얻기
	function getOSInfoStr() {
	    var ua = navigator.userAgent;
	 
	    if(ua.indexOf("NT 6.0") != -1) return "Windows Vista/Server 2008";
	    else if(ua.indexOf("NT 5.2") != -1) return "Windows Server 2003";
	    else if(ua.indexOf("NT 5.1") != -1) return "Windows XP";
	    else if(ua.indexOf("NT 5.0") != -1) return "Windows 2000";
	    else if(ua.indexOf("NT") != -1) return "Windows NT";
	    else if(ua.indexOf("9x 4.90") != -1) return "Windows Me";
	    else if(ua.indexOf("98") != -1) return "Windows 98";
	    else if(ua.indexOf("95") != -1) return "Windows 95";
	    else if(ua.indexOf("Win16") != -1) return "Windows 3.x";
	    else if(ua.indexOf("Windows") != -1) return "Windows";
	    else if(ua.indexOf("Linux") != -1) return "Linux";
	    else if(ua.indexOf("Macintosh") != -1) return "Macintosh";
	    else return "";
	}
	
	//브라우져 체크하기
	function onBrowserCheck () {
		var agt = navigator.userAgent.toLowerCase();
		
		if (agt.indexOf("chrome") != -1) return 'Chrome'; 
		if (agt.indexOf("opera") != -1) return 'Opera'; 
		if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
		if (agt.indexOf("webtv") != -1) return 'WebTV'; 
		if (agt.indexOf("beonex") != -1) return 'Beonex'; 
		if (agt.indexOf("chimera") != -1) return 'Chimera'; 
		if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
		if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
		if (agt.indexOf("firefox") != -1) return 'Firefox'; 
		if (agt.indexOf("safari") != -1) return 'Safari'; 
		if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
		if (agt.indexOf("msie") != -1) return 'Internet Explorer'; 
		if (agt.indexOf("netscape") != -1) return 'Netscape'; 
		if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'; 
	}
	
	//기기 체크하기
	var isMobile = {
	        Android: function () {
	                 return navigator.userAgent.match(/Android/i);
	        },
	        BlackBerry: function () {
	                 return navigator.userAgent.match(/BlackBerry/i);
	        },
	        iOS: function () {
	                 return navigator.userAgent.match(/iPhone|iPad|iPod/i);
	        },
	        Opera: function () {
	                 return navigator.userAgent.match(/Opera Mini/i);
	        },
	        Windows: function () {
	                 return navigator.userAgent.match(/IEMobile/i);
	        },
	        any: function () {
	                 return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
	        }
	};
	
	// 컨트롤 시프트 알트키 잡기
	function notCtrl() {
		if(event.ctrlKey == true) {
			if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
		 }
		if(event.shiftKey == true) {
			if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
		 }
		if(event.altKey == true) {
			if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
		 }		
	}
	
	// 오직 한글, 영문만! 체크!
	function onlyKorAndEng(){
		 var key = event.keyCode;		 
		 
		 if(( key < 65) || ( key > 122 && key <= 127)){
			 // alert('한글과 영문만 입력 가능합니다');
			 if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
		 }
	}
	
	// 오직 한글만! 체크!
	function onlyKor(){
		 var key = event.keyCode;		 
		 
		 if(( key < 12592) || ( key > 12687)){
			 // alert('한글만 입력 가능합니다');
			 if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
		 }
	}
	
	// 오직 이메일(id) 체크!
	function onlyEmailInput(){
		
		var currentEvent = event; 
		var key = event.keyCode;
		//alert(key);
		 
		 if(key > 47 && key < 58){
			 
			 if(key == 48){
				 if(event.preventDefault) {
					 event.preventDefault();					 
				 }
				 else {
					 event.returnValue = false;					 
				 }
			 }		 
		 }
		 else{
			 if(event.preventDefault) {
				 event.preventDefault();					 
			 }
			 else {
				 event.returnValue = false;					 
			 }
		 }
	}
	
	//숫자만 입력허용.
	function isNumberKey(evt) {		
		var charCode	 = (evt.which) ? evt.which : event.keyCode;

		if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
			//alert("숫자만입력 가능합니다.");
			return false;
		} else {
			return true;			
		}
	}
		

	// 숫자의 길이는 세자리까지
	function checkLength(text) {
		var textValue	 = text.value;
		
		if (textValue.length > 4) {		
			//alert("세자리까지만 입력 가능합니다.");				
			text.value = textValue.substr(0, 4);
		}
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// 입력글자수 제한 함수
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function fc_chk_byte(obj_name,max_length) {
	   var ls_str		 = obj_name.value;		 // 이벤트가 일어난 컨트롤의 value 값
	   var li_str_len	 = ls_str.length;		 // 전체길이 
	   var li_max		 = max_length - 10;		 // 제한할 글자수 크기  //추가 - 엔터입력시 value가 byte수와는 다르게 계산되는경우가 존재 엔터입력대응책
	   var i			 = 0;					 // for문에 사용
	   var li_byte		 = 0;					 // 한글일경우는 2 그밗에는 1을 더함
	   var li_len		 = 0;					 // substring하기 위해서 사용
	   var ls_one_char	 = "";					 // 한글자씩 검사한다
	   var ls_str2		 = "";					 // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
	   
	   for(i=0; i< li_str_len; i++) {     
		  ls_one_char = ls_str.charAt(i);		 // 한글자추출
		 
		  if (escape(ls_one_char).length > 4) {	 // 한글이면 2를 더한다.	
			 li_byte = li_byte+2;
		  } else {								 // 그외의 경우는 1을 더한다.
			 li_byte++;
		  }
		 
		  if(li_byte <= li_max) {				 // 전체 크기가 li_max를 넘지않으면      
			 li_len = i + 1;
		  }
	   }   
	   
	   // 전체길이를 초과하면
	   if(li_byte > li_max)
	   {
		  alert("입력가능한 글자수를 초과하였습니다.");
		  ls_str2 = ls_str.substr(0, li_len);
		  obj_name.value = ls_str2; 
		  //document.frms.chkbytes.value = cal_length(obj_name.value);
	   }
	   obj_name.focus();   
	   //document.frms.chkbytes.value = cal_length(ls_str);
	}

	/**
	 * 한글을 2바이트 씩 계산하여 입력받은 문자열이 DB에 저장될 때 총 몇바이트를 차지하는지 계산한다.
	 * 엔터(\r\n)는 2바이트를 차지한다.
	 * @param val : 입력받은 문자열
	 */
	function cal_length(val) {
	  // 입력받은 문자열을 escape() 를 이용하여 변환한다.
	  // 변환한 문자열 중 유니코드(한글 등)는 공통적으로 %uxxxx로 변환된다.
	  var temp_estr = escape(val);
	  var s_index   = 0;
	  var e_index   = 0;
	  var temp_str  = "";
	  var cnt       = 0;

	  // 문자열 중에서 유니코드를 찾아 제거하면서 갯수를 센다.
	  while ((e_index = temp_estr.indexOf("%u", s_index)) >= 0) {			 // 제거할 문자열이 존재한다면	  
		temp_str += temp_estr.substring(s_index, e_index);
		s_index = e_index + 6;
		cnt ++;
	  }

	  temp_str += temp_estr.substring(s_index);

	  temp_str = unescape(temp_str);  // 원래 문자열로 바꾼다.

	  // 유니코드는 2바이트 씩 계산하고 나머지는 1바이트씩 계산한다.
	  return ((cnt * 2) + temp_str.length) + "";
	}
	
	function replaceNum(text) {
		var value = text.value;
		text.value = value.replace(/[^0-9]/gi,"");
	}

	var cdn_path = "http://cdn.pizzahut.co.kr/IPizzahut/mobile_test";
	//var cdn_path = "http://cdn.pizzahut.co.kr/IPizzahut/mobile";
