<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%
	request.setCharacterEncoding ( "euc-kr" ) ;
%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
var ajax_flag = true;
var req01_AJAX;
var PayUrl="";

function initRequest()
{
    if ( window.XMLHttpRequest )
    {
        return new XMLHttpRequest();
    } else if ( window.ActiveXObject )
    {
        return new ActiveXObject( "Microsoft.XMLHTTP" );
    }
}

function sendRequest( url )
{
    req01_AJAX = null;
    req01_AJAX = initRequest();

    if ( req01_AJAX )
    {
        req01_AJAX.onreadystatechange = process_AJAX;
        req01_AJAX.open( "POST", url, true );
        req01_AJAX.send( null );
    }
}

function kcp_AJAX()
{
    // 해당 소스는 jQuery를 사용 하지 않는 업체에서도 작동 할수 있도록 구현되었습니다.
    // 이 부분은 javascript로 구현시 jQuery를 이용하면 더욱 쉽게 구현 할수 있습니다.
    // 또는
    // javascript를 통한 ajax 통신을 할 필요 없이 소스내에 order_approval.jsp를 연동해서 사용 하셔도 관계 없으며
    // 제공되는 jar 파일에 직접 전달된 데이터를 사용할수 있도록 method가 구현 되어 있습니다.
    if(ajax_flag)
    {
        var url    = "/order/ordAuthMob";
        var form = document.order_info;
        var params = "?site_cd=" + form.site_cd.value
                   + "&ordr_idxx=" + form.ordr_idxx.value
                   + "&good_mny=" + form.good_mny.value
                   + "&pay_method=" + form.pay_method.value
                   + "&escw_used=" + form.escw_used.value
                   + "&good_name=" + form.good_name.value
                   + "&response_type=" + form.response_type.value
                   + "&Ret_URL=" + form.Ret_URL.value;

        sendRequest( url + params );

        ajax_flag = false;
    }
    else
    {
        alert("통신 중입니다. 잠시만 기다려 주세요.");
    }

}

/*에스크로 결제시 필요한 장바구니*/
function create_goodInfo()
{
    var chr30 = String.fromCharCode(30);	// ASCII 코드값 30
    var chr31 = String.fromCharCode(31);	// ASCII 코드값 31

    var ordr_idxx = document.order_info.ordr_idxx.value;
    var good_name = document.order_info.good_name.value;
    var good_cntx = document.order_info.itemCntArr.value;
    var good_amtx = document.order_info.good_mny.value;

    var itemCdArr = document.order_info.itemCdArr.value;
    var itemCntArr = document.order_info.itemCntArr.value;

    var item_cd_arr = itemCdArr.split(',');
    var item_cnt_arr = itemCntArr.split(',');
    var item_cnt_tot = 0;

    if (item_cd_arr.length > 1) {
        good_name = good_name + "외" + item_cd_arr.length;
    }
    if (item_cnt_arr.length > 0) {
        for(var i=0; i < item_cnt_arr.length; i++) {
        	item_cnt_tot = item_cnt_tot + Number(item_cnt_arr[i]);
        }
    }

    var good_info = "seq=1" + chr31 + "ordr_numb="+ ordr_idxx + chr31 + "good_name=" + good_name + chr31 + "good_cntx=" + item_cnt_tot + chr31 + "good_amtx=" + good_amtx;
    //var good_info = "seq=1" + chr31 + "ordr_numb=20060310_0001" + chr31 + "good_name=양말" + chr31 + "good_cntx=2" + chr31 + "good_amtx=1000";

  	document.order_info.good_info.value = good_info;//장바구니 정보

  	document.order_info.deli_term.value = "03"; //배송 소요일
//   	document.order_info.bask_cntx.value = document.order_info.Pquantity.value; //장바구니 개수
  	document.order_info.bask_cntx.value = "1"; //장바구니 개수 품목개수와 관계없이 장바구니 품목이 1개이기때문에
  	document.order_info.rcvr_name.value = document.order_info.buyr_name.value; //이름
  	document.order_info.rcvr_tel1.value = document.order_info.buyr_tel1.value; //전번
  	document.order_info.rcvr_tel2.value = document.order_info.buyr_tel2.value; //전번
  	document.order_info.rcvr_add1.value = document.order_info.iplAddr.value; //주소1
  	document.order_info.rcvr_add2.value = document.order_info.iplDtlAddr.value; //주소2
  	document.order_info.rcvr_zipx.value = document.order_info.iplZip.value; //우편번호
  	document.order_info.rcvr_mail.value = document.order_info.buyr_mail.value; //이메일주소

  	document.order_info.escw_used.value = "Y";//에스크로
  	document.order_info.pay_mod.value = "Y";

}

function process_AJAX()
{
    if ( req01_AJAX.readyState == 4 ) //READY_STATE_COMPLETE = 4
    {
        if ( req01_AJAX.status == 200 )
        {
            if ( req01_AJAX.responseText != null )
            {
                // 해당 소스는 jQuery를 사용 하지 않는 업체에서도 작동 할수 있도록 구현되었습니다.
                // 이 부분은 javascript로 구현시 jQuery를 이용하면 더욱 쉽게 구현 할수 있습니다.
                // 또는
                // javascript를 통한 ajax 통신을 할 필요 없이 소스내에 order_approval.jsp를 연동해서 사용 하셔도 관계 없으며
                // 제공되는 jar 파일에 직접 전달된 데이터를 사용할수 있도록 method가 구현 되어 있습니다.
                try
                {
                    var form = document.order_info;

                    if( form.response_type.value == "JSON" )
                    {
                        StateChangeForJSON( req01_AJAX ); // JSON 방식일 경우
                    }
                    else if( form.response_type.value == "XML" )
                    {
                        StateChangeForXML( req01_AJAX ); // XML 방식일 경우
                    }
                    else if( form.response_type.value == "TEXT" || form.response_type.value == "" )
                    {
                        StateChangeForText( req01_AJAX ); // TEXT 방식일 경우
                    }
                }
                catch( e )
                {
                    StateChangeForText( req01_AJAX ); // TEXT 방식일 경우
                }
            }
        }
        else
        {
            ajax_flag=true;
            alert( req01_AJAX.responseJSON );
        }
    }
}

function StateChangeForJSON( xmlHttpRequest )
{
    var json = eval('('+ xmlHttpRequest.responseText +')');
    if(json.Code == '0000'){
        document.getElementById( "approval" ).value = json.approvalKey;
        // 아래 alert는 삭제 해도됨
        //alert("성공적으로 거래가 등록 되었습니다.");
        PayUrl = json.PayUrl;
        document.getElementById( "PayUrl"  ).value = json.request_URI;
        document.getElementById( "traceNo" ).value = json.traceNo;
        call_pay_form();
    }else{
        ajax_flag=true;
        alert("실패 되었습니다.[" + json.Message + "]");
    }
}

 /* kcp web 결제창 호츨 (변경불가) */
function call_pay_form()
{
  var v_frm = document.order_info;
  if(v_frm.encoding_trans.value == "UTF-8"){
	  v_frm.action = PayUrl.substring(0,PayUrl.lastIndexOf("/")) + "/jsp/encodingFilter/encodingFilter.jsp";
	  v_frm.PayUrl.value = PayUrl;
  }else{
	  v_frm.action = PayUrl;
  }

  if (v_frm.Ret_URL.value == ""){
	/* Ret_URL값은 현 페이지의 URL 입니다. */
	alert("연동시 Ret_URL을 반드시 설정하셔야 됩니다.");
    return false;
  }else{

	  v_frm.param_opt_2.value  = "${siteName}";
	  v_frm.param_opt_2.value += ";" + v_frm.approval_key.value;
	  v_frm.param_opt_2.value += ";" + v_frm.van_code.value;
	  v_frm.param_opt_2.value += ";" + v_frm.ActionResult.value;
	  v_frm.param_opt_2.value += ";" + v_frm.PayUrl.value;
	  v_frm.param_opt_2.value += ";" + v_frm.currency.value;

	  var param3 = document.getElementsByClassName("param3");
	  if(param3 != null && param3.length>0){
		  var param3Size = param3.length;
		  var idx = 0;
		  var param3Obj = {};
		  for(; idx<param3.length; idx++){
			  if(param3[idx].name == "itemCdArr"){
				  var itemCdArr = new Array();
				  <c:forEach var="itemCd" items="${order.itemCdArr}" varStatus="status">
				  	itemCdArr.push("${itemCd}");
		          </c:forEach>
		          param3Obj[param3[idx].name] = itemCdArr;
			  }else if(param3[idx].name == "itemCntArr"){
				  var itemCntArr = new Array();
				  <c:forEach var="itemCnt" items="${order.itemCntArr}" varStatus="status">
				    itemCntArr.push("${itemCnt}");
		          </c:forEach>
		          param3Obj[param3[idx].name] = itemCntArr;
			  }else if(param3[idx].name == "cartNoArr"){
				  var cartNoArr = new Array();
				  <c:forEach var="cartNo" items="${order.cartNoArr}" varStatus="status">
				    cartNoArr.push("${cartNo}");
		          </c:forEach>
		          param3Obj[param3[idx].name] = cartNoArr;
			  }else if(param3[idx].name == "couponInfoArr"){
				  var couponInfoArr = new Array();
				  <c:forEach var="couponInfo" items="${order.couponInfoArr}" varStatus="status">
				    couponInfoArr.push("${couponInfo}");
		          </c:forEach>
		          param3Obj[param3[idx].name] = couponInfoArr;
			  }else{
				  param3Obj[param3[idx].name] = param3[idx].value;
			  }


		  }
		  v_frm.param_opt_3.value = JSON.stringify(param3Obj);
	  }

	  v_frm.submit();

  }
}

 /* kcp 통신을 통해 받은 암호화 정보 체크 후 결제 요청 (변경불가) */
function chk_pay()
{
  self.name = "tar_opener";
  var pay_form = document.order_info;

  alert(pay_form.res_cd.value)

  if (pay_form.res_cd.value == "3001" )
  {
    alert("사용자가 취소하였습니다.");
  	//yjw serverMode 제거(20220225)
    pay_form.action = "/order/orderPurchase";
    pay_form.submit();
  }

  if (pay_form.enc_info.value){
	  //yjw serverMode 제거(20220225)
	  pay_form.action = "/order/getKcpPaymentResult";
	  //pay_form.submit();
  }
}

function jsf__chk_type()
{
  if ( document.order_info.ActionResult.value == "card" )
  {
    document.order_info.pay_method.value = "CARD";
  }
  else if ( document.order_info.ActionResult.value == "acnt" )
  {
    document.order_info.pay_method.value = "BANK";
    create_goodInfo(); //장바구니 상세정보 담기
  }
}


</script>

<form id="order_info" name="order_info" method="post">
  <!-- 지불 방법 -->
  <input type="hidden" name="ActionResult" value="${order.pay_method}">
  <!-- 주문 번호 -->
  <input type="hidden" name="ordr_idxx" value="${order.ordr_idxx}">
  <!-- 고객 번호 -->
  <input type="hidden" name="cust_no" value="${order.cust_no}">
  <!-- 상품명 -->
  <input type="hidden" name="good_name" value="${order.good_name}">
  <!-- 결제 금액 -->
  <input type="hidden" name="good_mny" value="${order.good_mny}">
  <!-- 주문자명 -->
  <input type="hidden" name="buyr_name" value="${order.buyr_name}">
  <!-- E-mail -->
  <input type="hidden" name="buyr_mail" value="${order.buyr_mail}">
  <!-- 전화번호 -->
  <input type="hidden" name="buyr_tel1" value="${order.buyr_tel1}">
  <!-- 휴대폰번호 -->
  <input type="hidden" name="buyr_tel2" value="${order.buyr_tel2}">

  <!-- 공통정보 -->
  <input type="hidden" name="req_tx"          value="pay">                           <!-- 요청 구분 -->
  <input type="hidden" name="site_cd"         value="<%=AppContext.getString(CoreConstants.KCP_SITE_CD)%>">       <!-- 사이트 키 -->
  <input type="hidden" name="currency"        value="410"/>                          <!-- 통화 코드 -->
  <!-- 결제등록 키 -->
  <input type="hidden" name="approval_key"    id="approval">
  <!-- 인증시 필요한 파라미터(변경불가)-->
<!--   <input type="hidden" name="escw_used"       value="N"> -->
  <input type="hidden" name="pay_method"      value="">
  <input type="hidden" name="van_code"        value="">
  <!-- 신용카드 설정 -->
  <input type="hidden" name="quotaopt"        value="<%=AppContext.getString(CoreConstants.KCP_QUOTAOPT)%>"/>                           <!-- 최대 할부개월수 -->
  <!-- 가상계좌 설정 -->
  <input type="hidden" name="ipgm_date"       value=""/>

<!-- 에스크로 설정 파라미터 -->
<input type="hidden" name="escw_used" value="N"/> <!-- 에스크로 사용 여부 : 반드시 Y 로 설정 -->
<input type="hidden" name="pay_mod" value="N"/> <!-- 에스크로 결제처리 모드 : 에스크로: Y, 일반: N, KCP 설정 조건: O  -->
<input type="hidden" name="deli_term" value=""/> <!-- 배송 소요일 : 예상 배송 소요일을 입력 -->
<input type="hidden" name="bask_cntx" value=""/><!-- 장바구니 상품 개수 : 장바구니에 담겨있는 상품의 개수를 입력(good_info의 seq값 참조) -->
<input type="hidden" name="good_info" value=""/> <!-- 장바구니 상품 상세 정보 (자바 스크립트 create_goodInfo() 참조) -->
<input type="hidden" name="rcvr_name" value=""/>
<input type="hidden" name="rcvr_tel1" value=""/>
<input type="hidden" name="rcvr_tel2" value=""/>
<input type="hidden" name="rcvr_mail" value="" />
<input type="hidden" name="rcvr_zipx" value=""/>
<input type="hidden" name="rcvr_add1" value=""/>
<input type="hidden" name="rcvr_add2" value=""/>
<!-- 에스크로 설정 파라미터 끝-->

  <!-- 리턴 URL (kcp와 통신후 결제를 요청할 수 있는 암호화 데이터를 전송 받을 가맹점의 주문페이지 URL) -->
  <input type="hidden" name="Ret_URL"         value="/order/getKcpPaymentResult">
  <!-- 화면 크기조정 -->
  <input type="hidden" name="tablet_size"     value="1.0">
  <input type="hidden" name="module_type"     value="<%=AppContext.getString(CoreConstants.KCP_MODULE_TYPE)%>"/>

  <!-- 추가 파라미터 ( 가맹점에서 별도의 값전달시 param_opt 를 사용하여 값 전달 ) -->
  <input type="hidden" name="param_opt_1"     value="Y">				<!-- 모바일여부 -->
  <input type="hidden" name="param_opt_2"     value="">		<!-- 수납관련 파라메터 -->
  <input type="hidden" name="param_opt_3"     value="">					<!-- 주문관련 파라메터 -->

  <!-- 결제 정보 등록시 응답 타입 ( 필드가 없거나 값이 '' 일경우 TEXT, 값이 XML 또는 JSON 지원 -->
  <input type="hidden" name="response_type"  value="JSON"/>
  <input type="hidden" name="PayUrl"   id="PayUrl"   value=""/>
  <input type="hidden" name="traceNo"  id="traceNo"  value=""/>
  <input type="hidden" name="encoding_trans" value="UTF-8" />
  <input type="hidden" name="res_cd"         value="">               <!-- 결과 코드          -->
  <input type="hidden" name="res_msg"        value=""/>
  <input type="hidden" name="tran_cd"        value="">              <!-- 트랜잭션 코드      -->
  <input type="hidden" name="cash_yn"		 value="">              <!-- 현금영수증 등록여부-->
  <input type="hidden" name="enc_info"       value="">
  <input type="hidden" name="enc_data"       value="">
  <input type="hidden" name="use_pay_method" value="">
  <input type="hidden" name="cash_tr_code"   value="">


  <!-- 이전페이지 파라메터 -->
  	<input type="hidden" class="param3" name="custId" 			id="custId" 		value="${order.custId}"/>
	<input type="hidden" class="param3" name="marktRcvAgreYn"  id="marktRcvAgreYn" value="${order.marktRcvAgreYn}"/>			<!-- 로그인 한 고객 수신동의 -->
	<input type="hidden" class="param3" name="smsRcvAgreYn"    id="smsRcvAgreYn" 	value="${order.smsRcvAgreYn}"/>			<!-- 로그인 한 고객 수신동의 -->
	<input type="hidden" class="param3" name="emailRcvAgreYn"  id="emailRcvAgreYn" value="${order.emailRcvAgreYn}"/>			<!-- 로그인 한 고객 수신동의 -->
	<input type="hidden" class="param3" name="custTyCd"  		id="custTyCd" 		value="${order.custTyCd}"/>			<!-- 고객 유형 코드(SD002) -->
	<input type="hidden" class="param3" name="custTyDtlCd"  	id="custTyDtlCd" 	value="${order.custTyDtlCd}"/>			<!-- 고객 유형 상세 코드(SD003) -->
	<input type="hidden" class="param3" name="officerCdYn"  	id="officerCdYn" 	value="${order.officerCdYn}"/>			<!-- 고객 유형 상세 코드(SD003) -->

	<input type="hidden" class="param3" name="pageGbn" 		id="pageGbn" 		value="${order.pageGbn}"/>			<!-- 이전화면 구분 : 상세/장바구니 -->
	<input type="hidden" class="param3" name="carNo"      		id="carNo" 			value="${order.carNo}"/>        	<!-- 차량번호 -->
	<input type="hidden" class="param3" name="classCd"    		id="classCd" 		value="${order.classCd}"/>      	<!-- 차량분류 -->
	<input type="hidden" class="param3" name="classCdNm"    	id="classCdNm" 		value="${order.classCdNm}"/>      <!-- 차량분류 -->
	<input type="hidden" class="param3" name="makerCd"   		id="makerCd"  		value="${order.makerCd}"/>      	<!-- 제조사 코드 -->
	<input type="hidden" class="param3" name="makerNm"    		id="makerNm"  		value="${order.makerNm}"/>      	<!-- 제조사 명 -->
	<input type="hidden" class="param3" name="modelCd"    		id="modelCd"  		value="${order.modelCd}"/>      	<!-- 차 모델 코드 -->
	<input type="hidden" class="param3" name="modelNm"    		id="modelNm"  		value="${order.modelNm}"/>      	<!-- 차 모델  명 -->
	<input type="hidden" class="param3" name="contentsCd"    	id="contentsCd" 	value="${order.contentsCd}"/>   	<!-- 차 사양 코드 -->
	<input type="hidden" class="param3" name="seasonCd"    	id="seasonCd" 		value="${order.seasonCd}"/>     	<!-- 계절구분 -->
	<input type="hidden" class="param3" name="seasonNm"    	id="seasonNm" 		value="${order.seasonNm}"/>     	<!-- 계절구분 명 -->
	<input type="hidden" class="param3" name="patternCd"    	id="patternCd" 		value="${order.patternCd}"/>  	<!-- 패턴 코드 -->
	<input type="hidden" class="param3" name="matCd"       	id="matCd" 			value="${order.matCd}"/>       	<!-- 상품코드 -->
	<input type="hidden" class="param3" name="cntCdNm"        	id="cntCdNm" 		value="${order.cntCdNm}"/>      	<!-- 수량코드 -->
	<input type="hidden" class="param3" name="bassSaleFee"  	id="bassSaleFee" 	value="${order.bassSaleFee}"/>	<!-- 원 가격 -->
	<input type="hidden" class="param3" name="saleFee"  		id="saleFee" 		value="${order.saleFee}"/>		<!-- 할인 가격 -->
	<input type="hidden" class="param3" name="stmemSaleAmt"  	id="stmemSaleAmt" 	value="${order.stmemSaleAmt}"/>	<!-- 임직원 가격 -->
	<input type="hidden" class="param3" name="dpPrNo" 			id="dpPrNo" 		value="${order.dpPrNo}"/>			<!-- 전시 상품 번호-->
	<input type="hidden" class="param3" name="itemCd" 			id="itemCd" 		value="${order.itemCd}"/>			<!-- 품목 코드-->
	<input type="hidden" class="param3" name="itemNm" 			id="itemNm" 		value="${order.itemNm}"/>			<!-- 품목 코드-->
	<input type="hidden" class="param3" name="thumimg" 		id="o2oThumImg" 	value="${order.o2oThumImg}"/>			<!-- 전시 상품 번호-->
	<input type="hidden" class="param3" name="tireSize" 		id="tireSize" 		value="${order.tireSize}"/>			<!-- 타이어사이즈-->
	<input type="hidden" class="param3" name="accuPoint" 		id="accuPoint" 		value="${order.accuPoint}"/>			<!-- 적립률-->
	<input type="hidden" class="param3" name="saleTyCd" 		id="saleTyCd" 		value="${order.saleTyCd}"/>			<!-- 적립률-->
	<input type="hidden" class="param3" name="salePrcPlcNo" 	id="salePrcPlcNo" 	value="${order.salePrcPlcNo}"/>			<!-- 적립률-->
	<input type="hidden" class="param3" name="ownerNm" 		id="ownerNm"		value="${order.ownerNm}"/>			<!-- 적립률-->

	<!-- 화면 입력값 정보 -->
	<input type="hidden" class="param3" name="payGbn"  		id="payGbn"				value="${order.payGbn}"/>			<!-- 결제 구분 : 카드(C) , 계좌(B), 카카오(K) -->
	<input type="hidden" class="param3" name="carMngNo"  		id="carMngNo"			value="${order.carMngNo}" />		<!-- 차량 관리 번호 -->
	<input type="hidden" class="param3" name="iplAddr"  		id="iplAddr"			value="${order.iplAddr}" />			<!-- 장착점 주소 -->
	<input type="hidden" class="param3" name="iplDtlAddr"  	id="iplDtlAddr"			value="${order.iplDtlAddr}" />		<!-- 장착점 상세 주소 -->
	<input type="hidden" class="param3" name="iplZip" 			id="iplZip"				value="${order.iplZip}" />			<!-- 장착점 우편번호 -->
	<input type="hidden" class="param3" name="pickupZip"  		id="pickupZip"			value="${order.pickupZip}" />		<!-- 장착점 우편번호 - 픽업 딜리버리 -->
	<input type="hidden" class="param3" name="pickupBassAddr"  id="pickupBassAddr"		value="${order.pickupBassAddr}" />	<!-- 장착점 주소 - 픽업 딜리버리 -->
	<input type="hidden" class="param3" name="pickupDtlAddr" 	id="pickupDtlAddr"		value="${order.pickupDtlAddr}" />	<!-- 장착점 상세  주소 - 픽업 딜리버리 -->
	<input type="hidden" class="param3" name="custNm" 			id="custNm"				value="${order.custNm}"/>			<!-- 주문자 명 -->
	<input type="hidden" class="param3" name="mobNo" 			id="mobNo"				value="${order.mobNo}"/>				<!-- 전화 번호 -->
	<input type="hidden" class="param3" name="mountCd" 		id="mountCd"			value="${order.mountCd}" />			<!-- 장착점 구분 코드-->
	<input type="hidden" class="param3" name="ordNo" 			id="ordNo"				value="${order.ordNo}" />			<!-- 주문번호 -->
	<input type="hidden" class="param3" name="setlStsCd" 		id="setlStsCd"			value="${order.setlStsCd}" />		<!-- 결제 쿠폰 번호 -->
	<input type="hidden" class="param3" name="setlCpnDcAmt" 	id="setlCpnDcAmt"		value="${order.setlCpnDcAmt}" />	<!-- 결제 쿠폰 할인 금액 -->
	<input type="hidden" class="param3" name="prCpnNo1" 		id="prCpnNo1"			value="${order.prCpnNo1}" />		<!-- 상품별 쿠폰 코드 1 -->
	<input type="hidden" class="param3" name="prCpnNo2" 		id="prCpnNo2"			value="${order.prCpnNo2}" />		<!-- 상품별 쿠폰 코드 2 -->
	<input type="hidden" class="param3" name="prCpnDcAmt" 		id="prCpnDcAmt"			value="${order.prCpnDcAmt}" />		<!-- 상품별 쿠폰 할인 금액 합계 -->
	<input type="hidden" class="param3" name="istReqDe" 		id="istReqDe"			value="${order.istReqDe}" />		<!-- 작업 희망 일자 -->
	<input type="hidden" class="param3" name="istDueDe" 		id="istDueDe"			value="${order.istDueDe}" />		<!-- 작업 희망 시간 -->
	<input type="hidden" class="param3" name="custReqCn" 		id="custReqCn"			value="${order.custReqCn}" />		<!-- 참고 메세지 -->
	<input type="hidden" class="param3" name="orgzCd" 			id="orgzCd"				value="${order.orgzCd}" />			<!-- 거점코드 : bhfCd -->
	<input type="hidden" class="param3" name="wrhCd" 			id="wrhCd"				value="${order.wrhCd}" />			<!-- 창고코드 -->
	<input type="hidden" class="param3" name="bpCd" 			id="bpCd"				value="${order.bpCd}" />			<!-- 거점코드 : bpCd -->
	<input type="hidden" class="param3" name="itemCdArr" 		id="itemCdArr"			value="${order.itemCdArr}" />		<!-- 품목코드 -->
	<input type="hidden" class="param3" name="itemCntArr" 		id="itemCntArr"			value="${order.itemCntArr}" />		<!-- 수량  -->
	<input type="hidden" class="param3" name="cartNoArr" 		id="cartNoArr"			value="${order.cartNoArr}" />		<!-- 수량  -->
	<input type="hidden" class="param3" name="couponInfoArr" 	id="couponInfoArr"		value="${order.couponInfoArr}" />	<!-- 수량  -->
	<input type="hidden" class="param3" name="orgTotSaleFee" 	id="orgTotSaleFee"		value="${order.orgTotSaleFee}" />	<!-- 전시가 합계  -->
	<input type="hidden" class="param3" name="totBaseFee" 		id="totBaseFee"			value="${order.totBaseFee}" />		<!-- 원가 합계  -->
	<input type="hidden" class="param3" name="ordAmt" 			id="ordAmt"				value="${order.ordAmt}" />		<!-- 원가 합계  -->
	<input type="hidden" class="param3" name="orderOriAmt" 		id="orderOriAmt"		value="${order.orderOriAmt}" />		<!-- 원가 합계  -->
	<input type="hidden" class="param3" name="orderPayAmt" 		id="orderPayAmt"		value="${order.orderPayAmt}" />		<!-- 원가 합계  -->


	<input type="hidden" class="param3" name="optAmt" 	  id="optAmt"	 value="${order.optAmt}"/>
	<input type="hidden" class="param3" name="optTotAmt"  id="optTotAmt" value="${order.optTotAmt}"/>
	<input type="hidden" class="param3" name="optCo" 	  id="optCo"	 value="${order.optCo}"/>
	<input type="hidden" class="param3" name="optPlcNo"   id="optPlcNo"	 value="${order.optPlcNo}"/>
	<input type="hidden" class="param3" name="optPlcNm"   id="optPlcNm"	 value="${order.optPlcNm}"/>

	<input type="hidden" class="param3" name="orderDtlInfo"   id="orderDtlInfo"		value='${order.orderDtlInfo}' /> <!-- 상품 상세 정보  -->
	<input type="hidden" class="param3" name="beforPayChkYn"  id="beforPayChkYn"	value="${order.beforPayChkYn}" />

	<!-- // 오일서비스 분기처리 (오일 서비스는 경정비 가능한 대리점만 조회) -->
	<input type="hidden" class="param3" name="oilServiceYn"	id="oilServiceYn"		value="${order.oilServiceYn}"/>

	<!-- TMS 정보 -->
	<input type="hidden" class="param3" name="tmsSchduleStr" id="tmsSchduleStr"	value='${order.tmsSchduleStr}'/>
	<input type="hidden" class="param3" name="centerSchduleStr" id="centerSchduleStr"	value='${order.centerSchduleStr}'/>
	<input type="hidden" class="param3" name="amPmGbn" 		id="amPmGbn"	value="${order.amPmGbn}"/>
	<input type="hidden" class="param3" name="city" 		id="city"		value="${order.city}"/>
	<input type="hidden" class="param3" name="county" 		id="county"		value="${order.county}"/>
	<input type="hidden" class="param3" name="dong" 		id="dong"		value="${order.dong}"/>
	<input type="hidden" class="param3" name="dlvyCity" 	id="dlvyCity"	value="${order.dlvyCity}"/>
	<input type="hidden" class="param3" name="dlvyCounty" 	id="dlvyCounty"	value="${order.dlvyCounty}"/>
	<input type="hidden" class="param3" name="dlvyDong" 	id="dlvyDong"	value="${order.dlvyDong}"/>
	<input type="hidden" class="param3" name="bhfType" 		id="bhfType"	value="${order.bhfType}"/>
	<input type="hidden" class="param3" name="basementYn" 	id="basementYn"	value="${order.basementYn}"/>
	<input type="hidden" class="param3" name="alignYn" 		id="alignYn"	value="${order.alignYn}"/>

	<!-- 추천 임직원 코드 -->
	<input type="hidden" class="param3" name="recEmpNo" 	id="recEmpNo" 		value="${order.recEmpNo}"/>

<%
    /* ============================================================================== */
    /* =   옵션 정보                                                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ※ 옵션 - 결제에 필요한 추가 옵션 정보를 입력 및 설정합니다.             = */
    /* = -------------------------------------------------------------------------- = */
    /* 카드사 리스트 설정
    예) 비씨카드와 신한카드 사용 설정시
    <input type="hidden" name="used_card"    value="CCBC:CCLG">

    /*  무이자 옵션
            ※ 설정할부    (가맹점 관리자 페이지에 설정 된 무이자 설정을 따른다)                             - "" 로 설정
            ※ 일반할부    (KCP 이벤트 이외에 설정 된 모든 무이자 설정을 무시한다)                           - "N" 로 설정
            ※ 무이자 할부 (가맹점 관리자 페이지에 설정 된 무이자 이벤트 중 원하는 무이자 설정을 세팅한다)   - "Y" 로 설정
    <input type="hidden" name="kcp_noint"       value=""/> */

    /*  무이자 설정
            ※ 주의 1 : 할부는 결제금액이 50,000 원 이상일 경우에만 가능
            ※ 주의 2 : 무이자 설정값은 무이자 옵션이 Y일 경우에만 결제 창에 적용
            예) BC 2,3,6개월, 국민 3,6개월, 삼성 6,9개월 무이자 : CCBC-02:03:06,CCKM-03:06,CCSS-03:06:04
    <input type="hidden" name="kcp_noint_quota" value="CCBC-02:03:06,CCKM-03:06,CCSS-03:06:09"/> */

    /* KCP는 과세상품과 비과세상품을 동시에 판매하는 업체들의 결제관리에 대한 편의성을 제공해드리고자,
       복합과세 전용 사이트코드를 지원해 드리며 총 금액에 대해 복합과세 처리가 가능하도록 제공하고 있습니다
       복합과세 전용 사이트 코드로 계약하신 가맹점에만 해당이 됩니다
       상품별이 아니라 금액으로 구분하여 요청하셔야 합니다
       총결제 금액은 과세금액 + 부과세 + 비과세금액의 합과 같아야 합니다.
       (good_mny = comm_tax_mny + comm_vat_mny + comm_free_mny)

        <input type="hidden" name="tax_flag"       value="TG03">  <!-- 변경불가	   -->
        <input type="hidden" name="comm_tax_mny"   value=""    >  <!-- 과세금액	   -->
        <input type="hidden" name="comm_vat_mny"   value=""    >  <!-- 부가세	   -->
        <input type="hidden" name="comm_free_mny"  value=""    >  <!-- 비과세 금액 --> */

	/* 결제창 한국어/영어 설정 옵션 (Y : 영어)
		<input type="hidden" name="eng_flag"        value="Y"/> */

    /* 가맹점에서 관리하는 고객 아이디 설정을 해야 합니다. 상품권 결제 시 반드시 입력하시기 바랍니다.
        <input type="hidden" name="shop_user_id"    value=""/> */

    /* 복지포인트 결제시 가맹점에 할당되어진 코드 값을 입력해야합니다.
        <input type="hidden" name="pt_memcorp_cd"   value=""/> */

    /* 결제창 현금영수증 노출 설정 옵션 (Y : 노출)
        <input type="hidden" name="disp_tax_yn"     value="Y"/> */
    /* = -------------------------------------------------------------------------- = */
    /* =   옵션 정보 END                                                            = */
    /* ============================================================================== */
%>
<input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->
</form>

<script type="text/javascript">

window.onload = function(){
	document.getElementsByName("Ret_URL")[0].value = location.protocol + "//" + location.host + document.getElementsByName("Ret_URL")[0].value;
	jsf__chk_type();
	kcp_AJAX();
};

// 결제 중 새로고침 방지 샘플 스크립트
function noRefresh()
{
    /* CTRL + N키 막음. */
    if ((event.keyCode == 78) && (event.ctrlKey == true))
    {
        event.keyCode = 0;
        return false;
    }
    /* F5 번키 막음. */
    if(event.keyCode == 116)
    {
        event.keyCode = 0;
        return false;
    }
}
document.onkeydown = noRefresh ;

</script>