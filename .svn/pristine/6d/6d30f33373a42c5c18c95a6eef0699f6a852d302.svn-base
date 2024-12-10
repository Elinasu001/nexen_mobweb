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
	<script type="text/javascript" src="/js/lib/datepicker-ko.js"></script>
	
	<!-- 다음 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>

<form name="submitParam" method="post" enctype="multipart/form-data" onSubmit="return false;">
	<input type="hidden" name="userId" value="${userVo.loginId}"/>
	<input type="hidden" name="custNo" 			id="custNo" value="${custInfo.custNo}"/>
	<input type="hidden" name="custNm" 			id="custNm" value="${custInfo.custNm}" />
	<input type="hidden" name="custId" 			id="custId" value="${custInfo.custId}" />


	<input type="hidden" name="ordNo" 			id="ordNo"/>
	<input type="hidden" name="cancelType" 	id="cancelType"/>

	<input type="hidden" name="cust_no_hid" 	id="cust_no_hid"/>

	<input type="hidden" name="servCnt" 			id="servCnt"/>

	<input type="hidden" name="consignee"		id="consignee"/>

	<input type="hidden" name="homePosNo" 	id="homePosNo" value="${custInfo.posNo}"/>
	<input type="hidden" name="homeAddr1" 	id="homeAddr1" value="${custInfo.addr1}"/>
	<input type="hidden" name="homeAddr2"  	id="homeAddr2" value="${custInfo.addr2}"/>

	<input type="hidden" name="phone_num" 	id="phone_num" value="${custInfo.phone1}${custInfo.phone2}${custInfo.phone3}"/>



	<!-- 일반 전문점 선택 및 픽업 주소 -->
	<input type="hidden" name="post_no" 			id="post_no" value=""/>
	<input type="hidden" name="addr1_hid" 		id="addr1_hid" value=""/>
	<input type="hidden" name="addr2_hid" 		id="addr2_hid" value=""/>

	<!-- 딜리버리 주소 -->
	<input type="hidden" name="post_no_drv" 			id="post_no_drv" value=""/>
	<input type="hidden" name="addr1_hid_drv" 		id="addr1_hid_drv" value=""/>
	<input type="hidden" name="addr2_hid_drv" 		id="addr2_hid_drv" value=""/>

	<!-- 교체 예정일 넣어주기 -->
	<input type="hidden" name="reqInsDt_hid" 		id="reqInsDt_hid" value=""/>

	<!-- 배송시 요청사항 넣어주기 -->
	<input type="hidden" name="con_hid" 		id="con_hid" value=""/>

	<input type="hidden" name="insStoreCd_hid" id="insStoreCd_hid" value=""/>

	<input type="hidden" name="phone1" id="phone1" value="${custInfo.phone1}">
	<input type="hidden" name="phone2" id="phone2" value="${custInfo.phone2}" />
	<input type="hidden" name="phone3" id="phone3" value="${custInfo.phone3}" />

	<input type="hidden" id="carMn" 		name="carMn" />
	<input type="hidden" id="carNm" 		name="carNm" />
	<input type="hidden" id="carNo" 		name="carNo" />
	<input type="hidden" id="matCd" 		name="matCd" />
	<input type="hidden" id="matCd11" 	name="matCd11" />
	<input type="hidden" name="smsMsg" id="smsMsg" />

	<input type="hidden" name="nice_fuelCd" id="nice_fuelCd" />				<!-- 나이스에서 온 유종 -->
	<input type="hidden" name="nice_yrmlCd" id="nice_yrmlCd" />			<!-- 나이스에서 온 연식 -->
	<input type="hidden" name="nice_dsplmtCd" id="nice_dsplmtCd" />	<!-- 나이스에서 온 배기량 -->
	<input type="hidden" name="nice_carnum" id="nice_carnum" />			<!-- 나이스에서 온 차대번호 -->

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header">
	        	<h2 class="title-deco">
              		<span>책임지고</span> <span>관리합니다</span>
            	</h2>
            	<h3 class="title-deco-sub">엔진오일 서비스 신청</h3>
          	</div>
          	<!-- //header -->

          	<div class="order-header-message text-center">
	        	<p>고객님께서 직접 엔진오일 서비스 신청 및 신청내역을 조회할 수 있습니다.</p>
          	</div>


			<c:choose>
				<c:when test="${fn:length(oilServiceInsertList) > 0}">
					<c:forEach var="data" items="${oilServiceInsertList}" varStatus="status">
						<input type="hidden" name="custNo" id="custNo" 					value="${data.custNo}"/>
                        <input type="hidden" name="${data.ordNo}_insStoreCd" 	id="${data.ordNo}_insStoreCd"	value="${data.agencyCd}"/>
                        <input type="hidden" name="${data.ordNo}_orderNo"		 	id="${data.ordNo}_orderNo" 		value="${data.ordNo}" 		/>
                        <input type="hidden" name="${data.ordNo}_orderId" 		 	id="${data.ordNo}_orderId" 		value="${data.custNm}" 	/>
                        <input type="hidden" name="${data.ordNo}_mobNo" 		 	id="${data.ordNo}_mobNo"			value="${data.mobNo}" 		/>
                        <input type="hidden" name="${data.ordNo}_makerNm" 	 	id="${data.ordNo}_makerNm"		value="${data.makerNm}" 	/>
                        <input type="hidden" name="${data.ordNo}_modelNm" 	 	id="${data.ordNo}_modelNm"		value="${data.modelNm}" 	/>
                        <input type="hidden" name="${data.ordNo}_carNo"			id="${data.ordNo}_carNo"			value="${data.carNo}" 		/>
                        <input type="hidden" name="${data.ordNo}_serv_cnt0" 	 	id="${data.ordNo}_serv_cnt0"		value="${data.servCnt0}" 	/>
                        <input type="hidden" name="${data.ordNo}_dlv_stat" 		id="${data.ordNo}_dlv_stat"		value="${data.dlvStat}" 		/>
                        <input type="hidden" name="${data.ordNo}_servCnt"		 	id="${data.ordNo}_servCnt"			value="${data.servCnt0}" 	/>
                        <input type="hidden" name="${data.ordNo}_carId" 			id="${data.ordNo}_carId"			value="${data.carId}" 		/>
                        <input type="hidden" name="${data.ordNo}_periodCd" 		id="${data.ordNo}_periodCd"		value="${data.periodCd}" 	/>
                        <input type="hidden" name="${data.ordNo}_procDay" 		id="${data.ordNo}_procDay"		value="${data.procDay}" 	/>
                        <input type="hidden" name="smsMsg" id="smsMsg" 								value="" />

						<!-- list -->
						<div class="mynexen-engine-oil">
            				<article class="order-single inset-m layout-c" onClick="setOrderInfo('${data.ordNo}'); event.preventDefault();">
            					<div class="order-info-summary-wrap">
									<div class="order-info-summary col-1">
										<small>계약일 ${data.ordDay}</small>
										<small>계약번호
											<font color="blue">${data.ordNo}</font></a>
											<font color="red">${data.dlvstatNm}</font>
										</small>
									</div>
								</div>
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
                      							<!-- <li><span>승용차</span><span>사계절</span><span>순정</span></li> -->
                      							<li>${data.matNm}</li>
                      							<li><span>${data.makerNm}</span><span>${data.modelNm}</span></li>
                    						</ul>
                  						</div>
                					</div>
              					</div>

              					<div class="layout-c mt-m">
                					<div class="layout-r inline-s order-rent">
                  						<div class="order-count inline align-middle">
                    						<b class="align-middle">수량</b><span>${data.cntCd}</span>
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
              					<div class="text-right">장착일 ${data.procDay}</div>
              					<input type="hidden" name="${data.ordNo}_periodCd" id="${data.ordNo}_periodCd"  value="${data.periodCd}" />
			                    <input type="hidden" name="${data.ordNo}_procDay"  id="${data.ordNo}_procDay" value="${data.procDay}" />
            				</article>
          				</div>
    				</c:forEach>
				</c:when>
				<c:otherwise>
					<div class='inset-m text-center'>조회된 목록이 없습니다.</div>
				</c:otherwise>
			</c:choose>

            <div class="mynexen-engine-oil">
            	<div class="accordion-box js-accordion">
              		<div id="product-review" class="accordion">
                		<h3>계약 정보</h3>
              		</div>
              		<div class="accordion-info inset-ml">
              			<input type="hidden" name="ordNo1"  id="ordNo1" disabled="disabled" title="계약자 입력란">
              			<input type="hidden" id="phone01" disabled="disabled" title="휴대폰 번호 입력란" value="${custInfo.phone1}-${custInfo.phone2}-${custInfo.phone3}">
	              		<%-- <input type="hidden" name="consignee" id="consignee" disabled="disabled" title="아이디 입력란" value="${custInfo.custNm} / ${custInfo.custId}"> --%>
	              		<!-- consignee는 input이 중복으로 존재. PC 확인 필요. MEPARK -->

                		<div class="submit layout-c mb-m border-bottom">
                			<p class="black">계약번호</p>
                			<p class="pt-s pb-s" id="pOrdNo1"></p>
              			</div>
              			<div class="submit mb-m layout-c border-bottom">
                			<p class="black">휴대전화</p>
                			<p class="pt-s pb-s" id="pPhone01">${custInfo.phone1}-${custInfo.phone2}-${custInfo.phone3}</p>
              			</div>
              			<div class="submit mb-m layout-c border-bottom">
                			<p class="black">아이디</p>
                			<p class="pt-s pb-s" name="pConsignee" id="pConsignee">${custInfo.custNm} / ${custInfo.custId}</p>
              			</div>
              			<div class="submit layout-c inline-m same-size mb-m">
                			<div class="mb-s">
                  				<label for="delivery01"><span class="black">장착 또는 배송 선택</span></label>
                  				<!-- <button type="button" class="ml-s popup-guide">이용가이드</button> -->
                			</div>
                			<div class="layout-r inline same-size">
                  				<div class="inline">
                    				<div class="radio full-width">
                      					<input type="radio" name="dlvGbn" id="delivery01" checked="checked" value="01" class="radioChk" title="배송지 선택">
                      					<label for="delivery01"><span>배송지 선택</span></label>
                    				</div>
                  				</div>
                  				<!-- <div class="inline">
                    				<div class="radio full-width">
                      					<input type="radio" name="dlvGbn" id="delivery02" value="02" class="radioChk" title="장착 서비스 이용">
                      					<label for="delivery02"><span>장착 서비스 이용</span></label>
                    				</div>
                  				</div> -->
                			</div>
              			</div>
              			<div class="submit layout-c inline-m same-size">
                			<div class="mb-s">
                  				<label for="oilCar01"><span class="black">엔진오일 차량정보</span></label>
                			</div>
                			<div class="layout-r inline mb-s same-size">
                  				<div class="inline">
                    				<div class="radio full-width">
                      					<input type="radio" name="oilCar" id="oilCar01" checked="checked" value="01" class="radioChk" title="차량번호 검색">
                      					<label for="oilCar01"><span>차량번호 검색</span></label>
                    				</div>
                  				</div>
                  				<div class="inline">
                    				<div class="radio full-width">
                      					<input type="radio" name="oilCar" id="oilCar02" value="02" class="radioChk" title="직접입력">
                      					<label for="oilCar02"><span>직접입력</span></label>
                    				</div>
                  				</div>
                			</div>
                			<!-- 차량번호 검색 했을때 -->
                			<div class="layout-r search-number border-bottom" id="searchCarNum">
                  				<input type="text" id="niceCar" name="niceCar" class="inset-m research-input" placeholder="차량번호를 입력해 주세요." onkeydown="enterNiceKarSchKey();">
                  				<button type="button" class="result-research" onclick="javascript:fnSearchniceCarInfo(); return false">차량번호검색</button>
                			</div>
                			<!-- 차량번호 검색 했을때 -->

                			<!-- 직접입력 선택 했을때 MEPARK 필요함-->
                			<div class="layout-c search-number border-bottom" id="userInputTxt" style="display: none">
                  				<div class="border-bottom">
                  					<input type="text" id="carnum" name="carnum" class="inset-m full-width" placeholder="(차대 번호) 수입 차량일 경우 꼭 기재를 해주십시요.">
                  				</div>
                  				<!-- <input type="text" id="carnum2" name="carnum2" class="inset-m research-input" placeholder="콤보박스3개필요"> -->
               					<div class="layout-r inline-m same-size order-basket">
				                    <div class="inline">
				                    	<select id="fuelCd">
				                        	<option value="">유종</option>
				                        	<c:forEach var="oliCdList" items="${oliCdList}" >
												<option value="${oliCdList.cmmCd}">${oliCdList.cmmNm}</option>
											</c:forEach>
				                      	</select>
				                    </div>
				                    <div class="inline">
				                      	<select id="yrmlCd">
				                        	<option value="">연식</option>
				                        	<c:forEach var="yearCdList" items="${yearCdList}" >
												<option value="${yearCdList.cmmCd}">${yearCdList.cmmNm}</option>
											</c:forEach>
				                      	</select>
				                    </div>
				                    <div class="inline">
				                      	<select id="dsplmtCd">
				                        	<option value="">배기량</option>
				                        	<c:forEach var="dispCdList" items="${dispCdList}" >
												<option value="${dispCdList.cmmCd}">${dispCdList.cmmNm}</option>
											</c:forEach>
				                      	</select>
				                    </div>
				            	</div>
                			</div>
                			<!-- 직접입력 선택 했을때 MEPARK 필요함-->
                			<div class="pt-ml rent-footer">
                  				<ul>
                    				<li>연체중인 계약일 경우 서비스 신청에 제한이 있을 수 있습니다.</li>
                    				<li>정확한 부품 서비스를 위하여 고객님 차량 정보의 차량등록증을 확인
                        				하여 기입하여 주시기 바랍니다. 자세한 내용을 모르실 경우 배송 요청
                        				사항에 차대번호(차량등록증에서 확인가능)를 입력해주세요. </li>
                    				<li>정확하지 않은 정보 입력으로 인해, 상이한 차종의 엔진오일 패키지
                        				[엔진오일,오일필터,에어필터]가 배송 서비스 될 경우 당사에서는
                        				책임을 지지 않으며 서비스를 실시할 수 없을 경우 현장에서 추가
                        				비용이 발생할 수 있습니다.</li>
                  				</ul>
                			</div>
              			</div>
              		</div>
              		<div class="accordion" id="dlvInfo">
                		<h3>배송지 정보</h3>
              		</div>
              		<div class="accordion-info inset-ml" id="dlvInfoDetail">
                		<div class="submit layout-c mb-m">
    						<div class="mb-s">
      							<label for="info01"><span class="essen black">배송지</span></label>
    						</div>

    						<div class="layout-r inline same-size">
      							<div class="inline">
        							<div class="radio full-width">
          								<input type="radio" name="dlvGb1" id="delivery03" checked="checked" value="01" class="radioChk" title="대리점 배송">
          								<label for="delivery03"><span>대리점 배송</span></label>
        							</div>
      							</div>
      							<div class="inline">
        							<div class="radio full-width">
          								<input type="radio" name="dlvGb1" id="delivery04" value="02" class="radioChk" title="자택 배송">
          								<label for="delivery04"><span>자택 배송</span></label>
        							</div>
      							</div>
    						</div>
  						</div>

  						<div class="submit layout-c mb-m" id="reqInsDtDiv">
    						<div class="layout-c search-number border-bottom mb-s">
      							<div>
        							<label for="info01"><span class="essen black">교체 예정일</span></label>
      							</div>
      							<div class="layout-r order-basket">
        							<div class="dateTime layout-r same-size border-bottom">
	        							<div class="inline pl-ml2">
				                      		<input type="text" name="reqInsDt" class="datepicker" id="datepicker1" title="교체 예정일 입력란" readonly="readonly" style="width:70%;">
				                    	</div>
        							</div>
      							</div>
    						</div>

    						<p class="validation">
      							<span>방문장착 서비스가 가능합니다.</span>
    						</p>
  						</div>

  						<div class="submit layout-c mb-m" id="jumpoDrv">

  							<!-- 배송지 정보용 전문점 선택시 들어가는 데이터 -->
                           	<input type="hidden" name="drv_insStoreCd" 		id="drv_insStoreCd">
	                      	<input type="hidden" name="drv_insStoreName" 	id="drv_insStoreName">
	                      	<input type="hidden" name="drv_insStoreAddr"	id="drv_insStoreAddr">
	                      	<input type="hidden" name="drv_salesGroup" 		id="drv_salesGroup">
	                      	<input type="hidden" name="drv_salesOffice" 	id="drv_salesOffice">
	                      	<!-- //배송지 정보용 전문점 선택시 들어가는 데이터 -->

    						<div class="layout-c search-number border-bottom">
      							<div>
        							<label for="info02"><span class="essen black">전문점 선택</span></label>
      							</div>
      							<div class="layout-r">
        							<input type="text" id="drv_addrTxtJ" class="inset-m research-input" placeholder="전문점 찾기" readonly="readonly">
        							<input type="hidden" id="drv_addrTxtJ1" />
                                    <input type="hidden" id="drv_addrTxtJ2" />
                                    <input type="hidden" id="drv_addrzipCode" />
                                    <input type="hidden" id="zipCodeJ" />
        							<button type="button" class="result-research md-trigger" name="selectAddr" val="J" onclick="callMap('1');" data-modal="modal-Shop">전문점 찾기</button>
      							</div>
    						</div>
  						</div>

  						<div class="submit layout-c mb-m" id="jatackDrv" style="display: none">
    						<div class="layout-c search-number border-bottom">
      							<div>
        							<label for="info02"><span class="essen black">배송 주소</span></label>
      							</div>
      							<div class="layout-r">
        							<input type="text" id="drv_addrTxtB" class="inset-m research-input" placeholder="주소 입력란" readonly="readonly">
        							<input type="hidden" id="drv_addrTxtB1" />
                                    <input type="hidden" id="drv_addrTxtB2" />
                                    <input type="hidden" id="drv_zipCodeB" />
        							<button type="button" class="result-research md-trigger" name="selectAddr" onclick="selectJusoPop('A'); return false;">배송주소 찾기</button>
      							</div>
    						</div>
  						</div>

  						<div class="submit layout-c mb-l">
    						<div class="layout-c search-number border-bottom mb-s">
      							<div>
        							<label for="carNum"><span class="essen black">배송시 요청사항</span></label>
      							</div>
      							<div class="layout-r">
        							<input type="text" id="textArea1" name="textArea1" class="inset-m research-input" placeholder="고객님의 차량에 특이사항이 있을 경우 입력하여 주세요.">
      							</div>
    						</div>
    						<p class="validation">
      							<span id="messagebyte">86/2000 Byte</span>
    						</p>
  						</div>
						<!-- 여기까지 내용이 완전히 달라짐. -->
              		</div>
              		<br>
              		<!-- 동의 부분은 공통적으로 적용된다. MEPARK -->
              			<div class="submit layout-c">
   							<div class="submit border-bottom">
     							<div class="pb-s border-bottom">
       								<div class="check">
         								<input type="checkbox" id="allAgree" name="allAgree" value="0" class="type01">
         								<label for="allAgree"><span></span><b>아래 내용에 동의합니다.</b></label>
       								</div>
     							</div>
     							<div class="agree-check">
       								<div class="check">
         								<input type="checkbox" id="agree01" name="agree" value="0" class="type01">
         								<label for="agree01" class="layout-r"><span></span><b>대리점 배송 외(자택 배송) 선택 시 엔진오일 교체서비스가 1회 차감에 동의합니다.</b></label>
       								</div>
	       							<div class="check">
	         							<input type="checkbox" id="agree02" name="agree" value="0" class="type01">
	         							<label for="agree02" class="layout-r"><span></span><b>오일 서비스 배송지를 자택으로 지정하신 경우에는 렌탈 전문점에서 무상교체 서비스를 제공하지 않습니다.</b></label>
	       							</div>
	       							<div class="check">
	         								<input type="checkbox" id="agree03" name="agree" value="0" class="type01">
	         								<label for="agree03" class="layout-r"><span></span><b>제품 배송시 (주)AJ카리안에 고객님의 개인정보 중 성명, 전화번호, 주소지, 차량정보의 위탁에 동의합니다.</b></label>
	       							</div>
	       							<div class="check">
	         								<input type="checkbox" id="agree04" name="agree" value="0" class="type01">
	         								<label for="agree04" class="layout-r"><span></span><b>엔진오일교체 서비스의 주문이 접수 중일 때까지는 취소가 가능합니다. 다만 배송준비 중일 경우부터는 취소가 불가능합니다.</b></label>
	       							</div>
	       							<div class="check">
	         								<input type="checkbox" id="agree05" name="agree" value="0" class="type01">
	         								<label for="agree05" class="layout-r"><span></span><b>엔진오일 발송은 SK사의 ZIC X7을 발송합니다. 고객님의 차종에 해당 엔진오일이 부적합할 경우 당사 선정 엔진오일 교체점 또는 고객님께서 지정하신 교체점에서 협의하시기 바랍니다.  상기 제품 외 타 엔진오일은 제공이 불가능합니다.</b></label>
	       							</div>
     							</div>
   							</div>
 						</div>
 					<!-- //동의 부분은 공통적으로 적용된다. MEPARK -->
            	</div>
          	</div>

          	<div class="mynexen-engine-oil">
            	<button type="button" class="link text-center inset-m full-width btn-primary" onclick="javascript:fn_InsertProc();">
              		신청
            	</button>
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
		            		</div>
		            		<!-- <button type="button" class="go-view full-width inset-s">O2O 서비스 장착 전문점 한눈에 보기</button> -->
		          		</div>
		          		<!-- 찾기 검색 -->

		          		<button type="button" class="search-shop" onclick="selectStore(1); return false;"><span></span>전문점 찾기</button>

		          		<div class="count-box utility layout-r pl-m pr-m">
		            		<div class="utility-result-total pt-s pb-s">
		              			<span>total</span>
		              			<span class="totalCnt" id="storeListCnt"></span>
		            		</div>
		            		<!-- <div class="utility-result-map pt-s pb-s">
		              			<button type="button" class="change-map pr-0"><span></span>지도</button>
		            		</div> -->
		          		</div>
		        	</div>
		      	</div>
		      	<div class="position">
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

	<!-- page script -->
    <script src="/js/lib/classie.js"></script>
    <!-- <script src="/js/lib/modalEffects.js"></script> -->
    <!-- //page script -->

<script type="text/javascript">

var jusoGbn = "";
var dblClick = 0;
var chkcomp = "N";
var mountCheck1 = "";	//현재 선택 된 장착서비스 유형

$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-worryzero'></div>");
	/* page background image End */

	// @@ test code
	//장착점
	//$("#orgzCd").val("O41119095");
/* 	$("#insStoreCd").val("110397");
	$("#insStoreName").val("타이어테크 충주직영점");
	$("#insStoreAddr").val("충청북도 충주시국원대로 228");
	$("#salesGroup").val("RE3");
	$("#salesOffice").val("RE39"); */

	//달력 입력란 클릭 시
    $("#datepicker1, #datepicker2").click(function() {
        //$(this).datepicker().datepicker( "show" );
    });
	
	$('#datepicker1').datepicker({
		showOn: "both",
		buttonImage: "/img/common/ico_calendar.png",
		buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		yearRange: 'c-0:c+2',
		minDate: '+3d',
		maxDate: '+10d',
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
		}
    });


	//달력 세팅
	/* $('#datepicker1, #datepicker2').datepicker({
		showOn: "button",
		buttonImage: "/img/common/calendar.png",
		buttonImageOnly: true,
		dateFormat: 'yy-mm-dd',
		yearRange: 'c-0:c+2',
		minDate: '+3d',
		maxDate: '+13d',
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
    }); */


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

  	//장착점
    $("a[name='selectAddr']").on("click" , function(){
    	mountCheck1 = $(this).attr("val");
    });

    $('#textArea1 ').keyup(function (e){
        var content = $(this).val();
        $('#messagebyte').html(content.length + "/2000 Byte");
    });
    $('#textArea1').keyup();


    /* 체크박스 컨트롤 */
    $('#allAgree').on("click" , function(){
		if($(this).is(":checked")) {
			$("input[name=agree]").prop("checked" , true);
			chkcomp = "Y";
		}else{
			$("input[name=agree]").prop("checked" , false);
			chkcomp = "N";
		}
    });

    $('input[name="agree"]').on("click" , function(){
    	var i = 0;
		$("input[name='agree']").each(function(idx){
				if($(this).is(":checked")){
					i++
				}
		});
		if(i == 5){
			chkcomp = "Y";
			$('#allAgree').prop("checked" , true);
		}else{
			chkcomp = "N";
			$('#allAgree').prop("checked" , false);
		}
    });


    /* 차량번호 검색/직접입력 라디오버튼 컨트롤 */
    $('#oilCar01').on("click" , function(){
		 $('#searchCarNum').css("display","");
		 $('#userInputTxt').css("display","none");
    });
    $('#oilCar02').on("click" , function(){
		 $('#searchCarNum').css("display","none");
		 $('#userInputTxt').css("display","");
    });

    /* 장착또는 배송선택 */
    $('#delivery01').on("click" , function(){
		 $('#dlvInfo').css("display","");
		 $('#dlvInfoDetail').css("display","");
		 $('#jangchackInfo').css("display","none");
		 $('#jangchackInfoDetail').css("display","none");
   });
   $('#delivery02').on("click" , function(){
		 $('#jangchackInfo').css("display","");
		 $('#jangchackInfoDetail').css("display","");
		 $('#dlvInfo').css("display","none");
		 $('#dlvInfoDetail').css("display","none");
   });


   /* 대리점배송 자택배송 */
   $('#delivery03').on("click" , function(){
		 $('#jumpoDrv').css("display","");
		 $('#reqInsDtDiv').css("display","");
		 $('#jatackDrv').css("display","none");
  	});

  	$('#delivery04').on("click" , function(){
		  $('#jumpoDrv').css("display","none");
		  $('#jatackDrv').css("display","");
		  $('#reqInsDtDiv').css("display","none");
  	});


  	$('.js-accordion > .accordion').next('.accordion-info.inset-ml').toggle();
});


//주소 선택 팝업
function selectJusoPop(gbn){
	$("#totalCount").text("");
	$("#jusoList").html("");
	$("#paging").html("")
	$("#jusoTxt").val("");

	jusoGbn = gbn;
	$("#modal-Addr").addClass("md-show");
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
var positions = [];
var mapTargetDiv;
var agencyNm;

function callMap(gbn) {
	$("#modal-Shop").addClass("md-show");

	if(gbn == "3") {
		selectStore2($("#meajang").val(), "1");
	} else {
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

		var obj = {
	        			title	: "",
	        			addr 	: "",
	        			lat		: myLat,
	        			lon		: myLon,
	        			};
		positions.push(obj);
		mapTargetDiv = "mapDiv";
		mapDraw(myLon , myLat , "" , positions, "mapDiv");

		//나의 위치 근처 렌탈 전문점 가져오기
		getRentStore(myLat, myLon);
	}
}

//지도 그리기
//지도 그리기
function mapDraw(lon , lat , bhfNm , positions, mapId){
	var agencyLat 	= lat; 	//대리점의 위도
	var agencyLon 	= lon; 	//대리점의 경도
	var agencyBhfNm	= bhfNm; 	//대리점의 경도

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
    /* $("#mapDiv").height("800px");
    $("#mapDiv").width("920px");

    $("#map").addClass("md-show"); */
    infoWindow(marker, agencyBhfNm);
}

function infoWindow(marker, agencyBhfNm, tel_no, rep_nm, city, street, addr3, agency_cd, salesGroup, salesOffice, pos_cd){
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:2px;"><span style="font-weight:bold;">영업점명 </span> : '+agencyBhfNm+'</div>'
    /*
    				+'<div style="padding:2px;"><span style="font-weight:bold;">전화번호 </span> : '+tel_no+'</div>'
    				+'<div style="padding:2px;"><span style="font-weight:bold;">주소 </span> : '+ city + street + '('+ addr3 +')</div>'
    				+'<div style="padding:2px;"><span style="font-weight:bold;">대표자 </span> : '+rep_nm+'</div>'
    				 */
    				,iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
/*
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
*/
 	// 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커 위에 인포윈도우를 표시합니다
        $("#meajang").val(agencyBhfNm);
		$(".shop-search-single").attr("style","display:'';");
		callMap('3');
    });

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

//주소로 거점 재고 체크
//방문 ,픽업
var pageAddr = "";
var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수
function selectStore(pageNo){
	var sido = $("#sido").val();
	var meajang = $("#meajang").val();
	
	if(ValidUtil.isEmpty(sido) && ValidUtil.isEmpty(meajang)) {
		alert("시도 정보 또는 매장명을 입력 하세요.");
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
        		alert(data.rtnMsg);
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
		    		html += "				<button type='button' class='md-close' onClick='storeFix(\""+list[i].agencyCd+"\", \""+list[i].agencyNm+"\", \""+list[i].city + " " +list[i].street+"\", \""+list[i].salesGroup+"\", \""+list[i].salesOffice+"\" , \""+i+"\", \""+list[i].city+"\", \""+list[i].street+"\" , \""+list[i].posCd+"\", \""+list[i].lmYn+"\"  );'><b>선택하기</b><span></span></button>";
		    		html += "			</div>";
		    		html += "		</div>";
		    		html += "	</div>";
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
				//$(".scrollBox.type04").css("display","");

				//var pageCommon = data.pageCommon;
				//PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions);
    		} else {
    			html += "<li>조회된 전문점이 없습니다.</li>";
    			$("#storeList").html(html);
				$("#storeListCnt").html("0");
    		}
        },
        error: function(xhr,status,error){
        	//alert(support0014);
        }
    });
}

//전문점 조회 시 거점 정보 조회
function selectStore2(addrTxt , pageNo){
	if($("#meajang").val() == "") {
		//ComUtil.alert("전문점 주소를 입력 하세요.");
		/* alert("전문점 주소를 입력 하세요.");
		return false; */
	}

	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo};

	ComUtil.loading();
	$.ajax({
        type: "post",
        url: "/order/rentalList",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "-1") {
        		//ComUtil.alert(data.rtnMsg);
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
		        			};

	    			positions.push(obj);
	    		//}
				$("#storeInfo").html(html);
				//$("#storeListCnt").html(list.length);

				//var pageCommon = data.pageCommon;
				//PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions, "mapDiv");
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

//지도 리스트에서 선택 하기 버튼 클릭 이벤트
//조직코드 , 주소 , 우편 번호 , 상세 인덱스
function storeFix(agencyCd , agencyNm , addr, salesGroup, salesOffice, idx, city, street, posCd, lmYn) {

	console.log(agencyCd+  "/ " + agencyNm + "/" + addr + "/" + lmYn  );
	if(lmYn != 'Y'){
		alert("죄송합니다.\n 엔진오일 서비스를 받으실 수 없는 전문점입니다.");
		return;
	}

	var jajakInfo = "("+agencyNm+") "+addr;
	var chkNum = $(':radio[name="dlvGbn"]:checked').val();

	/* 배송지 선택인가 장착선택인가에 따라서 넣는 곳이 달라진다. */
	if(chkNum == '01'){//배송지 선택일경우의 점포
		$('#drv_insStoreName').val(agencyNm);
		$('#drv_insStoreCd').val(agencyCd);
		$('#drv_insStoreAddr').val(addr);
		$('#drv_salesGroup').val(salesGroup);
		$('#drv_salesOffice').val(salesOffice);
		$('#drv_addrTxtJ').val(jajakInfo);

		$('#drv_addrTxtJ1').val(city);
		$('#drv_addrTxtJ2').val(street);
		$('#drv_addrzipCode').val(posCd);

		$('#insStoreCd_hid').val(agencyCd);

	}else{

		$('#insStoreName').val(agencyNm);
		$('#insStoreCd').val(agencyCd);
		$('#insStoreAddr').val(addr);
		$('#salesGroup').val(salesGroup);
		$('#salesOffice').val(salesOffice);
		$('#addrTxtJ').val(jajakInfo);
		$('#insStoreCd_hid').val(agencyCd);

		$('#addrTxtJ1').val(city);
		$('#addrTxtJ2').val(street);
		$('#caddrTxtJ2').val(posCd);
	}

	//조직 코드 세팅
	//$("#orgzCd").val(agencyCd);

	//$(".layPopClose").click();
	sendChildValueCancle('modal-Shop');
	fnMove("dlvInfo");
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
				alert(errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlData);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
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

//상세 주소 화면
function returnAddrInfo(cbData) {

	var gbn = jusoGbn;

	//주문자 주소
	if(jusoGbn == "A"){
		$("#drv_addrTxtB").val(cbData.popLoadAddr+' '+cbData.popDetailAddr);
		$("#drv_addrTxtB1").val(cbData.popLoadAddr);
		$("#drv_addrTxtB2").val(cbData.popDetailAddr);
		$("#drv_zipCodeB").val(cbData.popZipCode);
	}

	sendChildValueCancle("modal-AddtDtl");

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
/* 주문번호 클릭시 정보 셋팅 */
function setOrderInfo(orderNo){

	var consignee 	= $("#"+orderNo+"_orderId").val();
	var consignee = $("input[name="+orderNo+"_orderId]").val();
	var mob_no 	= $("#"+orderNo+"_mobNo").val();
	var phone1 		= mob_no.substring(0,3);
	var phone2 		= mob_no.substring(3,10);
	var carMn 		= $("#"+orderNo+"_makerNm").val();
	var carNm 		= $("#"+orderNo+"_modelNm").val();
	var carNo	 		= $("#"+orderNo+"_carNo").val();
	var custId 		= $("#custId").val();
	var serv_cnt0 	= $("#"+orderNo+"_serv_cnt0").val();
	var dlv_stat 		= $("#"+orderNo+"_dlv_stat").val();
	var custNo 		= $("#custNo").val();
	var servCnt 		= $("#"+orderNo+"_serv_cnt0").val();
	var insStoreCd  = $("#insStoreCd").val();
	var carId 			= $("#"+orderNo+"_carId").val();

	//20190429 계약종료고객 서비스 신청 불가
	//--------------------------------------------------------------------------------------------------------------------------------
	var procDay = $("#"+orderNo+"_procDay").val().replace(/-/gi, "");					    //장착일자
	var period   = $("#"+orderNo+"_periodCd").val();					    //계약기간

	var procYear    		= procDay.substr(0, 4);
	var procMonth   	= procDay.substr(4, 2);
	var procDate    	= procDay.substr(6, 2);

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

	 if (serv_cnt0 == "0"){
		alert("엔진오일잔여횟수가 1회 미만은 신청 불가능 합니다.");
		return false;
	}

	if (dlv_stat != ""){
		alert("이미 신청 중이어서 재 신청 불가능합니다.");
		return false;
	}

	$("#ordNo").val(orderNo);
	$("#consignee").val(consignee+"/"+custId);
	$("#pConsignee").text(consignee+"/"+custId);
	$("#carMn").val(carMn);
	$("#carNm").val(carNm);
	$("#carNo").val(carNo);
	$("#carId").val(carId);
	$("#cust_no_hid").val(custNo);
	//$("#insStoreCd_hid").val(insStoreCd);
	$("#phone1").val(phone1);
	$("#phone2").val(phone2);
	$("#phone_num").val(mob_no);

	$("#ordNo1").val(orderNo);
	$("#pOrdNo1").text(orderNo);//MOB는 p 태그로 바뀌면서 추가
	$("#custNo").val(custNo);
	$("#servCnt").val(servCnt);
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

function fn_popupClose(pId) {
	$("#"+pId).removeClass("md-show");
	if(pId != "modal-Shop") {
		$("#modal-Shop").addClass("md-show");
	}
	fnMove("dlvInfo");
}

function cfnRequestSuccessCallback(pReqId, result){
	
}

// 주문신청 등록
function fn_InsertProc(){

	//MEPARK111
	//배송구분(배송지 선택, 장착서비스 이용)
	var dlvGbn 		= $(':radio[name="dlvGbn"]:checked').val();
	//차량번호 검색, 직접입력 셀렉트박스 선택
	var oilCar 			= $(':radio[name="oilCar"]:checked').val();
	//대리점배송 자택배송
	var dlvGb1 	= $(':radio[name="dlvGb1"]:checked').val();

	if($('#ordNo1').val() == null || $('#ordNo1').val() == ""){
		alert("주문번호를 선택해주세요");
		return false;
	}

	if(oilCar == '01'){ //차량번호 검색일때

		if($('#niceCar').val() == null || $('#niceCar').val() == ""){
			alert("차량번호를 입력해주세요.");
			$('#niceCar').focus();
			return false;
		}
	}else{//직접입력일때 3개의 세렉트 바악스

		$('#niceCar').val('');

		if($('#carnum').val() == null || $('#carnum').val() == ""){
			alert("차대번호를 입력해 주세요");
			return false;
		}

		if($('#fuelCd').val() == null || $('#fuelCd').val() == ""){
			alert("유종 정보를 선택해주세요");
			return false;
		}
		if($('#yrmlCd').val() == null || $('#yrmlCd').val() == ""){
			alert("연식 정보를 선택해주세요");
			return false;
		}
		if($('#dsplmtCd').val() == null || $('#dsplmtCd').val() == ""){
			alert("배기량 정보를 선택해주세요");
			return false;
		}
	}

	/* 배송지 선택에 대리점 배송이냐 자택배송이냐 */

	//배송지 선택
	if(dlvGbn == '01'){
		/* 배송지 선택에 대리점 배송이냐 자택 배송이냐 */
		if(dlvGb1 == '01'){ //대리점 배송


			if($('#datepicker1').val() == null || $('#datepicker1').val() == ""){
				alert("교체 예정일을 선택해 주세요.");
				return false;
			}else{
				$('#reqInsDt_hid').val($('#datepicker1').val())
			}


			if($('#drv_addrTxtJ').val() == null || $('#drv_addrTxtJ').val() == ""){
				alert("렌탈 전문점을 선택해주세요.");
				return false;
			}else{
				$('#post_no').val($('#drv_addrzipCode').val())
				$('#addr1_hid').val($('#drv_addrTxtJ1').val())
				$('#addr2_hid').val($('#drv_addrTxtJ2').val())
			}

		}else{//자택배송
			//교체 예정일을 비워준다
			$('#datepicker1').val('');

			if($('#drv_addrTxtB').val() == null || $('#drv_addrTxtB').val() == ""){
				alert("배송 주소를 입력하세요.");
				return false;
			}else{
				$("#post_no").val($("#drv_zipCodeB").val());
				$("#addr1_hid").val($("#drv_addrTxtB1").val());
				$("#addr2_hid").val($("#drv_addrTxtB2").val());
			}
		}

	}else{ // 장착서비스 이용

		if($('#textArea2').val() == null || $('#textArea2').val() == ""){
			alert("차량번호를 입력하세요..");
			$('#textArea2').focus();
			return false;
		}
	}

	if(chkcomp == 'N'){
		alert("이용약관 및 개인정보 수집 이용에 동의해 주세요");
		return false;
	}

	/* 배송요청사항 배송지 선택과 장착서비스 이용에 따라 분기처리 */
	if(dlvGbn == '01'){
		$('#con_hid').val($('#textArea1').val());
	}else{
		$('#con_hid').val($('#textArea2').val());
	}


	var fuelCd = "";
    var yrmlCd ="";
    var dsplmtCd = "";
    var carId = "";

	/* 엔진오일 차량정보 나이스 dnr에서 받아온 것인지 직접 입력한 것인지에 따라 달리 넣어준다. */
	if(oilCar == '01'){ //차랑번호 검색(나이스 DNR)

		fuelCd = $('#nice_fuelCd').val();   				//연식
		yrmlCd = $('#nice_yrmlCd').val();				//유종

		if (fuelCd.indexOf("Diesel") != -1){
			fuelCd = "DSL";
		}else if(fuelCd.indexOf("LPG") != -1){
			fuelCd = "LPG";
		}else if(fuelCd.indexOf("Gasoline") != -1)  {
			fuelCd = "GAS";
		}
		dsplmtCd = $('#nice_dsplmtCd').val();		//배기량
		carId = $('#nice_carnum').val();				//차대번호

	}else{
		fuelCd = $('#fuelCd').val();
		yrmlCd = $('#yrmlCd').val();
		dsplmtCd = $('#dsplmtCd').val();
		carId = $('#carnum').val();
	}

	//마지막 배송구분을 넣어줘야 하기 때문에 넣어준다.
	finalCode = "";

	if(dlvGbn == '01'){
		finalCode = dlvGb1;
	}else if(dlvGbn == '02'){
	}

		if(confirm("신청하시겠습니까?")){
			var pUrl = "/mypage/oilServiceWriteProc";
			var pSendData = {
									        commDvsn     	: "I",         			 					   								/*처리구분(I,U,D)       */
									        dlvrSeq      		: null,               	 				        							/*순번                 */
									        ordNo        		: $('#ordNo1').val(),                     							/*계약번호            */
									        custNo       		: $('#cust_no_hid').val(),              							/*고객코드            */
									        servSeq      		: null,
									        dlvStat      		: "01",                 					       								/*상태                 */
									        dlvGb                : finalCode,																/*배송구분            */
									        fuelCd       		: fuelCd,                       												/*유종                  */
									        yrmlCd       		: yrmlCd,                     												/*연식                  */
									        dsplmtCd     		: Math.ceil(dsplmtCd/1000) * 1000,		           												/*배기량                */
									        agencyCd     		: $('#insStoreCd_hid').val(),        							 	/*대리점                */
									        consignee    		: $('#custNm').val(),                								/*수취인                */
									        posCd        		: $('#post_no').val(),                  							/*우편번호              */
									        addr1        		: $('#addr1_hid').val(),                   						/*주소1                 */
									        addr2        		: $('#addr2_hid').val(),            								/*주소2					*/
									        inst2PosCd       	: $('#post_no_drv').val(),                 					/*딜리버리 우편번호   */
									        inst2Addr1      	: $('#addr1_hid_drv').val(),                  					/*딜리버리 주소1      */
									        inst2Addr2      	: $('#addr2_hid_drv').val(),             						/*딜리버리 주소2      */
									        instTm 				: "", //$('#mountTime').val().replace(/:/gi,''), 				/*장착희망시간        */
									        dlvTel       			: $('#phone_num').val(),                   					/*연락처                */
									        dlvDesc      		: $('#con_hid').val(),                  							/*배송요청사항          */
									        servrqDay    		: $('#reqInsDt_hid').val().replace(/-/gi, ""),           	/*교체예정일자          */
									        downDay      	:  null,              													/*다운처리일시          */
									        dlvsDay      		:  null,                 													/*송장적용일시          */
									        dlvEnt       		:  null,             															/*배송업체              */
									        trspDoc      		:  null,             															/*송장번호              */
									        carId        			: carId,         				 												/*차대번호          */
									        carNo  				: $('#niceCar').val(),         				 						/*차량번호 검색데이터 나이스로 조회          */
									        regId        			: "ONL_SYS",
									        smsMsg	    	: $('smsMsg').val()
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
			    		alert(data.returnMessage);
			    	}else{/* 성공시 메세지 */
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

function enterNiceKarSchKey() {

	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {
		event.keyCode = 0;
		fnSearchniceCarInfo();
	}
}

function fnSearchniceCarInfo(){
	var niceCarNo = $("#niceCar").val().replace(/(\s*)/g, "");
	var custNm = $("#custNm").val();
	
	if(niceCarNo == "") {
		alert("차량번호를 입력해 주세요.");
		return;
	} else {

		//차량번호 패턴
		var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 12저3456
		var pattern2       	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 123저3456 - 신규 찰야 번호
		var pattern3 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234

		if(niceCarNo.length == 7 ){
			if( !pattern1.test(niceCarNo) ){
				alert( "차량번호를 확인하세요.");
				$("#niceCar").val("");
				$("#niceCar").focus();
				return false;
			}
		} else if( niceCarNo.length == 8 &&  ValidUtil.isNumeric( niceCarNo.substring(0,3))){
			if( !pattern2.test(niceCarNo) ){
				alert( "차량번호를 확인하세요.");
				$("#niceCar").val("");
				$("#niceCar").focus();
				return false;
			}
		} else if( niceCarNo.length == 8 || niceCarNo.length == 9){
			if( !pattern2.test(niceCarNo) ){
				alert( "차량번호를 확인하세요.");
				$("#niceCar").val("");
				$("#niceCar").focus();
				return false;
			}
		} else {
			alert( "차량번호를 확인하세요.");
			$("#niceCar").val("");
			$("#niceCar").focus();
			return false;
		}
	}

	$('#loadingWrap').show();
	
	//나이스 DNR 통신
	$.ajax({
	    url: "/product/niceDnrApi",
	    type: "POST",
	    cache:false,
	    data: {carNo:niceCarNo, usrNm:custNm},
	    success: function(data) {
	    	if(data.code == "000") {
	    		$('#loadingWrap').hide();
	    		
				if (data.carInfo.FUEL.indexOf("Diesel") == -1 && data.carInfo.FUEL.indexOf("LPG") == -1 && data.carInfo.FUEL.indexOf("Gasoline") == -1) {
					alert("죄송합니다. 해당차량은 서비스 신청이 불가합니다. \n (유종 :"+ data.carInfo.FUEL +" 신청불가");
					$('#loadingWrap').hide();
					return;
				}else{
		    		$('#nice_fuelCd').val(data.carInfo.FUEL);					/* 연식 */
		    		$('#nice_yrmlCd').val(data.carInfo.PRYE);					/* 유종 */
		    		$('#nice_dsplmtCd').val(data.carInfo.ENGINESIZE);	/* 배기량 */
		    		$('#nice_carnum').val(data.carInfo.VIN);					/* 차대번호 */
		    		
		    		ComUtil.alert("차량번호 조회 완료");
				}

	    	} else if(data.code == "014") {
	    		alert("[필수값누락:" + data.code + "]" + data.codeNm);
	    		$('#loadingWrap').hide();
		    	//location.href = "/login/userLogin";
		    	return;
		    } else if(data.code == "022") {
		    	alert("차량번호 또는 소유자명 불일치");
		    	$('#loadingWrap').hide();
		    	return;
		    } else {
		    	alert("[시스템 오류:" + data.code + "]" + data.codeNm);
		    	$('#loadingWrap').hide();
		    	return;
		    }
	    	$('#loadingWrap').hide();
	    },
	    error: function (request, status, error) {
	    	$('#loadingWrap').hide();
	    	callBackManager.error(error);
		}
	});
}
</script>