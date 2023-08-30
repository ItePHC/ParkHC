

var scroll = {
	disable : function(){
		document.body.style.overflow = 'hidden'
	},
	enable : function(){
		document.body.style.overflow = 'visible'
	},
	parentEnable : function(){
		$('body', parent.document).css('overflow', 'visible');
	},
}


var layout = {

	allMenu: function() {
		layout.allMenu.btn = document.getElementById('hAllMenu');
		layout.allMenu.wrap = document.getElementById('allMenu');

		$('#allMenu .allMenu_con').html($('.gnb > ul').clone());
		$('#allMenu .allMenu_con > ul').addClass('allMenu_gnb');

		layout.allMenu.btn.addEventListener('click', function() {
			this.classList.contains('on') ? $(this).classList.remove('on') : this.classList.add('on');
			if(this.classList.contains('on')) {
				layout.allMenu.wrap.classList.add('on');
				scroll.disable()
			}else {
				layout.allMenu.wrap.classList.remove('on');
				scroll.enable()
			}
			$(layout.allMenu.wrap).find('.depth1 ul').removeAttr('style');
			$(layout.allMenu.wrap).find('.depth1 .on').removeClass('on');
		})
		//allMenu - CLOSE event
		$(document).on('click','.allMenu_close', function(e){
			e.preventDefault();

			layout.allMenu.btn.classList.remove('on');
			layout.allMenu.wrap.classList.remove('on');
			scroll.enable()
		});
		$('#allMenu .depth1_tit').on('click', function() {
			event.preventDefault();
			if(window.innerWidth >= 1280) return;
			$(this).parent('li').toggleClass('on');
			$(this).next('ul').stop().slideToggle();
		})
	},

	scroll : function(){
		//스크롤 이벤트 0.15초 한번 실행
		if(layout.scrollTimeout) {

			clearTimeout(layout.scrollTimeout);

		}

		layout.scrollTimeout = setTimeout(function() {

			var _scrollTop   = (isIe) ? document.querySelector('html').scrollTop : window.pageYOffset;
			var _innerHeight = window.innerHeight;

			var _headerH     = layout.headerEl.offsetHeight;
			var _conTop      = layout.conEl.offsetTop;
			var _footerTop   = layout.footerEl.offsetTop;
			var _footerH     = layout.footerEl.offsetHeight;

			if(typeof layout.lastFloatingBottom === undefined) {
				layout.lastFloatingBottom = 0;
			}



			//scroll up down 구분
			if(layout.lastScrollTop < _scrollTop && _conTop < _scrollTop){

				$(".header:not(.down)").addClass('down');
				$(".floating:not(.down)").addClass('down');

			}else if(layout.lastScrollTop  > _scrollTop && _conTop < _scrollTop){

				$(".header.down").removeClass('down');
				$(".floating.down").removeClass('down');
			}

			if(_scrollTop == 0 || layout.lastScrollTop == 0) {
				$(".header.down").removeClass('down');
				$(".floating.down").removeClass('down');
			}

			//header
			if(_headerH < _scrollTop ) {

				$(".header:not(._fixed)").addClass('_fixed');
				$('.floating_menu').addClass('scroll');
			}else{

				$(".header._fixed").removeClass('_fixed');
				$('.floating_menu').removeClass('scroll');

			}
			//floating fixed
			if(_footerTop + layout.lastFloatingBottom < _scrollTop + _innerHeight) {

				$(".floating_menu").addClass('on').css('bottom', _footerH);

			}else{

				$(".floating_menu").removeClass('on').removeAttr('style');

			}

			layout.lastScrollTop = _scrollTop;
		}, 10);
	},

	resize : function(){
		//스크롤 이벤트 0.15초 한번 실행
		if(layout.resizeTimeout) {

			clearTimeout(layout.resizeTimeout);

		}

		layout.resizeTimeout = setTimeout(function() {

			var resizeWidth   =  window.innerWidth;

			layout.scroll();
			layout.lastFloatingBottom = 0;
			if($('.floating_menu:not(.on)').length >= 1) {
				layout.lastFloatingBottom = Math.abs(($('.floating_menu:not(.on)').offset().top - ((isIe) ? document.querySelector('html').scrollTop : window.pageYOffset) + document.querySelector('.floating_menu').clientHeight) - window.innerHeight);
			}


			layout.lastResizeWidth = resizeWidth;

		}, 150);
	},
	familySite : function(){
		//family_site
		$(document).on('click', '.ft_family_site > a', function(e){
			e.preventDefault();
			$(this).toggleClass('on').next('.ft_family_lists').stop().slideToggle(400);
		});
	},
	floating: function() {
		$('.floating_top').on('click', function() {
			if((document.querySelector('html').scrollTop || window.pageYOffset) === 0) return;
            gsap.to(window, .75, {
                ease: Power2.easeOut,
                scrollTo: 0,
            })
        })
	},
	subLocation: function() {
		if($('.location_nav').length < 1) return;
		$('.location_nav .loc_txt').on('click', function() {
			$(this).toggleClass('on');
			if($(this).hasClass('on')) {
				$(this).next('.loc_child').stop().slideDown(200);
			}else {
				$(this).next('.loc_child').stop().slideUp(200);
			}
		})
	},
	vancy: function() {
		var vancyWrap = document.getElementById('vancyPop');
		var mVancybtn = document.querySelector('.vancy_btn.ps');
		if(mVancybtn) {
			mVancybtn.addEventListener('click', function() {
				event.preventDefault();
				if(event.currentTarget.classList.contains('on')) {
					$('#gnb').removeAttr('style');
					event.currentTarget.classList.remove('on');
					vancyWrap.classList.remove('on');
					scroll.enable();
				}else {
					$('#gnb').hide();
					event.currentTarget.classList.add('on');
					vancyWrap.classList.add('on');
					scroll.disable();
				}
				try {
					main.stopCloseSide();
				}catch(err) {
					console.log(err);
				}
			})
		};

		$('#header').hover(
			function(){
				if(vancyWrap.classList.contains('on')){
					$(this).css({
						'background-color' : 'inherit',
						'border-bottom' : 'none'
					});
					$('.ch_fill').css('fill', '#fff');
				}
			}, function(){
				$(this).removeAttr('style');
				$('.ch_fill').removeAttr('style');
			}
		);
		 
		document.querySelector('.vancy_close').addEventListener('click', function() {
			$('#gnb').removeAttr('style');
			vancyWrap.classList.remove('on');
			mVancybtn.classList.remove('on');
			scroll.enable();

		})
		// 공실현황 탭
		$('.twin_tab .lnk').on('click', function() {
			moveTab.call($(this));
		})
		$('.twin_tab .lnk.on').each(function(idx, el) {
			moveTab.call($(this));
		})
		function moveTab() {
			var shadow = $(this).siblings('.shadow');
			switch($(this).index()) {
				case 0:
					shadow.attr('style','left: -50%');
				break;
				case 1:
					shadow.attr('style','left:  150%');
				break;
			};
			$('.vancy_items').removeClass('on');
			$('.vancy_items[data-set="'+$(this).data('set')+'"]').addClass('on');
		}
	},

	init : function (){

		//aos실행
		setTimeout(function(){
			AOS.init({ easing: 'ease-out', duration:700, once : true });
		}, 300);
		console.log();


		//el 정의
		layout.conEl         = document.querySelector('#con');
		layout.footerEl      = document.querySelector('#footer');
		layout.headerEl      = document.querySelector('#header');


		//scroll event
		layout.lastScrollTop = 0;
		layout.scrollTimeout = null;
		layout.scroll();
		window.addEventListener("scroll", layout.scroll);


		//resize event
		layout.lastResizeWidth = 0;
		layout.resizeTimeout = null;
		layout.resize();
		window.addEventListener("resize", layout.resize);

		layout.floating();

		$('.sub_visual .sv_text_box').addClass('on');

		// 공실현황
		layout.vancy();

		// footer familySite
		layout.familySite();

		//event
		// layout.gnb();

		layout.allMenu();

		layout.subLocation();
	},
}



$(function(){
	layout.init();
});
