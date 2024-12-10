<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--subContentsWrap-->
	<div class="subContentsWrap addBg02">
    	<div class="stepTitle perStep02">
    		<ul>
            	<li class="step01 borLine">약관동의 <span class="stepIco on"></span></li>
            	<li class="step02 active">실명인증 <span class="stepIco"></span></li>
            	<li class="step03">회원정보</li>
          	</ul>
    	</div>  	
		
		<div class="subContents">
			<div class="titleArea type03">
				<h2 class="type01">꼭! <span>필</span><span>요</span><span>해</span><span>요.</span></h2>
			</div>
		
		<!--memberWrap-->
		<div class="memberBoxWrap">
			<div class="certification">
				<div class="phone">
					<h3 class="type04" style="color:#ffffff;">휴대전화 인증이란?</h3>
					
					<p style="color:#ffffff;">
						인터넷상에서 주민등록번호를 대신하여 <br/>
						휴대폰을 통하여 본인임을 확인 받을 수 있는<br/>
						 인증서비스입니다.                        
					</p>
					
					<button type="button" onclick="javascript:fnCallPhone();" class="type02 w100per" style="margin-top:10px;">휴대전화 인증<i class="ico01"></i></button>
					<form name="form_chk" method="post">
						<input type="hidden" name="m" value="checkplusSerivce">		<!-- 필수 데이타로, 누락하시면 안됩니다. -->
						<input type="hidden" name="EncodeData" value="${sEncData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
						<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
							해당 파라미터는 추가하실 수 없습니다. -->
						<input type="hidden" name="param_r1" value="">
						<input type="hidden" name="param_r2" value="">
						<input type="hidden" name="param_r3" value="">
					</form>										
					
				</div>
				
				<div class="ipin">
					<h3 class="type04" style="color:#ffffff;">아이핀(I-PIN) 인증이란?</h3>
					
					<p style="color:#ffffff;">
						인터넷상에서 주민등록번호를 대신하여<br/> 
						사이버 신원번호로 본인임을 확인 받을 수 있는 <br/>
						인증서비스입니다.                    
					</p>
					
					<button type="button"  onclick="javascript:fnCallIpin();" class="type02 w100per" style="margin-top:10px;">아이핀(I-PIN) 인증<i class="ico01"></i></button>
					<form name="form_ipin" method="post">
						<input type="hidden" name="m" value="pubmain">					<!-- 필수 데이타로, 누락하시면 안됩니다. -->
						<input type="hidden" name="enc_data" value="${sEncipData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
						<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
							 해당 파라미터는 추가하실 수 없습니다. -->
						<input type="hidden" name="param_r1" value="">
						<input type="hidden" name="param_r2" value="">
						<input type="hidden" name="param_r3" value="">                        
						<input type="hidden" name="destiUrl" value="/main">
					</form>									
					
				</div>
			</div>
			
			<div class="descInfo type02">
				<ul>
					<li>※ 안내 및 주의사항</li>
					<li>ㆍ본인 명의의 휴대폰을 통해 확인할 수 있습니다.</li>
					<li>ㆍ본인인증 시 고객부담비용은 없습니다.</li>
					<li>ㆍ입력하신 정보는 본인확인 용도 외에 사용되거나 저장되지 않습니다.</li>
				</ul>  
			</div>  
			
			<div class="descInfo">
				<ul>
					<li>※ 본인의 이름과 주민등록번호를 정확히 입력하여도 실명확인이 되지 않는 경우 </li>
					<li>ㆍNICE평가정보㈜ 온라인실명등록 페이지에 방문하셔서 실명인증 정보를 입력하여 주시기 바랍니다.</li>
					<li>※ 개정된 “주문등록법”에 의해 타인의 주민등록번호를 도용하여 온라인 회원가입을 하면 </li>
					<li>ㆍ3년 이하의 징역 또는 1천 만원 이하의 벌금이 부과될 수 있습니다. 관련법률 : 주민등록법 제37조(벌칙) 제9호(시행일 2006년 09월 24일)</li>
				</ul>  
			</div>  
		</div>
	<form id="userinfo_form" name="userinfo_form" method="post" accept-charset="UTF-8">
	
		<!-- 약관동의 관련 데이터  -->
		<input type="hidden" id="receptionAll" name="receptionAll" value="${receptionAll}"/>
		<input type="hidden" id="receptionSms" name="receptionSms" value="${receptionSms}"/>
		<input type="hidden" id="receptionPhone" name="receptionPhone" value="${receptionPhone}"/>
		<input type="hidden" id="receptionEmail" name="receptionEmail" value="${receptionEmail}"/>
		<input type="hidden" id="receptionAdress" name="receptionAdress" value="${receptionAdress}"/>
		<input type="hidden" id="receptionKakao" name="receptionKakao" value="${receptionKakao}"/>
		
		<!-- 마케팅동의 관련 데이터 -->
		<input type="hidden" id="receptionMarketingFirst" name="receptionMarketingFirst" value="${receptionMarketingFirst}"/>
		<input type="hidden" id="receptionMarketingSecond" name="receptionMarketingSecond" value="${receptionMarketingSecond}"/>
		
		<!-- 간편로그인 관련 데이터  -->
		<input type="hidden" id="viewGbn" name="viewGbn" value="${viewGbn}" />
		<input type="hidden" name="snsGbn" id="snsGbn" value="${snsGbn}">
		<input type="hidden" name="snsid" id="snsid" value="${snsid}">
		<input type="hidden" name="loginStatus" id="loginStatus" value="${loginStatus}">	<!-- 로그인상태에서 sns연동하는지 확인 -->
			
		<!-- 실명인증 관련 관련 데이터  -->
		<input type="hidden" name="diVal" 		id="diVal" value="">   			<!-- 실명인증 고유값 		-->
		<input type="hidden" name="ciVal" 		id="ciVal" value="">   			<!-- 실명인증 고유값 		-->
		<input type="hidden" name="vnVal" 		id="vnVal" value="">   			<!-- 실명인증 고유값		-->
		<input type="hidden" name="custNm" 		id="custNm" value=""> 			<!-- 실명인증 이름    		-->		
		<input type="hidden" name="phone"  		id="phone" value="">			<!-- 실명인증 핸드폰번호 	-->
		<input type="hidden" name="gendCd"  	id="gendCd" value=""> 			<!-- 실명인증 회원성별	-->
		<input type="hidden" name="legrBrthYmd" id="legrBrthYmd" value="">  	<!-- 실명인증 회원생일 	-->
		<input type="hidden" name="frgnCd" id="frgnCd" value="">					<!-- 실명인증 내국인여부 	-->
			
	</form>		
		<!--memberWrap-->

	</div>
</div>
<!--subContentsWrap-->
<div class="allBgWrap">
	<div class="memberBg bg03"></div>
</div>


<script type="text/javascript">


$(document).ready(function() {
	fn_init();
	
	$('#bgFullImg').css('height', '100%');
	$('#bgFullImg').append('<div class="member-ani-bg bg03"></div>');
});	

function fn_init(){
	//기본 id로 넣어주기
	setCookie("idpwgbn","customer", 1);	
}

/* 쿠키에 집어넣기 */
function setCookie(name, value, expiredays){
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}

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
	window.open('', 'popupChk', 'width=520, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.target = "popupChk";
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.submit();
}

//가입된 회원인지 확인하고 없으면 다음단계로 넘기고 아니면 로그인 이동
function result(){	
 	var frm = document.userinfo_form;
		frm.action = "/member/custInput";
		frm.submit(); 		
}
</script>
