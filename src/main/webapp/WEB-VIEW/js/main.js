// $('#fullpage').fullpage({
// 	menu: '#menu',
// 	navigation: true,
// 	navigationPosition: 'right',
// 	menu: '#menu',
// 	slidesNavigation: true,
// });
var __main_c = false;


function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	var expires = "expires=" + d.toGMTString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}



function close_event_popup( oneday ){
	$('.event-popup').hide();
	if( oneday == true )
		setCookie("hide_event_popup", "Y", "1");
}

$(function(){
	// var slider = new KeenSlider('.main-caroucel');


	var img = new Image();
	img.onload = function(){
		$('.main-caroucel').slick({
			arrows:false,
			dots:true,
			// draggable:false,
			pauseOnHover:true,
			accessibility:false,
			adaptiveHeight:true,
			autoplay: true,
	        autoplaySpeed: 3000
		  });
	};
	img.src = $('.main-caroucel img').eq(0).attr('src');
	
	var img2 = new Image();
	img2.onload = function(){
		$('.event-modal .modal-body').slick({
			arrows:false,
			dots:false,
			adaptiveHeight:true
		  });
	};
	img2.src = $('.event-modal img').eq(0).attr('src');
	

	$(function(){
		if (getCookie("hide_event_popup") != "Y"){
			var img3 = new Image();
			img3.onload = function(){
				$('.event-popup').show();
				$('.event-popup .popup-box').width( window.innerWidth*0.9 );
				$('.event-popup .popup-body').slick({
					arrows:true,
					dots:false,
					autoplay: true,
		            autoplaySpeed: 3000,
				  });
			};
			img3.src = $('.event-popup img').eq(0).attr('src');

			
		}
	});

	
	  
	  $('.video-caroucel').slick({
		arrows:false,
		dots:true,
		// draggable:false,
		pauseOnHover:true,
		accessibility:false,
		adaptiveHeight:true,
		slidesToShow: 1,
		// slidesToScroll: 3
	});
	
	
	  
	  $('.review-caroucel').slick({
		arrows:false,
		dots:true,
		// draggable:false,
		pauseOnHover:true,
		accessibility:false,
		adaptiveHeight:true,
		slidesToShow: 1,
		// slidesToScroll: 3
	});
	
	$('.specialprice-caroucel').slick({
		arrows:false,
		dots:true,
		// draggable:false,
		pauseOnHover:true,
		accessibility:false,
		adaptiveHeight:true,
		slidesToShow: 2,
		slidesToScroll: 2
	  
	});

})