//forEach script
if (window.NodeList && !NodeList.prototype.forEach) {
    NodeList.prototype.forEach = Array.prototype.forEach;
}

if (!String.prototype.startsWith) {
	String.prototype.startsWith = function(str) {
		if (this.length < str.length) { return false; }
		return this.indexOf(str) == 0;
	}
}
if (!String.prototype.endsWith) {
	String.prototype.endsWith = function(str) {
		if (this.length < str.length) { return false; }
		return this.lastIndexOf(str) + str.length == this.length;
	}
}

if(!String.prototype.substr) {
    String.prototype.substr = function(substr) {
        return function(start, length) {
            // call the original method
            return substr.call(this,
                // did we get a negative start, calculate how much it is from the beginning of the string
                // adjust the start parameter for negative value
                start < 0 ? this.length + start : start,
                length
            )
        }
    };
}
(function (arr) {
arr.forEach(function (item) {
    if (item.hasOwnProperty('after')) {
    return;
    }
    Object.defineProperty(item, 'after', {
    configurable: true,
    enumerable: true,
    writable: true,
    value: function after() {
        var argArr = Array.prototype.slice.call(arguments),
        docFrag = document.createDocumentFragment();

        argArr.forEach(function (argItem) {
        var isNode = argItem instanceof Node;
        docFrag.appendChild(isNode ? argItem : document.createTextNode(String(argItem)));
        });

        this.parentNode.insertBefore(docFrag, this.nextElementSibling);
    }
    });
});
})([Element.prototype, CharacterData.prototype, DocumentType.prototype]);


var agent = navigator.userAgent.toLowerCase();
var isIe = false;
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

var responsive = {
    'pcOnly'  : window.matchMedia("(min-width: 1025px)").matches,
    'tabOnly' : window.matchMedia("(min-width: 801px) and (max-width: 1024px)").matches,
    'tab'     : window.matchMedia("(max-width: 1280px)").matches,
    'tabS'    : window.matchMedia("(max-width: 1024px)").matches,
    'mob'     : window.matchMedia("(max-width: 800px)").matches
}

function responsiveEvt(_matchMedia){
	return  window.matchMedia(_matchMedia).matches;
}


if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
    isIe = true;
}

// Mobile
if(isMobile && !isIe){
	function vhMax (){
		var vh = window.innerHeight * 0.01
		document.documentElement.style.setProperty('--vh', vh + 'px');
	}
	vhMax();

    function vwMax (){
		var vw = window.innerWidth * 0.01
		document.documentElement.style.setProperty('--vw', vw + 'px');
	}
	vwMax();
}
// IE
if(isIe) {
	window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>');
	function vhMax (){
		var vh = window.innerHeight * 0.01
		document.documentElement.style.setProperty('--vh', vh + 'px');
	}
	vhMax();

    function vwMax (){
		var vw = window.innerWidth * 0.01
		document.documentElement.style.setProperty('--vw', vw + 'px');
	}
	vwMax();
}
window.addEventListener('resize', throttle(function() {
    // Mobile
    if(isMobile && !isIe){
    	function vhMax (){
    		var vh = window.innerHeight * 0.01
    		document.documentElement.style.setProperty('--vh', vh + 'px');
    	}
    	vhMax();

        function vwMax (){
    		var vw = window.innerWidth * 0.01
    		document.documentElement.style.setProperty('--vw', vw + 'px');
    	}
    	vwMax();
    }
    // IE
    if(isIe) {
    	window.MSInputMethodContext && document.documentMode && document.write('<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"><\/script>');
    	function vhMax (){
    		var vh = window.innerHeight * 0.01
    		document.documentElement.style.setProperty('--vh', vh + 'px');
    	}
    	vhMax();

        function vwMax (){
    		var vw = window.innerWidth * 0.01
    		document.documentElement.style.setProperty('--vw', vw + 'px');
    	}
    	vwMax();
    }
}, 300));


function openPopup(tg, _fnc){
    var context = this, args = arguments;
    var fileName = tg.replace('#','');
    if($(tg).length >= 1) $(tg).remove();
    $.ajax({
        url: '/popup/'+fileName,
        dataType : "html",
        success: function(data) {
            var html = $.parseHTML(data);
            document.getElementById('container').appendChild(html[0]);
            $(tg).addClass('on');
            $(tg).fadeIn(300);
            scroll.disable();
            if(_fnc) {
                _fnc.apply(context, args);
            };
        }
    })
    // 매개변수로 함수를 받으면 실행
    return false;
}
function openIncPopup(tg) {
    $(tg).addClass('on');
}

function addBoardNo() {
    var evt = $(this)[0];
    var tg = $(evt.target);
    $('#confirm_b_no').val($(tg).attr('alt'));
    $('#con_password').val('');
}
function closePopup(tg, _fnc) {
    if(_fnc) {
        var context = this, args = arguments;
        _fnc.apply(context, args);
    };
    $(tg).removeClass('on');
    $(tg).fadeOut(300, function() {
        $(tg).remove();
        scroll.enable();
    });
}
function closeIncPopup(tg) {
    $(tg).removeClass('on');
}
function noImage(el) {
    //el.src='/resource/images/common/no_img.svg';
    //el.alt='이미지 없음';
    el.src='/resource/images/no_image.jpg';
    el.alt='이미지 없음';
}


function noDataImage(el) {
    //el.src='/resource/images/common/logo_on.png';
    //el.alt='이미지 없음';
}

function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function actComma(_txt) {
    if((_txt != "")&&(_txt != "NaN")&&(_txt != "undefined")){
        var v = String(_txt);

        var exp = /^[0-9]$/g;
        var minus =  _txt < 0 ? '-' : '';
        regVal = v.replace(/\D/g,'');
        if(!exp.test(v)) {
            var len = regVal.length;
            var point = len % 3;
            str = regVal.substr(0, point);
            while( point < len) {
                if(str != '') str +=",";
                str += regVal.substring(point, point + 3);
                point += 3;
            }
            str = minus + str;
            return str;
        }
    }
    return _txt;
}

$(document).ready(function() {


    // .act_firstUpper 첫글자 대문자 이벤트
    firstLetterUpper();


    initTouchMouseMove();

    // 버튼 on 이벤트
    $('.toggle').on('click', function(e) {
        e.preventDefault();
        $(this).toggleClass('on');
        if(typeof $(this).data('siblings') != undefined) {
            if($(this).siblings().length >= 1) {
                $(this).siblings().removeClass('on');
            }else {
                $(this).parent().siblings().children('.btn').removeClass('on');
            }
        }
    })


    $('.toggle_tit').on('click', function() {
        // event.stopPropagation();
        // event.preventDefault();
        $(this).toggleClass('on');
        if($(this).hasClass('on') ) {
            $(this).next('.toggle_inner').stop().slideDown();
        }else {
            $(this).next('.toggle_inner').stop().slideUp();
        }
    })
    $('.toggle_tit .fm_ch').on('click', function() {
        event.stopPropagation();
    })

    $('textarea[data-maxlength]').each(function(idx, el) {
        new wordCount($(el));
    })

    // $('.agree_chk').on('change', function() {
    //     if($(this).is(':checked')) {
    //         $(this).closest('.agree_tit').addClass('on');
    //         $(this).closest('.agree_box').find('.agree_cont').stop().slideDown(200);
    //     }else {
    //         $(this).closest('.agree_tit').removeClass('on');
    //         $(this).closest('.agree_box').find('.agree_cont').stop().slideUp(200);
    //     }
    // })
});


function wordCount(el) {
    var el = el,
        maxCount = el.attr('data-maxLength') != '' ? Number(el.attr('data-maxLength')) : 500,
        ing = el.closest('[data-lap]').find('.total_word .ing'),
        total = el.closest('[data-lap]').find('.total_word .total'),
        word;
        total.text(actComma(maxCount))
    function addEvent() {
        el.on('keyup', calc);
    }
    function calc() {
        word = el.val().length;
        if(word > maxCount) {
            el.val(el.val().substr(0, maxCount));
            alert('최대 '+ maxCount +'글자까지 입력 가능합니다.');
            word = el.val().length;
        }
        ing.text(actComma(word));
    }
    calc();
    addEvent();
    // this.addEvent();
}

function firstLetterUpper() {
    $('.act_firstUpper').on('focusout', function(e) {
        if($(this).hasClass('__none')) return;
        if(this.value.length <= 0) return;
        var str = this.value.trim();
        var spaceAry = str.split(' ');
        var firstLetter = '';
        var result = '';
        if(spaceAry.length <= 1) {
            firstLetter = (/[a-zA-Z]/).exec(str);
            result =  str.replaceAt(firstLetter.index, str[firstLetter.index].toUpperCase());
        }else {
            for(var i = 0; i < spaceAry.length; i++) {
                firstLetter = (/[a-zA-Z]/).exec(spaceAry[i]);
                if(i != 0) result += ' ';
                if(firstLetter != null) {
                    result += spaceAry[i].replaceAt(firstLetter.index, spaceAry[i][firstLetter.index].toUpperCase());
                }
            }
        }
        // var result = str[0].toUpperCase()
        //               + str.slice(1, str.length).toLowerCase();
        this.value = result;
        // document.writeln(result);
    })
}
//이메일 유효성 체크시 @ 여러개일때도 통과되는 오류발생 (2021.2.16)
//이메일 유효성 체크시 @ 0개일 경우 null 처리가 안돼서 typeof 추가 (2021.3.05)
function CheckEmail(str){
	if (isEmpty(str.match(/@/g))) return false;

    if((str.match(/@/g)).length > 1) {
        return false;
	}else{
		var regex = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

		if((str != '') && (str != 'undefined')){
			return regex.test(str);
		}else{
			return false;
		}
	}
}

function initTouchMouseMove() {
    var startX, moveX, init;
    var e = event;
    var dep1 = $('.card_tabs');
    var tbl;


    dep1.find('a').on('dragstart', function(e) {
        e.preventDefault();
        return false;
    });
    dep1.find('.wrap').on('dragstart', function(e) {
        e.preventDefault();
        return false;
    })
    initEvent(dep1);


    function initEvent(tg) {
        tg.on('touchstart mousedown', function(e) {
            touchStart(e, $(this));
        });
        tg.on('mouseleave mouseup', function(e) {
            e.preventDefault();
            tg.off('mousemove touchmove');
        });
        tg.on('mouseup touchend click', function(e) {
            tg.off('mousemove touchmove');
        });
    }

    function gnbMove(arg) {

        var e = arg[0];
        var tg = $(e.currentTarget);
        if (e.type.indexOf('mouse') != -1) {
            moveX = (startX - parseInt(e.originalEvent.clientX));
            startX = parseInt(e.originalEvent.clientX);
        } else {
            moveX = (startX - parseInt(e.originalEvent.changedTouches[0].clientX));
            startX = parseInt(e.originalEvent.changedTouches[0].clientX);
        }
        if(Math.abs(moveX) < 1) {
            return false;
        }

        tg.scrollLeft((tg.scrollLeft() + moveX));
    }

    function touchStart(e, _tg) {
        var tg = _tg;
        tbl = tg.children();

        console.log(e.originalEvent.type);
        if (e.originalEvent.type == 'mousedown') {
            startX = parseInt(e.originalEvent.clientX) ;
        } else {
            startX = parseInt(e.originalEvent.changedTouches[0].clientX);
        }
        tg.off('mousemove touchmove').on('mousemove touchmove', throttle(function() {
            if (arguments[0].cancelable) arguments[0].preventDefault();
            gnbMove(arguments);
        }, 10));

    }
}

//보안코드 새로고침
function refreshCaptcha(){
    $.ajax({
        type: 'post',
        url: '/board/makeCaptcha',
		data : {'mode' : 'refresh'},
		success: function(msg){
            if(msg == undefined || msg === '') return;
			$('#captchaimg').html(msg);
		},
		error: function( jqXHR, textStatus, errorThrown ) {
			alert( textStatus + ", " + errorThrown );
		}
	});
}

// 넘어온 값이 빈값인지 체크합니다. // !value 하면 생기는 논리적 오류를 제거하기 위해 // 명시적으로 value == 사용 // [], {} 도 빈값으로 처리
function isEmpty(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true;
	}else{
		return false;
	}
}

String.prototype.replaceAt=function(index, character) {
    return this.substr(0, index) + character + this.substr(index+character.length);
}

function isNumber(input) {
	var chars = "1234567890";
	return containsCharsOnly(input,chars);
}

function containsCharsOnly(input,chars) {

	for (var inx = 0; inx < input.value.length; inx++) {

		if (chars.indexOf(input.value.charAt(inx)) == -1) {
			if(chars == "1234567890"){
				alert("Only Number");
			}else{
				alert(chars + "만 입력 가능합니다.");
			}
			input.value = "";

			input.focus();
			return false;
		}
	}
	return true;
}


function onEnter(el) {
    if(event.keyCode == 13) {
        $('['+$(event.target).attr('data-active')+']').click();
    }
}
//빈값 및 고백까지 체크 (2021. 3. 7)
function inputTextEmptyCheck(str){

	var str = str;

	if( str == "" || str == null || str == undefined || ( str != null && typeof str == "object" && !Object.keys(str).length ) ){
		//alert( 'Please enter Information' );
		return true;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( str.replace( blank_pattern, '' ) == "" ){
		//alert('Never Only Blank');
		return true;
	}

	return false;

}

//부장님이 사용하는 이메일 휴효성 체크 함수 (2021.5.6)
function checkEmailFormat(string) {

	var stringRegx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var isValid = false;
	if(stringRegx.test(string)) {
		isValid = true;
	}
	return isValid;
}

//2021. 3. 12 추가
//영어+숫자로만 되어있으면 true를 반환
function han_check( val ){
	var flag = true;
		for (i = 0; i < val.length; i++) {
			  var retCode = val.charCodeAt(i);
			  var retChar = val.substr(i,1).toUpperCase();
			  if ( (retChar < "0" || retChar > "9") && (retChar < "A" || retChar > "Z") && ((retCode > 255) || (retCode < 0)) ) {
					flag=false;
				break;
				}
		}
	return flag;
}

//2021. 3. 12 추가
//한글이 없을때 : true, 한글이 섞여 있을때 : fasle
function han_check2( val ){
	var judge = true;

	for( var i=0; i<val.length; i++ )
	{
		var chr = val.substr(i,1);
		chr = escape(chr);
		if( chr.charAt(1) == "u" )
		{
			chr = chr.substr( 2, ( chr.length - 1 ) );
			if( ( chr >= 3131 && chr <= 3163 ) || ( chr >= "AC00" && chr <= "D7A3" ) )
			{
				judge = false;
				break;
			}
		}
	}

	return judge;
}


function throttle(func, milliseconds) {
    var throttleCheck;
    return function () {
        var context = this, args = arguments;
        if (!throttleCheck) {
        throttleCheck = setTimeout(function() {
            func.apply(context, args);
            throttleCheck = false;
        }, milliseconds);
        }
    };
};

function debounce(func, wait, immediate) {
    var timeout;
    return function() {
        var context = this, args = arguments;
        var later = function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
};

function common_changeMail(val) {
    var tg = $($(event.target).attr('data-target'));
    if(tg.length < 1) {
        tg = $($(event.target).parent().parent().find('input[type=text]')[1]);
    }
    if(val != ""){
        tg.attr("readonly", true);
    }else{
        tg.attr("readonly", false);
    }
    tg.val(val);
}

function common_fileOpen(_this){
	$(_this).closest('.fm_file').find('input[type=file]').trigger('click');
}

function common_fileChang(_this){
	$(_this).closest('.fm_file').find('input[type=text]').val($(_this).val());
}

// 비밀번호 패턴 체크 (8자 이상, 문자, 숫자, 특수문자 포함여부 체크)
function checkPasswordPattern(str) {
	var pw = str;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(pw.length < 8 || pw.length > 16){
		return false;
	}
	if(pw.search(/₩s/) != -1){
		return false;
	}
	if(num < 0 || eng < 0 || spe < 0 ){
		return false;
	}
	if(/(\w)\1\1\1/.test(pw)){//동일문자를 4번 이상 사용 불가
		return false;
	}
	return true;
}

//숫자만 추출 (추가일 : 2022.8.2)
function onlyNumber(obj) {
	$(obj).keyup(function(){
	  $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
}

//지원서 수정용 팝업 (추가일 : 2022.8.3)
function openModifyRecruitPopup(tg, biz_seq){

//    if(_fnc) {
//        var context = this, args = arguments;
//        _fnc.apply(context, args);
//    };

    var fileName = tg.replace('#','');

    if($(tg).length >= 1) $(tg).remove();
    $.ajax({
		url: '/popup/'+fileName,
		type:"POST",
		data:{"biz_seq_no":biz_seq},
        dataType : "html",
        success: function(data) {
            var html = $.parseHTML(data);
            document.getElementById('container').appendChild(html[0]);
            $(tg).addClass('on');
            $(tg).fadeIn(300);
            scroll.disable();
        }
    })
    // 매개변수로 함수를 받으면 실행
    return false;
}
