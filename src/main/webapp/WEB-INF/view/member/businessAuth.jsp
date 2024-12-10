<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


		<!--subContentsWrap-->
        <div class="subContentsWrap addBg03">
            <div class="stepTitle buStep02">
				<ul>
					<li class="step01 borLine">약관동의 <span class="stepIco"></span></li>
					<li class="step02 active">사업자인증 <span class="stepIco"></span></li>
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
						<div class="business">
							<div class="submitArea type03">
								<label for="auth01"><span>사업자등록번호</span></label>
								<form name="frm" id="frm" method="post">
									<input type="hidden" id="receptionAll" name="receptionAll" value="${receptionAll}"/>
									<input type="hidden" id="receptionSms" name="receptionSms" value="${receptionSms}"/>
									<input type="hidden" id="receptionPhone" name="receptionPhone" value="${receptionPhone}"/>
									<input type="hidden" id="receptionEmail" name="receptionEmail" value="${receptionEmail}"/>
									<input type="hidden" id="receptionAdress" name="receptionAdress" value="${receptionAdress}"/>
									<input type="hidden" id="receptionKakao" name="receptionKakao" value="${receptionKakao}"/>
									
									<!-- 마케팅동의 관련 데이터 -->
									<input type="hidden" id="receptionMarketingFirst" name="receptionMarketingFirst" value="${receptionMarketingFirst}"/>
									<input type="hidden" id="receptionMarketingSecond" name="receptionMarketingSecond" value="${receptionMarketingSecond}"/>
									
									<input type="hidden" id="bizNo" name="bizNo" />
									<input type="hidden" id="comDivCd" name="comDivCd" />
									
									<div class="submit layout-c">
										<div class="layout-r">
											<input type="text" name="auth01" class="type02 w25per" id="auth01" maxlength="3" onkeyup="this.value=evManager.onlyNum(this.value); evManager.onKeyup();" onfocusout="this.value=evManager.onlyNum(this.value);">
											<span class="divi"></span>
											<input type="text" name="auth02" class="type02 w25per" id="auth02" maxlength="2" onkeyup="this.value=evManager.onlyNum(this.value); evManager.onKeyup();" onfocusout="this.value=evManager.onlyNum(this.value);">
											<span class="divi"></span>
											<input type="text" name="auth03" class="type02 w50per" id="auth03" maxlength="5" onkeyup="this.value=evManager.onlyNum(this.value); evManager.onKeyup();" onfocusout="this.value=evManager.onlyNum(this.value);">
										</div>
										<p class="validation type02" id="checkTextBox" style="display: none">
											<span id="checkText" ><i class="ico07"></i>이미 가입된 사업자등록번호입니다. 확인 후 다시 인증해 주세요</span>
										</p>
									</div>
								</form>
							</div>

						</div>
					</div>
					
					<div class="descInfo type02">
						<ul>
							<li><span>사업자회원 가입 시 아래 사본을 등록해 주시면 확인 후 승인 </span></li>
							<li><span class="type02">ㆍ사업자등록증 사본</span></li>
							<li><span class="type02">ㆍ법인 통장 사본 or 개인사업자 통장 사본</span></li>
							<li><span class="type02 mb-m">ㆍ법인 차량등록증 사본 or 개인사업자 차량등록증 사본</span></li>
							<!-- 20210208 구광태선임요청 사업자 승인여부와 관계없이 o2o 주문이 가능하도록 변경 후 문구 삭제 -->
<!-- 							<li><span>회원 승인 전 까지는 상품 주문하기/나의정보 기능은 이용할 수 없으며 그 외에 기능은 이용 가능합니다.</span></li> -->
							<li><span>수집된 사업자등록번호는 회원가입 확인 목적으로 이용되며, 다른 용도로 사용되지 않습니다.</span></li>
						</ul>  
					</div>
				</div>
				<!--memberWrap-->
			</div>

            <div class="btnArea type02">
                <button type="button" class="type01 w100per" id="bntAuth">사업자번호 인증 <i class="ico01"></i></button><!--disabled-->
            </div>  
            
			<!-- <div class="allBgWrap">
				<div class="member-ani-bg bg03"></div>
			</div> -->
		</div>
        <!--subContentsWrap-->
        
<script type="text/javascript">
	var evManager = {
		init : function(){
			//약관 동의 하기 버튼 비 활성화 
			$("#bntAuth").attr("disabled" , true);
			
			
			//from submit 제한 - 두번 호출 되는 문제
			$('form button').on("click",function(e){ 
				 e.preventDefault(); 
			}); 
		}
		,
		//유효성 체크
		validation : function(){
			//ValidUtil.replaceChar > 문자열 치화(여기선 공백제거)
			var auth01 = ValidUtil.replaceChar($("#auth01").val(), " ","");
			var auth02 = ValidUtil.replaceChar($("#auth02").val(), " ","");
			var auth03 = ValidUtil.replaceChar($("#auth03").val(), " ","");
			
			//숫자 여부 체크	
			if(!(ValidUtil.number(auth01) && ValidUtil.number(auth02) && ValidUtil.number(auth03) )){
				alert("숫자만 입력 해 주세요.");
				return false;
			}
	
			var bizID =auth01+auth02+auth03;
			var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
			if(auth01.length != 3 || auth02.length != 2 || auth03.length !=5){
				 return false;
			}
			else{
				var tmpBizID, i, chkSum=0, c2, remander; 
	
			     bizID = bizID.replace(/-/gi,''); 
			     for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i); 
			     c2 = "0" + (checkID[8] * bizID.charAt(8)); 
			     c2 = c2.substring(c2.length - 2, c2.length); 
			     chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
			     remander = (10 - (chkSum % 10)) % 10 ;
			     
				if(Math.floor(bizID.charAt(9)) == remander){
					//$("#frm").action = "/member/infoInput";
					//$("#frm").submit();
				}  
				else if(!(auth01.length == 3 && auth02.length == 2 && auth03.length ==5)){
					$("#checkText").text("잘못된 사업자등록번호입니다. 다시 확인해주십시오.");
					$("#checkTextBox").show();
					alert("잘못된 사업자등록번호입니다. 다시 확인해주십시오");
				}
				else{
					$('#checkText').text('사업자번호를 다시 입력해주세요.(xxx-xx-xxxxx)');
					alert("사업자번호를 다시 입력해주세요.(xxx-xx-xxxxx)")
					return false; 
				}
			}
			
			return true;
		}
		,
		//숫자만 입력
		onlyNum : function(str){
			return str.replace(/[^0-9]/gi, "");	
		}
		,
		//사업자 인증 버튼 활성화
		onKeyup : function() {
			//ValidUtil.replaceChar > 문자열 치화(여기선 공백제거)
			var auth01 = ValidUtil.replaceChar($("#auth01").val(), " ","");
			var auth02 = ValidUtil.replaceChar($("#auth02").val(), " ","");
			var auth03 = ValidUtil.replaceChar($("#auth03").val(), " ","");
			
			if(auth01.length == 3 && auth02.length == 2 && auth03.length == 5){
				$("#bntAuth").attr("disabled" , false);
				$("#bntAuth").removeClass();
				$("#bntAuth").addClass("type01 w100per");
			} else {
				$("#bntAuth").attr("disabled" , true);
				$("#bntAuth").removeClass();
				$("#bntAuth").addClass("type01 w100per");
			}
		}
		,
		selectBusinessNo : function() {
			//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
	        event.preventDefault();
			
			var auth01 = ValidUtil.replaceChar($("#auth01").val(), " ","");
			var auth02 = ValidUtil.replaceChar($("#auth02").val(), " ","");
			var auth03 = ValidUtil.replaceChar($("#auth03").val(), " ","");
			var bizNo = auth01+ "-" + auth02 + "-" + auth03;
			
			//common ajax call
			var pUrl = "/member/selectBizNoYno";
			var pSendData = { bizNo : bizNo };
				pSendData = JSON.stringify(pSendData);
			var pReqId = "";
			
			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: pSendData,
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data.bizNoYn == "Y") {
			    		alert("이미 존재하는 사업자등록번호입니다.");
			    		return;
			    	}
			    	
			    	$("#bizNo").val(bizNo);
			    	$("#frm").attr("action" , "/member/businessInput").submit();
			    },
			    error: function (e) {
					console.log(e);
				}
			});

			
			//var sendMap = new Map();	
			//sendMap.put("pSendData", pSendData);
			//cfnSendRequest(pUrl, sendMap, pReqId);
			
			// common ajax call	
		}
		,
		getComDivCd : function() {
			
			var auth02 = ValidUtil.replaceChar($("#auth02").val(), " ","");
			var comDivCd = "1"; //개인사업자
			if(auth02 >= "81" && auth02 <= "88"){
				comDivCd = "2"; //법인사업자
			}
			return comDivCd;
		}
	}

	
	//ajax callback success
	function cfnRequestSuccessCallback(pReqId, result) {
		alert("aa")
		console.log(result)	
	}
	
	//ajax callback eoor
	function cfnRequestErrorCallback(pReqId, status , e) {
		alert("bb")
		console.log(status);
		console.log(e);
	}

	$(document).ready(function() {

		/* page background image Start */
		$('#bgFullImg').css('height', '100%');
		$('#bgFullImg').append('<div class="member-ani-bg bg03"></div>');
		/* page background image End */
		
		//init
		evManager.init();
		
		// 사업자 인증 버튼 area!! 
		$("#bntAuth").unbind('click').on("click" , function(e){
			//유효성 체크
			if(!evManager.validation()){
				return;
			}
			
			//사업자 번호 조회
			evManager.selectBusinessNo();
			
			//사업자구분(개인/법인)
			var comDivCd = evManager.getComDivCd();
			document.getElementById("comDivCd").value = comDivCd;
		});
		// 업자 인증 버튼  area end!! 
		
	});	

</script>
