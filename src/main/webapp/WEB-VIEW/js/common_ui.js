$(document).ready(function(){
	
	// ###########aaaaaaaaa############################################## //

	// 전체 메뉴
	AllMenu();
	alertBox();

	// 주문
	radioUI();
	radioChkPaymentUI();
	searchShop();

	// 마이넥센
	searchMonthOption();
	radioHaveCarUI();
	paymentType();

	// 타이어 상세
	Swiper();
	accordion();
	ReviewGroup();
	tabContent();
	orderContent();
	rentGroup();
	// selectDesign();

	// 타이어 목록
	rankList();
	customModaltoModal();
	PopupScrollArea();
	SimpleSwipe();

	// 서비스
	tabInTabContent();
	serviceList();

	/*$(document).on('click','.md-close',function(){
		$(event.target).parents('.md-show').removeClass('md-show');
	});*/

	// Quick menu Show Hide
	$(window).scroll(function() {
		var st = $(this).scrollTop();
		if (st < 0) {
			$(".quick-menu").hide();
		} else if (st > 100) {
			$(".quick-menu").fadeIn('slow');
		} else {
			$(".quick-menu").fadeOut('slow');
		};
	});

	//Page Top
	$('.quick-menu .top').bind('click', function(){
		$('body, html').animate({scrollTop:0}, 500);
		return false;
	});

	$("#sticky").sticky({ topSpacing: 0 });
	$("#sticky-bottom").sticky({ bottomSpacing: 0 });

	// 페이지 헤더 이미지 비율 고정
	// var headerW = $('.page-header').outerWidth();
	// $('.page-header').css('height', headerW - 60);

	// ######################################################### //

	// 타이어 렌탈 서비스
	function serviceList() {
		var header = $('.js-singleToggle').find('.service-accordion-header');
		var detail = $('.js-singleToggle').find('.service-accordion-detail');
		detail.hide();
		header.bind('click', function(){
			$(this).next().slideToggle();
			$(this).toggleClass('on');
			return false;
		});
	}

	// 중도 선납/완납 납부유형
	function paymentType() {
		$('#payment-type').change(function(){

			var selectOne = $('#payment-type option:selected').val();

			if ( selectOne == '1' ) {
				$('#payment-result').hide();
			} else if ( selectOne == '2' ) {
				$('#payment-result').show();
			} else {}
		});
	}

	// search-month-option
	function searchMonthOption() {
		var month = $('.search-month-option .month');
		var period = $('.search-month-option .period-wrap');
		
		month.bind('click', function(){
			month.removeClass('on');
			$('#period-wrap').hide();
			$('.period-wrap').removeClass('on');
			if ( !$(this).hasClass('on') ) {
				$(this).addClass('on');
			}
		});

		period.bind('click', function(){
			month.removeClass('on');
			if ( !$(this).hasClass('on') ) {
				$('#period-wrap').show();
				$(this).addClass('on');
			}
		});
	}

	// 전문점 찾기(지도)
	function searchShop() {
		var winH = $(window).outerHeight();
		var winW = $(window).outerWidth();
		var bottombox = $('.shop-search-single').outerHeight();
		
		var headerH  = $('.shop-popup').find('header').outerHeight();
		var innerH   = $('.popup-contents-nobottom').outerHeight();
		$('#shop-map').css({
			'height': winH - 60
		});

		$('.shop-search-single').css('height', bottombox);

		$('#map').css({
			'width': winW,
			'height': winH
		});

		$('#mapwrap').css({
			'width': winW,
			'height': winH - ( bottombox + 60 )
		});

		// 지도, 리스트 UI 변경
		$('.change-list').bind('click', function(){
			$('#shop-map').hide();
			$('#shop-list').show();
			
			// 리스트 검색 결과 영역 고정
			var headerH  = $('.shop-popup').find('header').outerHeight();
			var innerH   = $('.popup-contents-nobottom').outerHeight();
			var serchH   = $('.custom-position').outerHeight();
			
			$('.position').css({
				'top': serchH,
				'height': innerH - 95,
				'width': winW,
				'overflow-y': 'auto',
				'padding': 0
			});

			return;
		});
		
		$('.search-shop').bind('click', function(){
			var getH = $('.position').height();
			
			if ( !$('.position').hasClass('on') ) {
				$('.position').addClass('on');
				$('.search-shop').addClass('on');
				$('.search-area-wrap-rental').slideDown();
				$('.position').animate({
					"height": getH - 120,
					"top": 215
				});

				console.log('메뉴열기');
			} else {
				$('.position').removeClass('on');
				$('.search-shop').removeClass('on');
				$('.search-area-wrap-rental').slideUp();
				$('.position').animate({
					"height": getH + 120,
					"top": 95
				});
				
				console.log('메뉴닫기');
			}
		});

		$('.change-map').bind('click', function(){
			$('#shop-map').show();
			$('#shop-list').hide();
			//$('#shop-list .position').removeClass('on');
		});
	}

	// 주문서 작성
	function radioUI() {
		$('.js-radioUI .radioChk').on('click', function(){

			var radioServiceValue = $('.js-radioUI .radioChk:checked').val();

			if ( radioServiceValue == '1' ) {
				$('#radioServiceUI01').show();
				$('#radioServiceUI02').hide();
				$('#radioServiceUI03').hide();
			} else if ( radioServiceValue == '2' ) {
				$('#radioServiceUI01').hide();
				$('#radioServiceUI02').show();
				$('#radioServiceUI03').hide();
			} else {
				$('#radioServiceUI01').hide();
				$('#radioServiceUI02').hide();
				$('#radioServiceUI03').show();
			}
		});
	}

	// 주문서 작성
	function radioChkPaymentUI() {
		$('.js-radioUI .radioPayment').on('click', function(){
			var radioPaymentValue = $('.js-radioUI .radioPayment:checked').val();

			if ( radioPaymentValue == '1' ) {
				$('#radioPaymentUI01').show();
				$('#radioPaymentUI02').hide();
				// $('#radioPaymentUI03').hide();
			} else if ( radioPaymentValue == '2' ) {
				$('#radioPaymentUI01').hide();
				$('#radioPaymentUI02').show();
				// $('#radioPaymentUI03').hide();
			}
		});
	}

	// 주문서 작성
	function radioHaveCarUI() {
		$('.js-radioUI .radioCar').on('click', function(){

			var radioHaveCarValue = $('.js-radioUI .radioCar:checked').val();

			if ( radioHaveCarValue == '1' ) {
				$('#radioHaveCarUI01').show();
				$('#radioHaveCarUI02').hide();
			} else if ( radioHaveCarValue == '2' ) {
				$('#radioHaveCarUI01').hide();
				$('#radioHaveCarUI02').show();
			} else {}
		});
	}

	// 셀렉트 박스 디자인 적용
	// 기존 셀렉트 박스를 가리고 디자인요소로 대체
	// 가려진 셀렉트 박스의 선택한 값을 디자인 요소에 적용
	// TODO: 개별 항목의 selected 값이 적용가능하도록 작업
	// function selectDesign() {
	// 	$('.select-insert').text($('.js-select').find('option:selected').val());
	// 	$('.js-select > select').change(function(){
	// 		$('.select-insert').text($(this).val());
	// 	});
	// }

	// 주문서 렌탈하기
	function rentGroup() {
		let rentItem       = $('.rent-item');
		let rentRadio      = $('.rent-item').find('[type="radio"]');
		let rentRadioCheck = $('.rent-item').find('[type="radio"]:checked');
		
		// 렌트 주문서 라디오
		$(rentRadio).bind('click', function(){
			$(rentItem).removeClass('radio-on');
			if ( rentRadioCheck ) {
				$(this).closest(rentItem).addClass('radio-on');
			} else {
				$(this).closest(rentItem).removeClass('radio-on');
			}
		});

		let allPanels = $('.js-rentAccordion .accordion-info').hide();

		// 렌트 주문서 아코디언
		$('.js-rentAccordion .accordion').addClass('close');
		$('.js-rentAccordion .accordion').bind('click',  function() {
			allPanels.slideUp();
			$('.rent-group .accordion').addClass('close');
			$('.rent-group .accordion').removeClass('open');
			$(rentItem).removeClass('accordion-on');
			if ( $(this).hasClass('close') ) {
				$(this).removeClass('close');
				$(this).addClass('open');
				$(this).closest(rentItem).addClass('accordion-on').next().slideDown();
			} else {
				$(this).removeClass('open');
				$(this).addClass('close');
				$(this).closest(rentItem).next().slideUp();
			}
			return false;
		});
	}

	// 주문서
	function orderContent() {
		// $('.order-tab').css({
			// 'height': 52,
		// 	'width': '100%',
		// 	'overflow-y': 'auto'
		// });

		$('.order-button').bind('click', function(){
			let windowH  = $(window).height();
			let orderBox = $('.order-box');

			if ( orderBox.hasClass('on') ) {
				$(this).addClass('open');
				$(this).removeClass('close');
				orderBox.removeClass('on');
				$('body').removeAttr('data-order');
				$('.order-wrap').fadeOut();
				$('#order').css({
					'top': 'unset',
					'bottom': 0,
					'width': '100%'
				});
			} else {
				orderBox.addClass('on');
				$(this).removeClass('open');
				$(this).addClass('close');
				$('body').attr('data-order', 'true');
				$('.order-wrap').fadeIn();
				$('.tab-content').css({
					// 스크롤 영역 고정을 위한 높이 지정
					// 주문서 버튼 높이(60) + 
					// 검색, 재검색 영역 높이(60) + 
					// 하단 주문 버튼 영역(60) +
					// 탭 UI 높이(52)
					'height': windowH - 232,
				});
				$('#order').css({
					'top': 60,
					'height': 60
				});
			}
		});
	}

	// TAB
	// 차량 간편 검색 > 차종 팝업 내부 TAB
	function tabContent() {
		$('.js-tab button').on('click', function (event) {
			var tab_id = $(this).attr('data-tab');
			event.preventDefault();
			$('.js-tab button').removeClass('current');
			$('.tab-content').removeClass('current');
			$(this).addClass('current');
			// $(this).addClass('on');
			$("#" + tab_id).addClass('current');
			// if ($(this).prev().hasClass('step')) {
			// 	// $(this).prev().addClass('on');
			// } else {}
			return false;
		});
		$('.js-tab button:first').trigger('click');	
	}

	// Tab in Tab
	function tabInTabContent() {
		$('.js-tab-inner button').on('click', function (event) {
			var inner_tab_id = $(this).attr('data-tab');
			event.preventDefault();
			$('.js-tab-inner button').removeClass('current');
			$('.tab-content-inner').removeClass('current');
			$(this).addClass('current');
			// $(this).addClass('on');
			$("#" + inner_tab_id).addClass('current');
			// if ($(this).prev().hasClass('step')) {
			// 	// $(this).prev().addClass('on');
			// } else {}
			return false;
		});
		$('.js-tab-inner button:first').trigger('click');	
	}

	// accordion
	function accordion() {
		let allPanels = $('.js-accordion .accordion-info');
		let thisPanel = allPanels.hide();

		$('.js-accordion > .accordion').click(function(e) {
				e.preventDefault();
				$(this).toggleClass('on');
				$(this).next('.accordion-info').toggle();
				return false;
		});

		let positionInfo = $('#product-info');
		let position = $('#product-positon');
		if ( positionInfo.length ) {
			
			// var target = position.offset().top;
			var target = position;

			$("#product-info").click(function(){	
				$(target).stop().animate({
					scrollTop: position
				});
			});

			$("#product-other").click(function(){	
				$(target).stop().animate({
					scrollTop: position
				});
			});

			$("#product-review").click(function(){	
				$(target).stop().animate({
					scrollTop: position
				});
			});
		}
	}
	
	// review group
	function ReviewGroup() {
		$('.js-reviewGroup .review-box').hide();
		$('.js-reviewGroup > .review-single').bind('click', function(){
			$(this).toggleClass('open');
			$(this).find('.review-summary + .review-box').slideToggle();
		});
	}

	// Swiper
	function Swiper() {
		// 상품 목록 하단 & 상품 상세 썸네일
		$('.swiper-footer, .swiper-thumb-group').slick({
			dots: false,
			infinite: false,
			slidesToShow: 1.5,
			slidesToScroll: 1,
			variableWidth: false
		});

		// 타이어 패턴 사이즈 지정용
		var w = $('.swiper-thumb-group').find('.slick-slide').outerWidth();
		$('.slick-slide').css({
			'height': w,
			'overflow-y': 'hidden'
		});

		$('.swiper-service').slick({
			dots: false,
			infinite: false,
			slidesToShow: 1,
			slidesToScroll: 1,
			variableWidth: true
		});

		var stepWidth = $('.process-step').outerWidth();
		$('.store').css('width', stepWidth);
		// $('.swiper-store').css('width', stepWidth);
		$('.swiper-store').slick({
			infinite: false,
			arrows: true,
			slidesToShow: 2,
			slidesToScroll:1,
			nextArrow: '<i class="nextArrow"></i>',
			prevArrow: '<i class="prevArrow"></i>',
		});
		
		$('.slider-show').bind('click', function(){
			$(this).toggleClass('on');
			$('.store').slideToggle('fast');
		});
	}

	// allMenu
	function AllMenu() {
		let popupContentsH = $(window).outerHeight();
		let popupContentsW = $(window).outerWidth();
		$(".allMenu").click(function() {
			// console.log('메뉴열림');
			$('body').attr('data-position', 'true');
			$(".allMenuWrap").animate({ "right": 0 }, "fast" ).show();
			$(".allMenuWrap").css({
				'height': popupContentsH,
				'overflow-y': 'hidden'
			});
			$(".allMenuBox").css({
				'height': '100%',
				'overflow': 'auto'
			})
		});

		$(".allMenuClose").click(function() {
			// console.log('메뉴닫힘');
			$(".allMenuWrap").animate({ "right": '-' + popupContentsW }, "fast");
			$('body').removeAttr('data-position');
			// setTimeout(function() {
			// 	window.location.reload();
			// }, 500);
		});

		// 회원가입 영역 tab contents
		$(".tabContent").hide();
		$(".tabContent:first").show();

		$("ul.tabs li, ul.waterAirTabs li").click(function (){
				$("ul.tabs li, ul.waterAirTabs li").removeClass("active");
				$(this).addClass("active");
				$(".tabContent").hide();
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn(); 
		});
	}

	// 팝업 내부 스탭 박스 디자인용 박스 생성
	function SimpleSwipe() {
		$('.simple-swipe').wrap('<div class="simple-swipe-outer"><div class="simple-swipe-box"></div></div>');
	}

	// 팝업 컨텐츠의 스크롤 영역을 지정하기 위해 팝업 헤더, 푸터를 제외한 높이값을 지정
	function PopupScrollArea() {
		let popupContents = $('.popup-contents').outerHeight();
		let WindowWidth = $('.popup-contents').outerWidth();

		$('.popup-contents').css({
			'height': popupContents,
			'width': WindowWidth,
			'overflow-y': 'auto'
		});

		// 팝업을 열때 body 고정 지정
		$('[data-modal]').bind('click', function(){
			$('body').attr('data-position', 'true');
		});
	
		// 팝업을 닫을 때 body 고정 해제
		$('.md-close').bind('click', function(){
			$('body').removeAttr('data-position');
		});
	}

	// 차량 간편 검색들의 팝업위에 팝업을 표시하는 작업으로
	// 개별적으로 배경 제어를 위해 추가
	// Tip용 팝업에 사용
	// md-effect에서 사용중인 md-modal, md-overlay 제어
	function customModaltoModal() {
		$('[data-modal="tireSizeTip"]').bind('click', function(){
			$('body').attr('data-tireSize', 'true');
			// $('#tireSizeTip').css('visibility', 'unset');
			// $('.md-overlay').css('visibility', 'unset');
			if ($('#tireSizeTip').hasClass('md-modal')) {
				$('.popupWrap').css({
					'z-index': 5000,
					'border-radius': 20
				});
				$(this).after('<div class="custom-modal-bg"></div>');
			}
		});

		$('.js-customMdBgClose').bind('click', function(){
			// $('.popupWrap').css('z-index', 'unset')
			$('.custom-modal-bg').remove();
			$('body').removeAttr('data-tireSize');
			// $('#tireSizeTip').css('visibility', 'hidden');
			// $('.md-overlay').css('visibility', 'unset');
		});
	}

	// ALERT용 팝업
	function alertBox() {
		var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");
		
		$('[data-modal-id]').click(function(e) {
			e.preventDefault();
			$("body").append(appendthis);
			$(".modal-overlay").fadeTo(500, 0.7);
			//$(".js-modalbox").fadeIn(500);
			var modalBox = $(this).attr('data-modal-id');
			$('#' + modalBox).fadeIn($(this).data());
		});  
		
		$(".js-modal-close, .modal-overlay").click(function() {
			$(".modal-box, .modal-overlay").fadeOut(500, function() {
				$(".modal-overlay").remove();
			});
		});
			
		$(window).resize(function() {
			$(".modal-box").css({
				top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
				left: ($(window).width() - $(".modal-box").outerWidth()) / 2
			});
		});
			
		$(window).resize();
	}

	// rank-list
	// 라이프 스타일 추천 리스트용
	function rankList() {
		const recommend = $('.js-lifeStyleRecommend');
		$('.rank-reset').bind('click', function(){
			$(this).closest('.rank-list-item').removeClass('selected');
			$(this).prev('.rank-text').text('성능을 추가하세요!');
		});
	}

	// popup index show
	$(".store a img").click(function(){		
		 var idx = $(this).index();
		 var $imgShow = $(this);

		 $('.popupWrapGall').eq(idx).addClass('md-show');
		 $("#gallImg").attr("src", $imgShow.attr("data-large"));	
	});

	$(".gallPopClose").click(function(){
		$(".popupWrapGall").removeClass('md-show');		
	});

});
