<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<body>
	<!-- allWrap시작 -->
	<!-- <div class="allWrap loginWrap"> -->

        <%-- <jsp:include page="./includeMenu.jsp" flush="true"/> --%>

		<div class="subContents">
            <div class="titleArea empty">
                <h2 class="type01"><span>넥</span><span>센</span>을 누려보세요!</h2><!--class="type01"-->
                <h3 class="type01">
                    로그인
                </h3>
            </div>

            <!--loginBoxWrap-->
            <div class="loginBoxWrap">
            	<form id="loginFrm" name="loginFrm" method="post" onsubmit="lf_login(); return false;">
                <div class="loginBox">
                    <ul class="submit">
	                    <li><input type="text" name="usrId" id="usrId" class="id" onkeydown="fn_press_han(this);" maxlength="20" placeholder="아이디를 입력하세요"></li>
	                    <li><input type="password" name="password" id="password" class="pw" maxlength="20" placeholder="비밀번호를 입력하세요"></li>

                    </ul>
                    
                    <div class="g-recaptcha" data-sitekey="<%=AppContext.getString(WebConstants.GOOGLE_RECAPTCHA_SITEKEY)%>" 
                    data-size="invisible" 
                    data-callback="callBackCaptcha"
                    expired-callback="expiredCallBackCaptcha"
                    error-callback="errorCallBackCaptcha"></div>
                    
                    <button type="button" class="type01" onClick="javascript:lf_login(); event.preventDefault();">로그인<i class="ico01"></i></button>
					<button type="button" class="type02" onClick="javascript:fn_nonCustOrdPop(); event.preventDefault();">비회원 전용 조회<i class="ico01"></i></button>
                    <div class="idpwSearch">
                        <input type="checkbox" id="idSave" name="idSave" value="0" class="type01" onclick="lf_confirmSave(this);"><label for="idSave"><span></span>아이디 저장</label>

                        <ul>
	                          <li><a href="/member/join">회원가입</a></li>
	                          <li><a href="/login/findIdPwd">아이디/비밀번호찾기</a></li>
                        </ul>
                    </div>

                    <div class="sns">
                        <p>SNS 계정을 통해 간편 로그인이 가능합니다.</p>
                        <ul class="snsGo">
                            <li><a href="javascript:loginProcNaver();" class="naver" title="네이버 로그인"></a></li>
                            <li><a href="javascript:loginProcKakao();" class="kakao" title="카카오 로그인"></a></li>
                            <!--
                            <li><a href="javascript:loginProcFaceb();" class="facebook" title="페이스북 로그인"></a></li>
                            <li><a href="javascript:loginProcGoogle();" class="google" title="구글 로그인"></a></li>
                             -->
                        </ul>
                    </div>
                </div>
			    <input type="hidden" name="sendUrl" value="${sendUrl}"/>
				<input type="hidden" name="accessIp" id="accessIp" value="${userAddress}" />
			</form>
            </div>
            <!--loginBoxWrap-->

        </div>

	<!-- </div> -->
	<!-- allWrap 끝 -->
	<!--
	<div class="bgWrap">
		<div class="loginBg"></div>
    </div>
     -->


    <!-- layerPopup > 비회원 주문 조회 // -->
<div class="popupWrap md-modal md-effect-1" id="modal-nonCustOrd">
	<div class="modal-inner">
		<!-- md-show -->
		<header class="noLine">
			<a href="#" class="layPopClose md-close"></a>
		</header>

		<div class="numberSearch">
			<label for="nonCustOrder">비회원 전용 조회</label>
		</div>

		<!--contents-->
		<div class="popContents">

			<div class="input-item">
				<input type="text" placeholder="주문번호(-없이 숫자만)를 입력해주세요." id="nonCustOrdNo" maxlength="12" style="text-transform:uppercase">
			</div>
			<div class="input-item">
				<input type="text" placeholder="이름을 입력해주세요." id="nonCustNm" maxlength="50">
			</div>
			<div class="input-item">
				<input type="text" placeholder="휴대폰 번호(-없이 숫자만 입력해주세요.)" id="nonCustHp" maxlength="11" onkeyup="validNumberCheck.keyUp(event);">
			</div>

			<div class="btnArea">
				<button type="button" class="type04 w100per" onclick="fn_nonCustOrdSearch();">주문조회<i class="ico01"></i></button>
				<button type="button" class="type04 w100per" onclick="fn_nonCustCouponSearch();">쿠폰조회<i class="ico01"></i></button>
		</div>

		<ul>
			<li>주문 완료 후 발급된 주문번호(OR로 시작)와<br/>주문서에 입력하신 이름/휴대폰 정보를 입력해 주세요.</li>
			<li>주문번호를 잊으신 경우 넥스트레벨 고객센터 <br/> 1855-0100으로 문의해 주시기 바랍니다.</li>
		</ul>

		</div>
		<!--contents-->

	</div>
</div>



	<!-- layerPopup // -->
	<div class="popupWrap md-modal md-effect-1" id="modal-1"> <!-- md-show -->
		<!-- popContents -->
        <div class="popContents">
            <header>
                <h2>휴면계정 안내<a href="#" class="layPopClose md-close"></a></h2>
            </header>

            <!--contents-->
            <div class="contents">
                <div class="alertView">
                     <p class="desc type02"><!--type02-->
			                         해당 계정은 1년 이상 로그인 이력이 없는 휴면 계정입니다. <br/>
			                         휴면계정 해제를 진행해주시기 바랍니다.
                    </p>
				     <div class="resultView alert"></div>
                </div>
            </div>
            <!--contents-->

        </div>
		<!-- popContents -->

        <div class="btnArea type03">
			 <button type="button" onClick="javascript:fn_cancle(); event.preventDefault();" class="type04 center w50per">취소</button>
			 <button type="button" onClick="javascript:fn_drmntCancle(); event.preventDefault();" class="type01 center w50per">휴면계정 해제</button>
		 </div>

	</div>

	<!-- layerPopup // -->
	<div class="popupWrap md-modal md-effect-1" id="modal-2"> <!-- md-show -->
		<!-- popContents -->
        <div class="popContents">
            <header>
                <h2>휴면해제 안내<a href="#" class="layPopClose md-close"></a></h2>
            </header>
            <!--contents-->
            <div class="contents">
                <div class="alertView">
                     <p class="desc type02"><!--type02-->
			                         휴면 계정이 해제되어 계정 활성화가 완료되었습니다.<br/>
			                         로그인후  모든 서비스를 정상적으로 이용하실 수 있습니다.
                    </p>
				     <div class="resultView alert02"></div>
                </div>
            </div>
            <!--contents-->

        </div>
		<!-- popContents -->

        <div class="btnArea center">
			 <button type="button" onClick="javascript:fn_reload(); event.preventDefault();" class="type01 center w100per">확인</button>
		 </div>
	</div>
	<div class="md-overlay"></div>
	<!-- layerPopup // -->
	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

	<form id="userinfo_form" name="userinfo_form" method="post" >
		<input type="hidden" name="snsGbn" id="snsGbn" value="">
		<input type="hidden" name="snsid" id="snsid" value="">
		<input type="hidden" name="viewGbn" id="viewGbn" value="">
	</form>

	<form id="nonCustFrm" name="nonCustFrm" method="post">
		<input type="hidden" name="ordNo" id="ordNo" value="">
		<input type="hidden" name="custNm" id="custNm" value="">
		<input type="hidden" name="mobNo" id="mobNo" value="">
	</form>

<script type="text/javascript">
$(document).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='loginBg'></div>");
	/* page background image End */

	var re = '${re}';
	var drmntYn = '${drmntYn}';
	var errCode = '${rtnCode}';
	/* 휴면계정 레이어 팝업 활성화 */
	if(drmntYn == 'Y'){
		drmntYmHtml();
	}else{
		if(re == 'N'){
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		else if(re == 'noId'){
			alert("일치하는 회원정보가 존재하지 않습니다.");
		}
		if(errCode == -1) {
			alert('${rtnMsg}');
		}
	}
	getLogin();
	setCookie("menu_page",'login', 1);

});


//비회원 주문조회 팝업
function fn_nonCustOrdPop() {
	$('#modal-nonCustOrd').addClass('md-show');

	$("#modal-nonCustOrd").on('click','.md-close',function(){
		$(event.target).parents('.md-show').removeClass('md-show');
	});
}

/* 쿠키에 집어넣기 */
function setCookie(name, value, expiredays){
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}


//저장된 아이디와 비밀번호 값이 있는지 확인
function getLogin() {
	var frm = document.loginFrm;
	// userid 쿠키에서 id 값을 가져온다.
	var cook = document.cookie + ";";
	var idx = cook.indexOf("usrId", 0);
	var val = "";
	if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape( cook.substring(begin, end) );
	}
	// 가져온 쿠키값이 있으면
	if(val!= "") {
		frm.usrId.value = val;
		frm.idSave.checked = true;
	}
}

//로그인 실행
function lf_login() {
	var frm = document.loginFrm;
    frm.usrId.value = frm.usrId.value.trim();
    frm.password.value = frm.password.value.trim();
	if (frm.usrId.value == "") {
		alert("아이디를 입력해주십시오.");
		frm.usrId.focus();
		return false;
	} else if (frm.password.value == "") {
		alert("비밀번호를 입력해주십시오.");
		frm.password.focus();
		return false;
	} else {
		// 아이디 저장이 체크되어있으면 저장하고 아니면 저장안함
		if(frm.idSave.checked) {
			setsave("usrId", frm.usrId.value, 7);
		} else {
			setsave("usrId", frm.usrId.value, -1);
		}

		// Google reCAPTCHA 검증 후 로그인 진행
		grecaptcha.execute();
	}
}

//Google reCAPTCHA callback - 인증 성공
function callBackCaptcha() {
	var frm = document.loginFrm;
	
	frm.action = "/login/loginProc";
	frm.submit();
}

//google reCAPTCHA callback - 인증 만료
function expiredCallBackCaptcha() {
	alert("recaptcha 인증이 만료되었습니다. 다시 시도해주세요.")
}

//google reCAPTCHA callback - 인증 오류
function errorCallBackCaptcha() {
	alert("recaptcha 인증 오류가 발생하였습니다. 다시 시도해주세요.")
}

function fn_cancle(){
	window.location.href="/main";
}

function fn_reload(){
	window.location.href="/login/userLogin";
}


/* 한글입력 방지 */
function fn_press_han(obj)
{
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');

}

//아이디 저장 (로그인시 실행)
function setsave(name, value, expiredays){
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}

//아이디 저장 확인
function lf_confirmSave(checkbox) {
	var isRemember;

	if(checkbox.checked) {
		isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
		if(!isRemember)
			checkbox.checked = false;
	}
}

/*
 * 윈도우 팝업 오픈
 */
function fnWinPopOpen(sUrl){
	$.popModalCenter({
		url       : sUrl,
		scroll    : "yes",
		width     : "450",
		resizable : "yes"
	});
}

function loginProcKakao() {
	fnWinPopOpen("/login/snsLoginPopup?type=kakao&sendUrl="+"${sendUrl}"+"&menu_page=login");
};

function loginProcNaver() {
	fnWinPopOpen("/login/snsLoginPopup?type=naver&sendUrl="+"${sendUrl}"+"&menu_page=login");
};

function loginProcFaceb() {
	fnWinPopOpen("/login/snsLoginPopup?type=faceb&sendUrl="+"${sendUrl}"+"&menu_page=login");
};


function loginProcGoogle() {
	fnWinPopOpen("/login/snsLoginPopup?type=google&sendUrl="+"${sendUrl}"+"&menu_page=login");
};

function login() {
	document.loginFrm.submit();
}

function memberjoinConfirm(){
	var frm = document.userinfo_form;
	frm.action = "/member/termsConditionAgree";
	frm.submit();
}

function drmntYmHtml(){
	$('#modal-1').addClass('md-show');
}

function fn_drmntCancle(){

	//common ajax call
	var pUrl = "/login/usrDrmntCancellation";
	var pSendData = { custId : $("#usrId").val() };
		pSendData = JSON.stringify(pSendData);

	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	console.log(data.result.p_Success_Code);
	    	console.log(data.result.p_Return_Message);
	    	console.log(data.result.p_ErrorText);
	    	if(data.result.p_Success_Code == '0'){
	    		$('#modal-1').removeClass('md-show');
	    		$('#modal-2').addClass('md-show');
	    	}
	    },
	    error: function (request, status, error) {
			console.log('error callback : ' + error);
		}
	});
}

//비회원 주문조회하기
function fn_nonCustOrdSearch() {
	if(ValidUtil.isEmpty($("#nonCustOrdNo").val())) {
		ComUtil.alert("주문번호를 입력해주세요.");
		return false;
	} else if(ValidUtil.isEmpty($("#nonCustNm").val())) {
		ComUtil.alert("이름을 입력해주세요.");
		return false;
	} else if(ValidUtil.isEmpty($("#nonCustHp").val())) {
		ComUtil.alert("휴대폰 번호를 입력해주세요.");
		return false;
	} else {
		var nonCustOrdNo = $("#nonCustOrdNo").val();
		if(nonCustOrdNo.length < 12) {
			ComUtil.alert("주문번호를 확인해주세요. <br>주문번호는 12자리입니다.");
			return false;
		} else {
			var param = {};
			param["ordNo"] = $("#nonCustOrdNo").val();
			param["custNm"] = $("#nonCustNm").val();
			param["mobNo"] = $("#nonCustHp").val();

			$.ajax({
				type: "post",
		        url: "/mypage/selectNonCustOrdList",
		        data: JSON.stringify(param),
		        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		        success: function (data) {
			    	if(data.rtnCode == "0") {
			    		if(data.custMbYn == "Y") {
			    			ComUtil.alert("해당 주문은 회원 주문으로 확인됩니다. <br>로그인 후 나의 주문내역 or 나의 쿠폰 <br>화면에서 확인해 주시기 바랍니다.");
			    		} else {
			    			fn_goOrderList();
			    		}
			    	} else {
			    		ComUtil.alert("조회하신 주문이 존재하지 않습니다. <br>입력값을 확인해주세요. <br> 계속될 경우 관리자에게 문의 바랍니다.");
			    	}
			    },
			    error: function (request, status, error) {
					console.log('error callback : ' + error);
				}
			});
		}
	}
}

//비회원 쿠폰조회하기
function fn_nonCustCouponSearch() {
	if(ValidUtil.isEmpty($("#nonCustOrdNo").val())) {
		ComUtil.alert("주문번호를 입력해주세요.");
		return false;
	} else if(ValidUtil.isEmpty($("#nonCustNm").val())) {
		ComUtil.alert("이름을 입력해주세요.");
		return false;
	} else if(ValidUtil.isEmpty($("#nonCustHp").val())) {
		ComUtil.alert("휴대폰 번호를 입력해주세요.");
		return false;
	} else {
		var nonCustOrdNo = $("#nonCustOrdNo").val();
		if(nonCustOrdNo.length < 12) {
			ComUtil.alert("주문번호를 확인해주세요. <br>주문번호는 12자리입니다.");
			return false;
		} else {
			var param = {};
			param["ordNo"] = $("#nonCustOrdNo").val();
			param["custNm"] = $("#nonCustNm").val();
			param["mobNo"] = $("#nonCustHp").val();

			$.ajax({
				type: "post",
		        url: "/mypage/selectNonCustCouponList",
		        data: JSON.stringify(param),
		        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		        success: function (data) {
			    	if(data.rtnCode == "0") {
			    		if(data.custMbYn == "Y") {
			    			ComUtil.alert("해당 주문은 회원 주문으로 확인됩니다. <br>로그인 후 나의 주문내역 or 나의 쿠폰 <br>화면에서 확인해 주시기 바랍니다.");
			    		} else {
			    			fn_goCouponList();
			    		}
			    	} else {
			    		ComUtil.alert("조회하신 쿠폰이 존재하지 않습니다. <br>입력값을 확인해주세요. <br> 계속될 경우 관리자에게 문의 바랍니다.");
			    	}
			    },
			    error: function (request, status, error) {
					console.log('error callback : ' + error);
				}
			});
		}
	}
}

function fn_goOrderList() {
	var frm = document.nonCustFrm;
    var upOrdNo = $("#nonCustOrdNo").val().toUpperCase();
	frm.ordNo.value = upOrdNo.trim();
    frm.custNm.value = $("#nonCustNm").val().trim();
    frm.mobNo.value = $("#nonCustHp").val().trim();

	frm.action = "/mypage/orderList";
	frm.submit();
}

function fn_goCouponList() {
	var frm = document.nonCustFrm;
    frm.ordNo.value = $("#nonCustOrdNo").val().trim().toUpperCase();
    frm.custNm.value = $("#nonCustNm").val().trim();
    frm.mobNo.value = $("#nonCustHp").val().trim();

	frm.action = "/mypage/couponList";
	frm.submit();
}

</script>