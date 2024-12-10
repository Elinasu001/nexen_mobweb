<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

		<!--subContentsWrap-->
      <div class="subContentsWrap">
        <main class="mynexen mynexen-member">
          <!-- header -->
          <div class="page-header">
            <h2 class="title-deco">
              <span>안전한</span> <span>드라이빙되세요!</span>
            </h2>
            <h3 class="title-deco-sub">회원정보 수정</h3>
          </div>
          <!-- //header -->

          <div class="inset-m payment full-width">
            <p>
              	정보 보호를 위해 비밀번호 또는 SNS를 다시 확인합니다.<br>
              <small>회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다.</small>
            </p>
          </div>

          <div class="inset-m bg">
            <h3 class="content-title">비밀번호 확인</h3>
			<form id="loginFrm" name="loginFrm" method="post" onsubmit="lf_login(); return false;">
	            <div class="submit layout-c mb-ml">
	              <label for="id01"><span class="black">아이디</span></label>
	              <div class="layout-r border-bottom">
	                <input type="text" readonly="readonly" name="usrId" id="usrId" class="pl-0 trans-bg" value="${userLoginId}" onkeydown="fn_press_han(this);" maxlength="12" placeholder="아이디를 입력하세요" >
	              </div>
	            </div>

	            <div class="submit layout-c mb-ml">
	              <label for="password"><span class="black">비밀번호</span></label>
	              <div class="layout-r border-bottom">
	                <input type="password" name="password" id="password" class="pl-0 trans-bg" maxlength="20" placeholder="비밀번호를 입력하세요" onkeydown="enterSchKey();">
	              </div>
	            </div>

	            <div class="submit layout-c">
	              <button type="button" class="link layout-r text-left inset-m full-width btn-primary" onClick="javascript:lf_login(); event.preventDefault();">
	              	<span>확인</span>
	              </button>
	            </div>

	            <div class="sns">
	              <h3 class="content-title">SNS확인</h3>

	              <p>SNS 계정을 통해 간편 확인이 가능합니다.</p>
	              <ul class="snsGo">
	                <li><a href="javascript:loginProcNaver();" class="naver" title="네이버 로그인"></a></li>
	                <li><a href="javascript:loginProcKakao();" class="kakao" title="카카오 로그인"></a></li>
	                <!--
	                <li><a href="javascript:loginProcFaceb();" class="facebook" title="페이스북 로그인"></a></li>
	                <li><a href="javascript:loginProcGoogle();" class="google" title="구글 로그인"></a></li>
	                 -->
	              </ul>
	            </div>
			    <input type="hidden" name="sendUrl" value="${sendUrl}"/>
				<input type="hidden" name="accessIp" id="accessIp" value="${userAddress}" />
            </form>
          </div>
        </main>
      </div>
		<!--subContentsWrap End -->

	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>

	<form id="userinfo_form" name="userinfo_form" method="post" >
		<input type="hidden" name="snsGbn" id="snsGbn" value="">
		<input type="hidden" name="snsid" id="snsid" value="">
		<input type="hidden" name="viewGbn" id="viewGbn" value="">
		<input type="hidden" name="loginStatus" id="loginStatus" value="">
		<input type="hidden" name="sendUrl" id="sendUrl" value="/mypage/memberModifyPassword">
	</form>

<script type="text/javascript">
var frm = document.userinfo_form;
var evManager = {
	init : function(){
		var loginId = "${userVo.loginId}";
		if(loginId == "") {
			ComUtil.confirm("로그인 후 이용가능 합니다. 로그인 화면으로 이동하시겠습니까?", '' , function(){
				frm.action = "/login/userLogin";
				frm.submit();
			});
		}
	}
	,
	callBusinessView : function(){

	    window.document.getElementById("userinfo_form").viewGbn.value = "b";
		frm.action = "/member/termsConditionAgree";
		frm.submit();


	}
	,
	callEmployeeView : function(){

		window.document.getElementById("userinfo_form").viewGbn.value = "m";
		frm.action = "/member/termsConditionAgree";
		frm.submit();
	}
	,
	callSnsEmployeeView : function(){
		window.document.getElementById("userinfo_form").viewGbn.value = "s";
		frm.action = "/member/termsConditionAgree";
		frm.submit();
	}
}


$(document).ready(function() {

	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-modify'></div>");
	/* page background image End */

	evManager.init();

	var re = '${re}';
	var drmntYn = '${drmntYn}';
	/* 휴면계정 레이어 팝업 활성화 */
	if(drmntYn == 'Y'){
		drmntYmHtml();
	}else{
		if(re == 'N'){
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		}
	}

	getLogin();
	setCookie("menu_page",'login', 1);
});

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
		//frm.idSave.checked = true;
	}
}

//로그인 실행
function lf_login() {
	var frm = document.loginFrm;
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
		/* if(frm.idSave.checked) {
			setsave("usrId", frm.usrId.value, 7);
		} else {
			setsave("usrId", frm.usrId.value, -1);
		} */

 		frm.action = "/login/loginProc";
		frm.submit();
	}
}

/* 한글입력 방지 */
function fn_press_han(obj)
{
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');

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

function memberjoinConfirm(){
	var frm = document.userinfo_form;
	frm.action = "/member/termsConditionAgree";
	frm.submit();
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

//로그인 - enterKey
function enterSchKey() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {
		event.keyCode = 0;
		lf_login();
	}
}

</script>