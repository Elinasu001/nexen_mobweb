<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
       
<form name="form_safeKey" method="post">	
		<input type="hidden" 					name="path"			value="mobile"/>
		<input type="hidden" id="birthdate" 	name="birthdate" />
		<input type="hidden" id="mobileno" 		name="mobileno" />
		<input type="hidden" id="kunnr" 		name="kunnr" />
		<input type="hidden" id="sendgubun" 	name="sendgubun"  	value=""/>
		<input type="hidden" id="email" 		name="email"    	value=""/>
		<input type="hidden" id="custNo" 		name="custNo"   	value="<%=session.getAttribute("custNo") %>"/>
		<input type="hidden" id="safekey" 		name="safekey"  	value="<%=session.getAttribute("safekey") %>"/>
		<input type="hidden" id="username" 		name="username" 	value="<%=session.getAttribute("username") %>">
		<input type="hidden" id="gender" 		name="gender" 		value="<%=session.getAttribute("gendCd") %>">
		
	<!-- 인증번호 발급 -->
	<input type="hidden" class="md-trigger" data-modal="modal-SafeKey">
   	<div class="fullPopup md-modal-3 md-effect-1 md-close" id="modal-SafeKey">
		<div class="popContents order-basket">
   			<a href="#" class="layPopClose md-close"></a>
	    	<header>
	      		<h2>인증번호 발급</h2>
	    	</header>
	    	<!--contents-->
	    	<div class="popup-contents">
	      		<div class="inset-ml">
	        		<div class="submit mb-m">
	          			<div class="border-gray-bottom">
	            			<label for="name01"><span class="essen black">성명</span></label>
	            			<input type="text" name="" class="pl-0 pr-0" id="name01" title="성명 입력란" placeholder="성명을 입력하세요" readonly="readonly" value="<%=session.getAttribute("username")%>">
	          			</div>
	        		</div>

	        		<div class="submit border-gray-bottom mb-m">
	          			<label for="gender"><span class="essen black">성별</span></label>
	          			<%if("1".equals(session.getAttribute("gendCd"))){ %>
	          				<input type="text" value="남" name="" readonly="readonly" class="pl-0 pr-0" id="gender" title="성별 입력란">
						<%}else{%>
							<input type="text" value="여" name="" readonly="readonly" class="pl-0 pr-0" id="gender" title="성별 입력란">
	          			<%}%>	          			
	        		</div>

	        		<div class="submit border-gray-bottom mb-m">
	          			<label for="legalBirth"><span class="essen black">법정생일</span></label>
	          			<div class="layout-r inline-m">
	            			<select class="inline border-none pl-0 pr-0" title="년도 선택" id="legalBirth" name="legalBirth" onchange="btnWordch();">
	            			</select>
	            			<select class="inline border-none pl-0 pr-0" title="월 선택"  	id="monSafekey" name="monSafekey" onchange="btnWordch();">
	            			</select>
	            			<select class="inline border-none pl-0 pr-0" title="일 선택" 	id="daySafekey" name="daySafekey" onchange="btnWordch();">
	            			</select>
	          			</div>
	        		</div>

	        		<div class="submit layout-c border-gray-bottom">
	          			<label for="phone11"><span class="essen black">휴대전화</span></label>
          				<div class="layout-r inline-s same-size">
            				<select class="inline border-none pl-0"  id="phon1Safekey" name="phon1Safekey"  title="휴대전화 앞자리 선택">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
            				</select>
            				<span class="divi type02 align-middle"></span>
            				<input type="text" id="phon2Safekey" name="phon2Safekey" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" class="inline border-none"  title="휴대폰 중간번호 입력란">
            				<span class="divi type02 align-middle"></span>
            				<input type="text" id="phon3Safekey" name="phon3Safekey" maxlength="4"  onkeyup="btnWord()" onkeypress="return fn_press(event, 'numbers');" onkeydown="fn_press_han(this);" class="inline border-none"  title="휴대폰 끝번호 입력란">
          				</div>
	        		</div>
	      		</div>

	      		<div class="popTerms pl-ml pr-ml">
	      			<div class="check">
	        			<input type="checkbox" id="step01_agree" name="step01_agree" value="0" class="type01">
	        			<label for="step01_agree"><span></span><b>(필수)개인정보 수집 및 이용에 대한 동의</b></label>
	      			</div>
	      			<div class="terms mt-m">
	        			가. 수집목적 : 고객의 청약 여부 확인 <br>
					          나. 수집항목 : 성명, 성별, 법정생일, 전화번호<br>
					          다. 이용기간 : 법령에서 정한 기간까지 보유 후 파기
	      			</div>
	      		</div>

	      		<p class="desc inset-ml small font-gray">
	        		1) 위탁기관 : NICE평가정보주식회사<br>
	        		2) 위탁업무 : 본인인증, 이용약관 및 개인정보 수집 · 이용/제공 · 활용/조회 동의
	      		</p>	      		
	    	</div>
	    	<!--contents-->
	  	</div>
		  	<div class="btnArea layout-r same-size bottom-box">
	    		<button type="button" onclick="safekeyClose('');" class="inline inset-m btn-gray-light">취소</button>
	    		<button type="button" onclick="safekeyOpen();"    class="inline inset-m btn-primary">발급</button>	      		
  			</div>
	</div>
	<!-- //인증번호 발급 -->		            
</form>
<script type="text/javascript">

$( document ).ready(function() {
	/* 법정생일 셋팅 */
	getYearSelect();
	getMonSelect(); 
	getDaySelect();
	var gender = $('#gender').val();
	console.log("gender   : "+gender);
	if(gender == '2'){
		$('#gender').val('0');
	}	
});

function btnWordch(){
	
	var frm = document.form_safeKey;
	
	var legalBirth 	= frm.legalBirth.value;
	var monSafekey 	= frm.monSafekey.value;
	var daySafekey 	= frm.daySafekey.value;
	var phon1Safekey 	= frm.phon1Safekey.value;
	var phon2Safekey 	= frm.phon2Safekey.value;
	var phon3Safekey 	= frm.phon3Safekey.value;
	var step01_agree = frm.step01_agree.checked;
		
	if(legalBirth != '' & monSafekey != '' & daySafekey != '' &
			phon2Safekey.length == 4 & phon3Safekey.length == 4 & step01_agree == true){

	}
}

function btnWord(){

	var frm = document.form_safeKey;	
	var legalBirth = frm.legalBirth.value;
	var monSafekey = frm.monSafekey.value;
	var daySafekey = frm.daySafekey.value;
	var phon1Safekey = frm.phon1Safekey.value;
	var phon2Safekey = frm.phon2Safekey.value;
	var phon3Safekey = frm.phon3Safekey.value;
	var step01_agree = frm.step01_agree.checked;
		
		
	if(legalBirth != '' & monSafekey != '' & daySafekey != '' &
			phon2Safekey.length == 4 & phon3Safekey.length == 4 & step01_agree == true){
	}
}


function getYearSelect() {
	var now = new Date();
	var legalBirthHtml = "";
		legalBirthHtml += '<option value="" >년도</option>';
		
	for(i=now.getFullYear()-90; i < now.getFullYear()+1; i++) {
			legalBirthHtml += '<option value="'+i+'">'+i+" 년 </option>";
	}
	$('#legalBirth').html(legalBirthHtml);
}

function getMonSelect() {
	
	var monSafekeyHtml = "";
		monSafekeyHtml += '<option value="" >월</option>';
	for(var i=1; i<13; i++) {
		if(i <= 9 ){
			monSafekeyHtml += '<option value="0'+i+'">'+i+" 월 </option>";	
		}else{
			monSafekeyHtml += '<option value="'+i+'">'+i+" 월 </option>";
		}
		
	}
	$('#monSafekey').html(monSafekeyHtml);
}

function getDaySelect() {
	var daySafekeyHtml = "";
		daySafekeyHtml += '<option value="" >일</option>';
	  for(var i=1; i<32; i++) {
			if(i <= 9 ){
				daySafekeyHtml += '<option value="0'+i+'">'+i+" 일 </option>";	
			}else{
				daySafekeyHtml += '<option value="'+i+'">'+i+" 일 </option>";
			}
		  
	   } 
	  $('#daySafekey').html(daySafekeyHtml);
}


function safekeyOpen() {
	
	var frm = document.form_safeKey;
	
	if($("#step01_agree").prop("checked") == false) {
		alert("이용약관 및 개인정보 수집 이용에 동의해 주세요");
		return false;
	}
	else if($("#legalBirth").val() == '' || $("#monSafekey").val() == '' || $("#daySafekey").val()== ''){
		alert("법정생일을 확인해주세요.");
		return false;
	}
	else if($("#phon2Safekey").val() < 4 || $("#phon3Safekey").val() < 4 ){
		alert("휴대폰번호를 확인해주세요.");
		return false;
	}
	
	var legalBirth   =  frm.legalBirth.value;
	var monSafekey   =  frm.monSafekey.value;
	var daySafekey   =  frm.daySafekey.value;
	var phon1Safekey =  frm.phon1Safekey.value;
	var phon2Safekey =  frm.phon2Safekey.value;
	var phon3Safekey =  frm.phon3Safekey.value;
	
	frm.birthdate.value = legalBirth+monSafekey+daySafekey;
	frm.mobileno.value = phon1Safekey+phon2Safekey+phon3Safekey;
	
 	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
 	frm.action = "/member/checkplusSend";
	frm.target = "popupChk";
	frm.submit();	
}

function safekeyClose(key){
	if(key != ''){
		$('#safekey').val(key);	
	}
	$('#modal-SafeKey').removeClass('md-show');	
}


/* 숫자만 입력받기 */
function fn_press(event, type) {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;	
    if(type == "numbers") {
    	if((evt_code < 48) || (evt_code > 57)){
    		return false;
    	}
    }
}
/* 한글입력 방지 */
function fn_press_han(obj){
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}
</script>