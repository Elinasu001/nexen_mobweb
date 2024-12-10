<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import = "java.util.*" %>
<%@ page import = "java.text.DecimalFormat"%>
<%@ page import = "javax.net.ssl.TrustManager" %>
<%@ page import = "javax.net.ssl.HostnameVerifier" %>
<%@ page import = "javax.net.ssl.HttpsURLConnection" %>
<%@ page import = "javax.net.ssl.SSLContext" %>
<%@ page import = "javax.net.ssl.SSLSession" %>
<%@ page import = "javax.net.ssl.X509TrustManager" %>
<%@ page import = "java.security.cert.X509Certificate" %>


<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>



<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	//int year = cal.get(java.util.Calendar.YEAR);
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

<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/datepicker-ko.js"></script>
<script type="text/javascript" src="/js/lib/jquery.timepicker.min.js"></script>

<!-- 다음 맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>

<style>
.onColor {background-color: #333;}

.ui-state-default {border: 0 !important;}

.popupWrap header {height: 65px; line-height: 65px;}
.popupWrap header h2 {line-height: 1px;}


#modalAgencyDetl header {height: 65px; line-height: 65px;}
#modalAgencyDetl header.title h2 {line-height: 1px; white-space: nowrap; text-overflow: ellipsis;}
#modalAgencyDetl header.title .state img {margin-bottom: 10px;}

#datepicker_acdn {position: relative !important; left: 0 !important;}

/* datepicker 닫기버튼 디자인 */
#datepicker_acdn .close_btn,
#datepicker_acdn .close_btn:visited {
  text-decoration: none;
}
#datepicker_acdn .close_btn {
	display: block;
	position: relative;
	width: 60px;
	padding: 0;
	font-weight: 600;
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s ;
    margin-inline-start: auto;
}
#datepicker_acdn .btnPurple {background: #812990;}
#datepicker_acdn .btnFade.btnPurple:hover {background: #6D184B;}
</style>

<form name="order_info" method="post" >
	<input type="hidden" name="pageGbn"     	 value="${orderVo.pageGbn}" />              <!--렌탈상품명-->
 	<input type="hidden" name="itemNo"     	 value="${orderVo.itemNo}" />              <!--렌탈상품명-->

	<!-- 상품정보 -->

	<input type="hidden" name="saleNm"     	 value="${orderVo.saleNm}" />              <!--렌탈상품명-->
	<input type="hidden" name="saleCd"     	 value="${orderVo.saleCd}" />              <!--렌탈상품코드-->

	<!-- 사업자번호 -->
	<input type="hidden" name="bizNo1" id="bizNo1" value="${userVo.bizRegNo1}" />
	<input type="hidden" name="bizNo2" id="bizNo2" value="${userVo.bizRegNo2}" />
	<input type="hidden" name="bizNo3" id="bizNo3" value="${userVo.bizRegNo3}" />

	<!-- 주문자 정보 -->
	<input type="hidden" name="legalBrthYY" id="legalBrthYY" value="${userVo.legalBrthYY}" />
	<input type="hidden" name="legalBrthMM" id="legalBrthMM" value="${userVo.legalBrthMM}" />
	<input type="hidden" name="legalBrthDD" id="legalBrthDD" value="${userVo.legalBrthDD}" />
	<input type="hidden" name="ordrIdxx"     value="${orderVo.ordrIdxx}" />            <!--주문번호-->
	<input type="hidden" name="patternCd"    value="${orderVo.patternCd}" />           <!--패턴코드-->
	<input type="hidden" name="matCd"        value="${orderVo.matCd}" />               <!--상품코드-->
	<input type="hidden" name="makerCd"      value="${orderVo.makerCd}" />             <!--제조사코드-->
	<input type="hidden" name="makerCdNm"    value="${orderVo.makerNm}" />   	        <!--제조사명-->
	<input type="hidden" name="modelCd"      value="${orderVo.modelCd}" />             <!--차종코드-->
	<input type="hidden" name="contentsCd"   value="${orderVo.contentsCd}" />          <!--사양코드-->
	<input type="hidden" name="modelCdNm"    value="${orderVo.modelNm}" />           <!--차종코드명-->
	<input type="hidden" name="frCd"         value="${orderVo.frCd}" />                <!--전후구분코드-->
	<input type="hidden" name="dispSize"     value="${orderVo.dispSize}" />            <!--사이즈-->
	<input type="hidden" name="sectionWidth" value="${orderVo.sectionWidth}" />        <!--단면폭-->
	<input type="hidden" name="aspectRatio"  value="${orderVo.aspectRatio}" />         <!--편평비-->
	<input type="hidden" name="wheelInches"  value="${orderVo.wheelInches}" />         <!--휠인치-->
	<input type="hidden" name="carNumber"    id="carNumber" value="${orderVo.carNumber}" />           <!--차량번호-->
	<input type="hidden" name="cntCd"        value="${orderVo.cntCd}" />               <!--수량코드-->
	<input type="hidden" name="cntCdNm"      value="${orderVo.cntCdNm}" />             <!--수량코드명-->
	<input type="hidden" name="periodCd"     value="${orderVo.periodCd}" />            <!--기간코드-->
	<input type="hidden" name="periodCdNm"   value="${orderVo.periodCdNm}" />          <!--기간코드명-->
	<input type="hidden" name="regiCd"       value="ZZZZ" />              			   <!--등록비코드 ZZZZ 고정-->
	<input type="hidden" name="orgRegiAmt"   value="${rentalProd.orgRegiAmt}" />          <!--변경 전 원래 등록비-->
	<input type="hidden" name="regiCdAmt"    value="${rentalProd.regiAmt}" />          <!--등록비금액-->
	<input type="hidden" name="orgRentAmt"   value="${rentalProd.rentAmt}" />          <!--조견표렌탈금액-->
	<input type="hidden" name="rentalAmt"    value="${rentalProd.rentAmt}" />          <!--월렌탈금액-->
	<input type="hidden" name="sumTotalAmt"  value="${rentalProd.totalAmt - rentalProd.dcAmt}" />          <!--월렌탈,추가렌탈,등록비,할인액 값을 모두 계산한 최종 월렌탈료-->
	<input type="hidden" name="rentalPAmt"   value="${rentalProd.addRentAmt}" />       <!--추가렌탈금액-->
	<input type="hidden" name="dcAmt"   	 value="${rentalProd.dcAmt}" />            <!--렌탈 상품 할인액-->
	<input type="hidden" name="psCd"         value="999999" />                 		   <!--프리미엄서비스 코드   999999 고정-->
	<input type="hidden" name="safeKey"      value="${userVo.safeKey}" />          <!--세이프키-->
	<input type="hidden" name="ordListImg"   value="${orderVo.ordListImg}" />
	<input type="hidden" name="custDivCd" 	 value="${userVo.custDivCd}"/> 		   <!-- 고객구분=개인:1/법인:2-->
	<input type="hidden" name="comDivCd"  	 value="${userVo.comDivCd}" />  	   <!-- 법인회원구분=개인사업자:1/법인사업자:2-->
	<input type="hidden" name="batchKey"  	 value="" />
    <input type="hidden" name="seasonCd"     value="${orderVo.seasonCd}" />            <!--계절코드 -->
    <input type="hidden" name="seasonCdNm"   value="${orderVo.seasonCdNm}" />          <!--계절명 -->
    <input type="hidden" name="oeNm"    	 value="${orderVo.oeNm}" />          	   <!--순정,호환여부 -->
    <input type="hidden" name="classCd"      value="${orderVo.classCd}" />             <!--SUV,승용차여부 -->
    <input type="hidden" name="classCdNm"    value="${orderVo.classCdNm}" />             <!--SUV,승용차여부 -->
    <input type="hidden" name="totalAmt"     value="${rentalProd.totalAmt}" />
    <input type="hidden" name="atflNm"       value="${rentalProd.atflPathNm}" />
    <input type="hidden" name="renThumImg"    value="${orderVo.renThumImg}" />

    <input type="hidden" name="payYn"   	 value="N" />	<!-- 결제여부 -->

    <input type="hidden" name="selEnginCd"    	 value="${orderVo.selEnginCd}" /> 		<!-- B00001 선택한 엔진오일 서비스횟수 코드  -->
	<input type="hidden" name="selEnginCdAmt"    value="${orderVo.selEnginCdAmt}" />	<!-- B00001 선택한 엔진오일 서비스 금액  -->
	<input type="hidden" name="selLocCd"    	 value="${orderVo.selLocCd}" /> 		<!-- B00002 선택한 위치교환 서비스횟수 코드  -->
	<input type="hidden" name="selLocCdAmt"    	 value="${orderVo.selLocCdAmt}" /> 	<!-- B00002 선택한 위치교환 서비스 금액  -->
	<input type="hidden" name="selVisCd"    	 value="${orderVo.selVisCd}" /> 		<!-- B00003 선택한 방문점검 서비스횟수 코드  -->
	<input type="hidden" name="selVisCdAmt"      value="${orderVo.selVisCdAmt}" />  	<!-- B00003 선택한 방문점검 서비스 금액  -->
	<input type="hidden" name="selSaveCd"    	 value="${orderVo.selSaveCd}" />		<!-- B00004 선택한 보관 서비스횟수 코드  -->
	<input type="hidden" name="selSaveCdAmt"     value="${orderVo.selSaveCdAmt}" />	<!-- B00004 선택한 보관 서비스 금액  -->
	<input type="hidden" name="selTcCd"    	  	 value="${orderVo.selTcCd}" />			<!-- B00006 선택한 타이어 무상 교체 서비스횟수 코드  -->
	<input type="hidden" name="selTcCdAmt"    	 value="${orderVo.selTcCdAmt}" />		<!-- B00006 선택한 타이어 무상 교체 서비스 금액  -->
	<input type="hidden" name="selPrCd"    	 	 value="${orderVo.selPrCd}" />			<!-- B00007 선택한 프리미엄(사계절보증제도) 서비스횟수 코드  -->
	<input type="hidden" name="selPrCdAmt"    	 value="${orderVo.selPrCdAmt}" />		<!-- B00007 선택한 프리미엄(사계절보증제도) 서비스 금액  -->
	<input type="hidden" name="selArCd"    		 value="${orderVo.selArCd}" />			<!-- B00008 선택한 얼라인먼트 서비스횟수 코드  -->
	<input type="hidden" name="selArAmt"    	 value="${orderVo.selArAmt}" />		<!-- B00008 선택한 얼라인먼트 서비스 금액  -->
	<input type="hidden" name="selCheckCd"    	 value="${orderVo.selCheckCd}" />			<!-- B00010 선택한 chcek 서비스횟수 코드  -->
	<input type="hidden" name="selCheckCdAmt"    value="${orderVo.selCheckCdAmt}" />		<!-- B00010 선택한 check 서비스 금액  -->
    <input type="hidden" name="prdtGrp"    	 	 value="${rentalProd.prdtGrp}" />
    <input type="hidden" name="prdtGrpDtl"    	 value="${rentalProd.prdtGrpDtl}" />
    <input type="hidden" id="rentArYn"    	 	 value="${orderVo.rentArYn}" />		<!-- 자유렌탈 이외 얼라인먼트 여부값 (이후 넘겨주는 값은 아니라 id로함) -->

    <input type="hidden" name="ordId" 		    	id="ordId" />		    		<!-- TMS2채번한 주문번호 -->
	<input type="hidden" name="selectedTime"    	id="selectedTime" />			<!-- TMS2선택한 시간 -->
	<input type="hidden" name="vehicleScheduleList" id="vehicleScheduleList" />		<!-- TMS2스케쥴리스트 -->
    <input type="hidden" name="mountCd" 			id="mountCd" />					<!-- 장착점 구분 코드-->
    <input type="hidden" name="mountDt" 			id="mountDt" />
    <input type="hidden" name="mountTime" 			id="mountTime" />
	<input type="hidden" name="itemCdArr" 			id="itemCdArr" />		<!-- 품목코드 -->
	<input type="hidden" name="itemCntArr" 			id="itemCntArr" />		<!-- 수량  -->
    <input type="hidden" name="tmsOrderId" 			id="tmsOrderId" />
    <input type="hidden" name="orderConfigType" 	id="orderConfigType" />
    <input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->
    <!-- 납부구분   ('1':월납, '9':일시납)  -->
    <c:choose>
     <c:when test="${rentalProd.prdtGrp eq '03'}">
     	<input type="hidden" name="payGb"    value="9" />
     </c:when>
     <c:otherwise>
     	<input type="hidden" name="payGb"    value="1" />
     </c:otherwise>
    </c:choose>
	<input type="hidden" name="reRentalOrdNo" value="${reRentalOrdNo}"> 	<!-- 2018.10.17 김선태 재렌탈 주문번호 -->
	<input type="hidden" name="reRentalDsc" value="${reRentalDsc}"> 		<!-- 재렌탈 할인구분: R-율, F-액 -->
	<input type="hidden" name="reRentalDc" value="${reRentalDc}"> 			<!-- 재렌탈 할인정보 -->
	<input type="hidden" name="reRentalDcAmt" value="${reRentalDcAmt}"> 	<!-- 재렌탈 할인정보 -->
	<input type="hidden" name="membershipOrdNo" value="${orderVo.membershipOrdNo}"> <!-- 멤버십 기존계약 -->

	<input type="hidden" name="selectRegiAmt"  value="${rentalProd.regiAmt}">
	<input type="hidden" name="pageNo" id="pageNo" value="1">
	<input type="hidden" name="pageSize"	id="pageSize" 	value="5" />		<!-- 페이지에 표시할 수 -->
	<input type="hidden" name="currentPage" id="currentPage" value="1">
	<input type="hidden" name="saleCurPage" id="saleCurPage" value="1">

	<input type="hidden" name="bldMngNo" id="bldMngNo" value="${userVo.bldMngNo}" />

	<!-- subContentsWrap -->
	<div class="subContentsWrap">
		<main class="order-basket">
        	<!-- header -->
          	<div class="page-header empty">
            	<h2 class="title-deco">
              		<span>탁월한</span> <span>선택!</span>
            	</h2>
            	<div class="page-header-step">
              		<img src="../img/order/header_step_02.png" alt="주문서 작성/결제">
            	</div>
          	</div>
          	<!-- //header -->

          	<!-- 주문 정보 안내 -->
          	<div class="order-header-message text-center border-bottom">
            	<p>선택한 상품입니다</p>
            	<div class="order-info-summary">
              		<small>고객님이 선택하신 상품 정보 입니다. 정확한지 확인해보세요.</small>
            	</div>
          	</div>
          	<!-- //주문 정보 안내 -->

          	<!-- 주문 정보 상세 -->
          	<div class="product-sub-info rental accordion-box js-accordion">
            	<!-- 00 -->
            	<div class="accordion">
              		<h3>렌탈상품<span class="order-product-count">1</span>건</h3>
            	</div>
            	<div class="accordion-info step1">
	              	<!-- 구매 상품 -->
	              	<c:if test="${orderVo.pageGbn eq 'D' }">
		              	<article class="order-single inset-m layout-c" name="ordNoSn" cartNo="${orderVo.cartNo }" patternCd="${orderVo.patternCd }" itemCd="${orderVo.matCd }">
		                	<div class="layout-r same-size">
		                    	<div class="inlnie align-bottom">
		                      		<div class="order-data-photo">
                                       	<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${orderVo.renThumImg }" alt="타이어 사진">
		                      		</div>
		                    	</div>
		                    	<div class="inlnie border-bottom order-box">
		                      		<div class="order-data-title">
		                        		<h3>${orderVo.patternCd}</h3>
		                      		</div>
		                      		<div class="order-product-info">
		                        		<ul class="mb-s" name="ordNoSn" cartNo="${orderVo.cartNo }" patternCd="${orderVo.patternCd }" itemCd="${orderVo.matCd }">
		                          			<li><span>${orderVo.classCdNm }</span><span>${orderVo.seasonCdNm}</span></li>
		                          			<li>${orderVo.tireSize}</li>
		                          			<li><span>${orderVo.makerNm}</span><span>${orderVo.modelNm}</span></li>
		                        		</ul>
		                      		</div>
		                    	</div>
		                  	</div>
		                  	<div class="layout-c mt-m">
		                    	<div class="layout-r inline-s order-rent">
		                      		<div class="order-count inline align-middle">
		                        		<b class="align-middle">수량</b>
		                        		<span>${orderVo.cntCdNm}</span>
		                      		</div>
		                      		<div class="order-rent-info">
		                        		<dl class="layout-r">
		                          			<dt>렌탈기간</dt>
		                          			<dd>월 렌탈료</dd>
		                          			<dd><fmt:formatNumber value="${rentalProd.rentAmt }" pattern="#,###" /></dd>
		                        		</dl>
		                        		<dl class="layout-r">
		                          			<dt><b>${orderVo.periodCd }개월</b></dt>
		                          			<dd>렌탈 등록비</dd>
		                          			<dd><fmt:formatNumber value="${rentalProd.regiAmt }" pattern="#,###" />&nbsp;&nbsp;<span id="textRegiAmt11"></em></dd>
		                        		</dl>
		                        		<dl class="layout-r last">
		                        			<dt class="align-middle"><b>등록비 변경</b></dt>
		                        			<dd>
			                        			<c:choose>
													<c:when test="${rentalProd.prdtGrp eq '01' and rentalProd.prdtGrpDtl eq '04'}">
														<select name="" id="selectRegiAmt" class="" onChange="changeRegiAmt(this.value);" disabled="disabled" >
															<option value="${rentalProd.regiAmt}" selected >${rentalProd.regiAmt}</option>
														</select>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${rentalProd.prdtGrp eq '01' and (rentalProd.prdtGrpDtl eq '01' or rentalProd.prdtGrpDtl eq '02') and (reRentalOrdNo eq 'N' or reRentalOrdNo eq '')}">
																<select name="" id="selectRegiAmt" class="" onChange="changeRegiAmt(this.value);">
																	<option value="0" <c:if test="${rentalProd.regiAmt  eq '0'}">selected</c:if> >0</option>
																	<option value="${rentalProd.regiAmt}" <c:if test="${rentalProd.regiAmt  eq rentalProd.regiAmt}">selected</c:if> > <fmt:formatNumber value="${rentalProd.regiAmt}" groupingUsed="true"/></option>
																	<option value="${2 * rentalProd.regiAmt}" <c:if test="${rentalProd.regiAmt  eq (2 * rentalProd.regiAmt)}">selected</c:if> > <fmt:formatNumber value="${2 * rentalProd.regiAmt}" groupingUsed="true"/></option>
																</select>
															</c:when>
															<c:otherwise>
																<input type="hidden" id="selectRegiAmt" value="${rentalProd.regiAmt}" />
																<fmt:formatNumber value="${rentalProd.regiAmt}" groupingUsed="true"/>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</dd>
		                        		</dl>
		                      		</div>
		                    	</div>
		                  	</div>
						</article>
					</c:if>
	              	<c:if test="${orderVo.pageGbn eq 'C' }">
		              	<article class="order-single inset-m layout-c">
		                	<div class="layout-r same-size">
		                    	<div class="inlnie align-bottom">
		                      		<div class="order-data-photo">
		                        		<img src="../img/product/product_thum_01.png" alt="">
		                      		</div>
		                    	</div>
		                    	<div class="inlnie border-bottom order-box">
		                      		<div class="order-data-title">
		                        		<h3>${orderVo.patternCd}</h3>
		                      		</div>
		                      		<div class="order-product-info">
		                        		<ul class="mb-s" name="ordNoSn" cartNo="${orderVo.cartNo }" patternCd="${orderVo.patternCd }" itemCd="${orderVo.matCd }">
		                          			<li><span>${orderVo.classCdNm }</span><span>${orderVo.seasonCdNm}</span></li>
		                          			<li>${orderVo.dispSize}</li>
		                          			<li><span>${orderVo.makerNm}</span><span>${orderVo.modelNm}</span></li>
		                        		</ul>
		                      		</div>
		                    	</div>
		                  	</div>
		                  	<div class="layout-c mt-m">
		                    	<div class="layout-r inline-s order-rent">
		                      		<div class="order-count inline align-middle">
		                        		<b class="align-middle">수량</b>
		                        		<span>${orderVo.cntCdNm}</span>
		                      		</div>
		                      		<div class="order-rent-info">
		                        		<dl class="layout-r">
		                          			<dt>렌탈기간</dt>
		                          			<dd>월 렌탈료</dd>
		                          			<dd><fmt:formatNumber value="${rentalProd.rentAmt }" pattern="#,###" /></dd>
		                        		</dl>
		                        		<dl class="layout-r">
		                          			<dt><b>${orderVo.periodCd }개월</b></dt>
		                          			<dd>렌탈 등록비</dd>
		                          			<dd><fmt:formatNumber value="${rentalProd.regiAmt }" pattern="#,###" />&nbsp;&nbsp;<span id="textRegiAmt11"></em></dd>
		                        		</dl>
		                        		<dl class="layout-r last">
		                        			<dt class="align-middle"><b>등록비 변경</b></dt>
		                        			<dd>
			                        			<c:choose>
													<c:when test="${rentalProd.prdtGrp eq '01' and rentalProd.prdtGrpDtl eq '04'}">
														<select name="" id="selectRegiAmt"  class="type07 w130 priceChange" onChange="changeRegiAmt(this.value);" disabled="disabled" >
															<option value="${rentalProd.regiAmt}" selected >${rentalProd.regiAmt}</option>
														</select>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${rentalProd.prdtGrp eq '01' and (rentalProd.prdtGrpDtl eq '01' or rentalProd.prdtGrpDtl eq '02') and (reRentalOrdNo eq 'N' or reRentalOrdNo eq '')}">
																<select name="" id="selectRegiAmt"  class="type07 w130 priceChange" onChange="changeRegiAmt(this.value);">
																	<option value="0" <c:if test="${rentalProd.regiAmt  eq '0'}">selected</c:if> >0</option>
																	<option value="${rentalProd.regiAmt}" <c:if test="${rentalProd.regiAmt  eq (12500 * orderVo.cntCd)}">selected</c:if> > <fmt:formatNumber value="${rentalProd.regiAmt}" groupingUsed="true"/></option>
																	<option value="${2 * rentalProd.regiAmt}" <c:if test="${rentalProd.regiAmt  eq (25000 * orderVo.cntCd)}">selected</c:if> > <fmt:formatNumber value="${2 * rentalProd.regiAmt}" groupingUsed="true"/></option>
																</select>
															</c:when>
															<c:otherwise>
																<input type="hidden" id="selectRegiAmt" value="${rentalProd.regiAmt}" />
																<fmt:formatNumber value="${rentalProd.regiAmt}" groupingUsed="true"/>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</dd>
		                        		</dl>
		                      		</div>
		                    	</div>
		                  	</div>
						</article>
					</c:if>
	              	<!-- //구매 상품 -->
				</div>
	            <!-- //00 -->

	            <!-- 상품 안내 -->
	            <div class="order-middle-message text-center border-bottom">
					<p>상품 주문을 위한 정보를 입력하세요.</p>
	              	<div class="order-info-summary">
		                <small>고객님의 정보를 정확하게 입력하세요.<br>개인정보가 보호받을 수 있도록 최선을 다하고 있습니다.</small>
	              	</div>
	            </div>
	            <!-- //상품 안내 -->

	            <!-- 주문자 정보 -->
	            <div class="accordion">
	            	<h3>주문자 정보</h3>
	            </div>
	            <div class="accordion-info inset-ml">
	            	<div class="submit layout-c mb-m border-bottom">
	                	<label for="ordrNm"><span class="essen black">주문자</span></label>
	                	<input type="text" name="ordrNm" value="${userVo.custNm }" class="type03" id="ordrNm" title="주문자정보 입력란" placeholder="주문자 정보를 입력하세요" readonly="readonly">
	              	</div>
	              	<div class="submit layout-c border-bottom mb-s">
	                	<label for="ordrHp1"><span class="essen black">휴대전화</span></label>
	               		<div class="layout-r inline-m same-size">
	               			<select id="ordrHp1" class="inline" title="휴대전화 앞자리 선택" name="ordrHp1" readonly="readonly">
	                 			<option value="010" <c:if test="${userVo.ordrHp1 eq '010'}">selected</c:if> >010</option>
								<option value="011" <c:if test="${userVo.ordrHp1 eq '011'}">selected</c:if> >011</option>
								<option value="016" <c:if test="${userVo.ordrHp1 eq '016'}">selected</c:if> >016</option>
								<option value="017" <c:if test="${userVo.ordrHp1 eq '017'}">selected</c:if> >017</option>
								<option value="018" <c:if test="${userVo.ordrHp1 eq '018'}">selected</c:if> >018</option>
								<option value="019" <c:if test="${userVo.ordrHp1 eq '019'}">selected</c:if> >019</option>
	               			</select>
	               			<span class="divi type02 align-middle"></span>
	               			<input type="text" name="ordrHp2" id="ordrHp2" value="${userVo.ordrHp2 }" maxlength="4" class="inline" title="휴대폰 중간번호 입력란" readonly="readonly">
	               			<span class="divi type02 align-middle"></span>
	               			<input type="text" name="ordrHp3" id="ordrHp3" value="${userVo.ordrHp3 }" maxlength="4" class="inline" title="휴대폰 끝번호 입력란" readonly="readonly">
	               		</div>
	              	</div>

	              	<div class="submit layout-c mb-m border-bottom">
	                	<label for="ordrEmail1">이메일</label>
	                	<div class="layout-r">
	                  		<input type="text" id="ordrEmail1" onkeyup="this.value=fn_noKorean(this.value); fn_emailCheck();" onfocusout="this.value=fn_noKorean(this.value);" name="ordrEmail1" title="이메일 앞자리 입력란" value="${userVo.ordrEmail1}"><span class="align-middle">@</span>
	                  		<input type="text" id="ordrEmail2" onkeyup="this.value=fn_inputEmail(this.value); fn_emailCheck();" onfocusout="this.value=fn_inputEmail(this.value);"  name="ordrEmail2" title="이메일 뒷자리 입력란" value="${userVo.ordrEmail2}">
	                  		<select id="ordrEmail3" title="이메일 선택" onChange="fn_selectEmailAdr(); fn_emailCheck();">
	                    		<option value="">직접입력</option>
                                <option value="hanmail.net"  <c:if test="${userVo.ordrEmail2 eq 'hanmail.net'}">selected</c:if>>hanmail.net</option>
                                <option value="naver.com" 	 <c:if test="${userVo.ordrEmail2 eq 'naver.com'}">selected</c:if>>naver.com</option>
                                <option value="nate.com" 	 <c:if test="${userVo.ordrEmail2 eq 'nate.com'}">selected</c:if>>nate.com</option>
                                <option value="gmail.com" 	 <c:if test="${userVo.ordrEmail2 eq 'gmail.com'}">selected</c:if>>gmail.com</option>
                                <option value="hotmail.com"  <c:if test="${userVo.ordrEmail2 eq 'hotmail.com'}">selected</c:if>>hotmail.com</option>
                                <option value="paran.com" 	 <c:if test="${userVo.ordrEmail2 eq 'paran.com'}">selected</c:if>>paran.com</option>
                                <option value="empal.com" 	 <c:if test="${userVo.ordrEmail2 eq 'empal.com'}">selected</c:if>>empal.com</option>
                                <option value="korea.com"    <c:if test="${userVo.ordrEmail2 eq 'korea.com'}">selected</c:if>>korea.com</option>
                                <option value="freechal.com" <c:if test="${userVo.ordrEmail2 eq 'freechal.com'}">selected</c:if>>freechal.com</option>
	                  		</select>
	                	</div>
	              	</div>

	              	<div class="submit layout-c">
	                	<label for="addr1"><span class="essen black">주소</span></label>
	                	<div class="conWrap layout-r border-bottom mb-s" name="addrTxt" onclick="selectJusoPop('A');">
	                  		<input type="hidden" name="postNo" class="type03" id="postNo" value="${userVo.posNo}">
							<input type="hidden" name="addr2" class="type03" id="addr2" value="${userVo.addr2}">
							<input type="hidden" name="addr1" class="type03" id=addr1 value="${userVo.addr1}">
							<div class="layout-r full-width">
								<input type="text"  name="addrtxt" class="type03 trans-bg" id="addrTxt" title="주소 입력란" placeholder="주소를 검색하세요" readonly="readonly">
	                  		</div>
		                  	<button type="button" class="inline btn-address-search md-trigger align-middle">검색</button>
	                	</div>
	                	<p class="validation">
	                  		<span><i class="ico08"></i>입력해주신 이메일/주소로 메일 또는 우편으로 계약서를 발송해 드립니다.</span>
	                	</p>
	              	</div>
	            </div>
	            <!-- //주문자 정보 -->

	            <!-- 장착서비스 정보 -->
	            <div class="accordion">
	            	<h3>장착 서비스 정보</h3>
	            </div>
	            <div class="accordion-info inset-ml">
	            	<input type="hidden" name="insStoreCd" id="insStoreCd">
                   	<input type="hidden" name="insStoreName" id="insStoreName">
                   	<input type="hidden" name="insStoreAddr" id="insStoreAddr">
                   	<input type="hidden" name="salesGroup" id="salesGroup">
                   	<input type="hidden" name="salesOffice" id="salesOffice">

	            	<div class="submit">
	                	<label for="info01"><span class="essen black">장착 서비스</span></label>
	                	<button type="button" class="ml-s popup-guide md-trigger" onclick="btn_TireSizeTip(); return false;">이용가이드</button>

		                <!-- js-radio UI -->
		                <div class="conWrap js-radioUI mt-s">
		                	<ul>
		                    	<li class="radio col-2">
		                      		<input type="radio" name="instCd" id="ser1" checked="checked" value="10" class="radioChk" title="방문장착서비스 선택">
		                      		<label for="ser1"><span>방문장착서비스</span></label>
		                    	</li>
		                    	<!-- <li class="radio col-2">
		                      		<input type="radio" name="instCd" id="ser2" value="20" class="radioChk" title="픽업&amp;딜리버리 장착 서비스 선택">
		                      		<label for="ser2"><span>픽업&amp;딜리버리 장착 서비스</span></label>
		                    	</li> -->
		                    	<li class="radio col-2">
		                      		<input type="radio" name="instCd" id="ser3" value="40" class="radioChk" title="전문점 장착 서비스 선택">
		                      		<label for="ser3"><span>전문점 장착 서비스</span></label>
		                    	</li>
		                  	</ul>
		                </div>
		                <!-- //js-radio UI -->
	              	</div>

	              	<!-- js-radio UI contents -->
	              	<!-- ###################################### -->

	              	<!-- 방문장착 서비스 -->
	              	<!-- 얼라이먼트 정비-->
                    <div class="submit" id="noPickUpAlign" style="display: none">
                    	<label for="info01"><span class="essen black">휠 얼라인먼트 정비</span></label>

                        <!-- js-radio UI -->
	                	<div class="conWrap js-radioUI mt-s">
	                  		<ul>
	                    		<li class="radio col-2">
									<input type="radio" name="mounting2" id="giveCpn" checked="checked" value="Y" class="type06" title="방문장착서비스 선택">
	                      			<label for="giveCpn"><span>쿠폰 발급</span></label>
                        		</li>
                        	</ul>
	                    </div>
	                    <!-- //js-radio UI -->
                    </div>

	              	<div class="submit" id="noPickUp">
	                	<label for="info02"><span class="essen black">장착 주소</span></label>
	                	<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="B" onclick="selectJusoPop('B');">
	                  		<input type="text" name="addrTxtB" class="pl-0 trans-bg" id="addrTxtB" title="주소 입력란" placeholder="장착 받으실 주소를 검색하세요." readonly="readonly">
	                  		<input type="hidden" id="zipCodeB" />
	                  		<button type="button" name="selectAddr" val="B" class="align-middle btn-address-search" onclick="selectJusoPop('B');">검색</button>
	                	</div>
	                	<!-- 둘중 하나만 보였다 안보였다 해야함. addClass, removeClass 필요. MEPARK -->
	                	<p class="validation" id="addrOkB" style="display: none;">
	                		<span><i class="ico08"></i>방문장착 서비스가 가능합니다.</span>
	                	</p>
	                	<p class="validation warning" id="bangMunAlertTxt" style="display: none;">
	                  		<span>방문장착 서비스가 불가능합니다.</span>
	                	</p>
	              	</div>
	              	<!-- //방문장착 서비스 -->

	              	<!-- 픽업,딜리버리 장착 서비스 -->
	              	<div class="submit" id="pickUp" style="display: none;">
	                	<label for="info03"><span class="essen black">장착 주소</span></label>
	                	<!-- <a href="#" class="guide" id="show03"></a> 이용가이드 버튼 필요. MEPARK -->
	                	<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="P1" onclick="selectJusoPop('P1');">
	                  		<input type="text" name="addrTxtP1" class="pl-0 trans-bg" id="addrTxtP1" title="주소 입력란" placeholder="픽업주소를 검색하세요" readonly="readonly">
	                  		<input type="hidden" id="zipCodeP1" />
	                  		<button type="button" name="selectAddr" val="P1" class="align-middle btn-address-search" onclick="selectJusoPop('P1');">검색</button>
	                	</div>
	                	<p class="validation" id="addrOkP1" style="display: none;">
	                		<span ><i class="ico08"></i>픽업 서비스가 가능합니다.</span>
	                	</p>
	                	<p class="validation warning" id="PicAlertTxt" style="display: none;">
	                  		<span>픽업 서비스가 불가능합니다.</span>
	                	</p>
	                	<div class="conWrap layout-l mb-s">
                            <input type="checkbox" id="pickUpAddrCopy" name="pickUpAddrCopy" value="0" class="type01">
                            <label for="pickUpAddrCopy"><span></span>픽업주소 동일</label>
                        </div>
	                	<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="P2" onclick="selectJusoPop('P2');">
	                  		<input type="text" name="addrTxtP2" class="pl-0 trans-bg" id="addrTxtP2" title="주소 입력란" placeholder="딜리버리 주소를 검색하세요" readonly="readonly">
	                  		<input type="hidden" id="zipCodeP2" />
	                  		<button type="button" name="selectAddr" val="P2" class="align-middle btn-address-search" onclick="selectJusoPop('P2');">검색</button>
	                	</div>
	                	<p class="validation" id="addrOkP2" style="display: none;">
	                		<span><i class="ico08"></i>딜리버리 서비스가 가능합니다.</span>
	                	</p>
	                	<p class="validation warning" id="drvAlertTxt" style="display: none;">
	                  		<span>딜리버리 서비스가 불가능합니다.</span>
	                	</p>

	              	</div>
	              	<!-- //픽업,딜리버리 장착 서비스 -->

	              	<!-- 전문점 장착 서비스 -->
	              	<input type="hidden" id="inst1Poscd" name="inst1Poscd"> <!-- 방문, Pick-up주소-우편번호 -->
                    <input type="hidden" id="inst1Addr1" name="inst1Addr1"> <!-- 방문, Pick-up주소-주소 -->
                    <input type="hidden" id="inst1Addr2" name="inst1Addr2"> <!-- 방문, Pick-up주소-상세주소 -->
                    <input type="hidden" id="inst2Poscd" name="inst2Poscd"> <!-- Deliver 주소-우편번호 -->
                    <input type="hidden" id="inst2Addr1" name="inst2Addr1"> <!-- Deliver 주소-주소 -->
                    <input type="hidden" id="inst2Addr2" name="inst2Addr2"> <!-- Deliver 주소-상세주소 -->

	              	<div class="submit" id="junmun" style="display: none;">
	                	<label for="info03"><span class="essen black">장착 주소</span></label>
	                	<!-- <a href="#" class="guide" id="show03"></a> 이용가이드 버튼 필요. MEPARK -->
	                	<div class="shop-info">
	                  		<!-- <span>르노삼성자동차지정정비코너용강</span> -->
	                	</div>
	                	<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="J" onclick="callMap('1');">
	                  		<input type="text" name="addrTxtJ" class="pl-0 trans-bg" id="addrTxtJ" title="주소 입력란" placeholder="전문점을 선택해주세요." readonly="readonly">
	                  		<input type="hidden" id="zipCodeJ" />
	                  		<button type="button" name="selectAddr" val="J" class="align-middle btn-address-search md-trigger" data-modal="modal-Shop">검색</button>
	                	</div>
	                	<p class="validation">
	                		<span id="addrOkJ" style="display: none;"><i class="ico08"></i>방문장착 서비스가 가능합니다.</span>
	                	</p>
	              	</div>
	              	<!-- //전문점 장착 서비스 -->

	              	<!-- ###################################### -->
	              	<!-- //js-radio UI contents -->

					<!-- 얼라이먼트 정비-->
	              	<div class="submit"  id="pickUpAlign" style="display: none">
	                    <label for="info03"><span class="essen black">휠 얼라인먼트 정비</span></label>

	                    <!-- js-radio UI -->
                        <div class="conWrap js-radioUI mt-s">
                        	<ul>
                        		<li class="radio col-2">
		                       	    <input type="radio" name="alignRd" id="alignSerReq" checked="checked" value="Y" class="type06" title="픽업&amp;딜리버리 장착 서비스 선택" >
		                       	    <label for="alignSerReq"><span>타이어 장착 시 얼라인먼트 정비</span></label>
		                       	</li>
		                       	<li class="radio col-2">
		                       		<input type="radio" name="alignRd" id="giveCpnPick"  checked="checked" value="N" class="type06" title="픽업&amp;딜리버리 장착 서비스 선택" >
		                       		<label for="giveCpnPick"><span>쿠폰 발급</span></label>
                        		</li>
                        	</ul>
                        </div>
	                    <!-- //js-radio UI -->
                    </div>

					<!-- 달력 슬라이드 -->
					<div id="datepicker_acdn">
					</div>

					<!-- 장착 희망일  -->
	              	<div class="submit">
	                	<label for="datepicker"><span class="essen black" id="istDtTxt">장착일자</span></label>
	                	<div class="conWrap mb-s">
		                  	<div class="dateTime layout-r same-size border-bottom">
		                    	<div class="inline" style="width:55%;">
		                    		<img src="/img/common/ico_calendar.png" onClick="runEffect(true)" style="cursor: pointer;" />
		                      		<input type="text" name="reqInsDt" class="datepicker" id="datepicker11" title="장착 희망일시 입력란" readonly="readonly" style="width:70%;">
		                    	</div>

		                    	<div class="conWrap js-radioUI mt-s">
	                    		  	<ul class="amPmChk">
	                    		  		<li class="radio col-2">
	                  						<input type="radio" name="timeRd" id="am" value="AM" class="type06" title="오전 선택" >
	                  						<label for="am"><span>오전</span></label>
	                    		  		</li>
	                    		  		<li class="radio col-2" style="padding-left:8px">
					                        <input type="radio" name="timeRd" id="pm" value="PM" class="type06" title="오후 선택">
					                        <label for="pm"><span>오후</span></label>
	                    		  		</li>
	                    		  	</ul>
	                    		</div>
		                  	</div>
	                	</div>
	                	<p class="validation" id="mountAlertTxt" style="display: none;"></p>
	              	</div>
	              	<!-- //장착 희망일  -->

	              	<!-- 장착 희망시간  -->
					<div class="submit list timePick">
	              		<label for="time">
						  <span class="essen black" id="istTmTxt">장착시간</span>
  							<div class="label-addon">
								<span class="time-off"></span> 예약불가(배차완료)
								<span class="time-on"></span> 예약가능
							</div>

					  </label>
	              		<div class="conWrap mb-s">
	              			    <ul class="timeCheck" id="amArea" style="display:none;">
	                                <li style="margin:0.75rem 0">
		                           		<span class="off" id="time0900" >09:00</span>
		                           		<span class="off" id="time0930" >09:30</span>
		                           		<span class="off" id="time1000" >10:00</span>
		                           		<span class="off" id="time1030" >10:30</span>
		                           	</li>
		                           	<li style="margin:0.75rem 0">
		                           		<span class="off" id="time1100" >11:00</span>
		                           		<span class="off" id="time1130" >11:30</span>
	                           	 	</li>
	                          	</ul>
	                         	<ul class="timeCheck" id="pmArea" style="display:none;">
                           	    	<li style="margin:0.75rem 0">
                              		    <span class="off" id="time1300" >13:00</span>
                              		    <span class="off" id="time1330" >13:30</span>
                              		    <span class="off" id="time1400" >14:00</span>
                              		    <span class="off" id="time1430" >14:30</span>
                              		</li>
                              		<li style="margin:0.75rem 0">
                              		    <span class="off" id="time1500" >15:00</span>
                              		  	<span class="off" id="time1530" >15:30</span>
                              		  	<span class="off" id="time1600" >16:00</span>
                              		 	<span class="off" id="time1630" >16:30</span>
                              	 	</li>
                              	  	<li style="margin:0.75rem 0">
                              		  	<span class="off" id="time1700" >17:00</span>
                              		 	<span class="off" id="time1730" >17:30</span>
                              		 	<span class="off" id="time1800" >18:00</span>
                              		 	<span class="off" id="time1830" >18:30</span>
                              		</li>
                           	  	</ul>
	              		</div>
	              		<p class="validation type04" id="jobEndTimeMsg" style="display:none;">
                            <span style="color:#FF0000;"><i class="ico11"></i>종료예정시간</span>
                        </p>
					</div>
	              	<!-- //장착 희망시간 -->

	              	<div class="submit">
	                	<label for="carNoTxt"><span class="essen black">차량번호</span></label>
	                	<div class="conWrap mb-s border-bottom">
	                  		<input type="text" name="carNoTxt" id="carNoTxt" class="trans-bg" title="차량번호 입력란" placeholder="예)12가1234" onkeyup="fn_press_nice(this);" onkeydown="SchNullKey();"  value="${orderVo.carNo}" maxlength="9">
	                	</div>
	                	<p class="validation type04">
	                  		<span><i class="ico11"></i>장착을 위해 고객차량 확인용으로 이용됩니다.</span>
	                	</p>
	              	</div>

					<!-- 참고메세지는 렌탈시스템에 전달되지 않으므로 일단 block  -->
	              	<!-- <div class="submit">
	                	<label for="message"><span class="essen black">참고메세지</span></label>
	                	<div class="conWrap mb-s border-bottom">
	                  		<select id="etcMsg" onchange="etcMsgClick(this);">
	                    		<option value="01">메시지를 선택해주세요.</option>
                                <option value="02">주소지에 도착하면 전화 또는 문자주세요.</option>
                                <option value="03">직접입력</option>
	                  		</select>
	                  		<input type="text" style="display: none" id="etcMsgTxt" title="참고 메세지 입력란" placeholder="참고 메세지를 입력해주세요">
	                	</div>
	                	<p class="validation type04">
	                  		<span><i class="ico11"></i>장착 서비스 매니저에게 전달되는 메시지입니다.</span>
	                	</p>
	              	</div> -->
	            </div>
	            <!-- //장착서비스 정보 -->

	            <!-- 상품 안내 -->
	            <div class="order-middle-message text-center border-bottom">
					<p>결제 정보를 입력하세요.</p>
	              	<div class="order-info-summary">
	                	<small>월 렌탈 요금 자동이체 등록은 주문 고객님 본인의 계좌 또는 카드만 가능하며 선택한 결제일에 자동으로 결제됩니다. 렌탈 등록비는 장착 후 1회만 청구되며, 1회차 렌탈료와 함께 익월부터 청구됩니다.</small>
	              	</div>
	            </div>
	            <!-- //상품 안내 -->

	            <!-- 결제 정보 입력 -->
	            <div class="accordion">
	           		<h3>결제 정보</h3>
	            </div>
	            <div class="accordion-info inset-ml">
	            	<div class="submit border-gray-bottom">
	            		<label for="coupon"><span>월 렌탈료</span></label>
	            		<div class="conWrap pt-s pb-s">
	            			&#8361 <span id="textTotalAmt1"><fmt:formatNumber value="${rentalProd.rentAmt }" pattern="#,###" /></span>
	            		</div>
	          		</div>

	          		<div class="submit border-gray-bottom">
	            		<label for="coupon"><span>렌탈 등록비</span></label>
	            		<div class="conWrap pt-s pb-s" >
	            			&#8361 <span id="textRegiAmt1"><fmt:formatNumber value="${rentalProd.regiAmt }" pattern="#,###" /></span>
	            		</div>
	          		</div>

	          		<div class="submit">
	            		<div><span class="essen black">결제수단</span></div>
	            		<div class="conWrap mt-m">
		              		<!-- js-radio UI -->
		              		<div class="js-radioUI raGroup layout-r same-size">
		                		<div class="radio inline">
		                  			<input type="radio" name="rtPayMtd" id="pay1" checked="checked" value="C" class="radioPayment" title="신용카드 선택"><label for="pay1"><span>신용카드</span></label>
		                		</div>
		                		<div class="radio inline">
		                  			<input type="radio" name="rtPayMtd" id="pay2" value="A" class="radioPayment" title="계좌이체 선택"><label for="pay2"><span>계좌이체</span></label>
		                		</div>
		              		</div>
		              		<!-- //js-radio UI -->
	            		</div>
	          		</div>

	          		<!-- js-radio UI contents -->
		          	<!-- ###################################### -->
		          	<!-- 신용카드 -->
		          	<!-- <div id="radioPaymentUI01"> -->
		            	<div class="submit border-gray-bottom layout-c">
		              		<label for="rtCardPayDy"><span class="essen black">결제일</span></label>
	              			<div class="conWrap layout-r inline-m">
	                			<select class="col-3 inline" name="rtCardPayDy" id="rtCardPayDy" title="결제일 선택">
	                  				<option value="05">5일</option>
                                    <option value="10">10일</option>
                                    <option value="15">15일</option>
	                			</select>
	                			<div class="checkbox type01 inline">
	                  				<input type="checkbox" id="rtCardAgree" name="rtCardAgree" value="Y" class="checkbox-input align-middle" checked="checked">
	                  				<label class="checkbox-label align-middle" for="rtCardAgree">자동이체동의</label>
	                			</div>
	              			</div>
		            	</div>

		            	<!-- 사업자(개인)인 경우만 노출 -->
		            	<c:if test="${userVo.custDivCd eq '2' && userVo.comDivCd eq '1'}">
				            <div class="border-gray-bottom">
				              	<label for="confirmDivcd"><span class="essen black">본인확인 대상</span></label>
				              	<div class="conWrap layout-r inline-m">
				                	<select class="col-3 inline full-width" title="사업자 선택" name="confirmDivcd" id="confirmDivcd">
				                  		<option value="" selected>선택해주세요</option>
										<option value="1">대표자명</option>
										<option value="2">사업자번호</option>
				                	</select>
				              	</div>
				            </div>
			            </c:if>
			            <!-- //사업자(개인)인 경우만 노출 -->

		            	<div class="submit layout-c" name="cardArea">
		              		<label for="rtCardCorp"><span class="essen black">카드정보</span></label>
	              			<div class="conWrap layout-r same-size inline-m border-gray-bottom">
	                			<select class="inline" title="카드사 선택" name="rtCardCorp" id="rtCardCorp">
	                  				<option value="">카드사 선택</option>
									<c:forEach var="cardCdList" items="${cardCdList}" varStatus="status" >
										<option value="${cardCdList.cd}">${cardCdList.cdNm}</option>
									</c:forEach>
	                			</select>
	                			<input type="text" onkeyup="this.value=number_filter(this.value);" name="rtCardNo" id="rtCardNo" class="inline" title="카드번호 입력란" placeholder="카드번호를 입력하세요">
	              			</div>
		              		<p class="validation pt-s">
		                		<span><i class="ico11"></i>카드번호 입력시 “-”없이 숫자만 입력하세요.</span>
		              		</p>
		            	</div>

		            	<div class="submit border-gray-bottom" name="cardArea">
		              		<label for="rtCardOwner"><span class="essen black">카드소유주</span> </label>
		              		<input type="text" name="rtCardOwner" class="type03" id="rtCardOwner" title="카드소유주를 입력란" placeholder="카드소유주를 입력하세요">
		            	</div>

		            	<div class="submit border-gray-bottom" name="cardArea">
		              		<label for="year"><span class="essen black">유효기간</span></label>
		              		<div class="conWrap layout-r inline-m">
		                		<select class="col-3 inline" title="년도 선택" name="rtCardValYr" id="rtCardValYr">
		                  			<%for(int i=0;i<10;i++){%>
										<option value="<%=yy+i%>"><%=yy+i%></option>
									<%}%>
		                		</select>
		                		<select class="col-4 inline" title="월 선택" name="rtCardValMn" id="rtCardValMn">
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
					<!-- </div> -->
		          	<!-- //신용카드 -->

		          	<!-- 계좌이체 -->
		          	<!-- <div id="radioPaymentUI02" style="display: none;"> -->
		            	<div class="submit layout-c" name="bankArea">
		              		<label for="rtAcctCorp"><span class="essen black" >은행정보</span></label>
	              			<div class="conWrap layout-r same-size inline-m border-gray-bottom">
	                			<select class="inline" title="은행 선택" name="rtAcctCorp" id="rtAcctCorp">
	                  				<option value="">은행 선택</option>
									<c:forEach var="bankCdList" items="${bankCdList}" varStatus="status" >
										<option value="${bankCdList.cd}">${bankCdList.cdNm}</option>
									</c:forEach>
	                			</select>
	              			</div>
		              		<p class="validation pt-s">
		                		<span><i class="ico11"></i>계좌번호 입력시 “-”없이 숫자만 입력하세요.</span>
		              		</p>
		            	</div>

		            	<div class="submit border-gray-bottom" name="bankArea">
		              		<label for="rtCardOwner"><span class="essen black">계좌번호</span> </label>
		              		<div class="layout-r">
			              		<input type="text" name="rtAcctNo" id="rtAcctNo" onkeyup="this.value=number_filter(this.value); fn_setWritecan();" class="inline" title="계좌번호 입력란" placeholder="“-”없이 숫자만 입력하세요.">
		              		</div>
		            	</div>

		            	<div class="submit border-gray-bottom" name="bankArea">
		              		<label for="rtCardOwner"><span class="essen black">계좌소유주</span> </label>
		              		<div class="layout-r">
			              		<input type="text" name="rtAcctOwner" id="rtAcctOwner" onkeyup="fn_setWritecan();" class="type03" title="계좌소유주를 입력란" placeholder="계좌소유주를 입력하세요">
			              		<button type="button" class="seller-search" id="ars_button" onclick="fn_arsCallService(); event.preventDefault();" class="type09 po_10 fr">출금이체동의</button>
		              		</div>
		              		<p class="validation pt-s"  style="display: none;" id="bankMsgArea">
		                		<span><i class="ico11"></i>고객님의 등록된 휴대폰번호로 ARS인증 중입니다. 잠시만 기다려주세요.</span>
		              		</p>
		            	</div>

		          	<!-- </div> -->
		          	<!-- //계좌이체 -->
		          	<!-- ###################################### -->
		          	<!-- //js-radio UI contents -->
	            </div>
	            <!-- //결제 정보 입력 -->

				<!-- [20210609_01] kstka 판매인정보는 임직원 상품일 경우 보이지 않는다. -->
				<%-- <c:choose>
				     <c:when test="${rentalProd.prdtGrpDtl != '02'}">
				     	<!-- 판매인정보 -->
			            <div class="accordion">
			           		<h3>판매인 정보</h3>
			            </div>
			            <div class="accordion-info inset-ml">
			            	<div class="submit layout-c border-bottom">
			  					<label for="recomSalCdnm"><span class="essen black">판매인</span></label>
			  					<div class="layout-r">
			    					<input type="text" name="recomSalCdnm" id="recomSalCdnm" class="type03" title="판매인 입력란" placeholder="판매인 정보를 입력하세요" disabled="disabled">
			    					<input type="hidden" name="recomSalCd" id="recomSalCd"/>
									<input type="hidden" name="chanCd" id="chanCd"/>
			    					<button type="button" class="seller-search" onclick="fn_searchRecomSalInfo('1');">판매인검색</button>
			  					</div>
							</div>
							<div class="submit layout-c border-bottom">
			  					<label for="comment01"><span class="essen black">남기실 말씀</span> </label>
			  					<input type="text" name="remark" id="remark" class="type03 w580" title="남기실 말씀 입력란" placeholder="남기실 말씀을 입력하세요" onkeyup="inputStrLenChk(this,1000); return false;" >
							</div>
			            </div>
			            <!-- //판매인정보 -->

				     </c:when>
				</c:choose> --%>
				<!-- 판매인정보 -->
	            <!-- div class="accordion">
	           		<h3>판매인 정보</h3>
	            </div>
	            <div class="accordion-info inset-ml">
	            	<div class="submit layout-c border-bottom">
	  					<label for="recomSalCdnm"><span class="essen black">판매인</span></label>
	  					<div class="layout-r">
	    					<input type="text" name="recomSalCdnm" id="recomSalCdnm" class="type03" title="판매인 입력란" placeholder="판매인 정보를 입력하세요" disabled="disabled">
	    					<input type="hidden" name="recomSalCd" id="recomSalCd"/>
							<input type="hidden" name="chanCd" id="chanCd"/>
	    					<button type="button" class="seller-search" onclick="fn_searchRecomSalInfo('1');">판매인검색</button>
	  					</div>
					</div>
					<div class="submit layout-c border-bottom">
	  					<label for="comment01"><span class="essen black">남기실 말씀</span> </label>
	  					<input type="text" name="remark" id="remark" class="type03 w580" title="남기실 말씀 입력란" placeholder="남기실 말씀을 입력하세요" onkeyup="inputStrLenChk(this,1000); return false;" >
					</div>
	            </div> -->
	            <!-- //판매인정보 -->
	            <!-- [20210609_01] kstka 판매인정보는 임직원 상품일 경우 보이지 않는다. -->

				<input type="hidden" name="recomSalCdnm" id="recomSalCdnm" class="type03" title="판매인 입력란" placeholder="판매인 정보를 입력하세요" disabled="disabled">
	    		<input type="hidden" name="recomSalCd" id="recomSalCd"/>
				<input type="hidden" name="chanCd" id="chanCd"/>
				<input type="hidden" name="remark" id="remark" class="type03 w580" title="남기실 말씀 입력란" placeholder="남기실 말씀을 입력하세요" onkeyup="inputStrLenChk(this,1000); return false;" >
				
			</div>
	        <!-- //주문 정보 상세 -->

			<!-- 주문 확인 -->
	        <div class="orderBox inset-ml" id="sidebar">
	        	<article class="contents rent inset-ml">
	            	<div class="titleDesc mb-m">
	                	<h2 class="mb-s">주문확인</h2>
	                	<p>고객님의 주문정보가 정확한지 확인해보세요.</p>
	              	</div>
	              	<h3 class="mb-s">상품정보</h3>

	              	<!-- proInfo -->
	              	<div class="proInfo">
	                	<dl class="layout-r">
	                  		<dt>${orderVo.patternCd}</dt>
	                  		<dd>${orderVo.periodCd }개월</dd>
	                  		<dd>${fn:replace(orderVo.cntCdNm,'본','')}개</dd>
	                	</dl>
	              	</div>
	              	<!-- //proInfo -->

	              	<!-- proInfo -->
	              	<div class="proInfo totalPrice">
	                	<dl class="layout-r">
	                  		<dt>월 렌탈료(${orderVo.periodCd }개월)</dt>
	                  		<dd><span id="showRentalAmt"><fmt:formatNumber value="${rentalProd.rentAmt }" pattern="#,###" /></span></dd>
	                	</dl>
	                	<dl class="layout-r">
	                  		<dt>렌탈 등록비</dt>
	                  		<dd><span id="textRegiAmt"><fmt:formatNumber value="${rentalProd.regiAmt }" pattern="#,###" /></span></dd>
	                	</dl>
	              	</div>
	              	<!-- //proInfo -->

	              	<!-- totalPrice -->
	              	<div class="totalPrice">
	                	<div class="price mt-m">
	                  		<dl class="layout-r">
	                    		<dt>총 납입금액</dt>
	                    		<dd><span><fmt:formatNumber value="${rentalProd.sumTotalAmt }" pattern="#,###" /></span></dd>
	                  		</dl>
	                  		<dl class="layout-r">
	                    		<dt>기본 월 렌탈료</dt>
	                    		<dd><span id="textTotalAmt2"><fmt:formatNumber value="${rentalProd.rentAmt}" pattern="#,###" /></span></dd>
	                  		</dl>
	                  		<dl class="layout-r">
	                    		<dt>추가 렌탈료</dt>
	                    		<dd><span><fmt:formatNumber value="${rentalProd.addRentAmt }" pattern="#,###" /></span></dd>
	                  		</dl>
	                  		<dl class="layout-r sale">
	                    		<dt>할인금액</dt>
	                    		<dd>- <span><fmt:formatNumber value="${rentalProd.dcAmt }" pattern="#,###" /></span></dd>
	                  		</dl>
	                  		<div class="layout-c last mt-l">
	                    		<b class="text-right">최종 월 납입 렌탈료</b>
	                    		<div class="text-right"><span id="textTotalAmt3"><fmt:formatNumber value="${rentalProd.rentAmt + rentalProd.addRentAmt}" pattern="#,###" /></span></div>
	                  		</div>
	                	</div>
					</div>
	              	<!-- //totalPrice -->

	              	<div class="text-right">
	             		<small class="font-gray" style="color:#812990!important; font-weight:bold;">※ 렌탈등록비 및 렌탈료는 장착 후 익월부터 청구됩니다.</small>
	              	</div>
	            </article>
			</div>
	        <!-- //주문 확인 -->

			<button type="button" class="btn-primary inset-m full-width" onclick="orderRental(); event.preventDefault();"><b>렌탈 주문하기</b></button>
			<!-- <span id="rslt"></span> 이건 무슨 용도지? MEPARK-->
		</main>
	</div>
	<!-- //subContentsWrap -->


		<!-- ************************푸터영역************************ -->
  		<%-- <%@ include file="/WEB-INF/view/footer.jsp" %> --%>
  		<!-- ************************ /푸터영역************************ -->






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
					<input type="hidden" name="ordr_idxx" value="${orderVo.ordrIdxx}"/> <!--주문 번호-->
					<input type="hidden" name="good_name" value="${orderVo.patternCd}"/> <!-- 상품명(good_name) -->
					<input type="hidden" name="good_mny"  value="${rentalProd.regiAmt}"/>  <!-- 결제금액(good_mny) 등록비만 결제 금으로 결제한다. - ※ 필수 : 값 설정시 ,(콤마)를 제외한 숫자만 입력하여 주십시오. -->

					<input type="hidden" name="buyr_name"/> <!-- 주문자명(buyr_name) -->
					<input type="hidden" name="buyr_mail"/> <!-- 주문자 E-mail(buyr_mail) -->
					<input type="hidden" name="buyr_tel1"/> <!-- 주문자 연락처1(buyr_tel1) -->
					<input type="hidden" name="buyr_tel2"/> <!-- 휴대폰번호(buyr_tel2) -->
					<input type="hidden" name="pay_method" value="100000000000"/> <!-- 결제수단 -->
					<%
					     /* ============================================================================== */
					     /* =   1-2. 에스크로 정보                                                       = */
					     /* = -------------------------------------------------------------------------- = */
					     /* =   에스크로 사용업체에 적용되는 정보입니다.                                 = */
					     /* = -------------------------------------------------------------------------- = */
					%>
					<input type="hidden" name="rcvr_name" value="${ordrName}"/><!-- 수취인명(rcvr_name) -->
					<input type="hidden" name="rcvr_tel1"/><!-- 수취인 연락처1(rcvr_tel1) -->
					<input type="hidden" name="rcvr_tel2"/><!-- 수취인 휴대폰번호(rcvr_tel2) -->
					<input type="hidden" name="rcvr_mail"/><!-- 수취인 E-mail(rcvr_mail) -->
					<input type="hidden" name="rcvr_zipx"/><!-- 수취인 우편번호(rcvr_zipx) -->
					<input type="hidden" name="rcvr_add1"/><!-- 수취인 주소(rcvr_add1) -->
					<input type="hidden" name="rcvr_add2"/><!-- 수취인 상세주소-->
					<%
					    /* ============================================================================== */
					    /* =   3-1. Payplus Plugin 에스크로결제 사용시 필수 정보                        = */
					    /* = -------------------------------------------------------------------------- = */
					    /* =   결제에 필요한 주문 정보를 입력 및 설정합니다.                            = */
					    /* = -------------------------------------------------------------------------- = */
					%>
					<input type="hidden" name="req_tx"          value="pay" />
				    <input type="hidden" name="site_cd" 	value="<%=AppContext.getString(CoreConstants.KCP_SITE_CD)%>"/>
					<input type="hidden" name="site_name" 	value="<%=AppContext.getString(CoreConstants.KCP_SITE_NAME)%>"/>

				    <!-- 에스크로 사용 여부 : 반드시 Y 로 설정 -->
				    <input type="hidden" name="escw_used"       value="N"/>
					<!-- 에스크로 결제처리 모드 : 에스크로: Y, 일반: N, KCP 설정 조건: O  -->
				    <input type="hidden" name="pay_mod"         value="N"/>
					<!-- 배송 소요일 : 예상 배송 소요일을 입력 -->
					<input type="hidden"  name="deli_term" value="03"/>
					<!-- 장바구니 상품 개수 : 장바구니에 담겨있는 상품의 개수를 입력(good_info의 seq값 참조) -->
					<input type="hidden"  name="bask_cntx" value="1"/>
					<!-- 장바구니 상품 상세 정보 (자바 스크립트 샘플 create_goodInfo()가 온로드 이벤트시 설정되는 부분입니다.) -->
					<input type="hidden" name="good_info"       value=""/>

				    <input type="hidden" name="res_cd"          value=""/>
				    <input type="hidden" name="res_msg"         value=""/>
				    <!-- <input type="hidden" name="tno" id="tno"    value=""/> -->
				    <input type="hidden" name="trace_no"        value=""/>
				    <input type="hidden" name="enc_info"        value=""/>
				    <input type="hidden" name="enc_data"        value=""/>
				    <input type="hidden" name="ret_pay_method"  value=""/>
				    <input type="hidden" name="tran_cd"         value=""/>
				    <input type="hidden" name="bank_name"       value=""/>
				    <input type="hidden" name="bank_issu"       value=""/>

				    <!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
				    <input type="hidden" name="cash_tsdtime"    value=""/>
				    <input type="hidden" name="cash_yn"         value=""/>
				    <input type="hidden" name="cash_authno"     value=""/>
				    <input type="hidden" name="cash_tr_code"    value=""/>
				    <input type="hidden" name="cash_id_info"    value=""/>

					<!-- 2012년 8월 18일 정자상거래법 개정 관련 설정 부분 -->
					<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131)  -->
					<input type="hidden" name="good_expr" value="0">

					<!-- 가맹점에서 관리하는 고객 아이디 설정을 해야 합니다.(필수 설정) -->
					<input type="hidden" name="shop_user_id"    value=""/>
					<!-- 복지포인트 결제시 가맹점에 할당되어진 코드 값을 입력해야합니다.(필수 설정) -->
				    <input type="hidden" name="pt_memcorp_cd"   value=""/>

				    <!-- TMS 정보 -->
					<input type="hidden" name="rdcStockYn" id="rdcStockYn"	value=""/>
					<input type="hidden" name="bpStockYn" id="bpStockYn"	value=""/>
					<input type="hidden" name="tmsSchduleStr" id="tmsSchduleStr"	value=""/>
					<input type="hidden" name="centerSchduleStr" id="centerSchduleStr"	value=""/>
					<input type="hidden" name="amPmGbn" id="amPmGbn"	value=""/>
					<input type="hidden" name="city" id="city"	value=""/>
					<input type="hidden" name="county" id="county"	value=""/>
					<input type="hidden" name="dong" id="dong"	value=""/>
					<input type="hidden" name="dlvyCity" id="dlvyCity"	value=""/>
					<input type="hidden" name="dlvyCounty" id="dlvyCounty"	value=""/>
					<input type="hidden" name="dlvyDong" id="dlvyDong"	value=""/>
					<input type="hidden" name="bhfType" id="bhfType"	value=""/>
					<input type="hidden" name="basementYn" id="basementYn"	value=""/>
					<input type="hidden" name="alignYn" id="alignYn"	value=""/>
					<input type="hidden" name="instTm" id="instTm"	value=""/>
					<input type="hidden" name="orgzCd" id="orgzCd"	value=""/>
					<input type="hidden" name="rentalShopYn" id="rentalShopYn"	value=""/>
					<input type="hidden" name="optPlcNo"  id="optPlcNo"	 value=""/>
</form>
				<!--// 알뜰, 표준, 무한, 슈퍼, 자유 -->



				<!-- ARS인증 추가 -->
				<form name="ars_info" method="post">
				<table id="input_val">
					<tr>
						<td>
							<input type="hidden" name="SECR_KEY" id="SECR_KEY" value="jj0V4mXT1U4qeqx5CFAL"/> <!--  jj0V4mXT1U4qeqx5CFAL -->
							<input type="hidden" name="TR_CD" id="TR_CD" value="2300"/>
							<input type="hidden" name="ORG_CD" id="ORG_CD" value="20018"/>
							<input type="hidden" name="DATE" id="DATE" value=""/>
							<input type="hidden" name="PHONE" id="PHONE" value=""/>
							<input type="hidden" name="AUTH_NO" id="AUTH_NO" value="00"/>
							<input type="hidden" name="AUTH_INQUERY" id="AUTH_INQUERY" value=""/>
							<input type="hidden" name="REC_INQUERY" value=""/> <!-- 미사용 -->
							<input type="hidden" name="FILE_SAVE_YN" value="N"/> <!-- 미사용 -->
							<input type="hidden" name="FILE_NM" value=""/> <!-- 미사용 -->
							<input type="hidden" name="CUST_NM" id="CUST_NM" value=""/>
							<input type="hidden" name="BANK_CD" id="BANK_CD" value=""/>
							<input type="hidden" name="ACCT_NO" id="ACCT_NO" value=""/>
							<input type="hidden" name="BIRTH_DAY" id="BIRTH_DAY" value=""/>
							<input type="hidden" name="BUSL_NO" id="BUSL_NO" value=""/>
							<input type="hidden" name="CUST_TP" id="CUST_TP" value=""/>
							<input type="hidden" name="BANK_NM" id="BANK_NM" value=""/>
						</td>
					</tr>
				</table>

				<div id="tot_time"></div>
				<div id="rtn"></div>
				<div id="s_source"></div>
				<div id="source"></div>
				<div id="ars_success" style="font-size:12px">
					<input type="hidden" id="ars_succ_yn" name="ars_succ_yn" value="0"/>
				</div>

				</form>


	<!-- 전문점 찾기 -->
	<div class="fullPopup md-modal-3 shop-popup md-effect-1 md-close" id="modal-Shop">
		<div class="popContents popup-dark shop-search">
			<a onclick="javascrip:fn_popupClose('modal-Shop');" class="layPopClose md-close"></a>
		    <header>
		    	<h2>전문점 찾기</h2>
		    </header>

		    <!--contents-->
		    <!-- MAP -->
		    <!-- 미구현 구역 MEPARK -->
		    <div id="shop-map" class="popup-map">
		    	<div class="shop-search-single" id="storeInfo" style="display:none;">

				</div>
		      	<div class="popup-map-ui">
		        	<button type="button" class="btn-position">현재위치</button>
		        	<button type="button" class="btn-map-list change-list"><span></span><b>목록</b></button>
		      	</div>
		      	<div id="mapDiv" style="width: 100%; height: 100%;"></div>
			</div>
		    <!-- //MAP -->

		    <!-- LIST -->
		    <div id="shop-list" class="popup-contents-nobottom" style="display: none;">
		    	<div class="mapInfoBox custom-position">
		        	<div class="mapInfoTop">
		          		<!-- 찾기 검색 -->
		          		<div class="search-area-wrap inset-m">
		            		<div class="layout-c">
		              			<div class="layout-r inline-m">
		                			<select class="inline border-none" title="시/도 선택" onchange="selectSiGunGu();" id="sido">
		                  				<option value="">시/도 선택</option>
		                  				<c:forEach var="list" items="${selectSiDoList}" varStatus="status">
	                                    	<option value="${list.cdNm }">${list.cdNm }</option>
	                                	</c:forEach>
		                			</select>
		                			<select class="inline border-none" title="시/군/구 선택" id="sigungu">
			                        	<option value="">시/군/구 선택</option>
		                			</select>
		              			</div>
		              			<input type="text" name="meajang" class="pl-0 trans-bg" id="meajang" title="매장명 입력란" placeholder="매장명을 입력해보세요">
		              			<input type="hidden" id="meajangCd">
		            		</div>
		            		<button type="button" class="go-view full-width inset-s">렌탈 전문점 한눈에 보기</button>
		          		</div>
		          		<!-- 찾기 검색 -->

		          		<button type="button" class="search-shop" onclick="selectStore(1); return false;"><span></span>전문점 찾기</button>

		          		<div class="count-box utility layout-r pl-m pr-m">
		            		<div class="utility-result-total pt-s pb-s">
		              			<span>total</span>
		              			<span class="totalCnt" id="storeListCnt"></span>
		            		</div>
		            		<div class="utility-result-map pt-s pb-s">
		              			<button type="button" class="change-map pr-0"><span></span>지도</button>
		            		</div>
		          		</div>
		        	</div>
		      	</div>
		      	<div>
		        	<div class="shop-search-result">
		          		<ul id="storeList"></ul>
	       			</div>
	       			<div class="pagingFooter">
                     	<div class="bg" id="pagingMap" style="display:none;"></div>
                    </div>
	     		</div>
	   		</div>
	   		<!-- LIST -->
	 		</div>
	</div>
	<!-- //전문점 찾기 -->

	<!-- Popup Group -->
    <!-- ######################################### -->
    <div class="popupWrap md-modal md-effect-1 md-close" id="tireSizeTip1" onclick="fn_Tipclose()" style="z-index: 5000; border-radius: 20px;">
       <div class="popContents popup-tip">
           <a href="#" class="layPopClose md-close js-customMdBgClose" onclick="fn_Tipclose()"></a>
           <header>
               <div class="popup-tip-tag">Tip!</div>
               <h2>장착 서비스 이용가이드</h2>
           </header>

            <div class="content">
				<div class="tipCon">
					<h3>방문장착 서비스</h3>
						<p>차량키를 받지 않고 차량 장소(위치)차량번호만 알려주면 원하는 시간대에 타이어 교체 서비스<br>(에어서스펜션 차량은 방문장착 서비스가 어렵습니다.)</p>
					</div>

					<!-- <div class="tipCon">
						<h3>픽업&amp;딜리버리 서비스</h3>
						<p>방문장착 서비스가 불가한 현장이거나 차량 이동이 필요한 경우 픽업 후 다시 딜리버리 해주는 서비스</p>
					</div> -->

					<div class="tipCon">
						<h3>전문점 장착 서비스</h3>
						<p>편하신 시간에 가까운 전문점에 방문해서 받는 서비스</p>
					</div>

					<div class="tipCon">
						<h3>현재 O2O 장착 서비스 가능 지역</h3>
						<p>더 많은 고객들의 편의를 위해 서비스 권역을 확대 중에 있습니다. 많은 관심 부탁 드립니다.</p>
					</div>

					<!-- 서비스 가능 지역 -->
					<div class="serviceAvail">
						<p><span class="storeAv">서울시</span></p>
	                    <p><span class="storeAv">경기도</span></p>
	                    <p><span class="storeAv">인천시</span></p>
	                    <p><span class="storeAv">부산시</span></p>
	                    <p><span class="storeAv">대구시</span></p>
	                    <p><span class="storeAv">대전시</span></p>
	                    <p><span class="storeAv">광주시</span></p>
	                    <p><span class="storeAv">울산시</span></p>
	                    <p><span class="storeAv">세종시</span></p>
	                    <p><span class="storeAv">거제시</span></p>
	                    <p><span class="storeAv">경산시</span></p>
	                    <p><span class="storeAv">경주시</span></p>
	                    <p><span class="storeAv">계룡시</span></p>
	                    <p><span class="storeAv">공주시</span></p>
	                    <p><span class="storeAv">광양시</span></p>
	                    <p><span class="storeAv">구미시</span></p>
	                    <p><span class="storeAv">김제시</span></p>
	                    <p><span class="storeAv">김천시</span></p>
	                    <p><span class="storeAv">김해시</span></p>
	                    <p><span class="storeAv">나주시</span></p>
	                    <p><span class="storeAv">논산시</span></p>
	                    <p><span class="storeAv">당진시</span></p>
	                    <p><span class="storeAv">밀양시</span></p>
	                    <p><span class="storeAv">사천시</span></p>
	                    <p><span class="storeAv">상주시</span></p>
	                    <p><span class="storeAv">서산시</span></p>
	                    <p><span class="storeAv">순천시</span></p>
	                    <p><span class="storeAv">아산시</span></p>
	                    <p><span class="storeAv">양산시</span></p>
	                    <p><span class="storeAv">여수시</span></p>
	                    <p><span class="storeAv">영천시</span></p>
	                    <p><span class="storeAv">원주시</span></p>
	                    <p><span class="storeAv">익산시</span></p>
	                    <p><span class="storeAv">전주시</span></p>
	                    <p><span class="storeAv">정읍시</span></p>
	                    <p><span class="storeAv">제천시</span></p>
	                    <p><span class="storeAv">진주시</span></p>
	                    <p><span class="storeAv">창원시</span></p>
	                    <p><span class="storeAv">천안시</span></p>
	                    <p><span class="storeAv">청주시</span></p>
	                    <p><span class="storeAv">춘천시</span></p>
	                    <p><span class="storeAv">충주시</span></p>
	                    <p><span class="storeAv">통영시</span></p>
	                    <p><span class="storeAv">포항시</span></p>
	                    <p><span class="storeAv">고령군</span></p>
	                    <p><span class="storeAv">고성군</span></p>
	                    <p><span class="storeAv">괴산군</span></p>
	                    <p><span class="storeAv">군위군</span></p>
	                    <p><span class="storeAv">담양군</span></p>
	                    <p><span class="storeAv">보은군</span></p>
	                    <p><span class="storeAv">산청군</span></p>
	                    <p><span class="storeAv">성주군</span></p>
	                    <p><span class="storeAv">영동군</span></p>
	                    <p><span class="storeAv">영암군</span></p>
	                    <p><span class="storeAv">예산군</span></p>
	                    <p><span class="storeAv">옥천군</span></p>
	                    <p><span class="storeAv">완주군</span></p>
	                    <p><span class="storeAv">음성군</span></p>
	                    <p><span class="storeAv">의령군</span></p>
	                    <p><span class="storeAv">임실군</span></p>
	                    <p><span class="storeAv">장성군</span></p>
	                    <p><span class="storeAv">장흥군</span></p>
	                    <p><span class="storeAv">증평군</span></p>
	                    <p><span class="storeAv">진안군</span></p>
	                    <p><span class="storeAv">창녕군</span></p>
	                    <p><span class="storeAv">청도군</span></p>
	                    <p><span class="storeAv">칠곡군</span></p>
	                    <p><span class="storeAv">태안군</span></p>
	                    <p><span class="storeAv">하동군</span></p>
	                    <p><span class="storeAv">함안군</span></p>
	                    <p><span class="storeAv">홍성군</span></p>
	                    <p><span class="storeAv">화순군</span></p>
	                    <p><span class="storeAv">화천구</span></p>
	                    <p><span class="storeAv">횡성군</span></p>
					</div>
					<!-- 서비스 가능 지역 -->
               </div>
       </div>
   </div>

    <div class="fullPopup md-modal-3 md-effect-1 md-close" id="modalAgencyDetl">
      <div class="popContents order-basket">
        <a href="#;" onclick="javascript:fn_popupClose('modalAgencyDetl');" class="layPopClose md-close"></a>

        <header class="title" id="agencyHeader">
        </header>

        <!--contents-->
        <div class="popup-contents-nobottom">
          <div class="inset-ml">
			<div class="submit layout-c mb-m border-bottom">
              <p class="black">주소</p>
              <p class="pt-s addressView" id="agencyAddr"></p>
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
              <p class="pt-s pb-s pInfo" id="agencyOpt2"></p>
            </div>

            <div class="submit layout-c border-bottom">
              <p class="black">밸런스</p>
              <p class="pt-s pb-s" id="agencyOpt3"></p>
            </div>

            <p class="desc small font-gray po_m10">
              ※ 수입차 및 대형 차량의 경우 고급형 장비가 있는 곳에서 교체하시기 바랍니다.
            </p>

            <div class="mapView" style="height:200px" id="mapDivPopup">

            </div>

            <!-- slider -->
            <div class="store" >
	            <!-- <div class="swiper-store" id="agencyGall"> -->
	            <div id="agencyGall">
	            </div>
          	</div>
			 <!-- //slider -->
          </div>
        </div>
            <!--contents-->
      </div>
    </div>

	<form name="jusoFrm" id="jusoFrm" method="post" >
		<input type="hidden" name="currentPage" id="currentPage1" value="1"/>
		<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
		<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
		<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
		<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
		<input type="hidden" name="keyword" id="keyword" />
	</form>

	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>

<script type="text/javascript">
    history.go(1); //뒤로가기 방지

</script>

<script type="text/javascript">

var mountCheck = "10";	//현재 선택 된 장착서비스 유형
var mountCheck1 = "";	//현재 선택 된 장착서비스 유형
var jusoGbn = "";
var moveDate = "present";//present(현재),next(다음달)
var myLat = 37.57001757231217; //나의 위치 위도 (기본 위치)
var myLon = 126.827499331455; //나의 위치 경도 (기본 위치)
var savedPositions = [];
var alignServiceYn = "N";
var resultDataBestObj = "";		//TMS2
var getMountTime = "";			//TMS2

//지도관련
var fstYn = "Y";
var selectedMarker = null; // 마커 변경을 위해
var markerInfo = new Array();

//Pop팝업용 지도관련
var positionsPop = [];
var selectedMarkerPop = null; // 마커 변경을 위해
var markerInfoPop = new Array();

var ordAreaList = [];
<c:forEach var="obj" items="${ordAreaList}">
    //ordAreaList.push({"cmCd":"${obj.cmCd}","cmmCd1":"${obj.cmCdNm}","cmmCd2":"${obj.refCd1}"});
    <c:choose>
    	<c:when test="${obj.refCd1 ne null }" >
			     ordAreaList.push({"cmCd":"${obj.cmCd}","cmCdNm":"${obj.cmCdNm} ${obj.refCd1}"});
		    </c:when>
		    <c:otherwise>
			     ordAreaList.push({"cmCd":"${obj.cmCd}","cmCdNm":"${obj.cmCdNm}"});
		    </c:otherwise>
	    </c:choose>
</c:forEach>
ordAreaList.push({"cmCd":"64","cmCdNm":"대구광역시"});
ordAreaList.push({"cmCd":"65","cmCdNm":"울산광역시"});

//전문점 찾기 팝업 > 렌탈 전문점 한눈에 보기
$(document).on("click",".go-view",function () {
	resetSelectArea();
	selectStore(1);
});

//전문점 찾기 팝업 > 시도/시군구 초기화 및 전지역 검색
function resetSelectArea() {
	$("#sido").val("");
	selectSiGunGu();
	$("#meajang").val("");
	$("#meajangCd").val("");
	//기존 마커를 지운다.
	for(var j = 0; j < markerInfo.length; j++){
		markerInfo[j].setMap(null);
	}
	//기존 목록 지운다.
	$("#storeList").html("");
	$("#pageNo").val(0);
	$("#storeListCnt").html(0);
	$("#storeInfo").css("display","none");
	$("#storeInfo").html("");
	$("#pagingMap").html("");
	
}

//주소 선택 팝업
function selectJusoPop(gbn){
	$("#totalCount").text("");
	$("#jusoList").html("");
	$("#paging").html("");
	$("#jusoTxt").val("");
	$("#modal-Addr").addClass("md-show");

	jusoGbn = gbn;
}

//우편 번호 검색 - enterKey
function enterSchKey() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {
		event.keyCode = 0;

		selectJuso('1');
	}
}

var pageAddr = "";
var mapTargetDiv;
var agencyNm;

function callMap(gbn) {
	$("#modal-Shop").addClass("md-show");
	// 기존 검색 지역 초기화 - 전문점찾기 팝업 닫은 후 기존 검색지역 초기화 되지 않아 팝업할때 초기화 되도록 추가
	resetSelectArea();
	//$("#storeInfo").hide();

	//if(gbn == "3")
	//	selectStore2($("#meajang").val(), "1");

	//현재 내 위치 또는 고정 좌표로 호출
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if(navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	myLat = position.coords.latitude, // 위도
	    	myLon = position.coords.longitude; // 경도
		});
	}

	/*
	var positions = [];
	var obj = {
        			title	: "",
        			addr 	: "",
        			lat		: myLat,
        			lon		: myLon,
        			};
	positions.push(obj);
	mapTargetDiv = "mapDiv";
	mapDraw(myLon , myLat , "" , positions, "mapDiv");
	*/
	
	//지도는 최초에 한번만 그려줌. 안그럼 팝업 띄울때마다 지도 겹쳐짐
	if(fstYn == "Y"){
		var mapContainer = document.getElementById('mapDiv'), // 지도를 표시할 div
	    mapOption = {
	        center: new daum.maps.LatLng(myLat, myLon), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
		//마우스 휠 움직일 때 이전 맵이 잔상으로 남는 오류 때문에 맵 처음 한번만 그려야함
	    map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    fstYn = "N";
	} else {
		map.setLevel('9');
	}
	//지도 띄우자마자 전문점 전체 목록 뿌리기
    selectStore(1);
	$(".change-list").click();	//지도 최초 진입 또는 재진입시 무조건 목록으로 보기
    
	//나의 위치 근처 렌탈 전문점 가져오기
	//getRentStore(myLat, myLon);

}

var map = new Object();
var marker = new Object();
//지도 그리기
function mapDraw(lon , lat , bhfNm , positions, mapId){
	var agencyLat 	= lat; 	//대리점의 위도
	var agencyLon 	= lon; 	//대리점의 경도
	var agencyBhfNm	= bhfNm; 	//대리점의 경도
	
   	// 지도의 현재 영역을 얻어옵니다
    //var bounds = map.getBounds();

	//기존 마커를 지운다.
	for(var j = 0; j < markerInfo.length; j++){
		markerInfo[j].setMap(null);
	}
	
    // 마커를 생성합니다
	var imageSrc = "/img/common/icon_pin.png";
    var imageSize = new daum.maps.Size(50, 50);

    //marker.setMap(null);	//이거 안먹음. 조회 할때마다 핀 쌓임.
    for (var i = 0; i < positions.length; i ++) {
   		/*
    	if(i == (positions.length-1)) {
       		imageSrc = "/img/common/map_ico_03.png";
       		imageSize = new daum.maps.Size(40, 50);
       	} else {
       		imageSrc = "/img/common/icon_pin.png";
       		imageSize = new daum.maps.Size(50, 50);
       	}
   		*/

   		marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : new daum.maps.MarkerImage(imageSrc, imageSize), // 마커 이미지
            clickable: true
        });
        markerInfo[i] = marker;
   		//marker.setMap(map);
   		// LatLngBounds 객체에 좌표를 추가합니다
   	    //bounds.extend(new daum.maps.LatLng(positions[i].lat, positions[i].lon));

       	//if(i != (positions.length-1)) {
       		infoWindow(marker, positions[i].title, positions[i].agencyCd);
       	//}
    }
   	var mapCenter = new daum.maps.LatLng(agencyLat, agencyLon);
   	map.panTo(mapCenter);

    //moveStoreCenter(positions[0].lat, positions[0].lon);

    //map.relayout();
	//지도 리사이즈
	//지도 영역 리사이즈
    /* $("#mapDiv").height("800px");
    $("#mapDiv").width("920px");

    $("#map").addClass("md-show"); */
    //infoWindow(marker, agencyBhfNm);
}

function infoWindow(marker, agencyBhfNm, agencyCd){
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:2px;"><span style="font-weight:bold;">영업점명 </span> : '+agencyBhfNm+'</div>'
    				,iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
    	// 마커 위에 인포윈도우를 표시합니다
        //$("#meajangCd").val(agencyCd);
		$(".shop-search-single").attr("style","display:'';");
        selectStore2(agencyCd, "1");
		var normalImage = new daum.maps.MarkerImage(
        		'/img/common/icon_pin.png',
        		new daum.maps.Size(50, 50));
		var markerImage = new daum.maps.MarkerImage(
        		'/img/common/map_ico_03.png',
        		new daum.maps.Size(40, 50));
        if (!selectedMarker || selectedMarker !== marker) {
            // 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경하고
            if(!!selectedMarker) {
            	selectedMarker.setImage(normalImage);
            }
            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(markerImage);
        } 
        selectedMarker = marker;
        map.setLevel('5');
        var moveLatLon = new daum.maps.LatLng(marker.getPosition().getLat(), marker.getPosition().getLng());
    	map.panTo(moveLatLon);
    });
	selectedMarker = null;

}

//팝업 지도 그리기
function mapDrawPop(lon , lat , bhfNm , positionsPop, mapId){
	var agencyLatPop 	= lat; 	//대리점의 위도
	var agencyLonPop 	= lon; 	//대리점의 경도
	var agencyBhfNmPop	= bhfNm;

	var mapContainerPop = document.getElementById(mapId), // 지도를 표시할 div
	mapOptionPop = {
	    center: new daum.maps.LatLng(agencyLatPop, agencyLonPop), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};
	mapPop = new daum.maps.Map(mapContainerPop, mapOptionPop); // 지도를 생성합니다
	
  // 마커를 생성합니다
	var imageSrc = "/img/common/icon_pin.png";
	if(positionsPop[0].flag == 'one') {
		imageSrc = "/img/common/map_ico_03.png";
	}
	
	var imageSize = new daum.maps.Size(50, 50);
	for (var i = 0; i < positionsPop.length; i ++) {
		var markerPop = new kakao.maps.Marker({
		    map: mapPop, // 마커를 표시할 지도
		    position: new daum.maps.LatLng(positionsPop[i].lat, positionsPop[i].lon), // 마커를 표시할 위치
		    title : positionsPop[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    image : new daum.maps.MarkerImage(imageSrc, imageSize) // 마커 이미지
			,clickable: true
		});
		markerInfoPop[i] = markerPop;
		infoWindowPop(markerPop, positionsPop[i].title, positionsPop[i].agencyCd);
	}

}

function infoWindowPop(markerPop, agencyBhfNm, agency_cd){
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
  var iwContent = '<div style="padding:2px;"><span style="font-weight:bold;">영업점명 </span> : '+agencyBhfNm+'</div>'
  				,iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	// 마커에 클릭이벤트를 등록합니다
	if(agencyBhfNm!=""){
  	daum.maps.event.addListener(markerPop, 'click', function() {
	        // 마커 위에 인포윈도우를 표시합니다
			//$("#meajang").val(agencyBhfNm);
			//parent.setRentalInf(city, street, agency_nm, addr3, agency_cd, salesGroup, salesOffice, tel_no, pos_cd);
			var normalImage = new kakao.maps.MarkerImage(
      		'/img/common/icon_pin.png',
      		new kakao.maps.Size(50, 50));
			var markerImage = new kakao.maps.MarkerImage(
      		'/img/common/map_ico_03.png',
      		new kakao.maps.Size(40, 50));

          if (!selectedMarkerPop || selectedMarkerPop !== markerPop) {
              // 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경하고
              if(!!selectedMarkerPop) {
              	selectedMarkerPop.setImage(normalImage);
              }
              // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
              markerPop.setImage(markerImage);
          } 
          // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
          selectedMarkerPop = markerPop;
          mapPop.setLevel('5');
          var moveLatLon = new kakao.maps.LatLng(markerPop.getPosition().getLat(), markerPop.getPosition().getLng());
          mapPop.panTo(moveLatLon);
  	});
	}
	selectedMarkerPop = null;
}

//주소로 거점 재고 체크
//방문 ,픽업
var pageAddr = "";
var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수

function selectStore(pageNo){
	var sido = $("#sido").val();
	var meajang = $("#meajang").val();
	/*
	if(meajang == "" && sido == "") {
		alert("시도 정보 또는 매장명을 입력 하세요.");
		return false;
	}
	*/

	ComUtil.loading();

	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo, orderType : "A"};
	var positions = [];

	$.ajax({
        type: "post",
        url: "/order/rentalList",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "-1") {
        		ComUtil.alert(data.rtnMsg);
        		return;
        	}
    		var list = data.rtnList;
        	var listAll = data.listAll;
    		if(list.length == 0){
    			if($("#meajang").val() != ""){
	        		ComUtil.alert("검색조건에 해당하는 매장이 없습니다.");
	        		return;
    			} else {
	        		ComUtil.alert("현재 선택하신 지역에 장착점이 없습니다.");
	        		return;
    			}
    		}
        	for(var i=0; i<listAll.length; i++) {
	            var obj = {
	        			title	: listAll[i].agencyNm,
	        			addr 	: listAll[i].city + " " +listAll[i].street,
	        			lat		: listAll[i].posX,
	        			lon		: listAll[i].posY,
	        			agencyCd	: listAll[i].agencyCd
	        			};
	
				positions.push(obj);
        	}
    		var html = "";
    		var totRowNum = 0;
    		if(list.length > 0 ) {
	        	//페이지용
	    		if(pageNo == '1') {
					$("#pageNo").val(1);
	    		} else {
	    			var nextPageNo = Number($("#pageNo").val()) + 1;
	    			$("#pageNo").val(nextPageNo);
	    		}
	    		totRowNum = (Number($("#pageNo").val())-1) * 5;

	    		for(var i=0; i<list.length; i++) {
	    			html += "<li>";
	    			html += "	<div class='shop-search-single'>";
	    			html += "		<div class='layout-r'>";
	    			html += "			<div class='shop-content-box layout-c'>";
	    			html += "				<ul class='mb-m'>";
					if(list[i].reviewCnt > 0){
		    			html += "        		<li id='nmClick' data-num='" + (i+totRowNum) + "' data-lon='" + list[i].posY + "' data-lat='" + list[i].posX +"' data-bpcd='" + list[i].agencyCd + "'><b>"+list[i].agencyNm+" </b><img src='/img/product/map_star.png'/>"+list[i].reviewGrdPt+"점("+list[i].reviewCnt+")</li>";
					} else {
		    			html += "        		<li id='nmClick' data-num='" + (i+totRowNum) + "' data-lon='" + list[i].posY + "' data-lat='" + list[i].posX +"' data-bpcd='" + list[i].agencyCd + "'><b>"+list[i].agencyNm+"</b></li>";
					}
	    			html += "					<li>" + list[i].city + " " +list[i].street + "</li>";
	    			if(list[i].agencyCd == "114883") {
			    		/* html += "        <li><b>수입차 경정비 가능/[드라이브스루 가능]</b></li>"; */
			    		html += "        <li><b>[드라이브스루 가능]</b></li>";
		    		} else {
		    			/* html += "        <li><b>수입차 경정비 가능</b></li>"; */
		    			/* html += "        <li><b>경정비 가능</b></li>"; */
		    		}
	    			html += "				</ul>";
	    			html += "				<div class='layout-r'>";
	    			html += "					<div class='shop-state-icon layout-r inline inline-s'>";
	    			html += "						<div class='state inline'>";
	    			html += "							<img src='../img/common/state_ico02.png' alt='타이어'>";
	    			html += "							<span>타이어</span>";
	    			html += "						</div>";
	    			if(list[i].chYn == "Y") {
		    			html += "					<div class='state inline'>";
		    			html += "	  					<img src='../img/common/state_ico01.png' alt='추천'>";
		    			html += "  						<span>추천</span>";
		    			html += "					</div>";
	    			}
	    			if(list[i].cwYn == "Y") {
	    				html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico05.png'  alt='세차'/>";
			    		html += "           			<span>세차</span>";
			    		html += "        			</div>";
	    			}
	    			if(list[i].fmYn == "Y") {
			    		html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico06.png'  alt='1급정비'/>";
			    		html += "           			<span>1급정비</span>";
			    		html += "        			</div>";
		    		}
		    		if(list[i].lmYn == "Y") {
			    		html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico03.png'  alt='경정비'/>";
			    		html += "           			<span>경정비</span>";
			    		html += "        			</div>";
		    		}
		    		if(list[i].seasonGbn == "02") {
			    		html += "        			<div class='state inline'>";
			    		html += "            			<img src='/img/common/state_ico04.png'  alt='겨울용'/>";
			    		html += "           	 		<span>겨울용</span>";
			    		html += "        			</div>";
		    		}
		    		html += "					</div>";
		    		html += "				</div>";
		    		html += "			</div>";
		    		html += "			<div class='shop-btn-box inline text-right align-bottom layout-c'>";
		    		html += "				<button type='button' class='md-close' onClick='fn_searchAgencyInfo(\""+list[i].agencyCd+"\");'><b>상세보기</b><span></span></button>";
		    		html += "				<button type='button' class='md-close' onClick='moveStore(\""+list[i].posX+"\", \"" + list[i].posY + "\", \""+list[i].agencyCd + "\", \""+ (i+totRowNum) + "\");'><b>이동하기</b><span></span></button>";
		    		html += "				<button type='button' class='md-close' onClick='storeTmsMap(\""+list[i].agencyCd+"\", \""+list[i].agencyNm+"\", \""+list[i].city + " " +list[i].street+"\", \""+list[i].salesGroup+"\", \""+list[i].salesOffice+"\" , \""+i+"\", \""+list[i].posCd+"\");'><b>선택하기</b><span></span></button>";
		    		html += "			</div>";
		    		html += "		</div>";
		    		html += "	</div>";
		    		html += "</li>";

	    		}
	    		if(pageNo == '1') {
					$("#storeList").html(html);
	    		} else {
	    			$("#storeList").append(html);
	    		}
				$("#storeListCnt").html(data.pageCommon.totalCount);

				var pageCommon = data.pageCommon;
				PageUtil.fnPageMakeMoreDisplay(data.pageCommon.totalCount, $("#pageNo").val() , $("#pagingMap") , "selectStore", 5);

				/*나의위치 제거. 조회내역 기준으로 핀 표기(24.7.1 권형태 선임)
				//지도 그리기 전 나의 위치 좌표를 맨마지막에 넣는다.
				//맨 마지막에 넣는 이유 : navigator 가 비동기이기 때문.
				var obj2 ={
						title	: "나의 위치",
		    			addr 	: "",
		    			lat		: myLat,
		    			lon		: myLon,
		    			agencyCd	: ""
				}
				positions.push(obj2);
				savedPositions = positions;//지도에서 이동하기에 사용하려고 전역으로 저장해둔다.
				*/
				//지도 그리기
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions, "mapDiv");
	        	$("#meajangCd").val("");
	        	$("#storeInfo").css("display","none"); //조회 또는 더보기 시 기존에 클릭한 상세보기 영역은 보이지않게.
	        	$("#storeInfo").html(""); //조회 또는 더보기 시 기존에 클릭한 상세보기는 지운다.
    		} else {
    			//$("#loadingWrap").hide();
    			html += "<li>조회된 전문점이 없습니다.</li>";
    			$("#storeList").html(html);
				$("#storeListCnt").html("0");
    		}
        },
        error: function(xhr,status,error){
        	document.body.style.overflow = 'none';
        },
        complete: function() {
        	ComUtil.unloading();
        }
    });
}

//전문점 조회 시 거점 정보 조회
function selectStore2(sAgencyCd , pageNo){
	/*
	if(ValidUtil.isEmpty($("#meajang").val()) && ValidUtil.isEmpty($("#sido").val())) {
		ComUtil.alert("매장명 또는 시/도 선택은 필수입니다.");
		return false;
	}
	*/

	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	//var sAgencyCd = $("#meajangCd").val();
	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo , agencyCd : sAgencyCd};

	ComUtil.loading();
	$.ajax({
        type: "post",
        url: "/order/rentalList",
        data: JSON.stringify(param),
        async:false,
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "-1") {
        		ComUtil.alert(data.rtnMsg);
        		return;
        	}
    		var list = data.rtnList;

    		var html = "";
    		if(list.length > 0 ) {
	        	//페이지용
            	var positions = [];
	    		//for(var i=0; i<list.length; i++) {

	    			html += "		<div class='layout-r'>";
	    			html += "			<div class='shop-content-box layout-c'>";
	    			html += "				<ul class='mb-m'>";
	    			html += "					<li><b>" + list[0].agencyNm + "</b></li>";
	    			html += "					<li>" + list[0].city + " " +list[0].street + "</li>";
	    			/* html += "					<li><b>수입차 경정비 가능</b></li>"; */
	    			html += "				</ul>";
	    			html += "				<div class='layout-r'>";
	    			html += "					<div class='shop-state-icon layout-r inline inline-s'>";
	    			html += "						<div class='state inline'>";
	    			html += "							<img src='../img/common/state_ico02.png' alt='타이어'>";
	    			html += "							<span>타이어</span>";
	    			html += "						</div>";
	    			if(list[0].chYn == "Y") {
		    			html += "					<div class='state inline'>";
		    			html += "	  					<img src='../img/common/state_ico01.png' alt='추천'>";
		    			html += "  						<span>추천</span>";
		    			html += "					</div>";
	    			}
	    			if(list[0].cwYn == "Y") {
	    				html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico05.png'  alt='세차'/>";
			    		html += "           			<span>세차</span>";
			    		html += "        			</div>";
	    			}
	    			if(list[0].fmYn == "Y") {
			    		html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico05.png'  alt='1급정비'/>";
			    		html += "           			<span>1급정비</span>";
			    		html += "        			</div>";
		    		}
		    		if(list[0].lmYn == "Y") {
			    		html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico03.png'  alt='경정비'/>";
			    		html += "           			<span>경정비</span>";
			    		html += "        			</div>";
		    		}
		    		if(list[0].seasonGbn == "02") {
			    		html += "        			<div class='state inline'>";
			    		html += "            			<img src='/img/common/state_ico04.png'  alt='겨울용'/>";
			    		html += "           	 		<span>겨울용</span>";
			    		html += "        			</div>";
		    		}
		    		html += "					</div>";
		    		html += "				</div>";
		    		html += "			</div>";
		    		html += "			<div class='shop-btn-box inline text-right align-bottom layout-c'>";
		    		html += "				<button type='button' class='md-close' onClick='fn_searchAgencyInfo(\""+list[0].agencyCd+"\");'><b>상세보기</b><span></span></button>";
		    		html += "				<button type='button' class='md-close' onClick='storeTmsMap(\""+list[0].agencyCd+"\", \""+list[0].agencyNm+"\", \""+list[0].city + " " +list[0].street+"\", \""+list[0].salesGroup+"\", \""+list[0].salesOffice+"\" , \""+0+"\", \""+list[0].posCd+"\" );'><b>선택하기</b><span></span></button>";
		    		html += "			</div>";
		    		html += "		</div>";


	                var obj = {
		        			title	: list[0].agencyNm,
		        			addr 	: list[0].city + " " +list[0].street,
		        			lat		: list[0].posX,
		        			lon		: list[0].posY,
		        			agencyCd	: list[0].agencyCd
		        			};

	    			positions.push(obj);
	    		//}
				$("#storeInfo").html(html);
				//$("#storeListCnt").html(list.length);

				//var pageCommon = data.pageCommon;
				//PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//내 위치 표시
				/*
				var obj2 ={
						title	: "나의 위치",
		    			addr 	: "",
		    			lat		: myLat,
		    			lon		: myLon,
		    			agencyCd	: ""
				}

				positions.push(obj2);
				savedPositions = positions;//지도에서 이동하기에 사용하려고 전역으로 저장해둔다.
				*/
				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	//mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions, "mapDiv");
	        	$("#meajangCd").val("");
    		} else {
    			/* html += "<li>조회된 전문점이 없습니다.</li>";
    			$("#storeList").html(html);
				$("#storeListCnt").html("0"); */

				//$("#loadingWrap").hide();
    		}
        },
        error: function(xhr,status,error){
        	//$("#loadingWrap").hide();
        	//ComUtil.alert(support0014);
        	document.body.style.overflow = 'none';
        },
        complete: function() {
        	ComUtil.unloading();
        }
    });
}

//리스트 중 거점 클릭 시 지도 셋팅(핀 이동, 센터 이동)
function mapSetMove(mapLat, mapLon, mapNum){
	var lon= mapLon;
	var lat= mapLat;
	var numImg= mapNum;
	
	var moveLatLon = new daum.maps.LatLng(lat, lon);
	
	var normalImage = new daum.maps.MarkerImage(
		'/img/common/icon_pin.png',
		new daum.maps.Size(50, 50));
	var markerImage = new daum.maps.MarkerImage(
		'/img/common/map_ico_03.png',
		new daum.maps.Size(40, 50));
	
	if (!selectedMarker || selectedMarker !== markerInfo[numImg]) {
		// 클릭된 마커 객체가 null이 아니면 클릭된 마커의 이미지를 기본 이미지로 변경하고
		if(!!selectedMarker) {
			selectedMarker.setImage(normalImage);
		}
		// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
		markerInfo[numImg].setImage(markerImage);
	} 
	// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
	selectedMarker = markerInfo[numImg];

	// 마커가 지도 위에 표시되도록 설정합니다
	markerInfo[numImg].setMap(map);  
	// 지도 중심을 이동 시킵니다
	map.setLevel('5');
	map.panTo(moveLatLon);

}

function moveStore(agencyLat, agencyLon, agencyCd, mapNum) {
	//map.setCenter(new daum.maps.LatLng(agencyLat, agencyLon));
	//map.setLevel(5);
	//selectStore2(agencyCd, "1");
	//$("#storeInfo").hide();
	$(".change-map").click();
	$(".shop-search-single").attr("style","display:'';");
    selectStore2(agencyCd, "1");
    mapSetMove(agencyLat, agencyLon, mapNum);
}

function moveStoreCenter(agencyLat, agencyLon) {
	map.setCenter(new daum.maps.LatLng(agencyLat, agencyLon));
	map.setLevel(5);
}

//지도 리스트에서 선택 하기 버튼 클릭 이벤트
//조직코드 , 주소 , 우편 번호 , 상세 인덱스
/*
function storeFix(agencyCd , agencyNm , addr, salesGroup, salesOffice, idx, posCd) {
	console.log(agencyCd+  "/ " + agencyNm + "/" + addr)
	document.getElementById("insStoreName").value = agencyNm;
	document.getElementById("insStoreCd").value = agencyCd;
	document.getElementById("insStoreAddr").value = addr;
	document.getElementById("salesGroup").value   = salesGroup;
	document.getElementById("salesOffice").value  = salesOffice;
	document.getElementById("addrTxtJ").value  = addr;

	$("#inst1Poscd").val(posCd);
	$("#inst1Addr1").val(addr);
	$("#inst1Addr2").val(".");

	//조직 코드 세팅
	$("#orgzCd").val(agencyCd);

	//$(".layPopClose").click();
	$("#modal-Shop").removeClass("md-show");

	var today = new Date();
	var week = new Array("sun", "mon", "thu", "wen", "thu", "fri", "sat");

	//주문 가능일
	storechkDay = [];
	for(var k=0; k<15; k++) {
   		var setDt = new Date();

   		setDt.setDate(today.getDate() + k);

   		var dayNum = new Date(setDt).getDay();
	    var todayLabel = week[dayNum];

	    if(todayLabel == "sun" || todayLabel == "sat") {
	    	storechkDay.push(String(setDt.getFullYear()) + String(setDt.getMonth()+1) + String(setDt.getDate()));
	    }
	}

	//휴일목록
	storechkDay = [];
	<c:forEach var="hDayList" items="${hDayList}" varStatus="status">
		storechkDay.push("${hDayList.hDate}");
	</c:forEach>

	//달력 세팅
	$('#datepicker11').datepicker({
		//showOn: "button",
		//buttonImage: "/img/common/calendar.png",
		//buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		yearRange: 'c-0:c+2',
		minDate: '+3d',
		maxDate: '+13d',
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		beforeShowDay : function(day) {
			var m = day.getMonth() > 9 ? day.getMonth()+1 : "0"+(day.getMonth()+1);
		    var d = day.getDate() > 9 ? day.getDate() : "0"+day.getDate();
		    var y = day.getFullYear();

		  	//일요일
      		if(day.getDay() == 0) {
      			storechkDay.push(y+""+m+""+d);
      		}

		    for (i = 0; i < storechkDay.length; i++) {
		        if($.inArray(y+''+m+''+d , storechkDay) != -1) {
		            return [false];
		        }
		    }
		    return [true];
		},
		onSelect: function (date) {
		    var week = new Array("sun", "mon", "thu", "wen", "thu", "fri", "sat");
		    var today = new Date(date).getDay();
		    var todayLabel = week[today];

		   	var param = {};

		   	param["mountTime"] = todayLabel;
		  	param["mountCd"] = $("input[name='instCd']:checked").val();

		   	$.ajax({
		        type: "post",
		        url: "/order/selectSetTimeList",
		        data: JSON.stringify(param),
		        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		        success: function (data) {
		        	var orderTimeListHtml = "";
		        	for(var i=0; i<data.orderTimeList.length; i++) {
	      				orderTimeListHtml += "<option value="+data.orderTimeList[i].mountCd+">"+data.orderTimeList[i].mountTime +"</option>"
	      			}
		        	$("#mountTime").html(orderTimeListHtml);
		   			$("#mountTime").show();
		        },
		        error: function(xhr,status,error){
		        	console.log("error:",error);
		        }
		    });
		}
	});

	var param = {};
	var todayNum = today.getDay();

   	param["mountTime"] = week[todayNum];;
  	param["mountCd"] = $("input[name='instCd']:checked").val();

   	$.ajax({
        type: "post",
        url: "/order/selectSetTimeList",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	var orderTimeListHtml = "";
        	for(var i=0; i<data.orderTimeList.length; i++) {
  				orderTimeListHtml += "<option value="+data.orderTimeList[i].mountCd+">"+data.orderTimeList[i].mountTime +"</option>"
  			}
        	$("#mountTime").html(orderTimeListHtml);
   			$("#mountTime").show();
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
        }
    });

}
*/


//지도 리스트에서 선택 하기 버튼 클릭 이벤트
//조직코드 , 주소 , 우편 번호 , 상세 인덱스
function storeTmsMap(agencyCd , agencyNm , addr, salesGroup, salesOffice, idx , posCd) {
	console.log(agencyCd+  "/ " + agencyNm + "/" + addr)
	document.getElementById("insStoreName").value = agencyNm;
	document.getElementById("insStoreCd").value = agencyCd;
	document.getElementById("insStoreAddr").value = addr;
	document.getElementById("salesGroup").value   = salesGroup;
	document.getElementById("salesOffice").value  = salesOffice;
	document.getElementById("addrTxtJ").value  = addr;

	$("#inst1Poscd").val(posCd);
	$("#inst1Addr1").val(addr);
	$("#inst1Addr2").val(".");

	$("#mountAlertTxt").html("<span>선택하신 장착일시에 전문점으로 방문해주시기 바랍니다.</span>");

	ComUtil.loading();

	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("input[name='cntCd']").val().substring(1,2));
	});

	var param = {iplAddr : addr , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : "40" , mountDt : "" , mountTime : "" , pageNo : '1' , searchGbn : "store", o2oYn : "Y", pkLoca: "N", city: "", county: "", dong: "", orgzCd : "", bpCd: agencyCd};

	//yjw serverMode 제거(20220225)
	var o2oTmsStockTMS2 = "/order/o2oTmsStockTMS2";

	$.ajax({
        type: "post",
        url: o2oTmsStockTMS2,
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	ComUtil.unloading();
        	if(data.rtnCode == "-1") {
        		$("#mountAlertTxt").hide();
        		ComUtil.alert(data.rtnMsg);
        		return;
        	}

        	$("#rentalShopYn").val(data.rentalShopYn);
        	//렌탈 전문점이면
        	if(data.rentalShopYn == "Y") {
        		$(".amPmChk").hide();//오전오후 체크
        		$(".timePick").hide();//장착 희망일시 블럭

        		$("#pickUpAlign").hide();
     			$("#giveCpnPick").prop("checked", true);
        	}
        	//o2o 전문점이면
        	else {
        		$(".amPmChk").show();
        		$(".timePick").show();

        		//장착 가능 주소 일때 얼라인먼트 장착 여부 show/hide
				$("input[name='alignRd']").prop('checked', false);
	 	    	if(alignServiceYn == "Y") {
	     			$("#pickUpAlign").show();
	     			$("#alignSerReq").prop("checked", true);
	     		} else {
	     			$("#pickUpAlign").hide();
	     			$("#giveCpnPick").prop("checked", true);
	     		}
        	}
        	$("#bpStockYn").val(data.bpStockYn);
			$("#rdcStockYn").val(data.rdcStockYn);
    		$("#basementYn").val("N");

    		storeTmsFix(addr , ".", data.bpStockYn, data.rdcStockYn);

        },
        error: function(xhr,status,error){
        	ComUtil.unloading();
        	//alert(support0014);
        },
        complete:function() {
        	//$(".layPopClose").click();
        	$("#modal-Shop").removeClass("md-show");
        }
    });

	//$(".layPopClose").click();
}


//우편 번호 검색 - 검색 버튼 클릭
function selectJuso(pageNo) {
	if(pageNo != null){
		if(Number(pageNo)  == 0) {
			$("#currentPage1").val("1");
		} else {
			$("#currentPage1").val(pageNo);
		}
	}

	$("#keyword").val($("#jusoTxt").val());

	$.ajax({
		 url :"<%= AppContext.getString("zipcd.url") %>"
		,type:"post"
		,data:$("#jusoFrm").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			if(navigator.appName.indexOf("Microsoft") > -1){
				var xmlData = new ActiveXObject("Microsoft.XMLDOM");
				xmlData.loadXML(xmlStr.returnXml)
			}else{
				var xmlData = xmlStr.returnXml;
			}

			var errCode = $(xmlData).find("errorCode").text();
			var errDesc = $(xmlData).find("errorMessage").text();
			if(errCode != "0"){
				ComUtil.alert(errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlData);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	ComUtil.alert("에러발생");
	    }
	});
}


function makeList(xmlStr){
	var totCnt = Number($(xmlStr).find("totalCount").text());
	$("#totalCount").text(totCnt);

	var htmlStr = "";
	if(totCnt != 0){
		$(xmlStr).find("juso").each(function(){
			htmlStr += "<tr onClick=\"sendChildValue('"+$(this).find('zipNo').text()+"','"+$(this).find('bdMgtSn').text()+"','"+$(this).find('roadAddrPart1').text()+" "+$(this).find('roadAddrPart2').text()+"','"+$(this).find('jibunAddr').text()+"')\">";
			htmlStr += "	<td>";
			htmlStr += "		<div class='addDiv'>";
			htmlStr += "			<span class='roadName mb6'>도로명</span>";
			htmlStr += "			<span class='nomination'>지명</span>";
			htmlStr += "		</div>";
			htmlStr += "	</td>";
			htmlStr += "	<td>";
			htmlStr += "		<div class='address'>";
			htmlStr += "			<p>"+$(this).find('roadAddrPart1').text()+"</p>";
			htmlStr += "			<p>"+$(this).find('jibunAddr').text()+" </p>";
			htmlStr += "		</div>";
			htmlStr += "	</td>";
			htmlStr += "	<td class='tCenter'>";
			htmlStr += "		<p class='zipNum'>"+$(this).find('zipNo').text()+"</p>";
			htmlStr += "	</td>";
			htmlStr += "</tr>";
			htmlStr += "</tr>";
		});

	}else{
		htmlStr += "		<tr>"
		htmlStr += "			<td colspan='3'>검색결과가 없습니다.</td>"
		htmlStr += "		</tr>"
	}

	$("#jusoList").html(htmlStr);
	var totCnt = Number($(xmlStr).find("totalCount").text());
	$("#totalCount").text(totCnt);

	//paging
	PageUtil.fnPageMakeDisplay(totCnt, $("#currentPage").val() ,  $('#paging') , 'selectJuso', 4);
}

//상세 우편 번호
function sendChildValue(zipCode, bdMgtSn, load, jibun) {
	if(jusoGbn == "A") {
		$("#bldMngNo").val(bdMgtSn);
	}

	$("#popDetailAddr").val("");
	$("div[name='popAddr']").removeClass("md-show");
	$("#popZipCode").text(zipCode);
	$("#popLoadAddr").text(load);
	$("#popJibunAddr").text(jibun);
	$("div[name='popAddrDetail']").addClass("md-show");
}

//상세 주소 화면
function returnAddrInfo(cbData) {
	var gbn = jusoGbn;

	console.log("cbData.popLoadAddr : "+cbData.popLoadAddr);
	//방문 장착
	if(gbn == "B" || gbn == "P1" || gbn == "P2") {
		var mountCd = $("input[name='instCd']:checked").val();	//장착구분
		var pkLoca = "";
		var orgzCd = "";

		if(mountCd == "40"){
			pkLoca = "N";
			orgzCd = $("#orgzCd").val();
		} else {
			if(gbn == "B" || gbn == "P1") {
				pkLoca = cbData.pkLoca;	//차량주차위치
			}
		}

		if(mountCd != "40"){
			var rtnYn = false;
			var addr1 = cbData.popLoadAddr;
			$.each(ordAreaList , function(idx , obj){
				if(addr1.indexOf(obj.cmCdNm) > -1 ){
			    	rtnYn = true;
			    	return;
			    }
			});

			if(rtnYn){
				if(mountCd == "10"){
					$("#bangMunAlertTxt").hide();
					$("#addrOkB").show();
				} else if(mountCd == "20"){
					if(jusoGbn == "P1") {
						$("#addrOkP1").show();
						$("#PicAlertTxt").hide();
					}else if(jusoGbn == "P2") {
						$("#addrOkP2").show();
						$("#drvAlertTxt").hide();
					}
				}

				//장착 가능 주소 일때 얼라인먼트 장착 여부 show/hide
				$("input[name='alignRd']").prop('checked', false);
	 	    	if(alignServiceYn == "Y") {
	     			$("#pickUpAlign").show();
	     			if(mountCd == "10") {
	     				$("#giveCpnPick").prop("checked", true);
	     			} else {
	     				$("#alignSerReq").prop("checked", true);
	     			}
	     		} else {
	     			$("#pickUpAlign").hide();
	     			$("#giveCpnPick").prop("checked", true);
	     		}
			} else {
				if(mountCd == "10"){
					$("#bangMunAlertTxt").show();
					$("#addrOkB").hide();
					$("#addrTxtB").val("");
				} else if(mountCd == "20"){
					if(jusoGbn == "P1") {
						$("#PicAlertTxt").show();
						$("#addrOkP1").hide();
					}else if(jusoGbn == "P2") {
						$("#drvAlertTxt").show();
						$("#addrOkP2").hide();
					}

					$("#addrTxtP1").val("");
					$("#addrTxtP2").val("");
				}

				//$("#loadingWrap").hide();
				//$(".layPopClose").click();

				//장착 불가능 주소 일때 얼라인먼트 장착 여부 hide
				$("input[name='alignRd']").prop('checked', false);
     			$("#pickUpAlign").hide();
     			$("#giveCpnPick").prop("checked", true);

				return;

			}
		}

		//해당 지역 외 주문 불가
		/*
		if(
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("종로구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("중구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("용산구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("성동구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("광진구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("동대문구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("중랑구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("성북구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("강북구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("도봉구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("노원구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("은평구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("서대문구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("마포구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("양천구") < 0) &&

			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("강서구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("구로구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("영등포구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("금천구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("동작구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("관악구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("서초구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("강남구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("강서구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("송파구") < 0) &&
			(cbData.popLoadAddr.indexOf("서울") < 0 || cbData.popLoadAddr.indexOf("강동구") < 0) &&

			cbData.popLoadAddr.indexOf("수원시") < 0 &&
			cbData.popLoadAddr.indexOf("성남시") < 0 &&
			cbData.popLoadAddr.indexOf("용인시") < 0 &&
			cbData.popLoadAddr.indexOf("안양시") < 0 &&
			cbData.popLoadAddr.indexOf("안산시") < 0 &&
			cbData.popLoadAddr.indexOf("과천시") < 0 &&
			cbData.popLoadAddr.indexOf("광주시") < 0 &&
			cbData.popLoadAddr.indexOf("군포시") < 0 &&
			cbData.popLoadAddr.indexOf("부천시") < 0 &&
			cbData.popLoadAddr.indexOf("시흥시") < 0 &&
			cbData.popLoadAddr.indexOf("김포시") < 0 &&
			cbData.popLoadAddr.indexOf("안성시") < 0 &&
			cbData.popLoadAddr.indexOf("오산시") < 0 &&
			cbData.popLoadAddr.indexOf("의왕시") < 0 &&
			cbData.popLoadAddr.indexOf("이천시") < 0 &&
			cbData.popLoadAddr.indexOf("평택시") < 0 &&
			cbData.popLoadAddr.indexOf("하남시") < 0 &&
			cbData.popLoadAddr.indexOf("화성시") < 0 &&
			cbData.popLoadAddr.indexOf("여주시") < 0 &&
			cbData.popLoadAddr.indexOf("양평군") < 0 &&
			cbData.popLoadAddr.indexOf("고양시") < 0 &&
			cbData.popLoadAddr.indexOf("구리시") < 0 &&
			cbData.popLoadAddr.indexOf("남양주시") < 0 &&
			cbData.popLoadAddr.indexOf("동두천시") < 0 &&
			cbData.popLoadAddr.indexOf("양주시") < 0 &&
			cbData.popLoadAddr.indexOf("의정부시") < 0 &&
			cbData.popLoadAddr.indexOf("파주시") < 0 &&
			cbData.popLoadAddr.indexOf("포천시") < 0 &&
			cbData.popLoadAddr.indexOf("가평군") < 0 &&
			cbData.popLoadAddr.indexOf("연천군") < 0 &&
			cbData.popLoadAddr.indexOf("광명시") < 0 &&

			cbData.popLoadAddr.indexOf("인천광역시") < 0
		){
			if(mountCd == "10"){
				$("#bangMunAlertTxt").show();
				$("#addrOkB").hide();
			} else if(mountCd == "20"){
				if(jusoGbn == "P1") {
					$("#PicAlertTxt").show();
					$("#addrOkP1").hide();
				}else if(jusoGbn == "P2") {
					$("#drvAlertTxt").show();
					$("#addrOkP2").hide();
				}
			}

			//$("#loadingWrap").hide();
			//$(".layPopClose").click();

			return;
		} else {
			if(mountCd == "10"){
				$("#bangMunAlertTxt").hide();
				$("#addrOkB").show();
			} else if(mountCd == "20"){
				if(jusoGbn == "P1") {
					$("#addrOkP1").show();
					$("#PicAlertTxt").hide();
				}else if(jusoGbn == "P2") {
					$("#addrOkP2").show();
					$("#drvAlertTxt").hide();
				}
			}
		} */

		//재고 체크
		var mountDt = $("#datepicker11").val().replace(/-/gi, "");	//장착일
		var instTm  = $("#amArea span.on, #pmArea span.on").text().replace(":","");	//장착시간
	    //var instTm = $("#instTm").val().replace(/[^0-9]/g,"");

	    //itemCd 및 수량
		var itemCdArr = new Array();
		var itemCntArr = new Array();
		var city = cbData.popSiNm;
		var county = cbData.popSggNm;
		var dong = cbData.popEmdNm;

		$("ul[name='ordNoSn']").each(function(idx){
			itemCdArr.push($(this).attr("itemcd"));
			itemCntArr.push($("input[name='cntCd']").val().substring(1,2));
		});

		$("#itemCdArr").val(itemCdArr);
		$("#itemCntArr").val(itemCntArr);
		$("#city").val(city);
		$("#county").val(county);
		$("#dong").val(dong);

		if(mountCd == "10" || (mountCd == "20" && jusoGbn == "P1")) {
			$("#city").val(city);
			$("#county").val(county);
			$("#dong").val(dong);

			var param = {iplAddr : cbData.popLoadAddr , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : mountDt , mountTime : instTm , pageNo : '1' , searchGbn : "store", o2oYn : "N", pkLoca: pkLoca, city: city, county: county, dong: dong, orgzCd : orgzCd};

			//yjw serverMode 제거(20220225)
			var o2oTmsStockTMS2 = "/order/o2oTmsStockTMS2";

			ComUtil.loading();
			$.ajax({
		        type: "post",
		        url: o2oTmsStockTMS2,
		        data: JSON.stringify(param),
		        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		        success: function (data) {
		        	ComUtil.unloading();
		        	if(data.rtnCode == "-1") {
		        		ComUtil.alert(data.rtnMsg);
		        		return;
		        	}
		        	$("#bpStockYn").val(data.bpStockYn);
	    			$("#rdcStockYn").val(data.rdcStockYn);
	        		$("#basementYn").val(pkLoca);
		        	storeTmsFix(addr1 , addr2, data.bpStockYn, data.rdcStockYn);

		        },
		        error: function(xhr,status,error){
		        	//$("#loadingWrap").hide();
		        	ComUtil.unloading();
		        	//alert(support0014);
		        	document.body.style.overflow = 'none';
		        },
		        complete:function() {
		        	ComUtil.unloading();
		        }
		    });
		} else if(jusoGbn == "P2") {
			$("#dlvyCity").val(city);
			$("#dlvyCounty").val(county);
			$("#dlvyDong").val(dong);

			storeTmsFix(cbData.popLoadAddr , cbData.popDetailAddr, $("#bpStockYn").val(), $("#rdcStockYn").val());
		}
	}
	//주문자 주소
	else if(jusoGbn == "A"){
//		$("#addrTxt").val($("#popLoadAddr").text());
//		$("#addr1").val($("#popLoadAddr").text());
		$("#addrTxt").val(cbData.popLoadAddr + " " + cbData.popDetailAddr);
		$("#addr1").val(cbData.popLoadAddr);
		$("#addr2").val(cbData.popDetailAddr);
		$("#postNo").val(cbData.popZipCode);
	}

	//$(".layPopClose").click();
}

function storeTmsFix(addr1 , addr2, bpStockYn, rdcStockYn) {
	var gbn = jusoGbn;
	$('#datepicker_acdn').datepicker("destroy");

	if(jusoGbn != "P2") {
		//휴일목록
		storechkDay = [];
		<c:forEach var="hDayList" items="${hDayList}" varStatus="status">
			storechkDay.push("${hDayList.hDate}");
		</c:forEach>

		//거점 별 주문 가능일

		//달력 세팅
		//거점이 재고를 가지고 있을경우 : 오늘 , 오늘+1, 오늘+2
		//거점이 재고를 가지고 있지 않은 경우 + RDC 재고 있는경우(기존) : 오늘 + 3~ 오늘 + 13
		//거점 재고 없고, RDC 재고 없으면 : 메세지 문구 빨간색(위에서 이미 처리됨)

		//RDC 시작일을 정해준다. 일요일이 있으면 +1일을 더해준다.
		var bhfLastDay = fn_deleteRdcDt();
		var mDate = bpStockYn == "Y" ? '+0d': bhfLastDay;
		
		$('#datepicker_acdn').datepicker({
			showOn: "both",
			dateFormat: 'yy-mm-dd',
			yearRange: 'c-0:c+2',
			minDate: mDate,
			maxDate: '+20d',
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			beforeShowDay : function(day) {
				var m = day.getMonth()+1 > 9 ? day.getMonth()+1 : "0"+(day.getMonth()+1);
	      		var d = day.getDate() > 9 ? day.getDate() : "0"+day.getDate();
	      		var y = day.getFullYear();

	      		//일요일
	      		if(day.getDay() == 0) {
	      			storechkDay.push(y+""+m+""+d);
	      		}

	      	    //1013 휴무추가 2020-10-05
	      		storechkDay.push("20201013");

			    for (i = 0; i < storechkDay.length; i++) {
			        if($.inArray((y+""+m+""+d) , storechkDay) != -1) {
			            return [false];
			        }
			    }
			    return [true];
			},
		 	onSelect: function (date, inst) {
 			    inst.inline = false; // css 초기화되는거 막음.
 				inst.dpDiv.find( "[data-handler]" ).map( function() {
 					$(this).removeClass("ui-datepicker-current-day");
 					$(this).children("a").removeClass( "ui-state-active" );
	 			    if($(this).text() == inst.currentDay) {
	 			    	$(this).addClass("ui-datepicker-current-day");
	 			    	$(this).children("a").addClass("ui-state-active");
	 			    }
 				});
		 	
 				$("#datepicker11").val(date);
		 		$("input[name='timeRd']").prop('checked', false);
		 		$("#amArea").hide();
				$("#pmArea").hide();
		 	},
		 	onChangeMonthYear: function(year, month, datepicker) {
	            var today = new Date();
	            var nowMonth = today.getMonth()+1;
	            if(nowMonth == month) {
	            	moveDate = "present";
	            } else {
	            	moveDate = "next";
	            }
	        }
	    });
		$('#datepicker11').val("");
		$("input[name='timeRd']").prop('checked', false);

		$("#amArea").hide();
		$("#pmArea").hide();

		// 시간선택
	    $('.timeCheck li span').click(function(){
	        $('span.on').removeClass('on');
	        $(this).addClass('on');
	    });
	} else {
		$("input[name='timeRd']").prop('checked', false);
		$("#amArea").hide();
		$("#pmArea").hide();
	}

	$("#mountAlertTxt").show();

	//주소세팅
	if(gbn == "B") {
		$("#inst1Poscd").val($("#popZipCode").text());
		$("#inst1Addr1").val($("#popLoadAddr").text());
		$("#inst1Addr2").val($("#popDetailAddr").val());

		$("#addrTxtB").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
		$("#zipCodeB").val($("#popZipCode").text());

		$("#mountAlertTxt").html("<span>장착일시에 서비스매니저가 도착하여 작업합니다.</span>");
	}
	// 픽업
	else if(jusoGbn == "P1"){
		$("#inst1Poscd").val($("#popZipCode").text());
		$("#inst1Addr1").val($("#popLoadAddr").text());
		$("#inst1Addr2").val($("#popDetailAddr").val());

		$("#addrTxtP1").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
		$("#zipCodeP1").val($("#popZipCode").text());

		$("#mountAlertTxt").html("<span>차량 픽업일시에 서비스매니저가 도착하여 차량을 인수합니다.</span>");
	}
	// 딜리버리
	else if(jusoGbn == "P2"){
		$("#inst2Poscd").val($("#popZipCode").text());
		$("#inst2Addr1").val($("#popLoadAddr").text());
		$("#inst2Addr2").val($("#popDetailAddr").val());

		$("#addrTxtP2").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
		$("#zipCodeP2").val($("#popZipCode").text());
	}

	//픽업 주소 = 딜리버리 주소가 같아야 한다.(첫 번째, 두 번째 단어가 같아야 한다.)
	if(jusoGbn == "P1" || jusoGbn == "P2") {
		var rtnChkAddr = chkPickAndDlvyAddr($("#popLoadAddr").text());

		if(!rtnChkAddr) {
			if(jusoGbn == "P1") {
				$("#addrTxtP1").val("");
				$("#inst1Addr1").val("");
				$("#inst1Addr2").val("");
				$("#inst1Poscd").val("");
			} else {
				$("#addrTxtP2").val("");
				$("#inst2Addr1").val("");
				$("#inst2Addr2").val("");
				$("#inst2Poscd").val("");
			}
			ComUtil.alert("픽업 주소와 딜리버리 주소는 같은 지역으로 제한 됩니다. ex) 서울특별시 서초구");
		}
	}

	$("#jusoTxt").val("");
	$("#jusoList").html("");
	$("#totalCount").text("");
	//$("#loadingWrap").hide();
	ComUtil.unloading();
	
	/* 달력 표현부분 css 커스텀 */
	runEffect(true);
	dpCssCustom();
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

// 현재시간 구하기
function getTimeStamp() {
	var d = new Date();

	var s = leadingZeros(d.getFullYear(), 4) + leadingZeros(d.getMonth() + 1, 2) + leadingZeros(d.getDate(), 2);
	s += leadingZeros(d.getHours(), 2) + leadingZeros(d.getMinutes(), 2) + leadingZeros(d.getSeconds(), 2);

	return s;
}

/* 판매인 정보 찾기 */
function fn_searchRecomSalInfo(pageNo) {
	if(pageNo != null){
		if(Number(pageNo)  == 0) {
			$("#saleCurPage").val("1");
		} else {
			$("#saleCurPage").val(pageNo);
		}
	}

	var param =   "searchType=" + $("input[name='searchType']:checked").val() + "&searchKeyword="+$("#searchKeyword").val()+ "&pageNo="+$("#saleCurPage").val();         //카드사코드

		$.ajax({
		type: "POST",
			url:  "/order/searchSalesMan",
			data: param,
			success: function(data){
				console.log(data)

				var html="";
				var list = data.rtnList;
				if(list.length > 0) {
					for(var i=0; i<list.length; i++) {
						html +="<tr onClick='fnSalInfoFix(\""+list[i].orgAgnm+"\", \""+list[i].ordAgent+"\", \""+list[i].chanCd+"\"); return false;'>";
						html +="	<td class='tCenter'>";
						html +="			"+list[i].rownum;
						html +="		</td>";
						html +="		<td class='tCenter'>";
						html +="			"+list[i].orgAgnm;
						html +="</td>";
						html +="<td class='tCenter'>";
						html +="	"+list[i].orgAgtel;
						html +="</td>";
						html +="<td class='tCenter'>";
						html +="	"+list[i].ordAgent;
						html +="</td>";
						html +="</tr>";
					}
				}

				$("#salInfoArea").html(html);
				$("#salInfoCnt").html(data.pageCommon.totalCount);
				PageUtil.fnPageMakeDisplay(data.pageCommon.totalCount, $("#saleCurPage").val() ,  $('#salePaging') , 'fn_searchRecomSalInfo', 5);

				$("div[name='salInfo']").addClass("md-show");
			},
			error:function(request, status, error){
				ComUtil.alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			              //alert("카드번호 유효성 체크 처리중 오류가 발생했습니다.");
			}
		});
}

function fnSalInfoFix(orgAgnm, ordAgent, chanCd){
	document.getElementById("recomSalCdnm").value = orgAgnm;
	document.getElementById("recomSalCd").value = ordAgent;
	document.getElementById("chanCd").value 	= chanCd; //채널코드 추가 2015-11-24
	$("div[name='salInfo']").removeClass("md-show");
}

// 한글 입력 방지
function fn_noKorean(str) {
// 	return str.replace(/[^a-zA-Z0-9]/gi, "");
	return str.replace(/[^a-zA-Z0-9._-]/gi, "");
}
// 영어 + '.' 입력 - [이메일(주소)]
function fn_inputEmail(str){
	return str.replace(/[^a-zA-Z.]/gi, "");
}

function noSundays(date) {
    return [date.getDay() != 0, ''];
}

// 이메일 주소 선택 - [이메일]
function fn_selectEmailAdr(){
	var ordrEmail3 = $('#ordrEmail3').val();
	if(ordrEmail3 != ""){
		$('#ordrEmail2').val(ordrEmail3);
		$('#ordrEmail2').parent().addClass('readonly');
	}else{
		$('#ordrEmail2').val(ordrEmail3);
		$('#ordrEmail2').parent().removeClass('readonly');
	}
}

// 이메일 validation - [이메일]
function fn_emailCheck(){
	var email1 = $('#ordrEmail1').val();
	var email2 = $('#ordrEmail2').val();

	if(email1 != "" && email2 != ""){
		$('#emailInpArt').hide();
	}else{
		$('#emailInpArt').show();
	}
}


//결제수단 체크 값에 따른 화면 ui컨트롤
function payTypeUi(){
	//결제수단 체크 값에 따른 화면 컨트롤
	var payType = $("input[name=rtPayMtd]:checked").val();
	if(payType == "C"){//카드결제
		$("div[name='bankArea']").hide();
		$("div[name='cardArea']").show();
	}else{//계좌결제
		$("div[name='bankArea']").show();
		$("div[name='cardArea']").hide();
	}
	viewRtMtd(payType);
}

function viewRtMtd(type){
	console.log(type);
	if(type=="A"){
		if( 2200 <= <%=hour%> || 0800 >= <%=hour%> ){
			ComUtil.alert("22:00~08:00 시간에는 금융기관 서비스 이용이 제한되므로 렌탈료 계좌이체 선택이 불가능 합니다.");
			document.getElementById("pay1").checked = true;

			$("div[name='bankArea']").hide();
			$("div[name='cardArea']").show();

			return false;
		}
	}

	var objSel = document.getElementById("rtCardPayDy");

	for(var i=0; i<objSel.options.length; i++){
    	objSel.options[i] = null;
    }

	objSel.options.length = 0;

	if(type.value=="C"){
		<c:forEach var="payDayList" items="${payDayList}" >
			<c:if test="${payDayList.cdGrpCd == 'R006'}">
				var objOpt = document.createElement("option");
				objOpt.text  = "${payDayList.cdNm}";
				objOpt.value = "${payDayList.cd}";
				objSel.options.add(objOpt);
			</c:if>
		</c:forEach>
	}else{
		<c:forEach var="payDayList" items="${payDayList}" >
			<c:if test="${payDayList.cdGrpCd == 'R005'}">
				var objOpt = document.createElement("option");
				objOpt.text  = "${payDayList.cdNm}";
				objOpt.value = "${payDayList.cd}";
				objSel.options.add(objOpt);
			</c:if>
		</c:forEach>
	}
}

// 결제하기 버튼
function orderRental() {
	var pUrl = "";
	var custDivCd = '<c:out value="${userVo.custDivCd}"/>';  //회원구분
	var comDivCd = '<c:out value="${userVo.comDivCd}"/>';    //법인회원구분(1:개인/2:법인)

	if (custDivCd == "1") {//개인고객
		pUrl = "/order/certifyPerson";
	} else if (custDivCd == "2") {//사업자 고객
		if (comDivCd == "1") {//개인 사업자
			pUrl = "/order/certifyCompany";
		} else {//법인사업자
			//pUrl = "/order/certifyPerson";
			pUrl = "/order/certifyCompany";
		}
	}

	//ajax in ajax
	$.ajax({
		type:"POST",
	   	url:pUrl,
	   	data:{},
	   	success: function(data){
	   		if (data.rtnMap == null || data.rtnMap == '') {
				var alterMsg = '고객님, 죄송합니다.<br/>';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.<br/>';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.';
				ComUtil.alert(alterMsg);
			} else {
				if(custDivCd == "1") {
					confirm_cardNAcct();//렌탈주문
				} else {
					
					if(custDivCd == "2" && comDivCd == "1") {//개인 사업자
						if (data.rtnMap.gradeYn != 'Y') {
							var alterMsg = '고객님, 죄송합니다.<br/>';
							alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.<br/>';
							alterMsg = alterMsg + '[구매]를 추천 드립니다.';
							ComUtil.alert(alterMsg);
						} else {
							$.ajax({
								type:"POST",
							   	url:"/order/certifyPerson",
							   	data:{},
							   	success: function(data){
							   		/*
									 * 신용등급 -> 신용포인트로 변경.(crGrade)
									 * 변경일 : 2020.12.28
									 */
							   		if (data.rtnMap == null || data.rtnMap == '') {
										var alterMsg = '고객님, 죄송합니다.<br/>';
										alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.<br/>';
										alterMsg = alterMsg + '[구매]를 추천 드립니다.';
										ComUtil.alert(alterMsg);
									} else if (Number(data.rtnMap.creditLvlCd) >= Number(data.rtnMap.crGrade)) {
										var alterMsg = '고객님, 죄송합니다.<br/>';
										alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.<br/>';
										alterMsg = alterMsg + '[구매]를 추천 드립니다.';
										ComUtil.alert(alterMsg);
									} else {
										confirm_cardNAcct();//렌탈주문
									}
							   	},
							  	error:function(request, status, error){
							  		ComUtil.alert(error);
							  	}
							});
						}
					} else {
						if (data.rtnMap.gradeYn != 'Y') {
							var alterMsg = '고객님, 죄송합니다.<br/>';
							alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.<br/>';
							alterMsg = alterMsg + '[구매]를 추천 드립니다.';
							ComUtil.alert(alterMsg);
						} else {
							confirm_cardNAcct();//렌탈주문
						}
					}
				}
			}
	   	},
	  	error:function(request, status, error){
	  		ComUtil.alert(error);
	  	}
	});
}

/*에스크로 결제시 필요한 장바구니 생성*/
function create_goodInfo(){
	var chr30 = String.fromCharCode(30);	// ASCII 코드값 30
   	var chr31 = String.fromCharCode(31);	// ASCII 코드값 31

    var good_info = "seq=1" + chr31
				    + "ordr_numb=${orderVO.ordrIdxx}" + chr31
				    + "good_name=${orderVO.patternCd}" + chr31
				    + "good_cntx=1" + chr31
				    + "good_amtx=" + document.order_info.good_mny.value;

	document.order_info.good_info.value = good_info;
}

/*TMS 정보 담기*/
function create_tmsInfo(){
	var mountCd = $("input[name='instCd']:checked").val();
	var pBhfType = "";
	var rtnVal = true;

	if(mountCd != "40") {
		var timeInfo = $("#amArea span.on, #pmArea span.on").attr("schedule");
		$("#tmsSchduleStr").val(timeInfo);//선택한 시간의 스케줄 정보 서버에서 parsing 함.

		if(mountCd == "20") {
			$("#centerSchduleStr").val($("#amArea span.on, #pmArea span.on").attr("centerSchedule"));
		}

	} else {
		//o2o 전문점이 아닌 렌탈 전문점이라면
    	if($("#rentalShopYn").val() == "Y") {
    		$("#am").prop("checked", true);
    		$("#time0930").removeClass("off");
    		$("#time0930").addClass("on");
    	}
	}
	$("#alignYn").val($("input[name='alignRd']:checked").val());
	if(alignServiceYn == "Y") {
		$("#optPlcNo").val("OPT00000001@");
	}

	if($("#bpStockYn").val() == "Y" && $("#rdcStockYn").val() == "Y") {
		var selectedDay = new Date($("#datepicker11").val()).getDate();

		//활성화된 날짜 목록을 가져온다.
		//선택된 날짜가 오늘로부터 몇 번째이냐에 따라 BHF, RDC인지 정해진다.(오늘부터 3번째 후의 날짜부터 RDC)
		if(moveDate == "present") {
			var enableCnt = $('[data-handler=selectDay] a.ui-state-default').length;
			var clickNum = 0;
			for(var i=0; i<enableCnt; i++) {
				if(Number($('[data-handler=selectDay] a.ui-state-default')[i].innerText) == selectedDay) {
					clickNum = i;
				}
			}

			if(clickNum >= 3) {
				pBhfType = "RDC";
			} else {
				pBhfType = "BHF";
			}
		} else {
			var sDaySplit = $("#datepicker11").val().split('-');
			var sDay = new Date(sDaySplit[0],Number(sDaySplit[1])-1,sDaySplit[2]);
			var today = new Date();
			today = new Date(today.getFullYear(),today.getMonth(),today.getDate());

			var diff = Math.abs(sDay.getTime() - today.getTime());
			diff = Math.ceil(diff / (1000*60*60*24));

			//오늘부터 +2일까지 배열에 담는다.
			var chkDayArr = [];
			for(var i=0; i<=2; i++) {
				var tDay = new Date();
				tDay.setDate(today.getDate() + i);

				var m = tDay.getMonth() > 9 ? tDay.getMonth()+1 : "0"+(tDay.getMonth()+1);
	      		var d = tDay.getDate() > 9 ? tDay.getDate() : "0"+tDay.getDate();
	      		var y = tDay.getFullYear();

	      		chkDayArr.push(y+m+d);
			}

			//휴일 목록에 있는지 확인한다.
			var chkHday = 0;
			$.each(storechkDay, function (idx, item){
				$.each(chkDayArr, function (idx2, item2) {
					if(item == item2) {
						chkHday++;
					}
				});
			});

			var rdcStart = fn_deleteRdcDt();
			rdcStart = rdcStart.replace("+","");
			rdcStart = rdcStart.replace("d","");
			if(diff >= Number(rdcStart)) {
				pBhfType = "RDC";
			} else {
				pBhfType = "BHF";
			}
		}
	} else if($("#bpStockYn").val() == "Y" && $("#rdcStockYn").val() == "N") {
		pBhfType = "BHF";
	} else if($("#bpStockYn").val() == "N" && $("#rdcStockYn").val() == "Y") {
		pBhfType = "RDC";
	} else {
		pBhfType = "BHF";
	}
	$("#bhfType").val(pBhfType);

	$("#instTm").val($("#amArea span.on, #pmArea span.on").text().replace(":",""))//장착시간

	return rtnVal;
}

//결제하기(주문하기) 버튼 클릭 시 카드 또는 계좌정보 인증요청(1단계)
//고객유형이 사업자이고 개인사업자인 경우는
//개인의 결제정보를 인증할지
//회사의 결제정보로 인증할지 화면에서 선택가능
//<!-- 고객구분=개인:1/법인:2-->
//<!-- 법인회원구분=개인사업자:1/법인사업자:2-->
function confirm_cardNAcct(){
	//TMS 정보 담기
	if(!create_tmsInfo()) {
		return false;
	}

	// 계좌결제를 할 수 있으므로 에스크로 장바구니 생성
	create_goodInfo();

	var payType = $("input[name=rtPayMtd]:checked").val();
	var custDivCd = '<c:out value="${userVo.custDivCd}"/>';  //회원구분
	var comDivCd = '<c:out value="${userVo.comDivCd}"/>';    //법인회원구분(1:개인/2:법인)
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
			if(comDivCd == "2"){        //법인사업자
				confirm_acct("2");
			}else if(comDivCd=="1"){  //개인사업자
				if(confirmDivcd=="1"){
					confirm_acct("1");
				}else{
					confirm_acct("2");
				}
			}
		}
	}
}

//카드번호 유효성 체크
function confirm_card(confirm_gb){
	if(!validationChk()){
		return;
	}
	if(!chkVersion()){
		return;
	}

	ComUtil.loading();

	var cardNum = $("#rtCardNo").val();      //카드번호
	var cardValYr = $("#rtCardValYr").val();   //카드유효기간년
	var cardValMn = $("#rtCardValMn").val();   //카드유효기간월
	var cardOwner = $("#rtCardOwner").val();   //카드소지자명
	var confirmGb = confirm_gb;              //사용자구분(개인:1 /법인:2)0
	var birthd = "";                      //생년월일
	var licenseNum = "";                      //사업자번호
	var custNm = "${userVo.custNm}"; //고객명
	var cardCd = $("#rtCardCorp").val();    //카드사코드

	if(confirmGb=="1"){           //개인명의로
		confirmGb = "1";
		birthd = "${userVo.legalBrthYY}${userVo.legalBrthMM}${userVo.legalBrthDD}";                 //생년월일
		birthd = birthd.substring(2, 8);
	}else if(confirmGb=="2"){        //사업체명의로
		confirmGb = "2";
		licenseNum = "${userVo.bizRegNo1}${userVo.bizRegNo2}${userVo.bizRegNo3}";
	}

	$("#carNumber").val($("#carNoTxt").val());

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
	   		ComUtil.unloading();

		   if(data.resCd != "0000"){
				ComUtil.alert("계좌/카드 본인인증 결과 잘못된 정보입니다. 렌탈료 결제 정보를 확인해 주세요.")
				return;
			}else{
				var frm = document.order_info;

				frm.batchKey.value = data.batchKey;
				//20200727 kstka 카드사코드 리턴
				$("#rtCardCorp").val(data.cardcomCd);

				// 채널 설정
				if(frm.recomSalCd.value == ""){
					frm.chanCd.value = "02";
				}

				// 재렌탈일 경우 등록금 할인
				if(frm.reRentalOrdNo.value != 'N' && frm.reRentalOrdNo.value != '' && frm.prdtGrp.value == '01'){
					var regiAmt = frm.regiCdAmt.value;
					var reRentalDcAmt = frm.reRentalDcAmt.value;

					reRentalRegiAmt = Number(regiAmt) - Number(reRentalDcAmt);

					frm.regiCdAmt.value = reRentalRegiAmt;
					frm.good_mny.value = reRentalRegiAmt;
				}

				// 렌탈상품(자유렌탈 제외) 재렌탈일 경우 등록금 할인
				if(frm.regiCdAmt.value == 0 || frm.regiCdAmt.value == '') {
					frm.payYn.value = 'N';
				}else {
					frm.payYn.value = 'Y';
				}

				//AS 등록비 결제 있었으나 빠짐
				frm.regiCdAmt.value = $("#selectRegiAmt").val();
				frm.good_mny.value = $("#selectRegiAmt").val();

				//yjw serverMode 제거(20220225)
				var mountCd =  $("input[name='instCd']:checked").val();
				if(mountCd == "40") {
					frm.action = "/order/noPayProcShop";
				} else {
					frm.action = "/order/noPayProcShopTMS2";
				}

				frm.submit();
			}
	   },
	  	error:function(request, status, error){
	  		ComUtil.unloading();
	  		ComUtil.alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  	}
	});
}


//계좌번호 유효성 체크
function confirm_acct(confirm_gb){
	if(!validationChk()){
		return;
	}

	ComUtil.loading();

	var frm  = document.order_info;
	var custDivCd = ""; //회원구분
	var BLNo = "";//생년월일 및 사업자번호
	var bankCd = $("#rtAcctCorp").val();//은행 코드
	var acctNumber = $("#rtAcctNo").val();//계좌번호
	var acctOwner = $("#rtAcctOwner").val();   //계좌소지자명

	if(confirm_gb=="1"){                //개인명의로
        custDivCd="00";
		birthd = "${userVo.legalBrthYY}${userVo.legalBrthMM}${userVo.legalBrthDD}";                 //생년월일
		birthd = birthd.substring(2, 8);
		BLNo = birthd;
	}else if(confirm_gb=="2"){          //사업자명의로
		custDivCd="01";
		BLNo = "${userVo.bizRegNo1}${userVo.bizRegNo2}${userVo.bizRegNo3}";
	}

	$("#carNumber").val($("#carNoTxt").val());

	$.ajax({
		type: "POST",
	   	url:  "/order/kftcCmsDocInfo",
	   	data: "userType="+ custDivCd +                      //회원구분
	   	      "&bankCd=" + bankCd +
	   	      "&acctCd=" + acctNumber +
	   	      "&bizNo="  + BLNo +
	   	      "&custNm=${userVo.custNm}" +
	   	      "&ownerNm="+ acctOwner,
	   	success: function(data) {
	   		ComUtil.unloading();
	   		if(data.returnCode < 0){
				ComUtil.alert("계좌/카드 본인인증 결과 잘못된 정보입니다. 렌탈료 결제 정보를 확인해 주세요.");
				return;
			}

			var frm = document.order_info;

			// 채널 설정
			if(frm.recomSalCd.value == ""){
				frm.chanCd.value = "02";
			}

			// 렌탈상품(자유렌탈 제외) 재렌탈일 경우 등록금 할인
			if(frm.reRentalOrdNo.value != 'N' && frm.reRentalOrdNo.value != '' && frm.prdtGrp.value == '01'){
				var regiAmt = frm.regiCdAmt.value;
				var reRentalDcAmt = frm.reRentalDcAmt.value;

				reRentalRegiAmt = Number(regiAmt) - Number(reRentalDcAmt);

				frm.regiCdAmt.value = reRentalRegiAmt;
				frm.good_mny.value = reRentalRegiAmt;
			}

			// 등록금이 0 이면 결제 없이 주문처리
			if(frm.good_mny.value == 0 || frm.good_mny.value == '') {
				frm.payYn.value = 'N';
			}else {
				frm.payYn.value = 'Y';
			}

			//AS 등록비 결제 있었으나 빠짐
			frm.regiCdAmt.value = $("#selectRegiAmt").val();
			frm.good_mny.value = $("#selectRegiAmt").val();

			//yjw serverMode 제거(20220225)
			var mountCd =  $("input[name='instCd']:checked").val();
			if(mountCd == "40") {
				frm.action = "/order/noPayProcShop";
			} else {
				frm.action = "/order/noPayProcShopTMS2";
			}

			frm.submit();

	   	},
	  	error:function(request, status, error){
	  		ComUtil.unloading();
			ComUtil.alert("계좌번호 유효성 체크 처리중 오류가 발생했습니다.");
	  	}
	});
}


function validationChk() {
	var frm = document.order_info;
	var custDivCd = "${userVo.custDivCd}";
	var comDivCd = "${userVo.comDivCd}";

	if(frm.ordrNm.value==""){
		ComUtil.alert("주문자를 입력해주세요");
		frm.ordrNm.focus();
		return false;
	}
	if(frm.ordrHp1.value==""
			||frm.ordrHp2.value==""
			||frm.ordrHp3.value==""){
		ComUtil.alert("휴대폰 번호를 입력해주세요");
		frm.ordrHp2.focus();
		return false;
	}
	/* if(frm.ordrEmail1.value==""
			||frm.ordrEmail2.value==""){
		ComUtil.alert("이메일을 입력해주세요");
		frm.ordrEmail1.focus();
		return false;
	} */

	if(frm.addr1.value==""){
		ComUtil.alert("주소를 입력해주세요");
		//frm.addr1.focus();
		return false;
	}

	if(frm.reqInsDt.value==""){
		ComUtil.alert("장착일자를 입력해주세요");
		frm.reqInsDt.focus();
		return false;
	}

	var mountCheck = frm.instCd.value;
	if(mountCheck == "10") {
		if(frm.addrTxtB.value == "") {
			ComUtil.alert("방문장착서비스 주소를 입력해 주세요");
			$("#addr").focus();
			return false;
		} else {
			frm.instCd.value = "1010";
		}

		if(ValidUtil.isEmpty($("#amArea span.on, #pmArea span.on").text())) {
			ComUtil.alert("장착시간을 선택해 주세요");
			return false;
		}
	} else if(mountCheck == "20") {
		if(frm.addrTxtP1.value == "") {
			ComUtil.alert("픽업주소를 입력해 주세요");
			$("#addr").focus();
			return false;
		} else {
			frm.instCd.value = "1020";
		}
		if(frm.addrTxtP2.value == "") {
			ComUtil.alert("딜리버리를 입력해 주세요");
			$("#addr").focus();
			return false;
		} else {
			frm.instCd.value = "1020";
		}

		if(ValidUtil.isEmpty($("#amArea span.on, #pmArea span.on").text())) {
			ComUtil.alert("장착시간을 선택해 주세요");
			return false;
		}
	} else if(mountCheck == "40") {
		if(frm.insStoreCd.value==""){
			ComUtil.alert("렌탈전문점을 선택해주세요");
			frm.insStoreName.focus();
			return false;
		} else {
			frm.instCd.value = "1030";
		}

		//o2o 전문점일때
		if(ValidUtil.isEmpty($("#amArea span.on, #pmArea span.on").text())) {
			ComUtil.alert("장착시간을 선택해 주세요");
			return false;
		}
	}

	if(custDivCd == 1){
		if( frm.legalBrthYY.value==""
		  || frm.legalBrthMM.value==""
		  || frm.legalBrthDD.value=="" ){
			ComUtil.alert("법정생년월일을 입력해주세요");
			frm.legalBrthYY.focus();
			return false;
		}
	}
	if(custDivCd == 2){
		if(frm.bizNo1.value == ""
		|| frm.bizNo2.value == ""
		|| frm.bizNo3.value ==""){
			ComUtil.alert("사업자등록번호를 입력해주세요");
			frm.bizNo1.focus();
			return false;
		}
		if(comDivCd == "1" && frm.confirmDivcd.value == ''){
			ComUtil.alert("계좌/카드 본인확인 대상을 선택해주세요.");
			frm.confirmDivcd.focus();
			return false;
		}
	}
	if( frm.rtCardPayDy.value=="" ){
		ComUtil.alert("결제일을 선택해주세요");
		frm.rtCardPayDy.focus();
		return false;
	}
	if( $('input:checkbox[name=rtCardAgree]').is(':checked') == false ){
		ComUtil.alert("자동이체 동의를 체크해주세요");
		frm.rtCardAgree.focus();
		return false;
	}

	if($("input[name=rtPayMtd]:checked").val() == "C"){
		if($("input[name=rtPayMtd]").val()==""){
			ComUtil.alert("카드사명을 선택해주세요");
			$("input[name=rtPayMtd]").focus();
			return false;
		}
		if(frm.rtCardNo.value==""){
			ComUtil.alert("카드번호를 입력해주세요");
			frm.rtCardNo.focus();
			return false;
		}
		if(frm.rtCardOwner.value==""){
			ComUtil.alert("카드소유주를 입력해주세요");
			frm.rtCardOwner.focus();
			return false;
		}
		if(frm.rtCardValYr.value=="" || frm.rtCardValMn.value==""){
			ComUtil.alert("유효기간을 입력해주세요");
			frm.rtCardValYr.focus();
			return false;
		}
	}

	if($("#carNoTxt").val() == "") {
		ComUtil.alert("차량번호를입력해주세요");
		frm.carNoTxt.focus();
		return false;
	}

	if($("input[name=rtPayMtd]:checked").val() == "A"){

		// 은행명
		if(frm.rtAcctCorp.options[frm.rtAcctCorp.selectedIndex].value == ""){
			ComUtil.alert("은행명을 선택해주세요");
			frm.rtAcctCorp.focus();
			return false;
		}
		// 계좌번호
		if(frm.rtAcctNo.value == ""){
			ComUtil.alert("계좌번호를 입력해주세요");
			frm.rtAcctNo.focus();
			return false;
		}
		// 계좌소유주
		if(frm.rtAcctOwner.value == ""){
			ComUtil.alert("계좌소유주를 입력해주세요");
			frm.rtAcctOwner.focus();
			return false;
		}

		if(document.getElementById("ars_succ_yn").value == "0" ||
		   document.getElementById("CUST_NM").value != frm.rtAcctOwner.value ||
		   document.getElementById("ACCT_NO").value != frm.rtAcctNo.value ||
		   document.getElementById("BANK_CD").value != frm.rtAcctCorp.options[frm.rtAcctCorp.selectedIndex].value){
			document.getElementById("ars_succ_yn").value = "0";
			ComUtil.alert("출금이체동의 버튼을 클릭해주세요");
			return false;
		}
	}

	if(confirm("결제 하시겠습니까?")==true){
		var payType = $("input[name=rtPayMtd]:checked").val();
		/* 확인 필요
		frm.pay_method.value="110000000000";
		frm.escw_used.value = "Y";
		frm.pay_mod.value   = "Y";
		*/
		if(payType=="C"){//카드
			frm.pay_method.value="100000000000";
			frm.escw_used.value = "N";
			frm.pay_mod.value = "N";
		}else{//계좌 A
			frm.pay_method.value="010000000000";
			frm.escw_used.value = "Y";
			frm.pay_mod.value   = "Y";
		}

		frm.buyr_name.value=frm.ordrNm.value;                                      //주문자명(buyr_name)
		if(frm.ordrEmail1.value == "" || frm.ordrEmail2.value) {
			frm.buyr_mail.value="";                             	//주문자 E-mail(buyr_mail)
		} else {
			frm.buyr_mail.value=frm.ordrEmail1.value + "@" + frm.ordrEmail2.value;
		}
		frm.buyr_tel1.value="";                                                    //주문자 연락처1(buyr_tel1)
		frm.buyr_tel2.value=frm.ordrHp1.value + "-" + frm.ordrHp2.value + "-"  + frm.ordrHp3.value;  //휴대폰번호(buyr_tel2)
        frm.rcvr_name.value=frm.ordrNm.value;                                      //수취인명(rcvr_name)
		frm.rcvr_tel1.value="";                                                    //수취인 연락처1(rcvr_tel1)
		frm.rcvr_tel2.value=frm.ordrHp1.value + "-" + frm.ordrHp2.value + "-" + frm.ordrHp3.value;                                     //수취인 휴대폰번호(rcvr_tel2)
		frm.rcvr_mail.value=frm.ordrEmail1.value+"@"+frm.ordrEmail2.value;         //수취인 E-mail(rcvr_mail)
		frm.rcvr_zipx.value=frm.postNo.value;                                      //수취인 우편번호(rcvr_zipx)
		frm.rcvr_add1.value=frm.addr1.value;                                       //수취인 주소(rcvr_add1)
		frm.rcvr_add2.value=frm.addr2.value;                                       //수취인 상세주소

		return true;
	}else{
		return false;
	}

}

//숫자만 입력
function number_filter(str_value){
	return str_value.replace(/[^0-9]/gi, "");
}

//ARS인증 기능 유효성
function account_check(){
	var frm = document.order_info;

	if(frm.rtAcctCorp.value==""){
		ComUtil.alert("은행명을 선택해주세요");
		frm.rtAcctCorp.focus();
		return false;
	}
	if(frm.rtAcctNo.value==""){
		ComUtil.alert("계좌번호를 입력해주세요");
		frm.rtAcctNo.focus();
		return false;
	}
	// 2016-05-03 이영근, 평생계좌 신청 불가
	if((frm.rtAcctNo.value.length==10 || frm.rtAcctNo.value.length==11) && frm.rtAcctCorp.value == "003"){
		ComUtil.alert("평생계좌는 자동이체 신청이 불가능합니다.");
		frm.rtAcctNo.focus();
		return false;
	}
	if(frm.rtAcctNo.value.length>=10 && frm.rtAcctNo.value.length<=14 && frm.rtAcctCorp.value == "088" && frm.rtAcctNo.value.substr(0,3)=="010"){
		ComUtil.alert("평생계좌는 자동이체 신청이 불가능합니다.");
		frm.rtAcctNo.focus();
		return false;
	}
	if(frm.rtAcctOwner.value==""){
		ComUtil.alert("계좌소유주를 입력해주세요");
		frm.rtAcctOwner.focus();
		return false;
	}

	document.getElementById("PHONE").value = frm.ordrHp1.value + frm.ordrHp2.value + frm.ordrHp3.value;
	document.getElementById("DATE").value = getTimeStamp();
	document.getElementById("CUST_NM").value = frm.rtAcctOwner.value;
	document.getElementById("ACCT_NO").value = frm.rtAcctNo.value;
	document.getElementById("BANK_CD").value = frm.rtAcctCorp.options[frm.rtAcctCorp.selectedIndex].value;
	document.getElementById("CUST_TP").value = "0" + frm.custDivCd.value;
	var bankNm = frm.rtAcctCorp.options[frm.rtAcctCorp.selectedIndex].text;
	document.getElementById("BANK_NM").value = bankNm;  // 2016-06-22 이영근, 추가

	var authNo = (Math.floor(Math.random() * 100)) + ""; // 인증번호 랜덤
	if(authNo.length == 1)
		authNo = "0" + authNo;
	document.getElementById("AUTH_NO").value = authNo;

	if(document.getElementById("legalBrthYY") != null){
		document.getElementById("BIRTH_DAY").value = frm.legalBrthYY.value + frm.legalBrthMM.value + frm.legalBrthDD.value;
		document.getElementById("AUTH_INQUERY").value = "안녕하세요 넥센타이어입니다. " + frm.legalBrthYY.value + "년 " + Number(frm.legalBrthMM.value) + "월 "
											            + Number(frm.legalBrthDD.value) + "일생 " + frm.rtAcctOwner.value + " 고객님의 " + bankNm
											            + "<digit>" + frm.rtAcctNo.value + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
	}

	if(document.getElementById("bizNo1") != null){
		document.getElementById("BUSL_NO").value = frm.bizNo1.value + frm.bizNo2.value + frm.bizNo3.value;
		document.getElementById("AUTH_INQUERY").value = "안녕하세요 넥센타이어입니다. 사업자번호 <digit>" + frm.bizNo1.value + frm.bizNo2.value
											            + frm.bizNo3.value + "</digit> " + frm.rtAcctOwner.value + " 고객님의 " + bankNm
											            + "<digit>" + frm.rtAcctNo.value + "</digit> 계좌에서 넥센타이어로 자동이체 출금에 대해 동의하시겠습니까?";
	}

	return true;
}

//ARS인증 기능 java로 대체
function fn_arsCallService(){
   	if(!account_check()){
   		return false;
   	}

   	ComUtil.loading();
	$("#bankMsgArea").show();

	var frm = document.ars_info;
	$.ajax({
		type: "POST",
	   	url:  "/order/arsCallSvr",
	   	data: "PHONE="+ frm.PHONE.value +
	   	      "&CUST_NM=" + frm.CUST_NM.value +
	   	      "&BANK_CD=" + frm.BANK_CD.value +
	   	      "&BANK_NM=" + frm.BANK_NM.value +
	   	      "&ACCT_NO="  + frm.ACCT_NO.value +
	   	      "&BUSL_NO="  + frm.BUSL_NO.value +
	   	      "&BIRTH_DAY="  + frm.BIRTH_DAY.value +
	   	      "&CUST_TP="+ frm.CUST_TP.value,
	   	success: function(data){
	   		ComUtil.unloading();
	   		$("#bankMsgArea").html("<span><i class='ico08'></i>"+data.rtnMsg+"</span>");
	   		if(data.rtnCode == "0"){
				ComUtil.alert(data.rtnMsg);
				fn_setReadonly();
			}else{
				ComUtil.alert(data.rtnMsg);
				//$('#rtn').html(data.rtnMsg);
				fn_setWritecan();
			}
	   	},
	  	error:function(request, status, error){
            ComUtil.unloading();
            ComUtil.alert("출금이체동의 처리중 오류가 발생했습니다.");
            $("#bankMsgArea").html("<span><i class='ico11'></i>출금이체동의 처리중 오류가 발생했습니다.</span>");

	  	}
	});
}

function fn_setReadonly(){

	document.getElementById("ars_succ_yn").value = "1";
	/* 출금이체동의 완료시 출금이체동의 버튼 disabled + 동의완료 text 출력 (2019-01-22)*/
	$('#ars_button').html("출금이체동의완료");
	$("#ars_button").prop("disabled", true);
}

function fn_setWritecan(){
	document.getElementById("ars_succ_yn").value = "0";
	//$('#ars_button').html('<a href="javascript:void(0);" onclick="fn_arsCallService(); event.preventDefault();" class="btn ty6">출금이체동의</a>');
}

// 렌탈등록비 변경 이벤트
function changeRegiAmt(regiAmt){
	var frm = document.order_info;

	var prdtGrp = frm.prdtGrp.value;
	var prdtGrpDtl = frm.prdtGrpDtl.value;
	if(prdtGrp == "01" && prdtGrpDtl == "04") {

	} else {
		// 렌탈 등록비 결제정보 - 등록비 결제금액 text 변경
		$('#textRegiAmt').text($('#selectRegiAmt option:selected').text());
		if(regiAmt == 0){
			var bfPrice = "<label style='text-decoration:line-through; text-decoration-color:red; text-decoration-thickness:2px;'>50,000원</label>";
			$('#textRegiAmt11').text("");
			$('#textRegiAmt11').html(bfPrice);
		} else {
			$('#textRegiAmt11').text($('#selectRegiAmt option:selected').text());
		}
		// 렌탈 등록비 변경으로 인한 최종 렌탈료 변경
		var sum_mom_amt = 0;
		var mom_amt = Number(frm.rentalAmt.value) + Number(frm.rentalPAmt.value);  		// 기본렌탈료 + 추가렌료
		var dc_amt = Number("${rentalProd.dcAmt}");    		// 렌탈 할인료
		//var regi_amt = Number(frm.orgRegiAmt.value);  		// 렌탈 등록비
		var regi_amt = Number(frm.orgRegiAmt.value);  		// 렌탈 등록비
		var chg_regi_amt = regiAmt;  				// 변경된 등록비
		var periodCd = $("input[name=periodCd]").val();			// 선택 기간(개월)
		// 계산된 총 렌탈료
		sum_mom_amt = getRentAmt(mom_amt, regi_amt, chg_regi_amt, dc_amt, periodCd);
		//기본월렌탈,추가렌탈료,할인액,등록비 금액 값을 모두 가지고 계산한 최종 월렌탈료
		frm.sumTotalAmt.value = sum_mom_amt;
		// 등록금 변경
		frm.good_mny.value = regiAmt;
		frm.regiCdAmt.value = regiAmt;

		var prdtGrp = frm.prdtGrp.value;
		var prdtGrpDtl = frm.prdtGrpDtl.value;

		// text 설정
		$('#textTotalAmt1').text(NumUtil.setComma(sum_mom_amt));
		$('#textTotalAmt11').text(NumUtil.setComma(sum_mom_amt));
		$('#textTotalAmt2').text(NumUtil.setComma(sum_mom_amt));
		$('#textTotalAmt3').text(NumUtil.setComma(sum_mom_amt));
		$('#showRentalAmt').text(NumUtil.setComma(sum_mom_amt));
	}

}

// 10의자리 버림
var mathFloor = function(num){
	num = Math.floor(eval(num)/10)*10;
	return num;
}

// 렌탈료 계산
var getRentAmt = function(mom_amt, regi_amt, chg_regi_amt, dc_amt, periodCd){
	console.log("mom_amt :: " + mom_amt)
	console.log("regi_amt :: " + regi_amt)
	console.log("chg_regi_amt :: " + chg_regi_amt)
	console.log("dc_amt :: " + dc_amt)
	console.log("periodCd :: " + periodCd)

	if((regi_amt+"") != chg_regi_amt){
		regi_amt =  eval(regi_amt - chg_regi_amt);
		totRentAmt = mathFloor(eval(mom_amt*periodCd + regi_amt));
		sum_mom_amt = mathFloor(eval(totRentAmt/periodCd - dc_amt));
	}else{
		sum_mom_amt = mathFloor(eval(mom_amt - dc_amt));
	}

	return sum_mom_amt;
};


//시도 셀렉트 선택 시 시군구 조회
function selectSiGunGu(){
	if (ValidUtil.isEmpty($("#sido").val())) {
    	var html = "";
    	html += "<option value=''>시/군/구 선택</option>";
    	$("#sigungu").html(html);
//		$("#sigungu").empty();	//'시/도 선택' 하여 조회 후 다시 시/도 선택 시 '시/군/구 선택' 으로 다시 셋팅
		return false;
	}
	$.ajax({
	    url: "/order/selectSiGunGu",
	    type: "GET",
	    data: {param : $("#sido").val()},
	    success: function(data) {
	    	console.log(data)
	    	var html = "";
	    	
	    	if(data.length > 0) {
		    	html += "<option value=''>전체</option>";
	    		for(var i=0; i<data.length; i++) {
		    		html += "<option value='"+data[i].cd+"'>" + data[i].cdNm + "</option>";
		    	}
	    	} else {
	    		html += "<option value=''>시/군/구 선택</option>";
	    	}

	    	$("#sigungu").html(html);
	    },
	    error: function (request, status, error) {
	    	console.log(error)
		}
	});
}

function fn_popupClose(pId) {
	$("#"+pId).removeClass("md-show");
	if(pId != "modal-Shop") {
		$("#modal-Shop").addClass("md-show");
	}
	fnMove("junmun");
}

/* 길찾기 */
function goFind(agencyNm, posX, posY){
	window.open("http://map.daum.net/link/to/"+agencyNm+","+posX+","+posY);
}

//예약가능시간 가져오기 함수
//1. 날짜선택되어있고 오전,오후 클릭시
//2. 오전,오후 클릭 되어있고 날짜 변경시
function getTimeList() {
	//param : 날짜 + 오전,오후 + 해당날짜 거점
	//return : 시간List (어느거점, 어느차 정보 포함)
	//여기서 색칠해야함.
	ComUtil.loading();
	var param = {};
	var pBhfType = "";
	var mountCd = $("input[name='instCd']:checked").val();

	if($("#bpStockYn").val() == "Y" && $("#rdcStockYn").val() == "Y") {
		var selectedDay = new Date($("#datepicker11").val()).getDate();

		//활성화된 날짜 목록을 가져온다.
		//선택된 날짜가 오늘로부터 몇 번째이냐에 따라 BHF, RDC인지 정해진다.(오늘부터 3번째 후의 날짜부터 RDC)
		if(moveDate == "present") {
			var enableCnt = $('[data-handler=selectDay] a.ui-state-default').length;
			var clickNum = 0;
			for(var i=0; i<enableCnt; i++) {
				if(Number($('[data-handler=selectDay] a.ui-state-default')[i].innerText) == selectedDay) {
					clickNum = i;
				}
			}

			if(clickNum >= 3) {
				pBhfType = "RDC";
			} else {
				pBhfType = "BHF";
			}
		} else {
			var sDaySplit = $("#datepicker11").val().split('-');
			var sDay = new Date(sDaySplit[0],Number(sDaySplit[1])-1,sDaySplit[2]);
			var today = new Date();
			today = new Date(today.getFullYear(),today.getMonth(),today.getDate());

			var diff = Math.abs(sDay.getTime() - today.getTime());
			diff = Math.ceil(diff / (1000*60*60*24));

			//오늘부터 +2일까지 배열에 담는다.
			var chkDayArr = [];
			for(var i=0; i<=2; i++) {
				var tDay = new Date();
				tDay.setDate(today.getDate() + i);

				var m = tDay.getMonth() > 9 ? tDay.getMonth()+1 : "0"+(tDay.getMonth()+1);
	      		var d = tDay.getDate() > 9 ? tDay.getDate() : "0"+tDay.getDate();
	      		var y = tDay.getFullYear();

	      		chkDayArr.push(y+m+d);
			}

			//휴일 목록에 있는지 확인한다.
			var chkHday = 0;
			$.each(storechkDay, function (idx, item){
				$.each(chkDayArr, function (idx2, item2) {
					if(item == item2) {
						chkHday++;
					}
				});
			});

			var rdcStart = fn_deleteRdcDt();
			rdcStart = rdcStart.replace("+","");
			rdcStart = rdcStart.replace("d","");
			if(diff >= Number(rdcStart)) {
				pBhfType = "RDC";
			} else {
				pBhfType = "BHF";
			}
		}
	} else if($("#bpStockYn").val() == "Y" && $("#rdcStockYn").val() == "N") {
		pBhfType = "BHF";
	} else if($("#bpStockYn").val() == "N" && $("#rdcStockYn").val() == "Y") {
		pBhfType = "RDC";
	} else {
		pBhfType = "BHF";
	}
	$("#bhfType").val(pBhfType);

	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("input[name='cntCd']").val().substring(1,2));
	});

	param["mountDt"] = $("#datepicker11").val();
	if(mountCd == "10") {//방문장착일때
		param["iplAddr"] = $("#inst1Addr1").val();
		param["iplDtlAddr"] = $("#inst1Addr2").val();
		param["city"] = $("#city").val();
		param["county"] = $("#county").val();
		param["dong"] = $("#dong").val();
	} else {//P&D때 - 픽업주소정보로 조회한다.
		//픽업주소
		param["pickupBassAddr"] = $("#inst1Addr1").val();
		param["pickupDtlAddr"] = $("#inst1Addr2").val();
		param["city"] = $("#city").val();
		param["county"] = $("#county").val();
		param["dong"] = $("#dong").val();

		//딜리버리 주소
		param["iplAddr"] = $("#inst2Addr1").val();
		param["iplDtlAddr"] = $("#inst2Addr2").val();
		param["dlvyCity"] = $("#dlvyCity").val();
		param["dlvyCounty"] = $("#dlvyCounty").val();
		param["dlvyDong"] = $("#dlvyDong").val();
	}
	param["bhfType"] = pBhfType;
	param["itemCdArr"] = itemCdArr;
	param["itemCntArr"] = itemCntArr;
	param["amPmGbn"] = $("#amPmGbn").val();
	param["basementYn"] = $("input[name='pkLoca']:checked").val();
	param["mountCd"] = mountCd;
	param["alignYn"] = $("input[name='alignRd']:checked").val();
	if(alignServiceYn == "Y") {
		param["optPlcNo"] = "OPT00000001@";
	}

	// 렌탈 주문을 위한 변수 있지 체크
	/* 2021-05-21 자가점의 경우 방문장착, P&D 제외 해야함.
	*/
	param["rentalGbn"] = "R";  // P 구매 R 렌탈 (자가점의 경우 렌탈주문에서 사용하면 안됨.)

	//yjw serverMode 제거(20220225)
	var selectTmsSetTimeListTMS2 = "/order/selectTmsSetTimeListTMS2";

   	$.ajax({
        type: "post",
        url: selectTmsSetTimeListTMS2,
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "0") {
        		if(data.rtnVo == null || data.rtnVo.resultDataBest == null){
        			return;
        		}
        		resultDataBestObj = JSON.stringify(data.rtnVo.resultDataBest);
        		var resultData = data.rtnVo.resultDataBest;
        		var dt = new Date(param.mountDt);
        		var ordId = data.rtnVo.orderId;
        		var orderConfigType = data.rtnVo.orderConfigType;
        		$("#ordId").val(ordId);
        		$("#mountCd").val(mountCd);
        		$("#tmsOrderId").val(ordId);
        		$("#orderConfigType").val(orderConfigType);
        		$.each(resultData, function(idx, item) {
		        	if(dt.getDay() == "6" && item.selectedTime == "0900") {
		        		// 서비스매니저 출근시간을 맞추기 위해 토요일 09:00 배정 버튼 가리기
		        		// getDay() => 6이면 토요일 (0부터 일요일)
		        		// console.log("토요일 9시");
		        	} else {
			        		$("#time"+item.selectedTime).removeClass("off");
				        	$("#time"+item.selectedTime).removeClass("on");
				        	if(item.vehicleScheduleList.length > 0) {
				        		$("#time"+item.selectedTime).attr("schedule",JSON.stringify(item.vehicleScheduleList));
				        	}
				        	if(mountCd == "20") {
				        		$("#time"+item.selectedTime).attr("centerSchedule",JSON.stringify(item.vehicleScheduleList));
				        	}
		        	}
        		});
        	}
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
        	ComUtil.unloading();
        },
       	complete:function() {
       		ComUtil.unloading();
       	}
    });
}

//전문점 장착시 보여지는 시간 목록
function getShopTimeList() {
	//여기서 색칠해야함.
	ComUtil.loading();

	var param = {};

	param["bpCd"] = $("#insStoreCd").val();
	param["mountDt"] = $("#datepicker11").val().replace(/-/gi, "");

	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("input[name='cntCd']").val().substring(1,2));
	});

	param["itemCdArr"] = itemCdArr;
	param["itemCntArr"] = itemCntArr;
	param["alignYn"] = $("input[name='alignRd']:checked").val();
	if(alignServiceYn == "Y") {
		param["optPlcNo"] = "OPT00000001@";
	}

	$.ajax({
        type: "post",
        url: "/order/selectShopTimeList",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "200") {
        		var result = data.shopTimeList;

        		$.each(result.resultData, function(idx, item) {
        			$("#time"+item.TIME).removeClass("off");
		        	$("#time"+item.TIME).removeClass("on");
        		});
        	} else {
        		ComUtil.alert(data.rtnMsg);
        	}
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
        	ComUtil.unloading();
        },
    	complete:function() {
    		ComUtil.unloading();
    	}
    });
}

//버전 체크 함수
function chkVersion() {
	var result = true;
	var param = {};
	var mountCd = $("input[name='instCd']:checked").val();

	if(mountCd != "40") {
		var timeSchedule = JSON.parse($("#amArea span.on, #pmArea span.on").attr("schedule"));

		param["tmsSchdule"] = timeSchedule;

		//yjw serverMode 제거(20220225)
		var selectChkVersionTMS2 = "/order/selectChkVersionTMS2";

		$.ajax({
	        type: "post",
	        url: selectChkVersionTMS2,
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        async:false,
	        success: function (data) {
	        	if(data == "EXISTENCE") {
	        		result = false;
	        	} else {
	        		result = true;
	        	}
	        },
	        error: function(xhr,status,error){
	        	console.log("error:",error);
	        	result = false;
	        }
	    });
	}

	return result;
}

function initDetailInfo() {
	//주소 초기화
	$("#addrTxtB").val("");
	$("#addrTxtP1").val("");
	$("#addrTxtP2").val("");
	$("#addrTxtJ").val("");

	//장착 희망일 초기화
	$("#datepicker11").val("");
	$("input[name='timeRd']").prop('checked', false);

	//장착 희망시간 초기화
	$("#amArea").hide();
	$("#pmArea").hide();
}


function fn_searchAgencyInfo(agencyCd) {
	var pUrl = "/order/rentalAgencyInfo";

	var pParams = {
			agencyCd 		: agencyCd
	};

	cfnSendRequest(pUrl,pParams,'rentalAgencyInfo');
}

/* 나의 위치 근처 렌탈 전문점 가져오기 */
function getRentStore(lat,lon){

	var pUrl = "/order/selectAroundRentalStoreMap";

	var pParams = {
			"posX" : lat
			,"posY" : lon
	};

	cfnSendRequest(pUrl,pParams,'selectAroundRentalStoreMap');
}

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	var positions = [];

	if(result.rtnCode == 0) {
		if (callback == 'selectAroundRentalStoreMap') {
	        var obj;

	        for(var j=0; j < result.rtnList.length; j++) {
	            obj = {
	            		title	: result.rtnList[j].agencyNm,
	            		addr 	: result.rtnList[j].city + " " +result.rtnList[j].street,
	            		lat		: result.rtnList[j].posX,
	            		lon		: result.rtnList[j].posY,
	            		agencyCd		: result.rtnList[0].agencyCd
	            };
	            positions.push(obj);
            }

            if (result.rtnList.length > 0) {
            	if(mapTargetDiv == "mapDiv") {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDiv");
            	} else {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDivPopup");
            	}
            }
		} else if (callback == 'rentalAgencyInfo') {
			var html = "";
			html += "<h2>";
			html += result.rtnList[0].agencyNm;
			html += "</h2>"
			html += "<div class='state'>";
			if(result.rtnList[0].chYn == "Y") {
				html += "	<img src='../img/common/state_big_ico01.png' alt='추천'> ";
			}
			//html += "   <img src='../img/common/state_big_ico02.png' alt='타이어'>";
			html += "</div>";
			$("#agencyHeader").empty();
			$("#agencyHeader").html(html);

            // 주소정보
			html = "";
			html += "<span>";
            html += result.rtnList[0].city + " " +result.rtnList[0].street;
            html += "</span>";
            html += "<button type='button' class='road' onClick='goFind(\""+result.rtnList[0].agencyNm+"\", \""+result.rtnList[0].posX+"\", \""+result.rtnList[0].posY+"\");'><b>길찾기</b><span></span></button>";
			$("#agencyAddr").html(html);

            // 전화번호
			$("#agencyTel").text(phoneFomat(result.rtnList[0].telNo));

            // 영업시간
			$("#agencyBizTime").text(result.rtnList[0].agencyBizTime);

            // 취급품목
			html = "";
			html += "        <div class='state inline'>";
			html += "            <img src='/img/common/state_ico02.png'  alt='타이어'/>";
			html += "            <span>타이어</span>";
			html += "        </div>";
			if(result.rtnList[0].chYn == "Y") {
				html += "        <div class='state inline'>";
				html += "            <img src='/img/common/state_ico01.png'  alt='추천'/>";
				html += "            <span>추천</span>";
				html += "        </div>";
			}
			if(result.rtnList[0].cwYn == "Y") {
				html += "        <div class='state inline'>";
				html += "            <img src='/img/common/state_ico05.png'  alt='세차'/>";
				html += "            <span>세차</span>";
				html += "        </div>";
			}
			if(result.rtnList[0].fmYn == "Y") {
				html += "        <div class='state inline'>";
				html += "            <img src='/img/common/state_ico05.png'  alt='1급정비'/>";
				html += "            <span>1급정비</span>";
				html += "        </div>";
			}
			if(result.rtnList[0].lmYn == "Y") {
				html += "        <div class='state inline'>";
				html += "            <img src='/img/common/state_ico03.png'  alt='경정비'/>";
				html += "            <span>경정비</span>";
				html += "        </div>";
			}
			if(result.rtnList[0].seasonGbn == "02") {
				html += "        <div class='state inline'>";
				html += "            <img src='/img/common/state_ico04.png'  alt='겨울용'/>";
				html += "            <span>겨울용</span>";
				html += "        </div>";
			}
            $("#agencyWkTp").html(html);


            // 탈착기
            if (!ValidUtil.isEmpty(result.rtnList[0].desorptNm)){
	            html = "";
	            html +="<span>"+result.rtnList[0].desorptNm+"</span>";
	            $("#agencyOpt1").html(html);
            }

            // 얼라이먼트
            if (!ValidUtil.isEmpty(result.rtnList[0].alignNm)){
	            html = "";
	            html +="<span>"+result.rtnList[0].alignNm+"</span>";
	            $("#agencyOpt2").html(html);
            }

            // 밸런스
            if (!ValidUtil.isEmpty(result.rtnList[0].balanceNm)){
	            html = "";
	            html +="<span>"+result.rtnList[0].balanceNm+"</span>";
	            $("#agencyOpt3").html(html);
            }

            // 이미지
		    html = "";
            for(var j=0; j < result.acyFileList.length; j++) {
	            if (!ValidUtil.isEmpty(result.acyFileList[j].atflPathNm)){
		            html +="<div>";
		            html +="	<img src='<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile_cms/agency/"+result.acyFileList[j].atflPathNm+"' alt='장착점' />";
		            html +="</div>";
	            }
            }

            if (result.acyFileList.length == 0) {
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

		    $('.swiper-store1').slick({
				infinite: false,
				arrows: true,
				slidesToShow: 2,
				slidesToScroll:1,
				nextArrow: '<i class="nextArrow"></i>',
				prevArrow: '<i class="prevArrow"></i>',
			});

			/* var $swiper_store = $('.swiper-store');
			$swiper_store.slick(); */

			positionsPop = [];
            var obj = {
            		title	: result.rtnList[0].agencyNm,
            		addr 	: result.rtnList[0].city + " " +result.rtnList[0].street,
            		lat		: result.rtnList[0].posX,
            		lon		: result.rtnList[0].posY,
            		agencyCd		: result.rtnList[0].agencyCd
            };
            positionsPop.push(obj);
            mapTargetDiv = "mapDivPopup";
            mapDrawPop(result.rtnList[0].posY , result.rtnList[0].posX, result.rtnList[0].agencyNm , positionsPop, "mapDivPopup");

            //getRentStore(result.rtnList[0].posX,result.rtnList[0].posY);

            $("#modal-Shop").removeClass("md-show");
			$("#modalAgencyDetl").addClass("md-show");
		}
	}
}


function etcMsgClick(obj) {
	if($(obj).val() == "03") {
		$("#etcMsgTxt").show();
	} else {
		$("#etcMsgTxt").hide();
	}
}

function btn_TireSizeTip() {
	$("#tireSizeTip1").addClass("md-show");
}

function fn_Tipclose() {
	$("#tireSizeTip1").removeClass("md-show");
}

function validationCarNo(){
	if(!ValidUtil.isEmpty($("#carNoTxt").val())) {
		//차량번호 패턴
		var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 12저3456
		var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
		var pattern3       	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 12저3456

		// 차량번호
		var carNoVal 		= $("#carNoTxt").val();
		// 차량번호 길이
		var carNoValLen 	= carNoVal.length;

		// 차량번호 확인 - [7자리]
		if( carNoValLen == 7 ){
			if( !pattern1.test(carNoVal) ){
				alert( "차량번호를 확인하세요.");
				$("#carNoTxt").val("");
				document.order_info.carNumber.focus();
				return;
			}
		}
		// 차량번호 확인 - [8,9자리]
		else if( carNoValLen == 8 || carNoValLen == 9){
			if( !pattern2.test(carNoVal) &&  !pattern3.test(carNoVal) ){
				alert( "차량번호를 확인하세요.");
				$("#carNoTxt").val("");
				document.order_info.carNumber.focus();
				return;
			}
		}else{
			alert( "차량번호를 확인하세요.");
			$("#carNoTxt").val("");
			document.order_info.carNumber.focus();
			return;
		}
	}
}

//픽업 딜리버리 주소 체크
function chkPickAndDlvyAddr(addr) {
	var pickUpAddr = "";
	var dlvyAddr = "";

	if(!ValidUtil.isEmpty($("#addrTxtP1").val()) && !ValidUtil.isEmpty($("#addrTxtP2").val())) {
		//픽업 주소 선택시
		if(jusoGbn == "P1") {
			pickUpAddr = addr.split(" ");
			dlvyAddr = $("#inst2Addr1").val().split(" ");
		}
		//딜리버리 선택시
		else if(jusoGbn == "P2"){
			pickUpAddr = $("#inst1Addr1").val().split(" ");
			dlvyAddr = addr.split(" ");
		}

		//픽업 주소 = 딜리버리 주소가 같아야 한다.(첫 번째, 두 번째 단어가 같아야 한다.)
		if((pickUpAddr[0] == dlvyAddr[0]) && (pickUpAddr[1] == dlvyAddr[1])) {
			return true;
		} else {
			return false;
		}
	} else {
		return true;
	}
}

$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg order-write'></div>");
	/* page background image End */

	//등록비 세팅
	changeRegiAmt("${rentalProd.regiAmt}");

	//달력 한글화
	$.datepicker.setDefaults($.datepicker.regional["ko"]);

	//결제수단 타입 선택 시
	$("input[name=rtPayMtd]").change(function (){
		payTypeUi();
	});

	// 초기 이메일 값 확인
	if("${userVo.ordrEmail2}" != ""){
		$('#ordrEmail2').parent().addClass('readonly');
		$('#emailInpArt').hide();
	}

	//결제수단 체크 값에 따른 화면 컨트롤
	payTypeUi();

	//page
	$("#pageNo").val(1);

	//얼라인먼트 서비스를 신청한 경우 초기값 + 화면
	//자유렌탈일때
	if($("input[name='prdtGrp']").val() == "01" && $("input[name='prdtGrpDtl']").val() == "04") {
		if(!ValidUtil.isEmpty($("input[name='selArAmt']").val()) && Number($("input[name='selArAmt']").val()) != 0) {
			alignServiceYn = "Y";
			//noPickUpAlign은 사용안함.
			//$("#noPickUpAlign").show();
			//$("#pickUpAlign").show();
			$("#giveCpnPick").prop("checked", true);
			//$("#pickUpAlignTxt").show();
		}
	} else {
		if($("#rentArYn").val() == "Y") {
			alignServiceYn = "Y";
			//noPickUpAlign은 사용안함.
			//$("#noPickUpAlign").show();
			//$("#pickUpAlign").show();
			$("#giveCpnPick").prop("checked", true);
			//$("#pickUpAlignTxt").show();
		}
	}

	//장착 서비스 변경 시
    $("input[name='instCd']").on("click" , function(){
    	$("#inst1Poscd").val("");
		$("#inst1Addr1").val("");
		$("#inst1Addr2").val("");
		$("#inst2Poscd").val("");
		$("#inst2Addr1").val("");
		$("#inst2Addr2").val("");

    	if($(this).val() == "10") {
    		//방문
    		$("#noPickUp").show();
    		//$("#noPickUpAlign").hide();
    		$("#pickUp").hide();
    		$("#junmun").hide();

    		$(".amPmChk").show();//오전 오후 체크
    		$(".timePick").show();//장착희망일시 블럭

    		//일자,시간 텍스트 변경
    		$("#istDtTxt").text("장착일자");
    		$("#istTmTxt").text("장착시간");
    	} else if($(this).val() == "20") {
			//픽업
    		$("#noPickUp").hide();
    		//$("#noPickUpAlign").hide();
    		$("#pickUp").show();
    		$("#junmun").hide();

    		$(".amPmChk").show();//오전 오후 체크
    		$(".timePick").show();//장착희망일시 블럭

    		//일자,시간 텍스트 변경
    		$("#istDtTxt").text("차량 픽업일자");
    		$("#istTmTxt").text("차량 픽업시간");
    	} else if($(this).val() == "40") {
    		//전문
    		$("#noPickUp").hide();
    		//$("#noPickUpAlign").hide();
    		$("#pickUp").hide();
    		$("#junmun").show();

    		$(".amPmChk").hide();//오전 오후 체크
    		$(".timePick").hide();//장착희망일시 블럭

    		//일자,시간 텍스트 변경
    		$("#istDtTxt").text("장착일자");
    		$("#istTmTxt").text("장착시간");

    		jusoGbn = "";
    	}

    	//장착유형 클릭시 얼라인먼트 값 세팅 + 화면
		$("input[name='alignRd']").prop('checked', false);
		$("#pickUpAlign").hide();
		$("#giveCpnPick").prop("checked", true);

    	//내용 초기화
    	initDetailInfo();

    	mountCheck = $(this).val();
    	$('#datepicker11').datepicker("destroy");

    	//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    	
    	//캘린더 닫기
    	runEffect(false);
		$("#mountAlertTxt").hide();	//장착 유형 안내문구 닫기
    });

    /* 얼라이먼트 정비 서비스 변경 시
  	 * 렌탈 화면에서 얼라이먼트는 선택이 불가(화면에서 hidden)
  	 * 상품상세에서 얼라인먼트 신청시 활성화 (수정일 : 2020.12.10)
  	 */
  	$("input[name='alignRd']").on("click" , function(){
    	if($(this).val() == "Y" && $("input[name='instCd']:checked").val() == "10") {
    		var msg = "장착일 당일 얼라인먼트 교정을 받지 않으실 경우<br>";
		    msg += "타이어 조기마모 보증 대상에서는 제외됩니다.<br><br>";
		    msg += "조기마모 보증을 받으시길 원하시면<br>";
		    msg += "다른 장착 유형을 선택하시거나,<br>";
		    msg += "장착 완료 후 전문점에 내방하시어<br>";
		    msg += "얼라인먼트 교정을 받으셔야 합니다.";
			ComUtil.alert(msg);
			$(this).prop("checked", true);

    		return false;
    	}

  		//오전 오후 초기화
    	$("input[name='timeRd']").prop('checked', false);

		//장착 희망시간 초기화
		$("#amArea").hide();
		$("#pmArea").hide();

    	//$('#datepicker11').datepicker("destroy");

    	//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });

  	//장착점
    $("div[name='selectAddr']").on("click" , function(){
    	mountCheck1 = $(this).attr("val");
    });

	//방문장착 - 오전,오후 선택시
	//장착 서비스 변경 시
    $("input[name='timeRd']").on("click" , function(){
    	var mountCd = $("input[name='instCd']:checked").val();//장착구분

    	//function 호출 - 시간을 뿌려주는 function
    	if(ValidUtil.isEmpty($("#datepicker11").val())) {
    		ComUtil.alert("장착희망일을 선택해 주세요.");
    		return false;
    	}

    	if(mountCd == "20") {
    		if(ValidUtil.isEmpty($("#addrTxtP2").val())) {
	    		ComUtil.alert("딜리버리 주소를 입력해 주세요.");
	    		return false;
	    	}
    	}

    	//오전 오후를 선택하면 전체 시간을 닫고 시작한다.
    	$("#amArea span, #pmArea span").addClass("off");
    	$("#amArea span, #pmArea span").removeClass("on");
    	$("#amArea span, #pmArea span").removeAttr("schedule");
    	$("#amArea span, #pmArea span").removeAttr("centerSchedule");

    	if($(this).val() == "AM") {
    		$("#amArea").show();
    		$("#pmArea").hide();
    	} else {
    		$("#pmArea").show();
    		$("#amArea").hide();
    	}
   		$("#amPmGbn").val($(this).val());

    	if(mountCd == "40") {
    		getShopTimeList();//전문점 장착용
    	} else {
   			getTimeList();
    	}

    	//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });

    $('.js-accordion > .accordion').next('.accordion-info.step1').toggle();
	$('.js-accordion > .accordion').next('.accordion-info.inset-ml').toggle();	//주문자정보,장착서비스정보,결제정보 열어두기(24.8.13 권형태 선임)

    $("#amArea span, #pmArea span").on("click" , function(e){
    	if($("[name='instCd']:checked")[0].id=="ser3") return false;
    	getMountTime = ($(e.target).attr("id").replace("time",""));
    	var jobEndTime = getJobEndTime($(e.target).attr("schedule"));
    	$("#jobEndTimeMsg").attr("style","display:block;");
    	$("#jobEndTimeMsg span").html("<i class='ico11'></i>종료예정시간: "+jobEndTime);
    });

 // 픽업&딜리버리 픽업주소 동일
    $("#pickUpAddrCopy").click(function() {
   		if($(this).is(":checked")) {
    		$("input[name='pickUpAddrCopy']").prop("checked" , true);
        	var addr1 = $("#popLoadAddr").text();
    		var addr2 = $("#popDetailAddr").val();

        	if($("#addrTxtP1").val() == "") {
        		ComUtil.alert("픽업주소를 먼저 검색해주세요.");
        		return false;
        	} else {
        		$("#addrTxtP2").val(addr1 + " " +addr2);
				$("#iplAddr").val(addr1);
				$("#iplDtlAddr").val(addr2);
				$("#iplZip").val($("#popZipCode").text());

				$("#dlvyCity").val($("#city").val());
				$("#dlvyCounty").val($("#county").val());
				$("#dlvyDong").val($("#dong").val());
        	}
        } else {
        	$("input[name='pickUpAddrCopy']").prop("checked" , false);

        	$("#addrTxtP2").val("");
			$("#iplAddr").val("");
			$("#iplDtlAddr").val("");
			$("#iplZip").val("");
        }
    });

    $(document).on("click", "#nmClick", function() {
    	var lon= $(this).attr('data-lon');
    	var lat= $(this).attr('data-lat');
    	var num= $(this).attr('data-num');
    	var nmBpcd= $(this).attr('data-bpcd');
    	
    	moveStore(lat, lon, nmBpcd, num);
		
    });

	//자동이체동의 css 에 disabled 코딩이 걸려있어서, disabled 를 제거하고 클릭해제를 못하도록 변경함.
    $("input[name='rtCardAgree']").on("click" , function(){
		$("input[name='rtCardAgree']").prop('checked', true);
    });
    
});

//작업종료시간을 구한다.
var getJobEndTime = function(scheduleObjStr){
	//var mountTime = $("#amArea span.on, #pmArea span.on").text().replace(":","");
	var mountTime = getMountTime;
	var resultDataBestList = JSON.parse(resultDataBestObj);
	var SltTourJStr = "";						//선택한 시간 스케쥴
	var SvcTp = $("#mountCd").val();			//장착코드
	var SvcTpCd = "";							//장착코드
	var TrgTMSOrdID = $("#ordId").val();		//채번한 주문아이디
	var selectedTime = "";
	var scheduleObjList = null;
	var jobEndTime = "";
		if(resultDataBestList != undefined){
        	for(var idx in resultDataBestList){
        		if(resultDataBestList[idx].selectedTime == mountTime){
        			SltTourJStr = JSON.stringify(resultDataBestList[idx].vehicleScheduleList);
        			SltTourJStr='{\"vehicleScheduleList\":' + SltTourJStr + '}';
        		}
        	}
      	}

   		if(SvcTp == "10"){
   			SvcTpCd = "Visit";
    	}else if(SvcTp == "20"){
     		SvcTpCd = "PnD";
     	}

	var param = {"SvcTpCd": SvcTpCd, "SltTourJStr": SltTourJStr, "TrgTMSOrdID": TrgTMSOrdID};

	//yjw serverMode 제거(20220225)
	var JobEndTimeTMS2 = "/order/JobEndTimeTMS2";

	$.ajax({
        type: "post",
        url: JobEndTimeTMS2,
        data: param,
        async:false,
        //contentType:"application/json;charset=UTF-8",
        success: function (data){
        	if(data.eptWtkTm != null){
        		jobEndTime = data.eptWtkTm.slice(data.eptWtkTm.length-5, data.eptWtkTm.length);
        	}else{
        		console.error("데이터 없음");
        	}
        },
        error: function(error){
        	console.log("error:",error);
        }
    });

	return jobEndTime;
}

function chgFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '' + month + '' + day;
}

//두개의 날짜를 비교하여 차이를 알려준다.
function dateDiff(dt1, dt2) {
    var diffDate_1 = new Date(dt1.substring(0,4) + "-" + dt1.substring(4,6) + "-" + dt1.substring(6,8));
    var diffDate_2 = new Date(dt2.substring(0,4) + "-" + dt2.substring(4,6) + "-" + dt2.substring(6,8));

    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));

    return diff;
}

//RDC 시작일을 구한다.
function fn_deleteRdcDt() {
	var tDday = new Date();
	var rdcStartList = [];
	var chkSunday = false;
	var rtnStr = "+";

	//거점재고일 중 일요일이 있으면 +1일을 더해준다. 오늘, 오늘+첫번째, 오늘 + 두번째 날 = 거점재고일
	for(var j=0; j<15; j++) {
		var pushDay = true;
		var chkDay = new Date();
		chkDay.setDate(chkDay.getDate() + j);

		//일요일 찾기
		if(chkDay.getDay() == 0) {
			pushDay = false;
		}

		//휴일 찾기
		if($.inArray(chgFormatDate(chkDay) , storechkDay) != -1) {
			pushDay = false;
		}

		if(pushDay == true) {
			rdcStartList.push(chgFormatDate(chkDay));
		}
	}

	//오늘과 RDC 시작의 날짜 차이 구하기
	var plusDay = dateDiff(chgFormatDate(tDday), rdcStartList[3]);

	rtnStr += plusDay + "d";

	return rtnStr;
}

/*차량 한글과 숫자만 입력 가능 */
function fn_press_nice(obj)
{

	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
		    || event.keyCode == 46 ) return;
	obj.value = obj.value.replace(/[^0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');

}

//차량번호 입력시 공백제거
function SchNullKey(){
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if(evt_code == 32){
	    event.preventDefault();
	}
}


/* 240509 백인천: 달력 div 이펙트 - ST */
var cldFlag = false;

$("#datepicker11").on("click", function(){
	runEffect(true);
})

function runEffect(flag) {
	// 무조건 주소가 먼저 있어야 함
	var addrText = $("#addrTxtB").val() + $("#addrTxtP1").val() + $("#addrTxtP2").val() + $("#addrTxtJ").val();
	
	if(addrText != "") {
		if(cldFlag != flag) {
			// Run the effect
			if(flag) {
				$("#datepicker_acdn").show();
			} else {
				$("#datepicker_acdn").hide();
			}
			callback();
			cldFlag = flag;
		}
	} else {
		$("#datepicker_acdn").hide();
		callback();
		cldFlag = false;
	}
}

function callback() {
	var nowm = new Date();
	$("#datepicker_acdn").datepicker("setDate", nowm);
}

// 초기 css 구성 관련 설정
function dpCssCustom() {
	$(".ui-datepicker-trigger").css("display", "none");

	var btnYn = document.querySelector('.close_btn');
	if(!btnYn) {
        var closeDp = document.createElement("a");
        closeDp.setAttribute("class", "close_btn btnFade btnPurple");
        closeDp.setAttribute("onclick", "runEffect(false)");
        closeDp.innerText = "닫기";
        
        $("#datepicker_acdn").prepend(closeDp);
	}
}
/* 240509 백인천: 달력 div 이펙트 - ED */
</script>