<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<link type="text/css" rel="stylesheet" href="/css/fancy_fileupload.css">

<script type="text/javascript" src="/js/lib/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/lib/jquery.fileupload.js"></script>
<script type="text/javascript" src="/js/lib/jquery.fancy-fileupload.js"></script>


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

          <!-- 상품 안내 -->
          <div class="order-middle-message text-center border-bottom">
            <p>회원님의 정보입니다.</p>
            <div class="order-info-summary">
              <small>회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다.</small>
            </div>
          </div>
          <!-- //상품 안내 -->

		<!--form frm Start -->
		<form name="frm" id="frm" onsubmit="return false;" style="clear:both;">
			<input type="hidden" value="${diVal}" 		name ="diVal" id="diVal" data-json-obj="true" />		<!-- 실명 인증 고유 값 -->
			<input type="hidden" value="${ciVal}" 		name ="ciVal" id="ciVal" data-json-obj="true" />		<!-- 실명 인증 고유 값 -->
			<input type="hidden" value="${vnVal}" 		name ="vnVal" id="vnVal" data-json-obj="true" />		<!-- 실명 인증 고유 값 -->
			<input type="hidden" value="${legrBrthYmd}" name ="legrBrthYmd" id="legrBrthYmd" data-json-obj="true" />	<!-- 실명 인증 - 회원 생년월일 -->
			<input type="hidden" value="${gendCd}" 		name ="gendCd" id="gendCd" data-json-obj="true" />		<!-- 실명 인증 - 회원 성별 -->
			<input type="hidden" value="${frgnCd}"		name ="frgnCd" id="frgnCd" data-json-obj="true" />		<!-- 실명 인증 - 내, 외국인 구분 -->

			<input type="hidden" value="${receptionSms}"	name ="receptionSms" id="receptionSms" data-json-obj="true" />
			<input type="hidden" value="${receptionPhone}"	name ="receptionPhone" id="receptionPhone" data-json-obj="true" />
			<input type="hidden" value="${receptionEmail}"	name ="receptionEmail" id="receptionEmail" data-json-obj="true" />
			<input type="hidden" value="${receptionAdress}"	name ="receptionAdress" id="receptionAdress" data-json-obj="true" />
			<input type="hidden" value="${receptionKakao}"	name ="receptionKakao" id="receptionKakao" data-json-obj="true" />
			
			<!-- 마케팅동의 관련 데이터 -->
			<input type="hidden" value="${receptionMarketingFirst}" name="receptionMarketingFirst" id="receptionMarketingFirst" data-json-obj="true"/>
			<input type="hidden" value="${receptionMarketingSecond}" name="receptionMarketingSecond" id="receptionMarketingSecond" data-json-obj="true"/>
			
			<!-- INPUT PATH -->
			<input type="hidden" value="02" id="inputlglPath" name="inputLglPath" data-json-obj="true"/>
			<input type="hidden" value="0204" id="inputMdlPath" name="inputMdlPath" data-json-obj="true"/>
			
			<input type="hidden" value="${safeKey}"	id="safeKey" name ="safeKey" data-json-obj="true" />
			<input type="hidden" name ="custNo" id="custNo" data-json-obj="true" />
			<input type="hidden" name ="custDivCd" id="custDivCd" data-json-obj="true" />

			<input type="hidden" id="viewGbn" name="viewGbn" value="${viewGbn}" data-json-obj="true" />
			<input type="hidden" name="snsGbn" id="snsGbn" value="${snsGbn}" data-json-obj="true" />
			<input type="hidden" name="snsid" id="snsid" value="${snsid}" data-json-obj="true" />

			<input type="hidden" id="issCert" name ="issCert" data-json-obj="true"/>		<!-- 제휴코드 인증 -->
			<input type="hidden" id="indvCert" name ="indvCert" data-json-obj="true"/>		<!-- 개별코드 인증 -->
			<input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->

			<!-- 건물번호 -->
          <!-- 가입정보 (일반)-->
          <div class="inset-ml border-bottom border-white-top" id="memberTp1">

            <h3 class="content-title">가입정보</h3>

            <!-- 가입정보 일반 -->
            <div class="submit layout-c">
              <label for="id01"><span class="essen black">아이디</span></label>
              <div class="layout-r border-bottom">
                <input type="text" id="custId" name="custId" value="${userLoginId}"class="pl-0 trans-bg" title="아이디 입력란" readonly="readonly" data-json-obj="true" />
                <button type="button" class="dark-line border trans-bg inset-xs pl-m pr-m align-middle" onclick="javascript:fn_dropCust();">회원탈퇴</button>
              </div>
            </div>

            <div class="submit layout-c">
              <label for="password-now"><span class="black">현재 비밀번호</span></label>
              <div class="layout-r border-bottom">
                <input type="password" id="custPwd" name="custPwd" class="pl-0 trans-bg" id="cPassword" title="현재 비밀번호 입력란" placeholder="현재 비밀번호를 입력해주세요"  readonly="readonly" data-json-obj="true" />
              </div>
              <p class="validation mt-s">
                <span>영문(대/소문자), 숫자를 포함하여 8~20자 이내로 입력해주세요.</span>
              </p>
            </div>

            <div class="submit layout-c">
              <label for="password-new"><span class="black">신규 비밀번호</span></label>
              <div class="border-bottom layout-r">
                <input type="password" id="custNewPwd" name="custNewPwd" class="pl-0 trans-bg" id="nPassword" title="신규 비밀번호 입력란" placeholder="신규 비밀번호를 입력해주세요" onkeyup="evManager.pwdValidation(); evManager.btnDisabled();" onkeydown="evManager.pwdValidation()" maxlength="20" data-json-obj="true" />
              </div>
              <p class="validation mt-s" style="display: none" id="custPwdTxt1" btnChk="0">
                <span><i class="ico07"></i></span>
              </p>
              
            </div>

            <div class="submit layout-c">
              <label for="password-new-check"><span class="black">신규 비밀번호 확인</span></label>
              <div class="border-bottom layout-r">
                <input type="password" id="custNewRePwd" name="custNewRePwd" class="pl-0 trans-bg" id="nPassword02" title="신규 비밀번호 확인 입력란" placeholder="신규 비밀번호를 입력해주세요" onkeyup="evManager.pwdValidation2();" onkeydown="evManager.pwdValidation2()" maxlength="20" data-json-obj="true" />
              </div>
              <p class="validation mt-s" style="display: none" id="custPwdTxt2" btnChk="0">
                <span><i class="ico07"></i></span>
              </p>
            </div>
            <!-- //가입정보 일반 -->
          </div>

          <!-- 가입정보 SNS -->
          <!-- SNS 가입 회원 회원정보 수정  경우 -->
          <div class="inset-ml border-bottom border-white-top" id="memberTp2">
            <h3 class="content-title">가입정보</h3>
            <div class="submit layout-c border-bottom" id="snsCateCase2">
            </div>
          </div>
          <!-- SNS 가입 회원 회원정보 수정  경우 -->
          <!-- 여러건의 SNS 가입 회원 회원정보 수정 -->
          <div class="inset-ml border-bottom border-white-top" id="memberTp3">
            <h3 class="content-title">가입정보</h3>
            <div class="submit layout-c border-bottom" id="snsCateCase3">
            </div>
          </div>
          <!-- 여러건의 SNS 가입 회원 회원정보 수정 -->
          <!-- //가입정보 SNS -->

          <!-- 기본정보 -->
          <div class="inset-ml border-bottom border-white-top">

            <h3 class="content-title">기본정보</h3>

            <div class="submit layout-c personalDiv" >
              <label for="info-name"><span class="black">이름</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="custNm" value="${userLoingNm}" class="pl-0 trans-bg" id="custNm" title="이름 입력란" readonly="readonly">
                <button type="button" class="dark-line border trans-bg inset-xs align-middle" id="safeKeyChk" style="display:none;">인증번호 발급</button>
              </div>
            </div>

            <div class="submit layout-c order-basket personalDiv ">
              <label for="phone01"><span class="black">전화번호</span></label>
              <div class="layout-r inline-m same-size border-bottom">
                <select class="inline" title="전화번호 앞자리 선택" id="cPhone01" name="cPhone01" data-json-obj="true">
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
                <span class="divi type02 align-middle"></span>
                <input type="text" name="cPhone02" class="inline trans-bg" id="cPhone02" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" title="전화번호 중간번호 입력란" data-json-obj="true">

                <span class="divi type02 align-middle"></span>
                <input type="text" name="cPhone03" class="inline trans-bg" id="cPhone03" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" title="휴대폰 끝번호 입력란" data-json-obj="true">
              </div>
            </div>

            <div class="submit layout-c order-basket personalDiv" >
              <label for="cellphone01"><span class="essen black">휴대전화</span></label>
              <div class="layout-r inline-xs same-size border-bottom">
                <select id="phone01" name="phone01" class="inline" title="휴대전화 앞자리 선택"  data-json-obj="true" >
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
                </select>
                <span class="divi type02 align-middle"></span>
                <input type="text" name="phone02" class="inline trans-bg" id="phone02" maxlength="4" title="휴대전화 중간번호 입력란" maxlength="4" onkeyup="evManager.phoneChkYn(); return false; validNumberCheck.keyUp(event);" data-json-obj="true"  />

                <span class="divi type02 align-middle"></span>
                <input type="text" name="phone03" class="inline trans-bg" id="phone03" maxlength="4" title="휴대전화 끝번호 입력란" maxlength="4" onkeyup="evManager.phoneChkYn(); return false; validNumberCheck.keyUp(event);" data-json-obj="true" />
				<p class="validation type02" style="display: none" id="phoneTxt1">
					<span><i class="ico07"></i>이미 사용중인 휴대전화번호입니다.</span>
				</p>
                <input type="hidden" name="phoneChkYn" id="phoneChkYn" />
                <button type="button" class="dark-line border trans-bg inset-xs align-middle" onclick="javascript:fnCallPhone('phone');">본인인증</button>
              </div>
            </div>

            <div class="submit layout-c order-basket personalDiv">
              <label for="real-user-phone01"><span class="black">실사용자 휴대전화</span></label>
              <div class="layout-r inline-xs same-size border-bottom">
                <select class="inline" title="휴대전화 앞자리 선택" id="rPhone01" name="rPhone01" data-json-obj="true">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
                </select>
                <span class="divi type02 align-middle"></span>
                <input type="text" name="rPhone02" class="inline trans-bg" id="rPhone02" maxlength="4" onkeyup="evManager.rPhoneChkYn(); return false; validNumberCheck.keyUp(event);" title="전화번호 중간번호 입력란" data-json-obj="true">

                <span class="divi type02 align-middle"></span>
                <input type="text" name="rPhone03" class="inline trans-bg" id="rPhone03" maxlength="4" onkeyup="evManager.rPhoneChkYn(); return false; validNumberCheck.keyUp(event);" title="휴대폰 끝번호 입력란" data-json-obj="true">
				<p class="validation type02" style="display: none" id="rPhoneTxt1">
					<span><i class="ico07"></i>이미 사용중인 휴대전화번호입니다.</span>
				</p>
				<input type="hidden" name="rPhoneChkYn" id="rPhoneChkYn" />
                <button type="button" class="dark-line border trans-bg inset-xs align-middle btnPhoneCerti" certiTp="rPhone" >휴대폰인증</button>
              </div>
            </div>

            <!-- 사업자/법인 정보 Start -->
            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">사업자 등록번호</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="bizRegNo" id="bizRegNo" class="pl-0 trans-bg" title="사업자등록번호" readonly="readonly">
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">사업자 구분</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="comDivCd" id="comDivCd" class="pl-0 trans-bg" readonly="readonly">
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">법인명</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="bizRegNm" id="bizRegNm" class="pl-0 trans-bg" readonly="readonly">
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">대표자명</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="CcustNm" id="CcustNm" class="pl-0 trans-bg" >
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="black">업종 *</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="bizType" id="bizType" class="pl-0 trans-bg"  data-json-obj="true">
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">업태</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="bizCondition" id="bizCondition" class="pl-0 trans-bg" data-json-obj="true">
              </div>
            </div>

            <div class="submit layout-c order-basket CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">대표자 생년월일</span></label>
              <div class="layout-r inline-xs same-size border-bottom">
              <!--
                <input type="text" value="1999.01.02" class="pl-0 trans-bg" id="info-name">
                 -->
                <select class="inline" title="년도 선택" name="legalBrthYY" id="legalBrthYY" onchange="evManager.btnDisabled()">
				</select>

				<span class="divi type02 align-middle"></span>

				<select class="inline trans-bg"  title="월 선택" name="legalBrthMM" id="legalBrthMM" onchange="evManager.btnDisabled()">
				</select>

				<span class="divi type02 align-middle"></span>

				<select class="inline trans-bg"  title="일 선택" name="legalBrthDD" id="legalBrthDD" onchange="evManager.btnDisabled()">
				</select>
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">대표자 성별</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="gendCd" id="gendCd" class="pl-0 trans-bg" readonly="readonly" >
              </div>
            </div>

            <div class="submit layout-c order-basket CorpDiv" style="display:none;">
              <label for="cellphone01"><span class="essen black">대표자 휴대전화</span></label>
              <div class="layout-r inline-xs same-size border-bottom">
                <select class="inline" title="전화번호 앞자리 선택" id="Cphone01" name="Cphone01" >
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
                </select>
                <span class="divi type02 align-middle"></span>
                <input type="text" name="Cphone02" class="inline trans-bg" id="Cphone02" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" title="전화번호 중간번호 입력란" >

                <span class="divi type02 align-middle"></span>
                <input type="text" name="Cphone03" class="inline trans-bg" id="Cphone03" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" title="휴대폰 끝번호 입력란" >
                <!--
                <button type="button" class="dark-line border trans-bg inset-xs align-middle">본인인증</button>
                 -->
              </div>
            </div>

            <div class="submit layout-c order-basket" CorpDiv" style="display:none;">
              <label for="phone01"><span class="essen black">회사번호</span></label>
              <div class="layout-r inline-m same-size border-bottom">
				<select class="inline" title="전화번호 앞자리 선택" id="CcPhone01" name="CcPhone01" >
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
                <span class="divi type02 align-middle"></span>
                <input type="text" name="CcPhone02" class="inline trans-bg" id="CcPhone02" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" title="전화번호 중간번호 입력란" >

                <span class="divi type02 align-middle"></span>
                <input type="text" name="CcPhone03" class="inline trans-bg" id="CcPhone03" maxlength="4" onkeyup="validNumberCheck.keyUp(event);" title="휴대폰 끝번호 입력란" >

              </div>
            </div>

            <div class="submit layout-c order-basket CorpDiv" style="display:none;">
              <label for="real-user-phone01"><span class="essen black">담당자 휴대전화</span></label>
              <div class="layout-r inline-xs same-size border-bottom">
                <select class="inline" title="휴대전화 앞자리 선택" id="CrPhone01" name="CrPhone01" >
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
                </select>
                <span class="divi type02 align-middle"></span>
                <input type="text" name="CrPhone02" class="inline trans-bg" id="CrPhone02" maxlength="4" onkeyup="evManager.rPhoneChkYn(); return false; validNumberCheck.keyUp(event);" title="전화번호 중간번호 입력란" >

                <span class="divi type02 align-middle"></span>
                <input type="text" name="CrPhone03" class="inline trans-bg" id="CrPhone03" maxlength="4" onkeyup="evManager.rPhoneChkYn(); return false; validNumberCheck.keyUp(event);" title="휴대폰 끝번호 입력란" >

                <button type="button" class="dark-line border trans-bg inset-xs align-middle btnPhoneCerti" certiTp="CrPhone">휴대폰인증</button>
              </div>
            </div>

            <div class="submit layout-c CorpDiv" style="display:none;">
              <label for="info-name"><span class="essen black">담당자명</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="perCharge" class="pl-0 trans-bg" id="perCharge" maxlength="25" data-json-obj="true">
              </div>
            </div>

            <!-- 사업자/법인 정보 End -->

            <div class="submit layout-c order-basket">
              <label for="email01"><span class="black">이메일</span></label>
              <div class="layout-r border-bottom">
              <input type="hidden" id="email" name="email" data-json-obj="true" />
                <input type="text" class="trans-bg" id="email01" name="email01" title="이메일 앞자리 입력란" onkeyup="evManager.btnDisabled()" data-json-obj="true"><span class="align-middle">@</span>
                <input type="text" class="trans-bg" id="email02" name="email02" title="이메일 뒷자리 입력란" onkeyup="evManager.btnDisabled()" data-json-obj="true">
                <select class="trans-bg" id="email03" title="이메일 선택" data-json-obj="true">
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

            <div class="submit layout-c order-basket">
              <label for="info02"><span class="black">주소</span></label>
              <div class="conWrap layout-r border-bottom mb-s md-trigger" data-modal="modal-Addr">
                <input type="text" name="addrFull" id="addrFull" class="type03 trans-bg" id="info02" readonly="readonly" title="주소 입력란" placeholder="주소를 검색하세요" >
                <button type="button" id="selectAddr" val="P1" class="align-middle btn-address-search" >검색</button>
                <input type="hidden" id="addr" name="addr" data-json-obj="true" />
                <input type="hidden" id="detlAddr" name="detlAddr" data-json-obj="true" />
                <input type="hidden" id="posNo" name="posNo" data-json-obj="true" />
                <input type="hidden" id="bldMngNo" name="bldMngNo" data-json-obj="true" />
              </div>
              <p class="validation">
                <span><i class="ico08"></i>입력해주신 이메일/주소로 메일 또는 우편으로 계약서를 발송해 드립니다.</span>
              </p>
            </div>

			<!-- layout-c Start -->
            <div class="submit layout-c">
              <h4 class="mb-m">마케팅 활용동의</h4>
              <div class="layout-r inline-s same-size">
                <div class="checkbox type01 inline">
                  <input id="cagYn1" name="cagYn1" type="checkbox" class="checkbox-input" data-json-obj="true">
                  <label for="cagYn1" class="checkbox-label">SMS</label>
                </div>
                <div class="checkbox type01 inline">
                  <input id="cagYn2" name="cagYn2" type="checkbox" class="checkbox-input" data-json-obj="true">
                  <label for="cagYn2" class="checkbox-label">전화</label>
                </div>
                <div class="checkbox type01 inline">
                  <input id=cagYn3 name="cagYn3" type="checkbox" class="checkbox-input" data-json-obj="true">
                  <label for="cagYn3" class="checkbox-label">E-MAIL</label>
                </div>
                <div class="checkbox type01 inline" hidden="true">
                  <input id="cagYn4" name="cagYn4" type="checkbox" class="checkbox-input" data-json-obj="true" disabled="disabled">
                  <label for="cagYn4" class="checkbox-label">주소</label>
                </div>
                <!-- 10233006 알림톡 추가 -->
                <div class="checkbox type01 inline">
                  <input id="cagYn5" name="cagYn5" type="checkbox" class="checkbox-input" data-json-obj="true">
                  <label for="cagYn5" class="checkbox-label">알림톡</label>
                </div>
              </div>
            </div>
            <!-- layout-c End -->
            
            <!-- 10233006 영리성 광고 수신동의 추가 Start -->
            <div class="submit layout-c">
              <h4 class="mb-m">영리성 광고 수신동의</h4>
              <div class="layout-r inline-s same-size">
                <div class="checkbox type01 inline">
                  <input id="magYn1" name="magYn1" type="checkbox" class="checkbox-input" data-json-obj="true">
                  <label for="magYn1" class="checkbox-label">마케팅 활용 정보 수집 및 이용 동의</label>
                </div>
                <div class="checkbox type01 inline">
                  <input id="magYn2" name="magYn2" type="checkbox" class="checkbox-input" data-json-obj="true">
                  <label for="magYn2" class="checkbox-label">신규,맞춤 서비스 제공을 위한 이용 동의</label>
                </div>
              </div>
            </div>
            <!-- 10233006 영리성 광고 수신동의 추가 End -->
          </div>
          <!-- //기본정보 -->
		</form>
        <!--  frm End -->

		<!--  attchFrm Start -->
		<form name="attchFrm" id="attchFrm" onsubmit="return false;" style="clear:both;">
			<input type="hidden" name="custNo" id="attchCustNo">
			<input type="hidden" name="custId" id="attchCustId">
			<!-- 증빙자료 Start -->
			<h3 class="content-title" style="display:none;">증빙자료</h3>
            <div class="layout-r inline-s same-size CorpDiv" style="display:none;">
              <div class="inline">
	                <h4>사업자등록사본</h4>
	                <input type="hidden" name="fileFlag01" id="fileFlag01">
	                <input id="fileUp01" class="fileUp" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
					<div class="savePreview" style="display:none;">
	                    <a href="#" onclick="return false;" class="fDel" bizFile="fileFlag01"></a>
	                    <img id="attachPath1" src="/img/customer/m_slider_01.jpg"  alt=""/>
	                </div>
              </div>

              <div class="inline">
	                <h4>통장사본</h4>
	                <input type="hidden" name="fileFlag02" id="fileFlag02">
	                <input id="fileUp02" class="fileUp" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
					<div class="savePreview" style="display:none;">
	                    <a href="#" onclick="return false;" class="fDel" bizFile="fileFlag02"></a>
	                    <img id="attachPath2" src="../img/customer/m_slider_01.jpg"  alt=""/>
	                </div>
              </div>

              <div class="inline">
	                <h4>차량등록증사본</h4>
	                <input type="hidden" name="fileFlag03" id="fileFlag03">
	                <input id="fileUp03" class="fileUp" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png" multiple>
					<div class="savePreview" style="display:none;">
	                    <a href="#" onclick="return false;" class="fDel" bizFile="fileFlag03"></a>
	                    <img id="attachPath3" src="../img/customer/m_slider_01.jpg"  alt=""/>
	                </div>
              </div>
            </div>

	        <!-- 증빙자료 End -->
        </form>
        <!--  attchFrm End -->

          <!-- 부가정보 -->
		  <!--  subFrm Start -->
          <form name="subFrm" id="subFrm" onsubmit="return false;" style="clear:both;">
          <div class="inset-ml border-white-top">

            <h3 class="content-title">부가정보</h3>

            <div class="submit layout-c">
              <label for="affiliate-code"><span class="black">제휴 코드</span></label>
              <div class="layout-r border-bottom">
<!--                 <input type="text" name="affiliateCd" id="affiliateCd" class="pl-0 trans-bg"  maxlength="10" title="제휴 코드 입력란" placeholder="제휴 코드를 입력해주세요" data-json-obj="true" onkeyup="evManager.affiliateCdChk();"> -->
                <input type="text" name="affiliateCd" id="affiliateCd" class="pl-0 trans-bg"  maxlength="10" title="제휴 코드 입력란" onchange="fn_affiliateCng()" placeholder="제휴 코드를 입력해주세요">
<!--                 <input type="text" name="affiliateCd" id="affiliateCd" class="type03 w280"  maxlength="10" title="제휴코드 입력란" onchange="fn_affiliateCng()" placeholder="제휴코드를 입력해주세요"> -->
                <input type="hidden" name="affiliateCdChkYn" id="affiliateCdChkYn">
                <button type="button" class="dark-line border trans-bg inset-xs align-middle" id="btnaffiliateCdCheck" onclick="fn_affiliateCodePop()">코드 확인</button>
              </div>
                <p class="validation type03 w754" style="display: none" id="affiliateCdTxt" btnChk="0">
				</p>
            </div>


            <div class="submit layout-c">
              <label for="employee-code"><span class="black">임직원 코드</span></label>
              <div class="layout-r border-bottom">
                <input type="text" name="officerCd" id="officerCd" class="pl-0 trans-bg"  maxlength="10" title="임직원 코드 입력란" placeholder="임직원 코드를 입력해주세요" data-json-obj="true" onkeyup="evManager.officerCdChk();">
                <input type="hidden" name="officerCdChkYn" id="officerCdChkYn">
                <button type="button" class="dark-line border trans-bg inset-xs align-middle" id="btnEmployeeCdCheck">코드 확인</button>
                <p class="validation type03 w754" style="display: none" id="employeeCdTxt" btnChk="0">
				</p>
              </div>
            </div>
            
          </div>
          <!-- //부가정보 -->

          <div class="layout-r same-size">
            <button type="button" class="inset-m full-width btn-gray-light" id="btnCancel">취소</button>
            <button type="button" class="inset-m full-width btn-primary" id="btnJoin">수정</button>
          </div>
          </form>
        </main>
      </div>
		<!--subContentsWrap-->
	<!--  subFrm End -->

	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">		<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value="${sEncData}">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다.
			해당 파라미터는 추가하실 수 없습니다. -->
		<input type="hidden" name="param_r1" value="">
		<input type="hidden" name="param_r2" value="">
		<input type="hidden" name="param_r3" value="">
	</form>

	<form id="userinfo_form" name="userinfo_form" method="post" accept-charset="UTF-8">

		<!-- 약관동의 관련 데이터  -->
		<%--<input type="hidden" id="receptionSms" name="receptionSms" value="${receptionSms}"/>
		<input type="hidden" id="receptionPhone" name="receptionPhone" value="${receptionPhone}"/>
		<input type="hidden" id="receptionEmail" name="receptionEmail" value="${receptionEmail}"/>
		<input type="hidden" id="receptionAdress" name="receptionAdress" value="${receptionAdress}"/>
		<input type="hidden" id="receptionKakao" name="receptionKakao" value="${receptionKakao}"/>

		<!-- 마케팅동의 관련 데이터 -->
		<input type="hidden" id="receptionMarketingFirst" name="receptionMarketingFirst" value="${receptionMarketingFirst}"/>
		<input type="hidden" id="receptionMarketingSecond" name="receptionMarketingSecond" value="${receptionMarketingSecond}"/> --%>

		<!-- 간편로그인 관련 데이터  -->
		<input type="hidden" id="viewGbn" name="viewGbn" value="${viewGbn}" />
		<input type="hidden" name="snsGbn" id="snsGbn" value="${snsGbn}">
		<input type="hidden" name="snsid" id="snsid" value="${snsid}">

		<!-- 실명인증 관련 관련 데이터  -->
		<input type="hidden" name="diVal" 		id="diVal" value="">   			<!-- 실명인증 고유값 		-->
		<input type="hidden" name="ciVal" 		id="ciVal" value="">   			<!-- 실명인증 고유값 		-->
		<input type="hidden" name="vnVal" 		id="vnVal" value="">   			<!-- 실명인증 고유값		-->
		<input type="hidden" name="custNm" 		id="custNm" value=""> 			<!-- 실명인증 이름    		-->
		<input type="hidden" name="phone"  		id="phone" value="">			<!-- 실명인증 핸드폰번호 	-->
		<input type="hidden" name="gendCd"  	id="gendCd" value=""> 			<!-- 실명인증 회원성별	-->
		<input type="hidden" name="legrBrthYmd" id="legrBrthYmd" value="">  	<!-- 실명인증 회원생일 	-->
		<input type="hidden" name="frgnCd" 		id="frgnCd" value="">  	<!-- 실명인증 회원생일 	-->
	</form>


<!-- layerPopup > 제휴코드 인증 // -->
<div class="popupWrap md-modal md-effect-1" id="modal-affiliatecode">
	<div class="modal-inner">
		<!-- md-show -->
		<header class="noLine">
			<a href="javascript:fn_CancelCert();" class="layPopClose md-close"></a>
		</header>

		<div class="numberSearch">
			<label for="nonCustOrder">개별코드 인증</label>
		</div>

		<!--contents-->
		<div class="popContents">

			<div class="input-item">
				<input type="text" placeholder="인증코드(대소문자구분)를 입력해 주세요." id="indvAffiliateCode" maxlength="12">
			</div>
			<div class="btnArea">
				<button type="button" class="type04 w100per" onclick="fn_indvCert()">인증하기</button>
			</div>
			<ul><!-- 
				<li>주문 시, 입력하신 이름/휴대폰 번호와 <br/>주문을 완료 후 발급된 주문번호를 입력해 주세요.</li>
				<li>주문번호를 잊으신 경우 넥스트레벨 고객센터 <br/> 1855-0100으로 문의해 주시기 바랍니다.</li>
				 -->
				<li>개별인증코드를 대소문자 구분 후 <br>입력해 주세요.</li>
				<li>개별인증코드 인증 후 할인혜택이 자동 적용됩니다.</li>
				<!-- 
				<li>개별인증코드를 잊으신 경우, <br>NEXT LEVEL 홈페이지 內 1:1 문의를 남겨주세요.</li>
				-->  
			</ul>

		</div>
		<!--contents-->
	</div>
</div>

	<!-- layerPopup // -->
	<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-11"> <!-- md-show -->
		<!-- phoneAccessFrm Start -->
		<form name="phoneAccessFrm" method="post" >
			<input type="hidden" id="resCd" name="resCd" />
			<input type="hidden" id="resDetail" name="resDetail" />
			<input type="hidden" id="resSeq" name="resSeq" data-json-obj="true" />
			<input type="hidden" id="phnYn" name="phnYn" />
		<div class="popContents">
			<a href="#" class="layPopClose md-close"></a>
			<header class="noLine">
				<h2>휴대폰 인증</h2>
			</header>
		    <div class="popup-contents">
		      <div class="inset-l">
		        <p>원활한 서비스 제공의 위한 휴대폰 인증을 진행하고 있습니다.<br>입력하신 휴대전화로 발송된 인증번호를 입력해주세요.</p>

		        <h3 class="content-title">인증번호</h3>

		        <div class="layout-r border-bottom">
		          <input type="text" name="accessNum" id="accessNum" class="pl-0 trans-bg" title="인증번호 입력란" placeholder="인증번호를 입력하세요" maxlength="10" onkeyup="validNumberCheck.keyUp(event);" data-json-obj="true">
		          <button type="button" class="dark-line border trans-bg inset-xs pl-m pr-m align-middle" id="certiReSend">재전송</button>
		        </div>

		        <p class="validation mt-s">
		          <span>인증번호 발급이 필요한 경우 재전송 버튼을 클릭해주세요.</span>
		        </p>

		      </div>
		    </div>
		    <div class="btnArea layout-r same-size bottom-box">
              <button type="button" class="inline inset-m btn-gray-light" id="certiPhoneCancel">취소<i class="ico01"></i></button>
              <button type="button" class="inline inset-m btn-primary" id="certiPhoneConfirm">확인<i class="ico01"></i></button>
		    </div>

		</div>
		</form>
	</div>
	<!-- phoneAccessFrm End -->
	<!-- layerPopup // -->

	<div class="md-overlay"></div>


<script type="text/javascript" src="/js/lib/classie.js"></script>

<script type="text/javascript">
var userLoginId = "${userLoginId}";
var snsid = "${snsid}";
var snsGbn = "${snsGbn}";
var usrType = "${usrType}";
var haveCarCnt =0;
var carNoArr = new Array();
var jusoGbn = "";
var mountCheck1 = "";	//현재 선택 된 장착서비스 유형 --- footer.jsp 우편번호 사용을 위해 추가

/* evManager Start */
var evManager = {
		fileData01 : ""	//사업자등록사본
		,
		fileData02 : ""	//통장사본 (개인사업자 or 법인
		,
		fileData03 : ""	//차량등록증사본 (개인사업자 or 법인)
		,
		niceGradeCd : new Array()
		,
		init : function(){
			ComUtil.loading();

			if (usrType != "S") {
				// 일반회원 로그인의 경우
				$("#memberTp1").show();
				$("#memberTp2").hide();
				$("#memberTp3").hide();
			} else {
				// SNS 로그인의 경우 화면 변경
				$("#memberTp1").hide();
				$("#memberTp2").show();
				$("#memberTp3").hide();
			}

			//대표생일
			evManager.setBirth();
			// 차량정보 년월
			evManager.setYYYYMM();

			// 년도 option 생성
			getYearSelect('year');
			// 월 option 생성
			getMonSelect('mon');

			// 조회 URL
			var pUrl = "/mypage/selectMemberInfo";
			// kjlee 법인 테스트 : vim789090
			var pParams = {
					sCustId 		: userLoginId
					//sCustId 		: 'vim789090'
			};
			cfnSendRequest(pUrl,pParams,'selectMemberInfo');

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
			  			$("#fileFlag01").val("C");
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
			  			alert("[통장사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.")
			  		} else {
			  			$("#fileFlag02").val("C");
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
			  			alert("[차량등록증사본] 첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.")
			  		} else {
			  			$("#fileFlag03").val("C");
			  			evManager.fileData03 = data.files;
			  		}
				}
				,
			  	maxfilesize : 1000000
			});

		}
		,
		//공통 AJAX 호출
		commonAjax : function(url, param, callback , gbn) {
			$.ajax({
			    url: url,
			    type: "POST",
			    cache:false,
			    data: JSON.stringify(param),
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data != null) {
			    		callback(data , gbn);
			    	}
			    },
			    error: function (request, status, error) {
			    	callBackManager.error(error)

				}
			});
			// end tag -- common ajax call
		}
		,
		listParam : function () {
			var frm = document.frm;
			var custDivCd = $('#custDivCd').val();

			var param =	$("#frm").serializeObject(
		            $("#frm").serializeArrayInSelector("[data-json-obj='true']")
		    	);
			if ($('input:checkbox[id="cagYn1"]').is(":checked")) {
				//param["receptionSms"] = "Y";
				param["cagYn1"] = "Y";
			}else {
				param["cagYn1"] = "N";
			}
			if ($('input:checkbox[id="cagYn2"]').is(":checked")) {
				//param["receptionPhone"] = "Y";
				param["cagYn2"] = "Y";
			}else {
				param["cagYn2"] = "N";
			}
			if ($('input:checkbox[id="cagYn3"]').is(":checked")) {
				//param["receptionEmail"] = "Y";
				param["cagYn3"] = "Y";
			}else {
				param["cagYn3"] = "N";
			}
			// 10233006 알림톡 추가
			if ($('input:checkbox[id="cagYn5"]').is(":checked")) {
				//param["receptionKakao"] = "Y";
				param["cagYn5"] = "Y";
			}else {
				param["cagYn5"] = "N";
			}
			//param["receptionAdress"] = "N";
			param["cagYn4"] = "N";
			
			// 전체 동의 선택
			if( param["cagYn1"] == "Y" && param["cagYn2"] == "Y" 
			  && param["cagYn3"] == "Y" && param["cagYn5"] == "Y" ) {
				param["cagYn"] = "Y";
			}else {
				param["cagYn"] = "N";
			}
			
			if ($('input:checkbox[id="magYn1"]').is(":checked")) {
				//param["receptionMarketingFirst"] = "Y";
				param["magYn1"] = "Y";
			}else {
				param["magYn1"] = "N";
			}
			if ($('input:checkbox[id="magYn2"]').is(":checked")) {
				//param["receptionMarketingSecond"] = "Y";
				param["magYn2"] = "Y";
			}else {
				param["magYn2"] = "N";
			}

			// 임직원확인코드
			param["officerCd"] = $('#officerCd').val();

			// 법인/사업자의 경우
			if (custDivCd == '2') {
				// 대표전화번호
				param["phone01"] = $('#Cphone01').val();
				param["phone02"] = $('#Cphone02').val();
				param["phone03"] = $('#Cphone03').val();

				// 회사전화
				param["cPhone01"] = $('#CcPhone01').val();
				param["cPhone02"] = $('#CcPhone02').val();
				param["cPhone03"] = $('#CcPhone03').val();

				// 담당자휴대전화
				param["rPhone01"] = $('#CrPhone01').val();
				param["rPhone02"] = $('#CrPhone02').val();
				param["rPhone03"] = $('#CrPhone03').val();
				param["custNm"] = $('#CcustNm').val();
				
				// 사업자번호
				param["bizRegNo"] = $("#bizRegNo").val();
			}
			
			//diVal
			param["diVal"] = $('#diVal').val();

			return param;
		}
		,
		// 임직원 코드 onkeyup
		officerCdChk : function() {
			$("#officerCdChkYn").val("");

		}
		,
		// 본인휴대전화 코드 onkeyup
		phoneChkYn : function() {
			$("#phoneChkYn").val("N");
		}
		,
		// 실사용효대전화 코드 onkeyup
		rPhoneChkYn : function() {
			$("#rPhoneChkYn").val("N");
		}
		,
		//가입하기 버튼 활성화
		btnDisabled : function() {
			isBtnDisabled = true;

			//ID 중복 체크
			/*
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
			if($("#cPhone02").val().length < 4) {
				isBtnDisabled = false;
			}

			if(isBtnDisabled) {
				$("#btnJoin").removeClass();
				$("#btnJoin").addClass("type01 w400");
				$("#btnJoin").removeAttr("disabled");
			} else {
				$("#btnJoin").removeClass();
				$("#btnJoin").addClass("type02 w400");
				$("#btnJoin").prop("disabled", true);
			} */

		}
		,
		//한글 입력 방지
		noKorean : function(str) {
// 			return str.replace(/[^a-zA-Z0-9]/gi, "");
			return str.replace(/[^a-zA-Z0-9._-]/gi, "");
		}
		,
		//pass keyUpEvent
		pwdValidation : function(){
			$('#custPwdTxt1').attr("btnChk" , "0");

			// 비밀번호
			var custNewPwd = $("#custNewPwd").val();
			var custNewRePwd = $("#custNewRePwd").val();
			if(custNewPwd.length == 0){
				$('#custPwdTxt1').html('<span><i class="ico07"></i></span>');
			}
			if(!ValidUtil.pwCheckNumAlpha(custNewPwd) && !ValidUtil.pwCheckNumFnAlpha(custNewPwd)){
				$('#custPwdTxt1').html('<span><i class="ico07"></i>영문,숫자를 포함하여 10 ~ 20자 또는 특수문자,영문,숫자를 포함하여 8 ~ 20자를 입력해 주세요.</span>');
			}
			else{
				$('#custPwdTxt1').html('<span><i class="ico07"></i>확인 되었습니다.</span>');
				$('#custPwdTxt1').attr("btnChk" , "1");
			}
			
			$('#custPwdTxt1').show();

		}
		,
		//pass(비밀번호 확인) keyUpEvent
		pwdValidation2 : function(){
			$('#custPwdTxt2').attr("btnChk" , "0");
			
			// 비밀번호
			var custNewPwd = $("#custNewPwd").val();
			var custPwd2 = $("#custNewRePwd").val();

			if($('#custPwdTxt1').attr("btnChk") == "0") {
				alert('비밀번호를 다시 입력해주세요.');
				$('#custNewPwd').focus();
				if(!ValidUtil.isEmpty($("#custNewRePwd").val())) {
					$("#custNewRePwd").val("");
				}
			}
			
			if(custNewPwd == ""){
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
			}
			else if(custNewPwd !="" && custNewPwd != custPwd2){
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
			}
			else{
				$('#custPwdTxt2').html('<span><i class="ico07"></i>확인 되었습니다.</span>');
				$('#custPwdTxt2').attr("btnChk" , "1");
			}
			$('#custPwdTxt2').show();
		}
		,
		validation : function() {

			if (ValidUtil.isEmpty($('#custId').val())){
				alert("아이디를 확인해주세요.");
				return false;
			}
			// 개인 : 1 , 사업자 2
			var custDivCd = $('#custDivCd').val();

			//이메일
			var email = $("#email01").val() + "@" + $("#email02").val();
			$("#email").val(email);

			if (custDivCd == "1") {
				// 개인
				var officerCd = $("#officerCd").val();
				var officerCdChkYn = $("#officerCdChkYn").val();
				var phone01 = $("#phone01").val();
				var phone02 = $("#phone02").val();
				var phone03 = $("#phone03").val();
				var phoneChkYn = $("#phoneChkYn").val();
				var rPhone01 = $("#rPhone01").val();
				var rPhone02 = $("#rPhone02").val();
				var rPhone03 = $("#rPhone03").val();
				var rPhoneChkYn = $("#rPhoneChkYn").val();

				if (!ValidUtil.isEmpty(officerCd)){
					if (ValidUtil.isEmpty(officerCdChkYn)){
						alert("임직원코드 확인을 하여 주십시요.");
						return false;
					}
				}

				// 본인인증 진행  
				if (ValidUtil.isEmpty(phone01)
						|| ValidUtil.isEmpty(phone02)
						|| ValidUtil.isEmpty(phone03)
						){
					alert("본인 인증 번호는 필수 입니다.");
					$("#phone01").focus();
					return false;
				}
				if (!ValidUtil.isEmpty(phone01)
						|| !ValidUtil.isEmpty(phone02)
						|| !ValidUtil.isEmpty(phone03)
						){
					if (phoneChkYn != "Y") {
						alert("본인 인증이 필요합니다.");
						return false;
					}
				}

				// 실사용번호 인증체크
				if (!ValidUtil.isEmpty(rPhone02) || !ValidUtil.isEmpty(rPhone03)){
					if (rPhoneChkYn != "Y") {
						alert("실사용번호 인증이 필요합니다.");
						return false;
					}
				}

			} else {
				// 사업자
				//대표자 휴대전화
				var phone = $("#Cphone01").val() + "-" + $("#Cphone02").val() + "-" + $("#Cphone03").val();
				$("#phone").val(phone);
				//회사번호
				var cPhone = $("#CcPhone01").val() + "-" + $("#CcPhone02").val() + "-" + $("#CcPhone03").val();
				$("#cPhone").val(cPhone);
				//담당자 휴대 전화
				var mPhone = $("#CrPhone01").val() + "-" + $("#CrPhone02").val() + "-" + $("#CrPhone03").val();
				$("#mPhone").val(mPhone);
				
				var officerCd = $("#officerCd").val();
				var officerCdChkYn = $("#officerCdChkYn").val();
				
				if (!ValidUtil.isEmpty(officerCd)){
					if (ValidUtil.isEmpty(officerCdChkYn)){
						ComUtil.alert("임직원코드 확인을 하여 주십시요.");
						return false;
					}
				}

				if( ValidUtil.isEmpty($('#bizRegNm').val()) ){
					alert("법인명을 확인해주세요.");
					$("#bizRegNm").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#CcustNm').val()) ){
					alert("대표자명을 확인해주세요.");
					$("#CcustNm").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#bizType').val()) ){
					alert("업종을 확인해주세요.");
					$("#bizType").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#bizCondition').val()) ){
					alert("업태를 확인해주세요.");
					$("#bizCondition").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#legalBrthYY').val())
						|| ValidUtil.isEmpty($('#legalBrthMM').val())
						|| ValidUtil.isEmpty($('#legalBrthDD').val())
						) {
					alert("대표자 생년월일을 확인해주세요.");
					$("#legalBrthYY").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#Cphone01').val())
						|| ValidUtil.isEmpty($('#Cphone02').val())
						|| ValidUtil.isEmpty($('#Cphone03').val())
						) {
					alert("대표자 휴대폰번호를 확인해주세요.");
					$("#phone01").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#CcPhone01').val())
						|| ValidUtil.isEmpty($('#CcPhone02').val())
						|| ValidUtil.isEmpty($('#CcPhone03').val())
						) {
					alert("회사번호를 확인해주세요.");
					$("#cPhone01").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#CrPhone01').val())
						|| ValidUtil.isEmpty($('#CrPhone02').val())
						|| ValidUtil.isEmpty($('#CrPhone03').val())
						) {
					alert("담당자 휴대폰번호를 확인해주세요.");
					$("#mPhone01").focus();
					return false;
				}
				else if( ValidUtil.isEmpty($('#perCharge').val()) ){
					alert("담당자명을 확인해주세요.");
					$("#perCharge").focus();
					return false;
				}
				/*
				else if(!$("input[name='gendCd']").is(":checked") ){
					alert("대표자 성별을 확인해주세요.");
					return false;
				} 
				*/

				//첨부 파일 유효성 - 사업자
				//파일 사이즈 단위만 - 파일 사이즈에 따라 파일 정보 그려 주는게 틀리다.
				/*
				var fileFlag01 = $("#fileFlag01").val();
				var i=0;
				if (fileFlag01 != "Y") {

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

				}

				var fileFlag02 = $("#fileFlag02").val();
				if (fileFlag02 != "Y") {
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
				}

				var fileFlag03 = $("#fileFlag03").val();
				if (fileFlag03 != "Y") {
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
				}
				 */
			}

/* 			else if( ValidUtil.isEmpty($('#custPwd').val()) || ValidUtil.isEmpty($('#custNewRePwd').val()) ){
				alert('비밀번호를 확인해주세요.');
				return false;
			} */

			if (ValidUtil.isEmpty($('#email01').val()) && ValidUtil.isEmpty($('#email02').val())){
// 				alert('이메일을 확인해주세요.');
// 				$("#email").focus();
// 				return false;
			} else {
				if(!ValidUtil.mail($('#email').val())){
					alert('이메일을 확인해주세요.');
					$("#email").focus();
					return false;
				}
			}
			
			/* if( ValidUtil.isEmpty($('#custNewPwd').val()) || ValidUtil.isEmpty($('#custNewRePwd').val()) ){
				alert('비밀번호를 확인해주세요.');
				return false;
			} */
			if($('#custNewPwd').val() != $('#custNewRePwd').val()){
				alert('비밀번호를 확인해주세요.');
				$('#custNewRePwd').val("");
				$('#custPwdTxt2').html('<span><i class="ico07"></i>비밀번호가 일치하지 않습니다.</span>');
				
				return false;
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
			yyyyOption += "<option value='' selected>년도</option>";
			for(i= (yyyy-90); i <= yyyy; i++) {
				yyyyOption += "<option value='"+i+"'>"+i+" 년</option>";
			}
			$("#legalBrthYY").html(yyyyOption);

			//월
			var mmOption = "";
			mmOption += "<option value='' selected>월</option>";
			for(var i=1; i<13; i++) {
				if(i > 9){
					mmOption += "<option value='"+i+"'>"+i+" 월</option>";
				} else {
					mmOption += "<option value='0"+i+"'>0"+i+" 월</option>";
				}
			}
			$("#legalBrthMM").html(mmOption);

			// 일
			var ddOption = "";
			ddOption += "<option value='' selected> 일</option>";
			for(var i=1; i<32; i++) {
				if(i > 9){
					ddOption += "<option value='"+i+"'>"+i+" 일</option>";

				}else{
					ddOption += "<option value='0"+i+"'>0"+i+" 일</option>";
				}
			}
			$("#legalBrthDD").html(ddOption);
		}
		,
		//차량 구매년월
		setYYYYMM : function() {
			//오늘 날짜
			var today = DateUtil.toYyyyMmDd(new Date());
			var yyyy = today.substring(0,4);
			var mm = today.substring(4,6);
			var dd = today.substring(6,8);

			//년도
			var yyyyOption = "";
			yyyyOption += "<option value='' selected>년도</option>";
			for(i= (yyyy-90); i <= yyyy; i++) {
				yyyyOption += "<option value='"+i+"'>"+i+" 년</option>";
			}
			$("#year").html(yyyyOption);

			//월
			var mmOption = "";
			mmOption += "<option value='' selected>월</option>";
			for(var i=1; i<13; i++) {
				if(i > 9){
					mmOption += "<option value='"+i+"'>"+i+" 월</option>";
				} else {
					mmOption += "<option value='0"+i+"'>0"+i+" 월</option>";
				}
			}
			$("#mon").html(mmOption);
		}
		,
		//임직원 여부 조회
		employeeCdCheck : function () {
			if($("#officerCd").val() == ""){
				alert("임직원코드를 입력하세요.");
				return false;
			}

			//common ajax call
			var pUrl = "/member/employeeCdCheck";
			var pParams = { employeeCd : $("#officerCd").val() };

			cfnSendRequest(pUrl,pParams,'employeeCdCheck');

		}
		,
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

			// 개인 : 1 , 사업자 2
			var custDivCd = $('#custDivCd').val();

			//폼객체를 불러와서
	        //var form = $('form')[0];
	        var pUrl = "/mypage/updateMemberInfo";
	        var pParams = evManager.listParam();
        	cfnSendRequest(pUrl,pParams,'updateMemberInfo');

        	// 파일 업로드 custDivCd : 2인 경우
        	if (custDivCd == '2') {
				$("#attchCustNo").val($("#custNo").val());
				$("#attchCustId").val($("#custId").val());
        		var form = $('form')[1];
        		var param = new FormData(form);

        		//파일 정보
 	        	param.append("bizFiles1", evManager.fileData01[0]);	//사업자
 	        	param.append("bizFiles2", evManager.fileData02[0]);	//통장
 	        	param.append("bizFiles3", evManager.fileData03[0]);	//차량 등록 증
 	        	$.ajax({
 		            type: "POST",
 		            enctype: false,
 		            url: "/mypage/updateMemberInfoFile",
 		            data: param,
 		            cache: false,
 		            processData: false,
 		            contentType: false,
 		            success: function (data) {
 		            	/* if(data.rtnCode == "0" ) {
 		                	var frm = document.frm;
 				        		frm.action = "/member/custInfoComp";
 				        		frm.submit();
 		                } else {
 		                	alert(data.rtnMsg);
 		                	return;
 		                } */
 		            	evManager.init();
 		            },
 		            error: function (e) {
 		                console.log("ERROR : ", e);
 		            }
 		        });
        	}
		}
	}
	/* evManager End */

	/* ################################# AJAX CALLBACK ARAR #################################  */
	var callBackManager = {
		//에러 처리
		error : function(error) {
			console.log('error callback : ' + error);
		}
		,
		//나이스 dnr 모델 선택 팝업
		niceGradeList : function(data){
			//완료 팝업 생성
			$("#niceResultCarNo").val($("#carNumber").val().replace(/(\s*)/g, ""));	//타이틀
			var htmlStr = "";
				htmlStr +="	<div class='infoView'>";
				htmlStr +="		<ul>";
				htmlStr +="			<li>";
				htmlStr +="				<span class='tit'>제조사/차종</span>";
				htmlStr +="				<span class='info'>"+data.carInfo.BRAND_NM +"/"+data.carInfo.REP_CAR_CLASS_NM  +"</span>";
				htmlStr +="			</li>";
				htmlStr +="			<li>";
				htmlStr +="				<span class='tit'>모델</span>";
				htmlStr +="				<span class='info'>"+data.carInfo.CAR_CLASS_NM +"</span>";
				htmlStr +="			</li>";
				htmlStr +="			<li>";
				htmlStr +="				<span class='tit'>엔진타입</span>";
				htmlStr +="				<span class='info'>"+data.carInfo.ENGINE_FORM +"</span>";
				htmlStr +="			</li>";
				htmlStr +="			<li>";
				htmlStr +="         	<button type='button' class='type10 w220' id='btnNiceTireSize' gradeCd="+data.carInfo.CAR_CLASS_NBR +">타이어 사이즈 선택<i class='ico01'></i></button>";
				/* htmlStr +="         	<button type='button' class='type10 w220' id='btnNiceTireSize' gradeCd='42497'>타이어 사이즈 선택<i class='ico01'></i></button>"; */
				htmlStr +="         </li>";
				htmlStr +="		</ul>";
				htmlStr +="	</div>";
				htmlStr +="		<div class='productView'>";
				htmlStr +="		<img src='"+data.carInfo.CAR_CLASS_REP_IMAGE+"' alt='상품사진'/>";
				htmlStr +="	</div>";
			$("#niceResultArea").html(htmlStr);

			//화면 disabled
			$("#modal-2").removeClass("md-show");
			$("#niceResult").addClass("md-show");
		}
		,
		//나이스 dnr 사이즈 선택 팝업 화면
		selectNiceTireSizeList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(i > 0 && (i % 5 == "0") ){
					htmlStr	+= "</ul>";
				}

				if(i == "0" || i % 5 == "0"){
					htmlStr	+= "<ul class='sizeSelect'>";
				}
				htmlStr	+= "<li>";
				htmlStr	  += "   <input type='radio' name='sizeCd' id='sizeCd" + (i+1) + "' value='"+data[i].searchCd+"' sizeNm='"+data[i].description + " "+ data[i].searchCdNm+"' classCd='"+data[i].classCd+"' plyRating='"+data[i].plyRating+"' searchClCd='"+data[i].searchClCd+"' modelCd='"+data[i].modelCd+"' class='type04'><label for='sizeCd"+(i+1)+"'><span>"+ data[i].searchCdNm + "</span></label>";
				htmlStr	+= "</li>";
			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";
			$("#niceTireSizeArea").html();
			$("#niceTireSizeArea").html(htmlStr);

			$("#niceSizeCarNo").val($("#carNumber").val().replace(/(\s*)/g, ""));
			$("#carNo").val($("#carNumber").val().replace(/(\s*)/g, ""))

			$("#niceResult").removeClass("md-show");
			$("#niceTireSize").addClass("md-show");
			$("#niceTireSizeArea").show();
		}
		,
		//제조사 선택 팝업
		makerList : function(data){
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(i > 0 && (i % 7 == "0") ){
					htmlStr	+= "</ul>";
				}
				if(i == "0" || i % 7 == "0"){
					htmlStr	+= "<ul class='sizeSelect type02'>";
				}
				htmlStr	+= "<li>";
				htmlStr	  += "   <input type='radio' name='makerCd' id='makerCd" + (i+1) + "' value='"+data[i].searchCd+"' makerNm='"+data[i].searchCdNm+"' class='type05'><label for='makerCd" + (i+1) + "'><span><img src='<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>/" + data[i].searchCd + ".png '  alt='"+data[i].searchCdNm+"'/></span></label>";
				htmlStr	+= "</li>";

			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";

			$("#searchClCdArea").html(htmlStr);

			//화면 disabled
			$("#modal-1").removeClass("md-show");
			$("#modal-3").addClass("md-show");
			$(".scrollBox").eq(0).show();
		}
		,
		//모델 선택 팝업
		selectModelList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(i > 0 && (i % 5 == "0") ){
					htmlStr	+= "</ul>";
				}

				if(i == "0" || i % 5 == "0"){
					htmlStr	+= "<ul class='sizeSelect'>";
				}
				htmlStr	+= "<li>";
				htmlStr	  += "   <input type='radio' name='modelCd' id='modelCd" + (i+1) + "' value='"+data[i].searchCd+"' modelNm='"+data[i].searchCdNm+"' classCd='"+data[i].classCd+"' class='type04 w300'><label for='modelCd"+(i+1)+"'><span>"+data[i].searchCdNm+"</span></label>";
				htmlStr	+= "</li>";
			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";

			$("#modelArea").html();
			$("#modelArea").html(htmlStr);

			var titleHtmlStr = "";
			titleHtmlStr += "<ul>";
			titleHtmlStr += "<li>" + $("#makerNm").val() + "</li>";
			titleHtmlStr += "<li></li>";
			titleHtmlStr += "</ul>";
			$("#modal-4").children(".sizeSelectView").html(titleHtmlStr);

			$("#modal-3").removeClass("md-show");
			$("#modal-4").addClass("md-show");
			$(".scrollBox").eq(1).show();
		}
		,
		//사이즈 선택 팝업
		selectTireSizeList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(i > 0 && (i % 5 == "0") ){
					htmlStr	+= "</ul>";
				}

				if(i == "0" || i % 5 == "0"){
					htmlStr	+= "<ul class='sizeSelect'>";
				}
				htmlStr	+= "<li>";
				htmlStr	  += "   <input type='radio' name='sizeCd' id='sizeCd" + (i+1) + "' value='"+data[i].searchCd+"' sizeNm='"+data[i].description + " "+ data[i].searchCdNm+"' classCd='"+data[i].classCd+"' plyRating='"+data[i].plyRating+"' class='type04'><label for='sizeCd"+(i+1)+"'><span>"+ data[i].description+ " " + data[i].searchCdNm + "</span></label>";
				htmlStr	+= "</li>";
			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";

			$("#sizeArea").html();
			$("#sizeArea").html(htmlStr);

			var titleHtmlStr = "";
			titleHtmlStr += "<ul>";
			titleHtmlStr += "<li>" + $("#makerNm").val() + "</li>";
			titleHtmlStr += "<li>" + $("#modelNm").val() + "</li>";
			titleHtmlStr += "<li></li>";
			titleHtmlStr += "</ul>";
			$("#modal-5").children(".sizeSelectView").html(titleHtmlStr);

			$("#modal-4").removeClass("md-show");
			$("#modal-5").addClass("md-show");
			$(".scrollBox").eq(2).show();
		}
		,
		//단면폭
		selectWidthList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(i > 0 && (i % 5 == "0") ){
					htmlStr	+= "</ul>";
				}

				if(i == "0" || i % 5 == "0"){
					htmlStr	+= "<ul class='sizeSelect'>";
				}
				htmlStr	+= "<li>";
				htmlStr	  += "   <input type='radio' name='sectionWidth' id='sectionWidth" + (i+1) + "' value='"+data[i].searchCd+"' class='type04'><label for='sectionWidth"+(i+1)+"'><span>"+ data[i].searchCdNm + "</span></label>";
				htmlStr	+= "</li>";
			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";

			$("#sectionWidthArea").html(htmlStr);

			$("#modal-5").removeClass("md-show");
			$("#modal-6").addClass("md-show");
			$(".scrollBox").eq(3).show();
		}
		,
		//편평비
		selectFlatnessList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(data[i].searchCd != "Z") {
					if(i > 0 && (i % 5 == "0") ){
						htmlStr	+= "</ul>";
					}

					if(i == "0" || i % 5 == "0"){
						htmlStr	+= "<ul class='sizeSelect'>";
					}
					htmlStr	+= "<li>";
					htmlStr	  += "   <input type='radio' name='aspectRatio' id='aspectRatio" + (i+1) + "' value='"+data[i].searchCd+"' class='type04'><label for='aspectRatio"+(i+1)+"'><span>"+ data[i].searchCdNm + "</span></label>";
					htmlStr	+= "</li>";
				}
			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";

			$("#aspectRatioArea").html(htmlStr);

			var titleHtmlStr = "";
			titleHtmlStr += "<ul>";
			titleHtmlStr += "<li>" + $("#sectionWidth").val() + "</li>";
			titleHtmlStr += "<li></li>";
			titleHtmlStr += "</ul>";
			$("#modal-7").children(".sizeSelectView").html(titleHtmlStr);

			$("#modal-6").removeClass("md-show");
			$("#modal-7").addClass("md-show");
			$(".scrollBox").eq(4).show();
		}
		,
		//인치
		selectInchList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='os-resize-observer-host'><div class='os-resize-observer observed' style='left: 0px; right: auto;'></div></div>";
			htmlStr	+= "<div class='os-padding'>";
			htmlStr	+= "<div class='os-viewport os-viewport-native-scrollbars-invisible' style='overflow-y: scroll; right: 0px; bottom: 0px;'>";
			htmlStr	+= "<div class='os-content' style='padding: 38px 0px 38px 25px; height: 100%; width: 100%;'>";
			for(var i=0; i < data.length; i++) {
				if(data[i].searchCd != "Z") {
					if(i > 0 && (i % 5 == "0") ){
						htmlStr	+= "</ul>";
					}

					if(i == "0" || i % 5 == "0"){
						htmlStr	+= "<ul class='sizeSelect'>";
					}
					htmlStr	+= "<li>";
					htmlStr	  += "   <input type='radio' name='inches' id='wheelInches" + (i+1) + "' value='"+data[i].searchCd+"' plyRating='"+data[i].plyRating+"' searchClCd='"+data[i].searchClCd+"' modelCd='"+data[i].modelCd+"' class='type04'><label for='wheelInches"+(i+1)+"'><span>"+ data[i].searchCdNm + "</span></label>";
					htmlStr	+= "</li>";
				}
			}
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "</div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='width: 100%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar os-scrollbar-vertical'><div class='os-scrollbar-track os-scrollbar-track-off'><div class='os-scrollbar-handle' style='height: 48.6692%; transform: translate(0px, 0px);'></div></div></div>";
			htmlStr	+= "<div class='os-scrollbar-corner'></div>";

			$("#wheelInchesArea").html(htmlStr);

			var titleHtmlStr = "";
			titleHtmlStr += "<ul>";
			titleHtmlStr += "<li>" + $("#sectionWidth").val() + "</li>";
			titleHtmlStr += "<li>" + $("#aspectRatio").val() + "</li>";
			titleHtmlStr += "</ul>";
			$("#modal-8").children(".sizeSelectView").html(titleHtmlStr);

			$("#modal-7").removeClass("md-show");
			$("#modal-8").addClass("md-show");
			$(".scrollBox").eq(5).show();
		}
	}
	/* ################################# AJAX CALLBACK ARAR #################################  */

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
	$("#bgFullImg").append("<div class='member-bg mynexen-modify'></div>");
	/* page background image End */

	$(".popupWrap").hide();

	evManager.init();

	// 임직원  확인 버튼 area!!
	$("#btnEmployeeCdCheck").on("click" , function(){
		evManager.employeeCdCheck();
	});
	// 임직원  중복 확인   area end!!

	// email select box change event area!!
	$("#email03").on("change" , function(){
		evManager.selectEmail();
	});
	// email select box change event area end!!

	// searchPtnCd select box change event area!!
	$("#searchPtnCd").on("change" , function(){
		$("#modelCd").val($(this).val());
	});
	// searchPtnCd select box change event area end!!

	//클릭시 이미지 크게 보기
	  $(".savePreview").on('click',"img" , function(){
		
		var path = $(this).attr("src");

		
		window.open(path);

		
	});  
	
	
	// 수정 버튼 area!!
	$("#btnJoin").on("click" , function(){
		//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();

		//입력 항목 체크
		if(!evManager.validation()) {
			return;
		}
		
		if($("#affiliateCd").val() != "" && $("#issCert").val() == ""){
			ComUtil.alert("제휴코드 인증을 받아주시길 바랍니다.");
			return false;
		}
		
		//회원 정보 저장
		evManager.bizCustSave();
	});
	// 수정   area end!!

	// 취소 버튼 area!!
	$("#btnCancel").on("click" , function(){
		location.href = "/main";
	});
	// 취소   area end!!

	// 첨부파일 닫기 버튼 area!!
	$(".fDel").click(function(){
		var bizFile = $(this).attr("bizFile");
		$(this).parent().hide();
		$('#'+bizFile).val('N');
	});
	// 첨부파일 닫기 버튼 area!! end!!

	// 보유차량정보 버튼 area!!
	$("[name='haveCarInfo']").click(function(){
		var chkVal = $(this).val();
		if (chkVal == '1') {
			$(".carNumberInputDiv").show();
			$(".carTypeInputDiv").hide();
		} else {
			$(".carNumberInputDiv").hide();
			$(".carTypeInputDiv").show();
		}
	});
	// 보유차량정보 버튼 area end!!

	// 실사용자휴대전화 인증 area!!
	$(".btnPhoneCerti").click(function(){
		//검샘 레이어 팝업 오픈
		var certiTp = $(this).attr("certiTp");
		var rPhone01;
		var rPhone02;
		var rPhone03;

		if (certiTp == "rPhone") {
			rPhone01 = $('#rPhone01').val();
			rPhone02 = $('#rPhone02').val();
			rPhone03 = $('#rPhone03').val();
		} else {
			rPhone01 = $('#CrPhone01').val();
			rPhone02 = $('#CrPhone02').val();
			rPhone03 = $('#CrPhone03').val();
		}

		if(rPhone01 != '' && rPhone02.length >= 3 && rPhone03.length == 4){

			$("#modal-11").addClass("md-show");

			var pUrl = "/mypage/requestMobileAccess";
			var pParams = {
				rPhone01 : rPhone01
				, rPhone02 : rPhone02
				, rPhone03 : rPhone03
			}

			cfnSendRequest(pUrl,pParams,'requestMobileAccess');

		}
	});
	// 실사용자휴대전화 인증 area end !!

	// 실사용자휴대전화 재전송 area!!
	$("#certiReSend").click(function(){

	});
	// 실사용자휴대전화 재전송 area end !!

	// 실사용자휴대전화 취소 area!!
	$("#certiPhoneCancel").click(function(){
		$("#modal-11").removeClass("md-show");
	});
	// 실사용자휴대전화 취소 area end !!

	// 실사용자휴대전화 확인 area!!
	$("#certiPhoneConfirm").click(function(){
		//검샘 레이어 팝업 오픈
		var resSeq = $('#resSeq').val();
		var accessNum = $('#accessNum').val();

		if (ValidUtil.isEmpty(accessNum)){
			alert('전송된 인증번호를 입력하십시오.');
			return false;
		} else {
			var pUrl = "/mypage/setMobileAccess";
			var pParams = {
				resSeq : resSeq
				, accessNum : accessNum
			}

			cfnSendRequest(pUrl,pParams,'setMobileAccess');
		}

	});
	// 실사용자휴대전화 확인 area end !!

	//차량 번호 검색 버튼 클릭 이벤트 > 나이스 DNR 연동
	$("#btnCarNumberSearch").on("click" , function(){
		$("#modal-carNumSearch").addClass("md-show");

		/*
		if($("#carNumber").val() == "") {
			alert("차량번호를 입력해 주세요.");
			return;
		} else {
			//차량번호 패턴
			var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 12저3456
			var pattern2       	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 123저3456 - 신규 찰야 번호
			var pattern3 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234

			if($("#carNumber").val().length == 7 ){
				if( !pattern1.test($("#carNumber").val()) ){
					alert( "차량번호를 확인하세요.");
					$("#carNumber").val("");
					$("#carNumber").focus();
					return false;
				}
			} else if( $("#carNumber").val().length == 8 &&  ValidUtil.isNumeric( $("#carNumber").val().substring(0,3))){
				if( !pattern2.test($("#carNumber").val()) ){
					alert( "차량번호를 확인하세요.");
					$("#carNumber").val("");
					$("#carNumber").focus();
					return false;
				}
			} else if( $("#carNumber").val().length == 8 || $("#carNumber").val().length == 9){
				if( !pattern2.test($("#carNumber").val()) ){
					alert( "차량번호를 확인하세요.");
					$("#carNumber").val("");
					$("#carNumber").focus();
					return false;
				}
			} else {
				alert( "차량번호를 확인하세요.");
				$("#carNumber").val("");
				$("#carNumber").focus();
				return false;
			}
		}

		//나이스 DNR 통신
		$.ajax({
		    url: "/product/niceDnrApi",
		    type: "POST",
		    cache:false,
		    data: {carNo:$("#carNumber").val()},
		    success: function(data) {
		    	ComUtil.unloading();

		    	if(data.code == "000") {
		    		for(var i=0; i<data.gradeList.length; i++) {
			    		evManager.niceGradeCd.push(data.gradeList[i].CAR_GRADE_NBR);
		    		}
					callBackManager.niceGradeList(data);

		    	} else if(data.code == "014") {
		    		alert("로그인을 해주세요")
		    	} else if(data.code == "014") {
		    		alert("로그인이 필요합니다. 로그인 화면으로 이동 하시겠습니까?");
			    	location.href = "/login/userLogin";
			    	return;
			    } else if(data.code == "022") {
			    	alert("차량번호 또는 소유자명 불일치");
			    	return;
			    } else {
			    	alert("시스템 오류");
			    	return;
			    }


		    },
		    error: function (request, status, error) {
				ComUtil.unloading();
		    	alert('에러 발생');
		    	//callBackManager.error(error)

			}
		}); */

	});
	// -- end tag

	//나이스 디엔알 검색 완료 화면 다음 버튼 - 사이즈 선택 화면 오픈
	$(document).on("click","#btnNiceTireSize" , function(){
		//사이즈 목록 조회
		var pUrl = "/product/selectTireSizeList";
		//var pSendData = {niceGradeCd:$(this).attr("gradeCd")};
		var pSendData = {niceGradeCd:evManager.niceGradeCd};
		evManager.commonAjax(pUrl, pSendData, callBackManager.selectNiceTireSizeList);
	});
	// -- end tag

	//제조사 선택 이벤트 > 모델 선택 화면 오픈
	$(document).on("click","input[name='makerCd']" , function(){
		$("#makerCd").val($(this).val());
		$("#makerNm").val($(this).attr("makerNm"));

		//모델 목록 조회
		var pUrl = "/product/selectModelList";
		var pSendData = {classCd : "", recomYn : "" , makerCd : $("#makerCd").val() , systemGbn:"R"};
		evManager.commonAjax(pUrl, pSendData, callBackManager.selectModelList);
	});
	// -- end tag

	//모델 선택 이벤트 > 사이즈 선택 화면 오픈
	$(document).on("click","input[name='modelCd']" , function(){
		$("#modelCd").val($(this).val().split("^")[0]);
		$("#contentsCd").val($(this).val().split("^")[1]);
		$("#modelNm").val($(this).attr("modelNm"));

		//사이즈 목록 조회
		var pUrl = "/product/selectTireSizeList";
		var pSendData = {modelCd : $("#modelCd").val() , contentsCd : $("#contentsCd").val(), recomYn : "" , classCd : "", niceGradeCd:"" , systemGbn:"R"};
		evManager.commonAjax(pUrl, pSendData, callBackManager.selectTireSizeList);
	});
	// -- end tag

	//단면폭 선택 이벤트 > 평편비 선택 화면 오픈
	$(document).on("click","input[name='sectionWidth']" , function(){
		$("#sectionWidth").val($(this).val());

		//사이즈 목록 조회
		var pUrl = "/product/selectFlatnessList";
		var pSendData = {sectionWidth : $("#sectionWidth").val() , recomYn : "" , classCd : "" , systemGbn:"R"};
		evManager.commonAjax(pUrl, pSendData, callBackManager.selectFlatnessList);
	});
	// -- end tag

	//평편비 선택 이벤트 > 인치 선택 화면 오픈
	$(document).on("click","input[name='aspectRatio']" , function(){
		$("#aspectRatio").val($(this).val());

		//사이즈 목록 조회
		var pUrl = "/product/selectInchList";
		var pSendData = {sectionWidth : $("#sectionWidth").val() , aspectRatio : $("#aspectRatio").val() , recomYn : "" , classCd : "" , systemGbn:"R"};
		evManager.commonAjax(pUrl, pSendData, callBackManager.selectInchList);
	});
	// -- end tag

});

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 * callback
 */
function cfnRequestSuccessCallback(callback, result) {
	var nexenCd = "nexentire";
	
	/* 보유차량 모두 삭제하는 경우 */
	if(callback == 'selectCustCarInfoList' && result.rtnCode == -1 && result.selectCustCarInfoList.length == 0){
		$("#carInfoDiv").empty();
	}
	
	if(result.rtnCode == 0) {
		if(callback == 'selectMemberInfo') {
			/* selectMemberInfo Start */
			var info = result.selectMemberInfo;
			if (info != null) {
				// 개인회원 /법인회원 화면 분리
				if (info.custDivCd == '1') {
					$(".personalDiv").show();
					$(".CorpDiv").hide();
				} else {
					$(".personalDiv").hide();
					$(".CorpDiv").show();

					$('#bizRegNo').val(info.bizRegNo);
					$('#bizRegNm').val(info.bizRegNm);
					$('#perCharge').val(info.perCharge);
					$('#bizType').val(info.bizType);
					$('#bizCondition').val(info.bizCondition);
					$('#bizCondition').val(info.bizCondition);
					$('#legalBrthYY').val(info.legalBrthYY);
					$('#legalBrthMM').val(info.legalBrthMM);
					$('#legalBrthDD').val(info.legalBrthDD);
					$('#gendCd').val(info.gendCd);

					// 대표전화번호
					$('#Cphone01').val(info.phone01);
					$('#Cphone02').val(info.phone02);
					$('#Cphone03').val(info.phone03);

					// 회사전화
					$('#CcPhone01').val(info.cPhone01);
					$('#CcPhone02').val(info.cPhone02);
					$('#CcPhone03').val(info.cPhone03);

					// 담당자휴대전화
					$('#CrPhone01').val(info.rPhone01);
					$('#CrPhone02').val(info.rPhone02);
					$('#CrPhone03').val(info.rPhone03);

					// 대표자명
					$('#CcustNm').val(info.custNm);
				}

				$('#custDivCd').val(info.custDivCd);  // 개인:1, 법인/사업자:2
				// 일반회원과 SNS회원간의 화면 변경
				$('#cPhone01').val(info.cPhone01);
				$('#cPhone02').val(info.cPhone02);
				$('#cPhone03').val(info.cPhone03);
				$('#carNum').val(info.carNum);
				$('#ciVal').val(info.ciVal);
				$('#custNo').val(info.custNo);
				$('#comDivCd').val(info.comDivCd);
				$('#custId').val(info.custId);
				$('#custNewPwd').val(info.custNewPwd);
				$('#custNewRePwd').val(info.custNewRePwd);
				$('#custNm').val(info.custNm);
				$('#custPwd').val(info.custPwd);
				$('#diVal').val(info.diVal);
				$('#email').val(info.email);
				$('#email01').val(info.email01);
				$('#email02').val(info.email02);
				$('#officerCd').val(info.officerCd);
				if($('#officerCd').val() != null){
					$('#officerCdChkYn').val("Y");
				}				
				$('#frgnCd').val(info.frgnCd);
				//$('#gendCd').val(info.gendCd);
				if(info.gendCd == "남") {
					$('#gendCd').val("1");
				}else {
					$('#gendCd').val("2");
				}
				
				$('#haveCarInfo').val(info.haveCarInfo);
				$('#legrBrthYmd').val(info.legrBrthYmd);

				// 주소정보
				$("#addr").val(info.addr);
				$("#detlAddr").val(info.detlAddr);
				$("#posNo").val(info.posNo);
				$("#bldMngNo").val(info.bldMngNo);
				if(info.addr == null && info.detlAddr == null){
					
				}
				else{
					$("#addrFull").val(info.addr + " " + info.detlAddr);
				}

				if (info.cagYn1 == 'Y') {
					$('input:checkbox[id="cagYn1"]').attr("checked", true);
				} else {
					$('input:checkbox[id="cagYn1"]').attr("checked", false);
				}
				if (info.cagYn2 == 'Y') {
					$('input:checkbox[id="cagYn2"]').attr("checked", true);
				} else {
					$('input:checkbox[id="cagYn2"]').attr("checked", false);

				}
				if (info.cagYn3 == 'Y') {
					$('input:checkbox[id="cagYn3"]').attr("checked", true);
				} else {
					$('input:checkbox[id="cagYn3"]').attr("checked", false);

				}
				if (info.cagYn4 == 'Y') {
					$('input:checkbox[id="cagYn4"]').attr("checked", true);
				} else {
					$('input:checkbox[id="cagYn4"]').attr("checked", false);

				}
				//10233006 알림톡 추가
				if (info.cagYn5 == 'Y') {
					$('input:checkbox[id="cagYn5"]').attr("checked", true);
				} else {
					$('input:checkbox[id="cagYn5"]').attr("checked", false);

				}
				if (info.magYn1 == 'Y') {
					$('input:checkbox[id="magYn1"]').attr("checked", true);
				} else {
					$('input:checkbox[id="magYn1"]').attr("checked", false);

				}
				if (info.magYn2 == 'Y') {
					$('input:checkbox[id="magYn2"]').attr("checked", true);
				} else {
					$('input:checkbox[id="magYn2"]').attr("checked", false);

				}

				$('#mon').val(info.mon);
				$('#phone01').val(info.phone01);
				$('#phone02').val(info.phone02);
				$('#phone03').val(info.phone03);
				$('#rPhone01').val(info.rPhone01);
				$('#rPhone02').val(info.rPhone02);
				$('#rPhone03').val(info.rPhone03);
				$('#receptionAdress').val(info.receptionAdress);
				$('#receptionEmail').val(info.receptionEmail);
				$('#receptionPhone').val(info.receptionPhone);
				$('#receptionSms').val(info.receptionSms);
				$('#receptionKakao').val(info.receptionKakao);
				$('#safeKey').val(info.safeKey);
				$('#searchClCd').val(info.searchClCd);
				$('#searchPtnCd').val(info.searchPtnCd);
				$('#modelCd').val(info.searchPtnCd);
				$('#snsGbn').val(info.snsGbn);
				$('#snsid').val(info.snsid);
				$('#tireSizeD').val(info.tireSizeD);
				$('#tireSizeI').val(info.tireSizeI);
				$('#tireSizeP').val(info.tireSizeP);
				$('#viewGbn').val(info.viewGbn);
				$('#vnVal').val(info.vnVal);
				$('#year').val(info.year);
				$('#receptionMarketingFirst').val(info.magYn1);
				$('#receptionMarketingSecond').val(info.magYn2);

				if (ValidUtil.isEmpty(info.safeKey)){
					$("#safeKeyChk").show();
				}

				// 본인인증 번호
				if (!ValidUtil.isEmpty(info.phone01)
						|| !ValidUtil.isEmpty(info.phone02)
						|| !ValidUtil.isEmpty(info.phone03)
						){
					$("#phoneChkYn").val("Y");
				}

				// 실사용자번호
				if (!ValidUtil.isEmpty(info.rPhone01)
						|| !ValidUtil.isEmpty(info.rPhone02)
						|| !ValidUtil.isEmpty(info.rPhone03)
						){
					$("#rPhoneChkYn").val("Y");
				}

				/* if (result.memberType =="S") { */
				if (result.pageCommon.totalCount >= 1) {
					// SNS 갯수에 따라 case가 다름
					var inHtml;
					var snsNm;

					if (result.pageCommon.totalCount == 1){

						if (result.selectSnsUsrInfoList[0].snsDiv == "KO"){
							snsNm = '카카오';
						} else if(result.selectSnsUsrInfoList[0].snsDiv == "NV"){
							snsNm = '네이버';
						} else if(result.selectSnsUsrInfoList[0].snsDiv == "FB"){
							snsNm = '페이스북';
						} else if(result.selectSnsUsrInfoList[0].snsDiv == "GG"){
							snsNm = '구글';
						}

						if (!ValidUtil.isEmpty(result.selectSnsUsrInfoList[0].snsId)){
		                    inHtml = "<label for='sns01'><span class='black'>SNS</span></label>";
		                    inHtml += "<div class='layout-r'>";
		                    inHtml += '<input type="text" value="' + snsNm + '" class="pl-0 trans-bg" id="sns01">';
		                    if (usrType == 'S') {
		                    	inHtml += '<button type="button" class="dark-line border trans-bg inset-xs align-middle" onclick="javascript:fn_dropCust();">회원탈퇴</button>';
		                    } else {
		                    	inHtml += '<button type="button" class="dark-line border trans-bg inset-xs align-middle" style="margin-left:10px;" onclick="javascript:fn_dropSns('+result.selectSnsUsrInfoList[0].snsId+');">연동해지</button>';
		                    }
		                    inHtml += "</div>";
	
		                    $("#snsCateCase2").empty();
		                    $("#snsCateCase2").html(inHtml);
	
							//$("#memberTp1").hide();
							$("#memberTp2").show();
							$("#memberTp3").hide();
						}
						
					} else {
						// SNS 여러개
						var data = result.selectSnsUsrInfoList;

						if (data != null && data.length > 0 ) {
							inHtml = '<label for="sns01"><span class="black">SNS</span></label>';
							for(var i=0; i<data.length; i++) {

								if (result.selectSnsUsrInfoList[i].snsDiv == "KO"){
									snsNm = '카카오 ';
								} else if(result.selectSnsUsrInfoList[i].snsDiv == "NV"){
									snsNm = '네이버 ';
								} else if(result.selectSnsUsrInfoList[i].snsDiv == "FB"){
									snsNm = '페이스북 ';
								} else if(result.selectSnsUsrInfoList[i].snsDiv == "GG"){
									snsNm = '구글 ';
								}

								inHtml += '<div class="layout-r">';
								inHtml += '<input type="text" value="' + snsNm + '" class="pl-0 trans-bg" id="sns01">';
								inHtml += '<button type="button" class="dark-line border trans-bg inset-xs align-middle" onclick="javascript:fn_dropSns('+result.selectSnsUsrInfoList[i].snsId+');">연동해지</button>';
								inHtml += '</div>';
							}

		                    $("#snsCateCase3").empty();
		                    $("#snsCateCase3").html(inHtml);
						}

						//$("#memberTp1").hide();
						$("#memberTp2").hide();
						$("#memberTp3").show();
					}
				}

				// 보유차량정보 조회 Start
				var carData = result.selectCustCarInfoList;
				
				if (carData != null && carData.length > 0 ) {
					inHtml = '';
					for(var j=0; j<carData.length; j++) {
						carNoArr[j] = carData[j].carNo;
						
						var tireSizedd = carData[j].tireSizeD;
						var tireSizepp = carData[j].tireSizeP;
						var tireSizeii = carData[j].tireSizeI;


						inHtml +='  <li>';
						inHtml +='	<div class="layout-r inline-s">';
						inHtml +='	  <div class="have-car-info inline">';
						inHtml +='		<b>보유차량 '+(j+1)+'</b>';
						inHtml +='		<span>'+carData[j].carNo+'</span>';
						inHtml +='		<span>'+carData[j].carMkerNm+'</span>';
						inHtml +='		<span>'+carData[j].carModelNm+'</span>';
						if(tireSizedd == null){
		                	inHtml += '            <span> - </span>';
						}else{
							inHtml += '            <span>단면폭'+tireSizedd+'</span>';
						}
		                if(tireSizepp == null){
		                	inHtml += '            <span> - </span>';
						}else{
							inHtml += '            <span>편방비'+tireSizepp+'</span>';
						}
		                if(tireSizeii == null){
		                	inHtml += '            <span> - </span>';
						}else{
							inHtml += '            <span>인치'+tireSizeii+'</span>';
						}
						inHtml +='	  </div>';
						inHtml +='	  <div class="align-middle">';
						inHtml +='		<button type="button" class="" onclick="javascript:fn_dropCustCar('+carData[j].custNo+','+carData[j].carSeq+'); return false;">제거</button>';
						inHtml +='	  </div>';
						inHtml +='	</div>';
						inHtml +='  </li>';

					}

	                $("#carInfoDiv").empty();
	                $("#carInfoDiv").html(inHtml);
				}
				// 보유차량정보 조회 End

				// 첨부파일 Start
				var attachData = result.selectCustAttachFileList;
				var attachPath;
				if (attachData != null && attachData.length > 0 ) {
					//$(".ff_fileupload_wrap").hide();
					for(var k=0; k<attachData.length; k++) {
						attachPath = attachData[k].atflPathNm;
						if (k==0){
							// attachPath1
							$("#attachPath1").parent().show();
							$("#attachPath1").attr("src","${attachPath}" + attachPath);
							$("#fileFlag01").val("Y");
							//$("#attachPath1").attr("src","https://www.nexentire.com/kr/main_adm/04/__icsFiles/afieldfile/2019/11/08/main_page.png");
						} else if (k==1){
							// attachPath2
							$("#attachPath2").parent().show();
							$("#attachPath2").attr("src","${attachPath}" + attachPath);
							$("#fileFlag02").val("Y");
						} else if (k==2){
							// attachPath3
							$("#attachPath3").parent().show();
							$("#attachPath3").attr("src","${attachPath}" + attachPath);
							$("#fileFlag03").val("Y");
						}
					}

				}
				// 첨부파일 End
				//인증코드 start
				var selectIssInfo = result.selectIssInfo;
				if(selectIssInfo != null){						
					$("#affiliateCd").val(selectIssInfo.issCertCd);
					$("#indvAffiliateCode").val(selectIssInfo.indvCertCd);
					$("#issCert").val(selectIssInfo.issCertCd);
					$("#indvCert").val(selectIssInfo.indvCertCd);
				}				
				
				//인증코드 end				

			}
			 /* selectMemberInfo end */
		} else if (callback == 'deleteSnsCust') {
			/* deleteSnsCust start */
			alert('SNS 정보가 해지 되었습니다.');
			evManager.init();
			/* deleteSnsCust end */
		} else if (callback == 'deleteCustCarInfo') {
			/* deleteCustCarInfo start */
			//alert('차량정보가 삭제 되었습니다.');
			fn_selectCustCarInfoList();
			/* deleteCustCarInfo end */
		} else if (callback == 'insertCustCarInfo') {
			/* insertCustCarInfo start */
			alert('차량정보가 저장 되었습니다.');
			fn_selectCustCarInfoList();
			/* insertCustCarInfo end */
		} else if (callback == 'selectCustCarInfoList') {
			/* selectCustCarInfoList start */
			var carData = result.selectCustCarInfoList;
			if (carData != null && carData.length > 0 ) {
				inHtml = '';
				for(var j=0; j<carData.length; j++) {
					var tireSizedd = carData[j].tireSizeD;
					var tireSizepp = carData[j].tireSizeP;
					var tireSizeii = carData[j].tireSizeI;


					inHtml +='  <li>';
					inHtml +='	<div class="layout-r inline-s">';
					inHtml +='	  <div class="have-car-info inline">';
					inHtml +='		<b>보유차량 '+(j+1)+'</b>';
					inHtml +='		<span>'+carData[j].carNo+'</span>';
					inHtml +='		<span>'+carData[j].carMkerNm+'</span>';
					inHtml +='		<span>'+carData[j].carModelNm+'</span>';
					if(tireSizedd == null){
	                	inHtml += '            <span> - </span>';
					}else{
						inHtml += '            <span>단면폭'+tireSizedd+'</span>';
					}
	                if(tireSizepp == null){
	                	inHtml += '            <span> - </span>';
					}else{
						inHtml += '            <span>편방비'+tireSizepp+'</span>';
					}
	                if(tireSizeii == null){
	                	inHtml += '            <span> - </span>';
					}else{
						inHtml += '            <span>인치'+tireSizeii+'</span>';
					}
					inHtml +='	  </div>';
					inHtml +='	  <div class="align-middle">';
					inHtml +='		<button type="button" class="" onclick="javascript:fn_dropCustCar('+carData[j].custNo+','+carData[j].carSeq+'); return false;">제거</button>';
					inHtml +='	  </div>';
					inHtml +='	</div>';
					inHtml +='  </li>';
				}

                $("#carInfoDiv").empty();
                $("#carInfoDiv").html(inHtml);
			}
			/* selectCustCarInfoList end */
		} else if (callback == 'updateMemberInfo') {
			/* updateMemberInfo start */
			alert('저장되었습니다.');
			evManager.init();
			/* updateMemberInfo end */
		} else if (callback == 'employeeCdCheck') {
			/* employeeCdCheck start */

			if(result.employeeCdYn == "Y") {
	    		$("#employeeCdTxt").val("1");
		    	$('#employeeCdTxt').html('<span><i class="ico08"></i>사용 가능한 코드 입니다.</span>');
		    	$("#officerCdChkYn").val("Y");
		    	
		    	var pUrl = "/mypage/selectChkCd";
				var pParams = {
						custId 		: userLoginId,
						issCertCd	: nexenCd
				};
				cfnSendRequest(pUrl,pParams,'selectChkCd');
				$("#affiliateCd").val(nexenCd);
	    	} else {
	    		$("#employeeCdTxt").val("0");
	    		$('#employeeCdTxt').html('<span><i class="ico08"></i>사용 할 수 없는 코드 입니다.</span>');
	    		$("#officerCd").val("");
	    		$("#officerCdChkYn").val("");
	    		
	    		if($("#affiliateCd").val() == nexenCd) {
	    			$("#affiliateCd").val("");
	    			$("#issCert").val("");
	    		}
	    	}

	    	$('#employeeCdTxt').show();

			/* employeeCdCheck end */
		} else if (callback == 'requestMobileAccess') {
			/* requestMobileAccess start */
			$('#resSeq').val(result.resSeq);
			/* requestMobileAccess end */
		} else if (callback == 'setMobileAccess') {
			/* setMobileAccess start */
			alert('인증성공 하였습니다.');
			$("#rPhoneChkYn").val("Y");
			$("#modal-11").removeClass("md-show");
			/* setMobileAccess end */
		} else if (callback == 'selectMemCarModelList') {
			/* selectMemCarModelList start */
			var option;
			$('#searchPtnCd').empty();
			option = '<option value="">모델명</option>';
			$('#searchPtnCd').append(option);
			for(var i=0; i < result.modelList.length; i++) {
				option = $('<option value="'+result.modelList[i].modelCd+'">'+result.modelList[i].modelNm+'</option>');
		        $('#searchPtnCd').append(option);
			}
			/* selectMemCarModelList end */
		} else if (callback == 'selectChkCd') {
			/* selectChkCd start */
			
			var issCertList = result.modelList.issCertList;
			if(issCertList.length > 0){
				var plcYn = result.modelList.plcYn;
				
				if(plcYn == 'Y') {
					certList = issCertList;
				} else {
					issCertList = [];
				
					$('#affiliateCdTxt').removeClass('validation type04');					
					$('#affiliateCdTxt').addClass('validation type03');
					$('#affiliateCdTxt').html('<span><i class="ico08"></i>제휴기간이 만료되어 등록이 불가합니다.</span>');
					$("#issCert").val("");
				}
			}else{
				//ComUtil.alert('존재하지 않는 발급코드 입니다.');
				$('#affiliateCdTxt').removeClass('validation type04');					
				$('#affiliateCdTxt').addClass('validation type03');
				$('#affiliateCdTxt').html('<span><i class="ico08"></i>발급코드가 잘못되었습니다.</span>');
				$("#issCert").val("");
			}
			
			for(var i = 0; i < issCertList.length; i++){
				if(issCertList[i].INDVCERTCD != null){
					$('#modal-affiliatecode').addClass('md-show').show();
					$("#modal-affiliatecode").on('click','.md-close',function(){
						$(event.target).parents('.md-show').removeClass('md-show');
					});					
					break;
				}else{
					if(issCertList[i].GRPSECD == "20"){
						if(issCertList[i].CUSTID == $("#custId").val()){
							$("#issCert").val(issCertList[i].ISSCERTCD);
							//ComUtil.alert('제휴코드 인증이 완료되었습니다.');
							$('#affiliateCdTxt').removeClass('validation type03');					
							$('#affiliateCdTxt').addClass('validation type04');
							$('#affiliateCdTxt').html('<span><i class="ico11"></i>제휴코드 인증이 완료되었습니다.</span>');
							break;
						}else{
							$('#affiliateCdTxt').removeClass('validation type04');					
							$('#affiliateCdTxt').addClass('validation type03');
							$('#affiliateCdTxt').html('<span><i class="ico08"></i>발급코드가 잘못되었습니다.</span>');
							$("#issCert").val("");
							break;
						}
					}else{
						$("#issCert").val(issCertList[i].ISSCERTCD);
						//ComUtil.alert('제휴코드 인증이 완료되었습니다.');
						$('#affiliateCdTxt').removeClass('validation type03');					
						$('#affiliateCdTxt').addClass('validation type04');
						$('#affiliateCdTxt').html('<span><i class="ico11"></i>제휴코드 인증이 완료되었습니다.</span>');
						break;
					}
				}
			}
			
			$('#affiliateCdTxt').show();
			
			/* selectChkCd end */
		}
	}

}

/*
 * 리퀘스트 후처리 함수 - ERROR
 * callbackError
 */
function cfnRequestErrorCallback(callback, status) {

	if(callback == 'selectMemberInfo'){
		alert(status);
	} else if (callback == 'deleteSnsCust') {
		/* deleteSnsCust start */
		alert('처리 실패 되었습니다.');
		//evManager.init();
		/* deleteSnsCust end */
	} else if (callback == 'deleteCustCarInfo') {
		/* deleteCustCarInfo start */
		alert('처리 실패 되었습니다.');
		//evManager.init();
		/* deleteCustCarInfo end */
	} else if (callback == 'updateMemberInfo') {
		/* updateMemberInfo start */
		alert('처리 실패 되었습니다.');
		//evManager.init();
		/* updateMemberInfo end */
	} else if (callback == 'employeeCdCheck') {
		/* employeeCdCheck start */
		alert('코드 조회에 실패 하였습니다.');
		/* employeeCdCheck end */
	} else if (callback == 'requestMobileAccess') {
		/* requestMobileAccess start */
		$('#resSeq').val('');
		/* requestMobileAccess end */
	} else if (callback == 'setMobileAccess') {
		/* setMobileAccess start */
		alert('인증 실패 하였습니다.');
		$("#rPhoneChkYn").val("N");
		/* setMobileAccess end */
	} else if (callback == 'selectMemCarModelList') {
		/* selectMemCarModelList start */
		alert('실패 하였습니다.');
		/* selectMemCarModelList end */
	}

	ComUtil.unloading();
}

/* 두번째 선택사항 차량정보 */
var selectObj = null;
function fn_getModel(){
	var searchClCd =  $("#searchClCd").val();

	// 조회 URL
	var pUrl = "/mypage/selectMemCarModelList";
	var pParams = {
			sMakerCd 		: searchClCd
			, sCdGrpCd 		: 'S002'
			, sCdGrpCd2		: 'S003'
	};

	cfnSendRequest(pUrl,pParams,'selectMemCarModelList');
}

function result2(msg){
	$(selectObj).html(msg);
}

function fn_dropSns(snsId) {
	if(confirm('삭제하겠습니까?')) {
		// SNS 삭제 시작
		var pUrl = "/mypage/deleteSnsCust";

		var pParams = {
				snsid 		: snsId
		};
		cfnSendRequest(pUrl,pParams,'deleteSnsCust');
	}

}

function fn_dropCust() {
	location.href = "/mypage/memberSecession";
}

function fn_dropCustCar(pCustNo, pCarSeq) {
	if(confirm('삭제하겠습니까?')) {
		// 보유차량 삭제
		var pUrl = "/mypage/deleteCustCarInfo";

		var pParams = {
				custNo 		: pCustNo
				,carSeq 		: pCarSeq
		};
		cfnSendRequest(pUrl,pParams,'deleteCustCarInfo');
	}
}

// 차량번호 조회
function fn_searchCarNum() {
	var carNum = $('#carNum').val();
	if (ValidUtil.isEmpty(carNum)){
		alert('차량번호를 입력하세요.');
		return false;
	} else {
		$('#carNumber').val($('#carNum').val());
		$("#modal-carNumSearch").addClass("md-show");
		//$('#btnCarNumberSearch').click();
	}
}

function fn_insertCustCarInfo() {

	var chkVal = $('input:radio[name="haveCarInfo"]:checked').val();
	var pParams;


	// 보유 차량 번호 중복시
	for(i = 0; i < carNoArr.length; i++){
		if($('#carNo').val() == carNoArr[i]){
			alert("중복된 차량입니다.");
			return;
		}
	}

	if($('#carNo').val() == ""){
		alert("보유차량 정보를 입력하시기 바랍니다.")
	}
	else{
		if (chkVal == '1') {
			pParams = {
				custNo 			: $('#custNo').val()
				,carMkerNm 		: $('#searchClCd').val()
				,carModel 		: $('#modelCd').val()
				,carNo 			: $('#carNo').val()
				,tireSizeD 		: $('#tireSizeD').val()
				,tireSizeP 		: $('#tireSizeP').val()
				,tireSizeI 		: $('#tireSizeI').val()
				,tireChgYm 		: $('#year').val()+$('#mon').val()
				,tireGoodsNm 	: $('#tireName').val()
			};
		} else {
			pParams = {
				custNo 			: $('#custNo').val()
				,carMkerNm 		: $('#searchClCd').val()
				,carModel 		: $('#modelCd').val()
				,carNo 			: $('#carNo').val()
				,tireSizeD 		: $('#tireSizeD').val()
				,tireSizeP 		: $('#tireSizeP').val()
				,tireSizeI 		: $('#tireSizeI').val()
				,tireChgYm 		: $('#year').val()+$('#mon').val()
				,tireGoodsNm 	: $('#tireName').val()
			};
		}
	}
	
	

	// 보유차량 등록
	var pUrl = "/mypage/insertCustCarInfo";
	cfnSendRequest(pUrl,pParams,'insertCustCarInfo');
}

function fn_selectCustCarInfoList() {

	// 보유차량 조회
	var pUrl = "/mypage/selectCustCarInfoList";

	var pParams = {
			sCustId 		: userLoginId
	};
	cfnSendRequest(pUrl,pParams,'selectCustCarInfoList');

}

/* 입력 방지 */
function check_key() {
  var char_ASCII = event.keyCode;

  //숫자
 if (char_ASCII >= 48 && char_ASCII <= 57 )
    return 1;
 //영어
 else if ((char_ASCII>=65 && char_ASCII<=90) || (char_ASCII>=97 && char_ASCII<=122))
     return 2;
 //특수기호
 else if ((char_ASCII>=33 && char_ASCII<=47) || (char_ASCII>=58 && char_ASCII<=64)
    || (char_ASCII>=91 && char_ASCII<=96) || (char_ASCII>=123 && char_ASCII<=126))
     return 4;
 //한글
 else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
     return 3;
  else
     return 0;
}

// 차량정보 숫자한글 (12가1234)
function nonHangulSpecialKey() {

	 if(check_key() != 1 && check_key() != 3) {
	   event.returnValue = false;
	   alert("숫자나 한글만 입력하세요!");
	   return;
	  }
}

//휴대전화 팝업
function fnCallPhone(gubun){
	window.open('', 'popupChk', 'width=520, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.target = "popupChk";
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.submit();
}

//가입된 회원인지 확인하고 없으면 다음단계로 넘기고 아니면 로그인 이동
function result(){
	alert('인증 되었습니다.');
	$("#phoneChkYn").val("Y");
	/*
	var frm = document.userinfo_form;
		frm.action = "/member/custInput";
		frm.submit();
		 */
}

function returnAddrInfo(cbData) {

	$("#addrFull").val(cbData.popLoadAddr + " " + cbData.popDetailAddr);
	$("#addr").val(cbData.popLoadAddr);
	$("#detlAddr").val(cbData.popDetailAddr);
	$("#posNo").val(cbData.popZipCode);
	$("#bldMngNo").val(cbData.bldMngNo);

}

function returnNiceDnrSizeInfo(rData) {
	var searchClCd = rData.rMcmpCd+"^"+rData.rContentsCd;
	$("#searchClCd").val(searchClCd);
	$("#modelCd").val(rData.rModelCd);

	$("#tireSizeD").val(rData.rValue.split("^")[0]);
	$("#tireSizeP").val(rData.rValue.split("^")[1]);
	$("#tireSizeI").val(rData.rValue.split("^")[2]);

	fn_insertCustCarInfo();
	sendChildValueCancle('modal-CarNumSize');


}

function fn_press_nice(obj)
{
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    obj.value = obj.value.replace(/[^0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
}


//제휴코드 인증 팝업
/*function fn_affiliateCodePop() {
	$('#modal-affiliatecode').addClass('md-show').show();
	$("#modal-affiliatecode").on('click','.md-close',function(){
		$(event.target).parents('.md-show').removeClass('md-show');
		event.preventDefault();
	});

}*/

//제휴코드 인증 팝업
function fn_affiliateCodePop() {
// 	$('#modal-affiliatecode').addClass('md-show');
	// 조회 URL
// 	var serverMode = $("#serverMode").val();
	
// 	if(serverMode == "prd"){
// 		ComUtil.alert('준비중입니다');
// 		return false;
// 	}else{
		if($("#affiliateCd").val() == null || $("#affiliateCd").val() == ""){
			//ComUtil.alert('제휴코드를 입력하여주세요');
			$('#affiliateCdTxt').html('<span><i class="ico08"></i>제휴코드를 입력하여주세요.</span>');
			$('#affiliateCdTxt').show();
			return false;
		}
		
		var pUrl = "/mypage/selectChkCd";
		var pParams = {
				custId 		: userLoginId,
				issCertCd	: $("#affiliateCd").val()
		};
		cfnSendRequest(pUrl,pParams,'selectChkCd');
// 	}
}

//제휴코드 input data 변경시
function fn_affiliateCng(){
	$('#affiliateCdTxt').removeClass('validation type04');					
	$('#affiliateCdTxt').addClass('validation type03');	
	$('#affiliateCdTxt').html('<span><i class="ico08"></i>제휴코드 인증을 진행하여 주시길 바랍니다.</span>');
	$("#issCert").val("");
	$("#indvCert").val("");
	$("#indvAffiliateCode").val("");
}

//개별인증코드 확인
function fn_indvCert(){
	
	var indvAffiliateCode = $("#indvAffiliateCode").val();
	
	if(indvAffiliateCode == null || indvAffiliateCode == ""){
		ComUtil.alert('개별인증코드를 입력하여주세요');
		return false;
	}
	var indvCertBool = false;
	for(var i = 0; i < certList.length; i++){
		if(certList[i].INDVCERTCD == indvAffiliateCode){
			if(typeof certList[i].CUSTID != "undefined" && certList[i].CUSTID != null && certList[i].CUSTID != ""){
				if(certList[i].CUSTID == $("#custId").val()){
					indvCertBool = true;
					break;
				}
			}else{
				indvCertBool = true;
				break;				
			}
		}
	}	
	
	if(!indvCertBool){		
		$("#issCert").val("");
		$("#indvCert").val("");
		ComUtil.alert('이미 등록된 개별 인증 코드 입니다. <br>개별인증코드를 확인해 주세요.');
	}else{
		$("#issCert").val($("#affiliateCd").val());
		$("#indvCert").val(certList[i].INDVCERTCD);
		//ComUtil.alert('개별코드 인증이 완료되었습니다.');
		$('#affiliateCdTxt').removeClass('validation type03');					
		$('#affiliateCdTxt').addClass('validation type04');			
		$('#affiliateCdTxt').html('<span><i class="ico11"></i>개별코드 인증이 완료되었습니다.</span>');
		$("#modal-affiliatecode").removeClass("md-show");
	}
}

//개별인증코드  취소
function fn_CancelCert(){
	$("#issCert").val("");
	$("#indvCert").val("");
	$("#indvAffiliateCode").val("");
	//ComUtil.alert('개별코드인증을 취소하셨습니다.');
	$('#affiliateCdTxt').removeClass('validation type04');					
	$('#affiliateCdTxt').addClass('validation type03');
	$('#affiliateCdTxt').html('<span><i class="ico08"></i>개별코드 인증을 취소하셨습니다.</span>');
}

</script>
