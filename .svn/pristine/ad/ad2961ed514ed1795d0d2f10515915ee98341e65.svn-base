​<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<form name="frm" id="frm" method="post">
	<input type="hidden" name ="re" id="re" value="N">
	<input type="hidden" name ="snsid" id="snsid" value="">
	<input type="hidden" name ="snsGbn" id="snsGbn" value="">
</form>

<script language="javascript" type="text/javascript">

//$(document).ready(function() {

	var rtnCd = '${rtnCode}';
	var loginGbn = '${gbn}';
	var snsid = '${snsid}';
	var snsGbn = '${snsGbn}';
	var menu_page = "";
	var drmntYn = "";
	var sendUrl = '${sendUrl}';
	
	/*
	 * 로그인 화면에서 왔는지 회원가입화면에서 왔는지  
	*/
	
	var cook = document.cookie + ";";
	var idx = cook.indexOf("menu_page", 0);
	var val = "";
	if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		menu_page = unescape( cook.substring(begin, end) );
	}
	if(menu_page == 'login' || menu_page == ''){
		drmntYn = '${drmntYn}';
		if(drmntYn == 'Y'){ //휴면계정일때
			if(loginGbn == 'normal'){ //일반 로그인이면
				var frm = document.frm;
				frm.action = "/login/userLogin";
				frm.submit();
			}else{ //간편로그인이면 
				opener.window.location = "/login/userLogin";
				//close();
				window.self.close();
			}
		}else{
			if(rtnCd == '0'){
				//회원정보가 있어서 로그인이 된 상태
				if(loginGbn == 'normal'){ //일반 로그인이면
					var frm = document.frm;
					frm.snsid.value = snsid;
					frm.snsGbn.value = snsGbn;
					frm.action = sendUrl;
					frm.submit();
					
					//location.href = sendUrl;
				}else{ //간편로그인이면 
					var frm = window.opener.document.getElementById("userinfo_form");
					frm.action = sendUrl;
					frm.snsid.value = snsid;
					frm.snsGbn.value = snsGbn;	
					frm.viewGbn.value = "s";					
					frm.submit();
					//opener.window.location = sendUrl;
					//close();
					window.self.close();
				}
			}else{//로그인 실패상태
				if(loginGbn != 'normal'){
					if(sendUrl == '/mypage/memberModify'){//로그인 상태에서 회원정보 관리 에서 sns 로그인 눌렀을때
						if(confirm('해당 SNS 계정으로 연동하시겠습니까?')){
							window.opener.document.getElementById("userinfo_form").snsid.value = snsid;
							window.opener.document.getElementById("userinfo_form").snsGbn.value = snsGbn;	
							window.opener.document.getElementById("userinfo_form").viewGbn.value = "s";
							window.opener.document.getElementById("userinfo_form").loginStatus.value = "Y";
							window.opener.memberjoinConfirm();
							//close();
							window.self.close();
						}else{
							//close();
							window.self.close();
						}
					}else{
						if(confirm('회원정보가 없습니다. 회원가입 하시겠습니까?')){
							window.opener.document.getElementById("userinfo_form").snsid.value = snsid;
							window.opener.document.getElementById("userinfo_form").snsGbn.value = snsGbn;	
							window.opener.document.getElementById("userinfo_form").viewGbn.value = "s";
							window.opener.memberjoinConfirm();
							//close();
							window.self.close();
						}else{
							//close();
							window.self.close();
						}
					}
					
				}else{ // 일반으로 들어왔는데 로그인에 실패했을때
					var frm = document.frm;
			
					if (sendUrl == '/mypage/memberModify' ) {
						frm.action = "/mypage/memberModifyPassword";
					} else {
						if('${rtnCode}' == "noExist"){
							$('#re').val('noId');
						}
						frm.action = "/login/userLogin";
					}
					
					frm.submit();				
				}
			}	
		}
		
	}else if(menu_page == 'member'){/* 회원가입때 간편로그인 */
		if(rtnCd == '0'){
			if(snsGbn == "KAKAO") {
				alert("이미 등록되어 있습니다.");
				window.opener.location = '/main';
			} else {
				alert("이미 등록되어 있습니다. 로그인하시기 바랍니다.");
				window.opener.location = '/login/userLogin';
			}
				
		}else{ //간편로그인 등록되어있는것이 없을때
			window.opener.document.getElementById("userinfo_form").snsid.value = snsid;
			window.opener.document.getElementById("userinfo_form").snsGbn.value = snsGbn;				
			window.opener.evManager.callSnsEmployeeView();			
		}
		//close();
		window.self.close();
	}else if(menu_page == 'PopLogin'){/* 팝업 간편로그인  */
		drmntYn = '${drmntYn}';
		if(drmntYn == 'Y'){ //휴면계정일때
			alert("고객님의 계정은 휴면상태입니다. /n 로그인 메뉴에서 휴면계정을 해제하시기 바랍니다.");
		}else{
			if(rtnCd == '0'){
				var safeK		= '${safeKey}';
				var custDivCd 	= '${custDivCd}';
				var comDivCd 	= '${comDivCd}';
				var userLoginId = '${userLoginId}';		
				
				 var opener = window.open('','mainwin');
				 window.open('','_self').close();
			 	 opener.fn_loginSuc(safeK, custDivCd, comDivCd, userLoginId);
			}else{//로그인 실패상태
				if(confirm('회원정보가 없습니다. 회원가입 하시겠습니까?')){
					window.opener.document.getElementById("userinfo_form").snsid.value = snsid;
					window.opener.document.getElementById("userinfo_form").snsGbn.value = snsGbn;	
					window.opener.document.getElementById("userinfo_form").viewGbn.value = "s";
					window.opener.memberjoinConfirm();
					//close();
					window.self.close();
				}
			}	
		}		

	}else {
		
	} 
	
//});


    
</script>
</head>
<body>
</body>
</html>