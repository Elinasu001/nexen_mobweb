<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/jquery-ui.css">
<link type="text/css" rel="stylesheet" href="/css/layout.css">
<script type="text/javascript" src="/js/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/common_type.js"></script>
<script type="text/javascript" src="/js/lib/jquery.easing.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/common_ui.js"></script>

<div>

	<br/>
	<br/>
	
	회원 가입111
	<br/>
	
	<br>
	<br>
	
	<div class="auth">  
		<!-- 아이핀 -->
		<div class="inner">
			<form name="form_ipin" method="post">
				<input type="hidden" name="m" value="pubmain">					<!-- 필수 데이타로, 누락하시면 안됩니다. -->
				<input type="hidden" name="enc_data" value="${sEncipData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
				
				<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
					 해당 파라미터는 추가하실 수 없습니다. -->
				<input type="hidden" name="param_r1" value="">
				<input type="hidden" name="param_r2" value="">
				<input type="hidden" name="param_r3" value="">                        
					<a href="javascript:fnCallIpin();" class="btn ty7"><span>아이핀(I-PIN) 인증</span></a>
			</form>
		</div>
		<!-- //아이핀 -->
			
			<br />
			<br />
			<br />
			<br />
			<br />
			
		<!-- 휴대전화 인증 -->
		<div class="inner">
			<form name="form_chk" method="post">
				<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
				<input type="hidden" name="EncodeData" value="${sEncData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
				
				<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
					해당 파라미터는 추가하실 수 없습니다. -->
				<input type="hidden" name="param_r1" value="">
				<input type="hidden" name="param_r2" value="">
				<input type="hidden" name="param_r3" value="">
					<a href="javascript:fnCallPhone();" class="btn ty7"><span>휴대전화 인증</span></a>
			</form>
		</div>
		<!-- //휴대전화 인증 -->
	</div>
	
	
	<!-- 컨텐츠영역 시작 -->
	<form id="form" name="form" action="">
		<input type="hidden"	id="curPage"	name="curPage"	value="${pageCommon.pageNo eq null or pageCommon.pageNo eq '' ? 1 : pageCommon.pageNo }"/>
		
	</form>
	
	
	<br/>
	<br/>
	<br/>
	
	
</div>

<script type="text/javascript">
//아이핀 팝업 
function fnCallIpin(){
	window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_ipin.target = "popupIPIN2";
	document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
	document.charset = 'euc-kr';
	document.form_ipin.submit();
}

//휴대전화 팝업 
function fnCallPhone(){
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.target = "popupChk";
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.submit();
}



$(document).ready(function() {

	var sRtnMsg = "${sRtnMsg}"; 
	var sEncData = "${sEncData}"; 
	var iRtn = "${iRtn}";
	var memberAuthVo = "${memberAuthVo.getsEncData()}"
	
});

</script>