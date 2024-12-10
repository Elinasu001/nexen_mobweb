<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        
        <!--subContentsWrap-->
        <div class="subContentsWrap addBg01">
		    <div class="subContents">
                <div class="titleArea type03">
                    <h2 class="type01">참! <span>잘</span><span>왔</span><span>어</span><span>요.</span></h2>
                    <h3 class="type01">회원가입</h3>               
                </div>
            
                <!--memberWrap-->
                <div class="memberBoxWrap">
                    <div class="btnArea">
                        <button type="button" class="type01 w100per" onClick="javascript:evManager.callEmployeeView(); event.preventDefault();"><i class="ico06 po_04"></i> 개인 회원가입<i class="ico01"></i></button>
                        <button type="button" class="type02 w100per" onClick="javascript:evManager.callBusinessView(); event.preventDefault();"><i class="ico05 po_02"></i>사업자(개인,법인) 회원가입<i class="ico01"></i></button>
                    </div>

                    <div class="sns type02">
                        <!--<p>SNS 계정을 통해 간편 로그인이 가능합니다.<span></span></p>-->
                        <p><img src="/img/member/desc_01.png" alt=""/></p>
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
                <!--memberWrap-->
                
                <div class="descInfo"><!--addBack-->
                    <ul>
                        <li><span> 회원가입은 본인 명의로 1회만 가능하며 만 19세 이상 가입 가능합니다.</span></li>
                        <li><span> SNS 회원가입은 각 SNS별로 중복 회원가입 진행 가능합니다.</span></li>
                        <li><span> 영업용 차량의 경우 서비스가 제한될 수 있습니다. <br/>(자세한 사항은 계약서 약관 참조)</span></li>
                    </ul>  
                </div>
            </div>
        </div>
        
        <!-- 
        <div class="allBgWrap">
			<div class="member-ani-bg bg01"></div>
		</div>
		-->
			
        <form id="userinfo_form" name="userinfo_form" method="post" >
			<input type="hidden" name="snsGbn" id="snsGbn" value="">
			<input type="hidden" name="snsid" id="snsid" value="">
			<input type="hidden" name="viewGbn" id="viewGbn" value="">		
		</form>   
        <!--subContentsWrap-->
        
                
        
<script type="text/javascript">
var frm = document.userinfo_form;
	var evManager = {
		init : function(){
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
		evManager.init();
		 
		/* 모바일 배경이미지 설정
			- 각자 화면에서 $(document).ready(function() 첫줄에 명시하도록 한다.
			- aaaaa 부분을 화면에서 정의한 class로 변경한다.
			- 참조 페이지 join.jsp
		
		1. fullPage의 경우
			$('#bgFullImg').css('height', '100%');
			$('#bgFullImg').append('<div class="aaaaa"></div>');
		2. HalfPage의 경우
			$('#bgFullImg').append('<div class="aaaaa"></div>');
		*/
		
		$('#bgFullImg').css('height', '100%');
		$('#bgFullImg').append('<div class="member-ani-bg bg01"></div>');
	});
	
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
		fnWinPopOpen("/login/snsLoginPopup?type=kakao&sendUrl="+"${sendUrl}&menu_page=member");
	};

	function loginProcNaver() {	
		fnWinPopOpen("/login/snsLoginPopup?type=naver&sendUrl="+"${sendUrl}&menu_page=member");
	};

	function loginProcFaceb() {
		fnWinPopOpen("/login/snsLoginPopup?type=faceb&sendUrl="+"${sendUrl}&menu_page=member");
	};


	function loginProcGoogle() {
		fnWinPopOpen("/login/snsLoginPopup?type=google&sendUrl="+"${sendUrl}&menu_page=member");
	};

</script>