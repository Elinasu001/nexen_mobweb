<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<!-- subContentsWrap -->
		<div class="subContentsWrap">
            <div class="stepTitle">
				<ul>
					<li class="step01 active">약관동의 <span class="stepIco"></span></li>
					<li class="step02">실명인증 <span class="stepIco"></span></li>
					<li class="step03">회원정보</li>
				</ul>
            </div>  
            
			<div class="subContents">
				<div class="titleArea type03">
					<h2 class="type01">꼭! <span>필</span><span>요</span><span>해</span><span>요.</span></h2>          
				</div>
				
				
				 
				<form id="agree_Form" name="agree_Form" method="post">
					<input type="hidden" id="receptionAll"    name="receptionAll"    value="N" />
					<input type="hidden" id="receptionSms"    name="receptionSms"    value="N" />
					<input type="hidden" id="receptionPhone"  name="receptionPhone"  value="N" />
					<input type="hidden" id="receptionEmail"  name="receptionEmail"  value="N" />
					<input type="hidden" id="receptionAdress" name="receptionAdress" value="N" />
					<input type="hidden" id="receptionKakao" name="receptionKakao" value="N" />
					
					<!-- 마케팅동의 관련 데이터 -->
					<input type="hidden" id="receptionMarketingFirst" name="receptionMarketingFirst" value="N" />
					<input type="hidden" id="receptionMarketingSecond" name="receptionMarketingSecond" value="N" />
					
					<input type="hidden" name="snsGbn" id="snsGbn" value="${snsGbn}">
					<input type="hidden" name="snsid" id="snsid" value="${snsid}">
					<input type="hidden" name="viewGbn" id="viewGbn" value="${viewGbn}">
					<input type="hidden" name="loginStatus" id="loginStatus" value="${loginStatus}">
					<!--memberWrap-->
					<div class="memberBoxWrap">
						<div class="termsAgree">
							<input type="checkbox" name="agree" id="allChk" value="0" class="type02 allAgree"><label for="allChk" class="fb"><span></span>모든 약관을 확인하고 전체 동의합니다.</label>
							
							<div class="sAgree">
								<ul>
									<li class="layout-r">
										<input type="checkbox" id="agree01" name="agree" gbn="necessary" value="1" class="type02 agree01"><label for="agree01"><span></span>[필수] 서비스 이용 약관</label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-termOfService');" class="go-view">[ 상세보기 ]</a>
									</li>
									<li class="layout-r">
										<input type="checkbox" id="agree02" name="agree" gbn="necessary" value="2" class="type02 agree02"><label for="agree02"><span></span>[필수] 개인정보 수집 및 이용에 대한 안내</label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-privacyPolicy');" class="go-view">[ 상세보기 ]</a>
									</li>
									<li class="layout-r">
										<input type="checkbox" id="agree03" name="agree" gbn="necessary" value="3" class="type02 agree03"><label for="agree03"><span></span>[필수] 개인정보 제공 동의 </label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-privacyPolicyAgree');" class="go-view">[ 상세보기 ]</a>
									</li>
									<li class="layout-r">
										<input type="checkbox" id="agree04" name="agree" gbn="necessary" value="4" class="type02 agree03"><label for="agree04"><span></span>[필수] 개인정보 조회 동의 </label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-perInfoSearchAgree');" class="go-view">[ 상세보기 ]</a>
									</li>
									<li class="layout-r">
										<input type="checkbox" id="agree05" name="agree" gbn="necessary" value="5" class="type02 agree03"><label for="agree05"><span></span>[필수] 개인정보 위탁 동의  </label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-consignment');" class="go-view">[ 상세보기 ]</a>
									</li>
									<li class="layout-r">
										<input type="checkbox" id="agree07" name="agree" gbn="notNecessary" value="7" class="type02 agree03"><label for="agree07"><span></span>[선택] 마케팅 활용 목적의 개인 정보 수집 및 이용 동의 </label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-marketingAgree');" class="go-view">[ 상세보기 ]</a>
									</li>
									<li class="layout-r">
										<input type="checkbox" id="maketingAgree" name="agree" gbn="notNecessary" value="6" class="type02 agree03"><label for="maketingAgree"><span></span>[선택] 영리목적 광고성 정보 수신 동의 </label>
										<a href="#;" onClick="javascript:policyLayPopOpen('modal-advertisementAgree');" class="go-view">[ 상세보기 ]</a>
									</li>
									<!-- <li class="layout-r">
										<input type="checkbox" id="maketingAgree" name="agree" gbn="notNecessary" value="6" class="type02 agree03"><label for="maketingAgree"><span></span>[선택] 광고/정보 수신 및 마케팅 활용에 대한 안내</label>
									</li> -->
								</ul>
							</div>
							
							<div class="ssAgree">
								<div class="layout-r inline-m">
									<input type="checkbox" id="maketingAgree01" name="maketingAgree" gbn="notNecessary" value="61" class="type02"><label for="maketingAgree01"><span></span>SMS</label>
									<input type="checkbox" id="maketingAgree02" name="maketingAgree" gbn="notNecessary" value="62" class="type02"><label for="maketingAgree02"><span></span>전화</label>
									<input type="checkbox" id="maketingAgree03" name="maketingAgree" gbn="notNecessary" value="63" class="type02"><label for="maketingAgree03"><span></span>이메일</label>
									<input type="checkbox" id="maketingAgree05" name="maketingAgree" gbn="notNecessary" value="64" class="type02"><label for="maketingAgree05"><span></span>카카오알림톡</label>
								</div>
	                            <!-- <div class="layout-r inline-m">
									<input type="checkbox" id="maketingAgree04" name="maketingAgree" gbn="notNecessary" value="64" class="type02"><label for="maketingAgree04"><span></span>주소</label>
								</div> -->
								<!-- <ul class="mt-m">
									<li><small class="type02">ㆍ당사는 수집된 귀하의 개인정보를 귀하의 동의가 있을 경우 다음과 같이 마케팅·홍보를 위하여 이용할 수 있습니다.</small></li>
									<li><small>ㆍ동의하지 않을 경우에도 계약의 체결 및 유지, 관리에는 영향이 없으나, 할인 및 이벤트 정보 안내 서비스가 제한될 수 있습니다.</small></li>
									<li><small>ㆍ보유기간 : 회원 탈퇴시까지</small></li>
								</ul> -->
							</div>
						</div> 					
					</div>
					<!--memberWrap-->
				</form>
			</div>
            
            <div class="btnArea type02">
                <button type="button" class="type01 w100per" id="bntAgree" disabled="disabled">약관에 동의합니다. <i class="ico01"></i></button><!--disabled-->
            </div>
            
            <div class="allBgWrap">
                <div class="member-ani-bg bg02"></div>
            </div>
		</div>
		<!-- subContentsWrap -->
		
		<!-- layerPopup // -->
		<div class="fullPopup  md-modal-2 md-effect-1" id="modal-1"> <!-- termsPopup md-show -->
	        <div class="popContents">
	            <header>
				<h2> 
	                이용약관
					<a href="#" class="layPopClose md-close"></a>
				</h2>			
			</header>
	
	            <!-- 약관 -->
	            <div class="termsBox">
	                    <div class="terms">
	                       <h3>제1장 총직</h3>
	                       <h4>제1조(목적)</h4>
	
	                       <ol class="num">
	                         <li>이 약관은 전기통신사업법령 및 정보통신망이용촉진등에 관한 법령에 의하여 학교체육진흥회(이하 "진흥회"이라 한다)가 제공하는 홈페이지 서비스(이하 "서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.</li>
	                       </ol>
	                 </div>
	
	                    <div class="terms">
	                       <h3>제2조(약관의 공지 및 준용)</h3>
	
	                       <ol class="num">
	                          <li>이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 홈페이지 사용자(이하 사용자)에게 공지함으로써 효력을 발생합니다.</li>
	                          <li>진흥회는 이 약관을 임의로 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.</li>
	                       </ol>
	                   </div>
	
	                   <div class="terms">
	                       <h3>제3조(약관 외 준칙)</h3>
	
	                       <ol class="num">
	                          <li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.</li>
	                       </ol>
	                   </div>
	
	                    <div class="terms">
	                       <h3>제3조(약관 외 준칙)</h3>
	
	                       <ol class="num">
	                          <li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.</li>
	                       </ol>
	                   </div>
	
	                    <div class="terms">
	                       <h3>제3조(약관 외 준칙)</h3>
	
	                       <ol class="num">
	                          <li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.</li>
	                       </ol>
	                   </div>
	
	                    <div class="terms">
	                       <h3>제3조(약관 외 준칙)</h3>
	
	                       <ol class="num">
	                          <li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.</li>
	                       </ol>
	                   </div>
	
	                    <div class="terms">
	                       <h3>제3조(약관 외 준칙)</h3>
	
	                       <ol class="num">
	                          <li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.</li>
	                       </ol>
	                   </div>
	             </div>
	        </div>
	
	        <!-- <div class="btnArea type02">
	            <button type="button" class="type01 w100per">약관에 동의합니다. <i class="ico01"></i></button>disabled
	        </div> -->
	    </div>
	    <!-- 약관 -->
	    
		<!-- <div class="md-overlay"></div> -->
		<!-- layerPopup // -->


<script type="text/javascript" src="/js/lib/classie.js"></script>
<script type="text/javascript" src="/js/lib/modalEffects.js"></script>
	
<script type="text/javascript">
	var evManager = {
		viewGbn : "${viewGbn}"	//이전 화면 구분 > s:sns , m : 개인 , b : 사업 
		,
		isChk : false	//필수 체크 박스 선택 여부
		,
		init : function(){
			//약관 동의 하기 버튼 비 활성화 
			$("#bntAgree").attr("disabled" , true);
		}
		,
		//유효성 체크
		validation : function(){
			if(!evManager.isChk) {
				return false;
			}
			return true;
		}
		, 
		//체크박스 클릭 이벤트
		chkClick : function(thisObj){
			//전체 체크 박스
			if(thisObj.attr("id") == "allChk") {
				if(thisObj.is(":checked")) {
					for(var i=1; i<6; i++) {
						$("#agree0" + i).prop("checked" , true);				//전체 체크박스
					}
					//$("input[name='agree']").prop("checked" , true);
					//$("input[name='maketingAgree']").prop("checked" , true);		//마케팅 체크박스
					//$("input[name='chk_marketing_agree']").prop("checked" , true);	//마케팅 동의 여부(선택) 체크박스
					
					//$("input[name^='reception']").val("Y");	//마케팅 체크박스
					//$("input[name^='receptionMarketing']").val("Y");	//마케팅 동의 여부(선택) 체크박스
					
					$("#bntAgree").attr("disabled" , false);					//약관 동의 버튼
					evManager.isChk = true;										//필수 항목 체크
				} else {
					for(var i=1; i<6; i++) {
						$("#agree0" + i).prop("checked" , false);				//전체 체크박스
					}
					//$("input[name='agree']").prop("checked" , false);
					//$("input[name='maketingAgree']").prop("checked" , false);
					//$("input[name='chk_marketing_agree']").prop("checked" , false);
					//$("input[name^='reception']").val("N");	//마케팅 체크박스
					//$("input[name^='receptionMarketing']").val("N");	//마케팅 동의 여부(선택) 체크박스
					$("#bntAgree").attr("disabled" , true);
					evManager.isChk = false;
				}	
			} 
			//일반 체크 박스 > 필수 항목 모두 체크 시 전체 선택 아니면 해제
			else {
				if(thisObj.attr("id") != "maketingAgree") {
					//10233006
					if(thisObj.attr("id") == "agree07") {
						policyLayPopOpen('modal-marketingAgree');
						
						if(thisObj.is(":checked")) {
							$("#agree07").prop("checked" , false);
						}else {
							$("#agree07").prop("checked" , true);
						}
						return;
					}
					//10233006
					evManager.isChk = true;
					$("input[name='agree']").each(function(){
						if($(this).attr("gbn") == "necessary") {
							if(!$(this).is(":checked")) {
								evManager.isChk = false;
							}
						}
					});
					if(evManager.isChk) {
						$("#allChk").prop("checked" , true);		//전체 체크박스
						$("#bntAgree").attr("disabled" , false);	//약관 동의 버튼
					} else {
						$("#allChk").prop("checked" , false);
						$("#bntAgree").attr("disabled" , true);
					}
				}
				//선택 - 마케팅 활용 동의
				else {
					if(thisObj.is(":checked")) {
						$("input[name='maketingAgree']").prop("checked" , true);	//마케팅 체크박스
						$('#receptionAll').val('Y');
						$('#receptionSms').val('Y');
						$('#receptionPhone').val('Y');
						$('#receptionEmail').val('Y');
						$('#receptionKakao').val('Y');
					} else {
						$("input[name='maketingAgree']").prop("checked" , false);
						$('#receptionAll').val('N');
						$('#receptionSms').val('N');
						$('#receptionPhone').val('N');
						$('#receptionEmail').val('N');
						$('#receptionKakao').val('N');
					}	
				}
			}	
		}
		,
		//선택 체크박스 - 마케팅 활요 동의
		maketingChkClick : function(thisObj){
			var ismaketingChk = true;
			var ismaketingChkAll = false;
			var id = thisObj.attr("id");
			
			if(thisObj.is(":checked")) {
				if(id == 'maketingAgree01'){$('#receptionSms').val('Y');}
				if(id == 'maketingAgree02'){$('#receptionPhone').val('Y');}
				if(id == 'maketingAgree03'){$('#receptionEmail').val('Y');}
				if(id == 'maketingAgree05'){$('#receptionKakao').val('Y');}					
			}else{					
				if(id == 'maketingAgree01'){$('#receptionSms').val('N');}
				if(id == 'maketingAgree02'){$('#receptionPhone').val('N');}
				if(id == 'maketingAgree03'){$('#receptionEmail').val('N');}
				if(id == 'maketingAgree05'){$('#receptionKakao').val('N');}
			}
						
			if($("#maketingAgree01").is(":checked")==true||
			   $("#maketingAgree02").is(":checked")==true||
			   $("#maketingAgree03").is(":checked")==true||
			   $("#maketingAgree05").is(":checked")==true){
					ismaketingChk = true;
			}
			if($("#maketingAgree01").is(":checked")==false&&
			   $("#maketingAgree02").is(":checked")==false&&
			   $("#maketingAgree03").is(":checked")==false&&
			   $("#maketingAgree05").is(":checked")==false){
					ismaketingChk = false;
			}
			if($("#maketingAgree01").is(":checked")==true&&
			   $("#maketingAgree02").is(":checked")==true&&
			   $("#maketingAgree03").is(":checked")==true&&
			   $("#maketingAgree05").is(":checked")==true){
					ismaketingChkAll = true;
			}
			
			if(ismaketingChk) {
				$("#maketingAgree").prop("checked" , true);		//전체 체크박스
			} else {
				$("#maketingAgree").prop("checked" , false);
			}
			
			if(ismaketingChkAll) {
				$('#receptionAll').val('Y');		//전체 체크박스
			}else {
				$('#receptionAll').val('N');		//전체 체크박스
			}
		}
		,
		//10233006
		//선택 체크박스 - 마케팅 활용 목적의 개인 정보 수집 및 이용 동의
		chkMarketingAgreeClick : function(thisObj){
			var ischkMarketingAgree = true;
			if(($('#chk_marketing_agree_first').is(":checked") && $('#chk_marketing_agree_second').is(":checked"))||
					($('#chk_marketing_agree_first').is(":checked") || $('#chk_marketing_agree_second').is(":checked"))) {
				if($('#chk_marketing_agree_first').is(":checked")) {
					$('#receptionMarketingFirst').val('Y');
				}
				if($('#chk_marketing_agree_second').is(":checked")) {
					$('#receptionMarketingSecond').val('Y');
				}
				if(!$('#chk_marketing_agree_first').is(":checked")) {
					$('#receptionMarketingFirst').val('N');
				}
				if(!$('#chk_marketing_agree_second').is(":checked")) {
					$('#receptionMarketingSecond').val('N');
				}
				ischkMarketingAgree = true;
			}
			else {
				ischkMarketingAgree = false;
			}
			
			if(ischkMarketingAgree) {
				$('#agree07').prop("checked", true);
			}else {
				$('#agree07').prop("checked", false);
			}
		}
	}
	
	$(document).ready(function() {
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
		$('#bgFullImg').append('<div class="member-ani-bg bg02"></div>');
		
		//init
		evManager.init();
		
		var viewGbn = "${viewGbn}";

		if(viewGbn =='s'){
			alert("해당 SNS 계정이 확인되었습니다. 약관동의 및 실명인증을 거치시면 연동이 완료됩니다.");
		}
		
		
		// 약관 동의 버튼 area!! 
		$("#bntAgree").on("click" , function(){
			
			var frm = document.agree_Form;
			//유효성 체크
			if(!evManager.validation()){
				alert("필수 항목에 모두 동의해 주세요. ");
				return;
			}
	
			if(viewGbn == 'b'){
				//기업 회원가입
				frm.action = "/member/businessAuth";
				frm.submit();			
			}else if(viewGbn == 'm'){
				//일반 회원가입
				frm.action = "/member/customerAuth";
				frm.submit();			
						
			}else if(viewGbn == 's'){
				//sns 회원가입
				frm.action = "/member/customerAuth";
				frm.submit();				
			}
			
		});
		// 약관 동의 버튼  area end!! 
		
		//체크 박스 클릭 이벤트
		$("input[name='agree']").on("click" , function(e) {
			evManager.chkClick($(this));
		});
		// 체크 박스 클릭 이벤트  area end!!
		
		//체크 박스 클릭 이벤트
		$("input[name='maketingAgree']").on("click" , function(e) {
			evManager.maketingChkClick($(this));
		});
		// 체크 박스 클릭 이벤트  area end!!
		
		//체크 박스 클릭 이벤트
		$("input[name='chk_marketing_agree']").on("click" , function(e) {
			evManager.chkMarketingAgreeClick($(this));
		});
		// 체크 박스 클릭 이벤트  area end!!
		
	});	

</script>