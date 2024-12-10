<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<title>NEXT LEVEL-신개념 타이어 서비스</title>
<script type="text/javascript">
//window.location.href="/main"; ////////// 오픈 전 임시로 대문 설정하고, 외부 아이피에서 접근 못하게 막은 부분, 오픈 시 주석 삭제할 것 /////////////

var webProtocol = window.location.protocol;
var webUrl = window.location.href;
var targetWebUrl = "/";
var targetMobUrl = "/";
var subUrl = "/main";
// 오픈 시 true로 설정해야함. false는 index 페이지에 남아 있음.
var constructionFlag = true;

if (webUrl.indexOf("localhost") != -1) {
	targetWebUrl = "http://localhost:18080"+subUrl;
	targetMobUrl = "http://localhost:18081"+subUrl;
} else if (webUrl.indexOf("dev-") != -1) {
	targetWebUrl = "http://dev-pc.nexen-nextlevel.com:8888"+subUrl;
	targetMobUrl = "http://dev-m.nexen-nextlevel.com:8888"+subUrl;
} else if (webUrl.indexOf("https") != -1) {
	targetWebUrl = "https://www.nexen-nextlevel.com"+subUrl;
	targetMobUrl = "https://m.nexen-nextlevel.com"+subUrl;
}
console.log("targetWebUrl : " + targetWebUrl);
console.log("targetMobUrl : " + targetMobUrl);

//디바이스 체크
var device = "PC";
var mobileArr = new Array("iphone", "ipod", "android", "windows ce", "blackberry", "symbian", "windows phone", "webos", "opera mini", "opera mobi", "polaris","iemobile", "lgtelecom", "nokia", "sonyericsson", "samsung");
for(var txt in mobileArr){
     if(navigator.userAgent.toLowerCase().match(mobileArr[txt]) != null){
        //console.log(navigator.userAgent.match(mobileArr[txt]));
        device = "MOBILE"
        break;
     }
}

function fn_location(){
	if(device === "MOBILE"){
	   // 모바일 연산처리
	   if (constructionFlag) {
	   		window.location.href=targetMobUrl;
	   }
	}else{
	   // PC 연산처리
	   if (constructionFlag) {
	   		window.location.href=targetWebUrl;
	   }
	}
	
}

</script>

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
	if (webUrl.indexOf("https") != -1) {
		// 네이버 애널리틱스
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "86b7aa256bebb8";
		wcs_do();
	}

	fn_location();
</script>
<!-- Naver Analytics -->

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
</head>
<body>
	<!-- ////////// 오픈 전 임시로 대문 설정하고, 외부 아이피에서 접근 못하게 막은 부분, 오픈 시 삭제할 것 ///////////// -->
	<!-- 
	<div style="text-align:center">
		<img src="../img/ready_mob.png"/> 
    </div>
     -->
    <!-- ////////////////////////////////////////////////////////////////////////////////// -->
</body>
</html>