<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import = "java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.text.DecimalFormat"%>
<%@ page import = "javax.net.ssl.TrustManager" %>
<%@ page import = "javax.net.ssl.HostnameVerifier" %>
<%@ page import = "javax.net.ssl.HttpsURLConnection" %>
<%@ page import = "javax.net.ssl.SSLContext" %>
<%@ page import = "javax.net.ssl.SSLSession" %>
<%@ page import = "javax.net.ssl.X509TrustManager" %>
<%@ page import = "java.security.cert.X509Certificate" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
%>
<!-- <script type="text/javascript" src="/js/common_ui.js"></script> -->
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/datepicker-ko.js"></script>
<script type="text/javascript" src="/js/lib/jquery.timepicker.min.js"></script>

	<!-- 다음 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>

			<!--subContentsWrap-->
<form name="submitParam" method="post" enctype="multipart/form-data" onSubmit="return false;">

	<input type="hidden" name="userId" value="${userVo.loginId}"/>
	<input type="hidden" name="ordNo" 		id="ordNo"/>
	<input type="hidden" name="cancelType" 	id="cancelType"/>
	<input type="hidden" name="custNo" 		id="custNo" value="${custInfo.custNo }"/>
	<input type="hidden" name="servCnt" 	id="servCnt"/>
	<input type="hidden" name="homePosNo" 	id="homePosNo" value="${custInfo.posNo}"/>
	<input type="hidden" name="homeAddr1" 	id="homeAddr1" value="${custInfo.addr1}"/>
	<input type="hidden" name="homeAddr2"  	id="homeAddr2" value="${custInfo.addr2}"/>
	<input type="hidden" name="insertAddr1" id="insertAddr1"/>
	<input type="hidden" name="insertAddr2" id="insertAddr2"/>
	<input type="hidden" name="insertAddr3" id="insertAddr3"/>

	<input type="hidden" id="carMn" 		name="carMn" />
	<input type="hidden" id="carNm" 		name="carNm" />
	<input type="hidden" id="carNo" 		name="carNo" />
	<input type="hidden" id="matCd" 		name="matCd" />
	<input type="hidden" id="matCd11" 		name="matCd11" />
	<input type="hidden" name="smsMsg" 		id="smsMsg" />

	<!-- API추가 때문에 더 추가됨. 20191212 -->
	<!-- 방문장착 -->
	<input type="hidden" id="visZip" 		name="visZip" />
	<input type="hidden" id="visAddr1" 		name="visAddr1" />
	<input type="hidden" id="visAddr2" 		name="visAddr2" />

	<!-- 픽업앤 딜리버리 -->
	<input type="hidden" id="pickZip" 		name="pickZip" />
	<input type="hidden" id="pickAddr1" 	name="pickAddr1" />
	<input type="hidden" id="pickAddr2" 	name="pickAddr2" />
	<input type="hidden" id="deliZip" 		name="deliZip" />
	<input type="hidden" id="deliAddr1" 	name="deliAddr1"/>
	<input type="hidden" id="deliAddr2" 	name="deliAddr2"/>

	<!-- 전문점장착 -->
	<input type="hidden" id="centZip" 		name="centZip" />
	<input type="hidden" id="centAddr1" 	name="centAddr1"/>
	<input type="hidden" id="centAddr2" 	name="centAddr2"/>
	
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
	<input type="hidden" name="alignYn" id="alignYn"	value="N"/>
	<input type="hidden" name="instTm" id="instTm"	value=""/>
	<input type="hidden" name="orgzCd" id="orgzCd"	value=""/>
	<input type="hidden" name="rentalShopYn" id="rentalShopYn"	value=""/>
	
	<input type="hidden" name="pageNo" id="pageNo" value="1">
	<input type="hidden" name="pageSize"	id="pageSize" 	value="5" />		<!-- 페이지에 표시할 수 -->

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header">
            	<h2 class="title-deco">
              		<!-- 배경화면(png)에 멘트가 이미  박혀있어서 일단 텍스트 제거 -->
              		<span></span> <span></span>
            	</h2>
            	<h3 class="title-deco-sub">걱정제로 서비스 신청</h3>
          	</div>
          	<!-- //header -->

          	<div class="order-middle-message text-center">
            	<p>고객님께서 직접 걱정제로 서비스 신청 및 신청내역을 조회할 수 있습니다</p>
          	</div>

			<c:choose>
				<c:when test="${fn:length(zeroServiceInsertList) > 0}">
    				<c:forEach var="data" items="${zeroServiceInsertList}" varStatus="status">

          	<div class="mynexen-payment-product bg">
            	<div class="order-info-summary-wrap">
              		<div class="order-info-summary col-1">
                		<small>계약일 ${data.ordDay}</small>
                		<small>
                			계약번호
                			<a href="javascript:void(0);" onClick="fn_Write('${data.ordNo}','${data.makerNm}','${data.modelNm}','${data.carNo}','${data.custNo}','${data.servCnt0}','${data.dlvStat}','${data.matCd}','${data.matNm}'); event.preventDefault();"><font color="blue">${data.ordNo}</font></a>
                			&nbsp;<font color="red">${data.dlvstatNm}</font>
                		</small>
              		</div>
            	</div>

            	<!-- 구매 상품 -->
            	<article class="order-single inset-m layout-c" onClick="fn_Write('${data.ordNo}','${data.makerNm}','${data.modelNm}','${data.carNo}','${data.custNo}','${data.servCnt0}','${data.dlvStat}','${data.matCd}','${data.matNm}'); event.preventDefault();">
                	<div class="layout-r same-size">
                    	<div class="inlnie align-bottom">
                      		<div class="order-data-photo">
                        		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${data.listImg}" alt="타이어 사진">
                      		</div>
                    	</div>
                    	<div class="inlnie border-bottom order-box">
                      		<div class="order-data-title">
                        		<h3>${data.patternCd}</h3>
                      		</div>
                      		<div class="order-product-info">
                        		<ul class="mb-s">
                          			<li><span>${data.matNm}</span></li>
                          			<li><span>${data.makerNm}</span><span>${data.modelNm}</span></li>
                        		</ul>
                      		</div>
                    	</div>
                  	</div>

                  	<div class="layout-c mt-m">
                    	<div class="layout-r inline-s order-rent">
                      		<div class="order-count inline align-middle">
                        		<b class="align-middle">수량</b> <span>${data.cntCd}</span>
                      		</div>
                      		<div class="order-rent-info">
                        		<dl class="layout-r">
                          			<dt>렌탈기간</dt>
                          			<dd>월 렌탈료</dd>
                          			<dd><fmt:formatNumber value="${data.sumMonAmt}" pattern="#,###" /></dd>
                        		</dl>
                        		<dl class="layout-r">
                          			<dt><b>${data.periodCd}개월</b></dt>
                          			<dd>렌탈 등록비</dd>
                          			<dd><fmt:formatNumber value="${data.regiAmt}" pattern="#,###" /></dd>
                        		</dl>
                      		</div>
                    	</div>
                  	</div>
                </article>
            	<!-- //구매 상품 -->

            	<div class="pt-0 inset-m text-right">
              		장착일 ${data.procDay}
            	</div>

            	<input type="hidden" name="${data.ordNo}_periodCd" id="${data.ordNo}_periodCd"  value="${data.periodCd}" />
			    <input type="hidden" name="${data.ordNo}_procDay"  id="${data.ordNo}_procDay" value="${data.procDay}" />
          	</div>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
          			<div class="mynexen-payment-product">
            			<div class="order-info-summary-wrap">
            				<div>조회된 목록이 없습니다.</div>
            			</div>
            		</div>
          		</c:otherwise>
          	</c:choose>

          	<div class="product-sub-info rental accordion-box js-accordion">
            	<!-- 00 -->
            	<div class="accordion">
              		<h3>계약 정보</h3>
            	</div>
            	<div class="accordion-info inset-ml">
              		<div class="submit layout-c mb-m border-bottom">
                		<p class="black">계약번호</p>
                		<p class="pt-s pb-s" name="ordNo1" id="ordNo1" class="type03"></p>
              		</div>
              		<div class="submit layout-c mb-m border-bottom">
                		<p class="black">휴대전화</p>
                		<p class="pt-s pb-s">${custInfo.phone1}-${custInfo.phone2}-${custInfo.phone3}</p>
                		<input type="hidden" name="" class="type03" id="phone01" disabled="disabled" title="휴대폰 번호 입력란" value="${custInfo.phone1}-${custInfo.phone2}-${custInfo.phone3}">
                		<input type="hidden" name="phone1" id="phone1" value="${custInfo.phone1}">
						<input type="hidden" name="phone2" id="phone2" value="${custInfo.phone2}" />
						<input type="hidden" name="phone3" id="phone3" value="${custInfo.phone3}" />
              		</div>
              		<div class="submit layout-c mb-m border-bottom">
                		<p class="black">주문자/아이디</p>
                		<p class="pt-s pb-s">${custInfo.custNm} / ${custInfo.custId}</p>
                		<input type="hidden" name="custInfo" id="custInfo" class="type03"  disabled="disabled" title="아이디 입력란" value="${custInfo.custNm} / ${custInfo.custId}">
						<input type="hidden" name="custNm" id="custNm" value="${custInfo.custNm}" />
						<input type="hidden" name="custId" id="custId" value="${custInfo.custId}" />
						<input type="hidden" name="custId" id="custNo" value="${custInfo.custNo}" />
              		</div>
              		<div class="submit layout-c border-bottom">
                		<p class="black">신청 타이어 개수</p>
                		<div class="order-basket">
                  			<select name="KWMENG" id="KWMENG" title="신청 타이어 개수 선택">
                    			<option value="">본수</option>
                    			<c:forEach var="zeroCdList" items="${zeroCdList}" >
									<option value="${zeroCdList.cmmCd}">${zeroCdList.cmmNm}</option>
								</c:forEach>
                  			</select>
                		</div>
              		</div>
              		<div class="rent-footer mt-m">
                		<ul>
                  			<li>무상 제공되는 타이어는 회사사정에 따라 제품이 변경되어 지급될 수 있습니다.</li>
                  			<li>연체중인 계약일 경우 서비스 신청에 제한이 있을 수 있습니다.</li>
                		</ul>
              		</div>
            	</div>
            	<!-- //00 -->

            	<!-- 01 -->
            	<div class="accordion">
              		<h3>장착 서비스 정보</h3>
            	</div>
            	<div class="accordion-info inset-ml">
                	<div class="order-basket">
              			<input type="hidden" name="insStoreCd" 		id="insStoreCd">
                      	<input type="hidden" name="insStoreName" 	id="insStoreName">
                      	<input type="hidden" name="insStoreAddr"	id="insStoreAddr">
                      	<input type="hidden" name="salesGroup" 		id="salesGroup">
                      	<input type="hidden" name="salesOffice" 	id="salesOffice">
						<input type="hidden" name="telNo" 			id="telNo" />
						<input type="hidden" name="smsMsg" 			id="smsMsg" />
						<input type="hidden" name="mountingStat" 	id="mountingStat" value="1010"/><!-- 장착서비스 구분코드 디폴트 방문장착서비스-->

              			<div class="submit">
                			<label for="info01"><span class="essen black">장착 서비스</span></label>
                			<button type="button" class="ml-s popup-guide">이용가이드</button>

                			<!-- js-radio UI -->
                			<div class="conWrap js-radioUI mt-s">
                  				<ul style="width:-webkit-fill-available">
                    				<li class="radio col-2">
                      					<input type="radio" name="mounting" id="ser1" checked="checked" value="10" class="radioChk" title="방문장착서비스 선택">
                      					<label for="ser1"><span>방문 장착 서비스</span></label>
                    				</li>
                    				<li class="radio col-2" style="display:none;">
                      					<input type="radio" name="mounting" id="ser2" value="20" class="radioChk" title="픽업&amp;딜리버리 장착 서비스 선택">
                      					<label for="ser2"><span>픽업&amp;딜리버리 장착 서비스</span></label>
                    				</li>
                    				<li class="radio col-2">
                      					<input type="radio" name="mounting" id="ser3" value="40" class="radioChk" title="전문점 장착 서비스 선택">
                      					<label for="ser3"><span>전문점 장착 서비스</span></label>
                    				</li>
                  				</ul>
                			</div>
                			<!-- //js-radio UI -->
              			</div>

              			<!-- js-radio UI contents -->
              			<!-- ###################################### -->
              			
              			<!-- 방문장착 서비스 -->
              			<input type="hidden" class="md-trigger" data-modal="modal-Addr">

              			<div class="submit" id="noPickUp">
                			<label for="info02"><span class="essen black">장착 주소</span></label>
             				<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="B" onclick="selectJusoPop('B');">
               					<input type="text" class="pl-0 trans-bg" name="addrTxtB" id="addrTxtB" title="주소 입력란" placeholder="장착 받으실 주소" readonly="readonly">
               					<input type="hidden" id="zipCodeB" />
               					<button type="button" class="align-middle btn-address-search02" name="selectAddr" val="B" onclick="javascript:selectJusoPop('B'); return false">검색</button>
             				</div>
             				<p class="validation"><!-- <p class="validation warning"> -->
               					<span id="addrOkB">방문장착 서비스가 가능합니다.</span>
             				</p>
              			</div>
              			<!-- //방문장착 서비스 -->

              			<!-- 픽업,딜리버리 장착 서비스 -->
              			<div class="submit" id="pickUp" style="display: none;">
                			<label for="info03"><span class="essen black">장착 주소</span></label>
                			<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="P1" onclick="selectJusoPop('P1');">
                  				<input type="text" name="addrTxtP1" id="addrTxtP1" class="pl-0 trans-bg" title="주소 입력란" placeholder="픽업주소를 검색하세요" readonly="readonly">
                  				<input type="hidden" id="zipCodeP1" />
                  				<button type="button" name="selectAddr" val="P1" class="align-middle btn-address-search02" onclick="javascript:selectJusoPop('P1'); return false">검색</button>
                			</div>
                			<p class="validation" id="addrOkP1" style="display: none;">
		                		<span ><i class="ico08"></i>픽업 서비스가 가능합니다.</span>
		                	</p>
		                	<p class="validation warning" id="PicAlertTxt" style="display: none;">
		                  		<span>픽업 서비스가 불가능합니다.</span>
		                	</p>
                			
                			<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="P2" onclick="selectJusoPop('P2');">
                  				<input type="text" name="addrTxtP2" id="addrTxtP2" class="pl-0 trans-bg" title="주소 입력란" placeholder="딜리버리 주소를 검색하세요" readonly="readonly">
                  				<input type="hidden" id="zipCodeP2" />
                  				<button type="button" name="selectAddr" val="P2" class="align-middle btn-address-search02" onclick="javascript:selectJusoPop('P2'); return false">검색</button>
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
              			<div class="submit" id="junmun" style="display: none;">
                			<label for="info05"><span class="essen black">장착 주소</span></label>
             				<div class="shop-info">
               					<!-- <span>르노삼성자동차지정정비코너용강</span> -->
             				</div>
             				<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="J" onclick="callMap('1');">
               					<input type="text" class="pl-0 trans-bg" id="addrTxtJ" title="주소 입력란" placeholder="전문점찾기" readonly="readonly">
               					<input type="hidden" id="zipCodeJ" />
               					<button type="button" name="selectAddr" val="J" class="align-middle btn-address-search02 md-trigger">검색</button>
             				</div>
             				<p class="validation">
             					<span id="addrOkJ">입력주신 장소로 방문하여 장착 서비스 진행이 가능합니다.</span>
             				</p>
              			</div>
              			<!-- //전문점 장착 서비스 -->
              			<!-- ###################################### -->
              			<!-- //js-radio UI contents -->

						<!-- 장착일시 시간 -->
              			<div class="submit">
                			<label for="datepicker"><span class="essen black">장착일자</span></label>
                			<div class="conWrap mb-s">
                  				<div class="dateTime layout-r same-size border-bottom">
                    				<div class="inline" style="width:55%">
                      					<input type="text" name="datepicker" id="datepicker11" title="장착 희망일시 입력란" readonly="readonly" style="width:70%;">
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
              			
              			<!-- 장착 희망시간  -->
						<div class="submit list timePick">
		              		<label for="time"><span class="essen black">장착시간</span></label>
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
	                            <span><i class="ico11"></i>종료예정시간</span>
	                        </p>
						</div>
		              	<!-- //장착 희망시간 -->

              			<div class="submit">
                			<label for="carNum"><span class="essen black">배송시 요청사항</span></label>
                			<div class="conWrap mb-s border-bottom">
                  				<input type="text" name="textArea" class="pl-0" id="textArea" placeholder="배송시 요청사항을 작성해 주세요." onkeyup="document.getElementById('messagebyte').innerHTML=fn_chkByte(this,2000);">
                			</div>
                			<p class="validation type04">
                  				<span id="messagebyte"><i class="ico11"></i>0/2000 Byte</span>
                			</p>
              			</div>

              			<div class="submit border-bottom">
                			<div class="pb-s border-bottom">
                  				<div class="check">
                    				<input type="checkbox" id="allAgree" value="0" class="type01">
                    				<label for="allAgree"><span></span><b>아래 내용에 동의합니다.</b></label>
                  				</div>
                			</div>
                			<div class="agree-check">
                  				<div class="check">
                    				<input type="checkbox" id="agree" value="0" class="type01">
                    				<label for="agree" class="layout-r"><span></span><b>걱정제로 서비스의 주문이 접수 중일 때까지는 취소가 가능합니다. (단, 배송 준비중일 경우부터는 취소가 불가능합니다.)</b></label>
                  				</div>
                			</div>
              			</div>
            		</div>
            	</div>
            	<!-- //01 -->
          	</div>

          	<div class="btn-wrap">
	        	<button type="button" class="btn-primary inset-m full-width" onclick="javascript:fn_InsertProc();">신청</button>
	        </div>
		</main>
	</div>
    <!-- //subContentsWrap -->
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
		          		<div class="search-area-wrap-rental inset-m">
		            		<div class="layout-c">
		              			<div class="layout-r inline-m">
		                			<select class="inline border-none" title="시/도 선택" onchange="selectSiGunGu();" id="sido">
		                  				<option value="">시/도 선택</option>
		                  				<c:forEach var="list" items="${selectSiDoList}" varStatus="status">
	                                    	<option value="${list.cdNm }">${list.cdNm }</option>
	                                	</c:forEach>
		                			</select>
		                			<select class="inline border-none" title="시/군/구 선택" id="sigungu">
		                			</select>
		              			</div>
		              			<input type="text" name="meajang" class="pl-0 trans-bg" id="meajang" title="매장명 입력란" placeholder="매장명을 입력해보세요">
		              			<input type="hidden" id="meajangCd">
		            		</div>
		            		<!-- <button type="button" class="go-view full-width inset-s">O2O 서비스 장착 전문점 한눈에 보기</button> -->
		          		</div>
		          		<!-- 찾기 검색 -->

		          		<button type="button" class="search-shop on" onclick="javascript:selectStore(1); return false;"><span></span>전문점 찾기</button>

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
		      	<div class="position on">
		        	<div class="shop-search-result">
		          		<ul id="storeList"></ul>
	       			</div>
	       			<div class="pagingFooter">
                     	<div class="paging" id="pagingMap" style="display:none;"></div>
                    </div>
	     		</div>
	   		</div>
	   		<!-- LIST -->
	 		</div>
	</div>
	<!-- //전문점 찾기 -->

<form name="jusoFrm" id="jusoFrm" method="post" >
	<input type="hidden" name="currentPage" id="currentPage" value="1"/>
	<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
	<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
	<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
	<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
	<input type="hidden" name="keyword" id="keyword" />
</form>


<script type="text/javascript">

var jusoGbn = "";
var dblClick = 0;
var mountCheck1 = "";
var moveDate = "present";//present(현재),next(다음달)
var myLat = 37.57001757231217; //나의 위치 위도 (기본 위치)
var myLon = 126.827499331455; //나의 위치 경도 (기본 위치)
var savedPositions = [];

$( document ).ready(function() {

	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-worryzero'></div>");
	/* page background image End */

	//장착 서비스 변경 시
    $("input[name='mounting']").on("click" , function(){
    	//console.log($(this).val());
    	if($(this).val() == "10") {
    		//방문
    		$("#noPickUp").show();
    		$("#pickUp").hide();
    		$("#junmun").hide();
    		$('#mountingStat').val('1010');
    		$(".amPmChk").show();//오전 오후 체크
    		$(".timePick").show();//장착희망일시 블럭
    	} else if($(this).val() == "20") {
			//픽업
    		$("#noPickUp").hide();
    		$("#pickUp").show();
    		$("#junmun").hide();
    		$('#mountingStat').val('1020');
    		$(".amPmChk").show();//오전 오후 체크
    		$(".timePick").show();//장착희망일시 블럭
    	} else if($(this).val() == "40") {
    		//전문
    		$("#noPickUp").hide();
    		$("#pickUp").hide();
    		$("#junmun").show();
    		$('#mountingStat').val('1030');
    		$(".amPmChk").hide();//오전 오후 체크
    		$(".timePick").hide();//장착희망일시 블럭
    	}

    	//내용 초기화
    	initDetailInfo();
    	
    	mountCheck = $(this).val();
    	//datepicker 이미지 지우기
    	$('#datepicker11').datepicker("destroy");
    	
    	//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });
	
  	//방문장착 - 오전,오후 선택시
	//장착 서비스 변경 시
    $("input[name='timeRd']").on("click" , function(){
    	var mountCd = $("input[name='mounting']:checked").val();//장착구분
    	
    	//function 호출 - 시간을 뿌려주는 function
    	if(ValidUtil.isEmpty($("#datepicker11").val())) {
    		ComUtil.alert("장착희망일을 선택해 주세요.");
    		return false;
    	}
    	
    	if(mountCd == "20") {
    		if(ValidUtil.isEmpty($("#inst2Addr1").val())) {
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

  	//장착점
    $("button[name='selectAddr']").on("click" , function(){
    	mountCheck1 = $(this).attr("val");
    });

    /* $('#textArea').keyup(function (e){
        var content = $(this).val();
        $('#messagebyte').html(content.length + "/2000 Byte");
    });
    $('#textArea').keyup(); */

    $('#allAgree, #agree').on("click" , function(){
		if($(this).is(":checked")) {
			$("#allAgree").prop("checked" , true);
			$("#agree").prop("checked" , true);
		}else{
			$("#allAgree").prop("checked" , false);
			$("#agree").prop("checked" , false);
		}
    });
    
    $("#amArea span, #pmArea span").on("click" , function(e){
    	if($("[name='mounting']:checked")[0].id=="ser3") return false;
    	
    	var jobEndTime = getJobEndTime($(e.target).attr("schedule"));
    	$("#jobEndTimeMsg").attr("style","display:block;");
    	$("#jobEndTimeMsg span").html("<i class='ico11'></i>종료예정시간: "+jobEndTime);
    });
});

//작업종료시간을 구한다.
var getJobEndTime = function(scheduleObjStr){
	var jobEndTime = "";
	var scheduleObjList = null;
	try{
		//방문장착 및 P&D
		if(scheduleObjStr != undefined){
			scheduleObjList = JSON.parse(scheduleObjStr);
			for(var idx in scheduleObjList){
				if(scheduleObjList[idx].vehicleList != undefined){
					for(var idx2 in scheduleObjList[idx].vehicleList){
						if(scheduleObjList[idx].vehicleList[idx2].division == "new")
							jobEndTime = scheduleObjList[idx].vehicleList[idx2].jobEndTime;
					}
				}
			}
			jobEndTime = jobEndTime.split(" ")[1] || "";
		}
	}catch(e){
		console.error(e.message);
	}finally{
		return jobEndTime;
	}
}

//글자수 세기 keyon
function fn_chkByte(inTexts, textMax){
	
	var lsStr = inTexts.value; 
	var liStrLen = lsStr.length; 		//전체길이
	
	//변수초기화
	var liMax = textMax; 				//제한할 글자수 크기
	var liByte = 0;   					//한글일경우 2, 그외글자는 1을 더함
	var liLen = 0;    					// substring하기 위해 사용
	var lsOneChar = "";  				//한글자씩 검사
	var lsStr2 = "";      				//글자수를 초과하면 제한한 글자전까지만 보여줌.
	
	for(i=0; i< liStrLen; i++){
		lsOneChar = lsStr.charAt(i); //한글자 추출
		
		if(escape(lsOneChar).length > 4){ 
			liByte +=3;   				//한글이면 3를 더한다
		}else{
			liByte++;     				//한글아니면 1을 다한다
		}
		  
		if(liByte <= liMax){
			liLen = i + 1;
		}
	}
	
	if(liByte > liMax){
		lsStr2 = lsStr.substr(0, liLen);
		inTexts.value = lsStr2;
	}
	
	return liByte+"/2000 Byte";
}

//주소 선택 팝업
function selectJusoPop(gbn){
	$("#jusoTxt").val("");
	$("#totalCount").text("");
	$("#jusoList").html("");
	$("#paging").html("")

	if(ValidUtil.isEmpty($("#KWMENG").val())){
		ComUtil.alert("신청 타이어개수를 선택해주세요.");
		return false;
	} else if(ValidUtil.isEmpty($("#ordNo1").text())) {
		ComUtil.alert("상단의 계약번호를 클릭해 주세요.");
		return;
	}
	
	if(gbn == "A" || gbn == "P2") {
		$(".pkLo").hide();
	} else {
		$(".pkLo").show();
	}

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

var mapTargetDiv;

function callMap(gbn) {
	if(ValidUtil.isEmpty($("#KWMENG").val())){
		ComUtil.alert("신청 타이어개수를 선택해주세요.");
		return false;
	} else if(ValidUtil.isEmpty($("#ordNo1").text())) {
		ComUtil.alert("상단의 계약번호를 클릭해 주세요.");
		return false;
	} else {
		$("#modal-Shop").addClass("md-show");
		$("#storeInfo").hide();
	
		//현재 내 위치 또는 고정 좌표로 호출
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
		if(navigator.geolocation) {
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	myLat = position.coords.latitude, // 위도
		    	myLon = position.coords.longitude; // 경도
			});
		}
	
		var positions = [];
		var obj = {
	        			title	: "",
	        			addr 	: "",
	        			lat		: myLat,
	        			lon		: myLon,
	        			};
		positions.push(obj);
		mapTargetDiv = "mapDiv";
		mapDraw(myLon , myLat , "" , positions, "mapDiv", "Y");
		
		//나의 위치 근처 렌탈 전문점 가져오기
		//getRentStore(myLat, myLon);
	}
}

var map = new Object();
var marker = new Object();

//지도 그리기
function mapDraw(lon , lat , bhfNm , positions, mapId, initYn){
	var agencyLat 	= lat; 	//대리점의 위도
	var agencyLon 	= lon; 	//대리점의 경도
	var agencyBhfNm	= bhfNm; 	//대리점의 경도

	if(initYn == "Y") {
    	var mapContainer = document.getElementById(mapId), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(agencyLat, agencyLon), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    	
    	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	    // 마커를 생성합니다
		var imageSrc = "/img/common/map_ico_03.png";
	    var imageSize = new daum.maps.Size(40, 50);
	    for (var i = 0; i < positions.length; i ++) {
	    	marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커를 표시할 위치
	            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : new daum.maps.MarkerImage(imageSrc, imageSize), // 마커 이미지
	            clickable: true
	        });
	    }
    } else {
     	// 마커를 생성합니다
		var imageSrc = "/img/common/icon_pin.png";
	    var imageSize = new daum.maps.Size(50, 50);
	    
	    marker.setMap(null);
	    
	    for (var i = 0; i < positions.length; i ++) {
    		if(i == (positions.length-1)) {
        		imageSrc = "/img/common/map_ico_03.png";
        		imageSize = new daum.maps.Size(40, 50);
        	} else {
        		imageSrc = "/img/common/icon_pin.png";
        		imageSize = new daum.maps.Size(50, 50);
        	}

    		marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커를 표시할 위치
	            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : new daum.maps.MarkerImage(imageSrc, imageSize), // 마커 이미지
	            clickable: true
	        });
    		
    		marker.setMap(map);
	    	
        	if(i != (positions.length-1)) {
        		infoWindow(marker, positions[i].title, positions[i].agencyCd);
        	}
	    }
	    
	    moveStoreCenter(positions[0].lat, positions[0].lon);
    }
}

function infoWindow(marker, agencyBhfNm, agencyCd){
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:2px;"><span style="font-weight:bold;">영업점명 </span> : '+agencyBhfNm+'</div>'
    
    				,iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커 위에 인포윈도우를 표시합니다
    	$("#meajangCd").val(agencyCd);
        selectStore2(agencyCd, "1");
		$(".shop-search-single").attr("style","display:'';");
    });

}

//주소로 거점 재고 체크
//방문 ,픽업
var pageAddr = "";
var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수
function selectStore(pageNo){
	var sido = $("#sido").val();
	var meajang = $("#meajang").val();
	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	if(meajang == "" && sido == "") {
		alert("시도 정보 또는 매장명을 입력 하세요.");
		return false;
	}
	
	ComUtil.loading();
	
	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo};
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

  			var html = "";
  			if(list.length > 0 ) {
	        	//페이지용
          		
	    		for(var i=0; i<list.length; i++) {
	    			html += "<li>";
	    			html += "	<div class='shop-search-single'>";
	    			html += "		<div class='layout-r'>";
	    			html += "			<div class='shop-content-box layout-c'>";
	    			html += "				<ul class='mb-m'>";
	    			html += "					<li><b>" + list[i].agencyNm + "</b></li>";
	    			html += "					<li>" + list[i].city + " " +list[i].street + "</li>";
	    			/* html += "					<li><b>수입차 경정비 가능</b></li>"; */
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
			    		html += "           			<img src='/img/common/state_ico05.png'  alt='1급정비'/>";
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
		    		html += "				<button type='button' class='md-close' onClick='storeTmsMap(\""+list[i].agencyCd+"\", \""+list[i].agencyNm+"\", \""+list[i].city+"\", \"" +list[i].street+"\", \""+list[i].salesGroup+"\", \""+list[i].salesOffice+"\" , \""+i+"\", \""+list[i].posCd+"\");'><b>선택하기</b><span></span></button>";
		    		html += "				<button type='button' class='md-close' onClick='moveStore(\""+list[i].posX+"\", \"" + list[i].posY + "\", \""+list[i].agencyCd + "\");'><b>이동하기</b><span></span></button>";
		    		html += "			</div>";
		    		html += "		</div>";
		    		html += "	</div>";
		    		html += "</li>";

	                var obj = {
		        			title	: list[i].agencyNm,
		        			addr 	: list[i].city + " " +list[i].street,
		        			lat		: list[i].posX,
		        			lon		: list[i].posY,
		        			agencyCd	: list[i].agencyCd
		        			};

	    			positions.push(obj);
	    		}

	    		if(pageNo == '1') {
					$("#storeList").html(html);
					$("#pageNo").val(1);
	    		} else {
	    			$("#storeList").append(html);
	    			var nextPageNo = Number($("#pageNo").val()) + 1;
	    			$("#pageNo").val(nextPageNo);
	    		}
				$("#storeListCnt").html(data.pageCommon.totalCount);
				
				var pageCommon = data.pageCommon;
				PageUtil.fnPageMakeMoreDisplay(data.pageCommon.totalCount, $("#pageNo").val() , $("#pagingMap") , "selectStore", 5);

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
				//지도 그리기
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions, "mapDiv", "N");
	        	$("#meajangCd").val("");
	  		} else {
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
function selectStore2(addrTxt , pageNo){
	if(ValidUtil.isEmpty($("#meajang").val()) && ValidUtil.isEmpty($("#sido").val())) {
		ComUtil.alert("매장명 또는 시/도 선택은 필수입니다.");
		return false;
	}

	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	var sAgencyCd = $("#meajangCd").val();
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
				var obj2 ={
						title	: "나의 위치",
		    			addr 	: "",
		    			lat		: myLat,
		    			lon		: myLon,
		    			agencyCd	: ""
				}
				
				positions.push(obj2);
				savedPositions = positions;//지도에서 이동하기에 사용하려고 전역으로 저장해둔다.
				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions, "mapDiv", "N");
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

function moveStore(agencyLat, agencyLon, agencyCd) {
	map.setCenter(new daum.maps.LatLng(agencyLat, agencyLon));
	map.setLevel(5);
	//selectStore2(agencyCd, "1");
	$("#storeInfo").hide();
	$(".change-map").click();
}

function moveStoreCenter(agencyLat, agencyLon) {
	map.setCenter(new daum.maps.LatLng(agencyLat, agencyLon));
	map.setLevel(5);
}

//지도 리스트에서 선택 하기 버튼 클릭 이벤트
//조직코드 , 주소 , 우편 번호 , 상세 인덱스
function storeTmsMap(agencyCd , agencyNm , city, street, salesGroup, salesOffice, idx , posCd) {
	var addr = city + ' ' + street;
	var jajakInfo = "("+agencyNm+") "+addr;
	document.getElementById("insStoreName").value = agencyNm;
	document.getElementById("insStoreCd").value = agencyCd;
	document.getElementById("insStoreAddr").value = addr;
	document.getElementById("salesGroup").value   = salesGroup;
	document.getElementById("salesOffice").value  = salesOffice;
	document.getElementById("addrTxtJ").value  = jajakInfo;
	$('#centZip').val(posCd);
	$('#centAddr1').val(city);
	$('#centAddr2').val(street);
	$("#mountAlertTxt").html("<span>선택하신 장착일시에 전문점으로 방문해주시기 바랍니다.</span>");

	ComUtil.loading();
	
	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	itemCdArr.push($('#matCd').val());
	itemCntArr.push($("#KWMENG").val());
	
	var param = {iplAddr : addr , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : "40" , mountDt : "" , mountTime : "" , pageNo : '1' , searchGbn : "store", o2oYn : "Y", pkLoca: "N", city: "", county: "", dong: "", orgzCd : "", bpCd: agencyCd};

	$.ajax({
      type: "post",
      url: "/order/o2oTmsStock",
      data: JSON.stringify(param),
      contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
      success: function (data) {
      	ComUtil.unloading();
      	if(data.rtnCode == "-1") {
      		$("#mountAlertTxt").hide();
      		ComUtil.alert(data.rtnMsg);
      		return;
      	} else {
      		//재고 체크는 공통으로 사용하는중. 걱정제로는 발주만 할수 있기 때문에 RDC재고가 없으면 달력을 만들지 않는다.
        	//수정일 : 2020.12.16
       		if(data.rdcStockYn == "N") {
       			ComUtil.alert("재고 일시 품절로 걱정제로 주문이 불가합니다.");
        		return;
       		}
      		
      		$("#rentalShopYn").val(data.rentalShopYn);
          	//렌탈 전문점이면
          	if(data.rentalShopYn == "Y") {
          		$(".amPmChk").hide();//오전오후 체크
          		$(".timePick").hide();//장착 희망일시 블럭
          	}
          	//o2o 전문점이면
          	else {
          		$(".amPmChk").show();
          		$(".timePick").show();
          	}
          	$("#bpStockYn").val("N");
    		$("#rdcStockYn").val(data.rdcStockYn);
      		$("#basementYn").val("N");
          	//storeTmsFix(addr , ".", data.bpStockYn, data.rdcStockYn);
          	storeTmsFix(addr , ".", "N", data.rdcStockYn);
      	}
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

//지도 리스트에서 선택 하기 버튼 클릭 이벤트
//조직코드 , 주소 , 우편 번호 , 상세 인덱스
function storeFix(agencyCd , agencyNm , addr, salesGroup, salesOffice, idx, city, street, poscod) {
	console.log(agencyCd+  "/ " + agencyNm + "/" + addr)
	var jajakInfo = "("+agencyNm+") "+addr;
	document.getElementById("insStoreName").value = agencyNm;
	document.getElementById("insStoreCd").value = agencyCd;
	document.getElementById("insStoreAddr").value = addr;
	document.getElementById("salesGroup").value   = salesGroup;
	document.getElementById("salesOffice").value  = salesOffice;
	document.getElementById("addrTxtJ").value  = jajakInfo;
	$('#centZip').val(poscod);
	$('#centAddr1').val(city);
	$('#centAddr2').val(street);
	//조직 코드 세팅
	//$("#orgzCd").val(agencyCd);

	sendChildValueCancle('modal-Shop');
	
	var today = new Date();
	var week = new Array("sun", "mon", "thu", "wen", "thu", "fri", "sat");

	//휴일목록
	storechkDay = [];
	<c:forEach var="hDayList" items="${hDayList}" varStatus="status">
		storechkDay.push("${hDayList.hDate}");
	</c:forEach>	

	//달력 세팅
	$('#datepicker').datepicker({
/* 		showOn: "button",
		buttonImage: "/img/common/calendar.png",
		buttonImageOnly: true, */
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
		        	$("#instTm").html(orderTimeListHtml);
		   			$("#instTm").show();
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
        	$("#instTm").html(orderTimeListHtml);
   			$("#instTm").show();
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
        }
    });	
}

//상세 주소 화면
function returnAddrInfo(cbData) {
	var gbn = jusoGbn;

	//방문 장착
	if(gbn == "B" || gbn == "P1" || gbn == "P2") {

		//재고 체크
		var mountCd = $("input[name='mounting']:checked").val();		//장착구분
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
		
		//해당 지역 외 주문 불가
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

			cbData.popLoadAddr.indexOf("인천광역시") < 0
		) {
			 if(mountCd == "10"){
				$("#bangMunAlertTxt").show();
				$("#addrOkB").hide();
			} else if(mountCd == "20"){
				if(mountCheck1 == "P1") {
					$("#pick1AlertTxt").show();
					$("#addrOkP1").hide();
				}else if(mountCheck1 == "P2") {
					$("#pick2AlertTxt").show();
					$("#addrOkP2").hide();
				}
			}
			return;
		} else {
			if(mountCd == "10"){
				$("#bangMunAlertTxt").hide();
				$("#addrOkB").show();
			} else if(mountCd == "20"){
				if(mountCheck1 == "P1") {
					$("#pick1AlertTxt").hide();
					$("#addrOkP1").show();
				}else if(mountCheck1 == "P2") {
					$("#pick2AlertTxt").hide();
					$("#addrOkP2").show();
				}
			}
		}				
		
		var mountDt = $("#datepicker11").val().replace(/-/gi, "");//장착일
		var instTm = $("#amArea span.on, #pmArea span.on").text().replace(":","");	//장착시간

		//itemCd및 수량
		var itemCdArr = new Array();
		var itemCntArr = new Array();

		itemCdArr.push($('#matCd').val());
		itemCntArr.push($("#KWMENG").val());

		$("#itemCdArr").val(itemCdArr);
		$("#itemCntArr").val(itemCntArr);
		
		var city = cbData.popSiNm;
		var county = cbData.popSggNm;
		var dong = cbData.popEmdNm;
		
		$("#city").val(city);
		$("#county").val(county);
		$("#dong").val(dong);
		
		if(mountCd == "10" || (mountCd == "20" && mountCheck1 == "P1")) {
			$("#city").val(city);
			$("#county").val(county);
			$("#dong").val(dong);
		}else if(mountCheck1 == "P2") {
			$("#dlvyCity").val(city);
			$("#dlvyCounty").val(county);
			$("#dlvyDong").val(dong);
			
			storeTmsFix(cbData.popLoadAddr , cbData.popDetailAddr, $("#bpStockYn").val(), $("#rdcStockYn").val());
		}
		
		//방문장착때, 픽업때만 재고 조회를 한다.
		if(mountCd == "10" || (mountCd == "20" && mountCheck1 == "P1")) {
			ComUtil.loading();
			
			var param = {iplAddr : cbData.popLoadAddr , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : mountDt , mountTime : instTm , pageNo : '1' , searchGbn : "store", o2oYn : "N", pkLoca: pkLoca, city: city, county: county, dong: dong, orgzCd : orgzCd};
	
			$.ajax({
		        type: "post",
		        url: "/order/o2oTmsStock",
		        data: JSON.stringify(param),
		        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		        success: function (data) {
		        	ComUtil.unloading();
		        	if(data.rtnCode == "-1") {
		        		ComUtil.alert(data.rtnMsg);
		        		return;
		        	}
		        	//재고 체크는 공통으로 사용하는중. 걱정제로는 발주만 할수 있기 때문에 RDC재고가 없으면 달력을 만들지 않는다.
		        	//수정일 : 2020.12.16
		        	else {
		        		if(data.rdcStockYn == "N") {
		        			ComUtil.alert("재고 일시 품절로 걱정제로 주문이 불가합니다.");
			        		return;
		        		}
		        	}
		        	
		        	$("#bpStockYn").val("N");
	    			$("#rdcStockYn").val(data.rdcStockYn);
	        		$("#basementYn").val(pkLoca);
		        	//storeTmsFix(cbData.popLoadAddr , cbData.popDetailAddr, data.bpStockYn, data.rdcStockYn);
		        	storeTmsFix(cbData.popLoadAddr , cbData.popDetailAddr, "N", data.rdcStockYn);
		        },
		        error: function(xhr,status,error){
		        	//alert(support0014);
		        	ComUtil.unloading();
		        	document.body.style.overflow = 'none';
		        },
		        complete:function() {
		        	ComUtil.unloading();
		        }
		    });
		}
	}
	//주문자 주소
	else if(jusoGbn == "A"){
		$("#addrTxt").val(cbData.popLoadAddr + " " + cbData.popDetailAddr);
		$("#addr1").val(cbData.popLoadAddr);
		$("#addr2").val(cbData.popDetailAddr);
		$("#postNo").val(cbData.popZipCode);
	}

	//$(".layPopClose").click();
}

function storeTmsFix(addr1 , addr2, bpStockYn, rdcStockYn) {
	var gbn = jusoGbn;
	
	if(mountCheck1 != "P2") {
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
		var tmpToday = new Date();
		var bhfLastDay = '';
		if(tmpToday.getDay() == 5) {
			bhfLastDay = '+4d';
		} else {
			bhfLastDay = '+3d';
		}
		
		//렌탈팀에서 걱정제로의 거점재고는 임시적으로 불가하다고 함. 2020.04.10
		//var mDate = bpStockYn == "Y" ? '+0d': bhfLastDay;
		var mDate = bhfLastDay;
		
		$('#datepicker11').datepicker({
			showOn: "both",
			buttonImage: "/img/common/ico_calendar.png",
			buttonImageOnly: true,
			dateFormat: 'yy-mm-dd',
			yearRange: 'c-0:c+2',
			minDate: mDate,
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
			        if($.inArray((y+""+m+""+d) , storechkDay) != -1) {
			            return [false];
			        }
			    }
			    return [true];
			},
		 	onSelect: function (date) {
		 		$("input[name='timeRd']").prop('checked', false);
		 		$("#amArea").hide();
				$("#pmArea").hide();
				
				//종료예정시간 hidden처리
		    	$("#jobEndTimeMsg").css("display","none");
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
		//$('#datepicker11').datepicker( "option" , {minDate: mDate,maxDate: '+13d'} );
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
		$("#addrTxtB").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
		$("#zipCodeB").val($("#popZipCode").text());
		/* 20191212 추가 */
		$("#visZip").val($("#popZipCode").text());
		$("#visAddr1").val($("#popLoadAddr").text());
		$("#visAddr2").val($("#popDetailAddr").val());
		
		$("#mountAlertTxt").html("<span>장착일시에 서비스매니저가 도착하여 작업합니다.</span>");
	}
	// 픽업
	else if(jusoGbn == "P1"){
		$("#addrTxtP1").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
		$("#zipCodeP1").val($("#popZipCode").text());

		/* 20191212 추가 */
		$("#pickZip").val($("#popZipCode").text());
		$("#pickAddr1").val($("#popLoadAddr").text());
		$("#pickAddr2").val($("#popDetailAddr").val());
		
		$("#mountAlertTxt").html("<span>차량 픽업일시에 서비스매니저가 도착하여 차량을 인수합니다.</span>");
	}
	// 딜리버리
	else if(jusoGbn == "P2"){
		$("#addrTxtP2").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
		$("#zipCodeP2").val($("#popZipCode").text());

		/* 20191212 추가 */
		$("#deliZip").val($("#popZipCode").text());
		$("#deliAddr1").val($("#popLoadAddr").text());
		$("#deliAddr2").val($("#popDetailAddr").val());
		
	}

	$('#popDetailAddr').val('');
	$("#jusoTxt").val("");
	$("#jusoList").html("");
	$("#totalCount").text("");
	
	ComUtil.unloading();
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

// 한글 입력 방지
function fn_noKorean(str) {
	return str.replace(/[^a-zA-Z0-9]/gi, "");
}
// 영어 + '.' 입력 - [이메일(주소)]
function fn_inputEmail(str){
	return str.replace(/[^a-zA-Z.]/gi, "");
}

function noSundays(date) {
    return [date.getDay() != 0, ''];
}

//숫자만 입력
function number_filter(str_value){
	return str_value.replace(/[^0-9]/gi, "");
}

/************************************넥스트 레벨 소스 카피**************************************/
// 주문자정보 입력
function fn_Write(ordNo,carMn,carNm,carNo,custNo,servCnt,dlvStat,matCd,matNm){
	
	var frm = document.submitParam;

	//20190429 계약종료고객 서비스 신청 불가
	//--------------------------------------------------------------------------------------------------------------------------------
	var procDay = $("#"+ordNo+"_procDay").val().replace('.', '');					    //장착일자
	var period   = $("#"+ordNo+"_periodCd").val();					    //계약기간

	var procYear    = procDay.substr(0, 4);
	var procMonth   = procDay.substr(4, 2);
	var procDate    = procDay.substr(6, 2);

	var osDay       = new Date(procYear, Number(procMonth) + Number(period), Number(procDate) - 1);

	var osYear      = osDay.getFullYear() + 1;
	var osMonth   = osDay.getMonth(); osMonth = (osMonth < 10) ? '0' + osMonth : osMonth;
	var osDate      = osDay.getDate(); osDate = (osDate < 10) ? '0' + osDate : osDate;

	var toDay = <%=sdf.format(cal.getTime())%>

 	if(osYear + "" + osMonth + ""  + osDate < toDay){
		alert("렌탈계약이 종료된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
		return;
	}
	//----------------------------------------------------------------------------------------------------------------------------------

	if (servCnt == "0"){
		alert("[잔여횟수 : "+servCnt+"회] \n 걱정제로 잔여횟수가 1회 미만은 신청 불가능 합니다.");

		$('#ordNo1').text('');
		$('#carMn').val('');
		$('#carNm').val('');
		$('#carNo').val('');
		$('#custNo').val('');
		$('#servCnt').val('');
		$('#matCd11').val('');
		return false;
	}

 	if (dlvStat != ""){
		alert("이미 신청 중이어서 재 신청 불가능합니다.");
		$('#ordNo1').val('');
		$('#carMn').val('');
		$('#carNm').val('');
		$('#carNo').val('');
		$('#custNo').val('');
		$('#servCnt').val('');
		$('#matCd11').val('');
		return false;
	}

		$('#ordNo').val(ordNo);
		$('#ordNo1').text(ordNo);
		$('#carMn').val(carMn);
		$('#carNm').val(carNm);
		$('#carNo').val(carNo);
		$('#custNo').val(custNo);
		$('#servCnt').val(servCnt);
		$('#matCd').val(matCd);
		$('#matCd11').val(matNm);
}

//시도 셀렉트 선택 시 시군구 조회
function selectSiGunGu(){

	if($("#sido").val() == ''){
    	var html = "";
			html += "<option value=''>시/군/구 선택</option>";
		$("#sigungu").html(html);
	}else{
		$.ajax({
		    url: "/order/selectSiGunGu",
		    type: "GET",
		    data: {param : $("#sido").val()},
		    success: function(data) {
		    	console.log(data)
		    	var html = "<option value=''>시/군/구 선택</option>";
		    	for(var i=0; i<data.length; i++) {
		    		html += "<option value='"+data[i].cd+"'>" + data[i].cdNm + "</option>";
		    	}

		    	$("#sigungu").html(html);
		    },
		    error: function (request, status, error) {
		    	console.log(error)
			}
		});
	}
}


// 주문신청 등록
function fn_InsertProc(){
   	if(this.dblClick >= 1){
		return false;
	}

	if($('#ordNo1').text() == null || $('#ordNo1').text() == ""){
		alert("계약번호를 선택해주세요");
		return false;
	}


	if($('#phone1').val() == null || $('#phone1').val()  == ""){
		alert("휴대폰번호를 넣어주세요");
		return false;
	}

	if($('#phone2').val() == null || $('#phone2').val()  == ""){
		alert("휴대폰번호를 넣어주세요");
		return false;
	}

	if($('#phone3').val() == null || $('#phone3').val()  == ""){
		alert("휴대폰번호를 넣어주세요");
		return false;
	}

	if($('#matCd').val() == null || $('#matCd').val()  == ""){
		alert("신청 타이어종류를 선택해주세요");
		return false;
	}


	if($('#KWMENG').val() == null || $('#KWMENG').val()  == ""){
		alert("신청 타이어본수를 선택해주세요");
		return false;
	}

	//장착주소 체크
	var chkNum = $(':radio[name="mounting"]:checked').val();

	if(chkNum == '10'){ //방문장착 서비스
		if(ValidUtil.isEmpty($('#addrTxtB').val())){
			alert("방문장착 주소를 입력해주세요");
			return false;
		}
	}else if(chkNum == '20'){ //픽업 앤 딜리버리
		if(ValidUtil.isEmpty($('#addrTxtP1').val())){
			alert("픽업 주소를 입력해주세요");
			return false;
		}
		if(ValidUtil.isEmpty($('#addrTxtP2').val())){
			alert("딜리버리 주소를 입력해주세요");
			return false;
		}
	}else if(chkNum == '40'){ //전문점 장착서비스

		if(ValidUtil.isEmpty($('#addrTxtJ').val())){
			alert("장착받으실 장착점을 입력해주세요");
			return false;
		}
	}

	if(ValidUtil.isEmpty($('#datepicker11').val())){
		alert("장착일자를 입력하세요.");
		return false;
	}

	if($('#allAgree').prop("checked") == false){
		alert("걱정제로 동의에 체크해주세요.");
		return false;
	}
	
	//TMS 정보 담기
	if(!create_tmsInfo()) {
		ComUtil.alert("걱정제로신청이 불가합니다. 관리자에게 문의하세요.");
		return false;
	}
	
	if(ValidUtil.isEmpty($("#amArea span.on, #pmArea span.on").text())){
		alert("장착시간를 입력하세요.");
		return false;
	}
	
	if(!chkVersion()) {
		ComUtil.alert("스케줄이 변경되었습니다. 오전/오후를 다시 선택해주세요.");
		return false;
	}

	/* 
	 * SMS 메세지 세팅은 서비스에서 만든다. (insStoreName 값이 없기 때문.)
	var msg = $('#custNm').val() + " 고객님께서 신청하신 걱정제로 서비스가 접수되었습니다.";
		  msg += " 대리점: " + $('#insStoreName').val()  + ", 연락처:" + $('#telNo').val() + ", 장착 요청일: " + $('#datepicker').val();

	 $('#smsMsg').val(msg); */

	if(chkNum == '10'){ //방문장착 서비스
		  $('#insertAddr2').val($('#visZip').val()+') '+$('#addrTxtB').val());
	}else if(chkNum == '20'){ //픽업 앤 딜리버리
		 // 픽업
		  $('#insertAddr2').val($('#zipCodeP1').val()+') '+ $('#addrTxtP1').val());
		//딜리버리
		  $('#insertAddr3').val($('#zipCodeP2').val()+') '+$('#addrTxtP2').val());

	}else if(chkNum == '40'){ //전문점 장착서비스
		  $('#insertAddr1').val($('#insStoreName').val());
		  $('#insertAddr2').val($('#centZip').val() + ') ' + $('#insStoreAddr').val());
	}

	var pikPosCd 		= "";
	var pikAddr1 		= "";
	var pikAddr2 		= "";
	var dlvPosCd 		= "";
	var dlvAddr1		= "";
	var dlvAddr2		= "";

	if($('#mountingStat').val() == '1010'){/* 방문장착이면 */
		dlvPosCd 	= $('#visZip').val();
		dlvAddr1	= $('#visAddr1').val();
		dlvAddr2	= $('#visAddr2').val();
	}else if($('#mountingStat').val() == '1020'){/* 픽업앤 딜리버리 */
		pikPosCd 	= $('#pickZip').val();
		pikAddr1 	= $('#pickAddr1').val();
		pikAddr2 	= $('#pickAddr2').val();
		dlvPosCd 	= $('#deliZip').val();
		dlvAddr1	= $('#deliAddr1').val();
		dlvAddr2	= $('#deliAddr2').val();
	}else if($('#mountingStat').val() == '1030'){/* 전문점 장착 */
		dlvPosCd 	= $('#centZip').val();
		dlvAddr1	= $('#centAddr1').val();
		dlvAddr2	= $('#centAddr2').val();
	}

	if(confirm("신청하시겠습니까?")){
		var pUrl = "/mypage/zeroServiceInsertProc";
		var pSendData = {
							commDvsn 			:	'I'
							,dlvrSeq 			:	null
							,ordNo1 			:	$('#ordNo').val()
							,custNo 			:	$('#custNo').val()
							,custNm 			:	$('#custNm').val()
							,agencyCd 			:	$('#insStoreCd').val()
							,matnr 				:	$('#matCd').val()
							,kwmeng 			:	$('#KWMENG').val()
							,servrqDay 			:	$('#datepicker11').val().replace(/-/gi,'')
							,servSeq 			:	null
							,dlvStat 			:	'01'
							,addr1 				:	$('#insertAddr2').val()
							,dlvTel 			:	$('#phone1').val() + $('#phone2').val() + $('#phone3').val()
							,dlvDesc 			:	$('#textArea').val()
							,smsMsg 			:	$('#smsMsg').val()
							,regId 				:	'ONL_SYS'
							,instCd 			: 	$('#mountingStat').val() 				//*장착유형코드          *-  O2O의 장착코드(1010, 1020, 1030)을 그대로 보내주시면 됩니다
							,instTm 			: 	$('#instTm').val().replace(/:/gi,'') //
							,inst2Addr1 		: 	$('#insertAddr3').val()					//*장착주소2             *-  우편번호, 주소1, 주소2 통합, P&D의 Delivery 주소인 경우에만 입력
							,carNo 				: 	$('#carNo').val() 						//*차량번호              *-  */

							/*20191212 API를 또 던져주라 해서 추가함.  */
							,pikPosCd				: 	pikPosCd
							,pikAddr1				: 	pikAddr1
							,pikAddr2				: 	pikAddr2
							,dlvPosCd				: 	dlvPosCd
							,dlvAddr1				: 	dlvAddr1
							,dlvAddr2				: 	dlvAddr2
							,regDt					: <%=sdf.format(cal.getTime())%>
		
							/* 20200401 TMS 정보 추가 */
							,city					:	$('#city').val()
							,county					:	$('#county').val()
							,dong					:	$('#dong').val()
							,dlvyCity				:	$('#dlvyCity').val()
							,dlvyCounty				:	$('#dlvyCounty').val()	
							,dlvyDong				:	$('#dlvyDong').val()
							,bhfType				:	$('#bhfType').val()
							,tmsSchduleStr			:	$('#tmsSchduleStr').val()
							,centerSchduleStr		:	$('#centerSchduleStr').val()
							,basementYn				:	$('#basementYn').val()
							,alignYn				:	"N"
							,mountDt				:	$('#datepicker11').val()
							,amPmGbn				:	$("#amPmGbn").val()
						};
			pSendData = JSON.stringify(pSendData);
		var pReqId = "";

		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	if(data.successCode == -1){
		    		alert(data.returnMessage);
		    	}else{
		    		alert(data.returnMessage);
		    		window.location.href="/mypage/myRentalList";
		    	}
		    },
		    error: function (e) {
				console.log(e);
			}
		});
	}
}

//차량조회 팝업닫기
function closeCarSearch(modalNo) {
	$("#modal-" + modalNo).removeClass("md-show");
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

function getTimeList() {
	//param : 날짜 + 오전,오후 + 해당날짜 거점
	//return : 시간List (어느거점, 어느차 정보 포함)
	//여기서 색칠해야함.
	ComUtil.loading();
	var param = {};
	var pBhfType = "";
	var mountCd = $("input[name='mounting']:checked").val();
	
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
			
			if(diff >= (3+chkHday)) {
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
	itemCdArr.push($('#matCd').val());
	itemCntArr.push($("#KWMENG").val());
	
	param["mountDt"] = $("#datepicker11").val();
	if(mountCd == "10") {//방문장착일때
		param["iplAddr"] = $('#visAddr1').val();
		param["iplDtlAddr"] = $('#visAddr2').val();
		param["city"] = $("#city").val();
		param["county"] = $("#county").val();
		param["dong"] = $("#dong").val();
	} else {//P&D때 - 픽업주소정보로 조회한다.
		//픽업주소
		param["pickupBassAddr"] = $('#pickAddr1').val();
		param["pickupDtlAddr"] = $('#pickAddr2').val();
		param["city"] = $("#city").val();
		param["county"] = $("#county").val();
		param["dong"] = $("#dong").val();

		//딜리버리 주소
		param["iplAddr"] = $('#deliAddr1').val();
		param["iplDtlAddr"] = $('#deliAddr2').val();
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
	param["alignYn"] = "N";//렌탈은 무조건 N
	
   	$.ajax({
        type: "post",
        url: "/order/selectTmsSetTimeList",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "0") {
        		var resultData = data.rtnVo.resultData;
        		
        		$.each(resultData, function(idx, item) {
        			$("#time"+item.time).removeClass("off");
		        	$("#time"+item.time).removeClass("on");
		        	if(item.schedule.length > 0) {
		        		$("#time"+item.time).attr("schedule",JSON.stringify(item.schedule));
		        	}
		        	if(mountCd == "20") {
		        		$("#time"+item.time).attr("centerSchedule",JSON.stringify(item.centerSchedule));
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
	itemCdArr.push($('#matCd').val());
	itemCntArr.push($("#KWMENG").val());
	
	param["itemCdArr"] = itemCdArr;
	param["itemCntArr"] = itemCntArr;
	param["alignYn"] = "N";
	
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
	var mountCd = $("input[name='mounting']:checked").val();
	
	if(mountCd != "40") {
		var timeSchedule = JSON.parse($("#amArea span.on, #pmArea span.on").attr("schedule"));
	
		param["tmsSchdule"] = timeSchedule;
	
		$.ajax({
	        type: "post",
	        url: "/order/selectChkVersion",
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

/*TMS 정보 담기*/
function create_tmsInfo(){
	var mountCd = $("input[name='mounting']:checked").val();
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
			
			if(diff >= (3+chkHday)) {
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
	//걱정제로는 무조건 RDC로 해야만한다. 2020.12.16
	$("#bhfType").val("RDC");
	
	$("#instTm").val($("#amArea span.on, #pmArea span.on").text().replace(":",""))//장착시간

	return rtnVal;
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
	            };
	            positions.push(obj);
            }

            if (result.rtnList.length > 0) {
            	if(mapTargetDiv == "mapDiv") {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDiv", "N");
            	} else {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDivPopup", "N");
            	}
            }
		} else if (callback == 'rentalAgencyInfo') {
			var html = "";
			html += "<h2 class='f_ell'>";
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

		    positions = [];
            var obj = {
            		title	: result.rtnList[0].agencyNm,
            		addr 	: result.rtnList[0].city + " " +result.rtnList[0].street,
            		lat		: result.rtnList[0].posX,
            		lon		: result.rtnList[0].posY
            };
            positions.push(obj);
            mapTargetDiv = "mapDivPopup";
            mapDraw(result.rtnList[0].posY , result.rtnList[0].posX, result.rtnList[0].agencyNm , positions, "mapDivPopup", "N");

            getRentStore(result.rtnList[0].posX,result.rtnList[0].posY);

            $("#modal-Shop").removeClass("md-show");
			$("#modalAgencyDetl").addClass("md-show");
		}
	}
}

function fn_popupClose(pId) {
	$("#"+pId).removeClass("md-show");
	if(pId != "modal-Shop") {
		$("#modal-Shop").addClass("md-show");
	}
	fnMove("junmun");
}

</script>