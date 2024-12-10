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

<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/jquery.timepicker.min.js"></script>

	<!-- 다음 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>

			<!--subContentsWrap-->
<form name="submitParam" method="post" enctype="multipart/form-data" onSubmit="return false;">

			  <input type="hidden" name="dlvrDay" 			id="dlvrDay" 			value="${resultMap.dlvrDay }"/>
			  <input type="hidden" name="dlvrSeq"			id="dlvrSeq" 			value="${resultMap.dlvrSeq }"/>
			  <input type="hidden" name="ordNo" 			id="ordNo" 				value="${resultMap.ordNo }"/>
			  <input type="hidden" name="custNo" 			id="custNo" 			value="${resultMap.custNo }"/>
              <input type="hidden" name="insStoreAddr1"  	id="insStoreAddr1"/>
              <input type="hidden" name="matCd1"           	id="matCd1"/>
              <input type="hidden" name="matCd" 			id="matCd"				value="${resultMap.matCd}"/>
              <input type="hidden" name="carMn" 			id="carMn" 				value="${resultMap.makerNm}"/>
              <input type="hidden" name="carNm" 			id="carNm" 				value="${resultMap.modelNm}"/>
              <input type="hidden" name="carNo" 			id="carNo" 				value="${resultMap.carNo}"/>
              <input type="hidden" name="phone1"			id="phone1" 			value="${resultMap.phone1}">
              <input type="hidden" name="phone2" 			id="phone2" 			value="${resultMap.phone2}" />
			  <input type="hidden" name="phone3" 			id="phone3" 			value="${resultMap.phone3}" />
			  <input type="hidden" name="telNo" 			id="telNo" 				value=""${resultMap.dlvTel}" />
			  <input type="hidden" name="custNm"			id="custNm" 			value="${resultMap.custNm}" />
			  <input type="hidden" name="custId" 			id="custId" 			value="${userVo.loginId}" />
              <input type="hidden" name="insStoreCd" 		id="insStoreCd">
	          <input type="hidden" name="insStoreName" 		id="insStoreName">
              <input type="hidden" name="insStoreAddr"		id="insStoreAddr">
              <input type="hidden" name="salesGroup" 		id="salesGroup">
              <input type="hidden" name="salesOffice" 		id="salesOffice">
			  <input type="hidden" name="smsMsg" 			id="smsMsg" />
			  <input type="hidden" name="mountingStat" 		id="mountingStat" 		value="${resultMap.instCd}" />	<!-- 장착서비스 구분코드 -->
			  <input type="hidden" name="insertAddr2" 		id="insertAddr2"  		value="${resultMap.addr1}" />
			  <input type="hidden" name="insertAddr1" 		id="insertAddr1"/>
			  <input type="hidden" name="insertAddr3" 		id="insertAddr3"/>


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
			  
	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header">
            	<h2 class="title-deco">
              		<span>책임지고</span> <span>관리합니다</span>
            	</h2>
            	<h3 class="title-deco-sub">걱정제로 서비스 신청</h3>
          	</div>
          	<!-- //header -->

          	<div class="order-middle-message text-center">
            	<p>고객님께서 직접 걱정제로 서비스 신청 및 신청내역을 조회할 수 있습니다</p>
          	</div>

          	<div class="mynexen-payment-product bg">
            	<div class="order-info-summary-wrap">
              		<div class="order-info-summary col-1">
                		<small>
                			계약번호
                			<a href="javascript:void(0);"><font color="blue">${resultMap.ordNo}</font></a>
                		</small>
              		</div>
            	</div>

          	<div class="product-sub-info rental accordion-box js-accordion">
            	<!-- 00 -->
            	<div class="accordion">
              		<h3>계약 정보</h3>
            	</div>
            	<div class="accordion-info inset-ml">
              		<div class="submit layout-c mb-m border-bottom">
                		<p class="black">주문번호</p>
                		<p class="pt-s pb-s" name="ordNo1" id="ordNo1" class="type03">${resultMap.ordNo}</p>
              		</div>
              		<div class="submit layout-c mb-m border-bottom">
                		<p class="black">휴대전화</p>
                		<p class="pt-s pb-s">${resultMap.phone1}-${resultMap.phone2}-${resultMap.phone3}</p>
              		</div>
              		<div class="submit layout-c mb-m border-bottom">
                		<p class="black">주문자/아이디</p>
                		<p class="pt-s pb-s">${resultMap.custNm} / ${userVo.loginId}</p>
              		</div>
              		<div class="submit layout-c border-bottom">
                		<p class="black">신청 타이어 개수</p>
                		<div class="order-basket">
                  			<select name="KWMENG" id="KWMENG" disabled="disabled" title="신청 타이어 개수 선택">
                    			<option value="">본수</option>
                    			<c:forEach var="zeroCdList" items="${zeroCdList}" >
									<option <c:if test="${resultMap.cntCd == zeroCdList.cmmCd}" >selected="selected"</c:if>  value="${zeroCdList.cmmCd}">${zeroCdList.cmmNm}</option>
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
                  				<ul>
                    				<li class="radio col-2">
                      					<input type="radio" name="mounting" id="ser1" <c:if test="${resultMap.instCd == '1010'}">checked="checked"</c:if> value="1010" class="radioChk" title="방문장착서비스 선택">
                      					<label for="ser1"><span>방문장착서비스</span></label>
                    				</li>
                    				<li class="radio col-2">
                      					<input type="radio" name="mounting" id="ser2" <c:if test="${resultMap.instCd == '1020'}">checked="checked"</c:if> value="1020" class="radioChk" title="픽업&amp;딜리버리 장착 서비스 선택">
                      					<label for="ser2"><span>픽업&amp;딜리버리 장착 서비스</span></label>
                    				</li>
                    				<li class="radio col-2">
                      					<input type="radio" name="mounting" id="ser3" <c:if test="${resultMap.instCd == '1040'}">checked="checked"</c:if> value="1040" class="radioChk" title="전문점 장착 서비스 선택">
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

              			<div class="submit" id="noPickUp" <c:if test="${resultMap.instCd != '1010'}">style="display: none"</c:if>>
                			<label for="info02"><span class="essen black">장착 주소</span></label>
             				<div class="conWrap layout-r border-bottom mb-s">
               					<input type="text" class="pl-0 trans-bg" name="addrTxtB" id="addrTxtB" title="주소 입력란" value="${resultMap.addr1}" placeholder="장착 받으실 주소">
               					<button type="button" class="align-middle btn-address-search02" name="selectAddr" val="B">검색</button>
             				</div>
              			</div>
              			<!-- //방문장착 서비스 -->

              			<!-- 픽업,딜리버리 장착 서비스 -->
              			<div class="submit" id="pickUp" <c:if test="${resultMap.instCd != '1020'}">style="display: none"</c:if>>
                			<label for="info03"><span class="essen black">장착 주소</span></label>
                			<div class="conWrap layout-r border-bottom mb-s">
                  				<input type="text" name="addrTxtP1" id="addrTxtP1" value="${resultMap.addr1}" class="pl-0 trans-bg" title="주소 입력란" placeholder="픽업주소를 검색하세요">
                  				<button type="button" name="selectAddr" val="P1" class="align-middle btn-address-search02">검색</button>
                			</div>
                			<div class="conWrap layout-r border-bottom mb-s">
                  				<input type="text" name="addrTxtP2" id="addrTxtP2" value="${resultMap.inst2Addr1}" class="pl-0 trans-bg" title="주소 입력란" placeholder="딜리버리 주소를 검색하세요">
                  				<input type="hidden" id="zipCodeP2" />
                  				<button type="button" name="selectAddr" val="P2" class="align-middle btn-address-search02">검색</button>
                			</div>
              			</div>
              			<!-- //픽업,딜리버리 장착 서비스 -->

              			<!-- 전문점 장착 서비스 -->
              			<div class="submit" id="junmun" <c:if test="${resultMap.instCd != '1040'}">style="display: none"</c:if>">
                			<label for="info05"><span class="essen black">장착 주소</span></label>
             				<div class="shop-info">
               					<span>르노삼성자동차지정정비코너용강</span>
             				</div>
             				<div class="conWrap layout-r border-bottom mb-s">
               					<input type="text" class="pl-0 trans-bg" id="addrTxtJ" value="(${resultMap.agencyNm}) ${resultMap.addr1}" title="주소 입력란" placeholder="전문점찾기">
               					<button type="button" name="selectAddr" val="J" class="align-middle btn-address-search02 md-trigger" data-modal="modal-Shop">검색</button>
             				</div>
              			</div>
              			<!-- //전문점 장착 서비스 -->
              			<!-- ###################################### -->
              			<!-- //js-radio UI contents -->

						<!-- 장착일시 시간 -->
              			<div class="submit">
                			<label for="datepicker"><span class="essen black">장착 희망일시</span></label>
                			<div class="conWrap mb-s">
                  				<div class="dateTime layout-r same-size border-bottom">
                    				<div class="date pl-ml inline">
                      					<input type="text" disabled="disabled" name="datepicker" id="datepicker"  value="${resultMap.servrqDay}" title="장착 희망일시 입력란">
                    				</div>
                    				<div class="time pl-ml inline">
                      					<input type="time" class="timepicker" disabled="disabled" name="instTm"  id="instTm" title="장착 희망시간 입력란" value="${resultMap.instTm}">
                    				</div>
                  				</div>
                			</div>
              			</div>

              			<div class="submit">
                			<label for="carNum"><span class="essen black">배송시 요청사항</span></label>
                			<div class="conWrap mb-s border-bottom">
                  				<input type="text" name="textArea" class="pl-0" id="textArea" value="${resultMap.dlvDesc}" placeholder="배송시 요청사항을 작성해 주세요.">
                			</div>
              			</div>
            		</div>
            	</div>
            	<!-- //01 -->
          	</div>

          	<div class="btn-wrap">
          			<button type="button" class="btn-gray-dark cancel inset-m full-width" onclick="fn_goList();">목록</button>
          		<c:if test="${resultMap.dlvStat == '01'}">
	        		<button type="button" class="btn-primary inset-m full-width" onclick="javascript:fn_Cancel();">삭제</button>
	        	</c:if>
	        </div>
		</main>
	</div>
    <!-- //subContentsWrap -->
</form>

	<!-- 전문점 찾기 -->
	<div class="fullPopup md-modal-3 shop-popup md-effect-1 md-close" id="modal-Shop">
		<div class="popContents popup-dark shop-search">
			<a href="#;" class="layPopClose md-close"></a>
		    <header>
		    	<h2>전문점 찾기</h2>
		    </header>

		    <!--contents-->
		    <!-- MAP -->
		    <!-- 미구현 구역 MEPARK -->
		    <div id="shop-map" class="popup-map">
		    	<div class="shop-search-single">
		        	<div class="layout-r">
		            	<div class="shop-content-box layout-c">
		    				<ul class="mb-m">
		    					<li><b>마곡점</b></li><!-- list[i].bhfNm -->
		    					<li>경기 광명시 철산동 철산한신아파트</li><!-- list[i].addr -->
		    					<!-- <li><b>수입차 경정비 가능</b></li> -->
		    				</ul>
		    				<div class="layout-r">
		    					<div class="shop-state-icon layout-r inline inline-s">
		    						<div class="state inline">
		    							<img src="../img/common/state_ico02.png" alt="타이어">
		    							<span>타이어</span>
		    						</div>
		    			<!-- if(list[i].chYn == "Y") { -->
			    					<div class='state inline'>
			    						<img src='../img/common/state_ico01.png' alt='추천'>
			    						<span>추천</span>
			    					</div>
		    			<!-- if(list[i].cwYn == "Y") { -->
		    						<div class='state inline'>
				    		           	<!-- <img src='/img/common/state_ico05.png'  alt='세차'/> -->
				    		           	<span>세차</span>
				    		        </div>
		    			<!-- if(list[i].fmYn == "Y") { -->
				    		        <div class='state inline'>
				    		           	<!-- <img src='/img/common/state_ico05.png'  alt='1급정비'/> -->
				    		           	<span>1급정비</span>
				    		        </div>
			    		<!-- if(list[i].lmYn == "Y") { -->
				    		        <div class='state inline'>
				    		           	<img src='/img/common/state_ico03.png'  alt='경정비'/>
				    		           	<span>경정비</span>
				    		        </div>
			    		<!-- if(list[i].seasonGbn == "02") { -->
				    		        <div class='state inline'>
				    		            <img src='/img/common/state_ico04.png'  alt='겨울용'/>
				    		            <span>겨울용</span>
				    		        </div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class='shop-btn-box inline text-right align-bottom layout-c'>
			    			<button type='button' onClick='storeFix(list[i].bhfNm, list[i].addr, 0,i);'><b>선택하기</b><span></span></button>
			    		</div>
		            </div>
				</div>
		      	<div class="popup-map-ui">
		        	<button type="button" class="btn-position">현재위치</button>
		        	<button type="button" class="btn-map-list change-list"><span></span><b>목록</b></button>
		      	</div>
		      	<div id="mapDiv" style="width: 100%; height: 500px;"></div>
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
		                  				<option value="0">시/도 선택</option>
		                  				<c:forEach var="list" items="${selectSiDoList}" varStatus="status">
	                                    	<option value="${list.cdNm }">${list.cdNm }</option>
	                                	</c:forEach>
		                			</select>
		                			<select class="inline border-none" title="시/군/구 선택" id="sigungu">
		                				<option value=''>시/군/구 선택</option>
		                			</select>
		              			</div>
		              			<input type="text" name="meajang" class="pl-0 trans-bg" id="meajang" title="매장명 입력란" placeholder="매장명을 입력해보세요">
		            		</div>
		            		<button type="button" class="go-view full-width inset-s">O2O 서비스 장착 전문점 한눈에 보기</button>
		          		</div>
		          		<!-- 찾기 검색 -->

		          		<button type="button" class="search-shop" onclick="selectStore('1'); return false;"><span></span>전문점 찾기</button>

		          		<div class="count-box utility layout-r pl-m pr-m">
		            		<div class="utility-result-total pt-s pb-s">
		              			<span>total</span>
		              			<span class="totalCnt" id="storeListCnt"></span>
		            		</div>
		            		<div class="utility-result-map pt-s pb-s">
		              			<!-- 다시 지도로 넘어가야함. MEPARK-->
		              			<button type="button" class="change-map pr-0"><span></span>지도</button>
		            		</div>
		          		</div>
		        	</div>
		      	</div>
		      	<div class="position">
		        	<div class="shop-search-result">
		          		<ul id="storeList"></ul>
	       			</div>
	       			<!-- <div class="ml-m mr-m">
	         				<button class="list-more full-width inset-m">
	           				<span>더보기</span>
	         				</button>
	       			</div> -->
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

$( document ).ready(function() {
	$("#bgFullImg").append("<div class='member-bg mynexen-worryzero'></div>");
	// @@ test code
	//장착점
	//$("#orgzCd").val("O41119095");
	/* $("#insStoreCd").val("110397");
	$("#insStoreName").val("타이어테크 충주직영점");
	$("#insStoreAddr").val("충청북도 충주시국원대로 228");
	$("#salesGroup").val("RE3");
	$("#salesOffice").val("RE39"); */

	//달력 입력란 클릭 시
/*     $("#datepicker").click(function() {
        $(this).datepicker().datepicker( "show" );
    }); */


	//달력 세팅
/* 	$('#datepicker').datepicker({
		showOn: "button",
		buttonImage: "/img/common/calendar.png",
		buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		yearRange: 'c-0:c+2',
		minDate: '+3d',
		maxDate: '+13d',
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
    });
 */

	//@@common_ui.js 에 정의 되어 있음. 상세 조절 시 여기꺼 사용 - 운영 반영 시 common_ui에 꺼 삭제
	/* $("#mountTime").timepicker({
	    timeFormat: 'H:mm',
	    interval: 30,
	    startTime: '09:30',
	    endTime: '17:30',
	    minTime: '09:30:00',
	    maxTime: '17:45:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	}); */

	//장착 서비스 변경 시
    $("input[name='mounting']").on("click" , function(){
    	if($(this).val() == "1010") {
    		//방문
    		$("#noPickUp").show();
    		$("#pickUp").hide();
    		$("#junmun").hide();
    		$('#mountingStat').val('1010');
    	} else if($(this).val() == "1020") {
			//픽업
    		$("#noPickUp").hide();
    		$("#pickUp").show();
    		$("#junmun").hide();
    		$('#mountingStat').val('1020');
    	} else if($(this).val() == "1040") {
    		//전문
    		$("#noPickUp").hide();
    		$("#pickUp").hide();
    		$("#junmun").show();
    		$('#mountingStat').val('1040');
    	}

    	mountCheck = $(this).val();
    });

  	//장착점
    $("a[name='selectAddr']").on("click" , function(){
    	mountCheck1 = $(this).attr("val");
    });

    $('#textArea').keyup(function (e){
        var content = $(this).val();
        $('#messagebyte').html(content.length + "/2000 Byte");
    });
    $('#textArea').keyup();

});


//주소 선택 팝업
function selectJusoPop(gbn){
	$("#totalCount").text("");
	$("#jusoList").html("");
	$("#paging").html("")

	$("div[name='popAddr']").addClass("md-show");

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

function callMap(gbn) {
	//현재 내 위치 또는 고정 좌표로 호출
	var myLat = 37.57001757231217; //나의 위치 위도 (기본 위치)
	var myLon = 126.827499331455; //나의 위치 경도 (기본 위치)


	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if(navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	myLat = position.coords.latitude, // 위도
	    	myLon = position.coords.longitude; // 경도
		});
	}

	var p = [];
	var obj = {
        			title	: "",
        			addr 	: "",
        			lat		: myLat,
        			lon		: myLon,
        			};
	p.push(obj)
	mapDraw(myLon , myLat , "" , p);
}

//지도 그리기
function mapDraw(lon , lat , bhfNm , positions){
	console.log(lon + " / " + lat + " >>>"  +bhfNm)

	var agencyLat 	= lat; 	//대리점의 위도
	var agencyLon 	= lon; 	//대리점의 경도
	var agencyBhfNm	= bhfNm; 	//대리점의 경도

    var mapContainer = document.getElementById('mapDiv'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(agencyLat, agencyLon), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커를 생성합니다
	var imageSrc = "/img/common/map_ico.png";
    var imageSize = new daum.maps.Size(50, 65);
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
	//지도 리사이즈
	//지도 영역 리사이즈
    $("#mapDiv").height("800px");
    $("#mapDiv").width("920px");

    $("#map").addClass("md-show");
}

//주소로 거점 재고 체크
//방문 ,픽업
var pageAddr = "";
var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수
function selectStore(pageNo){
	if($("#meajang").val() == "") {
		ComUtil.alert("전문점 주소를 입력 하세요.");
		return false;
	}

	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo};

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

    		console.log(list)
    		
    		var html = "";
    		if(list.length > 0 ) {
	        	//페이지용
            	var positions = [];
	    		for(var i=0; i<list.length; i++) {
		    		html += "<li>";
		    		html += "<div class='storeList'>";
		    		html += "    <ul>";
		    		html += "        <li>"+list[i].agencyNm+"</li>";
		    		html += "        <li>"+list[i].city + " " +list[i].street+"</li>";
		    		/* html += "        <li>수입차 경정비 가능</li>"; */
		    		html += "    </ul>";
		    		html += "    <div class='mStateIcon'>";
		    		html += "        <div class='state'>";
		    		html += "            <img src='/img/common/state_ico02.png'  alt='타이어'/>";
		    		html += "            <span>타이어</span>";
		    		html += "        </div>";
		    		if(list[i].chYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico01.png'  alt='추천'/>";
			    		html += "            <span>추천</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].cwYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico05.png'  alt='세차'/>";
			    		html += "            <span>세차</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].fmYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico05.png'  alt='1급정비'/>";
			    		html += "            <span>1급정비</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].lmYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico03.png'  alt='경정비'/>";
			    		html += "            <span>경정비</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].seasonGbn == "02") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico04.png'  alt='겨울용'/>";
			    		html += "            <span>겨울용</span>";
			    		html += "        </div>";
		    		}
	                html += "    </div>";
	              	//조직코드 , 주소 , 우편 번호 , 상세 인덱스
	                html += "    <button type='button' class='type18' onClick='storeFix(\""+list[i].agencyCd+"\", \""+list[i].agencyNm+"\", \""+list[i].city + " " +list[i].street+"\", \""+list[i].salesGroup+"\", \""+list[i].salesOffice+"\" , \""+i+"\");'>선택하기<i class='ico15 po_03 fr'></i></button>";
	                html += "</div>";
	                html += "</li>";

	                var obj = {
		        			title	: list[i].agencyNm,
		        			addr 	: list[i].city + " " +list[i].street,
		        			lat		: list[i].posX,
		        			lon		: list[i].posY,
		        			};

	    			positions.push(obj);
	    		}
				$("#storeList").html(html);
				$("#storeListCnt").html(list.length);

				var pageCommon = data.pageCommon;
				PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions);
    		} else {
    			html += "<li>조회된 전문점이 없습니다.</li>";
    			$("#storeList").html(html);
				$("#storeListCnt").html("0");
    		}
        },
        error: function(xhr,status,error){
        	//ComUtil.alert(support0014);
        }
    });
}

//지도 리스트에서 선택 하기 버튼 클릭 이벤트
//조직코드 , 주소 , 우편 번호 , 상세 인덱스
function storeFix(agencyCd , agencyNm , addr, salesGroup, salesOffice, idx) {
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

	$(".layPopClose").click();
	
	var today = new Date();
	var week = new Array("sun", "mon", "thu", "wen", "thu", "fri", "sat");

	//휴일목록
	storechkDay = [];
	<c:forEach var="hDayList" items="${hDayList}" varStatus="status">
		storechkDay.push("${hDayList.hDate}");
	</c:forEach>

	//달력 세팅
	$('#datepicker').datepicker({
		showOn: "button",
		buttonImage: "/img/common/calendar.png",
		buttonImageOnly: true,
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

//우편 번호 검색 - 검색 버튼 클릭
function selectJuso(pageNo) {
	if(pageNo != null){
		if(Number(pageNo)  == 0) {
			$("#currentPage").val("1");
		} else {
			$("#currentPage").val(pageNo);
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
			htmlStr += "<tr onClick=\"sendChildValue('"+$(this).find('zipNo').text()+"','"+$(this).find('bdNm').text()+"','"+$(this).find('roadAddrPart1').text()+"','"+$(this).find('jibunAddr').text()+"')\">";
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
	/* $("#jusoTxt").val(""); */

	//paging
	PageUtil.fnPageMakeDisplay(totCnt, $("#currentPage").val() ,  $('#paging') , 'selectJuso', 4);
}

//상세 우편 번호
function sendChildValue(zipCode, bdMgtSn, load, jibun) {
	$("div[name='popAddr']").removeClass("md-show");
	$("#popZipCode").text();
	$("#popLoadAddr").text(load + " " + bdMgtSn);
	$("#popJibunAddr").text(jibun);
	$("div[name='popAddrDetail']").addClass("md-show");
}

function sendChildValueCancle(){
	$(".layPopClose").click();
	$('#popDetailAddr').val('');
}

//상세 주소 화면
function sendChildValueFix() {
	var gbn = jusoGbn;

	if($('#popDetailAddr').val() == ""){
		ComUtil.alert("상세주소를 입력하세요.");
		$('#popDetailAddr').focus();
		return false;
	}

	//방문 장착
	if(gbn == "B" || gbn == "P1" || gbn == "P2") {

		//재고 체크
		var mountCd = $("input[name='mounting']:checked").val();		//장착구분
		

		//해당 지역 외 주문 불가
		if(
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("강서구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("구로구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("영등포구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("금천구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("동작구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("관악구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("서초구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("강남구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("강서구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("송파구 ") < 0) &&
			($("#popLoadAddr").text().indexOf("서울") < 0 || $("#popLoadAddr").text().indexOf("강동구 ") < 0)) {
			
			if(mountCd == "1010"){
				$("#bangMunAlertTxt").show();
			} else if(mountCd == "1020"){
				if(mountCheck1 == "P1") {
					$("#pick1AlertTxt").show();
				}else if(mountCheck1 == "P2") {
					$("#pick2AlertTxt").show();
				}
			}

			$("#loadingWrap").hide();
			$(".layPopClose").click();

			return;
		} else {
			if(mountCd == "1010"){
				$("#bangMunAlertTxt").hide();
			} else if(mountCd == "1020"){
				if(mountCheck1 == "P1") {
					$("#pick1AlertTxt").hide();
				}else if(mountCheck1 == "P2") {
					$("#pick2AlertTxt").hide();
				}
			}
		}		
				
		
		
		var mountDt = $("#datepicker").val().replace(/-/gi, "");		//장착일
		var instTm = $("#instTm").val().replace(/[^0-9]/g,"");	//장착시간

		//itemCd및 수량
		var itemCdArr = new Array();
		var itemCntArr = new Array();

			/* itemCdArr.push($('#matCd').val()); */
			itemCdArr.push($('#matCd').val());
			itemCntArr.push($("#KWMENG").val());

		$("#itemCdArr").val(itemCdArr);
		$("#itemCntArr").val(itemCntArr);

		var param = {iplAddr : $("#popLoadAddr").text() , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : mountDt , mountTime : instTm , pageNo : '1' , searchGbn : "store", o2oYn : "N"};
		$("#loadingWrap").show();
		$.ajax({
	        type: "post",
	        url: "/order/searchRentStore",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {

	        	$("#loadingWrap").hide();

	        	if(data.rtnCode == "-1") {
	        		ComUtil.alert(data.rtnMsg);
	        		return;
	        	}

	        		var list = data.list;
	        		if(list.length > 0) {
	        			 var dList = list[0].detailList;
		          			//휴일목록
		          			<c:forEach var="hDayList" items="${hDayList}" varStatus="status">
		          				storechkDay.push("${hDayList.hDate}");
		          			</c:forEach>        			 
		         			 
		         			//거점 별 주문 가능일
		        			 	var dList = list[0].detailList;
		 	       			for(var k=0; k<dList.length; k++) {
		 	       				if(dList[k].yn == "N") {
		 	       	    			storechkDay.push(dList[k].dueDe);
		 	       				}
		 	       			}

		        			//달력 세팅
		        			$('#datepicker').datepicker({
		        				showOn: "button",
		        				buttonImage: "/img/common/calendar.png",
		        				buttonImageOnly: true,
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
		    					    for (i = 0; i < storechkDay.length; i++) {
		    					        if($.inArray(y+''+m+''+d , storechkDay) != -1) {
		    					            return [false];
		    					        }
		    					    }
		    					    return [true];
		       					}
		        		    });

		        			//시간 세팅
		        			orderTimeListHtml = "";
		        			for(var i=0; i<data.orderTimeList.length; i++) {
		        				orderTimeListHtml += "<option value="+data.orderTimeList[i].mountCd+">"+data.orderTimeList[i].mountTime +"</option>"
		        			}
		        			$("#instTm").html(orderTimeListHtml);
		        			$("#instTm").show();	        			
	        			
			        		//주소세팅
			        		if(gbn == "B") {
			        			$("#addrTxtB").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
			        			$("#zipCodeB").val($("#popZipCode").text());
			        			/* 20191212 추가 */
			        			$("#visZip").val($("#popZipCode").text());
			        			$("#visAddr1").val($("#popLoadAddr").text());
			        			$("#visAddr2").val($("#popDetailAddr").val());
			        			$('#popDetailAddr').val('');
			        		}
			        		// 픽업
			        		else if(jusoGbn == "P1"){
			        			$("#addrTxtP1").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
			        			$("#zipCodeP1").val($("#popZipCode").text());

			        			/* 20191212 추가 */
			        			$("#pickZip").val($("#popZipCode").text());
			        			$("#pickAddr1").val($("#popLoadAddr").text());
			        			$("#pickAddr2").val($("#popDetailAddr").val());
			        			$('#popDetailAddr').val('');
			        		}
			        		// 딜리버리
			        		else if(jusoGbn == "P2"){
			        			$("#addrTxtP2").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
			        			$("#zipCodeP2").val($("#popZipCode").text());

			        			/* 20191212 추가 */
			        			$("#deliZip").val($("#popZipCode").text());
			        			$("#deliAddr1").val($("#popLoadAddr").text());
			        			$("#deliAddr2").val($("#popDetailAddr").val());
			        			$('#popDetailAddr').val('');
			        		}	        			        			
	        		}
	        		
	        		document.getElementById("insStoreName").value 	= list[0].bhfNm;
	        		document.getElementById("insStoreCd").value 	= list[0].bpCd.substring(4);
	        		document.getElementById("insStoreAddr").value 	= list[0].addr;
	        		document.getElementById("salesGroup").value   	= list[0].salesGroup;
	         		document.getElementById("salesOffice").value  	= list[0].salesOffice;      	        		
	        },
	        error: function(xhr,status,error){
	        	//ComUtil.alert(support0014);
	        }
	    });
	}


	//주문자 주소
	else if(jusoGbn == "A"){
		$("#addr1").val($("#popLoadAddr").text());
		$("#postNo").val($("#popZipCode").text());
	}

	$(".layPopClose").click();

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
		ComUtil.alert("렌탈계약이 종료된 고객은 서비스를 신청 할 수 없습니다.\n 서비스신청문의는 관리자에게 문의해주세요.");
		return;
	}
	//----------------------------------------------------------------------------------------------------------------------------------

	if (servCnt == "0"){
		ComUtil.alert("걱정제로 잔여횟수가 1회 미만은 신청 불가능 합니다.");

		$('#ordNo1').val('');
		$('#carMn').val('');
		$('#carNm').val('');
		$('#carNo').val('');
		$('#custNo').val('');
		$('#servCnt').val('');
		$('#matCd11').val('');
		return false;
	}

	if (dlvStat != ""){
		ComUtil.alert("이미 신청 중이어서 재 신청 불가능합니다.");
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
		$('#ordNo1').val(ordNo);
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
		    	var html = "";
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

//주소로 거점 재고 체크
//방문 ,픽업
var pageAddr = "";
var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수
function selectStore(pageNo){
	if($("#meajang").val() == "") {
		ComUtil.alert("전문점 주소를 입력 하세요.");
		return false;
	}

	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo};

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

    		console.log(list)

    		var html = "";
    		if(list.length > 0 ) {
	        	//페이지용
            	var positions = [];
	    		for(var i=0; i<list.length; i++) {
		    		html += "<li>";
		    		html += "<div class='storeList'>";
		    		html += "    <ul>";
		    		html += "        <li>"+list[i].agencyNm+"</li>";
		    		html += "        <li>"+list[i].city + " " +list[i].street+"</li>";
		    		/* html += "        <li>수입차 경정비 가능</li>"; */
		    		html += "    </ul>";
		    		html += "    <div class='mStateIcon'>";
		    		html += "        <div class='state'>";
		    		html += "            <img src='/img/common/state_ico02.png'  alt='타이어'/>";
		    		html += "            <span>타이어</span>";
		    		html += "        </div>";
		    		if(list[i].chYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico01.png'  alt='추천'/>";
			    		html += "            <span>추천</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].cwYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico05.png'  alt='세차'/>";
			    		html += "            <span>세차</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].fmYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico05.png'  alt='1급정비'/>";
			    		html += "            <span>1급정비</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].lmYn == "Y") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico03.png'  alt='경정비'/>";
			    		html += "            <span>경정비</span>";
			    		html += "        </div>";
		    		}
		    		if(list[i].seasonGbn == "02") {
			    		html += "        <div class='state'>";
			    		html += "            <img src='/img/common/state_ico04.png'  alt='겨울용'/>";
			    		html += "            <span>겨울용</span>";
			    		html += "        </div>";
		    		}
	                html += "    </div>";
	              	//조직코드 , 주소 , 우편 번호 , 상세 인덱스
	                html += "    <button type='button' class='type18' onClick='storeFix(\""+list[i].agencyCd+"\", \""+list[i].agencyNm+"\", \""+list[i].city + " " +list[i].street+"\", \""+list[i].salesGroup+"\", \""+list[i].salesOffice+"\" , \""+i+"\");'>선택하기<i class='ico15 po_03 fr'></i></button>";
	                html += "</div>";
	                html += "</li>";

	                var obj = {
		        			title	: list[i].agencyNm,
		        			addr 	: list[i].city + " " +list[i].street,
		        			lat		: list[i].posX,
		        			lon		: list[i].posY,
		        			};

	    			positions.push(obj);
	    		}
				$("#storeList").html(html);
				$("#storeListCnt").html(list.length);

				var pageCommon = data.pageCommon;
				PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions);
    		} else {
    			html += "<li>조회된 전문점이 없습니다.</li>";
    			$("#storeList").html(html);
				$("#storeListCnt").html("0");
    		}
        },
        error: function(xhr,status,error){
        	//ComUtil.alert(support0014);
        }
    });
}

// 주문신청 등록
function fn_Updateproc(){

 	if(this.dblClick >= 1){
		return false;
	}

	if($('#ordNo1').val() == null || $('#ordNo1').val() == ""){
		ComUtil.alert("계약번호를 선택해주세요");
		return false;
	}


	if($('#phone1').val() == null || $('#phone1').val()  == ""){
		ComUtil.alert("휴대폰번호를 넣어주세요");
		return false;
	}

	if($('#phone2').val() == null || $('#phone2').val()  == ""){
		ComUtil.alert("휴대폰번호를 넣어주세요");
		return false;
	}

	if($('#phone3').val() == null || $('#phone3').val()  == ""){
		ComUtil.alert("휴대폰번호를 넣어주세요");
		return false;
	}

	if($('#matCd').val() == null || $('#matCd').val()  == ""){
		ComUtil.alert("신청 타이어종류를 선택해주세요");
		return false;
	}


	if($('#cntCd').val() == null || $('#cntCd').val()  == ""){
		ComUtil.alert("신청 타이어본수를 선택해주세요");
		return false;
	}

	//장착주소 체크
	var chkNum = $(':radio[name="mounting"]:checked').val();

	if(chkNum == '1010'){ //방문장착 서비스
		if($('#addrTxtB').val() == null || $('#addrTxtB').val()  == ""){
			ComUtil.alert("방문장착 주소를 입력해주세요");
			return false;
		}
	}else if(chkNum == '1020'){ //픽업 앤 딜리버리

		if($('#addrTxtP1').val() == null || $('#addrTxtP1').val()  == ""){
			ComUtil.alert("픽업 주소를 입력해주세요");
			return false;
		}
		if($('#addrTxtP2').val() == null || $('#addrTxtP2').val()  == ""){
			ComUtil.alert("딜리버리 주소를 입력해주세요");
			return false;
		}

	}else if(chkNum == '1040'){ //전문점 장착서비스

		if($('#addrTxtJ').val() == null || $('#addrTxtJ').val()  == ""){
			ComUtil.alert("장착받으실 장착점을 입력해주세요");
			return false;
		}
	}

	if($('#datepicker').val() == null || $('#datepicker').val() == ''){
		ComUtil.alert("장착 희망일자를 입력하세요.");
		return false;
	}

	if($('#instTm').val() == null || $('#instTm').val() == ''){
		ComUtil.alert("장착 희망시간를 입력하세요.");
		return false;
	}

	var msg = $('#custNm').val() + " 고객님께서 신청하신 걱정제로 서비스가 접수되었습니다.";
		  msg += " 대리점: " + $('#insStoreName').val()  + ", 연락처:" + $('#telNo').val() + ", 장착 요청일: " + $('#datepicker').val();

	 $('#smsMsg').val(msg);

		if(chkNum == '1010'){ //방문장착 서비스
			  $('#insertAddr2').val($('#visZip').val()+') '+$('#addrTxtB').val());
		}else if(chkNum == '1020'){ //픽업 앤 딜리버리
			 // 픽업
			  $('#insertAddr2').val($('#zipCodeP1').val()+') '+ $('#addrTxtP1').val());
			//딜리버리
			  $('#insertAddr3').val($('#zipCodeP2').val()+') '+$('#addrTxtP2').val());

		}else if(chkNum == '1040'){ //전문점 장착서비스
			  $('#insertAddr1').val($('#insStoreName').val());
			  $('#insertAddr2').val($('#insStoreAddr').val());
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
			dlvPosCd 		= $('#centZip').val();
			dlvAddr1	= $('#centAddr1').val();
			dlvAddr2	= $('#centAddr2').val();
		}

		if(confirm("수정하시겠습니까?")){
			var pUrl = "/mypage/zeroServiceUpdateProc";
			var pSendData = {
											commDvsn 		:	'U'
											,dlvrSeq 			:	$('#dlvrSeq').val()
											,ordNo1 			:	$('#ordNo').val()
											,custNo 			:	$('#custNo').val()
											,custNm 			:	$('#custNm').val()
											,agencyCd 			:	$('#insStoreCd').val()
											,matnr 				:	$('#matCd').val()
											,kwmeng 			:	$('#cntCd').val()
											,servrqDay 			:	$('#datepicker').val().replace(/-/gi,'')
											,servSeq 			:	null
											,dlvStat 			:	'01'
											,addr1 				:	$('#insertAddr2').val()
											,dlvTel 			:	$('#phone1').val() + $('#phone2').val() + $('#phone3').val()
											,dlvDesc 			:	$('#textArea').val()
											,smsMsg 			:	$('#smsMsg').val()
											,regId 				:	'ONL_SYS'
											,instCd 			: 	$('#mountingStat').val() 								//*장착유형코드          *-  O2O의 장착코드(1010, 1020, 1030)을 그대로 보내주시면 됩니다
											,instTm 			: 	$('#instTm').val().replace(/:/gi,'') 			//방문,픽딜,전문점 구분코드
											,inst2Addr1 		: 	$('#insertAddr3').val()					//*장착주소2             *-  우편번호, 주소1, 주소2 통합, P&D의 Delivery 주소인 경우에만 입력
											,carNo 				: 	$('#carNo').val() 										//*차량번호              *-  */

											/*20191212 API를 또 던져주라 해서 추가함.  */
											,pikPosCd				: 	pikPosCd
											,pikAddr1				: 	pikAddr1
											,pikAddr2				: 	pikAddr2
											,dlvPosCd				: 	dlvPosCd
											,dlvAddr1				: 	dlvAddr1
											,dlvAddr2				: 	dlvAddr2
											,regDt					: <%=sdf.format(cal.getTime())%>
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
			    	if(data.successCode == -1){ /* 실패시 메세지 */
			    		ComUtil.alert(data.returnMessage);
			    	}else{/* 성공시 메세지 */
			    		ComUtil.alert(data.returnMessage);
			    		window.location.href="/mypage/myRentalList";
			    	}
			    },
			    error: function (e) {
					console.log(e);
				}
			});
		}
}

function fn_goList(){
	window.location.href="/mypage/myRentalList";
}

// 주문내역 취소
function fn_Cancel(){
	if(confirm("삭제하시겠습니까?")){
		var pUrl = "/mypage/zeroServiceCancel";
		var pSendData = {
										commDvsn 			:	'D'
										,dlvrSeq 			:	$('#dlvrSeq').val()
										,ordNo1 			:	$('#ordNo').val()
										,custNo 			:	$('#custNo').val()
										,dlvrDay        	: 	$('#dlvrDay').val()
										,custNm 			:	null
										,agencyCd 			:	null
										,matnr 				:	null
										,kwmeng 			:	null
										,servrqDay 			:	null
										,servSeq 			:	null
										,dlvStat 			:	null
										,addr1 				:	null
										,dlvTel 			:	null
										,dlvDesc 			:	null
										,smsMsg 			:	null
										,regId 				:	'ONL_SYS'
										,instCd 			: $('#mountingStat').val() 								//*장착유형코드          *-  O2O의 장착코드(1010, 1020, 1030)을 그대로 보내주시면 됩니다
										,instTm 			: $('#instTm').val().replace(/:/gi,'') 			//방문,픽딜,전문점 구분코드
										,inst2Addr1 		: $('#addrTxtP2').val() 										//*장착주소2             *-  우편번호, 주소1, 주소2 통합, P&D의 Delivery 주소인 경우에만 입력
										,carNo 				: $('#carNo').val() 										//*차량번호              *-  */
										,regDt					: <%=sdf.format(cal.getTime())%>
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
			    	if(data.resultGoList == 'Y'){
			    		ComUtil.alert("수정, 삭제는 배송 상태가 요청접수시에만 가능합니다.");
			    		window.location.href="/mypage/myRentalList";
			    	}else{
			    		if(data.successCode == -1){ /* 실패시 메세지 */
				    		ComUtil.alert(data.returnMessage);
				    	}else{/* 성공시 메세지 */
				    		ComUtil.alert(data.returnMessage);
				    		window.location.href="/mypage/myRentalList";
				    	}
			    	}
			    },
			    error: function (e) {
					console.log(e);
				}
			});
	}
}

</script>