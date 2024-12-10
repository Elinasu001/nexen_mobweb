<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<link type="text/css" rel="stylesheet" href="/css/fancy_fileupload.css">
<script type="text/javascript" src="/js/lib/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/lib/jquery.fileupload.js"></script>
<script type="text/javascript" src="/js/lib/jquery.fancy-fileupload.js"></script>




		<!--subContentsWrap-->
        <div class="subContentsWrap">
            <div class="stepTitle type02 buStep">
				<ul class="step03">
					<li class="step01 borLine">약관동의 <span class="stepIco"></span></li>
					<li class="step02 borLine">사업자인증 <span class="stepIco"></span></li>
					<li class="step03 active">회원정보</li>
				</ul>
            </div>

			<div class="subContents">
				<div class="titleArea type03">
					<h2 class="type01">꼭! <span>필</span><span>요</span><span>해</span><span>요.</span></h2>
				</div>

				<!--memberWrap-->
				<div class="memberBoxWrap">
                    <div class="business">
						<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="UTF-8" >
                        	<!-- 이전 화면에서(약관동의) 넘어온 값 -->
                        	<input type="hidden" id="receptionAll" name="receptionAll" value="${receptionAll}"/>
							<input type="hidden" id="receptionSms" name="receptionSms" value="${receptionSms}"/>
							<input type="hidden" id="receptionPhone" name="receptionPhone" value="${receptionPhone}"/>
							<input type="hidden" id="receptionEmail" name="receptionEmail" value="${receptionEmail}"/>
							<input type="hidden" id="receptionAdress" name="receptionAdress" value="${receptionAdress}" />
							<input type="hidden" id="receptionKakao" name="receptionKakao" value="${receptionKakao}"/>
									
							<!-- 마케팅동의 관련 데이터 -->
							<input type="hidden" id="receptionMarketingFirst" name="receptionMarketingFirst" value="${receptionMarketingFirst}"/>
							<input type="hidden" id="receptionMarketingSecond" name="receptionMarketingSecond" value="${receptionMarketingSecond}"/>
							
							<input type="hidden" id="bizNo" name="bizNo" value="${bizNo}" />
							<input type="hidden" id="comDivCd" name="comDivCd" value="${comDivCd}" />
							<input type="hidden" id="viewGbn" name="viewGbn" value="b" />
							<input type="hidden" id="joinPath" name="joinPath" value="MOB" />

							<input type="hidden" name="legrBrthYmd" id="legrBrthYmd">		<!-- 생년월일 -->
							<input type="hidden" id="phone" name="phone">					<!-- 대표자 전화 -->
							<input type="hidden" id="mPhone" name="mPhone">					<!-- 담당자 전화 -->
							<input type="hidden" id="cPhone" name="cPhone">					<!-- 회사 전화 -->
							<input type="hidden" id="idOverLapChk" name="idOverLapChk">		<!-- ID 중복체크 확인 -->
							<input type="hidden" id="email" name="email" />					<!-- 이메일 -->
							<input type="hidden" name="bizFile01">	<!-- 첨부파일(사업자 등록증) -->
							<input type="hidden" name="bizFile02">	<!-- 첨부파일(통장 사본) -->
							<input type="hidden" name="bizFile03">	<!-- 첨부파일(차량 등록증) -->
							
							<!-- INPUT PATH -->
							<input type="hidden" value="02"		id="inputlglPath" name="inputLglPath"/>
							<input type="hidden" value="0203"	id="inputMdlPath" name="inputMdlPath"/>

                        	<!-- 사업자회원정보 -->
                        	<h3 class="type05 first">사업자회원정보</h3>

                        	<div class="submitAreaWrap">
                                <div class="submitArea">
									<label for="bizRegNm"><span>법인명 *</span></label>
									<div class="submit">
										<input type="text" name="bizRegNm" class="type02 w100per" id="bizRegNm" title="법인명 입력란" placeholder="법인명을 입력해 주세요." maxLength="20" onkeyup="evManager.btnDisabled();">
									</div>
                                </div>

                                <div class="submitArea">
									<label for="bizType"><span>업종 *</span></label>
									<div class="submit">
										<input type="text" name="bizType" class="type02 w100per" id="bizType" title="업종 입력란" placeholder="업종을 입력해 주세요." maxLength="20" onkeyup="evManager.btnDisabled();">
									</div>
                                </div>

                                <div class="submitArea">
									<label for="bizCondition"><span>업태 *</span></label>
									<div class="submit">
										<input type="text" name="bizCondition" class="type02 w100per" id="bizCondition" title="업태 입력란" placeholder="업태를 입력해 주세요." maxLength="20" onkeyup="evManager.btnDisabled();">
									</div>
                                </div>

                                <div class="submitArea">
									<label for="legrBrthYmd1"><span>대표자 생년월일 *</span></label>
									<div class="submit">
										<select class="type02 w28per" title="년도 선택" name="legrBrthYmd1" id="legrBrthYmd1" onchange="evManager.btnDisabled();">
										</select>
										<select class="type01 w25per"  title="월 선택" name="legrBrthYmd2" id="legrBrthYmd2" onchange="evManager.btnDisabled();">
										</select>
										<select class="type01 w25per"  title="일 선택" name="legrBrthYmd3" id="legrBrthYmd3" onchange="evManager.btnDisabled();">
										</select>
									</div>
                                </div>

                                <div class="submitArea">
									<label for="phone01"><span>대표자 휴대전화 *</span></label>
									<div class="submit">
										<select class="type02 w28per" title="휴대전화 앞자리번호 선택" id="phone01" name="phone01">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>

										<span class="divi"></span>
										<input type="text" name="phone02" class="type04 w25per" id="phone02" value="${phone02}" title="휴대전화 중간번호 입력란" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
										<span class="divi"></span>
										<input type="text" name="phone03" class="type04 w25per" id="phone03" value="${phone03}" title="휴대전화 끝번호 입력란" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
									</div>
                                </div>

                                <div class="submitArea">
									<label for="mPhone01"><span>담당자 휴대전화 *</span></label>
									<div class="submit">
										<select class="type02 w28per" title="담당자 앞자리번호 선택" id="mPhone01" name="mPhone01">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>

										<span class="divi"></span>
										<input type="text" name="mPhone02" class="type04 w25per" id="mPhone02" title="담당자 중간번호 입력란" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
										<span class="divi"></span>
										<input type="text" name="mPhone03" class="type04 w25per" id="mPhone03" title="담당자 끝번호 입력란" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
									</div>
                                </div>


                                <div class="submitArea">
									<label for="custNm"><span>대표자명 *</span></label>
									<div class="submit">
										<input type="text" name="custNm" class="type02 w100per" id="custNm" title="대표자명 입력란" placeholder="대표자명을 입력해 주세요." maxLength="20" onkeyup="evManager.btnDisabled();">
									</div>
                                </div>

                                <div class="submitArea">
									<label for="code"><span>대표자 성별 *</span></label>
									<div class="submit radio">
										<input type="radio" name="gendCd" id="gendCd01" value="1" onclick="evManager.btnDisabled();"><label for="gendCd01" class="ml-m"><span>남</span></label>
										<input type="radio" name="gendCd" id="gendCd01" value="0" onclick="evManager.btnDisabled();"><label for="gendCd01"><span>여</span></label>
									</div>
                                </div>

                                <div class="submitArea">
									<label for="cPhone01"><span>회사번호 *</span></label>
									<div class="submit">
										<select class="type02 w28per" title="회사번호 앞자리번호 선택"  id="cPhone01" name="cPhone01">
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
											<option value="070">070</option>
											<option value="0505">0505</option>
										</select>

										<span class="divi"></span>
										<input type="text" name="cPhone02" class="type04 w20per" id="cPhone02" title="회사번호 중간번호 입력란" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
										<span class="divi"></span>
										<input type="text" name="cPhone03" class="type04 w20per" id="cPhone03" title="회사번호 끝번호 입력란" maxlength="4" onkeyup="evManager.btnDisabled(); return validNumberCheck.keyUp(event);">
									</div>
                                </div>

                                <div class="submitArea">
									<label for="mName"><span>담당자명 *</span></label>
									<div class="submit">
										<input type="text" name="perCharge" class="type02 w100per" id="perCharge" title="담당자명 입력란" placeholder="담당자명을 입력해 주세요." maxLength="20" onkeyup="evManager.btnDisabled();">
									</div>
                                </div>

                                <div class="submitArea">
	                                <label for="email01"><span>담당자 이메일 *</span></label>
	                                <div class="submit">
	                                    <input type="text" name="email01" class="type02 w20per" id="email01" onkeyup="evManager.btnDisabled();">
	                                    <span class="po_15">@</span>
	                                    <input type="text" name="email02" class="type04 w20per" id="email02" onkeyup="evManager.btnDisabled();">

	                                    <select class="type01 w130"  title="이메일 선택" id="email03">
	                                       <option value="">직접입력</option>
	                                    <option value="hanmail.net">hanmail.net</option>
	                                    <option value="naver.com">naver.com</option>
	                                    <option value="nate.com">nate.com</option>
	                                    <option value="gmail.com">gmail.com</option>
	                                    <option value="hotmail.com">hotmail.com</option>
	                                    <option value="paran.com">paran.com</option>
	                                    <option value="empal.com">empal.com</option>
	                                    <option value="korea.com">korea.com</option>
	                                    <option value="freechal.com">freechal.com</option>
	                                    </select>
	                                </div>
                                </div>


                        	</div>
                        	<!-- 사업자회원정보 -->

                       		 <!-- 가입정보 -->
                        	<h3 class="type05">가입정보</h3>

                        	<div class="submitAreaWrap">
                                <div class="submitArea">
	                                <label for="custId"><span>아이디 *</span></label>
	                                <div class="submit">
	                                    <input type="text" name="custId" class="type02 w100per" id="custId" title="아이디 입력란" maxlength="20" onkeyup="evManager.idValidation(); this.value=evManager.noKorean(this.value); evManager.btnDisabled();">
	                                </div>
	                                
                                    <p class="validation type02" style="display: none" id="custIdTxt1" btnChk="0">
                                        <span id="custIdTxt2"></span>
                                    </p>
                                </div>

                                <div class="submitArea">
                               		<label for="custPwd"><span>비밀번호 *</span></label>
									<div class="submit ">
										<input type="password" name="custPwd" class="type02 w280" id="custPwd" title="비밀번호 입력란" onkeyup="evManager.pwdValidation(); evManager.btnDisabled();" onkeydown="evManager.pwdValidation()" maxlength="20">
									</div>
									
									<p class="validation" style="display: none" id="custPwdTxt1" btnChk="0">
										<span><i class="ico07"></i>이미 사용중인 비밀번호입니다.</span>
									</p>
                                </div>

                                <div class="submitArea">
	                                <label for="custPwd02"><span>비밀번호 확인 *</span></label>
									<div class="submit">
										<input type="password" name="custPwd02" class="type02 w280" id="custPwd02" title="비밀번호확인 입력란" placeholder="비밀번호를 다시 한번 입력해 주세요." onkeyup="evManager.pwdValidation2(); evManager.btnDisabled();" onkeydown="evManager.pwdValidation2()" maxlength="20">
									</div>

									<p class="validation" style="display: none" id="custPwdTxt2" btnChk="0">
										<span><i class="ico07"></i>이미 사용중인 비밀번호입니다.</span>
									</p>
                                </div>

                                <div class="submitArea">
									<label for="employeeCd"><span>임직원코드</span></label>
									<div class="submit">
										<input type="text" name="employeeCd" class="type02 w280" id="employeeCd" onkeyup="this.value=evManager.noKorean(this.value);" title="임직원코드 입력란" placeholder="임직원코드를 입력해 주세요."  maxlength="20">
										<input type="hidden" id="employeeCdChk" name="employeeCdChk" >
									</div>
									<p class="validation" style="display: none" id="employeeCdTxt" btnChk="0">
										<span><i class="ico07"></i></span>
									</p>
								</div>
								
							<div class="submitArea">
									<label for="recNum"><span>추천인코드</span></label>
									<div class="submit">
										<input type="text" name="recNum" class="type02 w280" id="recNum" onkeyup="this.value=evManager.noKorean(this.value);" title="추천인코드 입력란" placeholder="추천인코드를 입력해 주세요."  maxlength="20">
										<input type="hidden" id="recNumChk" name="recNumChk" >
										<input type="hidden" id="recCustNo" name="recCustNo" value="" >	
										
									</div>
									<p class="validation" style="display: none" id="recNumTxt" btnChk="0">
										<span><i class="ico07"></i></span>
									</p>
								</div>
                        	</div>
                       	 	<!-- 가입정보 -->

                        	<!-- 증빙자료 -->
                        	<h3 class="type05">증빙자료</h3>

                        	<div class="fileAttachWrap">
	                            <div class="fileAttachBox">
	                                <h4>사업자등록사본</h4>

	                                <input id="fileUp01" class="fileUp" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
	                            </div>

	                            <div class="fileAttachBox">
	                                <h4>통장사본</h4>

	                                <input id="fileUp02" class="fileUp" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
	                            </div>

	                            <div class="fileAttachBox">
	                                <h4>통장사본</h4>

	                                <input id="fileUp03" class="fileUp" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
	                            </div>
	                        </div>
	                        <!-- 증빙자료 -->
                        </form>
                    </div>
				</div>
				<!--memberWrap-->
			</div>

            <div class="btnArea type02">
                <button type="button" class="type01 w100per" id="btnJoin" disabled="disabled">가입하기<i class="ico01"></i></button>
            </div>

			<div class="allBgWrap">
				<div class="member-ani-bg bg05"></div>
			</div>
        </div>
		<!--subContentsWrap-->

<script type="text/javascript">
	var evManager = {
		fileData01 : ""	//사업자등록사본
		,
		fileData02 : ""	//통장사본 (개인사업자 or 법인
		,
		fileData03 : ""	//차량등록증사본 (개인사업자 or 법인)
		,
		init : function(){
			//파일 업로드
			$('#fileUp01').FancyFileUpload({
				params : {
					action : 'fileuploader' ,
			  	},
			  	//파일 저장
			  	added : function(e, data) {
			  		if(data.files[0].type == ""){
			  			alert("[사업자등록증사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.")
			  		} else {
				  		evManager.fileData01 = data.files;
			  		}
				}
				,
			  	maxfilesize : 1000000
			});
			$('#fileUp02').FancyFileUpload({
				params : {
					action : 'fileuploader' ,
			  	},
			  	//파일 저장
			  	added : function(e, data) {
			  		if(data.files[0].type == ""){
			  			alert("[사업자등록증사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.")
			  		} else {
				  		evManager.fileData02 = data.files;
			  		}
				}
				,
			  	maxfilesize : 1000000
			});
			$('#fileUp03').FancyFileUpload({
				params : {
					action : 'fileuploader' ,
			  	},
			  	//파일 저장
			  	added : function(e, data) {
			  		if(data.files[0].type == ""){
			  			alert("[사업자등록증사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.")
			  		} else {
				  		evManager.fileData03 = data.files;
			  		}
				}
				,
			  	maxfilesize : 1000000
			});

			//대표자 생년 월일 세팅
			evManager.setBirth();
		}
		,
		//가입하기 버튼 활성화
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

			//법인명 , 대표자명, 업종, 업태, 담당자명 , email
			if($("#bizRegNm").val() == ""     || $("#custNm").val() == ""    || $("#bizType").val() == "" ||
			   $("#bizCondition").val() == "" || $("#perCharge").val() == "" || $("#email01").val() == "" || $("#email02").val() == "") {
				isBtnDisabled = false;
			}

			//성별
			if(!$("input[name='gendCd']").is(":checked")){
				isBtnDisabled = false;
			}

			//생년월일
			if($("#legrBrthYmd1").val() == 0 || $("#legrBrthYmd2").val() == 0 || $("#legrBrthYmd3").val() == 0){
				isBtnDisabled = false;
			}

			//대표자 전화번호 두번째 자리 체크 3자리 이상
			if($("#phone02").val().length < 3) {
				isBtnDisabled = false;
			}

			//대표자  전화번호 두번째 자리 체크 4자리 이상
			if($("#phone03").val().length < 4) {
				isBtnDisabled = false;
			}

			//담당자 전화번호 두번째 자리 체크 3자리 이상
			if($("#mPhone02").val().length < 3) {
				isBtnDisabled = false;
			}

			//대표자  전화번호 두번째 자리 체크 4자리 이상
			if($("#mPhone03").val().length < 4) {
				isBtnDisabled = false;
			}

			//회사 전화번호 두번째 자리 체크 3자리 이상
			if($("#cPhone02").val().length < 3) {
				isBtnDisabled = false;
			}

			//회사  전화번호 두번째 자리 체크 4자리 이상
			if($("#cPhone03").val().length < 4) {
				isBtnDisabled = false;
			}

			if(isBtnDisabled) {
				$("#btnJoin").removeClass();
				$("#btnJoin").addClass("type01 w100per");
				$("#btnJoin").removeAttr("disabled");
			} else {
				$("#btnJoin").removeClass();
				$("#btnJoin").addClass("type01 w100per");
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
			$("#custIdTxt2").attr("style" , "color:#FFF");

			// 아이디체크 번호('',0,1)
			var idOverLapChk = $("#idOverLapChk").val();

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
				$('#idOverLapChk').val('1');
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

			if(custPwd.length == 0){
				$('#custPwdTxt1').text('<span><i class="ico07"></i></span>');
			}
			
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

			if(custPwd == ""){
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
			}
			else if(custPwd !="" && custPwd != custPwd2){
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
			}
			else{
				$('#custPwdTxt2').html('<span><i class="ico07"></i>확인 되었습니다.</span>');
				$('#custPwdTxt2').attr("btnChk" , "1");
				$("#custPwdTxt2").attr("style" , "color:#FFFF66");
			}
			$('#custPwdTxt2').show();

		}
		,
		validation : function() {
			//생년월일
			var legrBrthYmd = $("#legrBrthYmd1").val() + "" + $("#legrBrthYmd2").val() + $("#legrBrthYmd3").val();
			$("#legrBrthYmd").val(legrBrthYmd);
			//대표자 휴대전화
			var phone = $("#phone01").val() + "-" + $("#phone02").val() + "-" + $("#phone03").val();
			$("#phone").val(phone);
			//회사번호
			var cPhone = $("#cPhone01").val() + "-" + $("#cPhone02").val() + "-" + $("#cPhone03").val();
			$("#cPhone").val(cPhone);
			//담당자 휴대 전화
			var mPhone = $("#mPhone01").val() + "-" + $("#mPhone02").val() + "-" + $("#mPhone03").val();
			$("#mPhone").val(mPhone);
			//이메일
			var email = $("#email01").val() + "@" + $("#email02").val();
			$("#email").val(email);

			if( $('#bizRegNm').val() == '' ){
				alert("법인명을 확인해주세요.");
				return false;
			}
			else if( $('#custNm').val() == '' ){
				alert("대표자명을 확인해주세요.");
				return false;
			}
			else if( $('#bizType').val() == '' ){
				alert("업종을 확인해주세요.");
				return false;
			}
			else if( $('#bizCondition').val() == '' ){
				alert("업태를 확인해주세요.");
				return false;
			}
			else if( ValidUtil.replaceChar($('#legrBrthYmd').val() ,"-","")  == '' ){
				alert("대표자 생년월일을 확인해주세요.");
				return false;
			}
			else if(!$("input[name='gendCd']").is(":checked") ){
				alert("대표자 성별을 확인해주세요.");
				return false;
			}
			else if( ValidUtil.replaceChar($('#phone').val() ,"-","")  == '' ){
				alert("대표자 휴대폰번호를 확인해주세요.");
				return false;
			}
			else if( ValidUtil.replaceChar($('#cPhone').val() ,"-","")  == '' ){
				alert("회사번호를 확인해주세요.");
				return false;
			}
			else if( ValidUtil.replaceChar($('#mPhone').val() ,"-","")  == '' ){
				alert("담당자 휴대폰번호를 확인해주세요.");
				return false;
			}
			else if( $('#perCharge').val() == '' ){
				alert("담당자명을 확인해주세요.");
				return false;
			}
			else if($('#custId').val() == ''){
				alert("아이디를 확인해주세요.");
				return false;
			}
			else if( $('#custPwd').val() == '' || $('#custPwd02').val() == '' ){
				alert('비밀번호를 확인해주세요.');
				return false;
			}

			if($('#email').val() == ''){
				alert('이메일을 확인해주세요.');
				return false;
			}
			else {
				if($('#email').val() != '' && !ValidUtil.mail($('#email').val())){
					alert('이메일을 확인해주세요.');
					return false;
				}
			}

			//첨부 파일 유효성 - 사업자
			//파일 사이즈 단위만 - 파일 사이즈에 따라 파일 정보 그려 주는게 틀리다.
			var	fUnit01 = $(".ff_fileupload_fileinfo").eq(0).text().toUpperCase();
			 	fUnit01 = fUnit01.substr(fUnit01.indexOf(" ")+1 , fUnit01.length);
			var fSize01 = "";	//파일 사이즈
			var fExt01  = "";	//파일 확장자
			var fVal01  = "";	//파일 이름

			if(fUnit01 == "MB") {
				fVal01 = $(".ff_fileupload_filename").eq(0).text();
				fSize01 = $(".ff_fileupload_fileinfo").eq(0).text().substring(0, $(".ff_fileupload_fileinfo").eq(0).text().indexOf(" "));
				fExt01  = $(".ff_fileupload_filename").eq(0).text().substr($(".ff_fileupload_filename").eq(0).text().lastIndexOf(".")+1).toLowerCase();
			} else {
				fVal01 = $(".ff_fileupload_filename").eq(0).children("input").val();
				fSize01 = $(".ff_fileupload_fileinfo").eq(0).text().substring(0 , $(".ff_fileupload_fileinfo").eq(0).text().indexOf(" "));;
				fExt01  = $(".ff_fileupload_fileinfo").eq(0).text().substr($(".ff_fileupload_fileinfo").eq(0).text().lastIndexOf(".")+1).toLowerCase();

				if($(".ff_fileupload_filename").eq(0).text() != "") {
					fVal01 = $(".ff_fileupload_filename").eq(0).text();
					fSize01 = $(".ff_fileupload_fileinfo").eq(0).text().substring(0, $(".ff_fileupload_fileinfo").eq(0).text().indexOf(" "));
					fExt01  = $(".ff_fileupload_filename").eq(0).text().substr($(".ff_fileupload_filename").eq(0).text().lastIndexOf(".")+1).toLowerCase();
				}
			}

			if(fVal01 == undefined){
				alert('사업자등록 사본을 첨부해 주세요.');
				return false;
			}  else {
				if(!fileManager.chkAttFileExt(fExt01)) {
					alert('[사업자등록증사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.');
					return false;
				}
				//파일 사이즈 byte로 변환 후 확인
				var convertFSize = fileManager.convertByte(fSize01 , fUnit01);
				if(!fileManager.chkAttFileSize(convertFSize)) {
					alert("[사업자등록증사본] 첨부파일 용량은 5M까지 가능합니다.");
					return false;
				}
			}

			//첨부 파일 유효성 - 통장 사본
			//파일 사이즈 단위만 - 파일 사이즈에 따라 파일 정보 그려 주는게 틀리다.
			var	fUnit02 = $(".ff_fileupload_fileinfo").eq(1).text().toUpperCase();
		 		fUnit02 = fUnit02.substr(fUnit02.indexOf(" ")+1 , fUnit02.length);
			var fSize02 = "";	//파일 사이즈
			var fExt02  = "";	//파일 확장자
			var fVal02  = "";	//파일 이름

			if(fUnit02 == "MB") {
				fVal02 = $(".ff_fileupload_filename").eq(1).text();
				fSize02 = $(".ff_fileupload_fileinfo").eq(1).text().substring(0, $(".ff_fileupload_fileinfo").eq(1).text().indexOf(" "));
				fExt02  = $(".ff_fileupload_filename").eq(1).text().substr($(".ff_fileupload_filename").eq(1).text().lastIndexOf(".")+1).toLowerCase();
			} else {
				fVal02 = $(".ff_fileupload_filename").eq(1).children("input").val();
				fSize02 = $(".ff_fileupload_fileinfo").eq(1).text().substring(0 , $(".ff_fileupload_fileinfo").eq(1).text().indexOf(" "));;
				fExt02  = $(".ff_fileupload_fileinfo").eq(1).text().substr($(".ff_fileupload_fileinfo").eq(1).text().lastIndexOf(".")+1).toLowerCase();

				if($(".ff_fileupload_filename").eq(1).text() != "") {
					fVal02 = $(".ff_fileupload_filename").eq(1).text();
					fSize02 = $(".ff_fileupload_fileinfo").eq(1).text().substring(0, $(".ff_fileupload_fileinfo").eq(1).text().indexOf(" "));
					fExt02  = $(".ff_fileupload_filename").eq(1).text().substr($(".ff_fileupload_filename").eq(1).text().lastIndexOf(".")+1).toLowerCase();
				}
			}

			if(fVal02 == undefined){
				alert('통장 사본을 첨부해 주세요.');
				return false;
			}  else {
				if(!fileManager.chkAttFileExt(fExt02)) {
					alert('[통장사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.');
					return false;
				}
				//파일 사이즈 byte로 변환 후 확인
				var convertFSize = fileManager.convertByte(fSize02 , fUnit02);
				if(!fileManager.chkAttFileSize(convertFSize)) {
					alert("[통장사본] 첨부파일 용량은 5M까지 가능합니다.");
					return false;
				}
			}

			//첨부 파일 유효성 - 차량등록증
			//파일 사이즈 단위만 - 파일 사이즈에 따라 파일 정보 그려 주는게 틀리다.
			var	fUnit03 = $(".ff_fileupload_fileinfo").eq(2).text().toUpperCase();
		 		fUnit03 = fUnit03.substr(fUnit03.indexOf(" ")+1 , fUnit03.length);
			var fSize03 = "";	//파일 사이즈
			var fExt03  = "";	//파일 확장자
			var fVal03  = "";	//파일 이름

			if(fUnit03 == "MB") {
				fVal03 = $(".ff_fileupload_filename").eq(2).text();
				fSize03 = $(".ff_fileupload_fileinfo").eq(2).text().substring(0, $(".ff_fileupload_fileinfo").eq(2).text().indexOf(" "));
				fExt03  = $(".ff_fileupload_filename").eq(2).text().substr($(".ff_fileupload_filename").eq(2).text().lastIndexOf(".")+1).toLowerCase();
			} else {
				fVal03 = $(".ff_fileupload_filename").eq(2).children("input").val();
				fSize03 = $(".ff_fileupload_fileinfo").eq(2).text().substring(0 , $(".ff_fileupload_fileinfo").eq(2).text().indexOf(" "));;
				fExt03  = $(".ff_fileupload_fileinfo").eq(2).text().substr($(".ff_fileupload_fileinfo").eq(2).text().lastIndexOf(".")+1).toLowerCase();

				if($(".ff_fileupload_filename").eq(2).text() != "") {
					fVal03 = $(".ff_fileupload_filename").eq(2).text();
					fSize03 = $(".ff_fileupload_fileinfo").eq(2).text().substring(0, $(".ff_fileupload_fileinfo").eq(2).text().indexOf(" "));
					fExt03  = $(".ff_fileupload_filename").eq(2).text().substr($(".ff_fileupload_filename").eq(2).text().lastIndexOf(".")+1).toLowerCase();
				}
			}

			if(fVal03 == undefined){
				alert('차량등록증사본을 첨부해 주세요.');
				return false;
			}  else {
				if(!fileManager.chkAttFileExt(fExt03)) {
					alert('[차량등록증사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.');
					return false;
				}
				//파일 사이즈 byte로 변환 후 확인
				var convertFSize = fileManager.convertByte(fSize03 , fUnit03);
				if(!fileManager.chkAttFileSize(convertFSize)) {
					alert("[차량등록증사본] 첨부파일 용량은 5M까지 가능합니다.");
					return false;
				}
			}


			return true;
		}
		,
		//대표자 생년 월일 세팅
		setBirth : function() {
			//오늘 날짜
			var today = DateUtil.toYyyyMmDd(new Date());
			var yyyy = today.substring(0,4);
			var mm = today.substring(4,6);
			var dd = today.substring(6,8);

			//년도
			var yyyyOption = "";
			yyyyOption += "<option value='0' selected>년도</option>";
			for(i= (yyyy-90); i <= yyyy; i++) {
				yyyyOption += "<option value='"+i+"'>"+i+" 년</option>";
			}
			$("#legrBrthYmd1").html(yyyyOption);

			//월
			var mmOption = "";
			mmOption += "<option value='0' selected>월</option>";
			for(var i=1; i<13; i++) {
				if(i > 9){
					mmOption += "<option value='"+i+"'>"+i+" 월</option>";
				} else {
					mmOption += "<option value='0"+i+"'>0"+i+" 월</option>";
				}
			}
			$("#legrBrthYmd2").html(mmOption);

			// 일
			var ddOption = "";
			ddOption += "<option value='0' selected> 일</option>";
			for(var i=1; i<32; i++) {
				if(i > 9){
					ddOption += "<option value='"+i+"'>"+i+" 일</option>";

				}else{
					ddOption += "<option value='0"+i+"'>0"+i+" 일</option>";
				}
			}
			$("#legrBrthYmd3").html(ddOption);
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
			    		$('#custIdTxt2').html('<i class="ico07" ></i>이미 사용중인 아이디 입니다.');
			    		$("#custIdTxt2").attr("style" , "color:#FFF");
			    		return;
			    	}

			    	$("#idOverLapChk").val("1");
			    	$("#custIdTxt1").attr("btnChk" , "1");
			    	$('#custIdTxt2').html('<i class="ico07" ></i>사용 가능한 아이디 입니다.');
			    	$("#custIdTxt2").attr("style" , "color:#FFFF66");

			    	evManager.btnDisabled();
			    },
			    error: function (request, status, error) {
					console.log('error callback : ' + error);
				}
			});
		}
		,
		//임직원 여부 조회
		employeeCdCheck : function () {
// 			if($("#employeeCd").val() == ""){
// 				alert("임직원코드를 입력하세요.");
// 				return false;
// 			}

			//common ajax call
			if(!ValidUtil.isEmpty($("#employeeCd").val().trim())) {
				var pUrl = "/member/employeeCdCheck";
				var pSendData = { employeeCd : $("#employeeCd").val().trim() };
					pSendData = JSON.stringify(pSendData);
	
				$.ajax({
				    url: pUrl,
				    type: "POST",
				    cache:false,
				    async:false,
				    data: pSendData,
				    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
				    success: function(data) {
				    	if(data.employeeCdYn == "Y") {
				    		$("#employeeCdTxt").val("1");
					    	$('#employeeCdTxt').html('사용 가능한 코드 입니다.');
					    	$('#employeeCdTxt').attr('style','color:#FFFF66;');
				    	} else {
				    		$("#employeeCd").val("");
				    		$("#employeeCdTxt").val("0");
				    		$('#employeeCdTxt').html('사용 할 수 없는 코드 입니다.');
				    		$('#employeeCdTxt').attr('style','color:#FFF;');
				    	}
	
				    	$('#employeeCdTxt').show();
				    	evManager.btnDisabled();
				    },
				    error: function (request, status, error) {
						console.log('error callback : ' + error);
					}
				});
			}
		},
		//추천인코드 인증 엄수현 매니저 추가
		recNumCheck : function () {
	/*
		mobile은 keyup 및 focus on 을 사용 하기 때문에 버튼을 눌러서 체크 할 일이 없다.
		그래서 사용 안함
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
			    		$('#recNumTxt').html('<i class="ico07" ></i>존재하지 않는 추천인 코드 입니다.');
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
		// 공백이라면 추천인코드의 모든 값은 초기화 한다.
			   $('#recNum').val('');
			   $('#recCustNo').val('');
			   $('#recNumTxt').val('0');
	    	   $('#recNumTxt').html('');
		}
	},
		selectEmail : function(){
			if($("#email03").val() != "") {
				$("#email02").val($("#email03").val());
			} else {
				$("#email02").val("");
			}
			evManager.btnDisabled();
		}
		,
		bizCustSave : function(){
			//폼객체를 불러와서

	        $("#custNm").val(encodeURIComponent($("#custNm").val()));
	        $("input[name='bizRegNm']").val(encodeURIComponent($("input[name='bizRegNm']").val()));
	        $("input[name='bizType']").val(encodeURIComponent($("input[name='bizType']").val()));
	        $("input[name='bizCondition']").val(encodeURIComponent($("input[name='bizCondition']").val()));
	        $("input[name='perCharge']").val(encodeURIComponent($("input[name='perCharge']").val()));

	        //var form = $('form')[0];
	        var form = $('form')[1];
	        //FormData parameter에 담아줌

	        var param = new FormData(form);
		        //파일 정보
	        	param.append("bizFiles", evManager.fileData01[0]);	//사업자
	        	param.append("bizFiles", evManager.fileData02[0]);	//통장
	        	param.append("bizFiles", evManager.fileData03[0]);	//차량 등록 증

	        $.ajax({
	            type: "POST",
	            enctype: false,
	            url: "/member/insertBizCust",
	            data: param,
	            cache: false,
	            processData: false,
	            contentType: false,
	            success: function (data) {
	                if(data.rtnCode == "0" ) {
	                	var custNm = decodeURIComponent($("#custNm").val());
	                	$(window).unbind('beforeunload');

	                	Login.fnGoToUrl("/member/custInfoComp","custNm",custNm);

	                	/* var frm = document.frm;
		        		frm.action = "/member/custInfoComp";
		        		frm.submit(); */
	                } else {
	                	alert(data.rtnMsg);
	                	return;
	                }
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });
		}
	}


	// **************************** FILE  ****************************//
	var fileManager = {
		// 파일 업로드에서 이미지 파일만 올리기 (jpg,png,gif,pdf,bmp)
		chkAttFileExt : function(fileExt){
			if(fileExt != "jpg" && fileExt != "png" && fileExt != "gif" && fileExt != "pdf" && fileExt != "bmp" && fileExt != "jpeg"){
				return false;
			}
		    return true;
		}
		,
		// 파일 업로드에 5M 초과 방지
		chkAttFileSize : function(size){
			var maxSize = 5 * 1024 * 1000;
			var fileSize =  size
			if(maxSize < fileSize){
				return false;
			}
			return true;
		}
		,
		// byte 단위 변환
		convertByte : function(size , unit){
			var fSize = 0;
			if(unit == "MB"){
				fSize = size * 1024 * 1024;
			} else {
				if(unit.indexOf("KB") > -1) {
					fSize = size * 1024;
				} else
				//5M 이상
				fSize = 6000000;
			}
			return fSize;
		}
	}
	// **************************** FILE  ****************************//


	$(document).ready(function() {
		/* page background image Start */
		$('#bgFullImg').css('height', '100%');
		$('#bgFullImg').append('<div class="member-ani-bg bg04"></div>');
		/* page background image End */

		//init
		evManager.init();

		// 아이디 중복 확인 버튼 area!!
		$("#custId").on("focusout" , function(){
			evManager.idOverLapCheck();
		});
		// 아이디 중복 확인   area end!!

		// 임직원  확인 버튼 area!!
		$("#employeeCd").on("focusout" , function(){
			evManager.employeeCdCheck();
		});
		// 임직원  중복 확인   area end!!
		
	    // 추천인  확인 area 엄수현 매니저 추가!! 
		$("#recNum").on("focusout" , function(){
			evManager.recNumCheck();
		});
	
		// email select box change event area!!
		$("#email03").on("change" , function(){
			evManager.selectEmail();
		});
		// email select box change event area end!!

		// 가입하기 버튼 area!!
		$("#btnJoin").on("click" , function(){
			if(!ValidUtil.isEmpty($('#employeeCd').val().trim())) {
				evManager.employeeCdCheck();
			}
			
			//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
	        event.preventDefault();

			//입력 항목 체크
			if(!evManager.validation()) {
				return;
			}

			//사업자 회원 정보 저장
			evManager.bizCustSave();
		});
		// 가입하기   area end!!
	});

</script>

