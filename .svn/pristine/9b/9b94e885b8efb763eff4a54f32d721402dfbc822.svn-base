<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/common_type.js"></script>
<!-- <script type="text/javascript" src="/js/lib/jquery.easing.min.js"></script> -->
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>

<title>NICE신용평가정보 - CheckPlus 안심본인인증</title>
<body onload="fnPopup();">
<form name="form_chk" id="form_chk" method="GET">
	<input type="hidden" name="sendgubun" value="${sendgubun}">
	<input type="hidden" name="m" value="safekeyService">					<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="${sEncData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다. 해당 파라미터는 추가하실 수 없습니다. -->
	<input type="hidden" name="param_r1" value="${username}">
	<input type="hidden" name="param_r2" value="${mobileno}">
	<input type="hidden" name="param_r3" value="${birthGen}">
</form>
</body>

<script type="text/javascript">
window.name ="Parent_window";

$( document ).ready(function() {
});
	
//세이프키 팝업 
function fnPopup(){
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafekeyModel/checkplus.cb";
	document.form_chk.target = "popupChk";
	document.form_chk.submit();
	/* window.close(); */
}


</script>