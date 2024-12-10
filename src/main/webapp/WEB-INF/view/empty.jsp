<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<!-- <title>NEXT LEVEL</title> -->
<c:choose>
	<c:when test="${empty title}">
		<title>NEXT LEVEL</title>
	</c:when>
	<c:otherwise>
		<title><c:out value="${title}"/></title>
	</c:otherwise>
</c:choose>
<link rel="shortcut icon" href="/img/common/favicon.ico">
<link type="text/css" rel="stylesheet" href="/css/jquery-ui.css">
<link type="text/css" rel="stylesheet" href="/css/jquery-ui.css">
<link type="text/css" rel="stylesheet" href="/css/slick.css">
<link type="text/css" rel="stylesheet" href="/css/slick-theme.css">
<link type="text/css" rel="stylesheet" href="/css/css.css">
<link type="text/css" rel="stylesheet" href="/css/m_layout.css">
<link type="text/css" rel="stylesheet" href="/css/new_layout.css">

<script type="text/javascript" src="/js/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/lib/slick.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery.sticky.js"></script>
<!-- <script type="text/javascript" src="/js/common_type.js"></script> -->
<script type="text/javascript" src="/js/common_ui.js"></script>

<!-- 20210706 모비온 광고 -->
<script type="text/javascript">
(function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
enp('create', 'common', 'nexeno2o', { device: 'M' });  // W:웹, M: 모바일, B: 반응형
enp('send', 'common', 'nexeno2o');
</script>

<!-- exelbid, adpacker -->
<script type="text/javascript">
!function (w,d,s,u,t,ss,fs) {
    if(w.ex2cts)return;t=w.ex2cts={};if(!window.t) window.t = t;
    t.push = function() {t.callFunc?t.callFunc.apply(t,arguments) : t.cmd.push(arguments);};
    t.cmd=[];ss = document.createElement(s);ss.async=!0;ss.src=u;
    fs=d.getElementsByTagName(s)[0];fs.parentNode.insertBefore(ss,fs);
}(window,document,'script','//st2.exelbid.com/js/cts2.js');
ex2cts.push('init', '607936c58d0fd87b688b4569' , '.nexen-nextlevel.com');
</script>
<script async src ="//cdnet.nasmob.com/adpacker/js/ap_pv_v2.0.js"></script> 
<!-- exelbid, adpacker -->

<!-- Naver Analytics -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	// 네이버 애널리틱스
	if(!wcs_add) var wcs_add = {};
	wcs_add["wa"] = "86b7aa256bebb8";
	wcs_do();
</script>
<!-- Naver Analytics -->

<!-- Google Tag Manager 20240229-->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NZDR68JW');</script>
<!-- End Google Tag Manager -->

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5T4LZPV');</script>
<!-- End Google Tag Manager -->

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1108490266577703'); 
fbq('track', 'PageView');
</script>

<noscript>
	<img height="1" width="1" src="https://www.facebook.com/tr?id=1108490266577703&ev=PageView&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->

<!-- ADN Tracker[공통] start -->
<script src="//fin.rainbownine.net/js/across_adn_2.0.1.js" type="text/javascript"></script>
<!-- ADN Tracker[공통] end -->

</head>
	<div class="allWrap" id="allWrap">
		<tiles:insertAttribute name="empty" />
	</div>
	
	
<!-- Naver premium service -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_22b4e1a8b188";
	if (!_nasa) var _nasa={};
	if(window.wcs){
		wcs.inflow();
		wcs_do(_nasa);
	}
</script>
<!-- Naver premium service -->
</html>