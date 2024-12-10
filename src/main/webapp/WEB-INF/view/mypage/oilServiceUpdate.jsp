<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="/css/OverlayScrollbars.css">
<script type="text/javascript" src="/js/order.js"></script>

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
	<script type="text/javascript" src="/js/order.js"></script>

	<!-- 다음 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>

<form name="submitParam" method="post" enctype="multipart/form-data" onSubmit="return false;">
		<input type="hidden" name="userId" value="${userVo.loginId}"/>
		<input type="hidden" name="custNo" 			id="custNo" 			value="${oilServiceList.custNo}"/>
		<input type="hidden" name="custNm" 			id="custNm" 		value="${oilServiceList.custNm}" />
		<input type="hidden" name="custId" 			id="custId" 			value="${custInfo.custId}" />

		<input type="hidden" name="ordNo" 			id="ordNo" 			value="${oilServiceList.ordNo}"/>
		<input type="hidden" name="cancelType" 	id="cancelType"/>

		<input type="hidden" name="cust_no_hid" 	id="cust_no_hid" 	value="${oilServiceList.custNo}"/>
		<input type="hidden" name="servCnt" 			id="servCnt"/>
		<input type="hidden" name="consignee"		id="consignee" 	value="${custInfo.custNm}"/>
		<input type="hidden" name="homePosNo" 	id="homePosNo" value="${custInfo.posNo}"/>
		<input type="hidden" name="homeAddr1" 	id="homeAddr1" value="${custInfo.addr1}"/>
		<input type="hidden" name="homeAddr2"  	id="homeAddr2" value="${custInfo.addr2}"/>

		<input type="hidden" name="phone_num" 	id="phone_num" value="${custInfo.phone1}${custInfo.phone2}${custInfo.phone3}"/>
		<input type="hidden" name="dlvrSeq"  	id="dlvrSeq" value="${oilServiceList.dlvrSeq}"/>

		<input type="hidden" name="servSeq"  	id="servSeq" value="${oilServiceList.servSeq}"/>

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

		<input type="hidden" name="insStoreCd_hid" id="insStoreCd_hid" value="${oilServiceList.agencyCd}"/>

		<input type="hidden" name="phone1" id="phone1" value="${custInfo.phone1}">
		<input type="hidden" name="phone2" id="phone2" value="${custInfo.phone2}" />
		<input type="hidden" name="phone3" id="phone3" value="${custInfo.phone3}" />

		<input type="hidden" name="dlvrDay" id="dlvrDay" value="${oilServiceList.dlvrDay}"/>

		<input type="hidden" id="carMn" 		name="carMn" />
		<input type="hidden" id="carNm" 		name="carNm" />
		<input type="hidden" id="carNo" 		name="carNo" />
		<input type="hidden" id="matCd" 		name="matCd" />
		<input type="hidden" id="matCd11" 	name="matCd11" />
		<input type="hidden" name="smsMsg" id="smsMsg" />

		<!--subContentsWrap-->
        <div class="subContentsWrap">
                <div class="subContents">
                    <div class="descInfo type05">
                        <p>고객님께서 직접 엔진오일 서비스를 신청하실 수 있으며 신청내역을 조회할 수 있습니다.</p>
                    </div>


                    <h3 class="type11">계약 정보</h3>

                    <div class="submitAreaWrap type02">
                        <!--submitLeft-->
                        <div class="submitLeft">
                            <div class="submitArea type04">
                                <div class="submit">
                                    <label for="contractor"><span>주문정보</span></label>
                                    <div class="conWrap">
										<input type="text" name="ordNo1"  id="ordNo1" class="type03" id="contractor" disabled="disabled"  value="${oilServiceList.ordNo}"  title="계약자 입력란">
                                    </div>
                                </div>
                            </div>

                            <div class="submitArea type04">
                                <div class="submit">
                                    <label for="phone01"><span>휴대폰 번호</span></label>
                                    <div class="conWrap">
                                        <input type="text" name="" class="type03" id="phone01"  value="${oilServiceList.mobNo}" disabled="disabled" title="휴대폰 번호 입력란" value="${custInfo.phone1}-${custInfo.phone2}-${custInfo.phone3}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--submitLeft-->

                        <!--submitRight-->
                        <div class="submitRight">
                            <div class="submitArea type04">
                                <div class="submit">
                                    <label for="id01"><span>아이디</span></label>
                                    <div class="conWrap">
                                    	<input type="text" name="consignee" id="consignee" class="type03"  disabled="disabled" title="아이디 입력란" value="${custInfo.custNm} / ${custInfo.custId}">
                                    </div>
                                </div>
                            </div>

                            <div class="submitArea type04">
                                <div class="submit">
                                    <label for="delivery01"><span class="ls02">장착 또는 배송 선택</span></label>
                                    <div class="conWrap">
	                                    <input type="radio" name="dlvGbn" <c:if test="${oilServiceList.dlvGb == '01' or oilServiceList.dlvGb == '02' or oilServiceList.dlvGb == '03'}"> checked="checked"</c:if> id="delivery01" value="01" class="type06" title="배송지 선택"><label for="delivery01"><span>배송지 선택</span></label>
                                        <%-- <input type="radio" name="dlvGbn" <c:if test="${oilServiceList.dlvGb == '11' or oilServiceList.dlvGb == '12' or oilServiceList.dlvGb == '13'}"> checked="checked"</c:if> id="delivery02" value="02" class="type06" title="장착 서비스 이용 선택"><label for="delivery02"><span>장착 서비스 이용</span></label> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--submitRight-->
                    </div>

                    <div class="submitArea type06 w100per">
                        <div class="submit list">
                            <label for="oilCar01"><span>엔진오일 차량정보 </span></label>
                            <div class="conWrap type02">
								<div class="raWrap">
									<input type="radio" name="oilCar" id="oilCar01" <c:if test="${oilServiceList.niceCarNo != '' and  oilServiceList.niceCarNo != null }"> checked="checked" </c:if> value="01" class="type06" title="차량번호 검색 선택"><label for="oilCar01"><span>차량번호 검색</span></label>
									<input type="radio" name="oilCar" id="oilCar02" <c:if test="${oilServiceList.niceCarNo == '' or  oilServiceList.niceCarNo == null }"> checked="checked" </c:if> value="02" class="type06" title="직접입력 선택"><label for="oilCar02"><span>직접입력</span></label>
								</div>


                                <!-- 차량번호 검색 했을때 -->
								<div class="po_l01" id="searchCarNum" <c:if test="${oilServiceList.niceCarNo == '' or  oilServiceList.niceCarNo == null }">style="display: none"</c:if>>
									<input type="text" name="niceCar" class="type03 w220" id="niceCar" onkeydown="enterNiceKarSchKey();" title="차량번호 입력란" placeholder="차량번호를 입력해주세요" value="${oilServiceList.niceCarNo}">
									<a href="javascript:fnSearchniceCarInfo();" class="searchBtn03" onclick="return false"></a>
								</div>
                                <!-- 차량번호 검색 했을때 -->



                                <!-- 직접입력 선택 했을때 -->
								<div class="po_l02" id="userInputTxt" <c:if test="${oilServiceList.niceCarNo != '' and  oilServiceList.niceCarNo != null }">style="display: none"</c:if>>
									<input type="text" name="carnum" class="type03 w400" id="carnum" title="차량번호 입력란" value="${oilServiceList.carId}" placeholder="차대 번호를 반드시 입력해 주십시오.">

                                    <select class="type04 w120 ml20" name="fuelCd" id="fuelCd" title="유종선택">
                                                <option value="">유종</option>
                                                <c:forEach var="oliCdList" items="${oliCdList}" >
													<option <c:if test="${oilServiceList.fuelCd == oliCdList.cmmCd}">selected="selected"</c:if> value="${oliCdList.cmmCd}">${oliCdList.cmmNm}</option>
												</c:forEach>
                                    </select>

                                    <select class="type04 w120 ml20" name="yrmlCd" id="yrmlCd" title="연식선택">
                                                <option value="">연식</option>
                                                <c:forEach var="yearCdList" items="${yearCdList}" >
													<option <c:if test="${oilServiceList.yrmlCd == yearCdList.cmmCd}">selected="selected"</c:if> value="${yearCdList.cmmCd}">${yearCdList.cmmNm}</option>
												</c:forEach>
                                    </select>

                                    <select class="type04 w120 " name="dsplmtCd" id="dsplmtCd" title="배기량선택">
                                                <option value="">연식</option>
                                                <c:forEach var="dispCdList" items="${dispCdList}" >
													<option <c:if test="${oilServiceList.dsplmtCd == dispCdList.cmmCd}">selected="selected"</c:if> value="${dispCdList.cmmCd}">${dispCdList.cmmNm}</option>
												</c:forEach>
                                    </select>
								</div>




                                <!-- 직접입력 선택 했을때 -->

                            </div>
                        </div>
                    </div>

                    <p class="desc type10">
                            ※ 연체중인 계약일 경우 서비스 신청에 제한이 있을 수 있습니다.  <br/>
                            ※ 정확한 부품 서비스를 위하여 고객님 차량 정보의 차량등록증을 확인하여 기입하여 주시기 바랍니다. 자세한 내용을 모르실 경우 배송 요청사항에 차대번호(차량등록증에서 확인가능)를 입력해주세요.<br/>
                            ※ 정확하지 않은 정보 입력으로 인해, 상이한 차종의 엔진오일 패키지[엔진오일,오일필터,에어필터]가 배송 서비스 될 경우 당사에서는 책임을 지지 않으며 서비스를 실시할 수 없을 경우 현장에서 추가 비용이 발생할 수 있습니다.
                    </p>




                    <h3 class="type11" id="dlvInfo" <c:if test="${oilServiceList.dlvGb != '01' and oilServiceList.dlvGb != '02' and oilServiceList.dlvGb != '03'}">style="display: none"</c:if> >배송지 정보</h3>
                    	<div class="submitArea type04" id="dlvInfoDetail" <c:if test="${oilServiceList.dlvGb != '01' and oilServiceList.dlvGb != '02' and oilServiceList.dlvGb != '03'}">style="display: none"</c:if>>

                            <div class="submit">

                                <label for="delivery03"><span class="essen black">배송지</span></label>
                                <div class="conWrap">
                                    <input type="radio" name="dlvGb1" id="delivery03"  <c:if test="${oilServiceList.dlvGb == '01'}">checked="checked"</c:if> value="01" class="type06" title="대리점배송 선택"><label for="delivery03"><span>대리점 배송</span></label>
                                    <input type="radio" name="dlvGb1" id="delivery04"  <c:if test="${oilServiceList.dlvGb == '02'}">checked="checked"</c:if> value="02" class="type06" title="자택 배송 선택"><label for="delivery04"><span>자택 배송</span></label>
                                </div>
                            </div>

                            <div class="submit" id="reqInsDtDiv">
                                <label for="date"><span class="essen black">교체 예정일</span></label>

                                <div class="conWrap">
                                        <div class="dateTime">
                                           <div class="date">
                                               <input type="text" name="reqInsDt" class="type03 w205" id="datepicker1" title="교체 예정일 입력란"  <c:if test="${oilServiceList.dlvGb == '01'}">value="${oilServiceList.servrqDay1}"</c:if>>
                                           </div>
                                        </div>
                                </div>

                                <p class="validation type04">
                                    <span><i class="ico11"></i>교체 예정일 7일 이후 부터 선택 가능합니다.</span>
                                </p>
                            </div>


                            <div class="submit" id="jumpoDrv">

                            <!-- 배송지 정보용 전문점 선택시 들어가는 데이터 -->
                            <!-- 배송지 정보용 전문점 선택시 들어가는 데이터 -->
                           	<input type="hidden" name="drv_insStoreCd" 		id="drv_insStoreCd">
	                      	<input type="hidden" name="drv_insStoreName" 	id="drv_insStoreName">
	                      	<input type="hidden" name="drv_insStoreAddr"	id="drv_insStoreAddr">
	                      	<input type="hidden" name="drv_salesGroup" 		id="drv_salesGroup">
	                      	<input type="hidden" name="drv_salesOffice" 		id="drv_salesOffice">

                             <label for="info02"><span class="essen black">전문점 선택</span></label>
                             <div class="conWrap">
                                 <a href="#" name="selectAddr" val="J" class="searchBtn03 md-trigger" onclick="callMap('1');" data-modal="modal-1"></a>
                                 <input type="text" name="addrTxtJ" class="type03 w970" id="drv_addrTxtJ" title="주소 입력란" placeholder="전문점 찾기" <c:if test="${oilServiceList.dlvGb == '01'}">value="(${oilServiceList.agencyNm}) ${oilServiceList.addr1} ${oilServiceList.addr2}"</c:if>>
                                       <input type="hidden" id="drv_addrTxtJ1"   	<c:if test="${oilServiceList.dlvGb == '01'}">value="${oilServiceList.addr1}"</c:if>/>
                                       <input type="hidden" id="drv_addrTxtJ2"   	<c:if test="${oilServiceList.dlvGb == '01'}">value="${oilServiceList.addr2}"</c:if>/>
                                       <input type="hidden" id="drv_addrzipCode"  	<c:if test="${oilServiceList.dlvGb == '01'}">value="${oilServiceList.posCd}"</c:if> />


                             </div>
                         </div>
                           <!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->

                            <div class="submit" id="jatackDrv"  style="display: none">
                                <label for="info02"><span class="essen black">배송 주소</span></label>
                                <div class="conWrap">
                                       <a href="#" name="selectAddr" class="searchBtn03 md-trigger" onclick="selectJusoPop('B');" data-modal="modal-1"></a>
                                       <input type="text" name="drv_addrTxtB" id="drv_addrTxtB" disabled="disabled" class="type03 w970" <c:if test="${oilServiceList.dlvGb == '02'}"> value="${oilServiceList.addr1} ${oilServiceList.addr2}"</c:if> title="주소 입력란">
                                       <input type="hidden" id="drv_addrTxtB1" 	<c:if test="${oilServiceList.dlvGb == '02'}">value="${oilServiceList.addr1}"</c:if>/>
                                       <input type="hidden" id="drv_addrTxtB2" 	<c:if test="${oilServiceList.dlvGb == '02'}">value="${oilServiceList.addr2}"</c:if> />
                                       <input type="hidden" id="drv_zipCodeB" 	<c:if test="${oilServiceList.dlvGb == '02'}">value="${oilServiceList.posCd}"</c:if>/>
                                </div>
                            </div>

							<div class="submit list">
								<label for="carNum"><span class="essen black">배송시 요청사항</span></label>
								<div class="conWrap">
									<textarea title="내용 입력란" id="textArea1" name="textArea1" placeholder="내용을 입력해주세요" class="type02 w1000"><c:if test="${oilServiceList.dlvGb == '01' or oilServiceList.dlvGb == '02' }">${oilServiceList.dlvDesc}</c:if></textarea>
								</div>
								<p class="validation type04">
									<span id="messagebyte"><i class="ico11"></i>86/2000 Byte</span>
								</p>
							</div>
						</div>



                   	<h3 class="type11" id="jangchackInfo" <c:if test="${oilServiceList.dlvGb != '11' and oilServiceList.dlvGb != '12' and oilServiceList.dlvGb != '13'}"> style="display: none"</c:if>>장착서비스 정보</h3>
                      <!-- 장착서비스 정보-->
                    <div class="submitArea type04"  id="jangchackInfoDetail" <c:if test="${oilServiceList.dlvGb != '11' and oilServiceList.dlvGb != '12' and oilServiceList.dlvGb != '13'}"> style="display: none"</c:if>>
                    		<!-- 장착서비스 선택시 전문점 선택 시들어가는 파라메터 -->
                    		<!-- 장착서비스 선택시 전문점 선택 시들어가는 파라메터 -->
	                         <input type="hidden" name="insStoreCd" 		id="insStoreCd">
	                      	<input type="hidden" name="insStoreName" 	id="insStoreName">
	                      	<input type="hidden" name="insStoreAddr"		id="insStoreAddr">
	                      	<input type="hidden" name="salesGroup" 		id="salesGroup">
	                      	<input type="hidden" name="salesOffice" 		id="salesOffice">


							<input type="hidden" name="telNo" id="telNo" />
							<input type="hidden" name="smsMsg" id="smsMsg" />
							<input type="hidden" name="mountingStat" id="mountingStat" />	<!-- 장착서비스 구분코드 -->
                            <div class="submit">
                                <label for="info01"><span class="essen black">장착 서비스</span></label>
                                <div class="conWrap">
<%--                                         <input type="radio" name="mounting" id="ser1" <c:if test="${oilServiceList.dlvGb == '11'}"> checked="checked"</c:if> value="11" class="type06" title="방문장착서비스 선택" ><label for="ser1"><span>방문장착서비스</span></label> --%>
                                        <input type="radio" name="mounting" id="ser2" <c:if test="${oilServiceList.dlvGb == '12'}"> checked="checked"</c:if>value="12" class="type06" title="픽업&딜리버리 장착 서비스 선택"><label for="ser2"><span>픽업&딜리버리 장착 서비스</span></label>
<%--                                         <input type="radio" name="mounting" id="ser3" <c:if test="${oilServiceList.dlvGb == '13'}"> checked="checked"</c:if>value="13" class="type06" title="전문점 장착 서비스 선택"><label for="ser3"><span>전문점 장착 서비스</span></label> --%>
								</div>
                            </div>

                            <!-- 방문 장착일때 -->
                            <div class="submit" id="noPickUp"  <c:if test="${oilServiceList.dlvGb != '11'}">  style="display: none" </c:if>>
                                <label for="info02"><span class="essen black">장착 주소</span></label>

                                    <div class="conWrap">
                                        <a href="#" name="selectAddr" val="B" class="searchBtn03" onclick="selectJusoPop('B');" data-modal="modal-1"></a>
                                        <input type="text" name="addrTxtB" id="addrTxtB" disabled="disabled" class="type03 w970"  title="주소 입력란" <c:if test="${oilServiceList.dlvGb == '11'}"> value="${oilServiceList.addr1} ${oilServiceList.addr2}"</c:if>>
                                       <input type="hidden" id="addrTxtB1" <c:if test="${oilServiceList.dlvGb == '11'}">value="${oilServiceList.addr1}"</c:if>/>
                                       <input type="hidden" id="addrTxtB2" <c:if test="${oilServiceList.dlvGb == '11'}">value="${oilServiceList.addr2}"</c:if>/>
                                        <input type="hidden" id="zipCodeB"  <c:if test="${oilServiceList.dlvGb == '11'}">value="${oilServiceList.posCd}"</c:if>/>
                                    </div>

                                    <p class="validation type03 w754">
										<span id="addrOkB"><i class="ico08"></i>입력주신 장소로 방문하여 장착 서비스 진행이 가능합니다.</span>
									</p>

                            </div>
                            <!-- 방문 장착일때 -->

                              <!-- 픽업 딜리버리 장착일때 -->
                                <div class="submitGroup" id="pickUp" <c:if test="${oilServiceList.dlvGb != '12'}">  style="display: none" </c:if>>
                                    <div class="submit">
                                        <label for="info03"><span class="essen black">픽업 주소</span></label>

                                        <div class="conWrap">
                                            <a href="#" name="selectAddr" val="P1" class="searchBtn03 md-trigger" onclick="selectJusoPop('P1');" data-modal="modal-1"></a>
                                            <input type="text" name="addrTxtP1" id="addrTxtP1" disabled="disabled" class="type03 w970" id="info03" title="픽업 주소 입력란" placeholder="픽업 주소를 검색하세요." <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.addr1} ${oilServiceList.addr2}"</c:if>>
	                                        <input type="hidden" id="addrTxtP11" <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.addr1}" </c:if>/>
	                                        <input type="hidden" id="addrTxtP12" <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.addr2}" </c:if>/>
                                            <input type="hidden" id="zipCodeP1"  <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.posCd}"</c:if>/>
                                        </div>

										<p class="validation type03 w754">
                                            <span id="addrOkP1"><i class="ico08"></i>입력주신 장소로 방문하여 장착 서비스 진행이 가능합니다.</span>
                                        </p>
                                    </div>

                                    <div class="submit">
                                        <label for="info03"><span>딜리버리 주소</span></label>

                                        <div class="conWrap">
                                            <a href="#" name="selectAddr" val="P2" class="searchBtn03 md-trigger" onclick="selectJusoPop('P2');" data-modal="modal-1"></a>
                                            <input type="text" name="" id="addrTxtP2" disabled="disabled" class="type03 w970" title="딜리버리 주소 입력란" placeholder="딜리버리 주소를 검색하세요." <c:if test="${oilServiceList.dlvGb == '12'}"> value="${oilServiceList.inst2Addr1} ${oilServiceList.inst2Addr2}" </c:if>>
	                                        <input type="hidden" id="addrTxtP21" <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.inst2Addr1}"/ </c:if>>
	                                        <input type="hidden" id="addrTxtP22" <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.inst2Addr2}" </c:if> />
                                            <input type="hidden" id="zipCodeP2"   <c:if test="${oilServiceList.dlvGb == '12'}">value="${oilServiceList.inst2PosCd}" </c:if>/>
                                        </div>

										 <p class="validation type03 w754">
											<span id="addrOkP2"><i class="ico08"></i>입력주신 장소로 방문하여 장착 서비스 진행이 가능합니다.</span>
										</p>

                                    </div>
                                </div>
                                   <!-- //픽업 딜리버리 장착일때 -->

                                   <!-- 전문점 방문장착일때 -->
                                <div class="submit" id="junmun"   <c:if test="${oilServiceList.dlvGb != '13'}"> style="display: none" </c:if>>
                                    <label for="info04"><span class="essen black">장착 주소</span></label>

                                    <div class="conWrap">
                                        <a href="#" name="selectAddr" val="J" class="searchBtn03 md-trigger" onclick="callMap('1');" data-modal="modal-1"></a>
                                        <input type="text" name="" id="addrTxtJ" disabled="disabled" class="type03 w970"  title="주소 입력란"  placeholder="장착받으실 주소를 검색하세요."<c:if test="${oilServiceList.dlvGb == '13'}"> value="(${oilServiceList.agencyNm}) ${oilServiceList.addr1} ${oilServiceList.addr2}"</c:if>>
                                       <input type="hidden" id="addrTxtJ1" 		<c:if test="${oilServiceList.dlvGb == '13'}">value="${oilServiceList.addr1}"</c:if>/>
                                       <input type="hidden" id="addrTxtJ2" 		<c:if test="${oilServiceList.dlvGb == '13'}">value="${oilServiceList.addr2}"</c:if>/>
                                       <input type="hidden" id="addrzipCode" 	<c:if test="${oilServiceList.dlvGb == '13'}">value="${oilServiceList.posCd}" </c:if>/>
                                    </div>

                                    <p class="validation type03 w754">
										<span id="addrOkJ"><i class="ico08"></i>입력주신 장소로 방문하여 장착 서비스를 받으세요.</span>
									</p>
                                </div>
                                <!-- 전문점 방문장착일때 -->

                            <div class="submit">
                                <label for="date"><span class="essen black">장착 희망일시</span></label>

                                <div class="conWrap">
                                        <div class="dateTime">
                                           <div class="date">
                                               <input type="text" name="reqInsDt" class="type03 w205" id="datepicker2" title="장착 희망일시 입력란" value="${oilServiceList.servrqDay1}">
                                           </div>

                                           <div class="time">
                                               <input type="text" class="timepicker w205" name="mountTime" id="mountTime" value="${oilServiceList.instTm}" title="장착 희망시간 입력란"/>
                                           </div>
                                        </div>
                                </div>

                                <p class="validation type04">
                                    <span><i class="ico11"></i>서비스 매니저가 연락 드리도록 하겠습니다.</span>
                                </p>
                            </div>

                            <div class="submit">
                                <label for="date"><span class="essen black">차량번호</span></label>

                                <div class="conWrap">
                                        <div class="dateTime">
                                           <div class="date">
                                               <input type="text" name="textArea2"  id="textArea2" class="type03 w300" title="차량번호를 입력하세요" <c:if test="${oilServiceList.dlvGb == '11' or oilServiceList.dlvGb == '12' or oilServiceList.dlvGb == '13' }">value="${oilServiceList.dlvDesc}"</c:if>>
                                           </div>
                                        </div>
                                </div>

                                <p class="validation type04">
                                    <span><i class="ico11"></i>장착을 위해 고객차량 확인용으로 이용됩니다.</span>
                                </p>
                            </div>
                        </div>

                    <div class="btnArea type01 center">
		                        <div class="btnArea type01 center">
		                             <button type="button" class="type05 center w387" onclick="javascript:fn_goList();">목록</button>
			                        <c:if test="${oilServiceList.dlvStat == '01'}">
			                             <button type="button" class="type01 center w387" onclick="javascript:fn_Updateproc();">수정</button>
			                             <button type="button" class="type02 center w387" onclick="javascript:fn_Delete();">삭제</button>
									</c:if>


                    </div>
            </div>
		</div>
		<!--subContentsWrap-->
</form>


<form name="jusoFrm" id="jusoFrm" method="post" >
	<input type="hidden" name="currentPage" id="currentPage" value="1"/>
	<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
	<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
	<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
	<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
	<input type="hidden" name="keyword" id="keyword" />
</form>

		 <!-- layerPopup // -->
		<div class="popupWrap type03 md-modal-3" name="popAddr"> <!-- md-show -->
	        <header class="noLine">
	            <a href="#" class="layPopClose md-close"></a>
	        </header>

			<p class="desc">예) 도로명 :마곡중앙로 177 더넥센유니버시티 /지번 : 마곡동 756-5  / 건물명 : 넥센유니버시티 </p>

	        <div class="numberSearch type02">
				<label for="carNumber">우편번호 검색</label>
	            <input type="text" name="jusoTxt" id="jusoTxt" class="type04" onkeydown="enterSchKey();" placeholder="도로명/지번/건물명 주소 입력"> <a href="javascript:selectJuso('1');" class="searchBtn"></a>
	        </div>


	        <!--contents-->
	        <div class="popContents">
				<div class="zipCode">
					<div class="total">total<span id="totalCount"></span></div>

					<table class="tbl type02">
						<caption>검색완료</caption>
						<colgroup>
							<col style="width:70px"/>
							<col />
							<col style="width:120px"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									주소
								</th>
								<th scope="col"></th>
								<th scope="col">
									우편번호
								</th>
							</tr>
						</thead>
						<tbody id="jusoList">
						</tbody>
					</table>
	            </div>

	            <!--paging-->
	            <div class="paging type02" id="paging" style="display:none;"></div>
				<!--paging-->

	        </div>
	        <!--contents-->
	    </div>

	<!-- layerPopup // -->
		<div class="popupWrap map md-modal" id="map"> <!-- md-modal-2 md-show -->
	        <a href="#" class="layPopClose md-close"></a>

			<!--contents-->
			<div class="popContents">
	            <!--mapInfoBox-->
	            <div class="mapInfoBox">
	                <div class="mapInfoTop">
	                    <!-- 찾기 검색 -->
	                    <div class="searchArea">
	                        <h3 class="type08">전문점 찾기</h3>

	                        <ul>
	                            <li>
	                                <select class="type04 w130 po_05" title="시/도 선택" onchange="selectSiGunGu();" id="sido">
                                    <option value="">시/도 선택</option>
	                            	<c:forEach var="list" items="${selectSiDoList}" varStatus="status">
	                                    <option value="${list.cdNm }">${list.cdNm }</option>
	                                </c:forEach>
	                                </select>

	                                <select class="type04 w150 po_05" title="시/군/구 선택" id="sigungu">
	                                </select>
	                            </li>
	                            <li><input type="text" name="meajang" class="type08 w100per" id="meajang" title="매장명 입력란" placeholder="매장명을 입력해보세요"></li>
	                        </ul>
	                    </div>
	                    <!-- 찾기 검색 -->

	                    <button type="button" class="type01 center w100per" onclick="selectStore('1'); return false;"><i class="ico13 po_04"></i> 전문점 찾기</button>

	                    <div class="totalBar">
	                        <div class="total">total<span id="storeListCnt"></span></div>
	                        <a href="#" class="orderListBtn open" onclick="return false"></a>
	                    </div>
	                </div>

	                <div class="mapInfoBottom orderList">
	                    <div class="scrollBox type04 ">
	                        <div class="serResult">
	                            <ul id="storeList">
	                            </ul>
	                        </div>
	                    </div>

	                     <div class="pagingFooter">
	                     	<div class="paging" id="pagingMap" style="display:none;"></div>
	                    </div>
	                </div>
	            </div>
	            <!--mapInfoBox-->

	            <!-- 지도 들어갈 자리 세로값 800px -->
				<div class="mapView" id="mapDiv" style="width:920px;height:800px;">
	            </div>
	            <!-- 지도 들어갈 자리 -->
			<!--contents-->
	            </div>
	    </div>
	    <!-- layerPopup // -->

		<!-- layerPopup // -->
		<div class="popupWrap hAuto md-modal" id="modal-2" name="popAddrDetail"> <!-- md-modal-3 md-effect-1 md-show -->
	        <header class="noLine">
	            <a href="#" class="layPopClose md-close"></a>
	        </header>
			<p class="desc"><!-- 예) 도로명 :마곡중앙로 177 더넥센유니버시티 /지번 : 마곡동 756-5  / 건물명 : 넥센유니버시티 --> </p>
	        <div class="numberSearch type02">
				<label for="carNumber">우편번호 검색</label>
	            <input type="text" name="" id="" disabled="disabled" class="type04" >
	            <!--  <a href="#" class="searchBtn"></a> -->
	        </div>
	        <!--contents-->
	        <div class="popContents">
	            <!-- 주소 -->
	            <table class="tbl submit">
	                <caption>주소</caption>
	                <colgroup>
	                    <col style="width:150px">
	                    <col>
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">
	                            <label for="tit01"><span class="black">우편번호</span></label>
	                        </th>
	                        <td>
	                            <p id="popZipCode">56735</p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row" class="vTop">
	                            <label for="tit01"><span class="essen black">주소</span></label>
	                        </th>
	                        <td class="type02">
	                            <!-- 주소 -->
	                            <div class="address">
	                                <ul>
	                                    <li>
	                                        <span class="addTit">도로명</span>
	                                        <span id="popLoadAddr"></span>
	                                    </li>
	                                    <li>
	                                        <span class="addTit">지번</span>
	                                        <span  id="popJibunAddr"></span>
	                                    </li>
	                                </ul>
	                            </div>
	                            <!-- 주소 -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row" class="vTop">
	                            <label for="popDetailAddr"><span class="essen black">상세주소</span></label>
	                        </th>
	                        <td class="type03">
	                            <input type="text" name="popDetailAddr" class="type03 w450" id="popDetailAddr" title="상세주소 입력란" placeholder="예)넥센아파트 1동 1101호 지하2층 주차장 N8)">
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	            <!-- 주소 -->
	            <div class="btnArea type03">
	                 <button type="button" class="type04 w50per" onclick="sendChildValueCancle();">취소<i class="ico01"></i></button>
	                 <button type="button" class="type01 w50per" onclick="sendChildValueFix();">적용<i class="ico01"></i></button>
	             </div>

	        </div>
	        <!--contents-->
	    </div>
		<div class="md-overlay"></div>
		<!-- layerPopup // -->

<script type="text/javascript">

var jusoGbn = "";
var dblClick = 0;

$( document ).ready(function() {

	// @@ test code
	//장착점
	//$("#orgzCd").val("O41119095");
/* 	$("#insStoreCd").val("110397");
	$("#insStoreName").val("타이어테크 충주직영점");
	$("#insStoreAddr").val("충청북도 충주시국원대로 228");
	$("#salesGroup").val("RE3");
	$("#salesOffice").val("RE39");
 */
	//달력 입력란 클릭 시
    $("#datepicker1, #datepicker2").click(function() {
        $(this).datepicker().datepicker( "show" );
    });


	//달력 세팅
	$('#datepicker1, #datepicker2').datepicker({
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


	//@@common_ui.js 에 정의 되어 있음. 상세 조절 시 여기꺼 사용 - 운영 반영 시 common_ui에 꺼 삭제
	$("#mountTime").timepicker({
	    timeFormat: 'H:mm',
	    interval: 30,
	    startTime: '09:30',
	    endTime: '17:30',
	    minTime: '09:30:00',
	    maxTime: '17:45:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true
	});

	//장착 서비스 변경 시
    $("input[name='mounting']").on("click" , function(){
    	if($(this).val() == "11") {
    		//방문
    		$("#noPickUp").show();
    		$("#pickUp").hide();
    		$("#junmun").hide();
    		$('#mountingStat').val('11');
    	} else if($(this).val() == "12") {
			//픽업
    		$("#noPickUp").hide();
    		$("#pickUp").show();
    		$("#junmun").hide();
    		$('#mountingStat').val('12');
    	} else if($(this).val() == "13") {
    		//전문
    		$("#noPickUp").hide();
    		$("#pickUp").hide();
    		$("#junmun").show();
    		$('#mountingStat').val('13');
    	}

    	mountCheck = $(this).val();
    });

  	//장착점
    $("a[name='selectAddr']").on("click" , function(){
    	mountCheck1 = $(this).attr("val");
    });

    $('#textArea1').keyup(function (e){
        var content = $(this).val();
        $('#messagebyte').html(content.length + "/2000 Byte");
    });
    $('#textArea1').keyup();


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
    	var dlvGb1 		= $(':radio[name="dlvGb1"]:checked').val();
    	if(typeof dlvGb1 == 'undefined'){
    		$('#delivery03').prop("checked" , true);
    	}
		 $('#dlvInfo').css("display","");
		 $('#dlvInfoDetail').css("display","");
		 $('#jangchackInfo').css("display","none");
		 $('#jangchackInfoDetail').css("display","none");

   });
   $('#delivery02').on("click" , function(){


	   	var mounting 		= $(':radio[name="mounting"]:checked').val();
		if(typeof mounting == 'undefined'){
			$('#ser1').prop("checked" , true);
			$("#noPickUp").show();
		}
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
	                html += "    <button type='button' class='type18' onClick='storeFix(\""+list[i].agencyCd+"\", \""+list[i].agencyNm+"\", \""+list[i].city + " " +list[i].street+"\", \""+list[i].salesGroup+"\", \""+list[i].salesOffice+"\" , \""+i+"\", \""+list[i].city+"\", \""+list[i].street+"\" , \""+list[i].posCd+"\", \""+list[i].lmYn+"\" );'>선택하기<i class='ico15 po_03 fr'></i></button>";
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
				$(".scrollBox.type04").css("display","");

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
        	//alert(support0014);
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

	chkNum

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

	$(".layPopClose").click();

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
	//$("#jusoTxt").val("");

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
}

//상세 주소 화면
function sendChildValueFix() {

	if($('#popDetailAddr').val() == ""){
		alert("상세주소를 입력하세요.");
		$('#popDetailAddr').focus();
		return false;
	}

	var gbn = jusoGbn;

	//방문 장착
	if(gbn == "B" || gbn == "P1" || gbn == "P2") {

		//재고 체크
		var mountCd = $("input[name='mounting']:checked").val();		//장착구분
		var mountDt = $("#datepicker2").val().replace(/-/gi, "");		//장착일
		var mountTime = $("#mountTime").val().replace(/[^0-9]/g,"");	//장착시간
		//itemCd및 수량
		var itemCdArr = new Array();
		var itemCntArr = new Array();
		var chkNum = $(':radio[name="dlvGbn"]:checked').val();



		$("ul[name='ordNoSn']").each(function(idx){
			itemCdArr.push($(this).attr("itemcd"));
			itemCntArr.push($("input[name='cntCd']").val().substring(1,2));
		});
		$("#itemCdArr").val(itemCdArr);
		$("#itemCntArr").val(itemCntArr);

		var param = {iplAddr : $("#popLoadAddr").text() , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : mountDt , mountTime : mountTime , pageNo : '1' , searchGbn : "store"};
		if(gbn == "B") {
			alert(chkNum);
			if(chkNum == '1'){
				$("#drv_addrTxtB").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
				$("#drv_addrTxtB1").val($("#popLoadAddr").text());
				$("#drv_addrTxtB2").val($("#popDetailAddr").val());
				$("#drv_zipCodeB").val($("#popZipCode").text());
			}else{
				$("#addrTxtB").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
				$("#addrTxtB1").val($("#popLoadAddr").text());
				$("#addrTxtB2").val($("#popDetailAddr").val());
				$("#zipCodeB").val($("#popZipCode").text());
			}
		}
		// 픽업
		else if(jusoGbn == "P1"){
			$("#addrTxtP1").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
			$("#addrTxtP11").val($("#popLoadAddr").text());
			$("#addrTxtP12").val($("#popDetailAddr").val());
			$("#zipCodeP1").val($("#popZipCode").text());
		}


		// 딜리버리
		else if(jusoGbn == "P2"){
			$("#addrTxtP2").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
			$("#addrTxtP21").val($("#popLoadAddr").text());
			$("#addrTxtP22").val($("#popDetailAddr").val());
			$("#zipCodeP2").val($("#popZipCode").text());
		}

		/* $.ajax({
	        type: "post",
	        url: "/order/searchRentStore",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	if(data.rtnCode == "-1") {
	        		alert(data.rtnMsg);
	        		return;
	        	}
        		var list = data.list;

        		if(list.length > 0) {
	        		if(gbn == "B") {
	        			$("#addrTxtB").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
	    				$("#zipCodeB").val($("#popZipCode").text());
	    			}
	    			// 픽업
	    			else if(jusoGbn == "P1"){
	    				$("#addrTxtP1").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
	    				$("#zipCodeP1").val($("#popZipCode").text());
	    			}
	    			// 딜리버리
	    			else if(jusoGbn == "P2"){
	    				$("#addrTxtP2").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
	    				$("#zipCodeP2").val($("#popZipCode").text());
	    			}
        		}
	        },
	        error: function(xhr,status,error){
	        	//alert(support0014);
	        }
	    }); */
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

//시도 셀렉트 선택 시 시군구 조회
function selectSiGunGu(){
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

// 주문신청 등록
function fn_Updateproc(){

	//배송구분(배송지 선택, 장착서비스 이용)
	var dlvGbn 		= $(':radio[name="dlvGbn"]:checked').val();
	//차량번호 검색, 직접입력 셀렉트박스 선택
	var oilCar 			= $(':radio[name="oilCar"]:checked').val();
	//장착서비스 구분 (방문장착, 픽업앤 딜리버리, 전문점 장착서비스 )
	var mounting 	= $(':radio[name="mounting"]:checked').val();
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
				$("#post_no").val($("#drv_zipCodeB").text());
				$("#addr1_hid").val($("#drv_addrTxtB1").text());
				$("#addr2_hid").val($("#drv_addrTxtB2").val());
			}
		}

	}else{ // 장착서비스 이용

		/* 방문장착서비스냐 */
		if(mounting == '11'){
			if($('#addrTxtB').val() == null || $('#addrTxtB').val() == ""){
				alert("장착주소를 선택해 주세요.");
				return false;
			}else{
				$('#post_no').val($('#zipCodeB').val())
				$('#addr1_hid').val($('#addrTxtB1').val())
				$('#addr2_hid').val($('#addrTxtB2').val())
			}


			if($('#datepicker2').val() == null || $('#datepicker2').val() == ""){
				alert("장착희망일을 입력하세요.");
				return false;
			}else{
				$('#reqInsDt_hid').val($('#datepicker2').val())
			}

			if($('#mountTime').val() == null || $('#mountTime').val() == ""){
				alert("장착희망시간을 입력하세요.");
				return false;
			}

			/* 픽업주소 지우기 */
			$("#addrTxtP1").val('');
			$("#zipCodeP1").val('');
			$("#addrTxtP11").val('');
			$("#addrTxtP12").val('');

			/* 딜리버리 주소 지우기 */
			$("#addrTxtP2").val('');
			$("#zipCodeP2").val('');
			$("#addrTxtP21").val('');
			$("#addrTxtP22").val('');

		}else if(mounting == '12'){/* 픽업&딜리버리 서비스냐 */

			if($('#addrTxtP1').val() == null || $('#addrTxtP1').val() == ""){
				alert("픽업 주소를 입력하세요.");
				return false;
			}else{
				$("#post_no").val($("#zipCodeP1").val());
				$("#addr1_hid").val($("#addrTxtP11").val());
				$("#addr2_hid").val($("#addrTxtP12").val());
			}

			if($('#addrTxtP2').val() == null || $('#addrTxtP2').val() == ""){
				alert("딜리버리 주소를 입력하세요.");
				return false;
			}else{
				$("#post_no_drv").val($("#zipCodeP2").val());
				$("#addr1_hid_drv").val($("#addrTxtP21").val());
				$("#addr2_hid_drv").val($("#addrTxtP22").val());
			}

			if($('#datepicker2').val() == null || $('#datepicker2').val() == ""){
				alert("장착희망일을 입력하세요.");
				return false;
			}else{
				$('#reqInsDt_hid').val($('#datepicker2').val())
			}

			if($('#mountTime').val() == null || $('#mountTime').val() == ""){
				alert("장착희망시간을 입력하세요.");
				return false;
			}

			/* 배송/전문점 주소 지우기 */
			$("#addrTxtJ").val('');
			$("#addrTxtJ1").val('');
			$("#addrTxtJ2").val('');
			$("#addrzipCode").val('');

		}else{/* 전문점 장착 서비스냐 */

			if($('#addrTxtJ').val() == null || $('#addrTxtJ').val() == ""){
				alert("장착 주소를 입력하세요.");
				return false;
			}else{
				$("#post_no2").val($("#addrzipCode").text());
				$("#addr1_hid2").val($("#addrTxtJ1").text());
				$("#addr2_hid2").val($("#addrTxtJ2").val());
			}

			if($('#datepicker2').val() == null || $('#datepicker2').val() == ""){
				alert("장착희망일을 입력하세요.");
				return false;
			}else{
				$('#reqInsDt_hid').val($('#datepicker2').val())
			}

			if($('#mountTime').val() == null || $('#mountTime').val() == ""){
				alert("장착희망시간을 입력하세요.");
				return false;
			}

			/* 픽업주소 지우기 */
			$("#addrTxtP1").val('');
			$("#zipCodeP1").val('');
			$("#addrTxtP11").val('');
			$("#addrTxtP12").val('');

			/* 딜리버리 주소 지우기 */
			$("#addrTxtP2").val('');
			$("#zipCodeP2").val('');
			$("#addrTxtP21").val('');
			$("#addrTxtP22").val('');

		}

		if($('#textArea2').val() == null || $('#textArea2').val() == ""){
			alert("차량번호를 입력하세요..");
			$('#textArea2').focus();
			return false;
		}
	}

	/* 배송요청사항 배송지 선택과 장착서비스 이용에 따라 분기처리 */
	if(dlvGbn == '01'){
		$('#con_hid').val($('#textArea1').val());
	}else{
		$('#con_hid').val($('#textArea2').val());
	}

	var  fuelCd = "";
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
		finalCode = mounting;
	}

		if(confirm("수정하시겠습니까?")){
			var pUrl = "/mypage/oilServiceWriteProc";
			var pSendData = {
									        commDvsn     	: "U",         			 					   								/*처리구분(I,U,D)       */
									        dlvrSeq      		: $('#dlvrSeq').val(),             	 				        		/*순번                 */
									        ordNo        		: $('#ordNo1').val(),                     							/*계약번호            */
									        custNo       		: $('#cust_no_hid').val(),              							/*고객코드            */
									        servSeq      		: $('#servSeq').val(),
									        dlvStat      		: "01",                 					       								/*상태                 */
									        dlvGb                : finalCode,																/*배송구분            */
									        fuelCd       		: fuelCd,                       												/*유종                  */
									        yrmlCd       		: yrmlCd,                     												/*연식                  */
									        dsplmtCd     		: Math.ceil(dsplmtCd/1000) * 1000,		           												/*배기량                */
									        agencyCd     		: $('#insStoreCd_hid').val(),        							 	/*대리점                */
									        consignee    		: $('#consignee').val(),                								/*수취인                */
									        posCd        		: $('#post_no').val(),                  								/*우편번호              */
									        addr1        		: $('#addr1_hid').val(),                   							/*주소1                 */
									        addr2        		: $('#addr2_hid').val(),            									/*주소2					*/
									        inst2PosCd       	: $('#post_no_drv').val(),                 					/*딜리버리 우편번호   */
									        inst2Addr1      	: $('#addr1_hid_drv').val(),                  					/*딜리버리 주소1      */
									        inst2Addr2      	: $('#addr2_hid_drv').val(),             						/*딜리버리 주소2      */
									        instTm 				: $('#mountTime').val().replace(/:/gi,''), 				 	/*장착희망시간        */
									        dlvTel       			: $('#phone_num').val(),                   						/*연락처                */
									        dlvDesc      		: $('#con_hid').val(),                  								/*배송요청사항          */
									        servrqDay    		: $('#reqInsDt_hid').val().replace(/-/gi, ""),           		/*교체예정일자          */
									        downDay      	:  null,              														/*다운처리일시          */
									        dlvsDay      		:  null,                 														/*송장적용일시          */
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
			/*	console.log(data.carInfo)
	    		console.log(data.gradeList) */
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
		    	alert("[시스템오류:" + data.code + "]" + data.codeNm);
		    	$('#loadingWrap').hide();
		    	return;
		    }

	    },
	    error: function (request, status, error) {
	    	$('#loadingWrap').hide();
	    	callBackManager.error(error);

		}
	});
}

function fn_Delete(){

	if(confirm("정말로 엔진오일 서비스 신청을 취소하시겠습니까?")){
		var pUrl = "/mypage/engineServiceCancel";
		var pSendData = {
								        commDvsn     	: "D",         			 					   								/*처리구분(I,U,D)       */
								        dlvrSeq      		: $('#dlvrSeq').val(),             	 				        		/*순번                */
								        dlvrDay      		: $('#dlvrDay').val().replace(/-/gi, ""),    	        		/**교체신청일자    */
								        ordNo        		: $('#ordNo1').val(),                     							/*계약번호            */
								        custNo       		: $('#cust_no_hid').val(),              							/*고객코드            */
								        servSeq      		: null,
								        dlvStat      		: null,                					       								/*상태                 */
								        dlvGb                : null,																		/*배송구분            */
								        fuelCd       		: null,                       												/*유종                  */
								        yrmlCd       		: null,                     													/*연식                  */
								        dsplmtCd     		: null,		           														/*배기량                */
								        agencyCd     		: null,        							 									/*대리점                */
								        consignee    		: null,                														/*수취인                */
								        posCd        		: null,                  														/*우편번호              */
								        addr1        		: null,                   													/*주소1                 */
								        addr2        		: null,            															/*주소2					*/
								        inst2PosCd       	: null,                 														/*딜리버리 우편번호   */
								        inst2Addr1      	: null,                  														/*딜리버리 주소1      */
								        inst2Addr2      	: null,             															/*딜리버리 주소2      */
								        instTm 				: null, 				 														/*장착희망시간        */
								        dlvTel       			: null,                   													/*연락처                */
								        dlvDesc      		: null,                  														/*배송요청사항          */
								        servrqDay    		: null,           															/*교체예정일자          */
								        downDay      	: null,              															/*다운처리일시          */
								        dlvsDay      		: null,                 														/*송장적용일시          */
								        dlvEnt       		: null,             															/*배송업체              */
								        trspDoc      		: null,             															/*송장번호              */
								        carId        			: null,          				 												/*차대번호          */
								        carNo  				: null,        				 												/*차량번호 검색데이터 나이스로 조회          */
								        regId        			: "ONL_SYS",
								        smsMsg	    	: null
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
</script>