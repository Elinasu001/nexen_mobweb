<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>

<html>
	<body onload="fn_check()">
	    <div id="wrap">
	
	        <div class="location">
	            <span class="home">홈</span>
	            <span>아이디/비밀번호 찾기</span>
	        </div>
	
	        		<section id="content">
				            <h1 class="sectionTitle">아이디/비밀번호 찾기</h1>
				            <h2 class="sectionTitle2">새 비밀번호 입력</h2>
				            <p class="txt">고객님의 비밀번호를 재 설정합니다. 새로운 비밀번호를 입력 해 주세요.</p>
				
				            <div class="loginWrap">
				                <div class="inner newpassword">
				                    <div class="newpasswordWrap">
				
				                    <form name="frm" method="post" onsubmit="return false">
				                    <input type="hidden" id="usrId" name="usrId"  value="${usrId}">
				                    <input type="hidden" id="diVal" name="diVal"  value="${diVal}">
				                    
				                    
				                        <dl class="inpList">
				                            <dt>아이디</dt>
				                            <dd>
				                                <div class="inputBox">
				                                    <input type="text" name="userId" id="userId" class="inp" value="${usrId}" disabled="disabled">
				                                </div>
				                            </dd>
				                        </dl>
				                        <dl class="inpList">
				                            <dt><label for="password">비밀번호</label></dt>
				                            <dd>
				                                <div class="inputBox">
				                                    <input type="password" name="custPwd" placeholder="비밀번호 입력" id="custPwd" class="inp" onkeyup="fn_passwordCheck(this)" maxlength="20">
				                                    <input type="hidden" id="pwd1Yn" value="N">
				                                </div>
				                                <p class="txt">영문 대 소문자,숫자를 포함하여 10 ~ 20자를 입력해주세요</p>
				                                <p class="txt error">형식에 맞게 입력해 주시기 바랍니다.</p>
				                            </dd>
				                        </dl>
				                        <dl class="inpList">
				                            <dt><label for="repassword">비밀번호 확인</label></dt>
				                            <dd>
				                                <div class="inputBox error">
				                                    <input type="password" name="repassword" placeholder="비밀번호 재 입력" id="repassword" class="inp" onkeyup="fn_passwordConfirm(this)" maxlength="20">
				                                    <input type="hidden" id="pwd2Yn" value="N">
				                                </div>
				                                <p class="txt error">비밀번호가 일치하지 않습니다. 다시 입력해 주십시요</p>
				                            </dd>
				                        </dl>
				                        <div class="btnBox">
				                            <a href="" id="update" onclick="fn_userPwdUpdate(); event.preventDefault();" class="btn ty7" ><span>수정하기</span></a>
				                        </div>
				                    </form>
				                    </div>
				                </div>
				            </div>
				        </section>
	
	
	    </div>
	</body>
</html>


<script type="text/javascript">
$(document).ready(function() {
	
});

//비밀번호 확인 - [비밀번호]
function fn_passwordCheck(element) {
	var regExp = /^(?=.*\d)(?=.*[A-Za-z])[A-Za-z\d]{8,20}$/;
	if (!regExp.test(element.value)) {
		$(element).parent().siblings('.txt.error').show();
		$(element).addClass('error');
		$('#pwd1Yn').val('N');
	} else {
		$(element).parent().siblings('.txt.error').hide();
		$(element).removeClass('error');
		$('#pwd1Yn').val('Y');
	}
}

// 비밀번호 확인 일치 - [비밀번호 확인]
function fn_passwordConfirm(element) {
	if ($('#custPwd').val() != element.value) {
		$(element).parent().siblings('.txt.error').show();
		$(element).addClass('error');
		$('#pwd2Yn').val('N');
	} else {
		$(element).parent().siblings('.txt.error').hide();
		$(element).removeClass('error');
		$('#pwd2Yn').val('Y');
	}
}

function fn_userPwdUpdate(){
		if(!/^(?=.*\d)(?=.*[a-z])[A-Za-z\d]{10,20}$/.test(document.frm.custPwd.value)){ 
			alert('영문,숫자를 포함하여 10 ~ 20자에 맞게 입력해 주시기 바랍니다.'); 
			$('.error:nth-child(3)').css('display','');
			$('.error:nth-child(2)').css('display','none'); 
			return false;
		}
		if (frm.custPwd.value == "") {                     
			alert("비밀번호를 입력해주십시오."); 
			$('.error:nth-child(3)').css('display','');
			$('.error:nth-child(2)').css('display','none');                    
			frm.custPwd.focus();                                    
			return false;                                           	
		}else if (frm.custPwd.value != frm.custPwd2.value) {                     
			alert("비밀번호와 비밀번호 확인 입력값이 다릅니다.\n확인해 주시기 바랍니다.");    
			$('.error:nth-child(3)').css('display','none');
			$('.error:nth-child(2)').css('display','');                
			frm.custPwd2.focus();                                    
			return false;                                           	
		}else {
			frm.action = "/login/updateUserPwd";
			frm.submit();			
			
			return false;
		}
}
 
function fn_check(){
	//로그인 화면으로 다시 가기
	if('${usrId}'==''||'${usrId}'==null){
		alert("회원정보가 없습니다.");
		document.frm.action = "<c:url value='/view/snl/usr/userLogin.do'/>";
		document.frm.submit();
	}
}



/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	if(callback == 'updateUserPwd'){
		
	}
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	if(callback == 'updateUserPwd'){
		alert(status);
	}	
}


</script>
