<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>
       
		<!--subContentsWrap-->
        <div class="subContentsWrap">
			<div class="subContents type03">
				<div class="titleArea type02">
					<h2 class="type01"><span>잊</span><span>어</span>버렸나요?</h2>
					
					<!-- tabs -->
					<div class="tabsWrap">
						<ul class="tabs">
							<li class="w50per active" id="id" rel="tab01">아이디찾기 </li>
							<li class="w50per" id="pw" rel="tab02">비밀번호찾기 </li>							
						</ul>
					</div>
					<!-- tabs -->
				</div>
				
				<!-- memberBoxWrap -->
				<div class="memberBoxWrap">
					
								<!-- tabcontents -->
								<div class="tabContentWrap">
									<!-- tab01-->
									<div id="tab01" class="tabContent">
										<div class="certification">
			                                <button type="button" class="type05 w100per" onclick="javascript:fnCallPhone();">휴대전화 인증<br/><i class="ico01"></i><span>휴대전화를 통하여 본인 확인</span></button>
											<form name="form_chk" method="post">
												<input type="hidden" name="m" value="checkplusSerivce">		<!-- 필수 데이타로, 누락하시면 안됩니다. -->
												<input type="hidden" name="EncodeData" value="${sEncData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
												<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
													해당 파라미터는 추가하실 수 없습니다. -->
												<input type="hidden" name="param_r1" value="">
												<input type="hidden" name="param_r2" value="">
												<input type="hidden" name="param_r3" value="">
											</form>													                                
			
			                                <button type="button" class="type06 w100per" onclick="javascript:fnCallIpin();">아이핀(I-PIN) 인증<br/><i class="ico01"></i> <span>사이버 신원번호로 본인 확인</span></button>
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
													
										<div class="descInfo fColor02">
											<ul>
												<li class="mb-m"><span>이름, 주민등록번호를 정확히 입력해도 실명확인이 되지 않는 경우, NICE평가정보㈜ 온라인실명등록 페이지 방문, 실명인증 정보 입력. </span></li>
												<li><span>개정된 “주문등록법”에 의해 타인의 주민등록번호를 도용, 회원가입을 하면 3년 이하의 징역 또는 1천 만원 이하의 벌금 부과. 주민등록법 제37조(벌칙) 제9호(시행일 2006년 09월 24일) </span></li>
											</ul>  
										</div>
									</div>
									<!-- tab01-->

						<!-- tab02 -->
						<form name="frm" method="post" onsubmit="return false">
						<div id="tab02" class="tabContent">							
							<div class="submitAreaWrap">
								<div class="submitArea">
									<label for="usrid"><span>아이디 *</span></label>
									<div class="submit">
										<input type="text" name="usrid" id="usrid" readonly="readonly" class="type02 w100per" title="아이디 입력란">
										<input type="hidden" name="custId" id="custId"  value=""> 
										<p class="validation type03">
											<!-- <span><i class="ico08"></i>이미 사용중인 아이디입니다.</span> -->
										</p>
									</div>
								</div>

								<div class="submitArea type02">
									<label for="custPwd"><span>비밀번호 *</span></label>
									<div class="submit ">
										<input type="password" name="custPwd" id="custPwd"class="type03 w100per" onkeyup="showKeyCodePw1()" onkeydown="showKeyCodePw1()" maxlength="20" title="비밀번호 입력란"> 
										
										<p class="validation type03">
											<span id="pass_text1"><i class="ico08"></i>영문,숫자를 포함하여 10 ~ 20자를 입력해 주세요.</span>
										</p>
									</div>
								</div>
								
								<div class="submitArea type02">
									<label for="custPwd2"><span>비밀번호 확인</span></label>
									<div class="submit">
										<input type="password" name="custPwd2" id="custPwd2" class="type03 w100per" onkeyup="showKeyCodePw2()" onkeydown="showKeyCodePw2()" maxlength="20" title="비밀번호확인 입력란" placeholder="비밀번호를 다시 한번 입력해 주세요." >   
										
										<p class="validation type03">
											<span id="pass_text2"><i class="ico08 error"></i>비밀번호가 일치하지 않습니다. 다시 입력해 주십시요</span>
										</p>
									</div>
								</div>							
							</div>
							
							<div class="btnArea type02">
                                <button type="button"  onclick="javascript:fn_userPwdUpdate();" class="type01 w100per">수정하기 <i class="ico01"></i></button>
                            </div>
						</div>
						</form>
						<!-- tab02 -->
						
					</div>
					<!-- tabcontents -->
				</div> 
				<!-- memberBoxWrap -->
			</div>
			
		</div>
        <!--subContentsWrap-->
        
	<!-- layerPopup // -->
	<div class="popupWrap md-modal md-effect-1" id="modal-FindId"> <!-- md-show -->
		<!-- popContents -->
        <div class="popContents">
            <header>
                <h2>아이디 찾기<a onclick="sendChildValueCancle('modal-FindId');" class="layPopClose md-close"></a></h2>			
            </header>
        
            <!--contents-->
            <div class="contents">
                <div class="alertView">
                     <p class="desc">입력하신 정보와 일치하는 아이디는 다음과 같습니다.</p>

                     <div class="resultView">
                         nexo2o                
                     </div>
                </div>
            </div>
            <!--contents-->
            
        </div>
		<!-- popContents -->

        <div class="btnArea type03">
			 <button type="button" onclick="javascript:Login.fnGoToUrl('/login/userLogin');" class="type01 center w50per">로그인</button>
			 <button type="button" onclick="javascript:fn_passwordChg();" class="type02 center w50per">비밀번호 찾기</button>
		 </div>

	</div>
	<div class="md-overlay"></div>
	<!-- layerPopup // -->
	
    
    
    
	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>
	    
	<form id="userinfo_form" name="userinfo_form" method="post" >	
		<input type="hidden" name="diVal" 		id="diVal" value="">   			<!-- 실명인증 고유값 		-->
		<input type="hidden" name="ciVal" 		id="ciVal" value="">   			<!-- 실명인증 고유값 		-->
		<input type="hidden" name="vnVal" 		id="vnVal" value="">   			<!-- 실명인증 고유값		-->
		<input type="hidden" name="custNm" 		id="custNm" value=""> 			<!-- 실명인증 이름    		-->		
		<input type="hidden" name="phone"  		id="phone" value="">			<!-- 실명인증 핸드폰번호 	-->
		<input type="hidden" name="gendCd"  	id="gendCd" value=""> 			<!-- 실명인증 회원성별	-->
		<input type="hidden" name="legrBrthYmd" id="legrBrthYmd" value="">  	<!-- 실명인증 회원생일 	-->	
		<input type="hidden" name="frgnCd" id="frgnCd" value="">  	<!-- 실명인증  외국인여부 -->
	</form>
					    
	</body>
</html>
<script type="text/javascript">

$(document).ready(function() {
	var sRtnMsg = "${sRtnMsg}"; 
	var sEncData = "${sEncData}"; 
	var iRtn = "${iRtn}";
	var memberAuthVo = "${memberAuthVo.getsEncData()}"
	
	/* page background image Start */
	$("#bgFullImg").append("<div class='subBg type01'></div>");
	/* page background image End */
	
	//기본 셋팅 함수
	fn_init();
	fn_initEvent();
});

function fn_init(){
	$('.error:nth-child(1)').parents("span").css('display','none');
}

/* 이벤트 함수 */
function fn_initEvent(){
	//기본 id로 넣어주기
	setCookie("idpwgbn","id", 1);
	//탭 또는 라이오 이벤트
	$("#id, #pw").on("click" , function(e) {
		//아이디 찾기던 비밀번호 찾기던 아이핀 인증하게
		var gbn = $(this).attr("id");
		 setCookie("idpwgbn",gbn, 1);
		 $('#tab01').css("display","");
		 $('#tab02').css("display","none");
	});		
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
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.target = "popupChk";
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.submit();
}

//아이디 찾아서 가져오기.
function result(){
	
	var diVal = $('#diVal').val();
	var cond = {diVal:diVal};
	var url = '/login/findUserId';
	var reqId = 'findUserId';
	
	//23.10.16 10233006 아이디 찾기 오류 수정
	/* var sendMap = new Map();	
		sendMap.put("cond", cond); */
	//ajax 호출
	cfnSendRequest(url, cond, reqId);
	
}

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {

	if(callback == 'findUserId'){
		var resultMap = result.resultMap;
		var chkGb = $('.tabs').find('.active').attr('id');
		var frm = document.userinfo_form;
		
		//아이디값이 없을때 레이어 팝업
		if(typeof resultMap.custId == 'undefined' || resultMap.custId == '' ){
			alert("회원정보가 존재하지 않습니다");
		}else{
		//아이디값이 있을때 레이어 팝업
			
			//일반회원인지 간편로그인 회원인지 가리기		
			var chkLogin = "nomal";
		
			if (resultMap.custId.indexOf("SNS_") != -1) {
				chkLogin = "easy";
			}
			if(chkGb == 'id'){
				var esayLoginText = "고객님은 현재 SNS계정으로 등록되어 있습니다.";
				//간편로그인이 아니면...일반회원 아이디로 뿌려준다.
				if(chkLogin == "nomal"){
					esayLoginText = "";			
					$("#modal-FindId").addClass("md-show");
					$('.resultView').text(resultMap.custId);
					$('#usrid').val(resultMap.custId);
					$('#custId').val(resultMap.custId);
				}else{//아니면 간편 로그인 얼럿!
					var htmltxt = "고객님은 현재 ";
					
					if(resultMap.custId.indexOf("NV")!= -1){
						htmltxt += "[네이버]";
					}
					if(resultMap.custId.indexOf("KO")!= -1){
						htmltxt += "[카카오]";
					}
					if(resultMap.custId.indexOf("FB")!= -1){
						htmltxt += "[페이스북]";
					}
					if(resultMap.custId.indexOf("GG")!= -1){
						htmltxt += "[구글]";
					}
					//간편로그인인 경우
					alert(htmltxt + " 간편로그인으로 등록되어 있습니다. 간편로그인으로 로그인하시기 바랍니다.");					
				}
			}else if(chkGb == 'pw'){
				if(chkLogin == "nomal"){
					$("#usrid").val(resultMap.custId);
					$("#custId").val(resultMap.custId);
					//비밀번호 찾기 화면 오픈 
					fn_passwordChg();					
				}else if(chkLogin == "easy"){
					var htmltxt = "고객님은 현재 ";
					
					if(resultMap.custId.indexOf("NV")!= -1){
						htmltxt += "[네이버]";
					}
					if(resultMap.custId.indexOf("KO")!= -1){
						htmltxt += "[카카오]";
					}
					if(resultMap.custId.indexOf("FB")!= -1){
						htmltxt += "[페이스북]";
					}
					if(resultMap.custId.indexOf("GG")!= -1){
						htmltxt += "[구글]";
					}
					//간편로그인인 경우
					ComUtil.alert(htmltxt + " 간편로그인으로 등록되어 있습니다. 간편로그인으로 로그인하시기 바랍니다.");
				}
			}
		}
	}
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	if(callback == 'findUserId'){
		alert(status);
	}	
}

/*
 * 아이디 찾기로 패스워드 변경 클릭시  
 */
function fn_passwordChg(){

   var tabgbn = $('.tabs').find('.active').attr('rel');
   //팝업
   $("#modal-FindId").removeClass("md-show");   
   $('#id').removeClass('active');   
   $('#pw').addClass('active');
   
   $('#tab01').css("display","none");
   $('#tab02').css("display","");
   
	//탭클릭 차단
	$("#id, #pw").css('pointer-events',"none");
}

function fn_userPwdUpdate(){

	var custPwd = frm.custPwd.value;
	var custPwd2 = frm.custPwd2.value;	
	
	if(!ValidUtil.pwCheckNumAlpha(custPwd) && !ValidUtil.pwCheckNumFnAlpha(custPwd)){
		$('#pass_text1').empty();
		alert('영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자에 맞게 입력해 주시기 바랍니다.'); 
		$('#pass_text1').append('<i class="ico08"></i>영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자를 입력해 주세요.');
		$('#pass_text1').css('color','red'); 
		return false;
	}
	if (custPwd == "") {
		$('#pass_text1').empty();
		alert("비밀번호를 입력해주십시오."); 
		$('#pass_text1').append('<i class="ico08"></i>영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자를 입력해 주세요.');
		$('#pass_text1').css('color','red');                    
		frm.custPwd.focus();                                    
		return false;                                           	
	}else if (custPwd != custPwd2) {
		$('#pass_text2').empty();
		alert("비밀번호와 비밀번호 확인 입력값이 다릅니다.\n확인해 주시기 바랍니다.");    
		$("#pass_text2").css("display","block");
 		$('#pass_text2').append('<i class="ico08"></i>비밀번호가 일치하지 않습니다.');
		$('#pass_text2').css('color','red');
		frm.custPwd2.focus();                                    
		return false;                                           	
	}else {
		frm.action = "/login/updateUserPwd";
		frm.submit();			
		
		return false;
	}
}


//입력 Text keyup Script (Pass1)
function showKeyCodePw1(){
	// 비밀번호
	var custPwd = frm.custPwd.value;
	var custPwd2 = frm.custPwd2.value;
	
	$('#pass_text2').text(''); 
	$('#pass_text2').find('i').remove();
	$('#custPwd2').val('');
	$('#pass_text2').val('');
	$('#pass_text1').val('');
	$('#pass_text1').empty();
	
	if(custPwd.length == 0){
		$('#pass_text1').text(''); 
	}
	
	if(!ValidUtil.pwCheckNumAlpha(custPwd) && !ValidUtil.pwCheckNumFnAlpha(custPwd)){
		$('#pass_text1').append('<i class="ico08"></i>영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자를 입력해 주세요.');
		$('#pass_text1').css('color','red');
	}
	else if(custPwd != custPwd2 && $('#pass_text2').val() == 'p'){
		$('#pass_text1').append('<i class="ico08"></i>영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자를 입력해 주세요.');
		$('#pass_text1').css('color','red');
	}
	else{
		$('#pass_text1').css('color','black')
		$('#pass_text1').text('확인 되었습니다.'); 
		$('#pass_text1').val('p');
	}	
}

//입력 Text keyup Script (Pass2)
function showKeyCodePw2(){	
	// 비밀번호
	var custPwd = frm.custPwd.value;
	var custPwd2 = frm.custPwd2.value;
	
	// 비밀번호
	$('#pass_text2').empty();
	
	if($('#pass_text1').val() != 'p'){
		$("#pass_text2").css("display","block");
 		$('#pass_text2').append('<i class="ico08"></i>비밀번호가 일치하지 않습니다.');
		$('#pass_text2').css('color','red');
	}
	else if(custPwd != custPwd2 && $('#pass_text1').val() == 'p'){
		$("#pass_text2").css("display","block");
 		$('#pass_text2').append('<i class="ico08"></i>비밀번호가 일치하지 않습니다.');
		$('#pass_text2').css('color','red');
	}
	else{
		$('#pass_text2').css('color','#404040')
		$('#pass_text2').text('비밀번호가 일치합니다.'); 
		$('#pass_text2').val('p');
	}
}

</script>