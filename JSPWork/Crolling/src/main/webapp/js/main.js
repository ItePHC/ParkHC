window.addEventListener('DOMContentLoaded', function(){
    $('body').css('opacity', 1);
});

$(function() {
    main.init();
});
var main = {
    visual: function() {
        // document.getElementById('mainVisual').style.opacity = 0;
        main.mainVisual = new Swiper('#mainVisual .swiper-container', {
            observer: true,
            observeParents: true,
            slidesPerGroup: 1,
            slidesPerView: 1,
            effect: "fade",
            fadeEffect: {
                crossFade: false
            },
            loop: true,
            speed: 1000,
            autoplay: {
                delay: 7000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            },
            navigation: {
                prevEl: "#mainVisual .prev",
                nextEl: "#mainVisual .next",
            },
            pagination: {
                el: "#mainVisual .swiper-pagination",
                type: "bullets",
                clickable: true,
                bulletClass: 'paging',

            },
            on: {
                init: function() {
                    document.getElementById('mainVisual').querySelector('.swiper-slide-active').classList.add('init');
                    document.getElementById('mainVisual').querySelector('.swiper-slide-active').style.zIndex = '100';
                    setTimeout(function() {
                        if(document.querySelectorAll('.swiper-slide.init').length >= 1) {
                            document.getElementById('mainVisual').querySelector('.swiper-slide.init').style.zIndex = 0;
                        }
                    }, 1500)
                },
                slideChange: function() {
                    if(document.querySelectorAll('.swiper-slide.init').length >= 1) {
                        document.getElementById('mainVisual').querySelector('.swiper-slide.init').style.zIndex = 0;
                        document.getElementById('mainVisual').querySelector('.swiper-slide.init').classList.remove('init');

                    }
                }
            }
        });
        $('#mainVisual .contr').on('click', changeVisualBtn);

        function changeVisualBtn() {
            if(typeof event != 'undefined') {
                if(event.type == 'click') $('#mainVisual .visual_contr').toggleClass('on');
            }
            if($('#mainVisual .visual_contr').hasClass('on')) {
                main.mainVisual.autoplay.stop();
            }else {
                main.mainVisual.autoplay.start();
            }
        }
    },
    sideMenu: function() {
        $('.side_btn').off('click').on('click', function() {
            $(this).toggleClass('on');
            if($(this).hasClass('on')) {
                $('#sideMenu').addClass('on');
            }else {
                $('#sideMenu').removeClass('on');
            }
            if(window.innerWidth >= 1440) {
                if(!$(this).hasClass('on')){
                    $('#vancyPop').removeClass('on');
                    $('#sideMenu .ps').removeClass('on');
                }
            }
        })
        $('#toggleSide .business ._tit, #toggleSide .business .toggle').on('click', function() {
            event.preventDefault();
            var inn = $(this).closest('.inner');
            if(!inn.hasClass('on')) {
                inn.addClass('on');
                inn.next('.toggle_lap').stop().slideDown(250);
            }else {
                inn.removeClass('on');
                inn.next('.toggle_lap').stop().slideUp(250);
            }
        })
    },
    lineAnim: function() {
        // window.addEventListener('load', function() {
            var con = document.getElementById('con');
            var count = 3;
            setTimeout(function(){con.classList.add('act_1');});
            setTimeout(function(){con.classList.add('act_2');}, 1200);
            setTimeout(function(){con.classList.add('act_3');}, 1400);
            main.lineAnim.clearSide = setTimeout(function(){
                document.querySelector('#sideMenu').classList.remove('on');
                document.querySelector('#sideMenu .side_btn').classList.remove('on');
                main.lineAnim.clearSide = null;
            }, 3700);
            document.querySelector('#sideMenu').addEventListener('click', main.stopCloseSide);
        // })
    },
    stopCloseSide: function() {
        if(main.lineAnim.clearSide) {
            clearTimeout(main.lineAnim.clearSide);
        }
    },
    footerBtn: function() {
        $('.ft_float_btn').on('click', function() {
            if(!$(this).hasClass('on')) {
                if($('.ft_family_site > a').hasClass('on')) {
                    $('.ft_family_site > a').removeClass('on');
                    $('.ft_family_site .ft_family_lists').slideUp(400);
                }
            }
        })
    },
    init: function() {
        main.visual();
        main.sideMenu();
        main.lineAnim();
        main.footerBtn();
    }
}
