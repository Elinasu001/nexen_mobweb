<%@page import="com.nexwrms.core.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>`
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.net.ssl.TrustManager"%>
<%@ page import="javax.net.ssl.HostnameVerifier"%>
<%@ page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page import="javax.net.ssl.SSLContext"%>
<%@ page import="javax.net.ssl.SSLSession"%>
<%@ page import="javax.net.ssl.X509TrustManager"%>
<%@ page import="java.security.cert.X509Certificate"%>
<%@ page import="javax.net.ssl.TrustManager"%>
<%@ page import="javax.net.ssl.HostnameVerifier"%>
<%@ page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page import="javax.net.ssl.SSLContext"%>
<%@ page import="javax.net.ssl.SSLSession"%>
<%@ page import="javax.net.ssl.X509TrustManager"%>
<%@ page import="java.security.cert.X509Certificate"%>

<%@ page import="com.nexwrms.core.constants.CoreConstants"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants"%>
<%@ page import="com.nexwrms.core.context.AppContext"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%!
    TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
          public java.security.cert.X509Certificate[] getAcceptedIssuers() { return null; }
          public void checkClientTrusted(X509Certificate[] certs, String authType) {  }
          public void checkServerTrusted(X509Certificate[] certs, String authType) {  }
       }
    };
    // Create all-trusting host name verifier
    HostnameVerifier allHostsValid = new HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) { return true; }
    };
%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");

SSLContext sc = SSLContext.getInstance("SSL");
sc.init(null, trustAllCerts, new java.security.SecureRandom());
HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결제 요청 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   이 페이지는 Payplus Plug-in을 통해서 결제자가 결제 요청을 하는 페이지    = */
    /* =   입니다. 아래의 ※ 필수, ※ 옵션 부분과 매뉴얼을 참조하셔서 연동을        = */
    /* =   진행하여 주시기 바랍니다.                                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do			        = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%
    /* ============================================================================== */
    /* =   환경 설정 파일 Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ※ 필수                                                                  = */
    /* =   테스트 및 실결제 연동시 site_conf_inc.jsp 파일을 수정하시기 바랍니다.    = */
    /* = -------------------------------------------------------------------------- = */
%>
<%@ include file="kcp/site_conf_inc.jsp"%>
<%
	request.setCharacterEncoding ( "UTF-8" ) ;
    /* = -------------------------------------------------------------------------- = */
    /* =   환경 설정 파일 Include END                                               = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
    public String f_get_parm( String val ){
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	int yy = cal.get(java.util.Calendar.YEAR);
	int mm = cal.get(java.util.Calendar.MONTH);

	DecimalFormat df = new DecimalFormat("00");
	String hour="";
	String min="";

	if( cal.get(java.util.Calendar.AM_PM) == cal.PM){
		hour = df.format(cal.get(java.util.Calendar.HOUR)+12) + df.format(cal.get(java.util.Calendar.MINUTE)); //Calendar.PM이면 12를 더한다
	} else {
	    hour = df.format(cal.get(java.util.Calendar.HOUR)) + df.format(cal.get(java.util.Calendar.MINUTE));
	}
%>
<%
	request.setCharacterEncoding ( "UTF-8" ) ;

    /* kcp와 통신후 kcp 서버에서 전송되는 결제 요청 정보 */
    String req_tx          = f_get_parm( request.getParameter( "req_tx"         ) ); // 요청 종류
    String res_cd          = f_get_parm( request.getParameter( "res_cd"         ) ); // 응답 코드
    String tran_cd         = f_get_parm( request.getParameter( "tran_cd"        ) ); // 트랜잭션 코드
    String ordr_idxx       = f_get_parm( request.getParameter( "ordr_idxx"      ) ); // 쇼핑몰 주문번호
    String good_name       = f_get_parm( request.getParameter( "good_name"      ) ); // 상품명
    String good_mny        = f_get_parm( request.getParameter( "good_mny"       ) ); // 결제 총금액
    String buyr_name       = f_get_parm( request.getParameter( "buyr_name"      ) ); // 주문자명
    String buyr_tel1       = f_get_parm( request.getParameter( "buyr_tel1"      ) ); // 주문자 전화번호
    String buyr_tel2       = f_get_parm( request.getParameter( "buyr_tel2"      ) ); // 주문자 핸드폰 번호
    String buyr_mail       = f_get_parm( request.getParameter( "buyr_mail"      ) ); // 주문자 E-mail 주소
    String use_pay_method  = f_get_parm( request.getParameter( "use_pay_method" ) ); // 결제 방법
    String ipgm_date       = f_get_parm( request.getParameter( "ipgm_date"      ) ); // 가상계좌 마감시간
    String enc_info        = f_get_parm( request.getParameter( "enc_info"       ) ); // 암호화 정보
    String enc_data        = f_get_parm( request.getParameter( "enc_data"       ) ); // 암호화 데이터
    String van_code        = f_get_parm( request.getParameter( "van_code"       ) );
    String cash_yn         = f_get_parm( request.getParameter( "cash_yn"        ) );
    String cash_tr_code    = f_get_parm( request.getParameter( "cash_tr_code"   ) );

    /* 기타 파라메터 추가 부분 - Start - */
    String param_opt_1    = f_get_parm( request.getParameter( "param_opt_1"     ) ); // 결제 카운트
    String param_opt_2    = f_get_parm( request.getParameter( "param_opt_2"     ) ); // 월 연체료 (연체료 * 결제 카운트 = 결제 금액)
    String param_opt_3    = f_get_parm( request.getParameter( "param_opt_3"     ) ); // 주문 번호
    /* 기타 파라메터 추가 부분 - End -   */

  	String tablet_size     = "1.0"; // 화면 사이즈 고정
  	//String url             = request.getRequestURL().toString();
  	System.out.println("param_opt_1 \\\\\\ "+param_opt_1);
  	System.out.println("param_opt_2 \\\\\\ "+param_opt_2);
  	System.out.println("param_opt_3 \\\\\\ "+param_opt_3);


%>


<script type="text/javascript" src="<%=g_conf_js_url%>"></script>
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/datepicker-ko.js"></script>
<!-- 다음 맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>

<!-- 모바일 결재용 css -->

<!-- 거래등록 하는 kcp 서버와 통신을 위한 스크립트-->
<script type="text/javascript" src="/js/approval_key.js"></script>

<!-- 스마트폰에서 KCP 결제창을 레이어 형태로 구현-->
<div id="layer_all" class="popup">
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><iframe name="frm_all" frameborder="0" marginheight="0" marginwidth="0" border="0" width="100%" height="100%" scrolling="auto"></iframe></td>
		</tr>
	</table>
</div>

<!-- subContentsWrap -->
<div class="subContentsWrap" id="wrap">

	<form name="pay_form" method="post" action="/mypage/arre_pp_cli_hub">
		<input type="hidden" name="req_tx" value="<%=req_tx%>">
		<!-- 요청 구분          -->
		<input type="hidden" name="res_cd" value="<%=res_cd%>">
		<!-- 결과 코드          -->
		<input type="hidden" name="tran_cd" value="<%=tran_cd%>">
		<!-- 트랜잭션 코드      -->
		<input type="hidden" name="ordr_idxx" value="<%=ordr_idxx%>">
		<!-- 주문번호           -->
		<input type="hidden" name="patternCd"
			value="${orderVO_info.patternCd}">
		<!-- 패턴코드           -->
		<input type="hidden" name="good_mny" value="<%=good_mny%>">
		<!-- 결제금액    		  -->
		<input type="hidden" name="good_name" value="<%=good_name%>">
		<!-- 상품명             -->
		<input type="hidden" name="buyr_name" value="<%=buyr_name%>">
		<!-- 주문자명           -->
		<input type="hidden" name="buyr_tel1" value="<%=buyr_tel1%>">
		<!-- 주문자 전화번호    -->
		<input type="hidden" name="buyr_tel2" value="<%=buyr_tel2%>">
		<!-- 주문자 휴대폰번호  -->
		<input type="hidden" name="buyr_mail" value="<%=buyr_mail%>">
		<!-- 주문자 E-mail      -->
		<input type="hidden" name="cash_yn" value="<%=cash_yn%>">
		<!-- 현금영수증 등록여부-->
		<input type="hidden" name="enc_info" value="<%=enc_info%>">
		<input type="hidden" name="enc_data" value="<%=enc_data%>">
		<input type="hidden" name="use_pay_method" value="<%=use_pay_method%>">
		<input type="hidden" name="pay_method" value="<%=use_pay_method%>">
		<input type="hidden" name="cash_tr_code" value="<%=cash_tr_code%>">

		<!-- 연체금 추가 파라미터 -->
		<input type="hidden" name="overdueNum" value="<%=param_opt_1%>">
		<!-- 결제 카운트 -->
		<input type="hidden" name="recpAmt" value="<%=param_opt_2%>" />
		<!-- 월 연체료 (월 연체료 * 결제 카운트 = 결제 금액) -->

		<!-- 주문 번호 -->


		<% if(!StringUtil.isEmpty(param_opt_2)) { if("t1".equals(param_opt_2) || "t2".equals(param_opt_2)) { %>
			<input type="hidden" name="ordrId"  value="<%=ordr_idxx%>">	<!-- 선납/완납 추가 파라미터 -->
		<% } else { %>
			<input type="hidden" name="ordrId" value="<%=param_opt_3%>">	<!-- 연체금 추가 파라미터 -->
		<% } }%>

		<!-- 선납/완납 추가 파라미터 -->
	    <input type="hidden" name="prptMon"        value="<%=param_opt_1%>" /><!-- 선납 개월 -->
	    <input type="hidden" name="bayType"        value="<%=param_opt_2%>">
	    <input type="hidden" name="recpAmt"        value="<%=good_mny%>"/>
	</form>

	<form id="frm" name="frm" method="post">
		<!-- paging -->
		<input type="hidden" name="pageNo" id="pageNo"
			value="${pageCommon.pageNo}" />
		<!-- 현재 페이지 -->
		<input type="hidden" name="pageSize" id="pageSize" value="10" />
		<!-- 페이지에 표시할 수 -->

	</form>


	<main class="mynexen"> <!-- header -->

	<form name="order_info" id="order_info" method="post"  action="/mypage/arre_pp_cli_hub">
		<input type="hidden" name="rtPayMtd" id="rtPayMtd" value="C"></input>

		<input type="hidden" name="ordNo" 	id="ordNo" 	value="${ordNo }" />
		<input type="hidden" name="ordrId"  id="ordrId" value="${ordNo }" />

		<!-- 페이지에 표시할 수 -->
		<input type="hidden" id="actType" name="actType" value="at1" />
		<input type="hidden" id="paySum" name="paySum" value="" />
		<input type="hidden" id="sumArreAmt" name="sumArreAmt" />
		<input type="hidden" id="sumRecpAmt" name="sumRecpAmt" />
		<input type="hidden" name="recpAmt" id="recpAmt" />
		<input type="hidden" name="arreAmt" id="arreAmt" />
		<input type="hidden" name="overdueNum" id="overdueNum" value="0" />

		<input type="hidden" name="rdoOrdNo" />

		<!-- 모바일 추가? STR -->
		<input type="hidden" name="Ret_URL" value="" />
		<input type="hidden" name="site_cd" value="T0007" />
		<input type="hidden" name="site_name" value="NEXEN" />
		<input type="hidden" name="response_type" value="TEXT" />
		<input type="hidden" name="PayUrl" id="PayUrl" value="" />
		<input type="hidden" name="traceNo" id="traceNo" value="" />
		<input type="hidden" name="req_tx" value="pay">
		<input type="hidden" name="van_code" value="4Ho4YsuOZlLXUZUdOxM1Q7X__">
		<input type="hidden" name="currency" value="410" />
		<input type="hidden" name="param_opt_1" value="">
		<input type="hidden" name="param_opt_2" value="">
		<input type="hidden" name="param_opt_3" value="">

		<!-- 결제등록 키 -->
		<input type="hidden" name="approval_key" id="approval">
		<!-- 모바일 추가? END -->

		<!-- 에스크로 사용 여부 : 반드시 Y 로 설정 -->
		<input type="hidden" name="escw_used" value="N" />
		<!-- 에스크로 결제처리 모드 : 에스크로: Y, 일반: N, KCP 설정 조건: O  -->
		<input type="hidden" name="pay_mod" value="N" />
		<!-- 배송 소요일 : 예상 배송 소요일을 입력 -->
		<input type="hidden" name="deli_term" value="03" />
		<!-- 장바구니 상품 개수 : 장바구니에 담겨있는 상품의 개수를 입력(good_info의 seq값 참조) -->
		<input type="hidden" name="bask_cntx" value="1" />
		<!-- 장바구니 상품 상세 정보 (자바 스크립트 샘플 create_goodInfo()가 온로드 이벤트시 설정되는 부분입니다.) -->
		<input type="hidden" name="good_info" value="" />
		<input type="hidden" name="res_cd" value="" />
		<input type="hidden" name="res_msg" value="" />
		<input type="hidden" name="tno" value="" />
		<input type="hidden" name="trace_no" value="" />
		<input type="hidden" name="enc_info" value="" />
		<input type="hidden" name="enc_data" value="" />
		<input type="hidden" name="ret_pay_method" value="" />
		<input type="hidden" name="tran_cd" value="" />
		<input type="hidden" name="bank_name" value="" />
		<input type="hidden" name="bank_issu" value="" />
		<!-- <input type="hidden" name="use_pay_method"  value=""/> -->

		<!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
		<input type="hidden" name="cash_tsdtime" value="" />
		<input type="hidden" name="cash_yn" value="" />
		<input type="hidden" name="cash_authno" value="" />
		<input type="hidden" name="cash_tr_code" value="" />
		<input type="hidden" name="cash_id_info" value="" />

		<!-- 2012년 8월 18일 정자상거래법 개정 관련 설정 부분 -->
		<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131)  -->
		<input type="hidden" name="good_expr" value="0">

		<!-- 가맹점에서 관리하는 고객 아이디 설정을 해야 합니다.(필수 설정) -->
		<input type="hidden" name="shop_user_id" value="" />
		<!-- 복지포인트 결제시 가맹점에 할당되어진 코드 값을 입력해야합니다.(필수 설정) -->
		<input type="hidden" name="pt_memcorp_cd" value="" />

		<!-- 상품정보 -->
		<input type="hidden" name="saleNm" value="${orderVO.saleNm}" />
		<!--렌탈상품명-->
		<input type="hidden" name="saleCd" value="${orderVO.saleCd}" />
		<!--렌탈상품코드-->
		<!-- 주문자 정보 -->
		<input type="hidden" name="ordrIdxx" value="${payDetail.ordNo}" />
		<!-- 주문번호-->
		<input type="hidden" name="patternCd" value="${orderVO.patternCd}" />
		<!--패턴코드-->
		<input type="hidden" name="matCd" value="${orderVO.matCd}" />
		<!--상품코드-->
		<input type="hidden" name="makerCd" value="${orderVO.makerCd}" />
		<!--제조사코드-->
		<input type="hidden" name="makerCdNm" value="${orderVO.makerCdNm}" />
		<!--제조사명-->
		<input type="hidden" name="modelCd" value="${orderVO.modelCd}" />
		<!--차종코드-->
		<input type="hidden" name="contentsCd" value="${orderVO.contentsCd}" />
		<!--사양코드-->
		<input type="hidden" name="modelCdNm" value="${orderVO.modelCdNm}" />
		<!--차종코드명-->
		<input type="hidden" name="frCd" value="${orderVO.frCd}" />
		<!--전후구분코드-->
		<input type="hidden" name="dispSize" value="${orderVO.dispSize}" />
		<!--사이즈-->
		<input type="hidden" name="sectionWidth"
			value="${orderVO.sectionWidth}" />
		<!--단면폭-->
		<input type="hidden" name="aspectRatio" value="${orderVO.aspectRatio}" />
		<!--편평비-->
		<input type="hidden" name="wheelInches" value="${orderVO.wheelInches}" />
		<!--휠인치-->
		<input type="hidden" name="carNumber" value="${orderVO.carNumber}" />
		<!--차량번호-->
		<input type="hidden" name="cntCd" value="${orderVO.cntCd}" />
		<!--수량코드-->
		<input type="hidden" name="cntCdNm" value="${orderVO.cntCdNm}" />
		<!--수량코드명-->
		<input type="hidden" name="periodCd" value="${orderVO.periodCd}" />
		<!--기간코드-->
		<input type="hidden" name="periodCdNm" value="${orderVO.periodCdNm}" />
		<!--기간코드명-->
		<input type="hidden" name="regiCd" value="${orderVO.regiCd}" />
		<!--등록비코드-->
		<input type="hidden" name="regiCdAmt" value="${rentalProd.regiAmt}" />
		<!--등록비금액-->
		<input type="hidden" name="orgRentAmt" value="${rentalProd.rentAmt}" />
		<!--조견표렌탈금액-->
		<input type="hidden" name="rentalAmt" value="${rentalProd.rentAmt+rentalProd.addRentAmt}" />
		<!--월렌탈금액-->
		<input type="hidden" name="rentalPAmt" value="${rentalProd.addRentAmt}" />
		<!--추가렌탈금액-->
		<input type="hidden" name="psCd" value="" />
		<!--프리미엄서비스 코드   2181211 문의 필요-->
		<input type="hidden" name="safeKey" value="${clientVo.safeKey}" />
		<!--세이프키-->
		<input type="hidden" name="ordListImg" value="${orderVO.ordListImg}" />
		<input type="hidden" name="custDivCd" value="${clientVo.custDivCd}" />
		<!-- 고객구분=개인:1/법인:2-->
		<input type="hidden" name="comDivCd" value="${clientVo.comDivCd}" />
		<!-- 법인회원구분=개인사업자:1/법인사업자:2-->
		<input type="hidden" name="batchKey" id="batchKey" value="" /> <input
			type="hidden" name="seasonCd" value="${orderVO.seasonCd}" />
		<!--계절코드 -->
		<input type="hidden" name="seasonCdNm" value="${orderVO.seasonCdNm}" />
		<!--계절명 -->
		<input type="hidden" name="oeNm" value="${orderVO.oeNm}" />
		<!--순정,호환여부 -->
		<input type="hidden" name="classCd" value="${orderVO.classCd}" />
		<!--SUV,승용차여부 -->
		<input type="hidden" name="totalAmt" value="${rentalProd.totalAmt}" />
		<input type="hidden" name="prsListJson" value="${prsListJson}" />
		<!-- 자유렌탈의 경우 Json 방식으로 프리미엄 리스트 전송  -->

		<%
				    /* ============================================================================== */
				    /* =   1. 주문 정보 입력                                                        = */
				    /* = -------------------------------------------------------------------------- = */
				    /* =   결제에 필요한 주문 정보를 입력 및 설정합니다.                            = */
				    /* = -------------------------------------------------------------------------- = */
				    /* ============================================================================== */
				    /* =   1-1. 결제 수단 정보 설정                                                 = */
				    /* = -------------------------------------------------------------------------- = */
				    /* =   결제에 필요한 결제 수단 정보를 설정합니다.                               = */
				    /* =  신용카드 : 100000000000, 계좌이체 : 010000000000
				    /* =  KCP에 신청된 결제수단으로만 결제가 가능합니다.                            = */
				    /* = -------------------------------------------------------------------------- = */
				%>
		<input type="hidden" name="ordr_idxx" value="${payDetail.ordNo}" />
		<!--주문 번호-->
		<input type="hidden" name="good_name" value="Nexen" />
		<!-- 상품명(good_name) good_name-->
		<input type="hidden" name="good_mny" value="0" />
		<!-- 결제금액(good_mny) 등록비만 결제 금으로 결제한다. ${rentalProd.regiAmt} - ※ 필수 : 값 설정시 ,(콤마)를 제외한 숫자만 입력하여 주십시오. -->

		<input type="hidden" name="buyr_name" />
		<!-- 주문자명(buyr_name) -->
		<input type="hidden" name="buyr_mail" />
		<!-- 주문자 E-mail(buyr_mail) -->
		<input type="hidden" name="buyr_tel1" />
		<!-- 주문자 연락처1(buyr_tel1) -->
		<input type="hidden" name="buyr_tel2" />
		<!-- 휴대폰번호(buyr_tel2) -->
		<input type="hidden" name="pay_method" value="110000000000" />
		<!-- 결제수단 -->
		<input type="hidden" name="use_pay_method"/> <!-- 결제수단 -->

		<%
				     /* ============================================================================== */
				     /* =   1-2. 에스크로 정보                                                       = */
				     /* = -------------------------------------------------------------------------- = */
				     /* =   에스크로 사용업체에 적용되는 정보입니다.                                 = */
				     /* = -------------------------------------------------------------------------- = */
				%>
		<input type="hidden" name="rcvr_name" />
		<!-- 수취인명(rcvr_name) -->
		<input type="hidden" name="rcvr_tel1" />
		<!-- 수취인 연락처1(rcvr_tel1) -->
		<input type="hidden" name="rcvr_tel2" />
		<!-- 수취인 휴대폰번호(rcvr_tel2) -->
		<input type="hidden" name="rcvr_mail" />
		<!-- 수취인 E-mail(rcvr_mail) -->
		<input type="hidden" name="rcvr_zipx" />
		<!-- 수취인 우편번호(rcvr_zipx) -->
		<input type="hidden" name="rcvr_add1" />
		<!-- 수취인 주소(rcvr_add1) -->
		<input type="hidden" name="rcvr_add2" />
		<!-- 수취인 상세주소-->
		<%
				    /* ============================================================================== */
				    /* =   3-1. Payplus Plugin 에스크로결제 사용시 필수 정보                        = */
				    /* = -------------------------------------------------------------------------- = */
				    /* =   결제에 필요한 주문 정보를 입력 및 설정합니다.                            = */
				    /* = -------------------------------------------------------------------------- = */
				%>

	<div class="page-header empty">
		<h2 class="title-deco">
			<span>책임지고</span> <span>관리합니다</span>
		</h2>
		<h3 class="title-deco-sub">나의 렌탈 관리</h3>
	</div>
	<!-- //header -->

	<div class="mynexen-rental-list-detail-wrap bg">
		<div class="order-info-summary-wrap">
			<div class="order-info-summary col-1">
				<small>계약번호 ${detailMap.ordNo }</small>
			</div>
			<div class="align-middle">
				<span class="mynexen-detail" onclick="return false">주문내역상세</span>
			</div>
		</div>

		<article class="order-single inset-m layout-c">
			<div class="layout-r same-size">
				<div class="inlnie align-bottom">
					<div class="order-data-photo">
						<img
							src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${detailMap.atflPathNm}"
							alt="${detailMap.saleNm}" />
					</div>
				</div>
				<div class="inlnie border-bottom order-box">
					<div class="order-data-title">
						<h3>${detailMap.PETTERN_CD }</h3>
					</div>
					<div class="order-product-info">
						<ul class="mb-s">
							<li><span>${detailMap.CLASS_NM }</span><span>${detailMap.SEASON_NM }</span><span>${detailMap.OE_YN_NM }</span></li>
							<li>${detailMap.TIRE_SIZE }</li>
						</ul>
					</div>
					<div class="order-count layout-r mb-s">
						<b class="align-middle">수량</b> <span class=" align-middle">${fn:replace(detailMap.cntNm,'본','')}</span>
					</div>
				</div>
			</div>
		</article>

		<div class="inset-m pt-0">
			<div class="layout-r">
				<div class="col-1"></div>
				<div class="layout-c">
					<div class="align-right">
						<div class="my-rental-util-box">
							<fmt:parseNumber var="arreCnt" type="number"
								value="${detailMap.arreCnt}" />
							<div class="btn w100">
								<button type="button" class="type11 w100">${detailMap.STAT_NM}</button>
								<c:if test="${arreCnt > 0}">
									<span class="my-rental-util-info">${arreCnt}개월 연체</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="accordion-box js-accordion">
		<div id="product-review" class="accordion">
			<h3>계약 정보</h3>
		</div>
		<div class="accordion-info inset-ml">
			<div class="submit">
				<div class="border-bottom mb-s">
					<p class="black">렌탈상품</p>
					<p class="pt-s pb-s">
						<b>${detailMap.saleNm}</b> ${detailMap.PRIMIUM_SVC}
					</p>
				</div>
				<!-- <button type="button" class="go-view pl-0">서비스내역</button> -->
			</div>

			<div class="submit border-bottom">
				<p class="black">차량정보</p>
				<p class="pt-s pb-s">${detailMap.CAR_INFO}</p>
			</div>

			<div class="submit border-bottom">
				<p class="black">장착정보</p>
				<p class="pt-s pb-s">${detailMap.INST_NM}-
					${fn:replace(detailMap.procDay,'-','.')} (${detailMap.STAT_NM})</p>
			</div>

			<div class="border-bottom layout-c">
				<p class="black">렌탈기간</p>
				<p class="pt-s pb-s">${detailMap.periodNm }-
					${fn:replace(detailMap.procDay,'-','.')} ~
					${fn:replace(detailMap.osDay,'-','.')}</p>
			</div>

		</div>
		<div class="order-middle-message text-center border-bottom">
			<p>렌탈 납부 정보를 입력하세요.</p>
			<div class="order-info-summary">
				<small>월 렌탈 요금 자동이체 등록은 주문 고객님 본인의 계좌 또는 카드만 가능하며 선택한 결제일에
					자동으로 결제됩니다.<br>렌탈 등록비는 장착 후 1회만 청구되며, 1회차 렌탈료와 함께 익월부터 청구됩니다.
				</small>
			</div>
			<c:if test="${detailMap.STAT_CD eq '04'}">
				<div class="align-center inline-s layout-r mt-s">
					<button type="button" class="inline btn-gray-dark inset-s pl-m pr-m" onclick="fn_payTypeChPop();">납부 방법 변경</button>
					<!-- <button type="button" class="inline btn-gray-dark inset-s pl-m pr-m" onclick="fn_actTypePop();">중도 선납/완납</button> -->
				</div>
			</c:if>
		</div>
		<div id="product-review" class="accordion">
			<h3>렌탈 납부 정보</h3>
		</div>
		<div class="accordion-info inset-ml">
			<div class="submit border-bottom">
				<p class="black">월 렌탈료</p>
				<p class="pt-s pb-s">
					₩
					<fmt:formatNumber value="${detailMap.MON_AMT}" pattern="#,###" />
				</p>
			</div>

			<div class="submit border-bottom">
				<p class="black">렌탈 등록비</p>
				<p class="pt-s pb-s">
					₩
					<fmt:formatNumber value="${detailMap.REGI_AMT}" pattern="#,###" />
				</p>
			</div>

			<fmt:parseNumber var="PAY_DD" type="number"
				value="${detailMap.PAY_DD}" />
			<c:choose>
				<c:when test="${ detailMap.PAY_MTHD_NM eq 'CMS'}">
					<div class="submit layout-c">
						<p class="black">결제수단</p>
						<div class="layout-r inline-m border-bottom">
							<p class="pt-s pb-s inline">${detailMap.BANK_NM }</p>
							<p class="pt-s pb-s inline">${fn:substring(detailMap.ACCT_NO, 0 ,4) }********</p>
						</div>
					</div>

					<div class="submit border-bottom layout-c">
						<p class="black">결제일</p>
						<p class="pt-s pb-s">${PAY_DD }일마다자동이체</p>
					</div>

					<div class="submit border-bottom">
						<p class="black">계좌소유주</p>
						<p class="pt-s pb-s">${detailMap.BANK_OWNER }</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="submit layout-c">
						<p class="black">결제수단</p>
						<div class="layout-r inline-m border-bottom">
							<p class="pt-s pb-s inline">${detailMap.CARDCOM_NM }</p>
							<p class="pt-s pb-s inline">${fn:substring(detailMap.CARD_NO, 0 ,4) }********</p>
						</div>
					</div>

					<div class="submit border-bottom layout-c">
						<p class="black">결제일</p>
						<p class="pt-s pb-s">${PAY_DD}일마다자동이체</p>
					</div>

					<div class="submit border-bottom">
						<p class="black">카드소유주</p>
						<p class="pt-s pb-s">${detailMap.CARD_OWNER}</p>
					</div>

					<div class="border-bottom">
						<p class="black">유효기간</p>
						<p class="pt-s pb-s">${fn:substring(detailMap.EXPIRE_YM, 0 ,2) }**년
							**월</p>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
		<div class="order-middle-message text-center border-bottom">
			<p>계약서 발송 정보를 입력하세요.</p>
			<div class="order-info-summary">
				<small>이메일 또는 주소로 계약서를 발송됩니다.<br>정보 변경이 필요하실 경우, 회원정보에서
					업데이트해주세요.
				</small>
			</div>
			<div class="text-center mt-s">
				<button type="button" class="btn-gray-dark inset-s pl-m pr-m"
					onclick="goMemberUpdate();">회원정보 수정</button>
			</div>
		</div>
		<div id="product-review" class="accordion">
			<h3>계약서 발송 정보</h3>
		</div>
		<div class="accordion-info inset-ml">
			<div class="submit layout-c mb-m border-bottom">
				<p class="black">주문자</p>
				<p class="pt-s pb-s">${clientVo.custNm }</p>
			</div>
			<div class="submit layout-c border-bottom">
				<p class="black">휴대전화</p>
				<p class="pt-s pb-s">${clientVo.ordrHp1 } - ${clientVo.ordrHp2 } - ${clientVo.ordrHp3}</p>
			</div>
			<div class="submit layout-c border-bottom">
				<p class="black">이메일</p>
				<p class="pt-s pb-s">
					${clientVo.ordrEmail1}@${clientVo.ordrEmail2}</p>
			</div>
			<div class="layout-c">
				<p class="black">주소</p>
				<p class="pt-s pb-s border-bottom">${clientVo.addr1 }
					${clientVo.addr1 }</p>
			</div>
		</div>
	</div>

	<div class="mynexen-tab tab-nav js-tab layout-r" id="sunab">
		<button type="button" id="buy" data-tab="tab-1">서비스내역</button>
		<button type="button" id="rent" data-tab="tab-2">수납내역</button>
	</div>

	<div id="tab-1" class="tab-content">
		<div class="mynexen-tab-service-info">
			<div class="tab-inner-header inset-m">
				<button type="button" class="small-tip md-trigger" data-modal="tip-1">Tip!</button>
				서비스 구분
			</div>
			<div class="accordion-box js-accordion">


				<c:if test="${fn:length(rsList11) > 0 }">
					<c:forEach var="list" items="${rsList11}" varStatus="status">
						<div id="" class="accordion bg">
							<h3>
								<span>기본</span> ${list.PrsNm }
							</h3>
						</div>
						<div class="accordion-info inset-m">
							<div class="service-info-detail">
								<dl>
									<dt>제공횟수</dt>
									<dd>${list.servCnt0}회</dd>
									<dt>잔여횟수</dt>
									<dd>${list.servCntr}회</dd>
								</dl>
								<dl>
									<dt>이용일자</dt>
									<dd>${list.procDay}</dd>
									<dt>이용전문점</dt>
									<dd>
										<div class="shop-btn-wrap">
											<button type="button" class="shop-info-box"
												onclick="fnStore('${list.procInCd}');">
												<span class="shop-name">${list.procInNm}</span> <!-- <span class="shop-view">검색</span> -->
											</button>
										</div>
									</dd>
									<dt>진행상태</dt>
									<dd>${list.dlvrStatNm}</dd>
								</dl>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${fn:length(rsList22) > 0 }">
					<c:forEach var="list" items="${rsList22}" varStatus="status">
						<div id="" class="accordion bg">
							<h3>
								<span>케어</span> ${list.PrsNm }
							</h3>
						</div>
						<div class="accordion-info inset-m">
							<div class="service-info-detail">
								<dl>
									<dt>제공횟수</dt>
									<dd>${list.servCnt0}회</dd>
									<dt>잔여횟수</dt>
									<dd>${list.servCntr}회</dd>
								</dl>
								<dl>
									<dt>이용일자</dt>
									<dd>${list.procDay}</dd>
									<dt>이용전문점</dt>
									<dd>
										<div class="shop-btn-wrap">
											<button type="button" class="shop-info-box"
												onclick="fnStore('${list.procInCd}');">
												<span class="shop-name">${list.procInNm}</span> <span
													class="shop-view">검색</span>
											</button>
										</div>
									</dd>
									<dt>진행상태</dt>
									<dd>${list.dlvrStatNm}</dd>
								</dl>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(rsList33) > 0 }">
					<c:forEach var="list" items="${rsList33}" varStatus="status">
						<div id="" class="accordion bg">
							<h3>
								<span>스폐셜</span> ${list.PrsNm }
							</h3>
						</div>
						<div class="accordion-info inset-m">
							<div class="service-info-detail">
								<dl>
									<dt>제공횟수</dt>
									<dd>${list.servCnt0}회</dd>
									<dt>잔여횟수</dt>
									<dd>${list.servCntr}회</dd>
								</dl>
								<dl>
									<dt>이용일자</dt>
									<dd>${list.procDay}</dd>
									<dt>이용전문점</dt>
									<dd>
										<div class="shop-btn-wrap">
											<button type="button" class="shop-info-box"
												onclick="fnStore('${list.procInCd}');">
												<span class="shop-name">${list.procInNm}</span> <span
													class="shop-view">검색</span>
											</button>
										</div>
									</dd>
									<dt>진행상태</dt>
									<dd>${list.dlvrStatNm}</dd>
								</dl>
							</div>
						</div>
					</c:forEach>
				</c:if>

			</div>



			<div class="rent-footer inset-m">
				<ul>
					<li><small>스페셜 서비스(걱정제로/엔진오일 서비스) 신청내역을 클릭하시면 상세 조회,
							수정, 삭제할 수 있습니다.(단, 수정, 삭제는 배송 상태가 요청 접수시에만 가능합니다.)</small></li>
					<li><small>엔진오일 서비스 신청 시, 고객님의 정확한 차량 정보 입력을 위해 차량등록증을
							확인해주세요. 정확하지 않은 정보입력으로 인해, 상이한 차종의 엔진오일 패키지[엔진오일,오일필터,에어필터]가 배송될
							경우 당사에서는 책임을 지지 않습니다.</small></li>
				</ul>
			</div>
		</div>
		<div class="btnArea type01" style="text-align: center;">

			<button type="button" class="type015 center" id="freeDmgJoin" style="display:none;" onclick="fn_damageServiceJoinGo('${detailMap.ordNo}');">무상 파손 보증 서비스 가입</button>
			<button type="button" class="type015 center" id="freeDmgEarlyJoin" style="display:none;" onclick="fn_abrasionServiceJoinGo('${detailMap.ordNo}');">무상 파손 & 조기마모 보증 서비스 가입</button>
			<button type="button" class="type015 center" id="freeDmgReq" style="display:none;" onclick="fn_damageServiceReqGo('${detailMap.ordNo}');">무상 파손 보증 서비스 신청</button>
			<button type="button" class="type015 center" id="freeDmgEarlyReq" style="display:none;" onclick="fn_abrasionServiceReqGo('${detailMap.ordNo}');">무상 파손 & 조기마모 보증 서비스 신청</button>

			<button type="button" class="type015 center" onclick="fn_zeroServiceGo();">걱정제로 서비스 신청</button>
			<button type="button" class="type015 center" onclick="fn_engineServiceGo();">엔진오일 서비스 신청</button>
		</div>
	</div>
	<div id="tab-2" class="tab-content">
		<div class="mynexen-tab-payment-history">

			<div class="search-month-option">
				<ul class="layout-r same-size">
					<li class="inline"><button type="button" class="month"
							onclick="dateInput('3', '0');">3개월</button></li>
					<li class="inline"><button type="button" class="month"
							onclick="dateInput('6', '0');">6개월</button></li>
					<li class="inline"><button type="button" class="month"
							onclick="dateInput('9', '0');">9개월</button></li>
					<li class="inline"><button type="button" class="month"
							onclick="dateInput('3', '0');">전체</button></li>
					<li class="inline"><button type="button" class="period-wrap">기간조회</button></li>
				</ul>
				<div id="period-wrap" class="order-basket" style="display: none;">
					<div class="dateTime layout-r same-size border-bottom">
						<div class="inline rentDate" style="position:relative;">
							<input type="text" name="datepicker" class="datepicker" id="dateStart" title="시작일" readonly="readonly">
						</div>
						<div class="inline rentDate" style="position:relative;">
							<input type="text" name="datepicker11" class="datepicker" id="dateEnd" title="종료일" readonly="readonly">
						</div>
						<button type="button" class="shop-view" onclick="myPayMonthListPage('1')" style="width:50%;">검색</button>
					</div>
				</div>
			</div>

			<div class="layout-r inset-m pt-0 pr-0">
				<div class="tab-allcheck inline align-middle">
					<input type="checkbox" id="arreChk0" name="" value="0"
						class="type01" recpamt="0" arreamt="0" value="0" class="type01"
						onclick="fnarreChk(this);"> <label for="arreChk0"><span></span>전체선택</label>
				</div>
				<!--
				<div class="late-payment inline align-middle align-right">
					<button type="button" class="md-trigger" data-modal="modal-5">전체 연체금 납부 안내</button>
				</div>
				 -->
			</div>

			<div class="inset-m border-top" id="myPayMonthList"></div>

			<div class="inset-m border-top" id="myPayMonthListArea" style="display: none;">
				<div class="layout-c service-info-detail">
					<dl>
						<dt>
							<b>전체연체금액</b>
						</dt>
						<dd>
							<b class="pay" id="sumArreAmtTxt"></b>
						</dd>
						<dt>
							<b>현재납부금액</b>
						</dt>
						<dd>
							<b class="pay" id="sumRecpAmtSp"></b>
						</dd>
						<dt>
							<b>잔여렌탈료합계</b>
						</dt>
						<dd>
							<b class="pay total" id="AmtSt"></b>
						</dd>
					</dl>
				</div>
			</div>

			<c:if test="${detailMap.STAT_CD eq '04'}">
				<div class="layout-c" style="display: none;">
					<button type="button"
						class="link layout-r text-left inset-m full-width btn-primary"
						onclick="fnOverdue();">
						<span>전체 연체금 납부신청</span>
						<!-- <span class="align-middle"></span> -->
					</button>
				</div>
			</c:if>
		</div>
	</div>




   <!-- ######################################### -->
      <!-- 납부방법변경 -->
		<div class="md-effect-1 fullPopup address-popup md-modal-3"
			id="modal-1">
			<div class="popContents">
				<a href="javascript:popClose();" class="layPopClose md-close"></a>
				<header class="noLine">
					<h2>납부방법 변경</h2>
				</header>

				<div class="popup-contents">
					<div class="inset-m order-basket">
						<div class="submit">
							<div>
								<span class="essen black">결제수단</span>
							</div>
							<div class="conWrap mt-m">
								<!-- js-radio UI -->
								<div class="js-radioUI inline-l layout-r">
									<div class="radio inline">
										<input type="radio" name="pay" id="pay1" checked="checked"
											onclick="fn_payTypeCh('card');" class="type06"
											title="신용카드 선택"><label for="pay1"><span>신용카드</span></label>
									</div>
									<div class="radio inline">
										<input type="radio" name="pay" id="pay2"
											onclick="fn_payTypeCh('acc');" class="type06" title="계좌이체 선택"><label
											for="pay2"><span>계좌이체</span></label>
									</div>
								</div>
								<!-- //js-radio UI -->
							</div>
						</div>

						<!-- js-radio UI contents -->
						<!-- ###################################### -->
						<!-- 신용카드 -->
						<div id="radioPaymentUI01">
							<div class="submit border-gray-bottom layout-c">
								<label for="info01"><span class="essen black">결제일</span>
								</label>
								<div class="conWrap layout-r inline-m">
									<select name="rtCardPayDy" id="rtCardPayDy"
										class="col-3 inline" title="결제일 선택">
										<option value="05" selected="selected">5일</option>
										<option value="15">15일</option>
										<option value="25">25일</option>
									</select>
									<div class="checkbox type01 inline">
										<input type="checkbox" id="rtCardAgree" name="rtCardAgree"
											value="0" class="checkbox-input align-middle"
											checked="checked"> <label
											class="checkbox-label align-middle" for="rtCardAgree">자동이체동의</label>
									</div>
								</div>
							</div>

							<div class="submit layout-c" name="cardArea">
								<label for="card-comment"><span class="essen black">카드정보</span>
								</label>
								<div
									class="conWrap layout-r same-size inline-m border-gray-bottom">
									<select class="inline" name="rtCardCorp" id="rtCardCorp"
										title="카드사 선택">
										<option value="">카드사 선택</option>
										<c:forEach var="cardCdList" items="${cardCdList}"
											varStatus="status">
											<option value="${cardCdList.cd}">${cardCdList.cdNm}</option>
										</c:forEach>
									</select> <input type="text" id="rtCardNo" name="rtCardNo"
										class="inline" title="카드번호 입력란" placeholder="카드번호를 입력하세요">
								</div>
								<p class="validation pt-s">
									<span><i class="ico11"></i>카드번호 입력시 “-”없이 숫자만 입력하세요.</span>
								</p>
							</div>

							<div class="submit border-gray-bottom" name="cardArea">
								<label for="rtCardOwner"><span class="essen black">카드소유주</span>
								</label> <input type="text" name="rtCardOwner" id="rtCardOwner"
									class="type03" value="${detailMap.CARD_OWNER }"
									title="카드소유주를 입력란" placeholder="카드소유주를 입력하세요">
							</div>

							<div class="submit border-gray-bottom" name="cardArea">
								<label for="rtCardValYr"><span class="essen black">유효기간</span>
								</label>
								<div class="conWrap layout-r inline-m">
									<select class="col-3 inline" name="rtCardValYr"
										id="rtCardValYr" title="년도 선택">
										<%for(int i=0;i<10;i++){%>
										<option value="<%=yy+i%>"><%=yy+i%></option>
										<%}%>
									</select> <select class="col-4 inline" name="rtCardValMn"
										id="rtCardValMn" title="월 선택">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</div>
							</div>
						</div>
						<!-- //신용카드 -->


						<!-- 계좌이체 -->
						<div id="radioPaymentUI02" name="bankArea">

							<div class="submit layout-c">
								<label for="rtAcctCorp"><span class="essen black">은행명</span>
								</label>
								<div
									class="conWrap layout-r same-size inline-m border-gray-bottom">
									<select class="inline" title="은행 선택" name="rtAcctCorp"
										id="rtAcctCorp">
										<option value="">은행 선택</option>
										<c:forEach var="bankCdList" items="${bankCdList}"
											varStatus="status">
											<option value="${bankCdList.cd}">${bankCdList.cdNm}</option>
										</c:forEach>
									</select> <input type="text" class="inline" name="rtAcctNo"
										id="rtAcctNo"
										onkeyup="this.value=number_filter(this.value); fn_setWritecan();"
										title="계좌번호 입력란" placeholder="계좌번호를 입력하세요">
								</div>
								<p class="validation pt-s">
									<span><i class="ico11"></i>계좌번호 입력시 “-”없이 숫자만 입력하세요.</span>
								</p>
							</div>

							<div class="submit border-gray-bottom">
								<label for="bank-owner"><span class="essen black">계좌소유주</span>
								</label> <input type="text" class="type03" name="rtAcctOwner"
									id="rtAcctOwner" onkeyup="fn_setWritecan();" title="계좌소유주를 입력란"
									placeholder="계좌소유주를 입력하세요">
								<div class="layout-r same-size">
									<input type="text" name="" class="type03 inline"
										id="bank-owner" title="계좌소유주를 입력란" placeholder="계좌소유주를 입력하세요">
									<button type="button" id="ars_button"
										class="dark-line border trans-bg inset-xs pl-m pr-m align-middle"
										onclick="fn_arsCallService(); event.preventDefault();">출금이체
										동의</button>
								</div>
							</div>

						</div>
						<!-- //계좌이체 -->
						<!-- ###################################### -->
						<!-- //js-radio UI contents -->
					</div>
				</div>

				<div class="btnArea layout-r same-size bottom-box">
					<button type="button" onclick="popClose();"
						class="inline inset-m btn-gray-light">취소</button>
					<button type="button" onclick="payChange();"
						class="inline inset-m btn-primary">발급</button>
				</div>
			</div>
		</div>
		<!-- //납부방법변경 -->




      <!-- 중도 선납/완납 -->
      <div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-2">
  <div class="popContents">
    <a href="javascript:popClose();" class="layPopClose md-close"></a>
    <header class="noLine">
      <h2>중도 선납/완납</h2>
    </header>

    <div class="popup-contents">
      <div class="inset-m order-basket">

        <div class="submit border-gray-bottom mb-l">
          <label for="month-rental"><span class="black">렌탈 기간</span></label>
          <p class="pl-0 pt-s pb-s"><b>${payDetail.periodNm}</b>개월 중 <b>${payDetail.thisMon}</b>개월 경과</p>
        </div>

        <div class="submit border-gray-bottom mb-l">
          <label for="month-rental"><span class="black">월 렌탈료</span></label>
          <p class="pl-0 pt-s pb-s"><fmt:formatNumber value="${payDetail.monAmt}" pattern="#,###" />원</p>
        </div>

        <div class="submit mb-l">
          <label for="bayType"><span class="essen black">납부 유형</span> </label>
          <div class="conWrap layout-r inline-m border-gray-bottom">
            <select class="inline" title="납부 유형 선택" id="bayType" onchange="fn_bayTypeCh();">
             <option value="t1" >중도선납</option>
	         <option value="t2">완납</option>
            </select>
          </div>
          <p class="validation pt-s" id="payment-result" style="display: none;">
            <span>중도 완납을 하시는 경우, 타이어의 소유권을 갖게 되며 프리미엄 서비스는 제공되지 않습니다.</span>
          </p>
        </div>



        <div class="submit mb-l" id="prepaymentSelectTr">
          <label for="payment-period"><span class="essen black">선납 기간</span> </label>
		<c:set var="ckDay" value="${fn:replace(payDetail.periodNm, '개월', '') - payDetail.thisMon}" />
		<c:set var="ckMm" value="6" />
		<fmt:formatNumber var="sumAnswer" value="${ckDay}" pattern="#.##"/>
		<fmt:parseNumber var="ckDayVar" value="${sumAnswer / 6}" integerOnly="true" />
		<c:choose>
			<c:when test="${ckDay >= 6}">
				<div class="conWrap layout-r inline-m border-gray-bottom">
					<select name="prptMon" id="prptMon" class="inline" title="선납기간 선택" onchange="fn_prptMon();">
					<option value="">선택</option>
					<c:forEach var="month" items="${monthList}">
						<option value="${month.maxCnt}">${month.maxCnt}개월</option>
					</c:forEach>
					</select>
				</div>
			</c:when>
			<c:otherwise>
				<p class="validation pt-s">
				    <span>렌탈 잔여 기간이 6개월 미만인 경우 중도 선납이 불가합니다.</span>
				</p>
			</c:otherwise>
		</c:choose>
        </div>

        <div class="submit">
          <div class="midwaypay" id="actType">
            <dl>
              <dt class="title">선납금액</dt>
              <dd>
                <span id="totRecpAmtSp">0</span>
              </dd>
            </dl>
            <dl style="display: none">
              <dt class="title">완납금액</dt>
              <dd>
                <span id="planAmtSp">0</span>
              </dd>
            </dl>
            <dl>
              <dt class="title">할인금액</dt>
              <dd class="discount">
                -<span id="totDcAmtSp">0</span>
              </dd>
            </dl>
            <dl>
              <dt class="title">잔여금액</dt>
              <dd class="total">
                <span id="remainAmtSp">0</span>
              </dd>
            </dl>
          </div>
        </div>
      </div>
    </div>

    <div class="btnArea layout-r same-size bottom-box">
      <button type="button" class="inline inset-m btn-gray-light" onclick="popClose();">취소</button>
      <button type="button" class="inline inset-m btn-primary" onclick="prePayment();">신청</button>
    </div>
  </div>
</div>




      <!-- //중도 선납/완납 -->
      <!-- 전체 연체금 납부안내 -->
      <!--
      <div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-5">
      <div class="popContents">
			<a href="javascript:popClose();" class="layPopClose md-close"></a>
			<header class="noLine">
			  <h2>전체 연체금 납부안내</h2>
			</header>

		    <div class="popup-contents-nobottom">
		      <div class="inset-m">
		        <h3>4회차 이상의 연체건부터 가상계좌를 통해 전체 연체금 납부가 가능합니다.</h3>
		        <p>아래 가상계좌로 입금하시면, 연체금이 일괄 납부 됩니다.</p>
		      </div>
		      <div class="bank-list">
		        <ul>
		          <li>
		            <b class="inline">국민은행</b>
		            <div class="layout-c inline-m">
		              <span class="inline">54556-4554-4545</span>
		              <em>넥쎈타이어</em>
		            </div>
		          </li>
		          <li>
		            <b class="inline">우리은행</b>
		            <div class="layout-c inline-m">
		              <span class="inline">556-4554-4545-565-000</span>
		              <em>넥쎈타이어</em>
		            </div>
		          </li>
		          <li>
		            <b class="inline">신한은행</b>
		            <div class="layout-c inline-m">
		              <span class="inline">1156-4554-4545</span>
		              <em>넥쎈타이어</em>
		            </div>
		          </li>
		          <li>
		            <b class="inline">국민은행</b>
		            <div class="layout-c inline-m">
		              <span class="inline">XXX-XXX-XXXXXX</span>
		              <em>넥쎈타이어</em>
		            </div>
		          </li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</div>
 -->
      <!-- //전체 연체금 납부안내 -->
      <div class="md-overlay"></div>
      <!-- 제공서비스 안내 -->
      <div class="popupWrap md-modal md-modal-3 md-effect-1" id="tip-1">
  <div class="popContents popup-tip">
    <a href="javascript:popClose();" class="layPopClose md-close"></a>
    <header>
      <div class="popup-tip-tag">Tip!</div>
      <h2>제공서비스 안내</h2>
    </header>

    <!--contents-->
    <div class="popup-tip-content pb-m">
      <div class="tip-service-layout">
        <h3>기본</h3>
        <dl>
          <dt>타이어 무상 장착</dt>
          <dd>계약한 렌탈 타이어 무상 장착 제공</dd>
        </dl>
      </div>
      <div class="tip-service-layout">
        <h3>케어</h3>
        <dl>
          <dt>방문점검</dt>
          <dd>정기방문을 통해 타이어 및 차량 10대 항목 무상점검</dd>
          <dt>위치교환서비스 무상</dt>
          <dd>계약기간 내 2회 한정, 타이어 위치교환 서비스 제공</dd>
          <dt>얼라인먼트 무상</dt>
          <dd>계약기간 내 1회 한정, 타이어 휠얼라인먼트 무상교정 서비스 제공</dd>
        </dl>
      </div>
      <div class="tip-service-layout">
        <h3>스페셜</h3>
        <dl>
          <dt>걱정제로 서비스</dt>
          <dd>계약한 타이어 개수만큼 타이어 무상 교체</dd>
          <dt>엔진오일 서비스</dt>
          <dd>엔진오일 3회 무상교체 엔진오일 교체 시, 수입차는 공임비 별도</dd>
        </dl>
      </div>
    </div>
    <!--contents-->
  </div>
</div>
      <!-- //제공서비스 안내 -->
      <div class="md-overlay"></div>
    <!-- ######################################### -->
    <!-- //Popup Group -->

	</form>


	</main>
</div>
<!-- //subContentsWrap -->

	<!-- 전문접 팝업  -->
	<div class="fullPopup md-modal-3 md-effect-1 " id="modalAgencyDetl">
      <div class="popContents order-basket">
        <a href="" onclick="javascript:fn_popupClose();" class="layPopClose md-close"></a>

        <header class="title" id="agencyHeader">
        </header>

        <!--contents-->
        <div class="popup-contents-nobottom">
          <div class="inset-ml">
			<div class="submit layout-c mb-m border-bottom">
              <p class="black">주소</p>
              <p class="pt-s addressView" id="agencyAddr">
              </p>
            </div>

            <div class="submit layout-c mb-m border-bottom">
              <p class="black">전화번호</p>
              <p class="pt-s pb-s" id="agencyTel"></p>
            </div>

            <div class="submit layout-c mb-m border-bottom">
              <p class="black">영업시간</p>
              <p class="pt-s pb-s" id="agencyBizTime"></p>
            </div>

            <div class="submit layout-c border-bottom">
              <p class="black">취급품목</p>
              <p class="pt-s pb-s">
                <!-- 상태아이콘 -->
                <div class="pb-s">
                  <div class="shop-state-icon layout-r inline inline-s" id="agencyWkTp">
                  </div>
                </div>
                <!-- 상태아이콘 -->
              </p>
            </div>

            <div class="submit layout-c border-bottom">
              <p class="black">탈착기</p>
              <p class="pt-s pb-s pInfo" id="agencyOpt1">
              </p>
            </div>

            <div class="submit layout-c border-bottom">
              <p class="black">얼라인먼트</p>
              <p class="pt-s pb-s pInfo" id="agencyOpt2">
              </p>
            </div>

            <div class="submit layout-c border-bottom">
              <p class="black">밸런스</p>
              <p class="pt-s pb-s" id="agencyOpt3">
              </p>
            </div>

            <p class="desc small font-gray po_m10">
              ※ 수입차 및 대형 차량의 경우 고급형 장비가 있는 곳에서 교체하시기 바랍니다.
            </p>

            <div class="mapView" style="height:200px" id="mapDivPopup">

            </div>

            <!-- slider -->
            <div class="store" >
	            <!-- <div class="swiper-store" id="agencyGall"> -->
	            <div id="agencyGall" >
	            </div>
          	</div>
			 <!-- //slider -->
          </div>
        </div>
            <!--contents-->
      </div>
    </div>
    <!-- 전문접 팝업  -->





<!-- ARS인증 추가 -->
<form name="ars_info" method="post">
	<table id="input_val">
		<tr>
			<td>
				<input type="hidden" name="SECR_KEY" id="SECR_KEY" value="jj0V4mXT1U4qeqx5CFAL" /> <!--  jj0V4mXT1U4qeqx5CFAL -->
				<input type="hidden" name="TR_CD" id="TR_CD" value="2300" />
				<input type="hidden" name="ORG_CD" id="ORG_CD" value="20018" />
				<input type="hidden" name="DATE" id="DATE" value="" />
				<input type="hidden" name="PHONE" id="PHONE" value="" />
				<input type="hidden" name="AUTH_NO" id="AUTH_NO" value="00" />
				<input type="hidden" name="AUTH_INQUERY" id="AUTH_INQUERY" value="" />
				<input type="hidden" name="REC_INQUERY" value="" /> <!-- 미사용 -->
				<input type="hidden" name="FILE_SAVE_YN" value="N" /> <!-- 미사용 -->
				<input type="hidden" name="FILE_NM" value="" /> <!-- 미사용 -->
				<input type="hidden" name="CUST_NM" id="CUST_NM" value="" />
				<input type="hidden" name="BANK_CD" id="BANK_CD" value="" />
				<input type="hidden" name="ACCT_NO" id="ACCT_NO" value="" />
				<input type="hidden" name="BIRTH_DAY" id="BIRTH_DAY" value="" />
				<input type="hidden" name="BUSL_NO" id="BUSL_NO" value="" />
				<input type="hidden" name="CUST_TP" id="CUST_TP" value="" />
				<input type="hidden" name="BANK_NM" id="BANK_NM" value="" />
			</td>
		</tr>
	</table>
	<div id="tot_time"></div>
	<div id="rtn"></div>
	<div id="s_source"></div>
	<div id="source"></div>
	<div id="ars_success" style="font-size: 12px">
		<input type="hidden" id="ars_succ_yn" name="ars_succ_yn" value="0" />
	</div>
</form>

<!-- 무상파손 및 조기마모 hidden value -->
<input type="hidden" id="servCd_h" 	     value="${freeDmgJoinChk.servCd}">
<input type="hidden" id="b00011UseCnt_h" value="${freeDmgJoinChk.B00011_USE_CNT}">
<input type="hidden" id="b00012UseCnt_h" value="${freeDmgJoinChk.B00012_USE_CNT}">
<input type="hidden" id="registIngYn_h"  value="${freeDmgJoinChk.registIngYn}">
<input type="hidden" id="applyIngYn_h"   value="${freeDmgJoinChk.applyIngYn}">
<input type="hidden" id="serverMode" 	 value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->


<script>
    var inputNm = "JSONData=";
    var start_time = "";
    var target_url = "<%=AppContext.getString(WebConstants.ARS_RENTAL_URL)%>";
    var hostname = window.location.hostname;//http://도메인
    	hostname = hostname.toLowerCase();


	$(document).ready(function(){
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg mynexen-worryzero'></div>");
		/* page background image End */

		//납부방법 변경 세팅
		fn_payTypeCh("card");

		var startDt = '${detailMap.procDay}';
		var endDt = today();
		if (startDt == "") {
			startDt = today();
		}

		//달력 세팅
		$('#dateStart').datepicker({
			showOn: "both",
			buttonImage: "/img/common/ico_calendar.png",
			buttonImageOnly: true,
			dateFormat: 'yy-mm-dd',
			yearRange: 'c-0:c+2',
			maxDate: '+0d',
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			disabled:false
	    });

		//달력 세팅
		$('#dateEnd').datepicker({
			showOn: "both",
			buttonImage: "/img/common/ico_calendar.png",
			buttonImageOnly: true,
			dateFormat: 'yy-mm-dd',
			yearRange: 'c-0:c+2',
			maxDate: '+0d',
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			disabled:false
	    });

		$('#dateStart').val(startDt);
		$('#dateEnd').val(endDt);

		//연체금 영역 숨김
		$(".price.center").hide();

		jsf__chk_type('card');
		chk_pay();
		//create_goodInfo();

		if ( navigator.platform ) {
			//if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
				//console.log("MOBILE CHECK");
				// 필요에 따라 jsf__chk_type 사용해서 값 변경, 모바일은 PC와 달리 pay_method 값에 차이가 있어요
				jsf__chk_type( 'card' );
			//}
		}
	});

	/* 결제창 스타일? STR */
	  var controlCss = "/css/rental/style_mobile.css";
	  var isMobile = {
	    Android: function() {
	      return navigator.userAgent.match(/Android/i);
	    },
	    BlackBerry: function() {
	      return navigator.userAgent.match(/BlackBerry/i);
	    },
	    iOS: function() {
	      return navigator.userAgent.match(/iPhone|iPad|iPod/i);
	    },
	    Opera: function() {
	      return navigator.userAgent.match(/Opera Mini/i);
	    },
	    Windows: function() {
	      return navigator.userAgent.match(/IEMobile/i);
	    },
	    any: function() {
	      return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
	    }
	  };

	  if( isMobile.any() ){
	    //document.getElementById("cssLink").setAttribute("href", controlCss);
	  }
	/* 결제창 스타일? END */

    /* kcp web 결제창 호츨 STR */
	function call_pay_form() {
	  var v_frm = document.order_info;

		//선납,완납
	  if($("#modal-2").attr("class").indexOf("md-show") > -1) {
		  v_frm.param_opt_1.value = v_frm.prptMon.value;
		  v_frm.param_opt_2.value = v_frm.bayType.value;
		  v_frm.param_opt_3.value = v_frm.prptMon.value;

		  v_frm.action = "/mypage/pp_cli_hub_my";

	  }
		//연체금
	  else {
		  v_frm.param_opt_1.value = v_frm.overdueNum.value; // 결제 카운트
		  v_frm.param_opt_2.value = v_frm.recpAmt.value;    // 월 연체료 (월 연체료 * 결제 카운트 = 결제 금액)
		  v_frm.param_opt_3.value = v_frm.ordrId.value;     // 주문 번호
	  }


	  document.getElementById("wrap").style.display = "none";
	  document.getElementById("layer_all").style.display   = "block";

	  document.charset = "euc-kr";

	  v_frm.target = "frm_all";
	  v_frm.action = PayUrl;
	  //v_frm.Ret_URL.value = "/view/snl_m/mynxn/myPayDetail.do"; // 지금 현제 페이지 URL, 필수임

	  v_frm.submit();
	}
	/* kcp web 결제창 호츨 END */

	/* kcp 통신을 통해 받은 암호화 정보 체크 후 결제 요청 STR */
	function chk_pay(){

	    self.name = "tar_opener";
	    var pay_form = document.pay_form;
	    var order_info = document.order_info;

	    if (pay_form.res_cd.value == "3001") {
	      del_order_info();
	      alert("사용자가 취소하였습니다.");
	      pay_form.res_cd.value = "";
	    }

	    document.getElementById("wrap").style.display = "block";
	    document.getElementById("layer_all").style.display  = "none";

		if (pay_form.enc_info.value) {
	      pay_form.submit();
		}

	}
	/* kcp 통신을 통해 받은 암호화 정보 체크 후 결제 요청 END */

	/* 에스크로 결제시 필요한 장바구니 생성 STR */
	function create_goodInfo(){
		var chr30 = String.fromCharCode(30);	// ASCII 코드값 30
		var chr31 = String.fromCharCode(31);	// ASCII 코드값 31

		var good_info = "seq=1" + chr31
		+ "ordr_numb=${orderVO.ordrIdxx}" + chr31
		+ "good_name=${orderVO.patternCd}" + chr31
		+ "good_cntx=1" + chr31
		+ "good_amtx=${orderVO.regiCdAmt}";

		document.order_info.good_info.value = good_info;
	}
	/* 에스크로 결제시 필요한 장바구니 생성 END */

	/* 모바일 결제 방식 설정 STR */
	function jsf__chk_type( item ) {
	    if ( item == "card" ) {
		  document.order_info.pay_method.value = "CARD";
	      document.order_info.pay_mod.value = "N";
	    } else if ( item == "acnt" ) {
	      document.order_info.pay_method.value = "BANK";
	      document.order_info.pay_mod.value = "O";
	    } else if ( item == "vcnt" ) {
	      document.order_info.pay_method.value = "VCNT";
	      document.order_info.pay_mod.value = "O";
	    } else if ( item == "mobx" ) {
	      document.order_info.pay_method.value = "MOBX";
	      document.order_info.pay_mod.value = "N";
	    } else if ( item == "ocb" ) {
	      document.order_info.pay_method.value = "TPNT";
	      document.order_info.van_code.value = "SCSK";
	      document.order_info.pay_mod.value = "N";
	    } else if ( item == "tpnt" ) {
	      document.order_info.pay_method.value = "TPNT";
	      document.order_info.van_code.value = "SCWB";
	      document.order_info.pay_mod.value = "N";
	    } else if ( item == "scbl" ) {
	      document.order_info.pay_method.value = "GIFT";
	      document.order_info.van_code.value = "SCBL";
	      document.order_info.pay_mod.value = "N";
	    } else if ( item == "sccl" ) {
	      document.order_info.pay_method.value = "GIFT";
	      document.order_info.van_code.value = "SCCL";
	      document.order_info.pay_mod.value = "N";
	    } else if ( item == "schm" ) {
	      document.order_info.pay_method.value = "GIFT";
	      document.order_info.van_code.value = "SCHM";
	      document.order_info.pay_mod.value = "N";
	    }
	}
	/* 모바일 결제 방식 설정 END */

	/* 결제 연동 - 모바일 kcp_AJAX() 호출 STR */
	function call_kcp_ajax() {
		var form = document.order_info;

		var hostname = window.location.hostname.toLowerCase();
		var url = "";

		if(hostname.indexOf("dev") > -1){
			url = "http://"+window.location.hostname+":8888";
		}else if(hostname == "localhost"){
			url = "http://"+window.location.hostname+":18080";
		}else{
			url = "https://"+window.location.hostname;
		}

		form.Ret_URL.value = url+"/mypage/myRentalDetail?ordNo=${payDetail.ordNo}";
		kcp_AJAX();
	}
	function kcp_AJAX(){
		if(ajax_flag) {
        	var url    = "/mypage/orderApproval";
            var form = document.order_info;
            var params = "?site_cd=" + form.site_cd.value
                       + "&ordr_idxx=" + form.ordr_idxx.value
                       + "&good_mny=" + form.good_mny.value
                       + "&pay_method=" + form.pay_method.value
                       + "&escw_used=" + form.escw_used.value
                       + "&good_name=" + form.good_name.value
                       + "&response_type=" + form.response_type.value
                       + "&Ret_URL=" + form.Ret_URL.value;


            console.log(params)

            sendRequest( url + params );

            ajax_flag = false;
        } else {
            alert("통신 중입니다. 잠시만 기다려 주세요.");
        }
	}
	/* 결제 연동 - 모바일 kcp_AJAX() 호출 END */
    </script>


<script type="text/javascript">

	var serverMode = $("#serverMode").val();
	var servCd = $('#servCd_h').val();
	var b00012UseCnt = $('#b00012UseCnt_h').val();
	var b00011UseCnt = $('#b00011UseCnt_h').val();
	var registIngYn = $('#registIngYn_h').val();
	var applyIngYn = $('#applyIngYn_h').val();
	console.log('serverMode ::', serverMode);

	if(serverMode != "prd"){ //운영이 아니면
		//무상파손&조기마모 버튼 제어
		freeDmgSrvBtnCtl();
	}

	/******************************** 중도 선납,완납 ***********************************************/
	//중도 선납/완납 팝업 오픈
	function fn_actTypePop(){
		$("#actType").val("at2");
		$("input[name='atNum']").val("at2")
		$("#modal-2").addClass("md-show");
	}
	//선납, 완납 select 선택 이벤트
	function fn_bayTypeCh(){
		var bayType = $("#bayType").val();
		var rdoOrdNo = '${payDetail.ordNo}';

		// 초기화
		$("#totRecpAmtSp").text("0"); 	//납부금액
		$("#totDcAmtSp").text("0");   	//할인
		$("#remainAmtSp").text("0");  	//잔액
		$("#planAmtSp").text("0");  	//완납 시 금액
		$("#paySum").val("0");			//실납부

		//선납
		if(bayType == "t1"){
			$("#actType dl").eq(0).show();
			$("#actType dl").eq(1).hide();
			$("#actType dl").eq(2).show();
			$("#prepaymentSelectTr").show();
		}
		//완납금 조회
		else{
			$("#prepaymentSelectTr").hide();
			$("#actType dl").eq(0).hide();
			$("#actType dl").eq(1).show();
			$("#actType dl").eq(2).hide();

			$.ajax({
	            type: "POST",
	            dataType: "json",
	            url: "/mypage/calFullPay",
	            data: "ordNo="+ rdoOrdNo,
	            success: function (data) {
	            	if(data.rtnCode == -1) {
			    		alert("고객 센터 1855-0100으로 문의를 바랍니다.");
			    		return;
			    	}

	            	$("#planAmtSp").text(NumUtil.setComma(data.planAmt)); 	//완납 시 금액
	            	$("#paySum").val(data.planAmt.replace("-",""));			//실납부
	            },
	            error: function(xhr,status,error){
	            	btn_change("-1");
	            	alert("고객 센터 1855-0100으로 문의를 바랍니다.");
	            }
	        });
		}
	}
	//선납금 조회(완납금은 화면 로드 시 조회)
	function fn_prptMon(){
		var prptMon  = $("#prptMon").val();
		var rdoOrdNo = '${payDetail.ordNo}';

		if(prptMon == ""){
			$("#totRecpAmtSp").text("0"); 	//납부금액
	    	$("#totDcAmtSp").text("0");   	//할인
	    	$("#remainAmtSp").text("0");  	//잔액
	    	$("#paySum").val("0");  		//실납부
		}else{
			$.ajax({
	            type: "POST",
	            dataType: "json",
	            url: "/mypage/calPay",
	            data: "prptMon="+ prptMon+"&ordNo="+ rdoOrdNo+"&dccd="+ "",
	            success: function (data) {
	            	console.log(data)

	            	if(data.rtnCode == -1) {
			    		alert("고객 센터 1855-0100으로 문의를 바랍니다.");
			    		return;
			    	}

	            	$("#totRecpAmtSp").text(NumUtil.setComma(data.totRecpAmt)); 	//납부금액
	            	$("#totDcAmtSp").text(NumUtil.setComma(data.totDcAmt));   	//할인
	            	$("#remainAmtSp").text(NumUtil.setComma(data.remainAmt));  	//잔액
	            	$("#paySum").val(data.totRecpAmt);			//실납부

	            },
	            error: function(xhr,status,error){
	            	btn_change("-1");
	            	alert("고객 센터 1855-0100으로 문의를 바랍니다.");
	            }
	        });
		}
	}

	//선납, 완납 신청 하기 > 결제
	function prePayment() {
		var url = "";
		var valid_message = valid_request();
		var actType = $("#actType").val();
		var bayType = $("#bayType").val();
		var prptMon = $("#prptMon").val();
		var rtPayMtd = $("#rtPayMtd").val();

		if(bayType == 't1' && prptMon == ""){
			alert("선납기간을 선택해 주세요");
			return;
		}

		var paySum = $("#paySum").val();
		document.order_info.good_mny.value = paySum;

		call_kcp_ajax();
	}

	/************************************ 중도 선납,완납!!! ***********************************************/


	/************************************ 납부 방법 변경 ***********************************************/

	//납부 방법 변경 신청 팝업 호출
	function fn_payTypeChPop(){
		//결제계좌변경, 중도선납/완납 구분 (2019-01-15 안지홍)
		// at2일경우 중도선납/완납 탭 선택
		$("#actType").val("at1");
		$("input[name='atNum']").val("at1");
		$("#modal-1").addClass("md-show");
	}

	//납부 방법 변경
	function fn_payTypeCh(gbn){
		if(gbn == "card"){
			$("div[name='cardArea']").show();
			$("div[name='bankArea']").hide();
			$("#rtPayMtd").val("C");
		}else if(gbn == "acc"){
			$("div[name='cardArea']").hide();
			$("div[name='bankArea']").show();
			$("#rtPayMtd").val("A");
		}
	}

	//납부방법 변경 유효성 체크
	function valid_request() {
		var rtCardPayDy = $("#rtCardPayDy").val();
		var rtCardAgree = $("#rtCardAgree").val();
		var rtCardCorp = $("#rtCardCorp").val();
		var rtCardNo = $("#rtCardNo").val();
		var limit = $("#limit").val();
		var limit_m = $("#limit_m").val();
		var bankselect = $("#rtAcctCorp").val();
		var banknum = $("#rtAcctNo").val();
		var actType = $("#actType").val();

		if(actType == "at1"){ // 변경
			//신용카드
			if (rtCardPayDy == "") {
				return "결제일을 선택하지 않으면 결제계좌를 변경할 수 없습니다";
			}
			if (rtCardAgree == "") {
				return "자동이체 동의를 하지 않으면 결제계좌를 변경할 수 없습니다";
			}

			if ($("#pay1").is(":checked")) {
				//마스터 비자의 경우 16자리 보다 많았던거 같은 기억이 있는데 나중에 확인 필요
				if (rtCardNo.replace(/[^0-9]/gi, "") == "" || rtCardNo.replace(/[^0-9]/gi, "").length < 15) {
					return "카드번호를 정확하게 입력하지 않으면 결제계좌를 변경할 수 없습니다";
				}
			} else {
				if (bankselect == "") {
					return "은행명을 선택하지 않으면 결제계좌를 변경할 수 없습니다";
				}
				//계좌번호 유효성 검사는 특정하기 어렵지 않을까 싶다(은행별 계좌번호 길이 구성이 다른 것으로 알고 있음)
				if (banknum.replace(/[^0-9]/gi, "") == "" || banknum.replace(/[^0-9]/gi, "").length < 14) {
					return "계좌번호를 정확하게 입력하지 않으면 결제계좌를 변경할 수 없습니다";
				}
			}

		}

		return "";
	}

	function validationChk() {
		var rtPayMtd = $("#rtPayMtd").val();
		var rtCardPayDy = $("#rtCardPayDy").val();
		var rtCardAgree = $("#rtCardAgree").val();
		var rtCardCorp = $("#rtCardCorp").val();
		var rtCardNo = $("#rtCardNo").val();
		var rtCardOwner = $("#rtCardOwner").val();
		var rtCardValYr = $("#rtCardValYr").val();
		var rtCardValMn = $("#rtCardValMn").val();
		var bankCd = $("#rtAcctCorp").val();		//은행 코드
		var acctNumber = $("#rtAcctNo").val();		//계좌번호
		var acctOwner = $("#rtAcctOwner").val();   	//계좌소지자명

		if(rtCardPayDy == ""){
			alert("결제일을 선택해주세요");
			//frm.rtCardPayDy.focus();
			return false;
		}
		if( $('input:checkbox[name=rtCardAgree]').is(':checked') == false ){
			alert("자동이체 동의를 체크해주세요");
			//frm.rtCardAgree.focus();
			return false;
		}

		if(rtPayMtd == "C"){
			if(rtCardCorp == ""){
				alert("카드사명을 선택해주세요");
				//frm.rtCardCorp.focus();
				return false;
			}
			if(rtCardNo == ""){
				alert("카드번호를 입력해주세요");
				//frm.rtCardNo.focus();
				return false;
			}
			if(rtCardOwner == ""){
				alert("카드소유주를 입력해주세요");
				//frm.rtCardOwner.focus();
				return false;
			}
			if(rtCardValYr == "" || rtCardValMn == ""){
				alert("유효기간을 입력해주세요");
				//frm.rtCardValYr.focus();
				return false;
			}
		}
		if(rtPayMtd == "A"){
			if(document.getElementById("ars_succ_yn").value == "0" ||
			   document.getElementById("CUST_NM").value != acctOwner ||
			   document.getElementById("ACCT_NO").value != acctNumber ||
			   document.getElementById("BANK_CD").value != bankCd){
				document.getElementById("ars_succ_yn").value = "0";
				alert("출금이체동의 버튼을 클릭해주세요");
				return false;
			}
		}

		var payType = rtPayMtd;
		if(payType=="C"){//카드
			//frm.use_pay_method.value="100000000000";
			//frm.escw_used.value = "N";
			//frm.pay_mod.value = "N";
		}else{//계좌 A
			//frm.use_pay_method.value="010000000000";
			//frm.escw_used.value = "Y";
			//frm.pay_mod.value   = "Y";
		}
		return true;
	}

	//신청 - 결제 계좌 변경
	function payChange() {
		if(!$("#rtCardAgree").is(":checked")) {
			alert("자동이체동의 후 진행 하실 수 있습니다.");
			return;
		}

		var url = "";
		var valid_message = valid_request();
		var actType = $("#actType").val();
		var bayType = $("#bayType").val();
		var prptMon = $("#prptMon").val();
		var rtPayMtd = $("#rtPayMtd").val();

		if(actType == 'at1'){
			if (valid_message != "") {
				alert(valid_message);
				return false;
			}

			if (confirm("결제 정보를 변경 하시겠습니까?")) {
				confirm_cardNAcct();
			}

			//임시 false return;
			return false;
		}
	}
	//결제하기(주문하기) 버튼 클릭 시 카드 또는 계좌정보 인증요청(1단계)
	//고객유형이 사업자이고 개인사업자인 경우는
	//개인의 결제정보를 인증할지
	//회사의 결제정보로 인증할지 화면에서 선택가능
	//<!-- 고객구분=개인:1/법인:2-->
	//<!-- 법인회원구분=개인사업자:1/법인사업자:2-->
	function confirm_cardNAcct(){
		var payType = $("#rtPayMtd").val();
		var custDivCd = '<c:out value="${clientVo.custDivCd}"/>';  //회원구분
		var comDivCd = '<c:out value="${clientVo.comDivCd}"/>';    //법인회원구분(1:개인/2:법인)
		var confirmDivcd = $("#confirmDivcd").val(); 	//계좌/카드 본인확인 대상

		if(payType=="C"){ //렌탈결제가 카드이면
			if(custDivCd=="1"){                            //개인회원
				confirm_card("1");
			}else if(custDivCd=="2"){                      //법인회원
				if(comDivCd=="2"){                        //법인사업자
					confirm_card("2");
				}else if(comDivCd=="1"){                  //개인사업자
					if(confirmDivcd=="1"){
						confirm_card("1");
					}else{
						confirm_card("2");
					}
				}
			}
		}else{//렌탈결제가 계좌이면
			if(custDivCd=="1"){            //개인회원
				confirm_acct("1");
			}else if(custDivCd=="2"){      //법인회원
				if(comDivCd == "2"){       //법인사업자
					confirm_acct("2");
				}else if(comDivCd=="1"){   //개인사업자
					if(confirmDivcd=="1"){
						confirm_acct("1");
					}else{
						confirm_acct("2");
					}
				}
			}
		}
	}

	/************************************ 카드로 변경 ***********************************************/
	//카드번호 유효성 체크
	function confirm_card(confirm_gb){
		if(!validationChk()){
			return;
		}

		var cardNum = $("#rtCardNo").val();      //카드번호
		var cardValYr = $("#rtCardValYr").val();   //카드유효기간년
		var cardValMn = $("#rtCardValMn").val();   //카드유효기간월
		var cardOwner = $("#rtCardOwner").val();   //카드소지자명
		var confirmGb = confirm_gb;              //사용자구분(개인:1 /법인:2)0
		var birthd = "";                      //생년월일
		var licenseNum = "";                      //사업자번호
		var custNm = "${clientVo.custNm}"; //고객명
		var cardCd = $("#rtCardCorp").val();    //카드사코드

		if(confirmGb=="1"){           //개인명의로
			confirmGb = "1";
			birthd = "${clientVo.legalBrthYY}${clientVo.legalBrthMM}${clientVo.legalBrthDD}";                 //생년월일
			birthd = birthd.substring(2, 8);
		}else if(confirmGb=="2"){        //사업체명의로
			confirmGb = "2";
			licenseNum = "${clientVo.bizRegNo1}${clientVo.bizRegNo2}${clientVo.bizRegNo3}";
		}

		var param =   "pay_id=" + cardNum +          //카드번호
			 	      "&pay_expiry_yy="+cardValYr+     //카드유효기간년
			   	      "&pay_expiry_mm="+cardValMn+     //카드유효기간월
			   	      "&pay_owner_nm="+cardOwner+      //카드소지자명
			   	      "&cmbGubun="+confirmGb+          //사용자구분(개인:01 /법인:02)
			   	      "&pay_cert_no="+birthd+       //생년월일
			   	      "&busl_no="+licenseNum+           //사업자번호
			   	      "&cust_name="+custNm+         //고객명
			   	      "&cardcomCd="+cardCd;         //카드사코드

		$.ajax({
			type: "POST",
		   	url:  "/order/kcphubBatch",
		   	data: param,
		   	success: function(data){
			   if(data.resCd != "0000"){
					alert("계좌/카드 본인인증 결과 잘못된 정보입니다. 렌탈료 결제 정보를 확인해 주세요.")
					return;
				}else {
					//var frm = document.order_info;
					//frm.batchKey.value = data.batchKey;
					//20200727 kstka 카드사코드 리턴
					$("#rtCardCorp").val(data.cardcomCd);

					var rdoOrdNo 	= '${detailMap.ordNo}';
					var batchKey 	= data.batchKey;
					var rtPayMtd 	= $("#rtPayMtd").val();
					var rtCardPayDy = $("#rtCardPayDy").val();
					var rtAcctCorp 	= $("#rtAcctCorp").val();
					var rtAcctNo 	= $("#rtAcctNo").val();
					var rtCardOwner = $("#rtCardOwner").val();
					var rtCardCorp  = $("#rtCardCorp").val();
					var rtCardNo 	= $("#rtCardNo").val();
					var rtCardValYr = $("#rtCardValYr").val();
					var rtCardValMn = $("#rtCardValMn").val();

					//var frm = document.order_info;
					//frm.rdoOrdNo.value = rdoOrdNo;
					//frm.rtAcctCorp.value = '';
					//frm.rtAcctNo.value = '';

					var params =
						{
							rdoOrdNo : rdoOrdNo,
							rtPayMtd : rtPayMtd,
							rtCardPayDy : rtCardPayDy,
							rtAcctCorp : rtAcctCorp,
							rtAcctNo : rtAcctNo,
							batchKey : batchKey,
							rtCardOwner : rtCardOwner,
							rtCardCorp : rtCardCorp,
							rtCardNo : rtCardNo,
							rtCardValYr : rtCardValYr,
							rtCardValMn : rtCardValMn
						};

					console.log('params test::', params);

					$.ajax({
					    url: "/mypage/updatemyPayMytd",
					    type: "POST",
					    dataType: "json",
					    data: params,
					    success: function(data) {
					    	console.log(data)
					    	if(data.successCode == -1) {
					    		alert(data.returnMessage);
					    		return;
					    	}

							alert("성공 적으로 변경 되었습니다.");
							$(".md-effect-1").removeClass("md-show");
					    },
					    error: function (request, status, error) {
					    	console.log(error)
						}
					});
				}
		   },
		  	error:function(request, status, error){
		  		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                        //alert("카드번호 유효성 체크 처리중 오류가 발생했습니다.");
		  	}
		});
	}


	/************************************ 카드로 변경 !!***********************************************/

	/************************************ 계좌이체로 변경 ***********************************************/
	//계좌번호 유효성 체크
	function confirm_acct(confirm_gb){
		if(!validationChk()){
			return;
		}

		var frm  = document.order_info;
		var custDivCd = ""; 						//회원구분
		var BLNo = "";								//생년월일 및 사업자번호
		var bankCd = $("#rtAcctCorp").val();		//은행 코드
		var acctNumber = $("#rtAcctNo").val();		//계좌번호
		var acctOwner = $("#rtAcctOwner").val();   	//계좌소지자명
		var custNm = '${clientVo.custNm}';

		if(confirm_gb=="1"){                //개인명의로
	        custDivCd="00";
			var birthd = "${clientVo.legalBrthYY}${clientVo.legalBrthMM}${clientVo.legalBrthDD}";                 //생년월일
			birthd = birthd.substring(2, 8);
			BLNo = birthd;
		}else if(confirm_gb=="2"){          //사업자명의로
			custDivCd="01";
			BLNo = "${clientVo.bizRegNo1}${clientVo.bizRegNo2}${clientVo.bizRegNo3}";
		}

		$.ajax({
			type: "POST",
		   	url:  "/order/kftcCmsDocInfo",
		   	data: "userType="+ custDivCd +                      //회원구분
		   	      "&bankCd=" + bankCd +
		   	      "&acctCd=" + acctNumber +
		   	      "&bizNo="  + BLNo +
		   	      "&custNm="+ custNm +
		   	      "&ownerNm="+ acctOwner,
		   	success: function(data){
		   		if(data.returnCode != "0000"){
					alert("계좌/카드 본인인증 결과 잘못된 정보입니다. 렌탈료 결제 정보를 확인해 주세요.")
					return;
				}

				var rdoOrdNo 	= '${detailMap.ordNo}';
				var batchKey 	= data.batchKey;
			  //var batchKey = $("#batchKey").val();
				var rtPayMtd 	= $("#rtPayMtd").val();
				var rtCardPayDy = $("#rtCardPayDy").val();
				var rtAcctCorp 	= $("#rtAcctCorp").val();
				var rtAcctNo 	= $("#rtAcctNo").val();
				var rtCardOwner = $("#rtCardOwner").val();
				var rtCardCorp  = $("#rtCardCorp").val();
				var rtCardNo 	= $("#rtCardNo").val();
				var rtCardValYr = $("#rtCardValYr").val();
				var rtCardValMn = $("#rtCardValMn").val();

				var params =
				{
					rdoOrdNo : rdoOrdNo,
					rtPayMtd : rtPayMtd,
					rtCardPayDy : rtCardPayDy,
					rtAcctCorp : rtAcctCorp,
					rtAcctNo : rtAcctNo,
					batchKey : batchKey,
					rtCardOwner : rtCardOwner,
					rtCardCorp : rtCardCorp,
					rtCardNo : rtCardNo,
					rtCardValYr : rtCardValYr,
					rtCardValMn : rtCardValMn
				};

				console.log('params test::', params);

				/*
				var frm = document.order_info;
				frm.rdoOrdNo.value = rdoOrdNo;
				frm.rtCardOwner.value = '';
				frm.rtCardCorp.value = '';
				frm.rtCardNo.value = '';
				frm.rtCardValYr.value = '';
				frm.rtCardValMn.value = '';
				*/

		   		$.ajax({
				    url: "/mypage/updatemyPayMytd",
				    type: "POST",
				    dataType: "json",
				    data: params,
				    success: function(data) {
				    	console.log(data)
				    	if(data.successCode == -1) {
				    		alert(data.returnMessage);
				    		return;
				    	}

						alert("성공 적으로 변경 되었습니다.");
						$(".md-effect-1").removeClass("md-show");
				    },
				    error: function (request, status, error) {
				    	console.log(error)
					}
				});

		   	},
		  	error:function(request, status, error){
				alert("계좌번호 유효성 체크 처리중 오류가 발생했습니다.");
		  	}
		});
	}

	//ARS인증 기능 java로 대체
	function fn_arsCallService(){
	   	if(!account_check()){
	   		return false;
	   	}
	   	$('#ars_button').html("<div class='btn ty6'>고객님의 등록된 휴대폰번호로 ARS인증 중입니다. 잠시만 기다려주세요.</div>");
		var frm = document.ars_info;
		$.ajax({
			type: "POST",
		   	url:  "/order/arsCallSvr",
		   	data: "PHONE="+ $("#PHONE").val() +
		   	      "&CUST_NM=" + $("#CUST_NM").val() +
		   	      "&BANK_CD=" + $("#BANK_CD").val() +
		   	      "&BANK_NM=" + $("#BANK_NM").val() +
		   	      "&ACCT_NO="  + $("#ACCT_NO").val() +
		   	      "&BUSL_NO="  + $("#BUSL_NO").val() +
		   	      "&BIRTH_DAY="  + $("#BIRTH_DAY").val() +
		   	      "&CUST_TP=" + $("#CUST_TP").val(),
		   	success: function(result){
				if(result.rtnCode != -1){
					alert("출금이체동의 처리가 완료되었습니다.");
					fn_setReadonly();
				}else{
					alert("출금이체동의 처리중 오류가 발생했습니다.()");
					$('#rtn').html(result);
					fn_setWritecan();
				}
		   	},
		  	error:function(request, status, error){
	            alert("출금이체동의 처리중 오류가 발생했습니다.");

		  	}
		});
	}
	function fn_setReadonly() {
		var frm = document.order_info;
		document.getElementById("ars_succ_yn").value = "1";
		$('#ars_button').hide();
	}
	function fn_setWritecan() {
		var frm = document.order_info;
		document.getElementById("ars_succ_yn").value = "0";
		$('#ars_button').show();
	}
	//출금 동의 신청 유효성 체크
	function account_check(){
		//var frm = document.order_info;
		var rtAcctCorp = $("#rtAcctCorp").val();
		var rtAcctNo = $("#rtAcctNo").val();
		var rtAcctOwner = $("#rtAcctOwner").val();

		if(rtAcctCorp == ""){
			alert("은행명을 선택해주세요");
			frm.rtAcctCorp.focus();
			return false;
		}
		if(rtAcctNo == ""){
			alert("계좌번호를 입력해주세요");
			frm.rtAcctNo.focus();
			return false;
		}
		// 평생계좌 신청 불가
		if((rtAcctNo.length==10 || rtAcctNo.length==11) && rtAcctCorp == "003"){
			alert("평생계좌는 자동이체 신청이 불가능합니다.");
			//frm.rtAcctNo.focus();
			return false;
		}
		if(rtAcctNo.length>=10 && rtAcctNo.length<=14 && rtAcctCorp == "088" && rtAcctNo.substr(0,3)=="010"){
			alert("평생계좌는 자동이체 신청이 불가능합니다.");
			//frm.rtAcctNo.focus();
			return false;
		}
		if(rtAcctOwner == ""){
			alert("계좌소유주를 입력해주세요");
			//frm.rtAcctOwner.focus();
			return false;
		}

		document.getElementById("PHONE").value = '<c:out value="${clientVo.ordrHp1}"/>' + '<c:out value="${clientVo.ordrHp2}"/>' + '<c:out value="${clientVo.ordrHp3}"/>';
		document.getElementById("DATE").value = getTimeStamp();
		document.getElementById("CUST_NM").value = rtAcctOwner;
		document.getElementById("ACCT_NO").value = rtAcctNo;
		document.getElementById("BANK_CD").value = rtAcctCorp;
		document.getElementById("CUST_TP").value = "0" + '<c:out value="${clientVo.custDivCd}"/>';

		var authNo = (Math.floor(Math.random() * 100)) + ""; // 인증번호 랜덤
		var bankNm = $("#rtAcctCorp option:selected").text();
		document.getElementById("BANK_NM").value = bankNm;

		if(authNo.length == 1) {
			authNo = "0" + authNo;
			document.getElementById("AUTH_NO").value = authNo;
		}
		if('<c:out value="${clientVo.legalBrthYY}"/>' != ''){
			document.getElementById("BIRTH_DAY").value = '<c:out value="${clientVo.legalBrthYY}"/>' + '<c:out value="${clientVo.legalBrthMM}"/>' + '<c:out value="${clientVo.legalBrthDD}"/>';
		}

		if('<c:out value="${clientVo.bizRegNo1}"/>' != ''){
			document.getElementById("BUSL_NO").value = '<c:out value="${clientVo.bizRegNo1}"/>' + '<c:out value="${clientVo.bizRegNo2}"/>' + '<c:out value="${clientVo.bizRegNo3}"/>';
		}
		if('<c:out value="${clientVo.legalBrthYY}"/>' != ''){
		document.getElementById("AUTH_INQUERY").value = "안녕하세요 넥센타이어입니다. " + '<c:out value="${clientVo.legalBrthYY}"/>' + "년 " + '<c:out value="${clientVo.legalBrthMM}"/>' + "월 "
		                                              + '<c:out value="${clientVo.legalBrthDD}"/>' + "일생 " + rtAcctOwner + " 고객님의 " + bankNm
		                                              + "<digit>" + rtAcctNo + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
		}
		if('<c:out value="${clientVo.bizRegNo1}"/>' != ''){
			document.getElementById("AUTH_INQUERY").value = "안녕하세요 넥센타이어입니다. 사업자번호 <digit>" + '<c:out value="${clientVo.bizRegNo1}"/>' + '<c:out value="${clientVo.bizRegNo2}"/>'
			                                              + '<c:out value="${clientVo.bizRegNo3}"/>' + "</digit> " + rtAcctOwner + " 고객님의 " + bankNm
			                                              + "<digit>" + rtAcctNo + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
		}
		return true;
	}
	/************************************ 계좌이체로 변경 ***********************************************/


	//수납 조회
	function myPayMonthListPage(pageNo) {
		if(pageNo != null){
			if(Number(pageNo)  == 0) {
				$("#pageNo").val("1");
			} else {
				$("#pageNo").val(pageNo);
			}
		} else {
			$("#pageNo").val("1");
		}

		var dateStart = $("#dateStart").val().replace(/[-]/gi,"");
    	var dateEnd = $("#dateEnd").val().replace(/[-]/gi,"");

		var param = {ordNo : '${detailMap.ordNo}' , dateStart : dateStart , dateEnd : dateEnd, pageNo : pageNo };

		var date = new Date();
	    var start = new Date();
	    var today = new Date();
	   /*  if(n < 10){
	       start.setMonth(start.getMonth()-n);
	    } */
	    var yyyy = start.getFullYear();
	    var mm = start.getMonth()+1;
	    var dd = start.getDate();
	    
		$.ajax({
	        type: "post",
	        url: "/mypage/myPayMonthListPage",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	console.log(data)
	        	if(data.successCode == -1) {
	        		alert(data.returnMessage);
		    		return;
		    	}

	        	var sumArreAmt=0;
	        	var sumRecpAmt=0;
	        	var sumSaleAmt=0;
	        	var AmtSt=0;

	        	var html = "";
	        	var list = data.rtnList;
	        	if(list.length > 0) {
		        	for(var i=0; i<list.length; i++) {
		        		var dis = ""
			        	var gbn = ""
			        	if(Number(list[i].arreAmt) < 1) {
			        		dis = "disabled='disabled'"
			        		gbn = "arre";
			        	}

		        		html += "<div class='inline layout-r'>";
			        	html += "<div class='inline align-middle col-2'>";
			        	html += "  <input type='checkbox' "+dis+" id='arreChk"+(i+1)+"' name='arreChk' recpAmt='"+list[i].recpAmt+"' arreAmt='"+list[i].arreAmt+"' onclick='fn_ckCheck(\""+(i+1)+"\");' class='type01'>";
			        	html += "  <label for='arreChk"+(i+1)+"'><span></span><b>"+(i+1)+"회차</b></label>";
			        	html += "</div>";
			        	html += "<div class='inline align-right pr-s col-1'><b>청구일자 "+list[i].zfbDay+"</b></div>";
			        	html += "</div>";
			        	html += "<div class='layout-c service-info-detail'>";
			        	html += "<dl>";
			        	html += " <dt>청구금액</dt>";
			        	html += "  <dd><span class='pay'>"+NumUtil.setComma(list[i].saleAmt)+"</span></dd>";
			        	html += " <dt>수납금액</dt>";
			        	html += " <dd><span class='pay'>"+NumUtil.setComma(list[i].saleAmt)+"</span></dd>";
			        	html += " <dt>미납금액</dt>";
			        	html += " <dd><span class='pay'>"+NumUtil.setComma(list[i].arreAmt)+"</span></dd>";
			        	html += " <dt>납부금액</dt>";
			        	if(Number(list[i].recpAmt) > 0  ){
				        	html += "<dd><span class='pay'>"+NumUtil.setComma(list[i].recpAmt)+"</span></dd>";
			        	} else {
			        		html += "<dd><span class='pay'>0</span></dd>";
			        	}

		        		if(list[i].rcDay != null) {
		        			html += " <dt><span>최종 수납일자</span>/<span>납부수단</span></dt>";
		        			html += "  <dd><span>"+list[i].rcDay+"</span>/<span>"+ list[i].payMthdNm +"</span></dd>";
			        	} else {
			        		html += " <dt><span>납부수단</span></dt>";
			        		html += "  <dd><span>"+ list[i].payMthdNm +"</span></dd>";
			        	}
			        	html += " </dl>";
			        	html += " </div>";

			        	if(yyyy+mm+dd > list[i].zfbDay){
			        		sumArreAmt = sumArreAmt +  Number(list[i].arreAmt);
			        	}
			        	sumRecpAmt = sumRecpAmt +  Number(list[i].recpAmt);
			        	sumSaleAmt = sumSaleAmt +  Number(list[i].saleAmt);

		        	}

		        	//전체 연체 금액
		        	$("#sumArreAmtTxt").html("" + NumUtil.setComma(sumArreAmt));
		        	//현재 납부 금액
		        	$("#sumRecpAmtSp").html("" + NumUtil.setComma(sumRecpAmt));
		        	//잔여 렌탈료
		        	$("#AmtSt").html("" + NumUtil.setComma(sumSaleAmt-sumRecpAmt));

		        	$("#myPayMonthListArea").show();

	        	} else {
	        		html += "<div class='inline layout-r'>";
		        	html += "수납 내역이 없습니다.";
		        	html += " </div>";
	        	}

	        	$(".price.center").show();

            	$("#myPayMonthList").html(html);

	        },
	        error: function(xhr,status,error){
	        	//alert(support0014);
	        }
	    });
	}

	//체크박스 전체 선택
	function fnarreChk(obj){
		var id = $(obj).attr("id");

		if(id == "arreChk0") {
			if($(obj).is(":checked")) {
				$("input[name='arreChk']").each(function(){
					//미수금 있는 것만
					//if($(this).attr("gbn") == "arre") {
						$(this).prop("checked", true);
					//}
				});
			} else {
				$("input[name='arreChk']").prop("checked", false);
			}
		}

		fn_ckAmt();
	}
	//개별 체크 박스
	function fn_ckCheck(idx){
	    if($("#arreChk"+idx).is(":checked")) {
	    	for(var i=0; i< idx; i++) {
	    		$("#arreChk"+ (idx-i)).prop("checked", true);
	    	}
	    } else {
	    	var size = $("input[name='arreChk']").length + 1;
	    	for(var i=0; i< size; i++) {
	    		if(i > idx) {
		    		$("#arreChk"+ i).prop("checked", false);
	    		}
	    	}
	    }

	    fn_ckAmt();
	}
	//연체금 세팅
	function fn_ckAmt(){
		var paySum = 0;
		var sumArreAmt = Number($("#sumArreAmtTxt").text().replace(/[^0-9]/gi,""));
		var overdueNum = 0;


		$("input[name='arreChk']").each(function() {
			if($(this).is(":checked")) {
				overdueNum = overdueNum + 1;
				paySum = paySum + Number($(this).attr("arreAmt"));

				$("#recpAmt").val($(this).attr("arreAmt"));
				$("#arreAmt").val($(this).attr("arreAmt"));
			}
		});


		$("input[name=good_mny]").val(paySum);		//결제 금액
		$("#sumRecpAmt").val(paySum);
		$("#overdueNum").val(overdueNum);	//신청 개수

		$("#sumRecpAmtSp").html("" + NumUtil.setComma(paySum));
		$("#AmtSt").html("" + NumUtil.setComma(sumArreAmt - paySum));
	}
	//연체금 납부 신청
	function fnOverdue() {
		call_kcp_ajax();
	}


	//회원 수정 화면으로 이동
	function goMemberUpdate(){
		location.href = "/mypage/memberModify";
	}

	//날짜
	function addzero(n){                        // 한자리가 되는 숫자에 "0"을 넣어주는 함수
	    return n < 10 ? "0" + n: n;
	}
	function dateInput(n,m){
	    $("#dateStart").val("");               // 우선 이미 들어가있는 값 초기화
	    $("#dateEnd").val("");

	    var date = new Date();
	    var start = new Date();
	    var today = new Date();
	    if(n < 10){
	       start.setMonth(start.getMonth()-n);
	    }
	    var yyyy = start.getFullYear();
	    var mm = start.getMonth()+1;
	    var dd = start.getDate();
	    var t_yyyy = today.getFullYear();
	    var t_mm = today.getMonth()+1;
	    var t_dd = today.getDate();

	    if(n == 0 ){
		    $("#dateStart").val($("#procDay").val());
		    $("#dateEnd").val(t_yyyy+'-'+addzero(t_mm)+'-'+addzero(t_dd));
		} else {
			$("#dateStart").val(yyyy+'-'+addzero(mm)+'-'+addzero(dd));
		    $("#dateEnd").val(t_yyyy+'-'+addzero(t_mm)+'-'+addzero(t_dd));
		}
	    myPayMonthListPage("1");
	}

	//팝업닫기
	function popClose(){
		$(".md-effect-1").removeClass("md-show");
	}

	//숫자만 입력
	function number_filter(str_value){
		return str_value.replace(/[^0-9]/gi, "");
	}
	//현재시간 구하기
	function getTimeStamp() {
		var d = new Date();

		var s = leadingZeros(d.getFullYear(), 4) + leadingZeros(d.getMonth() + 1, 2) + leadingZeros(d.getDate(), 2);
		s += leadingZeros(d.getHours(), 2) + leadingZeros(d.getMinutes(), 2) + leadingZeros(d.getSeconds(), 2);

		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}


	//지도 구현
	function fnStore(agencyCd) {
		console.log(agencyCd);
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "/mypage/searchAgencyInfo",
            data: "agencyCd="+ agencyCd,
            success: function (data) {
            	console.log(data);

            	if(data.resultMap == null) {
		    		alert("고객 센터 1855-0100으로 문의를 바랍니다.");
		    		return;
		    	}
            	if(data.successCode == -1) {
		    		alert("고객 센터 1855-0100으로 문의를 바랍니다.");
		    		return;
		    	}

            	//정보영역
            	//대리점 명

            	$("#modalAgencyDetl").addClass("md-show");
            	//아이콘
            	var html = "";
    			html += "<h2 class='f_ell'>";
    			html += data.resultMap.agencyNm;
    			html += "</h2>"
    			html += "<div class='state'>";
    			if(data.resultMap.chYn == "Y") {
    				html += "	<img src='../img/common/state_big_ico01.png' alt='추천'> ";
    			}
    			//html += "   <img src='../img/common/state_big_ico02.png' alt='타이어'>";
    			html += "</div>";
    			$("#agencyHeader").empty();
    			$("#agencyHeader").html(html);

                // 주소정보
    			html = "";
    			html += "<span>";
                html += data.resultMap.city + " " +data.resultMap.street;
                html += "</span>";
                html += "<button type='button' class='road' onClick='goFind(\""+data.resultMap.agencyNm+"\", \""+data.resultMap.posX+"\", \""+data.resultMap.posY+"\");'><b>길찾기</b><span></span></button>";
    			$("#agencyAddr").html(html);

                // 전화번호
    			$("#agencyTel").text(phoneFomat(data.resultMap.telNo));

                // 영업시간
    			$("#agencyBizTime").text(data.resultMap.agencyBizTime);

                // 취급품목
    			html = "";
    			html += "        <div class='state inline'>";
    			html += "            <img src='/img/common/state_ico02.png'  alt='타이어'/>";
    			html += "            <span>타이어</span>";
    			html += "        </div>";
    			if(data.resultMap.chYn == "Y") {
    				html += "        <div class='state inline'>";
    				html += "            <img src='/img/common/state_ico01.png'  alt='추천'/>";
    				html += "            <span>추천</span>";
    				html += "        </div>";
    			}
    			if(data.resultMap.cwYn == "Y") {
    				html += "        <div class='state inline'>";
    				html += "            <img src='/img/common/state_ico05.png'  alt='세차'/>";
    				html += "            <span>세차</span>";
    				html += "        </div>";
    			}
    			if(data.resultMap.fmYn == "Y") {
    				html += "        <div class='state inline'>";
    				html += "            <img src='/img/common/state_ico05.png'  alt='1급정비'/>";
    				html += "            <span>1급정비</span>";
    				html += "        </div>";
    			}
    			if(data.resultMap.lmYn == "Y") {
    				html += "        <div class='state inline'>";
    				html += "            <img src='/img/common/state_ico03.png'  alt='경정비'/>";
    				html += "            <span>경정비</span>";
    				html += "        </div>";
    			}
    			if(data.resultMap.seasonGbn == "02") {
    				html += "        <div class='state inline'>";
    				html += "            <img src='/img/common/state_ico04.png'  alt='겨울용'/>";
    				html += "            <span>겨울용</span>";
    				html += "        </div>";
    			}
                $("#agencyWkTp").html(html);


                // 탈착기
                if (!ValidUtil.isEmpty(data.resultMap.desorptNm)){
    	            html = "";
    	            html +="<span>"+data.resultMap.desorptNm+"</span>";
    	            $("#agencyOpt1").html(html);
                }

                // 얼라이먼트
                if (!ValidUtil.isEmpty(data.resultMap.alignNm)){
    	            html = "";
    	            html +="<span>"+data.resultMap.alignNm+"</span>";
    	            $("#agencyOpt2").html(html);
                }

                // 밸런스
                if (!ValidUtil.isEmpty(data.resultMap.balanceNm)){
    	            html = "";
    	            html +="<span>"+data.resultMap.balanceNm+"</span>";
    	            $("#agencyOpt3").html(html);
                }

                // 이미지
    		    html = "";
                for(var j=0; j < data.acyFileList.length; j++) {
    	            if (!ValidUtil.isEmpty(data.acyFileList[j].atflPathNm)){
    		            html +="<div>";
    		            html +="	<img src='<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile_cms/agency/"+data.acyFileList[j].atflPathNm+"' alt='장착점' />";
    		            html +="</div>";
    	            }
                }

                if (data.acyFileList.length == 0) {
                	html += "<div>";
                	html += "	<a href='#'><img src='../img/customer/m_slider_01.jpg' alt='장착점' /></a>";
                	html += "</div>";
                	html += "<div>";
                	html += "	<a href='#'><img src='../img/customer/m_slider_02.jpg' alt='장착점' /></a>";
                	html += "</div>";
                	html += "<div>";
                	html += "	<a href='#'><img src='../img/customer/m_slider_03.jpg' alt='장착점' /></a>";
                	html += "</div>";
                	html += "<div>";
                	html += "	<a href='#'><img src='../img/customer/m_slider_01.jpg' alt='장착점' /></a>";
                	html += "</div>";
                }

    		    $("#agencyGall").removeClass("slick-initialized slick-slider swiper-store1");
    		    $("#agencyGall").html(html);
    		    $("#agencyGall").addClass("swiper-store1");

    		  	//길찾기 이벤트
				$("#findLoad").on("click", function() {
					goFind(data.resultMap.agencyNm, data.resultMap.posX, data.resultMap.posY);
				});

    		    $('.swiper-store1').slick({
    				infinite: false,
    				arrows: true,
    				slidesToShow: 2,
    				slidesToScroll:1,
    				nextArrow: '<i class="nextArrow"></i>',
    				prevArrow: '<i class="prevArrow"></i>',
    			});

    		    positions = [];
                var obj = {
                		title	: data.resultMap.agencyNm,
                		addr 	: data.resultMap.city + " " +data.resultMap.street,
                		lat		: data.resultMap.posX,
                		lon		: data.resultMap.posY
                };
                positions.push(obj);
                mapTargetDiv = "mapDivPopup";
                mapDraw(data.resultMap.posY , data.resultMap.posX, data.resultMap.agencyNm , positions, "mapDivPopup");

                getRentStore(data.resultMap.posX,data.resultMap.posY);

    			$("#modalAgencyDetl").addClass("md-show");
				},
				error : function(xhr, status, error) {
					btn_change("-1");
					alert("고객 센터 1855-0100으로 문의를 바랍니다.");
				}
			});
	}
	function infoWindow(marker, agency_nm, tel_no, address, nAddr, rep_nm) {
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:2px;"><span style="font-weight:bold;">영업점명 </span> : '
				+ agency_nm
				+ '</div>'
				+ '<div style="padding:2px;"><span style="font-weight:bold;">전화번호 </span> : '
				+ tel_no
				+ '</div>'
				+ '<div style="padding:2px;"><span style="font-weight:bold;">주소 </span> : '
				+ address
				+ '('
				+ nAddr
				+ ')</div>'
				+ '<div style="padding:2px;"><span style="font-weight:bold;">대표자 </span> : '
				+ rep_nm + '</div>', iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 마커에 클릭이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseover', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow.open(map, marker);

		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseout', function() {
			// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			infowindow.close();
		});
	}

	/* $(document).ready(function() {

	}); */

	//올해 마지막 날짜
	function today() {
		var now = new Date();
		var year = now.getFullYear();
		var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0'
				+ (now.getMonth() + 1);
		var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();

		return year + "-" + mon + "-" + day;
	}

	/* 길찾기 */
	function goFind(agencyNm, posX, posY) {
		window.open("http://map.daum.net/link/to/" + agencyNm + "," + posX
				+ "," + posY);
	}

	function freeDmgSrvBtnCtl() {

		console.log('servCd_h TEST::', servCd);
		console.log('b00012UseCnt_h TEST::', b00012UseCnt);
		console.log('b00011UseCnt_h TEST::', b00011UseCnt);
		console.log('registIngYn_h TEST::', registIngYn);
		console.log('applyIngYn_h TEST::', applyIngYn);

		if(servCd == 'B00012' && b00012UseCnt < 0) {	//무상파손 가입
			$('#freeDmgJoin').css("display", "inline");
		}
		if(servCd == 'B00011' && b00011UseCnt < 0) {	//조기마모 가입
			$('#freeDmgEarlyJoin').css("display", "inline");
		}
		if(servCd == 'B00012' && b00012UseCnt >= 0) {	//무상파손 신청
			$('#freeDmgReq').css("display", "inline");
		}
		if(servCd == 'B00011' && b00011UseCnt >= 0) {	//조기마모 신청
			$('#freeDmgEarlyReq').css("display", "inline");
		}
	}

	//무상 파손 보증 서비스 가입
	function fn_damageServiceJoinGo(ordNo) {
		if(servCd == 'B00012' && registIngYn == 'Y') {
			ComUtil.alert("가입 심사중입니다.");
		}else {
			window.location.href="/mypage/freeDamageSrvJoin?ordNo="+ordNo;
		}
	}

	//조기 마모 보증 서비스 가입
	function fn_abrasionServiceJoinGo(ordNo) {
		if(servCd == 'B00011' && registIngYn == 'Y') {
			ComUtil.alert("가입 심사중입니다.");
		}else {
			window.location.href="/mypage/earlyAbrasionSrvJoin?ordNo="+ordNo;
		}
	}

	//무상 파손 보증 서비스 신청
	function fn_damageServiceReqGo(ordNo) {
		if(servCd == 'B00012' && applyIngYn == 'Y') {
			ComUtil.alert("신청 승인중입니다.");
		}else {
			window.location.href="/mypage/freeDamageSrvCreate?ordNo="+ordNo;
		}
	}

	//조기 마모 보증 서비스 신청
	function fn_abrasionServiceReqGo(ordNo) {
		if(servCd == 'B00011' && applyIngYn == 'Y') {
			ComUtil.alert("신청 승인중입니다.");
		}else {
			window.location.href="/mypage/earlyAbrasionSrvCreate?ordNo="+ordNo;
		}
	}

	function fn_zeroServiceGo() {
		window.location.href = "/mypage/zeroServiceCreate";
	}
	function fn_engineServiceGo() {
		window.location.href = "/mypage/engineServiceCreate";
	}

	//지도 그리기
	function mapDraw(lon , lat , bhfNm , positions, mapId){
		var agencyLat 	= lat; 	//대리점의 위도
		var agencyLon 	= lon; 	//대리점의 경도
		var agencyBhfNm	= bhfNm;

	    //var mapContainer = document.getElementById('mapDiv'), // 지도를 표시할 div
	    var mapContainer = document.getElementById(mapId), // 지도를 표시할 div
	    mapOption = {
	        center: new daum.maps.LatLng(agencyLat, agencyLon), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };
		map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	    // 마커를 생성합니다
		var imageSrc = "/img/common/icon_pin.png";
	    var imageSize = new daum.maps.Size(50, 50);
	    for (var i = 0; i < positions.length; i ++) {

	    	console.log(positions[i].lat +"/"+  positions[i].lon + "/ " + positions[i].title)

	        var marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커를 표시할 위치
	            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : new daum.maps.MarkerImage(imageSrc, imageSize) // 마커 이미지
	            //clickable: true
	        });
	    }
	}

	/* 나의 위치 근처 렌탈 전문점 가져오기 */
	function getRentStore(lat,lon){

		var pUrl = "/order/selectAroundRentalStoreMap";

		var pParams = {
				"posX" : lat
				,"posY" : lon
		};

		console.log("f_searchRentStore  !!!");
		console.log(pParams);
		cfnSendRequest(pUrl,pParams,'selectAroundRentalStoreMap');
	}

	function cfnRequestSuccessCallback(callback, result) {
		if(result.rtnCode == 0) {
			if (callback == 'selectAroundRentalStoreMap') {
				// selectAroundRentalStoreMap
		        var obj;
	            for(var j=0; j < result.rtnList.length; j++) {
		            obj = {
		            		title	: result.rtnList[j].agencyNm,
		            		addr 	: result.rtnList[j].city + " " +result.rtnList[j].street,
		            		lat		: result.rtnList[j].posX,
		            		lon		: result.rtnList[j].posY,
		            };
		            positions.push(obj);
	            }

	            if (result.rtnList.length > 0) {
	            	if(mapTargetDiv == "mapDiv") {
		            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, '' , positions, "mapDiv");
	            	} else {
		            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, '' , positions, "mapDivPopup");
	            	}
	            }
			}
		}
	}

	function fn_popupClose() {
		$("#modalAgencyDetl").removeClass("md-show");
	}
</script>

