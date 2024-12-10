<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>		

		<!--subContentsWrap-->
        <div class="subContentsWrap">
            <div class="stepTitle type02 perStep02">
				<ul class="step03">
					<li class="step01 borLine">약관동의 <span class="stepIco"></span></li>
					<li class="step02 borLine">실명인증 <span class="stepIco"></span></li>
					<li class="step03 active">회원정보</li>
				</ul>
            </div>
            
			<div class="subContents">
				<div class="titleArea type03">
					<h2 class="type01">꼭! <span>필</span><span>요</span><span>해</span><span>요.</span></h2>          
				</div>
				
					
				<!--memberWrap-->
				<div class="memberBoxWrap">
					<form name="frm" id="frm" method="post">
						<!-- 이전 화면에서(약관동의) 넘어온 값 -->
						<input type="hidden" value="${diVal}" 		name ="diVal" />		<!-- 실명 인증 고유 값 -->
						<input type="hidden" value="${ciVal}" 		name ="ciVal" />		<!-- 실명 인증 고유 값 -->
						<input type="hidden" value="${vnVal}" 		name ="vnVal" />		<!-- 실명 인증 고유 값 -->
						<input type="hidden" value="${legrBrthYmd}" name ="legrBrthYmd" />	<!-- 실명 인증 - 회원 생년월일 -->
						<input type="hidden" value="${gendCd}" 		name ="gendCd" />		<!-- 실명 인증 - 회원 성별 -->
						<input type="hidden" value="${frgnCd}"		name ="frgnCd" />		<!-- 실명 인증 - 내, 외국인 구분 -->
						
						<input type="hidden" value="${receptionAll}"	name ="receptionAll" />
						<input type="hidden" value="${receptionSms}"	name ="receptionSms" />
						<input type="hidden" value="${receptionPhone}"	name ="receptionPhone" />
						<input type="hidden" value="${receptionEmail}"	name ="receptionEmail" />
						<input type="hidden" value="${receptionAdress}"	name ="receptionAdress" />
						<input type="hidden" value="${receptionKakao}"	name ="receptionKakao" />
						
						<!-- 마케팅동의 관련 데이터 -->
						<input type="hidden" value="${receptionMarketingFirst}" name="receptionMarketingFirst" id="receptionMarketingFirst"/>
						<input type="hidden" value="${receptionMarketingSecond}" name="receptionMarketingSecond" id="receptionMarketingSecond"/>
						
						<input type="hidden" id="viewGbn" name="viewGbn" value="${viewGbn}" />
						<input type="hidden" name="snsGbn" id="snsGbn" value="${snsGbn}">
						<input type="hidden" name="snsid" id="snsid" value="${snsid}">
						<input type="hidden" id="joinPath" name="joinPath" value="MOB" />						
						
						<!-- 건물번호 -->
						<input type="hidden" value=""	name ="bldMngNo" />
						
						<!-- INPUT PATH -->
						<input type="hidden" value="02"		id="inputlglPath" name="inputLglPath"/>
						<input type="hidden" value="0201"	id="inputMdlPath" name="inputMdlPath"/>
						
					    <div class="submitAreaWrap">
					    
							<div class="submitArea">
								<label for="custId"><span >아이디  *</span></label>
								<div class="submit">
									<input type="text" name="custId" class="type02 w205" id="custId" title="아이디 입력란" maxlength="20" onkeyup="evManager.idValidation(); this.value=evManager.noKorean(this.value); evManager.btnDisabled();" > 
									<input type="hidden" id="idOverLapChk" name="idOverLapChk" value="0">	
									
									<p class="validation" style="display: none" id="custIdTxt1" btnChk="0">
										<span id="custIdTxt2" style="color:#FFF"></span>
									</p>
								</div>
							</div>
	
							<div class="submitArea">
								<label for="custPwd"><span>비밀번호 *</span></label>
								<div class="submit ">
									<input type="password" name="custPwd" class="type02 w280" id="custPwd" title="비밀번호 입력란" onkeyup="evManager.pwdValidation(); evManager.btnDisabled();" onkeydown="evManager.pwdValidation()" maxlength="20"> 
									
									<p class="validation" style="display: none; color:#FFF;" id="custPwdTxt1" btnChk="0">
										<span><i class="ico07"></i>이미 사용중인 비밀번호입니다.</span>
									</p>
								</div>
							</div>
						
							<div class="submitArea">
								<label for="custPwd02"><span>비밀번호 확인 *</span></label>
								<div class="submit">
									<input type="password" name="custPwd02" class="type02 w280" id="custPwd02" title="비밀번호확인 입력란" placeholder="비밀번호를 다시 한번 입력해 주세요." onkeyup="evManager.pwdValidation2(); evManager.btnDisabled();" onkeydown="evManager.pwdValidation2()" maxlength="20">                                             
								</div>
			
								<p class="validation" style="display: none; color:#FFF;" id="custPwdTxt2" btnChk="0">
									<span><i class="ico07"></i>이미 사용중인 비밀번호입니다.</span>
								</p>
							</div>
									
							<div class="submitArea">
								<label for="phone01"><span>휴대전화 *</span></label>
								<div class="submit">
									<input type="hidden" name="phone" id="phone">
									<input type="hidden" name="mobNo" id="mobNo">
									<select class="type01 w28per"  title="휴대전화 선택" id="phone01" name="phone01">
										<option <c:if test="${phone01 == '010'}">selected="selected"</c:if>	value="010">010</option>
										<option <c:if test="${phone01 == '011'}">selected="selected"</c:if> value="011">011</option>
										<option <c:if test="${phone01 == '016'}">selected="selected"</c:if> value="016">016</option>
										<option <c:if test="${phone01 == '017'}">selected="selected"</c:if> value="017">017</option>
										<option <c:if test="${phone01 == '018'}">selected="selected"</c:if> value="018">018</option>
										<option <c:if test="${phone01 == '019'}">selected="selected"</c:if> value="019">019</option>        
									</select> 
									
									<span class="divi"></span>
									<input type="text" name="phone02" class="type04 w25per" id="phone02" value="${phone02}" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);"><span class="divi"></span>
									<input type="text" name="phone03" class="type04 w25per" id="phone03" value="${phone03}" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
									
									<p class="validation" style="display: none" id="phoneTxt1">
										<span><i class="ico07"></i>이미 사용중인 휴대전화번호입니다.</span>
									</p>
								</div>
							</div>
	
							<div class="submitArea">
								<label for="employeeCd"><span>임직원코드 </span></label>
								<div class="submit">
									<input type="text" name="employeeCd" class="type02 w280" id="employeeCd" title="임직원코드 입력란" placeholder="임직원코드를 입력해 주세요." onkeyup="this.value=evManager.noKorean(this.value); evManager.btnDisabled();" maxlength="20"> 
									<input type="hidden" id="employeeCdChk" name="employeeCdChk" value="">	
								</div>
								<p class="validation" style="display: none; color:#FFF;" id="employeeCdTxt" btnChk="0">
									<span><i class="ico07"></i></span>
								</p>
							</div>
							
							<div class="submitArea">
								<label for="recNum"><span>추천인코드 </span></label>
								<div class="submit">
									<input type="text" name="recNum" class="type02 w280" id="recNum" title="추천인코드 입력란" placeholder="추천인코드를 입력해 주세요." onkeyup="this.value=evManager.noKorean(this.value); evManager.btnDisabled();" maxlength="20"> 
									<input type="hidden" id="recNumChk" name="recNumChk" value="">
                                    <input type="hidden" id="recCustNo" name="recCustNo" value="" >	
								</div>
								<p class="validation" style="display: none; color:#FFF;" id="recNumTxt" btnChk="0">
									<span><i class="ico07"></i></span>
								</p>
							</div>
					    </div>
					</form>
				</div>
				<!--memberWrap-->
			</div>
            
            <div class="btnArea type02">
                <button type="button" class="type01 w100per" id="btnJoin" disabled="disabled">가입하기<i class="ico01"></i></button>
            </div>

			<!-- <div class="allBgWrap">
				<div class="member-ani-bg bg04"></div>
			</div> -->            
		</div>
        <!--subContentsWrap-->


<script type="text/javascript">
	var evManager = {
		//사업자 번호
		businessNo : "${businessNo}"
		,
		init : function(){
		}
		,
		//가입하기 버튼 활성화 - dialbed
		btnDisabled : function() {
			isBtnDisabled = true;
			
			//ID 중복 체크
			if($('#idOverLapChk').val() == "0" && $("#custIdTxt1").attr("btnChk") == "0") {
				isBtnDisabled = false;
			}
			
			//비밀 번호 체크
			if($('#custPwdTxt1').attr("btnChk") == "0" || $('#custPwdTxt2').attr("btnChk") == "0") {
				isBtnDisabled = false;
			}
			
			//전화번호 두번째 자리 체크 3자리 이상
			if($("#phone02").val().length < 3) {
				isBtnDisabled = false;
			}
			
			//전화번호 두번째 자리 체크 4자리 이상
			if($("#phone03").val().length < 4) {
				isBtnDisabled = false;
			}
			
			// 임직원 코드  check 엄수현 매니저 추가
			if(!ValidUtil.isEmpty($("#employeeCd").val()) && Number($("#employeeCdTxt").val()) == 0) {
				isBtnDisabled = false;
			}
			
			// 추천인 코드  check 엄수현 매니저 추가
			if(!ValidUtil.isEmpty($("#recNum").val()) && Number($("#recNumTxt").val()) == 0) {
				isBtnDisabled = false;
			}
			
			
			if(isBtnDisabled) {
				$("#btnJoin").removeClass();
				$("#btnJoin").addClass("type01 w100per");
				$("#btnJoin").removeAttr("disabled");
			} else {
				$("#btnJoin").removeClass();
				$("#btnJoin").addClass("type02 w100per");
				$("#btnJoin").prop("disabled", true);
			}
		}
		, 
		//한글 입력 방지 
		noKorean : function(str) {
			return str.replace(/\s|[^a-zA-Z0-9]/gi, "");
		}
		,
		//id keyUpEvent
		idValidation : function(){
			$("#custId").val($("#custId").val().toLowerCase());
			
			var custId = $("#custId").val();
			
			// 아이디체크 번호('',0,1)
			var idOverLapChk = $("#idOverLapChk").val();
			$("#custIdTxt2").attr("style" , "color:#FFF");
			
			if( custId.length < 4  ){
				$('#custIdTxt2').html('<i class="ico07" ></i>영문, 숫자를 포함하여 4 ~ 12자를 입력해 주세요.');
			}
			else if( /^[0-9+]*$/.test(custId) ){
				$('#custIdTxt2').html('<i class="ico07" ></i>영문도 포함하여 입력해주세요.');
			}
			else if( /^[a-zA-Z+]*$/.test(custId) ){
				$('#custIdTxt2').html('<i class="ico07" ></i>숫자도 포함하여 입력해주세요.');
			}
			else if( !/^[a-zA-Z0-9+]*$/.test(custId) ){
				$('#custIdTxt2').html('<i class="ico07" ></i>영문, 숫자만 입력해주세요.');
			}
			else{
				$('#custIdTxt2').html('<i class="ico07" ></i>중복확인을 해주세요.');
			}			
			$('#custIdTxt1').show();
		}
		,
		//pass keyUpEvent
		pwdValidation : function(){
			$('#custPwdTxt1').attr("btnChk" , "0");
			$("#custPwdTxt1").attr("style" , "color:#FFF");
			
			// 비밀번호
			var custPwd = $("#custPwd").val();

			if(!ValidUtil.pwCheckNumAlpha(custPwd) && !ValidUtil.pwCheckNumFnAlpha(custPwd)){
				$('#custPwdTxt1').html('<span><i class="ico07"></i>영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자를 입력해 주세요.</span>');
			}
			else{
				$('#custPwdTxt1').html('<span><i class="ico07"></i>확인 되었습니다.</span>');
				$('#custPwdTxt1').attr("btnChk" , "1");
				$("#custPwdTxt1").attr("style" , "color:#FFFF66");
			}
			$('#custPwdTxt1').show();
		}
		,
		//pass(비밀번호 확인) keyUpEvent
		pwdValidation2 : function(){
			$('#custPwdTxt2').attr("btnChk" , "0");
			$("#custPwdTxt2").attr("style" , "color:#FFF");
			// 비밀번호
			var custPwd = $("#custPwd").val();
			var custPwd2 = $("#custPwd02").val();
			
			if($('#custPwdTxt1').attr("btnChk") == "0") {
				alert('비밀번호를 다시 입력해주세요.');
				$('#custPwd').focus();
				if(!ValidUtil.isEmpty($("#custPwd02").val())) {
					$("#custPwd02").val("");
				}
			}
			
			if(custPwd == ""){
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
			}
			else if(custPwd !="" && custPwd != custPwd2){
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
			}
			else{
				$('#custPwdTxt2').attr("btnChk" , "1");
				$('#custPwdTxt2').html('<span><i class="ico07"></i>확인 되었습니다.</span>');
				$("#custPwdTxt2").attr("style" , "color:#FFFF66");
			}
			$('#custPwdTxt2').show();
		
		}
		, 
		//가입 버튼 클릭 시 입력 항목 유효성 체크
		validation : function() {
			if($('#custId').val() == ''){
				alert("아이디를 확인해주세요.");
				$('#custId').focus();
				return false;
			}	
			if( $('#custPwd').val() == '' || $('#custPwd02').val() == '' ){ 
				alert('비밀번호를 확인해주세요.');
				$('#custPwd').focus();
				return false;
			}
			if(($('#phone01').val()+""+$('#phone02').val()+$('#phone03').val()) == '' ){
				alert('휴대폰번호를 확인해주세요.'); 
				$('#phone01').focus();
				return false;
			}
			
			if (!ValidUtil.isEmpty($('#employeeCd').val().trim()) && $("#employeeCdTxt").val() == "0") {
				console.log("inininin");
				$('#employeeCdChk').val("N");
			}
			
			return true;
		}
		,
		//아이디 중복체크
		idOverLapCheck : function () {
			var custId = $("#custId").val();
			if (custId == "") {                     
				alert("아이디를 입력해주십시오.");
				return ;                                           
			}
			if( (/^[a-zA-Z0-9]{4,12}$/).test( custId ) == false ){  
				alert("아이디는 반드시 영문,숫자의 조합으로 4-12자리내에서 입력하십시오.");
				return ;
			}
			
			if( custId.replace(/[a-z]/ig,'').length == 0 || custId.replace(/[0-9]/ig,'').length == 0  ){  
				alert("아이디는 반드시 영어와 숫자의 조합으로 정해주세요");
				return ;
			}

			if (custId != "") {
				//common ajax call
				var pUrl = "/member/IdOverLapCheck";
				var pSendData = { custId : $("#custId").val() };
				pSendData = JSON.stringify(pSendData);

				$.ajax({
					url: pUrl,
					type: "POST",
					cache:false,
					data: pSendData,
					contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
					success: function(data) {
						if(data.overLapYn == "Y") {
							$("#idOverLapChk").val("0");
							$("#custIdTxt1").attr("btnChk" , "0");
							$('#custIdTxt2').html('<i class="ico07" ></i>이미 사용중인 아이디 입니다.');
							$("#custIdTxt2").attr("style" , "color:#FFF");
							return;
						}else{
							$("#idOverLapChk").val("1");
							$("#custIdTxt1").attr("btnChk" , "1");
							$('#custIdTxt2').html('<i class="ico07" ></i>사용 가능한 아이디 입니다.');
							$("#custIdTxt2").attr("style" , "color:#FFFF66");
						}

						evManager.btnDisabled();
					},
					error: function (request, status, error) {
						console.log('error callback : ' + error);
					}
				});
			}
		}
		,
		//임직원 여부 조회
		employeeCdCheck : function () {
			/* if($("#employeeCd").val() == ""){
				alert("임직원코드를 입력하세요.");
				return false;
			} */

			if(!ValidUtil.isEmpty($("#employeeCd").val().trim())) {
				//common ajax call
				var pUrl = "/member/employeeCdCheck";
				var pSendData = {employeeCd: $("#employeeCd").val().trim()};
				pSendData = JSON.stringify(pSendData);

				$.ajax({
					url: pUrl,
					type: "POST",
					cache: false,
					async: false,
					data: pSendData,
					contentType: "application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
					success: function (data) {
						if (data.employeeCdYn == "Y") {
							$("#employeeCdTxt").val("1");
							$('#employeeCdTxt').html('사용 가능한 코드 입니다.');
							$('#employeeCdTxt').attr('style','color:#FFFF66;');
						} else {
							$("#employeeCdTxt").val("0");
							$('#employeeCdTxt').html('사용할 수 없는 코드 입니다.');
							$('#employeeCdTxt').attr('style','color:#FFF;');
						}

						$('#employeeCdTxt').show();
						evManager.btnDisabled();
					},
					error: function (request, status, error) {
						console.log('error callback : ' + error);
					}
				});
			}else{
				$('#employeeCdTxt').hide();
			}
		},
		//추천인코드 인증 엄수현 매니저 추가 
		recNumCheck : function () {

			/* mobile은 버튼으로 진행 되는게 아니고 onkeyup 으로 진행 되기 때문에 필요 없다. 
			if($("#recNum").val() == ""){
				alert("추천인코드를 입력하세요.");
				return false;
			}
			*/
			
			if(!ValidUtil.isEmpty($("#recNum").val().trim())) {
			
			//common ajax call
			var pUrl = "/member/recNumCheck";
			var pSendData = { recNum : $("#recNum").val().trim()};
				pSendData = JSON.stringify(pSendData);
			
			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: pSendData,
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data.recNumYn == "Y") {
			    		$("#recNumTxt").val("1");
				    	$('#recNumTxt').html('<i class="ico07" ></i>인증되었습니다.');
				    	$("#recCustNo").val(data.recCustNo); // 추천인 고객번호
			    	} else {
			    		$("#recNum").val("");
			    		$("#recNumTxt").val("0");
			    		$('#recNumTxt').html('<i class="ico07" ></i>지금은 추천인 이벤트 기간이 아닙니다.');
// 			    		$('#recNumTxt').html('<i class="ico07" ></i>존재하지 않는 추천인 코드 입니다.');
			    	}
			    	
			    	$('#recNumTxt').show();
			    	evManager.btnDisabled();
			    },
			    error: function (request, status, error) {
					console.log('error callback : ' + error);
				}
			});
			
		}else{
			
		     //	$('#recNumTxt').hide();
			//  추천인코드의 값이 없다면 무조건 초기화.
			   $('#recNum').val('');
			   $('#recCustNo').val('');
			   $('#recNumTxt').val('0');
	    	   $('#recNumTxt').html('');
			
		}
	}			
}

	$(document).ready(function() {
		var ciVal = $("input[name='ciVal']");
		console.log('ciVal : ' + ciVal);
		/* page background image Start */
		$('#bgFullImg').css('height', '100%');
		$('#bgFullImg').append('<div class="member-ani-bg bg04"></div>');
		/* page background image End */
		
		//init
		evManager.init();
		
		// 약관 동의 버튼 area!! 
		$("#bntAuth").on("click" , function(){
			//유효성 체크
			if(!evManager.validation()){
				return;
			}
			
			//location.hre = "/member/"
		});
		// 약관 동의 버튼  area end!! 
		
		// 아이디 중복 확인 area!! 
		$("#custId").on("focusout" , function(){
			evManager.idOverLapCheck();
		});
		// 아이디 중복 확인   area end!!
		
		// 임직원  확인 area!! 
		$("#employeeCd").on("focusout" , function(){
			evManager.employeeCdCheck();
		});
		// 임직원  중복 확인   area end!!
		
		// 추천인  확인  엄수현 매니저 추가 !! 
		$("#recNum").on("focusout" , function(){
			evManager.recNumCheck();
		});
		
		// 가입하기 버튼 area!! 
		$("#btnJoin").on("click", function(){
			//모바일은 버튼이 아니라 keyup이라서 일단 이렇게 함. 더 나은 방법이 있다면 부탁합니다.
			if(!ValidUtil.isEmpty($('#employeeCd').val().trim())) {
				evManager.employeeCdCheck();
			}
			
			//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
	        //$("#btnJoin").prop("disabled", true);
			event.preventDefault();
			//alert("가입하기");


			//유효성 체크 
			if(!evManager.validation()){
				//$("#btnJoin").prop("disabled", false);
				ComUtil.unloading();
				return;
			}
			
			if($('#employeeCdChk').val() == "N") {
				ComUtil.confirm("올바른 임직원 코드가 아니므로 일반회원으로 가입이 진행됩니다.\n임직원코드는 일반회원 가입 후에도 입력이 가능합니다.\n진행하시겠습니까?", '' 
        		,function(){//가입하기
					ComUtil.loading();
					
        			//폼객체를 불러와서
			        var form = $('form')[0];
			        //FormData parameter에 담아줌
			        $("input[name='custNm']").val(encodeURIComponent($("input[name='custNm']").val()));
			        var param = new FormData(form);
			        //var param = $("#frm").serialize();
			        
			        $("#phone").val($("#phone01").val()+"-"+$("#phone02").val()+"-"+$("#phone03").val());
			        $("#mobNo").val($("#phone01").val()+"-"+$("#phone02").val()+"-"+$("#phone03").val());
			        
		 	        $.ajax({
		 	            type: "POST",
		 	            url: "/member/insertCust",
		 	            data: $("#frm").serialize(),
		 	            cache: false,
		 	            processData: false,
		 	            success: function (data) {
		 	             	console.log("insertCust return::::");
		 	             	console.log(data);
		 	             	if(data.rtnCode < 0) {
		 	             		alert(data.rtnMsg);
		 	             	} else {
		 		            	var frm = document.frm;
		 		        		frm.action = "/member/custInfoComp";
		 		        		frm.submit();
		 	             	} 	                
		 	            },
		 	            error: function (e) {
		 	                console.log("ERROR : ", e);
		 	                //alert("fail");
		 	                ComUtil.alert("회원가입에 실패했습니다. <br> 계속될 경우 관리자에게 문의 바랍니다.");
		 	            },
		 	            complete: function() {
		 	            	$("input[name='custNm']").val(decodeURIComponent($("input[name='custNm']").val()));
		 	            	//$("#btnJoin").prop("disabled", false);
		 	            	ComUtil.unloading();
		 	            }
		 	        });
        		}
        		,function(){//취소
        			ComUtil.unloading();
        		}, "가입하기", "취소");
			} else {
				ComUtil.loading();
				
				//폼객체를 불러와서
		        var form = $('form')[0];
		        //FormData parameter에 담아줌
		        $("input[name='custNm']").val(encodeURIComponent($("input[name='custNm']").val()));
		        var param = new FormData(form);
		        //var param = $("#frm").serialize();
		        
		        var frgnCd = $('[name="frgnCd"]').val();
				if($.trim(frgnCd) == ""){
					$('[name="frgnCd"]').val("0");
				}
				
		        $("#phone").val($("#phone01").val()+"-"+$("#phone02").val()+"-"+$("#phone03").val());
		        $("#mobNo").val($("#phone01").val()+"-"+$("#phone02").val()+"-"+$("#phone03").val());
	 	        $.ajax({
	 	            type: "POST",
	 	            url: "/member/insertCust",
	 	            data: $("#frm").serialize(),
	 	            cache: false,
	 	            processData: false,
	 	            success: function (data) {
	 	             	console.log("insertCust return::::");
	 	             	console.log(data);
	 	             	if(data.rtnCode < 0) {
	 	             		alert(data.rtnMsg);
	 	             	} else {
	 	             		$("input[name='custNm']").val(decodeURIComponent($("input[name='custNm']").val()));
	 		            	var frm = document.frm;
	 		        		frm.action = "/member/custInfoComp";
	 		        		frm.submit();
	 	             	} 	                
	 	            },
	 	            error: function (e) {
	 	                console.log("ERROR : ", e);
	 	                //alert("fail");
	 	                ComUtil.alert("회원가입에 실패했습니다. <br> 계속될 경우 관리자에게 문의 바랍니다.");
	 	            },
	 	            complete: function() {
	 	            	$("input[name='custNm']").val(decodeURIComponent($("input[name='custNm']").val()));
	 	            	//$("#btnJoin").prop("disabled", false);
	 	            	ComUtil.unloading();
	 	            }
	 	        });
			}
		});
		// 가입하기   area end!!
	});	

</script>

