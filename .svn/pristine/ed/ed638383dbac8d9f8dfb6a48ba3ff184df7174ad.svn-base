<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/datepicker-ko.js"></script>
<script type="text/javascript" src="/js/lib/jquery.timepicker.min.js"></script>

<!-- 다음 맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>
<script src="//nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

	<!--subContentsWrap-->
    <div class="subContentsWrap">
    	<main class="order-basket">
	        <!-- header -->
	        <div class="page-header empty">
	            <h2 class="title-deco">
	            	<span>탁월한</span><span>선택!</span>
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
	        <div class="product-sub-info accordion-box js-accordion">
	        	<!-- 00 -->
	            <div class="accordion">
	            	<h3>구매상품 <span class="order-product-count">${ordListCnt}</span>건</h3>
	            </div>
	            <div class="accordion-info step1">
	            	<c:forEach var="list" items="${ordList}" varStatus="status">
		            	<!-- 구매 상품 -->
		              	<article class="order-single inset-m layout-c">
		                	<div class="layout-r same-size">
			                    <div class="inlnie align-bottom">
			                    	<div class="order-data-photo">
                                       	<c:choose>
                                       		<c:when test="${orderVo.pageGbn eq 'C' }">
                                       			<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${list.thumimg }" alt="타이어 사진">
                                       		</c:when>
                                       		<c:otherwise>
                                       			<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${list.o2oThumImg }" alt="타이어 사진">
                                       		</c:otherwise>
                                       	</c:choose>

			                      	</div>
			                    </div>
		                    	<div class="inlnie border-bottom order-box">
			                      	<div class="order-data-title">
			                        	<h3>${list.patternCd }</h3>
			                      	</div>
				                    <div class="order-product-info">
				                    	<ul class="mb-s" name="ordNoSn" id="ordNoSn${status.count}" cartNo="${list.cartNo }" dpPrNo="${list.dpPrNo }" patternCd="${list.patternCd }" itemCd="${list.itemCd }" itemNm="${list.itemNm }" price="${list.saleFee}" itemCnt="${list.cntCdNm}">
				                        	<li><span>${list.classCdNm }</span><span>${list.seasonNm }</span></li>
				                          	<li>${list.tireSize }</li>
				                          	<li>
                                               	<c:if test="${not empty list.makerNm}">
                                               		<span>${list.makerNm }</span>
                                               	</c:if>
                                               	
                                               	<c:if test="${not empty list.modelNm}">
                                               		${list.modelNm }
                                               	</c:if>					                          	
				                          	</li>
				                        </ul>
				                    </div>
		                    	</div>
		                  	</div>
		                  	<div class="layout-r mt-m">
			                    <div class="order-count align-middle">
			                    	<div class="order-count-quantity layout-r">
			                        	<b class="align-middle">수량</b><span id="ordNoCnt${status.count-1 }">${list.cntCdNm }</span>
			                      	</div>
			                    </div>
			                    <div class="order-pay align-middle">
			                      	<div class="layout-c full-width">
			                        	<div class="text-right">구매가</div>
			                        	<div class="text-right">
										<c:if test="${list.orderOriAmt ne list.orderPayAmt}">
                                       		<del class="price-sale" id="beforePrice${status.count-1 }">
                                       			<fmt:formatNumber value="${list.orderOriAmt}" pattern="#,###" />
                                       		</del>			                                                    
										</c:if>	                          		
			                          		<span class="price-actual" id="salePrice${status.count-1 }"><fmt:formatNumber value="${list.orderPayAmt }" pattern="#,###" />원</span>
			                        	</div>
			                      	</div>
			                    </div>  
		                  	</div>
		                  	<c:if test="${list.pakAmt > 0}">
							    <div class="layout-r mt-m">
			                        <div class="order-pay align-middle">
			                            <div class="layout-c full-width">
		                                    <div class="text-right">패키지 추가할인</div>
		                                    <div class="text-right">                          
		                                      <span class="price-actual"><fmt:formatNumber value="${list.pakAmt}" pattern="#,###" /></span>
		                                    </div>
			                            </div>
			                        </div>
			                    </div>		                  	
		                  	</c:if>
		                  	<input type="hidden" name="pdOrdAmt" id="ordAmt_${status.count}"	value="${list.saleFee}" />
		                    <input type="hidden" name="pakAmt" id="pakAmt_${list.cartNo}"	value="${list.pakAmt}" />
		                    <input type="hidden" name="pkgPlcNo" id="pkgPlcNo_${list.cartNo}"	value="${list.pkgPlcNo}" />
		                </article>
		            	<!-- //구매 상품 -->
	            	</c:forEach>
	            	
		            <!-- 상품 옵션 정보 2020.08.26 추가   -->
	            	<article class="order-single inset-m layout-c optTb">
	            		<div class="layout-r same-size">
	            			<h3><span> 상품 옵션 정보  </span></h3>
					    </div>	
            			<small>
							* 얼라이먼트  정비  [50% 할인가 (국산차 /수입차 동일 가격, 4본 시 추가 할인)]
						</small>
					    <div class="inset-m">
				            <c:forEach var="opt" items="${optCarList}" varStatus="status">
				            	
				            	<c:if test="${opt.optPlcNm ne ''}">
					            	<ul style="padding-top: 0.5rem;"><span class="black">${opt.optPlcNm}</span></ul>
					            	<div class='alignment_001 optRadio' >
						            	<li class="radio col-1">
							            	<div class="radio inline" style="width: 65%">
								            	<input type='radio' class="type06 "  name='o2oOptRadio_${status.count}' id='radioOpta_${status.count}' value='Y'>
												<label for='radioOpta_${status.count}'>정비 : <span class="price-actual"> <fmt:formatNumber value="${opt.optAmt}" pattern="#,###" /> 원</span></label>
							            	</div>
							            	<div class="radio inline" style="width: 32%">
												<input type='radio' class="type06 "  name='o2oOptRadio_${status.count}' id='radioOptb_${status.count}' value='N' checked><label for='radioOptb_${status.count}'>정비 안함</label>
							            	</div>
							            	<input type='hidden' name='o2oPlcNo_${status.count}' value="${opt.optPlcNo}" >
											<input type='hidden' name='o2oOptPchsPrc_${status.count}' value="${opt.optAmt}" >
											<input type='hidden' name='o2oPlcNm_${status.count}' value="${opt.optPlcNm}" >
						            	</li>
					            	</div>
				            	</c:if>
			            	</c:forEach>
					    </div>
	            	</article>
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

	            <!-- 01 -->
	            <div class="accordion">
	            	<h3>주문자 정보</h3>
	            </div>
	            <div class="accordion-info inset-ml">
	            	<div class="submit layout-c mb-m border-gray-bottom">
		                <label for="info01"><span class="essen black">주문자</span></label>
		                <input type="text" name="orderNmTxt" class="type03 trans-bg" id="orderNmTxt" value="${userVo.custNm}" title="주문자정보 입력란" placeholder="주문자 정보를 입력하세요" maxlength="50">
	              	</div>
	              	<div class="submit layout-c border-gray-bottom">
	                	<label for="phone01"><span class="essen black">휴대전화</span></label>
	                	<div class="layout-r inline-m same-size">
	                  		<select class="inline type04 w120" title="휴대전화 앞자리 선택" id="phone01" name="phone01">
	                    		<option value="010" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '010'}">selected</c:if> >010</option>
								<option value="011" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '011'}">selected</c:if> >011</option>
								<option value="016" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '016'}">selected</c:if> >016</option>
								<option value="017" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '017'}">selected</c:if> >017</option>
								<option value="018" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '018'}">selected</c:if> >018</option>
								<option value="019" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '019'}">selected</c:if> >019</option>
	                  		</select>
	                  		<c:set var="moblieLen" value="${fn:length(userVo.mobNo) -4 }" />
	                  		<!-- <span class="divi type02 align-middle"></span> -->
	                  		<input type="text" name="phone02" maxlength="4" value="${fn:substring(userVo.mobNo, 3 , moblieLen ) }" class="inline type03 w120" id="phone02" title="휴대폰 중간번호 입력란" onkeyup="validNumberCheck.keyUp(event);">
	                  		<span class="divi type02 align-middle"></span>
	                  		<input type="text" name="phone03" maxlength="4" value="${fn:substring(userVo.mobNo, moblieLen , fn:length(userVo.mobNo) ) }" class="inline type03 w120" id="phone03" title="휴대폰 끝번호 입력란" onkeyup="validNumberCheck.keyUp(event);">
	                	</div>
	              	</div>
	            </div>
	            <!-- //01 -->

	            <!-- 02 -->
	            <div class="accordion">
	            	<h3>장착 서비스 정보</h3>
	            </div>
	            <div class="accordion-info inset-ml">
	              	<div class="submit">
	                	<label for="info01"><span class="essen black">장착 서비스</span></label>
	                	<button type="button" class="ml-s popup-guide md-trigger" data-modal="tireSizeTip">이용가이드</button>

	                	<!-- js-radio UI -->
	                	<div class="conWrap js-radioUI mt-s">
	                  		<ul>
	                    		<li class="radio col-2">
	                      			<input type="radio" name="mounting" id="ser1" checked="checked" value="10" class="type06" title="방문 장착 서비스 선택">
	                      			<label for="ser1"><span>방문 장착 서비스</span></label>
	                    		</li>
	                    		<li class="radio col-2">
	                      			<input type="radio" name="mounting" id="ser2" value="20" class="type06" title="픽업&amp;딜리버리 장착 서비스 선택">
	                      			<label for="ser2"><span>픽업&amp;딜리버리 장착 서비스</span></label>
	                    		</li>
	                    		<li class="radio col-2">
	                      			<input type="radio" name="mounting" id="ser3" value="40" class="type06" title="전문점 장착 서비스 선택">
	                      			<label for="ser3"><span>전문점 장착 서비스</span></label>
	                    		</li>
	                  		</ul>
	                	</div>
	                	<!-- //js-radio UI -->
	              	</div>
	              	
					<!-- 방문장착 일때 -->
            		<!-- 얼라이먼트 정비-->
                    <div class="submit" id="noPickUpAlign" style="display: none;">
                    	<label for="info01"><span class="essen black">휠 얼라인먼트 정비</span></label>
                        
                        <!-- js-radio UI -->
	                	<div class="conWrap js-radioUI mt-s">
	                  		<ul>
                        		<li class="radio col-2">
		                       	    <input type="radio" name="alignRd" id="alignReqVisit" value="Y" class="type06" title="교체시 무상 정비" >
		                       	    <label for="alignReqVisit"><span>타이어 장착 시 얼라인먼트 정비</span></label>
		                       	</li>
		                       	<li class="radio col-2">
		                       		<input type="radio" name="alignRd" id="giveCpn" checked="checked" value="N" class="type06" title="쿠폰 지급">
		                       		<label for="giveCpn"><span>쿠폰&nbsp;발급</span></label>
                        		</li>
                        	</ul>
	                    </div>
	                    <!-- //js-radio UI -->
	                    <p class="validation">
	               			<span>쿠폰은 장착완료 시 발급되며, 유효기간은 발급일로부터 1년 입니다.</span>
	               		</p>
                    </div>
                    
	              	<!-- 장착 주소 -->
	              	<div class="submit" id="noPickUp">
	              		<label for="info02"><span class="essen black">장착 주소</span></label>
	               		<div class="conWrap layout-r border-bottom mb-s" name="addrTxtB" val="B" onclick="javascript:selectJusoPop('B'); return false">
                 			<div class="inline full-width">
	                 			<input type="text" name="addrTxtB" val="B" class="pl-0 pr-l trans-bg" id="addrTxtB" title="주소 입력란" placeholder="장착 받으실 주소를 검색하세요." readonly="readonly">
	                 			<input type="hidden" id="zipCodeB" />
                 			</div>
                 			<!-- 주소검색 -->
                 			<button name="selectAddr" type="button" class="align-middle btn-address-search inline" onclick="javascript:selectJusoPop('B');">검색</button>
	               		</div>
	               		<p class="validation">
	               			<span id="addrOkB">방문장착 서비스가 가능합니다.</span>
	               		</p>
	               		<p class="validation warning" style="display: none;">
	               			<span>방문장착 서비스가 불가능합니다.</span>
	               		</p>
	              	</div>
	              	<!-- //장착 주소 -->
	              	
	              	<!-- 드라이브스루  시작-->
					<div class="submit" id="driveThrough" style="display: none;">
	                	<label for="info01"><span class="essen black">장착유형세부</span></label>

	                	<!-- js-radio UI -->
	                	<div class="conWrap js-radioUI mt-s">
	                  		<ul>
	                    		<li class="radio col-2">
	                      			<input type="radio" name="drvThCd" id="drvThCd2" value="20" class="type06" title="Drive Thru 서비스">
	                      			<label for="drvThCd2"><span>Drive Thru 서비스</span></label>
	                    		</li>
	                    		<li class="radio col-2">
	                      			<input type="radio" name="drvThCd" id="drvThCd3" value="30" class="type06" title="Untact Parking 서비스">
	                      			<label for="drvThCd3"><span>Untact Parking 서비스</span></label>
	                    		</li>
	                    		<li class="radio col-2">
	                      			<input type="radio" name="drvThCd" id="drvThCd1" value="10" class="type06" title="일반">
	                      			<label for="drvThCd1"><span>일반</span></label>
	                    		</li>
	                  		</ul>
	                	</div>
	                	<!-- //js-radio UI -->
	              	</div>	              	
	              	<!-- 드라이브스루 끝 -->
	              	<!-- 픽업&딜리버리 일때 -->
            		<!-- 얼라이먼트 정비-->
	              	<div class="submit"  id="pickUpAlign" style="display: none">
	                    <label for="info03"><span class="essen black">휠 얼라인먼트 정비</span></label>
	                    
	                    <!-- js-radio UI -->
                        <div class="conWrap js-radioUI mt-s">
                        	<ul style="width:-webkit-fill-available">
                        		<li class="radio col-2">
		                       	    <input type="radio" name="alignRd" id="alignSerReq" value="Y" class="type06" title="교체시 무상 정비" >
		                       	    <label for="alignSerReq"><span>타이어 장착 시 얼라인먼트 정비</span></label>
		                       	</li>
		                       	<li class="radio col-2">
		                       		<input type="radio" name="alignRd" id="giveCpnPick" value="N" class="type06" title="쿠폰 지급" >
		                       		<label for="giveCpnPick"><span>쿠폰 발급</span></label>
                        		</li>
                        	</ul>
                        </div>
	                    <!-- //js-radio UI -->
	                    <p class="validation" id="pickUpAlignTxt" style="display: none">
	               			<span>쿠폰은 장착완료 시 발급되며, 유효기간은 발급일로부터 1년 입니다.</span>
	               		</p>
                    </div>
	              	
	              	
	              	<!-- 픽업,딜리버리 장착 서비스 -->
	              	<div class="submit" id="pickUp" style="display: none;">
	                	<label for="info03"><span class="essen black">장착 주소</span></label>
	                	<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="P1" onclick="javascript:selectJusoPop('P1'); return false">
	                  		<input type="text" name="addrTxtP1" class="pl-0 trans-bg" id="addrTxtP1" title="주소 입력란" placeholder="픽업주소를 검색하세요" readonly="readonly">
	                  		<input type="hidden" id="zipCodeP1" />
	                  		<button type="button" name="selectAddr" val="P1" class="align-middle btn-address-search" onclick="javascript:selectJusoPop('P1'); return false">검색</button>
	                	</div>
	                	<div class="conWrap layout-l mb-s">
                            <input type="checkbox" id="pickUpAddrCopy" name="pickUpAddrCopy" value="0" class="type01">
                            <label for="pickUpAddrCopy"><span></span>픽업주소 동일</label>
                        </div>
	                	<div class="conWrap layout-r border-bottom mb-s" name="selectAddr" val="P2" onclick="javascript:selectJusoPop('P2'); return false">
	                  		<input type="text" name="" class="pl-0 trans-bg" id="addrTxtP2" title="주소 입력란" placeholder="딜리버리 주소를 검색하세요" readonly="readonly">
	                  		<input type="hidden" id="zipCodeP2" />
	                  		<button type="button" name="selectAddr" val="P2" class="align-middle btn-address-search" onclick="javascript:selectJusoPop('P2'); return false">검색</button>
	                	</div>
	                	<p class="validation">
	                		<span id="addrOkP1">입력주신 장소로 방문하여 장착 서비스 진행이 가능합니다.</span>
	                	</p>
	              	</div>
	              	<!-- //픽업,딜리버리 장착 서비스 -->

	              	<!-- 전문점 장착 서비스 -->
	              	<div class="submit" id="junmun" style="display: none;">
	                	<label for="info05"><span class="essen black">장착 주소</span></label>

	                	<div class="conWrap layout-r border-bottom mb-s md-trigger" name="selectAddr" val="J" onclick="callMap('1'); return false;" data-modal="modal-Shop">
	                  		<input type="text" name="addrTxtJ" class="pl-0 trans-bg" id="addrTxtJ" title="주소 입력란" placeholder="전문점을 선택해주세요." readonly="readonly">
	                  		<input type="hidden" id="zipCodeJ" />
	                  		<button type="button" name="selectAddr" val="J" class="align-middle btn-address-search">검색</button>
	                	</div>
	                	<p class="validation">
	                		<span id="addrOkJ">입력주신 장소로 방문하여 장착 서비스 진행이 가능합니다.</span>
	                	</p>
	              	</div>
	              	<!-- //전문점 장착 서비스 -->
	              	<!-- //js-radio UI contents -->

					<!-- 장착 희망일  -->
	              	<div class="submit">
	                	<label for="datepicker"><span class="essen black" id="istDtTxt">장착일자</span></label>
	                	<div class="conWrap mb-s">
		                  	<div class="dateTime layout-r same-size border-bottom">
		                    	<div class="inline" style="width:60%">
		                      		<input type="text" name="datepicker11" class="datepicker" id="datepicker11" title="장착 희망일시 입력란" readonly="readonly" style="width:70%;">
		                    	</div>
		                    	
		                    	<div class="conWrap js-radioUI mt-s">
	                    		  	<ul>
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
					<div class="submit list">
	              		<label for="time">
						  <span class="essen black" id="istTmTxt">장착시간</span>

							<div class="label-addon">
								<span class="time-off"></span> 예약불가(배차완료)
								<span class="time-on"></span> 예약가능
							</div>
						  </label>
						  											


	              		<div class="conWrap mb-s">
	              			<form>
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
                              	    <!--<span class="off" id="time1200" >12:00</span> -->
                              		<!--<span class="off" id="time1230" >12:30</span> -->
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
	              			</form>
	              		</div>
	              		<p class="validation type04" id="jobEndTimeMsg" style="display:none;">
                            <span style="color:#FF0000;"><i class="ico11"></i>종료예정시간</span>
                        </p>
					</div>
	              	<!-- //장착 희망시간 -->
	              	

	              	<div class="submit">
	                	<label for="carNoTxt"><span class="essen black">차량번호</span></label>
	                	<div class="conWrap mb-s border-bottom">
	                  		<input type="text" name="carNoTxt" class="pl-0 trans-bg" id="carNoTxt" value="${ordList.get(0).carNo}" title="차량번호 입력란" placeholder="예)12가1234" onkeyup="fn_press_nice(this);" onkeydown="SchNullKey();" maxlength="9" onblur="javascript:validationCarNo();" style="ime-mode:active">
	                	</div>
	                	<p class="validation type04">
	                  		<span><i class="ico11"></i>장착을 위해 고객차량 확인용으로 이용됩니다.</span>
	                	</p>
	              	</div>

	              	<div class="submit">
	                	<label for="carNum"><span>참고 메세지</span></label>
	                	<div class="conWrap mb-s border-bottom">
		                  	<select id="etcMsg">
		                    	<option value="01">메시지를 선택해주세요.</option>
                                <option value="02">주소지에 도착하면 전화 또는 문자주세요.</option>
                                <option value="03">직접입력</option>
		                  	</select>
		                  	<input type="text" style="display: none"  id="etcMsgTxt" class="type03 w580" id="messge" maxlength="80" title="참고 메세지 입력란" placeholder="참고 메세지를 입력해주세요">
	                	</div>
	                	<p class="validation type04">
	                  		<span><i class="ico11"></i>장착 서비스 매니저에게 전달되는 메시지입니다.</span>
	                	</p>
	              	</div>
	            </div>
	            <!-- //02 -->

	            <!-- 03 -->
	            <div class="accordion">
	            	<h3>쿠폰 정보</h3>
	            </div>

	            <c:if test="${fn:length(couponItem) > 0 or  fn:length(selectCouponPayment) > 0}">
		            <div class="accordion-info inset-ml">
		            	<!--
		            		<div class="submit">
		                	<label><span>상품쿠폰</span></label>
		                	<div class="border-gray-bottom pt-s pb-s">적용 가능한 할인 쿠폰 ${fn:length(couponItem)}장 있습니다.</div>
		              		</div> 
		              	-->
		              	<c:if test="${fn:length(couponItem) > 0 }">
			              	<div class="submit">
			                	<label><span>상품별 쿠폰</span></label>
			                	<div class="conWrap">

				                  	<c:forEach var="couponItem" items="${couponItem}" varStatus="st">
					                  	<!--dListWrap-->
					                  	<div class="dListWrap">
					                    	<p>${couponItem.patternCd } / 
					                    	
					                    	<c:set var="lvl3Cnt" value="0" />
					                    	<c:forEach var="lvlCdGbn" items="${couponItem.selectCouponItem}" varStatus="lvlStatus">
					                    		<c:if test="${lvlCdGbn.cpnLvlCd eq '3'}">
			                          				<c:set var="lvl3Cnt" value="${lvl3Cnt + 1}" />
			                          			</c:if>
		                          			</c:forEach>
					                    	<c:choose>
					                    		<c:when test="${lvl3Cnt > 0}">
					                    			${fn:length(couponItem.selectCouponItem) - lvl3Cnt} 개
					                    		</c:when>
					                    		<c:otherwise>
					                    			${fn:length(couponItem.selectCouponItem)} 개
					                    		</c:otherwise>
					                    	</c:choose>
					                    	</p>
					                    	<dl class="dList layout-r inline-m">
					                      		<dt class="inline align-middle">상품할인</dt>
					                      		<dd class="inline full-width">
					                        		<select name="ordCoupun1_${st.count}" gbn="${st.count}" title="상품 할인쿠폰 선택">
					                          			<option value="0" arrGbn="0" cpNo="0" cpNm="" unitCd="0" unitVal="0" cpnLvlCd="1">선택해주세요</option>
					                          			<c:forEach var="icp" items="${couponItem.selectCouponItem}" varStatus="status">
						                          			<c:if test="${icp.cpnLvlCd eq '1'}">
						                          				<option value="${icp.cpnNo}" <c:if test="${icp.cpnDefYn eq 'Y'}">selected</c:if> cpNm="${icp.cpnNm}"arrGbn="1" cpCd="${icp.cpnNo}" cpnLvlCd="${icp.cpnLvlCd}" unitCd="${icp.cpnUnitCd}" unitVal="${icp.cpnUnitVal}" dpPrNo="${icp.dpPrNo}" itemCd="${icp.itemCd}" cpnLvlCd="${icp.cpnLvlCd}" pdCpnIdx="${st.count-1}">${icp.cpnNm}</option>
						                          			</c:if>
					                          			</c:forEach>
					                        		</select>
					                      		</dd>
					                    	</dl>
					                    	<dl class="dList layout-r inline-m"  id="selCpn2">
					                      		<dt class="inline align-middle">추가할인</dt>
					                      		<dd class="inline full-width">
					                        		<select name="ordCoupun2_${st.count}" id="ordCoupun2" gbn="${st.count}" title="추가 할인쿠폰 선택">
					                          			<option value="0" arrGbn="0" cpNo="0" cpNm="" unitCd="0" unitVal="0" cpnLvlCd="2">선택해주세요</option>
					                          			<c:forEach var="icp" items="${couponItem.selectCouponItem}" varStatus="status">
					                          				<c:if test="${icp.cpnLvlCd eq '2'}">
					                          					<option value="${icp.cpnNo}" <c:if test="${icp.cpnDefYn eq 'Y'}">selected</c:if> cpNm="${icp.cpnNm}" arrGbn="1" cpCd="${icp.cpnNo}" cpnLvlCd="${icp.cpnLvlCd}" unitCd="${icp.cpnUnitCd}" unitVal="${icp.cpnUnitVal}" dpPrNo="${icp.dpPrNo}" itemCd="${icp.itemCd}" cpnLvlCd="${icp.cpnLvlCd}" pdCpnIdx="${st.count-1}" >${icp.cpnNm}</option>
					                          				</c:if>
					                          			</c:forEach>
					                        		</select>
					                      		</dd>
					                    	</dl>
					                  	</div>
				                  	</c:forEach>
				                  	<!--dListWrap-->
			                	</div>
			              	</div>
		              	</c:if>

		              	<c:if test="${fn:length(selectCouponPayment) > 0 }">
			              	<div class="submit">
			                	<div class="border-gray-bottom">
			                  		<label for="coupon" style="color:#812990"><span>추가할인쿠폰</span></label>
		                 			<select id="selectCoupon" title="추가할인쿠폰 선택">
			                   			<option value="" unitCd="" unitVal="">선택해주세요</option>
			                   			<c:forEach var="cp" items="${selectCouponPayment}" varStatus="status">
			                   				<option value="${cp.cpnNo}" <c:if test="${cp.cpnDefYn eq 'Y'}">selected</c:if> unitCd="${cp.cpnUnitCd}" unitVal="${cp.cpnUnitVal}">${cp.cpnNm}</option>
			                   			</c:forEach>
		                 			</select>
			                	</div>
			              	</div>
			              	<div class="coupon-info">
			                	<p><span id="couponTxt01" cpCd="" cpVal="0" style="display: none"></span><a href="javascript:return false;" class="cDel" id="couponTxtDel01" style="display: none"></a></p>
			              	</div>
		              	</c:if>
		              	
		              	<c:if test="${fn:length(couponItem) > 0 }">
		              		<div class="submit" id="specialCouponDiv" style="display:none;">
			                	<div class="border-gray-bottom">
			                  		<label for="coupon"><span>특별할인 쿠폰</span></label>
		                 			<select name="ordCoupun3_1" gbn="3" title="상품 할인쿠폰 선택" id="selectCoupon2">
			                   			<option value="0" arrGbn="0" cpNo="0" cpNm="" unitCd="0" unitVal="0" cpnLvlCd="1">선택해주세요</option>
		                 			</select>
			                	</div>
			              	</div>
		              	</c:if>
		            </div>
	            </c:if>
	            <!-- //03 -->

	            <!-- 04 -->
	            <div class="accordion">
	            	<h3>구매 결제 정보</h3>
	            </div>

	            <div class="accordion-info inset-ml">
	            	<div class="submit">
	                	<label for="info01"><span class="essen black">결제수단</span></label>
	                	<!-- js-radio UI -->
	                	<div class="js-radioUI conWrap mt-m layout-r same-size">
	                  		<div class="radio inline">
	                    		<input type="radio" name="payment" id="payment01" checked="checked" value="C" class="radioPayment" title="신용카드 선택"><label for="payment01"><span>신용카드</span></label>
	                  		</div>
	                  		<div class="radio inline">
	                    		<input type="radio" name="payment" id="payment02" value="B" class="radioPayment" title="계좌이체 선택"><label for="payment02"><span>계좌이체</span></label>
	                  		</div>
	                  		<div class="radio inline">
	                    		<input type="radio" name="payment" id="payment03" value="K" class="radioPayment" title="카카오페이 선택"><label for="payment03"><span class="ico-kakaopay">카카오페이</span></label>
	                  		</div>
	                  		<div class="radio inline">
	                    		<input type="radio" name="payment" id="payment04" value="N" class="radioPayment" title="네이버페이 선택"><label for="payment04"><span class="ico-naverpay">네이버페이</span></label>
	                  		</div>
	                	</div>

						<div id="depositForm" style="padding-top: 10px; display: none;">
							<div class="submit layout-c mb-m border-gray-bottom">
								<label for="info01"><span class="essen black">입금자명</span></label>
								<input type="text" name="depositNmTxt" class="type03 trans-bg" id="depositNmTxt" value="${userVo.custNm}" title="입금자정보 입력란" placeholder="입금자 정보를 입력하세요">
							</div>
							<div class="submit layout-c border-gray-bottom">
								<label for="depositPhone01"><span class="essen black">휴대전화</span></label>
								<div class="layout-r inline-m same-size">
									<select class="inline type04 w120" title="휴대전화 앞자리 선택" id="depositPhone01" name="depositPhone01">
										<option value="010" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '010'}">selected</c:if> >010</option>
										<option value="011" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '011'}">selected</c:if> >011</option>
										<option value="016" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '016'}">selected</c:if> >016</option>
										<option value="017" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '017'}">selected</c:if> >017</option>
										<option value="018" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '018'}">selected</c:if> >018</option>
										<option value="019" <c:if test="${fn:substring(userVo.mobNo, 0 , 3 )  eq '019'}">selected</c:if> >019</option>
									</select>
									<c:set var="moblieLen" value="${fn:length(userVo.mobNo) -4 }" />
									<!-- <span class="divi type02 align-middle"></span> -->
									<input type="text" name="depositPhone02" maxlength="4" value="${fn:substring(userVo.mobNo, 3 , moblieLen ) }" class="inline type03 w120" id="depositPhone02" title="휴대폰 중간번호 입력란" onkeyup="validNumberCheck.keyUp(event);">
									<span class="divi type02 align-middle"></span>
									<input type="text" name="depositPhone03" maxlength="4" value="${fn:substring(userVo.mobNo, moblieLen , fn:length(userVo.mobNo) ) }" class="inline type03 w120" id="depositPone03" title="휴대폰 끝번호 입력란" onkeyup="validNumberCheck.keyUp(event);">
								</div>
							</div>
						</div>

	                	<!-- //js-radio UI -->
	              	</div>
	            </div>
	            <!-- //04 -->
			</div>
	        <!-- //주문 정보 상세 -->

	        <!-- 주문 확인 -->
          	<div class="orderBox inset-ml" id="sidebar">
            	<article class="contents inset-ml">
              		<div class="titleDesc mb-m">
                		<h2 class="mb-s">주문확인</h2>
                		<p>고객님의 주문정보가 정확한지 확인해보세요.</p>
              		</div>
              		<h3 class="mb-s">상품정보</h3>

              		<!-- proInfo -->
              		<div class="proInfo">
                		<c:set var="totBassSaleFee1" value="0" />
                        <c:set var="totSaleFee1" value="0" />
                    	<c:forEach var="list" items="${ordList}" varStatus="status">
                        	<dl class="layout-r">
	                            <dt>${list.patternCd}</dt>
	                            <dd>${list.cntCdNm}개</dd>
                        	</dl>

                         	<c:set var="totBassSaleFee" value="${totBassSaleFee + list.orderOriAmt}" />
                         	<c:set var="totSaleFee" value="${totSaleFee + list.orderPayAmt}" />
                         	<c:set var="totPkgAmt" value="${totPkgAmt + list.pakAmt}" />
                    	</c:forEach>
              		</div>
              		<!-- 주문확인 옵션 정보  2020.0826 -->
              		<div id="optDiv" ></div>
              		<!-- //proInfo -->

              		<!-- totalPrice -->
              		<div class="totalPrice">
                		<div class="price mt-m">
                  			<dl class="layout-r">
                    			<dt>구매할인</dt>
                    			<dd>
                    				<input type="hidden" value="${totSaleFee-totPkgAmt}" id="sumTotSaleFee">
                                    <c:if test="${totBassSaleFee ne totSaleFee}">
                                      	<del class="price-sale" id="totBaseAmtTxt" val="${totBassSaleFee }">
                                      		<fmt:formatNumber value="${totBassSaleFee }" pattern="#,###" />
                                      	</del>
                                    </c:if>
									<c:if test="${totBassSaleFee eq totSaleFee}">
										<input type="hidden" val="${totBassSaleFee}" id="totBaseAmtTxt">
                                    </c:if>
                      				<span id="orgTotSaleAmtTxt" val="${totSaleFee}"><fmt:formatNumber value="${totSaleFee }" pattern="#,###" /></span>
                    			</dd>
                  			</dl>
                  			<dl id="paymentCoupon" class="layout-r sale" style="display: none">
                    			<dt>쿠폰할인</dt>
                    			<dd><span id="paymentCouponArea"></span></dd>
                  			</dl>

							<!-- 패키지 추가 2020-01-28 -->
							<c:if test="${totPkgAmt > '0'}">
	                  			<dl id="ttPkgAmt" val="${totPkgAmt}" class="layout-r sale">
	                    			<dt>패키지 추가할인</dt>
	                    			<dd><span><fmt:formatNumber value="${totPkgAmt}" pattern="#,###" /></span></dd>
	                  			</dl>
							</c:if>
							<!-- 패키지 추가 2020-01-28 -->
                  			<div class="layout-c last mt-l">
                    			<b class="text-right">최종결제금액</b>
                    			<div class="text-right"><span id="totSaleFee" val="${totSaleFee-totPkgAmt}"><fmt:formatNumber value="${totSaleFee-totPkgAmt}" pattern="#,###" /></span></div>
                  			</div>
                		</div>
              		</div>
              		<!-- //totalPrice -->
            	</article>
          	</div>
          	<!-- //주문 확인 -->

          	<button type="button" id="btnOrder" class="btn-primary inset-m full-width"><b>주문결제하기</b></button>
   		</main>
	</div>
	<!--subContentsWrap-->

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
<!-- 		            		<div class="layout-c" style="display:none;"> -->
		              			<div class="layout-r inline-m">
		                			<select class="inline border-none" title="시/도 선택" onchange="selectSiGunGu();" id="sido">
		                  				<option value="0">시/도 선택</option>
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
		            		<button type="button" class="go-view full-width inset-s" onclick="selectO2o('1','N');">O2O 서비스 장착 전문점 한눈에 보기</button>
		          		</div>
		          		<button type="button" class="search-shop" onclick="selectO2o('1', 'N');"><span></span>전문점 찾기</button>
		          		<!-- 찾기 검색 -->

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
                     	<div class="paging" id="pagingMap" style="display:none;"></div>
                    </div>
     			</div>
	   		</div>
	   		<!-- LIST -->
	 		</div>
	</div>
	<!-- //전문점 찾기 -->

	<!-- Popup Group -->
    <!-- ######################################### -->
    <div class="popupWrap md-modal md-effect-1 md-close" id="tireSizeTip" style="z-index: 5000; border-radius: 20px;">
       <div class="popContents popup-tip">
           <a href="#" class="layPopClose md-close js-customMdBgClose"></a>
           <header>
               <div class="popup-tip-tag">Tip!</div>
               <h2>장착 서비스 이용가이드</h2>
           </header>

            <div class="content">
                   <div class="tipCon">
                       <h3>방문장착 서비스</h3>

                       <p>차량키를 받지 않고 차량 장소(위치)차량번호만 알려주면 원하는 시간대에 타이어 교체 서비스</p>
                   </div>

                   <div class="tipCon">
                       <h3>픽업&amp;딜리버리 서비스</h3>

                       <p>방문장착 서비스가 불가한 현장이거나 차량 이동이 필요한 경우 픽업 후 다시 딜리버리 해주는 서비스</p>
                   </div>

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

   	<!-- layerPopup // -->
   	<div class="fullPopup md-effect-1" id="popNpayInfo">
   		<div class="popContents search-popup">
	        <header>
				<h2>
					네이버페이 안내문구
				</h2>
			</header>
			
			<div class="product-other-view-inner"><div>
			<p>· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</p>
			<p>· 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다. </p>
			<p>· 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크</p>
			<p>· 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권, KDB산업은행,씨티은행, SBI은행, 유안타증권, 유진투자증권</p>
			<p>· 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.</p>
			</div></div>
			
			<div class="btnArea type03 next-box">
				<button type="button" onclick="javascript:fn_popNpayInfo();" class="btn-primary inset-m full-width">확인</button>
	        </div> 
		</div>
    </div>
	<!-- layerPopup // -->
	
    <div class="md-overlay"></div>


	<form name="jusoFrm" id="jusoFrm" method="post" >
			<input type="hidden" name="currentPage" id="currentPage" value="1"/>
			<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
			<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
			<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
			<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
			<input type="hidden" name="keyword" id="keyword" />
		</form>

		<form id="frm" name="frm" method="post">
			<!-- 이전화면에서 넘어오는 정보 -->
			<input type="hidden" name="custId"      	id="custId" 		value="${userVo.custId}"/>      			<!-- 로그인아이디 -->
			<input type="hidden" name="marktRcvAgreYn"  id="marktRcvAgreYn" value="${userVo.marktRcvAgreYn}"/>			<!-- 로그인 한 고객 수신동의 -->
			<input type="hidden" name="smsRcvAgreYn"    id="smsRcvAgreYn" 	value="${userVo.smsRcvAgreYn}"/>			<!-- 로그인 한 고객 수신동의 -->
			<input type="hidden" name="emailRcvAgreYn"  id="emailRcvAgreYn" value="${userVo.emailRcvAgreYn}"/>			<!-- 로그인 한 고객 수신동의 -->
			<input type="hidden" name="custTyCd"  		id="custTyCd" 		value="${userVo.custTyCd}"/>			<!-- 고객 유형 코드(SD002) -->
			<input type="hidden" name="custTyDtlCd"  	id="custTyDtlCd" 	value="${userVo.custTyDtlCd}"/>			<!-- 고객 유형 상세 코드(SD003) -->
			<input type="hidden" name="officerCdYn"  	id="officerCdYn" 	value="${userVo.officerCdYn}"/>			<!-- 고객 유형 상세 코드(SD003) -->

			<input type="hidden" name="pageGbn" 		id="pageGbn" 		value="${orderVo.pageGbn}"/>			<!-- 이전화면 구분 : 상세/장바구니 -->
			<input type="hidden" name="recEmpNo" 		id="recEmpNo" 		value="${orderVo.recEmpNo}"/>			<!-- 추천 임직원 코드 -->
			<input type="hidden" name="recCustId" 		id="recCustId" 		value=""/>								<!-- 추천 회원ID -->

			<input type="hidden" name="carNo"      		id="carNo" 			value="${ordList.get(0).carNo}"/>        	<!-- 차량번호 -->
			<input type="hidden" name="classCd"    		id="classCd" 		value="${ordList.get(0).classCd}"/>      	<!-- 차량분류 -->
			<input type="hidden" name="classCdNm"    	id="classCdNm" 		value="${ordList.get(0).classCdNm}"/>      <!-- 차량분류 -->
			<input type="hidden" name="makerCd"   		id="makerCd"  		value="${ordList.get(0).makerCd}"/>      	<!-- 제조사 코드 -->
			<input type="hidden" name="makerNm"    		id="makerNm"  		value="${ordList.get(0).makerNm}"/>      	<!-- 제조사 명 -->
			<input type="hidden" name="modelCd"    		id="modelCd"  		value="${ordList.get(0).modelCd}"/>      	<!-- 차 모델 코드 -->
			<input type="hidden" name="modelNm"    		id="modelNm"  		value="${ordList.get(0).modelNm}"/>      	<!-- 차 모델  명 -->
			<input type="hidden" name="contentsCd"    	id="contentsCd" 	value="${ordList.get(0).contentsCd}"/>   	<!-- 차 사양 코드 -->
			<input type="hidden" name="seasonCd"    	id="seasonCd" 		value="${ordList.get(0).seasonCd}"/>     	<!-- 계절구분 -->
			<input type="hidden" name="seasonNm"    	id="seasonNm" 		value="${ordList.get(0).seasonNm}"/>     	<!-- 계절구분 명 -->
			<input type="hidden" name="patternCd"    	id="patternCd" 		value="${ordList.get(0).patternCd}"/>  	<!-- 패턴 코드 -->
			<input type="hidden" name="matCd"       	id="matCd" 			value="${ordList.get(0).matCd}"/>       	<!-- 상품코드 -->
			<input type="hidden" name="cntCdNm"        	id="cntCdNm" 		value="${ordList.get(0).cntCdNm}"/>      	<!-- 수량코드 -->
			<input type="hidden" name="bassSaleFee"  	id="bassSaleFee" 	value="${ordList.get(0).bassSaleFee}"/>	<!-- 원 가격 -->
			<input type="hidden" name="saleFee"  		id="saleFee" 		value="${ordList.get(0).saleFee}"/>		<!-- 할인 가격 -->
			<input type="hidden" name="stmemSaleAmt"  	id="stmemSaleAmt" 	value="${ordList.get(0).stmemSaleAmt}"/>	<!-- 임직원 가격 -->
			<input type="hidden" name="dpPrNo" 			id="dpPrNo" 		value="${ordList.get(0).dpPrNo}"/>			<!-- 전시 상품 번호-->
			<input type="hidden" name="itemCd" 			id="itemCd" 		value="${ordList.get(0).itemCd}"/>			<!-- 품목 코드-->
			<input type="hidden" name="itemNm" 			id="itemNm" 		value="${ordList.get(0).itemNm}"/>			<!-- 품목 코드-->
			<input type="hidden" name="thumimg" 		id="o2oThumImg" 	value="${ordList.get(0).o2oThumImg}"/>			<!-- 전시 상품 번호-->
			<input type="hidden" name="tireSize" 		id="tireSize" 		value="${ordList.get(0).tireSize}"/>			<!-- 타이어사이즈-->
			<input type="hidden" name="accuPoint" 		id="accuPoint" 		value="${ordList.get(0).accuPoint}"/>			<!-- 적립률-->
			<input type="hidden" name="saleTyCd" 		id="saleTyCd" 		value="${ordList.get(0).saleTyCd}"/>			<!-- 적립률-->
			<input type="hidden" name="salePrcPlcNo" 	id="salePrcPlcNo" 	value="${ordList.get(0).salePrcPlcNo}"/>			<!-- 적립률-->
			<input type="hidden" name="ownerNm" 		id="ownerNm" 		value="${ordList.get(0).ownerNm}"/>			<!-- 적립률-->
			<input type="hidden" name="orderOriAmt" 	id="orderOriAmt"	value="${ordList.get(0).orderOriAmt}" />		<!-- 원가 합계  -->
			<input type="hidden" name="orderPayAmt" 	id="orderPayAmt"	value="${ordList.get(0).orderPayAmt}" />		<!-- 원가 합계  -->



			<!-- 화면 입력값 정보 -->
			<input type="hidden" name="payGbn"  		id="payGbn" />			<!-- 결제 구분 : 카드(C) , 계좌(B), 카카오(K) -->
			<input type="hidden" name="carMngNo"  		id="carMngNo" />		<!-- 차량 관리 번호 -->
			<input type="hidden" name="iplAddr"  		id="iplAddr" />			<!-- 장착점 주소 -->
			<input type="hidden" name="iplDtlAddr"  	id="iplDtlAddr" />		<!-- 장착점 상세 주소 -->
			<input type="hidden" name="iplZip" 			id="iplZip" />			<!-- 장착점 우편번호 -->
			<input type="hidden" name="pickupZip"  		id="pickupZip" />		<!-- 장착점 우편번호 - 픽업 딜리버리 -->
			<input type="hidden" name="pickupBassAddr"  id="pickupBassAddr" />	<!-- 장착점 주소 - 픽업 딜리버리 -->
			<input type="hidden" name="pickupDtlAddr" 	id="pickupDtlAddr" />	<!-- 장착점 상세  주소 - 픽업 딜리버리 -->
			<input type="hidden" name="custNm" 			id="custNm">			<!-- 주문자 명 -->
			<input type="hidden" name="mobNo" 			id="mobNo">				<!-- 전화 번호 -->
			<input type="hidden" name="mountCd" 		id="mountCd" />			<!-- 장착점 구분 코드-->
			<input type="hidden" name="drvThCd" 		id="drvThCd" />			<!-- 배송상세유형 구분 코드 : 일반(10) 드라이브스루(20) 파킹(30)-->
			<input type="hidden" name="drvBayCo" 		id="drvBayCo" />		<!-- 드라이브스루가 존재하는 거점인지 체크하는것 Y/N-->			
			<input type="hidden" name="orderDt" 		id="orderDt" />			<!-- 장착희망일 -->
			<input type="hidden" name="orderTime" 		id="orderTime" />		<!-- 장착희망시간 -->
			<input type="hidden" name="ordNo" 			id="ordNo" />			<!-- 주문번호 -->
			<input type="hidden" name="setlStsCd" 		id="setlStsCd" />		<!-- 결제 쿠폰 번호 -->
			<input type="hidden" name="setlCpnDcAmt" 	id="setlCpnDcAmt" />	<!-- 결제 쿠폰 할인 금액 -->
			<input type="hidden" name="prCpnNo1" 		id="prCpnNo1" />		<!-- 상품별 쿠폰 코드 1 -->
			<input type="hidden" name="prCpnNo2" 		id="prCpnNo2" />		<!-- 상품별 쿠폰 코드 2 -->
			<input type="hidden" name="prCpnDcAmt" 		id="prCpnDcAmt" />		<!-- 상품별 쿠폰 할인 금액 합계 -->
			<input type="hidden" name="prDetailCpnDcAmt"id="prDetailCpnDcAmt" /><!-- 상품별 쿠폰 할인 금액 합계 -->
			<input type="hidden" name="istReqDe" 		id="istReqDe" />		<!-- 작업 희망 일자 -->
			<input type="hidden" name="istDueDe" 		id="istDueDe" />		<!-- 작업 희망 시간 -->
			<input type="hidden" name="custReqCn" 		id="custReqCn" />		<!-- 참고 메세지 -->
			<input type="hidden" name="orgzCd" 			id="orgzCd" />			<!-- 거점코드 : bhfCd -->
			<input type="hidden" name="wrhCd" 			id="wrhCd" />			<!-- 창고코드 -->
			<input type="hidden" name="bpCd" 			id="bpCd" />			<!-- 거점코드 : bpCd -->
			<input type="hidden" name="itemCdArr" 		id="itemCdArr" />		<!-- 품목코드 -->
			<input type="hidden" name="itemCntArr" 		id="itemCntArr" />		<!-- 수량  -->
			<input type="hidden" name="orgTotSaleFee" 	id="orgTotSaleFee" />	<!-- 전시가 합계  -->
			<input type="hidden" name="totBaseFee" 		id="totBaseFee" />		<!-- 원가 합계  -->
			<input type="hidden" name="totPkgAmt" 		id="totPkgAmt" />		<!-- 총 패키지 금액 -->


			<!-- 결제 정보  KCP-->
			<input type="hidden" name="Ppay_method" id="Ppay_method" value="" />		<!-- 결제구분 결제 수단 정보 설정(신용카드 : 100000000000, 계좌이체 : 010000000000) 해당하는 값을 모두 더해주면 됩니다 -->
			<input type="hidden" name="Pordr_idxx" 	id="Pordr_idxx" 	value="" />		<!-- 주문번호 -->
			<input type="hidden" name="Pgood_name" 	id="Pgood_name" 	value=""/>		<!-- 상품명 -->
			<input type="hidden" name="Pcust_no" 	id="Pcust_no" 	value=""/>			<!-- 고객번호 -->
			<input type="hidden" name="Pgood_mny"  	id="Pgood_mny" 	value="" />			<!-- 상품가격 - 숫자만 입력 -->
			<input type="hidden" name="Pquantity"  	id="Pquantity" 	value="1" />		<!-- 상품수량 - 숫자만 입력 -->
			<input type="hidden" name="Pbuyr_name" 	id="Pbuyr_name" 	value=""/>		<!-- 구매자 명 -->
			<input type="hidden" name="Pbuyr_mail" 	id="Pbuyr_mail"  value="" />		<!-- 구매자 이메일 -->
			<input type="hidden" name="Pbuyr_tel1" 	id="Pbuyr_tel1" 	value=""/>		<!-- 구매자 전화번호1 -->
			<input type="hidden" name="Pbuyr_tel2" 	id="Pbuyr_tel2" 	value=""/>		<!-- 구매자 전화번호2 -->

			<input type="hidden" name="pay_method" id="pay_method" value="" />		<!-- 결제구분 결제 수단 정보 설정(신용카드 : 100000000000, 계좌이체 : 010000000000) 해당하는 값을 모두 더해주면 됩니다 -->
			<input type="hidden" name="ordr_idxx" 	id="ordr_idxx" 	value="" />		<!-- 주문번호 -->
			<input type="hidden" name="good_name" 	id="good_name" 	value=""/>		<!-- 상품명 -->
			<input type="hidden" name="cust_no" 	id="cust_no" 	value=""/>			<!-- 고객번호 -->
			<input type="hidden" name="good_mny"  	id="good_mny" 	value="" />			<!-- 상품가격 - 숫자만 입력 -->
			<input type="hidden" name="buyr_name" 	id="buyr_name" 	value=""/>		<!-- 구매자 명 -->
			<input type="hidden" name="buyr_mail" 	id="buyr_mail"  value="" />		<!-- 구매자 이메일 -->
			<input type="hidden" name="buyr_tel1" 	id="buyr_tel1" 	value=""/>		<!-- 구매자 전화번호1 -->
			<input type="hidden" name="buyr_tel2" 	id="buyr_tel2" 	value=""/>		<!-- 구매자 전화번호2 -->

			<!-- 결제 정보  KAKAO -->
			<input type="hidden" name="ordrIdxx" 			id="ordrIdxx" 	value="" />		<!-- 주문번호 -->
			<input type="hidden" name="mobYn" 				id="mobYn" 		value="" />		<!-- 모바일 구분 -->
			<input type="hidden" name="goodName" 			id="goodName" 	value=""/>		<!-- 상품명 -->
			<input type="hidden" name="amount" 				id="amount" 	value=""/>		<!-- 상품가격 -->
			<input type="hidden" name="quantity"  			id="quantity" 	value="1" />		<!-- 상품수량 -->
			<input type="hidden" name="buyrName"  			id="buyrName" 	value="" />		<!-- 주문자 명 -->
			<input type="hidden" name="buyrMail" 			id="buyrMail" 	value=""/>		<!-- 주문자 이메일 -->
			<input type="hidden" name="buyrTel1" 			id="buyrTel1" 	value="" />		<!-- 주문자 전화번호 1 -->
			<input type="hidden" name="buyrTel2" 			id="buyrTel2" 	value=""/>		<!-- 주문자 전화번호 1 -->
			<input type="hidden" name="custNo" 				id="custNo" 	value=""/>		<!-- 고객번호 -->
			<input type="hidden" name="moduleDesc" 			id="moduleDesc" value=""/>		<!--  -->
			<input type="hidden" name="goodMny" 			id="goodMny" 				value="0"/>
			<input type="hidden" name="kkopaySetcSn" 		id="kkopaySetcSn" 			value="0"/>
			<input type="hidden" name="totalAmt" 			id="totalAmt" 				value="0"/>
			<input type="hidden" name="taxFreeAmt" 			id="taxFreeAmt" 			value="0"/>
			<input type="hidden" name="vatAmt" 				id="vatAmt" 				value="0"/>
			<input type="hidden" name="pointAmt" 			id="pointAmt" 				value="0"/>
			<input type="hidden" name="discountAmt" 		id="discountAmt" 			value="0"/>
			<input type="hidden" name="cnclTotalAmt" 		id="cnclTotalAmt" 			value="0"/>
			<input type="hidden" name="cnclTaxFreeAmt" 		id="cnclTaxFreeAmt" 		value="0"/>
			<input type="hidden" name="cnclVatAmt" 			id="cnclVatAmt" 			value="0"/>
			<input type="hidden" name="cnclDiscountAmt" 	id="cnclDiscountAmt"		value="0"/>
			<input type="hidden" name="cnclAvblTotalAmt" 	id="cnclAvblTotalAmt"		value="0"/>
			<input type="hidden" name="cnclAvblTaxFreeAmt" 	id="cnclAvblTaxFreeAmt"		value="0"/>
			<input type="hidden" name="cnclAvblVatAmt" 		id="cnclAvblVatAmt"			value="0"/>
			<input type="hidden" name="cnclAvblDiscountAmt" id="cnclAvblDiscountAmt"	value="0"/>
			<input type="hidden" name="pgToken" id="pgToken"	value="" />
			<input type="hidden" name="ordAmt" id="ordAmt"	value="" />	<!-- 주문금액 -->
			
			<!-- 결제 정보  NAVER -->
			<input type="hidden" name="merchantUserKey"  id="merchantUserKey"	value="<%=session.getAttribute("custNo") %>"/>
			<input type="hidden" name="merchantPayKey"	 id="merchantPayKey"	value="" />		<!-- 주문번호 -->
			<input type="hidden" name="productName"		 id="productName"		value="" />		<!-- 상품명 -->
			<input type="hidden" name="productCount"	 id="productCount"		value="" />		<!-- 상품수량 -->
			<input type="hidden" name="totalPayAmount"	 id="totalPayAmount"	value="0" />	<!-- 총 결제 금액 -->
			<input type="hidden" name="taxScopeAmount"	 id="taxScopeAmount"	value="0" />	<!-- 과세대상금액 -->
			<input type="hidden" name="taxExScopeAmount" id="taxExScopeAmount"	value="0" />	<!-- 면세대상금액 -->
			<input type="hidden" name="useCfmYmdt"		 id="useCfmYmdt"		value="" />		<!-- 이용완료일 -->
			<input type="hidden" name="paymentId"		 id="paymentId"			value="" />		<!-- 결제페이 ID -->
			<input type="hidden" name="returnUrl"		 id="returnUrl"			value="" />

			<!-- // 오일서비스 분기처리 (오일 서비스는 경정비 가능한 대리점만 조회) -->
			<input type="hidden" name="oilServiceYn"	id="oilServiceYn"	value="${oilServiceYn}"/>

			<input type="hidden" name="pageNo"	id="pageNo"	value="${pageNo}"/>		<!-- 현재 페이지 -->
			<input type="hidden" name="pageSize"	id="pageSize" 	value="10" />		<!-- 페이지에 표시할 수 -->
			<input type="hidden" name="pageParam"	id="pageParam" 	value="10" />		<!-- 페이지에 표시할 수 -->

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
			
			<!-- 2020.08.13 상품 옵션 추가  -->
			<input type="hidden" name="optAmt" 	  id="optAmt"	 value="${optAmt}"/>
			<input type="hidden" name="optTotAmt" id="optTotAmt" value="${optTotAmt}"/>
			<input type="hidden" name="optCo" 	  id="optCo"	 value="${optCo}"/>
			<input type="hidden" name="optPlcNo"  id="optPlcNo"	 value="${optPlcNo}"/>
			<input type="hidden" name="optPlcNm"  id="optPlcNm"	 value="${optPlcNm}"/>
			
			<!-- 2020.09.22 전후륜 타이어 추가  -->
			<input type="hidden" name="orderDtlInfo"  id="orderDtlInfo"	value="" />
			<input type="hidden" name="beforPayChkYn"  id="beforPayChkYn"	value="N" />
		
		</form>
		<input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->

	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>

<script type="text/javascript">

var ordAreaList = [];
<c:forEach var="obj" items="${ordAreaList}">
    <c:choose>
      <c:when test="${obj.refCd1 ne null }" > 
		     ordAreaList.push({"cmCd":"${obj.cmCd}","cmCdNm":"${obj.cmCdNm} ${obj.refCd1}"});
	    </c:when>
	    <c:otherwise>
		     ordAreaList.push({"cmCd":"${obj.cmCd}","cmCdNm":"${obj.cmCdNm}"});
	    </c:otherwise>
    </c:choose>
</c:forEach>

//console.log(ordAreaList);

$(document).on("change","input[name='payment']",function () {
	if("B" == $(this).val()){
		$("#depositForm").show("");
	}else{
		$("#depositForm").hide("");
	}
});



//옵션 선택시 이벤트 추가   
$(".optRadio").on('change', function(e){
	
	var checkNm = $(e.target).attr("name");
	var checkYn = $(e.target).is("checked");
	
	//if(checkYn == "Y"){
	$.each($(".optRadio") , function(i , obj){
		var idx = (i+1);
		var plcNo   = $(':input[name="o2oPlcNo_'+(idx)+'"]').val();
		var optPchsPrc = $(':input[name="o2oOptPchsPrc_'+(idx)+'"]').val();
		var checkNm   = $(':radio[name="o2oOptRadio_'+(idx)+'"]:checked').prop("name");
		
		if(plcNo == "OPT00000001") {
			if($(':radio[name="' + checkNm + '"]:checked').val() == "Y") {
				fu_alignShowCtl("show");
			} else if($(':radio[name="' + checkNm + '"]:checked').val() == "N") {
				fu_alignShowCtl("hide");
			}
		}
	});
	//}
	var optTotAmt  = 0;   //옵션 전체 금액
    var optAmt     = "";  //옵션 별 금액 
    var optCo      = "";  //옵션 사용 수량 ( 0 : 사용안함 , 1 : 사용함.)
    var optPlcNo   = "";  //옵션 정책번호 
    var optPlcNm   = "";  //옵션 정책명 
    var delemeter = "@";
    var optDataList = [];
    
	$.each($(".optRadio") , function(j , obj){
		var cnt = (j+1);
		var plcNo      = $(':input[name="o2oPlcNo_'+(cnt)+'"]').val();      //옵션정책번호
		var optPchsPrc = $(':input[name="o2oOptPchsPrc_'+(cnt)+'"]').val(); //옵션가격
		var optPlcNm   = $(':input[name="o2oPlcNm_'+(cnt)+'"]').val(); //옵션명
		var optCnt     = 1;
		
		var checkYn = $(":radio[name='o2oOptRadio_"+(cnt)+"']:checked").val();
		if(checkYn == "Y"){
			optTotAmt += Number(optPchsPrc);
			optDataList.push({
				 optAmt    : optPchsPrc	
				,cntCdNm   : optCnt
				,optCo     : optCnt
				,optPlcNo  : plcNo	
				,optPlcNm  : optPlcNm
			}); 
		}
		if($(".optRadio").length == j){
			delemeter ="";
		}
		optCo     += ((checkYn == "Y") ? "1" : "0") + delemeter
		optAmt    += (optPchsPrc).toString() + delemeter;
		optPlcNo  += plcNo + delemeter
		optPlcNm  += optPlcNm + delemeter;
	});
	
	//console.log("optRadio.optTotAmt="+optTotAmt)
	var totBassSaleFee = $("#orgTotSaleAmtTxt").attr("val");
	var totSaleAmt = (Number(totBassSaleFee) + Number(optTotAmt)).toString();
	
	$("#optTotAmt").val(optTotAmt);
	$("#optAmt").val(optAmt);
	$("#optCo").val(optCo);
	$("#optPlcNo").val(optPlcNo);
	$("#optPlcNm").val(optPlcNm);

	optInfoHtml(optDataList);
});

var mountCheck = "10";	//현재 선택 된 장착서비스 유형
var mountCheck1 = "";	//현재 선택 된 장착서비스 유형
var jusoGbn = "";
var moveDate = "present";//present(현재),next(다음달)
var myLat = 37.57001757231217; //나의 위치 위도 (기본 위치)
var myLon = 126.827499331455; //나의 위치 경도 (기본 위치)
var savedPositions = [];

//주소 선택 팝업
function selectJusoPop(gbn){
	//주문자
	if(ValidUtil.isEmpty($("#orderNmTxt").val())) {
		ComUtil.alert("주문자를 입력해 주세요");
		return false;
	}
	//휴대폰 번호
	if(ValidUtil.isEmpty($("#phone02").val()) || ValidUtil.isEmpty($("#phone03").val())) {
		ComUtil.alert("휴대전화를 입력해 주세요");
		return false;
	} else {
		//전화번호 두번째 자리 체크 3자리 이상
		if($("#phone02").val().length < 3) {
			ComUtil.alert("휴대전화를 정확히 입력해 주세요");
			return false;
		}

		//전화번호 두번째 자리 체크 4자리 이상
		if($("#phone03").val().length < 4) {
			ComUtil.alert("휴대전화를 정확히 입력해 주세요");
			return false;
		}
	}
	
	mountCheck1 = gbn;
	$("#totalCount").text("");
	$("#jusoList").html("");
	$("#paging").html("");

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

//우편 번호 검색 - 검색 버튼 클릭
function selectJuso(pageNo) {
	//초기화
	if(pageNo != null){
		if(Number(pageNo)  == 0) {
			$("#currentPage").val("1");
		} else {
			$("#currentPage").val(pageNo);
		}
	} else {
		$("#currentPage").val("1");
	}

	$("#keyword").val($("#jusoTxt").val());

	$.ajax({
		 url :"<%= AppContext.getString("zipcd.url") %>"  //인터넷망
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
				//ComUtil.alert(errDesc);
				alert(errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlData);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	//ComUtil.alert("에러발생");
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

	//paging
	PageUtil.fnPageMakeDisplay(totCnt, $("#currentPage").val() ,  $('#paging') , 'selectJuso', 4);
}

//상세 우편 번호
/* function sendChildValue(zipCode, bdMgtSn, load, jibun) {
	$("#popDetailAddr").val("");
	$("#modal-1").removeClass("md-show");
	$("#popZipCode").text();
	$("#popLoadAddr").text(load + " " + bdMgtSn);
	$("#popJibunAddr").text(jibun);
	$("#modal-2").addClass("md-show");
} */

function sendChildValueCancle(){
	$(".layPopClose").click();
}

//상세 주소 화면 - 적용 버튼
function returnAddrInfo(cbData) {
	//검색어 초기화
	$("#jusoTxt").val("");

	//해당 주소의 거점 체크
	/* var zipCode = $("#popZipCode").text();
	var addr1 = $("#popLoadAddr").text();
	var addr2 = $("#popDetailAddr").val(); */

	//거점 재고 체크
	o2oStock(cbData.popLoadAddr, cbData.popDetailAddr, "1", "");
}

function o2oTmsStock(addr1, addr2 , pageNo, gbn, bhfCd, drvBayCo) {
	$("#orgzCd").val(bhfCd);
	
	//[드라이브 스루]
	//운영은 bhfCd = 역삼점으로 변경해야함(주소 : ) - drvBayCo 으로만 체크하기로 변경
	//로컬&개발은 신림점(주소 : )
	
	console.log("드라이브스루 서비스");
	console.log(bhfCd);
	console.log(drvBayCo);
	
	$("#drvBayCo").val(drvBayCo);
	
	if(drvBayCo > 0){
		$("#driveThrough").show();
		$("#drvThCd1").prop("checked", true);
		
		//드라이브스루가 선택되어있을때는 휠얼라인먼트 정비는 [쿠폰발급]으로 고정한다.
		//20210402 디폴트 값을 일반으로 수정 후 드라이브스루로 선택되어 있을때만 쿠폰발급 고정.
		if(drvThCd == "20"){					
			$("#giveCpnPick").prop("checked", true);
		}else{											
			$("#alignSerReq").prop("checked", true);
		}			
		
	}else{
		$("#driveThrough").hide();
		$("#drvThCd").val("");
	}	
	
	o2oStock(addr1, addr2 , pageNo, gbn);
}

var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수

//거점 재고 체크
function o2oStock(addr1, addr2 , pageNo, gbn) {

	var mountCd = $("input[name='mounting']:checked").val();		//장착구분
// 	var drvThCd = $("input[name='drvThCd']:checked").val();			//[드라이브스루 2021-02-01] 배송상세유형 추가

	var drvThCd = ""; //[드라이브스루 2021-02-01] 배송상세유형 추가
	if($("#drvBayCo").val() > 0){
		drvThCd = $("input[name='drvThCd']:checked").val();						
	}

	var pkLoca = "";
	var orgzCd = "";
	var bpCd = "";
	if(mountCd == "40"){
		pkLoca = "N";
		orgzCd = $("#orgzCd").val();
		bpCd = $("#bpCd").val();
	} else {
		pkLoca = $("input[name='pkLoca']:checked").val();			//PME, 차량주차위치, 2020-02-12
	}
	
	//해당 지역 외 주문 불가
	// 공통코드 사용하여 지역 체크  (SD287)
	
	if(mountCd != "40"){
	
		var rtnYn = false;
		$.each(ordAreaList , function(idx , obj){
			if(addr1.indexOf(obj.cmCdNm) > -1 ){
		    	rtnYn = true;
		    	return;
		    }
		});
		
		if(rtnYn){
			if(mountCd == "10"){
				//$("#bangMunAlertTxt").hide();
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkB").text('방문장착 서비스가 가능합니다.');
				$("#noPickUp > .validation").removeClass("warning");
			} else if(mountCd == "20"){
				if(mountCheck1 == "P1") {
					//$("#pick1AlertTxt").hide();
				}else if(mountCheck1 == "P2") {
					//$("#pick2AlertTxt").hide();
				}
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkP1").text('입력주신 장소로 서비스 진행이 가능합니다.');
				$("#pickUp > .validation").removeClass("warning");
			} else if(mountCd == "40"){
				//$("#junmunAlertTxt").hide();
				$("#addrOkJ").text('선택하신 전문점은 서비스 진행이 가능합니다.');
				$("#junmun > .validation").removeClass("warning");
				$("#modal-Shop").removeClass("md-show");
			}
		}else{
			if(mountCd == "10"){
				//$("#bangMunAlertTxt").show();
				$("#addrTxtB").val("");
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkB").text('입력하신 주소는 방문 장착 서비스 진행이 어렵습니다.');
				$("#noPickUp > .validation").addClass("warning");
				fnMove("noPickUp");
			} else if(mountCd == "20"){
				if(mountCheck1 == "P1") {
					//$("#pick1AlertTxt").show();
					$("#addrTxtP1").val("");
				}else if(mountCheck1 == "P2") {
					//$("#pick2AlertTxt").show();
					$("#addrTxtP2").val("");
				}
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkP1").text('입력하신 주소는 픽업서비스 진행이 어렵습니다.');
				$("#pickUp > .validation").addClass("warning");
				fnMove("pickUp");
			} else if(mountCd == "40"){
				//$("#junmunAlertTxt").show();
				$("#addrTxtJ").val("");
				$("#addrOkJ").text('선택하신 전문점은 온라인 구매를 통해 서비스 진행이 어렵습니다.');
				$("#junmun > .validation").addClass("warning");
				$("#modal-Shop").removeClass("md-show");
				fnMove("junmun");
			}
	
			//$("#loadingWrap").hide();
			return;
		}
	}
	 
	/* 
	if(mountCd != "40"){
		if(
			(addr1.indexOf("서울") < 0 || addr1.indexOf("종로구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("중구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("용산구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("성동구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("광진구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("동대문구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("중랑구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("성북구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("강북구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("도봉구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("노원구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("은평구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("서대문구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("마포구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("양천구") < 0) &&

			(addr1.indexOf("서울") < 0 || addr1.indexOf("강서구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("구로구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("영등포구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("금천구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("동작구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("관악구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("서초구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("강남구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("강서구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("송파구") < 0) &&
			(addr1.indexOf("서울") < 0 || addr1.indexOf("강동구") < 0) &&

			addr1.indexOf("수원시") < 0 &&
			addr1.indexOf("성남시") < 0 &&
			addr1.indexOf("용인시") < 0 &&
			addr1.indexOf("안양시") < 0 &&
			addr1.indexOf("안산시") < 0 &&
			addr1.indexOf("과천시") < 0 &&
			addr1.indexOf("광주시") < 0 &&
			addr1.indexOf("군포시") < 0 &&
			addr1.indexOf("부천시") < 0 &&
			addr1.indexOf("시흥시") < 0 &&
			addr1.indexOf("김포시") < 0 &&
			addr1.indexOf("안성시") < 0 &&
			addr1.indexOf("오산시") < 0 &&
			addr1.indexOf("의왕시") < 0 &&
			addr1.indexOf("이천시") < 0 &&
			addr1.indexOf("평택시") < 0 &&
			addr1.indexOf("하남시") < 0 &&
			addr1.indexOf("화성시") < 0 &&
			addr1.indexOf("여주시") < 0 &&
			addr1.indexOf("양평군") < 0 &&
			addr1.indexOf("고양시") < 0 &&
			addr1.indexOf("구리시") < 0 &&
			addr1.indexOf("남양주시") < 0 &&
			addr1.indexOf("동두천시") < 0 &&
			addr1.indexOf("양주시") < 0 &&
			addr1.indexOf("의정부시") < 0 &&
			addr1.indexOf("파주시") < 0 &&
			addr1.indexOf("포천시") < 0 &&
			addr1.indexOf("가평군") < 0 &&
			addr1.indexOf("연천군") < 0 &&
			addr1.indexOf("광명시") < 0 &&
			addr1.indexOf("천안시") < 0 &&
			addr1.indexOf("아산시") < 0 &&
			addr1.indexOf("진천군") < 0 &&

			addr1.indexOf("인천광역시") < 0
		){
	
			if(mountCd == "10"){
				//$("#bangMunAlertTxt").show();
				$("#addrTxtB").val("");
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkB").text('입력하신 주소는 방문 장착 서비스 진행이 어렵습니다.');
				$("#noPickUp > .validation").addClass("warning");
				fnMove("noPickUp");
			} else if(mountCd == "20"){
				if(mountCheck1 == "P1") {
					//$("#pick1AlertTxt").show();
					$("#addrTxtP1").val("");
				}else if(mountCheck1 == "P2") {
					//$("#pick2AlertTxt").show();
					$("#addrTxtP2").val("");
				}
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkP1").text('입력하신 주소는 픽업서비스 진행이 어렵습니다.');
				$("#pickUp > .validation").addClass("warning");
				fnMove("pickUp");
			} else if(mountCd == "40"){
				//$("#junmunAlertTxt").show();
				$("#addrTxtJ").val("");
				$("#addrOkJ").text('선택하신 전문점은 온라인 구매를 통해 서비스 진행이 어렵습니다.');
				$("#junmun > .validation").addClass("warning");
				$("#modal-Shop").removeClass("md-show");
				fnMove("junmun");
			}
	
			//$("#loadingWrap").hide();
			return;
		} else {
			if(mountCd == "10"){
				//$("#bangMunAlertTxt").hide();
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkB").text('방문장착 서비스가 가능합니다.');
				$("#noPickUp > .validation").removeClass("warning");
			} else if(mountCd == "20"){
				if(mountCheck1 == "P1") {
					//$("#pick1AlertTxt").hide();
				}else if(mountCheck1 == "P2") {
					//$("#pick2AlertTxt").hide();
				}
				$("#modal-Shop").removeClass("md-show");
				$("#addrOkP1").text('입력주신 장소로 서비스 진행이 가능합니다.');
				$("#pickUp > .validation").removeClass("warning");
			} else if(mountCd == "40"){
				//$("#junmunAlertTxt").hide();
				$("#addrOkJ").text('선택하신 전문점은 서비스 진행이 가능합니다.');
				$("#junmun > .validation").removeClass("warning");
				$("#modal-Shop").removeClass("md-show");
			}
		}
	}
 */
	var mountDt = $("#datepicker11").val().replace(/-/gi, "");		//장착일
	//var mountTime = $("#mountTime").val().replace(/[^0-9]/g,"");	//장착시간
	//var mountTime = "";//$("#mountTime").val().replace(/[^0-9]/g,"");	//장착시간
	var mountTime = $("#amArea span.on, #pmArea span.on").text().replace(":","");	//장착시간

	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("#ordNoCnt"+idx).text());
	});
	$("#itemCdArr").val(itemCdArr);
	$("#itemCntArr").val(itemCntArr);

	//방문주소, 픽업주소만 재고 조회를 한다. (딜리버리주소 때는 재고 조회 하지 않음.)
	if(mountCheck1 == "P2"){
		$("#dlvyCity").val($("#popSiNm").text());
		$("#dlvyCounty").val($("#popSggNm").text());
		$("#dlvyDong").val($("#popEmdNm").text());
		
		storeTmsFix(addr1 , addr2, $("#bpStockYn").val(), $("#rdcStockYn").val());
	}else{
		//var addr = addr1 + " " + addr2; //2020-02-20 ex)가평군 현리로 조회했을 경우 sktmap에서 조회하지 못하기에 상세주소를 제외하여 조회하도록 변경
		var addr = addr1;
		var city = $("#popSiNm").text();
		$("#city").val($("#popSiNm").text());
		var county = $("#popSggNm").text();
		$("#county").val($("#popSggNm").text());
		var dong = $("#popEmdNm").text();
		$("#dong").val($("#popEmdNm").text());
		
		var param = {iplAddr : addr , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : mountDt , mountTime : mountTime , pageNo : pageNo , o2oYn: "N", pkLoca: pkLoca, city: city, county: county, dong: dong, orgzCd : orgzCd, bpCd : bpCd, drvThCd : drvThCd};

		ComUtil.loading();
		$.ajax({
	        type: "post",
	        url: "/order/o2oTmsStock",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	if(data.rtnCode != "0") {
	        		$("#mountAlertTxt").hide();
	        		$("#modal-2").removeClass("md-show");
	        		if(!ValidUtil.isEmpty(data.bpStockYn)) {
		        		ComUtil.confirm(data.rtnMsg + "<br><br> 입고알람을 신청하시면 재고 충족 시 <br>입력하신 핸드폰 번호로 알람 문자를 보내드립니다. <br><br> 입고알람 신청을 하시겠습니까?", '' 
		        		,function(){//확인
		        			fn_stoAlert();
		        		}
		        		,function(){//취소
		        			
		        		}, "알림신청", "취소");
	        		} else {
	        			ComUtil.alert(data.rtnMsg);
	        		}
	        		return;
	        	}
    			$("#bpStockYn").val(data.bpStockYn);
    			$("#rdcStockYn").val(data.rdcStockYn);
    			$("#basementYn").val($("input[name='pkLoca']:checked").val());
        		//storeTmsFix(addr1 , addr2, data.orderTimeList, data.bpStockYn, data.rdcStockYn);
        		storeTmsFix(addr1 , addr2, data.bpStockYn, data.rdcStockYn);
	        	
	        	if(gbn == "map") {
	        	}
	        },
	        error: function(xhr,status,error){
	        },
	        complete: function () {
	        	ComUtil.unloading();
	        }
	    });
	}
	
}

//function storeTmsFix(addr1 , addr2, orderTimeList, bpStockYn, rdcStockYn) {
function storeTmsFix(addr1 , addr2, bpStockYn, rdcStockYn) {
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
		
		//RDC 시작일을 정해준다. 일요일이 있으면 +1일을 더해준다.
		var bhfLastDay = fn_deleteRdcDt();
		console.log(bhfLastDay);
		var mDate = bpStockYn == "Y" ? '+0d': bhfLastDay;
		
		$('#datepicker11').datepicker({
			showOn: "both",
			buttonImage: "/img/common/ico_calendar.png",
			buttonImageOnly: true,
			dateFormat: 'yy-mm-dd',
			yearRange: 'c-0:c+2',
			minDate: mDate,
			maxDate: '+20d',
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			disabled:false,
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
	      		
	      		// 전문점장착,픽업앤딜리버리 전문점 워크샵으로 인한 달력 가리기
	      		if($("[name='mounting']:checked")[0].id=="ser3" || $("[name='mounting']:checked")[0].id=="ser2") {
	      			storechkDay.push("20211207");
	      			storechkDay.push("20211208");
	      		}
	      		
			    for (i = 0; i < storechkDay.length; i++) {
			        if($.inArray((y+""+m+""+d) , storechkDay) != -1) {
			        	if(mountCheck == "40" && ((y+""+m+""+d) == "20200930")) {		        		
			        		return [true];
			        	} else {
			        		return [false];
			        	}
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
		//$("#datepicker11").datepicker( "option" , 'disabled', false );
		$("#datepicker11").val("");
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

	if(mountCheck == "10") {
		$("#addrTxtB").val(addr1 + " " +addr2);

		$("#iplAddr").val(addr1);
		$("#iplDtlAddr").val(addr2);
		//$("#iplZip").val(zipCode);

		$("#modal-2").removeClass("md-show");
		$("#mountAlertTxt").html("<span>장착일시에 서비스매니저가 도착하여 작업합니다.</span>");
	} else if(mountCheck == "20") {
		if(mountCheck1 == "P1") {
			$("#addrTxtP1").val(addr1 + " " +addr2);

			$("#pickupBassAddr").val(addr1);
			$("#pickupDtlAddr").val(addr2);
			//$("#pickupZip1").val(zipCode);
			
			$("#mountAlertTxt").html("<span>차량 픽업일시에 서비스매니저가 도착하여 차량을 인수합니다.</span>");
		} else {
			$("#addrTxtP2").val(addr1 + " " +addr2);

			$("#iplAddr").val(addr1);
			$("#iplDtlAddr").val(addr2);
			//$("#iplZip").val(zipCode);
		}
		$("#modal-2").removeClass("md-show");
	} else if(mountCheck == "40") {
		$("#addrTxtJ").val(addr1 + " " + addr2);

		$("#iplAddr").val(addr1);
		$("#iplDtlAddr").val(addr2);
		//$("#iplZip").val(zipCode);
		
		$("#modal-Shop").removeClass("md-show");
		$("#map").removeClass("md-show");
		$("#mountAlertTxt").html("<span>선택하신 장착일시에 전문점으로 방문해주시기 바랍니다.</span>");
	}
	
	//픽업 주소 = 딜리버리 주소가 같아야 한다.(첫 번째, 두 번째 단어가 같아야 한다.)
	if(mountCheck1 == "P1" || mountCheck1 == "P2") {
		var rtnChkAddr = chkPickAndDlvyAddr(addr1);
		
		if(!rtnChkAddr) {
			if(mountCheck1 == "P1") {
				$("#addrTxtP1").val("");
				$("#pickupBassAddr").val("");
				$("#pickupDtlAddr").val("");
				$("#pickupZip").val("");
			} else {
				$("#addrTxtP2").val("");
				$("#iplAddr").val("");
				$("#iplDtlAddr").val("");
				$("#iplZip").val("");
			}
			ComUtil.alert("픽업 주소와 딜리버리 주소는 같은 지역으로 제한 됩니다. ex) 서울특별시 서초구");
		}
	}

	$("#jusoTxt").val("");
	$("#jusoList").html("");
	$("#totalCount").text("");

	ComUtil.unloading();
}

//전문점 조회 시 거점 정보 조회
function selectStore(addrTxt , pageNo){
	if($("#meajang").val() == "") {
		//ComUtil.alert("전문점 주소를 입력 하세요.");
		//alert("전문점 주소를 입력 하세요.");
		//return false;
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
        		alert("거점 배정 중 오류가 발생 하였습니다. 관리자에게 문의 해 주세요.");
        		return;
        	}
    		var list = data.rtnList;

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
		    		html += "				<button type='button' class='md-close' onClick='fn_searchAgencyInfo(\""+list[i].agencyCd+"\");'><b>상세보기</b><span></span></button>";
		    		html += "				<button type='button' class='md-close' onClick='o2oTmsStock(\""+list[i].city + " " +list[i].street+"\", \""+" "+"\",\""+1+"\", \"map\");'><b>선택하기</b><span></span></button>";
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

				//var pageCommon = data.pageCommon;
				//PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].posY , list[0].posX, list[0].agencyNm , positions, "mapDiv");
    		} else {
    			html += "<li>조회된 전문점이 없습니다.</li>";
    			$("#storeList").html(html);
				$("#storeListCnt").html("0");

				//$("#loadingWrap").hide();
    		}
        },
        error: function(xhr,status,error){
        	//$("#loadingWrap").hide();
        	//ComUtil.alert(support0014);
        },
        complete: function() {
        	ComUtil.unloading();
        }
    });
}

//전문점 조회 시 거점 정보 조회
function selectStore2(sBpCd , pageNo){
	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	//var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , pageNo : pageNo};
	var mountCd = $("input[name='mounting']:checked").val();			//장착구분
// 	var drvThCd = $("input[name='drvThCd']:checked").val();			//[드라이브스루 2021-02-01] 배송상세유형 추가

	var drvThCd = ""; //[드라이브스루 2021-02-01] 배송상세유형 추가
	if($("#drvBayCo").val() > 0){
		drvThCd = $("input[name='drvThCd']:checked").val();						
	}
	
	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("#ordNoCnt"+idx).text());
	});

	var param = {itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : "" , mountTime : "" , pageNo : pageNo , o2oYn : "Y" , bpCd : sBpCd, drvThCd : drvThCd};

	ComUtil.loading();
	$.ajax({
        type: "post",
        url: "/order/searchRentStore",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "-1") {
        		//ComUtil.alert(data.rtnMsg);
        		alert(data.rtnMsg);
        		return;
        	}
    		var list = data.list;

    		var html = "";
    		if(list.length > 0 ) {
	        	//페이지용
            	var positions = [];
	    		//for(var i=0; i<list.length; i++) {

	    			html += "		<div class='layout-r'>";
	    			html += "			<div class='shop-content-box layout-c'>";
	    			html += "				<ul class='mb-m'>";
	    			html += "					<li><b>" + list[0].bhfNm + "</b></li>";
	    			html += "					<li>" + list[0].addr + "</li>";
	    			if(list[0].bhfCd == "O40321627") {
			    		/* html += "        <li><b>수입차 경정비 가능/[드라이브스루 가능]</b></li>"; */
	    				   html += "        <li><b>[드라이브스루 가능]</b></li>";
		    		} else {
		    			/* html += "        <li><b>수입차 경정비 가능</b></li>"; */
		    			/* html += "        <li><b>경정비 가능</b></li>"; */
		    		}
	    			html += "				</ul>";
	    			html += "				<div class='layout-r'>";
	    			html += "					<div class='shop-state-icon layout-r inline inline-s'>";
	    			if(list[0].seasonGbn == "Y") {
		    			html += "						<div class='state inline'>";
		    			html += "							<img src='../img/common/state_ico02.png' alt='타이어'>";
		    			html += "							<span>타이어</span>";
		    			html += "						</div>";
	    			}
	    			if(list[0].chYn == "Y") {
		    			html += "					<div class='state inline'>";
		    			html += "	  					<img src='../img/common/state_ico03.png' alt='경정비'>";
		    			html += "  						<span>경정비</span>";
		    			html += "					</div>";
	    			}
	    			if(list[0].cwYn == "Y") {
	    				html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico04.png'  alt='겨울용'/>";
			    		html += "           			<span>겨울용</span>";
			    		html += "        			</div>";
	    			}
	    			if(list[0].fmYn == "Y") {
			    		html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico01.png'  alt='세차'/>";
			    		html += "           			<span>세차</span>";
			    		html += "        			</div>";
		    		}
		    		if(list[0].lmYn == "Y") {
			    		html += "        			<div class='state inline'>";
			    		html += "           			<img src='/img/common/state_ico01.png'  alt='1급정비'/>";
			    		html += "           			<span>1급정비</span>";
			    		html += "        			</div>";
		    		}
		    		html += "					</div>";
		    		html += "				</div>";
		    		html += "			</div>";
		    		html += "			<div class='shop-btn-box inline text-right align-bottom layout-c'>";
		    		html += "				<button type='button' class='md-close' onClick='fn_searchAgencyInfo(\""+list[0].agencyCd+"\");'><b>상세보기</b><span></span></button>";
		    		html += "				<button type='button' class='md-close' onClick='o2oTmsStock(\""+list[0].addr+"\", \""+" "+"\",\""+1+"\", \"map" + "\",\""+ list[0].bhfCd + "\",\""+ list[0].drvBayCo + "\");'><b>선택하기</b><span></span></button>";
		    		html += "			</div>";
		    		html += "		</div>";

	    		//}
				$("#storeInfo").html(html);
				//$("#storeListCnt").html(list.length);

				//var pageCommon = data.pageCommon;
				//PageUtil.fnPageMakeDisplay(list.length, $("#pageNo").val() , $("#pagingMap") , "selectStorePage", 10);

				//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
	        	mapDraw(list[0].lon , list[0].lat, list[0].bhfNm , savedPositions, "mapDiv");
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
        },
        complete: function() {
        	ComUtil.unloading();
        }
    });
}

//전문점 찾기 팝업 - o2o 전문점 찾기
function selectO2o(pageNo, mapOpenYn) {
	var mountCd = $("input[name='mounting']:checked").val();			//장착구분
// 	var drvThCd = $("input[name='drvThCd']:checked").val();			//[드라이브스루 2021-02-01] 배송상세유형 추가

	var drvThCd = ""; //[드라이브스루 2021-02-01] 배송상세유형 추가
	if($("#drvBayCo").val() > 0){
		drvThCd = $("input[name='drvThCd']:checked").val();						
	}

	var mountDt = $("#datepicker11").val().replace(/-/gi, "");			//장착일
	//var mountTime = $("#mountTime").val().replace(/[^0-9]/g,"");	//장착시간
	var mountTime = $("#amArea span.on, #pmArea span.on").text().replace(":","")+"00";
	
	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("#ordNoCnt"+idx).text());
	});
	$("#itemCdArr").val(itemCdArr);
	$("#itemCntArr").val(itemCntArr);
	
	//넥센직영점찾기 검색 (css 수정 필요한 사항들 각태그에 강제 삽입)
	var sido = $("#sido").val();
	var meajang = $("#meajang").val();
	
	if(sido == 0 ) {
		sido = '';
	}

	var sBpCd = $("#meajangCd").val();
	var param = {searchClCd : sido ,  searchPtnCd : $("#sigungu option:checked").text() , searchKeyword : meajang , itemCdArr : itemCdArr, itemCntArr : itemCntArr , mountCd : mountCd , mountDt : mountDt , mountTime : mountTime , pageNo : pageNo , o2oYn : "Y" , bpCd : sBpCd, drvThCd : drvThCd};
	var positions = [];
	
	$.ajax({
        type: "post",
        url: "/order/searchRentStore",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	console.log(data)
        	if(data.rtnCode == "-1") {
        		//ComUtil.alert(data.rtnMsg);
        		alert(data.rtnMsg);
        		return;
        	}

        	//리스트 그리기
        	var list = data.list;
    		var html = "";
    		var exCnt = 0; // O40521142, O40521134, O40521145 3개 영업소 넥센직영점 검색 안되도록 제외, 쿼리 수정없이 하기 위한 임시 변수 생성
			// 총 갯수 계산을 위해 필요
        	
    		for(var i=0; i<list.length; i++) {
    			if(list[i].bhfCd != "O40521142" && list[i].bhfCd != "O40521134" && list[i].bhfCd != "O40521145") {
	    		html += "<li>";
	    		html += "<div class='shop-search-single'>";
	    		html += "	<div class='layout-r'>";
	    		html += "		<div class='shop-content-box layout-c'>";
	    		html += "    		<ul class='mb-m'>";
	    		html += "        		<li><b>"+list[i].bhfNm+"</b></li>";
	    		html += "        		<li>"+list[i].addr+"</li>";
	    		if(list[i].bhfCd == "O41219112") {
		    		/* html += "        <li><b>수입차 경정비 가능/[드라이브스루 가능]</b></li>"; */
		    		html += "        <li><b>[드라이브스루 가능]</b></li>";
	    		} else {
	    			/* html += "        <li><b>수입차 경정비 가능</b></li>"; */
	    			/* html += "        <li><b>경정비 가능</b></li>"; */
	    		}
	    		html += "    		</ul>";
	    		html += "    		<div class='layout-r'>";
	    		html += "    			<div class='shop-state-icon layout-r inline inline-s'>";
	    		if(list[i].seasonGbn == "Y") {
		    		html += "        		<div class='state inline'>";
		    		html += "            		<img src='/img/common/state_ico02.png'  alt='타이어'/>";
		    		html += "            		<span>타이어</span>";
		    		html += "        		</div>";
	    		}
	    		if(list[i].chYn == "Y") {
		    		html += "        		<div class='state inline'>";
		    		html += "            		<img src='/img/common/state_ico03.png'  alt='경정비'/>";
		    		html += "            		<span>경정비</span>";
		    		html += "        		</div>";
	    		}
	    		if(list[i].cWYn == "Y") {
		    		html += "        		<div class='state inline'>";
		    		html += "            		<img src='/img/common/state_ico04.png'  alt='겨울용'/>";
		    		html += "            		<span>겨울용</span>";
		    		html += "        		</div>";
	    		}
	    		if(list[i].fmYn == "Y") {
		    		html += "        		<div class='state inline'>";
		    		html += "            		<img src='/img/common/state_ico01.png'  alt='세차'/>";
		    		html += "            		<span>세차</span>";
		    		html += "        		</div>";
	    		}
	    		if(list[i].lmYn == "Y") {
		    		html += "        		<div class='state inline'>";
		    		html += "            		<img src='/img/common/state_ico01.png'  alt='1급정비'/>";
		    		html += "            		<span>1급정비</span>";
		    		html += "        		</div>";
	    		}
                html += "    			</div>";
                html += "    		</div>";
                html += "    	</div>";
                html += "    	<div class='shop-btn-box inline text-right align-bottom layout-c'>";                
                html += "			<button type='button' onClick='o2oTmsStock(\""+list[i].addr+"\", \""+" "+"\",\""+1+"\", \"map" + "\",\""+ list[i].bhfCd + "\",\""+ list[i].drvBayCo + "\");'><b>선택하기</b><span></span></button>";
                html += "			<button type='button' onClick='moveStore(\""+list[i].lat+"\", \"" + list[i].lon + "\", \"" + list[i].bpCd + "\");'><b>이동하기</b><span></span></button>";
                html += "	 	</div>";
                html += "    </div>";
                html += "</div>";
                html += "</li>";
    			
                var obj = {
	        			title	: list[i].bhfNm,
	        			addr 	: list[i].addr,
	        			lat		: list[i].lat,
	        			lon		: list[i].lon,
	        			bpCd	: list[i].bpCd
	        			};

    			positions.push(obj);
    			} else {
        			exCnt += 1;
        		}
    		}
    		if(pageNo == '1') {
				$("#storeList").html(html);
				$("#pageNo").val(1);
    		} else {
    			$("#storeList").append(html);
    			var nextPageNo = Number($("#pageNo").val()) + 1;
    			$("#pageNo").val(nextPageNo);
    		}
			$("#storeListCnt").html(data.pageCommon.totalCount - Number(exCnt));

			var pageCommon = data.pageCommon;
			PageUtil.fnPageMakeMoreDisplay(data.pageCommon.totalCount - Number(exCnt), $("#pageNo").val() , $("#pagingMap") , "selectO2o", 10);

			//지도 그리기 전 나의 위치 좌표를 맨마지막에 넣는다.
			//맨 마지막에 넣는 이유 : navigator 가 비동기이기 때문.
			var obj2 ={
					title	: "나의 위치",
	    			addr 	: "",
	    			lat		: myLat,
	    			lon		: myLon,
	    			bpCd	: ""
			}
			
			positions.push(obj2);
			savedPositions = positions;//지도에서 이동하기에 사용하려고 전역으로 저장해둔다.
        	//지도 그리기 - 조회 된 위치 중 가장 가까운 좌표로 그린다.
        	if(mapOpenYn != 'Y') {
        		mapDraw(list[0].lon , list[0].lat, list[0].bhfNm , positions, "mapDiv");
        	} else {
        		mapDraw(myLon , myLat, "" , positions, "mapDiv");
        	}
        	$("#meajangCd").val("");
        },
        error: function(xhr,status,error){
        	//ComUtil.alert(support0014);
        }
    });
}

var pageAddr = "";
var positions = [];
var mapTargetDiv;
var agencyNm;

//지도 팝업 호출
function callMap(gbn) {
	
	//주문자
	if(ValidUtil.isEmpty($("#orderNmTxt").val())) {
		ComUtil.alert("주문자를 입력해 주세요");
		return false;
	}
	//휴대폰 번호
	if(ValidUtil.isEmpty($("#phone02").val()) || ValidUtil.isEmpty($("#phone03").val())) {
		ComUtil.alert("휴대전화를 입력해 주세요");
		return false;
	} else {
		//전화번호 두번째 자리 체크 3자리 이상
		if($("#phone02").val().length < 3) {
			ComUtil.alert("휴대전화를 정확히 입력해 주세요");
			return false;
		}

		//전화번호 두번째 자리 체크 4자리 이상
		if($("#phone03").val().length < 4) {
			ComUtil.alert("휴대전화를 정확히 입력해 주세요");
			return false;
		}
	}
	
	
	$("#modal-Shop").addClass("md-show");
	//주소로 좌표 찾기
	/* var geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch('서울특별시 강서구 마곡동 756-5', function(result, status) {
		console.log(result)
	    // 정상적으로 검색이 완료됐으면
	     if (status === kakao.maps.services.Status.OK) {
	    	 console.log(result[0].y)
	    	 console.log(result[0].x)
	    }
	}); */

	//현재 내 위치 또는 고정 좌표로 호출
	if( gbn == "2" ) {
		if($("#meajang").val() == "") {
			//ComUtil.alert("전문점 주소를 입력 하세요.");
			//alert("전문점 주소를 입력 하세요.");
			//return false;
		}
		selectStore($("#meajang").val(), "1");
	} else { //검색 주소로 호출
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
		if(navigator.geolocation) {
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	myLat = position.coords.latitude, // 위도
		    	myLon = position.coords.longitude; // 경도
			});
		}
		
		//지도 띄우자마자 전문점 전체 목록 뿌리기
		selectO2o('1','Y');
	}
}

function moveStore(agencyLat, agencyLon, bpCd) {
    map.setCenter(new daum.maps.LatLng(agencyLat, agencyLon));
    map.setLevel(5);
    selectStore2(bpCd, "1");
    $(".change-map").click();
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

function fn_searchAgencyInfo(agencyCd) {
	var pUrl = "/order/rentalAgencyInfo";

	var pParams = {
			agencyCd 		: agencyCd
	};

	cfnSendRequest(pUrl,pParams,'rentalAgencyInfo');
}

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
    	if(i == (positions.length-1)) {
    		imageSrc = "/img/common/map_ico_03.png";
    	} else {
    		imageSrc = "/img/common/icon_pin.png";
    	}
    	
    	var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : new daum.maps.MarkerImage(imageSrc, imageSize), // 마커 이미지
            clickable: true
        });
        //agencyNm = positions[i].title;
        
        if(i != (positions.length-1)) {
        	infoWindow(marker, positions[i].title, positions[i].bpCd);
        }
    }
    
    map.relayout();
	//지도 리사이즈
	//지도 영역 리사이즈
    /* $("#mapDiv").height("800px");
    $("#mapDiv").width("920px");

    $("#map").addClass("md-show");

    $("#loadingWrap").hide(); */
    //infoWindow(marker, agencyBhfNm, tel_no, rep_nm, city, street, addr3, agency_cd, salesGroup, salesOffice, pos_cd);
}

//function infoWindow(marker, agencyBhfNm, tel_no, rep_nm, city, street, addr3, agency_cd, salesGroup, salesOffice, pos_cd){
function infoWindow(marker, agencyBhfNm, bpCd){
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
        $("#meajangCd").val(bpCd);
		//parent.setRentalInf(city, street, agencyBhfNm, addr3, agency_cd, salesGroup, salesOffice, tel_no, pos_cd);
		$(".shop-search-single").attr("style","display:'';");
		//callMap('3');
		//selectO2o('1','N');
		selectStore2(bpCd, "1");
    });

}

//입력 폼 유효성 체크
function validation(){
	//주문자
	if($("#orderNmTxt").val() == "") {
		//ComUtil.alert("주문자를 입력해 주세요");
		alert("주문자를 입력해 주세요");
		$("#orderNmTxt").focus();
		return false;
	}
	//휴대폰 번호
	if($("#phone02").val() == "" || $("#phone03").val() == "") {
		//ComUtil.alert("휴대전화를 입력해 주세요");
		alert("휴대전화를 입력해 주세요");
		$("#phone02").focus();
		return false;
	} else {
		//전화번호 두번째 자리 체크 3자리 이상
		if($("#phone02").val().length < 3) {
			//ComUtil.alert("휴대전화를 정확히 입력해 주세요");
			alert("휴대전화를 정확히 입력해 주세요");
			$("#phone02").focus();
			return false;
		}

		//전화번호 두번째 자리 체크 4자리 이상
		if($("#phone03").val().length < 4) {
			//ComUtil.alert("휴대전화를 정확히 입력해 주세요");
			alert("휴대전화를 정확히 입력해 주세요");
			$("#phone03").focus();
			return false;
		}
	}

	//장착주소
	var mountCd = $("input[name='mounting']:checked").val();
	var mountDt = $("#datepicker11").val().replace(/-/gi, "");
	//var mountTime = $("#mountTime").val().replace(/[^0-9]/g,"")+"00";
	var mountTime = $("#amArea span.on, #pmArea span.on").text().replace(":","")+"00";
	
	//장착서비스 구분
	$("#mountCd").val(mountCd);
	//장착 희망일시
	$("#istReqDe").val(mountDt);
	//장착 희망시간
	$("#istDueDe").val(mountTime);

	if(mountCheck == "10") {
		if($("#addrTxtB").val() == "") {
			//ComUtil.alert("방문 장착 서비스 주소를 입력해 주세요", "방문장착", "맞습니다", function() {});
			alert("방문 장착 서비스 주소를 입력해 주세요");
			$("#addrTxtB").focus();
			return false;
		}
	} else if(mountCheck == "20") {
		if($("#addrTxtP1").val() == "") {
			//ComUtil.alert("픽업주소를 입력해 주세요");
			alert("픽업주소를 입력해 주세요");
			$("#addrTxtP1").focus();
			return false;
		}
		if($("#addrTxtP2").val() == "") {
			//ComUtil.alert("딜리버리를 입력해 주세요");
			alert("딜리버리를 입력해 주세요");
			$("#addrTxtP2").focus();
			return false;
		}
	} else if(mountCheck == "40") {
		if($("#addrTxtJ").val() == "") {
			//ComUtil.alert("전문점주소를 입력해 주세요");
			alert("전문점주소를 입력해 주세요");
			$("#addrTxtJ").focus();
			return false;
		}
	}

	//장착 희망일시
	if($("#datepicker11").val() == "" || ValidUtil.isEmpty($("#amArea span.on, #pmArea span.on").text())) {
		//ComUtil.alert("장착 희망일을 입력해 주세요");
		alert("장착일자/장착시간을 입력해 주세요");
		$("#datepicker11").focus();
		return false;
	}

	//차량번호
	if($("#carNoTxt").val() == "" ){
		//ComUtil.alert("차량번호를를 입력해 주세요");
		alert("차량번호를를 입력해 주세요");
		$("#carNoTxt").focus();
		return false;
	}

	return true;
}


$.popModalCenter1 = function(option){
	var settings = {
			url 		: option.url,
			pObj 		: "",
			width 		: "800",
			height 		: "600",
			scroll 		: "no",
			status 		: "no",
			center 		: "yes",
			resizable 	: "no",
			name		: "popup" + option.url
		};

		settings = $.extend({}, settings, option);

		var popFeatures = "width=" + settings.width + "px,height="+settings.height + "px,scrollbars="+settings.scroll;
			popFeatures += ",status="+settings.scroll+",resizable=" + settings.resizable
						+ ',location=no';

		var win = window.open(settings.url, settings.name, popFeatures);

		//팝업 닫기 시 이벤트 호출
		var interval = window.setInterval(function() {
	        try {
	            if (win == null || win.closed) {
	                window.clearInterval(interval);
	                /*
	                	내용    : 결제 후 로딩바 제거 없앰.
	                	요청자 : 구광태
	                	요청일 : 2020.03.19
	                	
	                	내용    : 팝업 단순 종료시 로딩바 제거
	                	요청자 : 구광태
	                	수정일 : 2020.11.27
	                */
	                if(option.mod == "kakao" && ValidUtil.isEmpty($("#pgToken").val())) {
	                	ComUtil.unloading();
	                }
	            }
	        }
	        catch (e) {
	        }
	    }, 1000);
	    return win;

		win.focus();
	}

//KCP 결제창 오픈
function fnKcpOrder() {
	$("#pay_method").val($("#Ppay_method").val());
	$("#ordr_idxx").val($("#Pordr_idxx").val());
	$("#good_name").val($("#Pgood_name").val());
	$("#cust_no").val($("#Pcust_no").val());
	$("#good_mny").val($("#Pgood_mny").val());
	$("#quantity").val($("#Pquantity").val());
	$("#buyr_name").val($("#Pbuyr_name").val());
	$("#buyr_mail").val($("#Pbuyr_mail").val());
	$("#buyr_tel1").val($("#Pbuyr_tel1").val());
	$("#buyr_tel2").val($("#Pbuyr_tel2").val());
	
	$("#frm").attr("action", "/order/openKcpPayment").submit();
}

//카카오 결제 창 오픈
function fnKakaoOrder(){
	$.ajax({
	    url: "/order/openKakaoPayment",
	    type: "POST",
	    cache:false,
	    processData: false,
	    data: $("#frm").serialize(),
	    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	if(data != null) {
				$.popModalCenter1({
					url       : data,
					scroll    : "yes",
					width     : "940",
					resizable : "yes",
					mod		  : "kakao"
				});
	    	}
	    },
	    error: function (request, status, error) {
	    	console.log(error)
		}
	});
}

//네이버 페이 add by Jo 2020.10
var oPay = Naver.Pay.create({
   	"mode" :  "<%=AppContext.getString(WebConstants.NPAY_MODE)%>", // development or production
    "clientId": "<%=AppContext.getString(WebConstants.NPAY_CLIENT_ID)%>",
    "openType": "popup",
    "onAuthorize" : function(oData) {
       	if(oData.resultCode == "Success"){
       		$("#paymentId").val(oData.paymentId);
       		$("#returnUrl").val(oData.returnUrl);
			
       		//주문 생성
       		var frm = document.frm;
  		    	frm.action = '/order/npayComplate';
			frm.submit();
       	}else{
       		ComUtil.unloading();
       		if(oData.resultCode == "UserCancel"){
    			ComUtil.alert("결제를 취소하셨습니다.<br> 주문 내용 확인 후 다시 결제해주세요.");
    		}else if(oData.resultCode == "TimeExpired"){
    			ComUtil.alert("결제 가능한 시간이 지났습니다.<br> 주문 내용 확인 후 다시 결제해주세요.");
    		}
       	}
    }//end onAuthorize
}); 
function fn_popNpayInfo(){
	ComUtil.loading();
	$('#popNpayInfo').removeClass("md-show");
	
	var productItems = [];
	var productCount = 0;
	$("ul[name='ordNoSn']").each(function(idx){
		var productItem = {};
		productItem.categoryType = 'PRODUCT';
		productItem.categoryId = 'GENERAL';
		productItem.uid = $(this).attr("itemcd");
		//productItem.name = $(this).attr("itemNm");
		productItem.name = $(this).attr("patternCd");
		productItem.count = Number($("#ordNoCnt"+idx).text());
		productCount += Number($("#ordNoCnt"+idx).text());
		productItems.push(productItem);
	});
	$("#productCount").val(productCount);			//상품 수량 예: A 상품 2개 + B 상품 1개의 경우 productCount 3으로 전달
	oPay.open({
        "merchantUserKey":  $("#merchantUserKey").val(),
        "merchantPayKey": $("#merchantPayKey").val(),
        "productName": $("#productName").val(),
        "productCount": Number($("#productCount").val()),
        "totalPayAmount": Number($("#totalPayAmount").val()),
        "taxScopeAmount": Number($("#taxScopeAmount").val()),
        "taxExScopeAmount": Number($("#taxExScopeAmount").val()),
        "useCfmYmdt": $("#useCfmYmdt").val(),
        "productItems" : productItems,
        "returnUrl": "<%=AppContext.getString(WebConstants.NPAY_RETURN_URL)%>"
    });
}

//시도 셀렉트 선택 시 시군구 조회
function selectSiGunGu(){

	var sido = $("#sido").val();

	if (ValidUtil.isEmpty(sido)) {
		$("#sigungu").empty();
		return false;
	}

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
	var mountCd = $("input[name='mounting']:checked").val();//장착구분
	
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
		itemCntArr.push($("#ordNoCnt"+idx).text());
	});
	
	param["mountDt"] = $("#datepicker11").val();
	if(mountCd == "10") {//방문장착일때
		param["iplAddr"] = $("#iplAddr").val();
		param["iplDtlAddr"] = $("#iplDtlAddr").val();
		param["city"] = $("#city").val();
		param["county"] = $("#county").val();
		param["dong"] = $("#dong").val();
	} else {//P&D때 - 픽업주소정보로 조회한다.
		//픽업주소
		param["pickupBassAddr"] = $("#pickupBassAddr").val();
		param["pickupDtlAddr"] = $("#pickupDtlAddr").val();
		param["city"] = $("#city").val();
		param["county"] = $("#county").val();
		param["dong"] = $("#dong").val();

		//딜리버리 주소
		param["iplAddr"] = $("#iplAddr").val();
		param["iplDtlAddr"] = $("#iplDtlAddr").val();
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

	var optPlcNo   = "";  //옵션 정책번호 
    var delemeter = "@";
    
	$.each($(".optRadio") , function(i , obj){
		
		var cnt = (i+1);	
	    var plcNo = $(':input[name="o2oPlcNo_'+(cnt)+'"]').val();      //옵션정책번호
		var checkYn = $(":radio[name='o2oOptRadio_"+(cnt)+"']:checked").val();
		if(checkYn == "Y"){
			optPlcNo  += $(':input[name="o2oPlcNo_'+(cnt)+'"]').val() + delemeter;
		}
	});
	console.log(optPlcNo);
	param["optPlcNo"] = optPlcNo;	
	
   	$.ajax({
        type: "post",
        url: "/order/selectTmsSetTimeList",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	if(data.rtnCode == "0") {
        		var resultData = data.rtnVo.resultData;
        		var dt = new Date(param.mountDt);
        		
        		console.log(resultData);
        		$.each(resultData, function(idx, item) {
        			if(dt.getDay() == "6" && item.time == "0900") {
		        		// 서비스매니저 출근시간을 맞추기 위해 토요일 09:00 배정 버튼 가리기
		        		// getDay() => 6이면 토요일 (0부터 일요일)
		        		// console.log("토요일 9시");
		        	} else {
		        		$("#time"+item.time).removeClass("off");
			        	$("#time"+item.time).removeClass("on");
			        	if(item.schedule.length > 0) {
			        		$("#time"+item.time).attr("schedule",JSON.stringify(item.schedule));
			        	}
			        	if(mountCd == "20") {
			        		$("#time"+item.time).attr("centerSchedule",JSON.stringify(item.centerSchedule));
			        	}
		        	}
        		});
        	}
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
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
	
	if(ValidUtil.isEmpty($("#orgzCd").val())) {
		param["bpCd"] = $("#bpCd").val();
	} else {
		param["orgzCd"] = $("#orgzCd").val();
	}
	param["mountDt"] = $("#datepicker11").val().replace(/-/gi, "");
	
	//itemCd및 수량
	var itemCdArr = new Array();
	var itemCntArr = new Array();
	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("#ordNoCnt"+idx).text());
	});
	
	param["itemCdArr"] = itemCdArr;
	param["itemCntArr"] = itemCntArr;
	param["alignYn"] = $("input[name='alignRd']:checked").val();
	var optPlcNo   = "";  //옵션 정책번호 
    var delemeter = "@";
    
	$.each($(".optRadio") , function(i , obj){

		var cnt = (i+1);	
	    var plcNo = $(':input[name="o2oPlcNo_'+(cnt)+'"]').val();      //옵션정책번호
		var checkYn = $(":radio[name='o2oOptRadio_"+(cnt)+"']:checked").val();
		if(checkYn == "Y"){
			optPlcNo  += $(':input[name="o2oPlcNo_'+(cnt)+'"]').val() + delemeter;
		}			
	});
	param["optPlcNo"] = optPlcNo;
	
	/*
	전문점(40) + 드라이브스루(20) 선택시 기존 스케쥴과 분리
	*/
	param["mountCd"] = $("input[name='mounting']:checked").val();//장착구분
// 	param["drvThCd"] = $("input[name='drvThCd']:checked").val();//[드라이브스루 2021-02-01] 배송상세유형 추가

	if($("#drvBayCo").val() > 0){
		param["drvThCd"] = $("input[name='drvThCd']:checked").val();//[드라이브스루 2021-02-01] 배송상세유형 추가						
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

function init() {
	var orderList = new Array();
	var grandCouponList = new Array();
	var grandCouponObj = {};
 	<c:forEach items="${ordList}" var="orderList">
		orderList.push("${orderList.itemCd}")
	</c:forEach>
	<c:forEach items="${couponItem}" var="couponItemList">
		<c:forEach items="${couponItemList.selectCouponItem}" var="selectCouponItem">	
			<c:if test="${selectCouponItem.cpnLvlCd eq '3'}">	
				grandCouponObj = {	"cpnNo":"${selectCouponItem.cpnNo}"
									,"cpnNm":"${selectCouponItem.cpnNm}"
									,"cpnLvlCd":"${selectCouponItem.cpnLvlCd}"
									,"cpnUnitCd":"${selectCouponItem.cpnUnitCd}"
									,"cpnUnitVal":"${selectCouponItem.cpnUnitVal}"
									,"dpPrNo":"${selectCouponItem.dpPrNo}"
									,"itemCd":"${selectCouponItem.itemCd}"
								};
				grandCouponList.push(grandCouponObj);
			</c:if>
		</c:forEach>
	</c:forEach>
	var existCnt = 0;
	var grandCarHtml = "";
	//개발
	//var grandCarList = ["12364NX", "12170NXUA"];
	var grandCarList = ["15969NX","15969NXUA","13474NXUA","14491NXUA","15259NXUA",
					    "12388NX","14694NX","15999NX","15999NXUA","12402NX",
					    "12398NX","15992NX","15992NXUA","15351NX","12370NX",
					    "14702NX","16002NX","16002NXUA","12389NX","14704NX",
					    "15518NX","15117NX","15971NX","15971NXUA","12383NX",
					    "14697NX","15993NX","15993NXUA","12390NX","14708NXUA","15528NX"];
	
	$.each(orderList, function(idx, item) {
		$.each(grandCarList, function(idx, carItem) {
			if(item == carItem) {
				existCnt++;
			}
		});
	});
	
	if(existCnt > 0) {
		var dupCoupon = "";
		
		if(grandCouponList.length > 0) {
			$("#specialCouponDiv").show();
			
			$.each(grandCouponList, function(idx, couponItem) {
				$.each(grandCarList, function(idx, carItem) {
					if(couponItem.itemCd == carItem) {
						if(ValidUtil.isEmpty(dupCoupon)) {
							dupCoupon = couponItem.cpnNo;
							grandCarHtml += "<option value='" + couponItem.cpnNo + "' cpNm='" + couponItem.cpnNm + "' arrGbn='1' cpCd='" + couponItem.cpnNo + "' cpnLvlCd='" + couponItem.cpnLvlCd + "' unitCd='" + couponItem.cpnUnitCd + "' unitVal='" + couponItem.cpnUnitVal + "' dpPrNo='" + couponItem.dpPrNo + "' itemCd='" + couponItem.itemCd + "' cpnLvlCd='" + couponItem.cpnLvlCd + "' pdCpnIdx='"+(idx-1)+"'>" + couponItem.cpnNm + "</option>";
						} else {
							if(dupCoupon != couponItem.cpnNo) {
								grandCarHtml += "<option value='" + couponItem.cpnNo + "' cpNm='" + couponItem.cpnNm + "' arrGbn='1' cpCd='" + couponItem.cpnNo + "' cpnLvlCd='" + couponItem.cpnLvlCd + "' unitCd='" + couponItem.cpnUnitCd + "' unitVal='" + couponItem.cpnUnitVal + "' dpPrNo='" + couponItem.dpPrNo + "' itemCd='" + couponItem.itemCd + "' cpnLvlCd='" + couponItem.cpnLvlCd + "' pdCpnIdx='"+(idx-1)+"'>" + couponItem.cpnNm + "</option>";
							}
						}
					}
				});
			});
			
			$("#selectCoupon2").append(grandCarHtml);
		}
	}
	
	//최적 쿠폰 시뮬레이션 기능 - 결제 쿠폰 적용 
	//고객이 보유한 쿠폰들을 조합하여 최대 할인이 가능한 쿠폰을 자동 선택해주는 기능 
	var apprUnitVal = $("#selectCoupon option:selected").attr("unitVal");
	var apprCpGbn 	= $("#selectCoupon option:selected").attr("unitCd");	//쿠폰 할인 구분 :  원 / 퍼센트
	var apprTotFee 	= Number($("#totSaleFee").attr("val"));				//전체 금액
	var apprCpfee 	= $("#selectCoupon option:selected").attr("unitval");	//쿠폰 가격
	var apprCpnNo   = $("#selectCoupon option:selected").val();
	if(apprCpGbn == "per") {
		apprCpfee = apprTotFee * Number(apprCpfee);
		apprCpfee = Math.floor(apprCpfee/100) * 100;  
	}
	
	if(apprCpnNo != "") {
		if($("#couponTxt01").attr("cpCd") == "") {

			$("#couponTxt01").attr("cpCd" , apprCpnNo);
			$("#couponTxt01").attr("cpVal" , apprCpfee);
			$("#couponTxt01").text($("#selectCoupon option:selected").text());
			$("#couponTxt01").show();
			$("#couponTxtDel01").attr("cpVal" , apprCpfee);
			$("#couponTxtDel01").show();
			$("#paymentCoupon").show();
			$('#selectCoupon option:eq(0)').attr("disabled" , true);
		}
	}
	
	//옵션 가격 재설정
	var optDataList = [];
	<c:forEach items="${optList}" var="opt">
		optDataList.push({
			 optAmt    : "${opt.optAmt}"	
			,cntCdNm   : "${opt.cntCdNm}"	
			,optCo     : "${opt.optCo}"	
			,optPlcNo  : "${opt.optPlcNo}"	
			,optPlcNm  : "${opt.optPlcNm}"	
		});
    </c:forEach>
   
    optInfoHtml(optDataList);
   
    
	var optTotAmt  = 0;   //옵션 전체 금액
    var optAmt     = "";  //옵션 별 금액 
    var optCo      = "";  //옵션 사용 수량 ( 0 : 사용안함 , 1 : 사용함.)
    var optPlcNo   = "";  //옵션 정책번호 
    var optPlcNm   = "";  //옵션 정책명 
    var delemeter = "@";
    
	$.each($(".optRadio") , function(i , obj){
		var cnt = (i+1);
		var plcNo      = $(':input[name="o2oPlcNo_'+(cnt)+'"]').val();      //옵션정책번호
		var optPchsPrc = $(':input[name="o2oOptPchsPrc_'+(cnt)+'"]').val(); //옵션가격
		var plcNm   = $(':input[name="o2oPlcNm_'+(cnt)+'"]').val(); //옵션명
		var optCnt     = 1;
		
		
		
		$.each(optDataList, function(idx, optData) {
			if(optData.optPlcNo == plcNo){
				$('#radioOpta_'+(cnt)+'').prop("checked","checked");
				optTotAmt += Number(optPchsPrc);
			}
		});
		var checkYn = $(':radio[name="o2oOptRadio_'+(cnt)+'"]:checked').val();
		console.log(checkYn);
		if($(".optRadio").length == i){
			delemeter ="";
		}
		optCo     += ((checkYn == "Y") ? "1" : "0") + delemeter
		optAmt    += (optPchsPrc).toString() + delemeter;
		optPlcNo  += plcNo + delemeter;
		optPlcNm  += plcNm + delemeter;
	});
	
	$("#optTotAmt").val(optTotAmt);
	$("#optAmt").val(optAmt);
	$("#optCo").val(optCo);
	$("#optPlcNo").val(optPlcNo);
	$("#optPlcNm").val(optPlcNm);
	
	$(".optTb").show();
	$("#optDiv").show();
	
	var serverMode = $("#serverMode").val();
	console.log('serverMode ::', serverMode);
	if(serverMode == "prd"){ //운영이면
		//$("#optDiv").hide();
		//$(".optTb").hide();
		// 연동 검수 위한 스크립트 Start
		/*
		$("#payment04").hide();
		$('label[for="payment04"]').hide();
		var extIDList = ['bassue2','nyh2008','v10135005','bush06301','Sd70fc34e','S6fc21d70','S3c59e242','Sfa41c663','S1aee5a12']
		if(jQuery.inArray("${userVo.custId}", extIDList)>0){
			$("#payment04").show();
			$('label[for="payment04"]').show();
		}
		*/
		// 연동 검수 위한 스크립트 End
	} else {
		$("#payment04").show();
		$('label[for="payment04"]').show();
	}  
}


//주문확인 옵션 가격 설정 
var optInfoHtml = function(optDataList){
	
	var optHtml = "";
	var optTotAmt = 0;
	$.each(optDataList, function(idx, optData) {
	 optHtml +="<dl class='layout-r'>" 
		       +"<dt>"+optData.optPlcNm+"</dt>"
	           +"<dd>"+NumUtil.setComma(optData.optAmt) +" 원</dd>"
	           /* +"<dd>"+optData.cntCdNm+"</dd>" */
	           +"</dl>";
	 optTotAmt += Number(optData.optAmt); 
	});
	 
    //주문확인 창 금액 설정 
     fnCalcOrderAmt(optTotAmt);
    
    if(optDataList.length > 0 ){
    	$("#optDiv").attr("class","proInfo");
    }
     //class="proInfo"
    $("#optDiv").text("");
    $("#optDiv").append(optHtml);
}

//주문확인 창 금액 설정 
var fnCalcOrderAmt = function(optTotAmt){
	
	var totBassSaleFee    = $("#orgTotSaleAmtTxt").attr("val") == "" ? "0" : $("#orgTotSaleAmtTxt").attr("val");
	var pdOrdAmt = 0;      //상품별 구매금액
	var paymentCouponArea = $("#paymentCouponArea").text() == "" ? 0 : NumUtil.rmComma($("#paymentCouponArea").text());
	var itemQty           = 0;
	var totSaleAmt = 0;   //최종 결제 금액
	var prdCouponAmt = 0; //상품할인 
	var couponAmt = 0;    //결제할인 
	var pakAmt = 0;       //패키지 할인 금액
	
	$.each($("input[name=pdOrdAmt]") , function (idx, ordObj){
		var prdCpnAmt = 0;  
		var cpnAmt    = 0; 
		pdOrdAmt      = $(ordObj).val(); // 패키지 할인 금액 적용된 금액
		itemQty       = Number($("#ordNoCnt"+idx).text());
		pakAmt        = Number($("input[name=pakAmt]")[idx].value);
		
		//console.log("상품 별 금액  pdOrdAmt = "+pdOrdAmt)	
		
		//상품 쿠폰 정보 
		$.each($("select[name^='ordCoupun']").find("option:selected") , function(i , obj){
			var unitcd    = $(obj).attr("unitcd");
			var unitval   = $(obj).attr("unitval");
			
			var pdCpnIdx = $($("select[name^='ordCoupun']").find("option:selected")[i]).attr("pdCpnIdx");

			// 상품에 해당 하는 쿠폰만 적용한다.
			if(idx == pdCpnIdx){
				if(unitcd != "0"){
					if(unitcd == "per"){
						//prdCpnAmt +=  Math.ceil(Number(pdOrdAmt) * Number(unitval)/100)*100;
						cpnAmt = Number(pdOrdAmt) * Number(unitval)/100 ;
						cpnAmt = Math.ceil( cpnAmt * itemQty)*100
					}else{
						//prdCpnAmt +=  Number(unitval);
						cpnAmt =  Number(unitval);
					}
					prdCpnAmt += cpnAmt;
					$($("select[name^='ordCoupun']").find("option:selected")[i]).attr("cpAmt" , prdCpnAmt);
					$($("select[name^='ordCoupun']")[i]).attr("cpAmt" , prdCpnAmt);
				}
			}
			//console.log("상품 별 쿠폰 금액  prdCpnAmt = "+prdCpnAmt)					
		});
		prdCouponAmt += prdCpnAmt;
		totSaleAmt   += Number(pdOrdAmt*itemQty) - Number(prdCpnAmt) - pakAmt;
	});
	totSaleAmt += Number(optTotAmt);
	//결제 쿠폰  정보 
	var unitVal = $("#selectCoupon option:selected").attr("unitVal");
	var cpGbn 	= $("#selectCoupon option:selected").attr("unitCd");	//쿠폰 할인 구분 :  원 / 퍼센트
	if(!ValidUtil.isEmpty(unitVal)){
		if( cpGbn == "per"){
			couponAmt = Math.floor(totSaleAmt * Number(unitVal)/100)*100;
		}else {
			couponAmt = Number(unitVal);
		}
	}
	totSaleAmt = totSaleAmt - couponAmt;
 
	//쿠폰할인
	$("#paymentCouponArea").text(NumUtil.setComma(prdCouponAmt+couponAmt));
	
	//추가할인쿠폰 선택값
	$("#couponTxt01").attr("cpVal" , couponAmt);
	$("#couponTxtDel01").attr("cpVal" , couponAmt);
	
	//최종결제예정금액
	$("#totSaleFee").attr("val", totSaleAmt);
    $("#totSaleFee").text((NumUtil.setComma(totSaleAmt)).toString());
    
    sessionStorage.setItem("totSaleFee", $("#totSaleFee").attr("val"));
    sessionStorage.setItem("ttPkgAmt", $("#ttPkgAmt").attr("val"));
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

function getScheduleValue() {
	var mountCd = $("input[name='mounting']:checked").val();
	var timeInfo = $("#amArea span.on, #pmArea span.on").attr("schedule");
	
	$("#tmsSchduleStr").val(timeInfo);//선택한 시간의 스케줄 정보 서버에서 parsing 함.
	
	if(mountCd == "20") {
		$("#centerSchduleStr").val($("#amArea span.on, #pmArea span.on").attr("centerSchedule"));
	}
}

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
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
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDiv");
            	} else {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDivPopup");
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
            mapDraw(result.rtnList[0].posY , result.rtnList[0].posX, result.rtnList[0].agencyNm , positions, "mapDivPopup");

            getRentStore(result.rtnList[0].posX,result.rtnList[0].posY);

            $("#modal-Shop").removeClass("md-show");
			$("#modalAgencyDetl").addClass("md-show");
		}
	}
}

function fn_popupClose(pId) {
	$("#"+pId).removeClass("md-show");
	$("#modal-Shop").addClass("md-show");
	fnMove("junmun");
}

/* 길찾기 */
function goFind(agencyNm, posX, posY){
	window.open("http://map.daum.net/link/to/"+agencyNm+","+posX+","+posY);
}

/* 차량번호 validation */
function validationCarNo(){
	//차량번호가 값이 들어있을때만 체크한다.
	if(!ValidUtil.isEmpty($("#carNoTxt").val())) {
		//차량번호 패턴
		var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 12저3456
		var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
		var pattern3       	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 123저3456
	    	
	   	// 차량번호
		var carNoVal 		= $("#carNoTxt").val();
		// 차량번호 길이
		var carNoValLen 	= carNoVal.length;
		
		// 차량번호 확인 - [8자리]
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
		if(mountCheck1 == "P1") {
			pickUpAddr = addr.split(" ");
			dlvyAddr = $("#iplAddr").val().split(" ");
		}
		//딜리버리 선택시
		else if(mountCheck1 == "P2"){
			pickUpAddr = $("#pickupBassAddr").val().split(" ");
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
	init();
	
    sessionStorage.setItem("totSaleFee", $("#totSaleFee").attr("val"));
    sessionStorage.setItem("ttPkgAmt", $("#ttPkgAmt").attr("val"));
    
    var custId = "${issCertVo.custId}";
    var custGradCd = "${issCertVo.custGradCd}";
    var ordQyLmt = "${issCertVo.ordQyLmt}";
    var ordUseQy = "${issCertVo.ordUseQy}";
    var cntCdNm = "${ordList.get(0).cntCdNm}";
    
     if(custId != "" && custGradCd != ""){
	  	 if(Number(ordQyLmt) > 0){ //제한수량이 0이면 무제한 주문가능이다
			if(Number(ordQyLmt) < Number(ordUseQy) + Number(cntCdNm)){
			
				ComUtil.alert("회원님의 제휴코드 제한수량은 "+ordQyLmt+"개 입니다.\n지금까지 주문하신 수량은 총 "+ordUseQy+"개 입니다.\n주문수량이 초과 되었습니다.","","",function(){
					history.go(-1);
				});
			  	
				return false;
			}
	  	 }
     }
    
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg order-write'></div>");
	/* page background image End */
	
	//page
	$("#pageNo").val("1");
	
	//달력 한글화
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
	
// 	var itemCntArr = new Array();
// 	var totQty = 0;
// 	$("ul[name='ordNoSn']").each(function(idx){
// 		totQty += Number($("#ordNoCnt"+idx).text());
// 	});
	
// 	if(totQty >= 4) {
// 		$("#noPickUpAlign").show();
// 	} else {
// 		$("#noPickUpAlign").hide();
// 	}

	//얼라인먼트
	fu_alignShowCtl("init");
    
	//장착 서비스 변경 시
    $("input[name='mounting']").on("click" , function(){
    	//얼라인먼트
    	fu_alignShowCtl("show");
    	
    	//내용초기화
    	initDetailInfo();
    	
    	mountCheck = $(this).val();
    	//datepicker 이미지 지우기
    	$('#datepicker11').datepicker("destroy");
    	
    	//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });

    //배송유형세부 변경시 장착일자,시간 초기화
    $("input[name='drvThCd']").on("click" , function(){
    	
    	fu_alignShowCtl("show");
    	
    	//장착 희망일 초기화
		$("#datepicker11").val("");
		$("input[name='timeRd']").prop('checked', false);
		
		//장착 희망시간 초기화
		$("#amArea").hide();
		$("#pmArea").hide();
    	
    	//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });	    
	
	
  	//장착점
    $("div[name='selectAddr']").on("click" , function(){
    	mountCheck1 = $(this).attr("val");    	
    });
  	
    /* 추가할인이 없을 경우에는 보여지지 않게 하고, 쿠폰할인이 있으면 금액 보여주기*/
  	if($('#ordCoupun2 option').length < 2) {
  		$("#selCpn2").css("display","none");
  	} 
  	
  	$("#paymentCoupon").show();
  	
  	var cpVal = $("#paymentCoupon").text().replace(/[^0-9]/g,'');
  	
  	if(Number(cpVal) == 0) {
  		$("#paymentCoupon").hide();
  	}

  	//상품 별로 개별 1, 2 단계 적용
  	//상품 쿠폰 적용 완료 이후 금액에 결제 쿠폰 적용
    //상품 쿠폰 선택
    var preCpCdLvl = "";
   	$("select[name^='ordCoupun']").on("change" , function(){
   		var obj = $(this);
   		var value = obj.val();								//현재 선택 된 셀렉트 값
		var cpnLvlCd = obj.find('option:selected').attr("cpnLvlCd");
   		var cpNm 	= obj.find('option:selected').attr("cpNm");
		var cpAmt 	= obj.find('option:selected').attr("unitVal");
		var cpGbn 	= obj.find('option:selected').attr("unitCd");	//쿠폰 할인 구분 :  원 / 퍼센트

		if(value == "0" ) {
			$(this).attr("cpAmt" , "0");
			//return;
		}

		//카테고리 상품만 주문 안됨
		if(cpnLvlCd == "1") {
			console.log($(this).parents("dd").parents("dl").siblings("dl").children("dd").children("select").val())
			if($(this).parents("dd").parents("dl").siblings("dl").children("dd").children("select").val() != "0" && value =="0") {
				//alert("상품 할인 쿠폰을 선택 해 주세요.");
				$(this).val("0");
				$(this).parents("dd").parents("dl").siblings("dl").children("dd").children("select").val("0");
				console.log("상품 할인 쿠폰을 선택 해 주세요.");
			}
			
			//length 체크를 안하는 이유 : 상품쿠폰이 화면에서 보였다면 그린져쿠폰도 그려졌지만 화면에서 안보이게 해놨을 뿐이기 때문.
			if($("select[name='ordCoupun3_1']").val() != "0") {
				ComUtil.alert("특별할인 쿠폰과 중복 사용이 불가합니다.");
				$(this).val("0");
				$(this).parents("dd").parents("dl").siblings("dl").children("dd").children("select").val("0");
				$("select[name='ordCoupun3_1']").val("0");
			}
		}

		//카테고리 상품만 주문 안됨
		if(cpnLvlCd == "2") {
			console.log($(this).parents("dd").parents("dl").siblings("dl").children("dd").children("select").val())
			if($(this).parents("dd").parents("dl").siblings("dl").children("dd").children("select").val() == "0") {
				ComUtil.alert("상품 할인 쿠폰을 선택 해 주세요.");
				$(this).val("0");
			}
		}
		
		//이벤트 상품 클릭시 상품할인, 추가할인 선택 불가.
		if(cpnLvlCd == "3") {
			//length 체크 필요. 화면에서 그릴수도 , 안그릴수도 있기 때문. ex) ordCoupun1_2 내용
			//1번 아이템 상품할인쿠폰
			if($("select[name='ordCoupun1_1']").length > 0) {
				if($("select[name='ordCoupun1_1']").val() != "0") {
					ComUtil.alert("다른 쿠폰과 중복 사용이 불가합니다.");
					$(this).val("0");
					$("select[name='ordCoupun1_1']").val("0");
					$("select[name='ordCoupun2_1']").val("0");
					$("select[name='ordCoupun3_1']").val("0");
				}
			}
			
   			//2번 아이템 상품할인쿠폰
			if($("select[name='ordCoupun1_2']").length > 0) {
				if($("select[name='ordCoupun1_2']").val() != "0") {
					ComUtil.alert("다른 쿠폰과 중복 사용이 불가합니다.");
					$(this).val("0");
					$("select[name='ordCoupun1_2']").val("0");
					$("select[name='ordCoupun2_2']").val("0");
					$("select[name='ordCoupun3_1']").val("0");
				}
			}
			
			//추가할인쿠폰
			if($("#selectCoupon").length > 0) {
				if(!ValidUtil.isEmpty($("#selectCoupon").val())) {
					ComUtil.alert("다른 쿠폰과 중복 사용이 불가합니다.");
					//$("#selectCoupon").val("0");
					$("#couponTxtDel01").click();
				}
			}
		}

		//쿠폰 중복 사용 체크
		var duCnt = 0;
		$("select[name^='ordCoupun']").each(function(){
			if(value == $(this).val() &&  $(this).val() != "0") {
				duCnt = duCnt + 1;
				if(duCnt > 1) {
					//alert("사용 중인 쿠폰 입니다.");
					console.log("사용 중인 쿠폰 입니다.");
					obj.val("0");
					return;
				}
			}
		});


		//상품 쿠폰 적용
		//이전 화면 > 상품 상세
		//이전 화면이 상품 상세인 경우 상품 쿠폰 값 세팅
		//상품 쿠폰 적용
		var fixAmt = Number($("#orgTotSaleAmtTxt").attr("val")); //전시가
		var ttPkgAmt = $("#ttPkgAmt").attr("val");
		
		if(ttPkgAmt == '' || ttPkgAmt == 'undefined' || typeof ttPkgAmt == 'undefined'){
			ttPkgAmt = 0;
		}
		
		//우선 패키지 가격 먼저 빼고 시작한다.
		fixAmt = fixAmt - ttPkgAmt;		
		
		var fixCpAmt = 0;	//쿠폰 금액
		var prCpnDcAmt = 0;
		$("ul[name='ordNoSn']").each(function(){
			var compareStr = $(this).attr("dpPrNo")+"_"+$(this).attr("itemCd");
			var orgAmt = Number($(this).attr("price"));		//상품 개당 가격
			var itemCnt = Number($(this).attr("itemCnt"));	//상품 주문 수량
			var tot = 0;

			$("select[name^='ordCoupun']").each(function(idx2){
				if($(this).val() != "0") {
					var cpKeyStr = $(this).find('option:selected').attr("dpPrNo")+"_"+$(this).find('option:selected').attr("itemCd");
					if(compareStr == cpKeyStr) {
						var amtGbn = $(this).find('option:selected').attr("unitCd");
						var amtWon = Number($(this).find('option:selected').attr("unitVal"));
						if(amtGbn == "per") {
							amtWon = Number(orgAmt) * Number(amtWon);
							//amtWon = Math.ceil(amtWon/100) * 100;
						}

						if(orgAmt < amtWon) {
							alert("할인 금액이 결제 금액보다 큽니다.");
							obj.val("0");
							return;
						}

						console.log(orgAmt+"-"+ amtWon + "= "+(orgAmt - amtWon) + " /  fixCpAmt  : " + (fixCpAmt + amtWon));


						//orgAmt = orgAmt - amtWon;		//쿠폰 적용 금액
						tot = tot + amtWon;	//적용 된 쿠폰 총 금액

						$(this).attr("cpAmt" , tot);

					}
				}
			});

			tot = Math.ceil(tot/100) * 100;
			orgAmt = orgAmt - tot;//상품 개당 가격이 변경됨.
			tot = tot * itemCnt;		//적용 된 쿠폰 총 금액
			fixCpAmt = fixCpAmt + tot

		});


		//console.log("fixCpAmt >>> " + fixCpAmt)
		//console.log("fixAmt >>> " + fixAmt)

		fixAmt = fixAmt - fixCpAmt;

		//결제 쿠폰 적용
		var selectCouponPayment = "${fn:length(selectCouponPayment)}";
		var payCoupon = 0;
		if(selectCouponPayment > 0){
			payCoupon = calcTestAmt(fixAmt);
			if(fixAmt - payCoupon < 0) {
				//ComUtil.alert("할인 금액이 결제 금액보다 큽니다.");
				alert("쿠폰을 적용 할 수 없습니다.");
				$("select[name^='ordCoupun']").val("0");

				return;
			}
		}

		//이전 화면이 상품 상세인 경우 상품 쿠폰 값 세팅
		if($("#pageGbn").val() == "D") {
			if($("select[name='ordCoupun1_1']").val() != "0") 
				$("#prCpnNo1").val($("select[name='ordCoupun1_1']").val());
			else
				$("#prCpnNo1").val("");
			
			if($("select[name='ordCoupun2_1']").val() != "0")
				$("#prCpnNo2").val($("select[name='ordCoupun2_1']").val());
			else
				$("#prCpnNo2").val("");
			$("#prCpnDcAmt").val(fixCpAmt);
		}
		
		
		var optTotAmt = Number($("#optTotAmt").val());
		//주문확인 창 금액 설정 
		fnCalcOrderAmt(optTotAmt);
		$("#paymentCoupon").show();

		/*
		$("#paymentCouponArea").text(NumUtil.setComma(fixCpAmt+payCoupon));
		$("#totSaleFee").attr("val" , (fixAmt-payCoupon));
		$("#totSaleFee").text(NumUtil.setComma(fixAmt-payCoupon));
		$("#paymentCoupon").show();
        */

		//적용 된 쿠폰 없으면 쿠폰 영역 삭제
		if($("#sumTotSaleFee").val() == $("#totSaleFee").attr("val")) {
			$("#paymentCoupon").hide();
		}
    });

	//결제 쿠폰 변경 시
	$("#selectCoupon").on("change" , function(){
		/* if($("#couponTxt01").is(":visible")) {
			return;
		} */
		if($("#couponTxt01").attr("cpCd") == $(this).val()) {
			//ComUtil.alert("같은 쿠폰은 사용 할 수 없습니다.");
			alert("이미 사용 중인 쿠폰 입니다.");
			return;
		}
		
		if($("select[name='ordCoupun3_1']").length > 0) {
			if($("select[name='ordCoupun3_1']").val() != "0") {
				$("#selectCoupon").val("");
				ComUtil.alert("특별할인 쿠폰과 중복 사용이 불가합니다.");
				return;
			}
		}

		var unitVal = $("#selectCoupon option:selected").attr("unitVal");
		var cpGbn 	= $("#selectCoupon option:selected").attr("unitCd");	//쿠폰 할인 구분 :  원 / 퍼센트
		var totFee 	= Number($("#totSaleFee").attr("val"));				//전체 금액
		var cpfee 	= $("#selectCoupon option:selected").attr("unitval");	//쿠폰 가격
		if(cpGbn == "per") {
			cpfee = totFee * Number(cpfee);
            cpfee = Math.floor(cpfee/100) * 100;
		}

		if($(this).val() != "") {
			if($("#couponTxt01").attr("cpCd") == "") {

				if(Number(totFee - cpfee) < 0) {
					$(this).val(0);
					alert("쿠폰을 적용 할 수 없습니다.");
					return;
				}

				$("#couponTxt01").attr("cpCd" , $(this).val());
				$("#couponTxt01").attr("cpVal" , cpfee);
				$("#couponTxt01").text($("#selectCoupon option:selected").text());
				$("#couponTxt01").show();
				$("#couponTxtDel01").attr("cpVal" , cpfee);
				$("#couponTxtDel01").show();

				/*
				var paymentCouponArea = $("#paymentCouponArea").text() == "" ? 0 : NumUtil.rmComma($("#paymentCouponArea").text());

				$("#paymentCouponArea").text(NumUtil.setComma(Number(paymentCouponArea) + Number(cpfee)));
				$("#totSaleFee").attr("val" , (totFee - cpfee));
				$("#totSaleFee").text(NumUtil.setComma(totFee - cpfee));
			   */
			   
				var optTotAmt = $("#optTotAmt").val();
				//주문확인 창 금액 설정 
				fnCalcOrderAmt(optTotAmt);
				
				$("#paymentCoupon").show();
				$('#selectCoupon option:eq(0)').attr("disabled" , true);
			}
		}

		//적용 된 쿠폰 없으면 쿠폰 영역 삭제
		if($("#sumTotSaleFee").val() == $("#totSaleFee").attr("val")) {
			$("#paymentCoupon").hide();
		}
	});

	//결제 쿠폰 삭제 시
	$("#couponTxtDel01").on("click" , function(){
		var totFee = Number($("#totSaleFee").attr("val"));				//전체 금액
		var cpfee  = $(this).attr("cpVal");	//쿠폰 가격

		if($(this).attr("id") == "couponTxtDel01") {
			$("#couponTxt01").attr("cpCd" , "");
			$("#couponTxt01").attr("cpVal" , "");
			$("#couponTxt01").text("");
			$("#couponTxt01").hide();
			$("#couponTxtDel01").attr("cpVal" , "");
			$("#couponTxtDel01").hide();

			$("#paymentCouponArea").text(NumUtil.setComma(Number(NumUtil.rmComma($("#paymentCouponArea").text())) - Number(cpfee)));
			$("#totSaleFee").attr("val" , (Number(totFee) + Number(cpfee)));
			$("#totSaleFee").text(NumUtil.setComma((Number(totFee) + Number(cpfee))));
		}

		//빈값 선택
		$("#selectCoupon").val("").prop("selected", true);

		var optTotAmt = $("#optTotAmt").val();
		//주문확인 창 금액 설정 
		fnCalcOrderAmt(optTotAmt);
		
		//적용 된 쿠폰 없으면 쿠폰 영역 삭제
		if($("#sumTotSaleFee").val() == $("#totSaleFee").attr("val")) {
			$("#paymentCoupon").hide();
		}
		$('#selectCoupon option:eq(0)').attr("disabled" , false);
	});

	//참고 메세지
	$("#etcMsg").on("click", function(){
		if($(this).val() == "03") {
			$("#etcMsgTxt").show();
		} else {
			$("#etcMsgTxt").hide();
		}

	});

	//주문하기 버튼 클릭 시 - modal-1 레이어 팝업 호출
	$("#btnOrder").on("click" , function(){
	
		event.preventDefault();
		
		if(Number( $("#totSaleFee").attr("val")) < 1) {
        	ComUtil.alert("결제 하실 수 없는 금액입니다.");
        	return;
        }
		
		var issCertCd = "${issCertVo.issCertCd}";
        
        if(issCertCd != null && issCertCd != '') {
        	if($("#selectCoupon option:selected").val() != null && $("#selectCoupon option:selected").val() != '') {
        		ComUtil.alert("제휴 혜택 고객님은 쿠폰 사용이 불가하여 자동 적용된 쿠폰이 해제되었습니다.");
        		$("#couponTxtDel01").click();
	        	return;
        	}
        }
        
		if(!validation()) {
			return;
		}
		
		if(chkVersion()) {
			ComUtil.confirm("주문 하시겠습니까?", '' , function(){
				ComUtil.loading();
				
				//최종가격 재확인 2020-01-30
				//최종가격 재확인 2020-01-30
				var ttsalefee = $("#totSaleFee").attr("val");
				var finaltotSaleFee = sessionStorage.getItem("totSaleFee");
				//console.log("ttsessionsalefee   : "+ttsessionsalefee);
				//console.log("ttsalefee   : "+ttsalefee);
				if(finaltotSaleFee != ttsalefee){
				    // 주석 처리  2020-08-21 갸격 재계산으로 로직 주석 처리  
					$("#totSaleFee").attr("val" , finaltotSaleFee);
				}
				
				var purchasePrice = $("#totSaleFee").attr("val");
				ex2cts.push('purchase', {value:parseInt(purchasePrice)});
				
    			//재고 체크
    			//itemCd및 수량
    			var itemCdArr = new Array();
    			var itemCntArr = new Array();
    			var totPkgAmt = "0";
    			
    			var orderList = "${ordList}";
    			$("ul[name='ordNoSn']").each(function(idx){
    				itemCdArr.push($(this).attr("itemcd"));
    				itemCntArr.push($("#ordNoCnt"+idx).text());
    			});
    			$("#itemCdArr").val(itemCdArr);
    			$("#itemCntArr").val(itemCntArr);
				
    			//전후륜 오더 상세 정보 
				var purOrdInfo = {};
				var purOrdList = [];
				var orderList = "${ordList}";
				var orderCnt = 0;
				
				<c:forEach items="${ordList}" var="order">
					var dpSaleAmt    = Number("${order.saleFee}");        //전시 판매 금액
				    var prCpnDcAmt = 0;                                 //상품 쿠폰 할인 금액
				    var pkgDcAmt   = Number("${order.pakAmt}");         //패키지 할인 금액
				    var cntCdNm    = Number("${order.cntCdNm}");        //주문 수량   
				    var saleAmt    = (dpSaleAmt) ; //판매 금액
				    var salePrcPlcNo = "${order.salePrcPlcNo}";          
				    var prcPlcNo   = "${order.prcPlcNo}";
				    var plcNo      = ValidUtil.isEmpty(salePrcPlcNo) ? prcPlcNo : salePrcPlcNo;
					var dpPrNo     = "${order.dpPrNo}";
					var itemCd     = "${order.itemCd}";
					var ordAmt     = 0;            //주문 금액
				
					var cpnNo1     = "";
					var cpnNo2     = "";
					var couponAmt  = 0;
	 
					$.each($("select[name^='ordCoupun']").find("option:selected") , function(i , obj){
						var unitCd    = $(obj).attr("unitCd");
						var unitVal   = $(obj).attr("unitVal");
						
						var cpnLvlCd    = $($("select[name^='ordCoupun']").find("option:selected")[i]).attr("cpnLvlCd");
						var cpnDpPrNo   = $($("select[name^='ordCoupun']").find("option:selected")[i]).attr("dpPrNo");
						var cpCd        = $($("select[name^='ordCoupun']").find("option:selected")[i]).attr("cpCd");
						var cpItemCd    = $($("select[name^='ordCoupun']").find("option:selected")[i]).attr("itemCd");
						
						// 상품에 해당 하는 쿠폰만 적용한다.
						if(dpPrNo == cpnDpPrNo && itemCd == cpItemCd){
							if(unitCd != "0"){
								 if(cpnLvlCd == "1"){
									 cpnNo1 = cpCd;
								 }else if(cpnLvlCd == "2"){
									 cpnNo2 = cpCd;
								 }
							}
							if(!ValidUtil.isEmpty(unitVal)){
								if( unitCd == "per"){
									couponAmt  = Number(saleAmt) * Number(unitVal)/100 ;
									couponAmt = Math.ceil( couponAmt * cntCdNm)*100
								}else {
									couponAmt = Number(unitVal);
								}
								prCpnDcAmt +=couponAmt;
							}
						}
						//console.log("상품 별 쿠폰 금액  prdCpnAmt = "+prdCpnAmt)					
					});
					
					saleAmt = saleAmt- (prCpnDcAmt/cntCdNm) ;        //판매 금액
					ordAmt  = (saleAmt * cntCdNm) - pkgDcAmt;         //주문 금액
					
					purOrdList.push({
						  ordNoSn      : ++orderCnt
						 ,itemCd       : itemCd                    //품목 코드
						 ,itemNm       : "${order.itemNm}"         //품목 명
						 ,cntCdNm      : cntCdNm.toString()        //주문 수량
						 ,dpPrNo       : dpPrNo                    //전시 상품 번호 
						 ,salePrcPlcNo : plcNo                     //판매 가격 정책 번호
						 ,bassSaleAmt  : "${order.bassSaleFee}"    //기본 판매 금액
						 ,dpSaleAmt    : dpSaleAmt.toString()      //전시 판매 금액
						 ,pkgDcAmt     : pkgDcAmt.toString()       //패키지 할인 금액
						 ,stmemSaleAmt : "${order.stmemSaleAmt}" 
						 ,prCpnNo1     : cpnNo1                    //상품 쿠폰 번호1 
						 ,prCpnNo2     : cpnNo2                    //상품 쿠폰 번호2 
						 ,prCpnDcAmt   : prCpnDcAmt.toString()     //상품 쿠폰 할인 금액
						 ,bfchgSaleAmt : saleAmt.toString()        //변경전 판매 금액
						 ,saleAmt      : saleAmt.toString()        //판매 금액
						 ,ordAmt       : ordAmt.toString()         //주문 금액
						 ,accuPoint    : "${order.accuPoint}"      //포인트 적립률
					})
				</c:forEach>
				$("#orderDtlInfo").val(JSON.stringify(purOrdList));
				
				//주문자
    			$("#custNm").val($("#orderNmTxt").val());
    			//주문자 전화 번호
    			$("#mobNo").val($("#phone01").val()+""+$("#phone02").val()+$("#phone03").val());
    	
    			var mountCd = $("input[name='mounting']:checked").val();
//     			var drvThCd = $("input[name='drvThCd']:checked").val();	//[드라이브스루 2021-02-08] 배송상세유형 추가
				var drvThCd = "";	//[드라이브스루 2021-02-08] 배송상세유형 추가
				if($("#drvBayCo").val() > 0){
					drvThCd = $("input[name='drvThCd']:checked").val();						
				}    			
    			var mountDt = $("#datepicker11").val().replace(/-/gi, "");
				//var mountTime = $("#mountTime").val().replace(/[^0-9]/g,"")+"00";
				var mountTime = $("#amArea span.on, #pmArea span.on").text().replace(":","")+"00";
				
				if(mountCd != "40") {
					getScheduleValue();
				}
				$("#alignYn").val($("input[name='alignRd']:checked").val());
    			
    			//장착서비스 구분
    			$("#mountCd").val(mountCd);
				//배송유형구분 (드라이브스루)
				$("#drvThCd").val(drvThCd);    			
    			//장착 희망일시
    			$("#istReqDe").val(mountDt);
    			//장착 희망시간
    			$("#istDueDe").val(mountTime);
    			
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
    			
    			//참고메세지
    			$("input[name='etcMsg']").val("");
    			if($("#etcMsg").val() == "03"){
    				$("#custReqCn").val($("#etcMsgTxt").val());
    			} else {
    				if($("#etcMsg").val() != "01") {
    					$("#custReqCn").val($("#etcMsg").find('option:selected').text());
    				}
    			}
    			
    			//차량번호
    			$("#carNo").val($("#carNoTxt").val())
    	
    			// 결제 구분 : 카드(C) , 계좌(B), 카카오(K)
    			$("#payGbn").val($("input[name='payment']:checked").val());
    	
    			if($("#accuPoint").val() == "") {
    				$("#accuPoint").val("0")
    			}
    			
    			var selectCouponPayment = "${fn:length(selectCouponPayment)}";
    			if(selectCouponPayment > 0){
    				//결제 쿠폰 번호
    				$("#setlStsCd").val($("#couponTxt01").attr("cpcd"));
    				//결제 쿠폰 금액
    				$("#setlCpnDcAmt").val($("#couponTxt01").attr("cpval") == "" ? "0" : $("#couponTxt01").attr("cpval"));
    			} else {
    				$("#setlStsCd").val("");
    				$("#setlCpnDcAmt").val("0");
    			}
    			
    			//결제 수단
    	   		var payGbn = $("input[name='payment']:checked").val();
    	   		//원가
    			$("input[name='totBaseFee']").val($("#totBaseAmtTxt").attr("val"));
    			//전시가
    			$("input[name='orgTotSaleFee']").val($("#orgTotSaleAmtTxt").attr("val"));
			
    			//상품 쿠폰 합계
    			var paymentCouponArea = $("#paymentCouponArea").text() == "" ? 0 : NumUtil.rmComma($("#paymentCouponArea").text());
    			var payCpFee = $("#couponTxt01").attr("cpVal");	//결제 쿠폰
    			if(ValidUtil.isEmpty(payCpFee)) {
    				payCpFee = 0
    			}
    			paymentCouponArea = paymentCouponArea - payCpFee;
    			
    			$("#prCpnDcAmt").val(paymentCouponArea);
    	    	
    			if($("select[name='ordCoupun1_1']").val() != "0") {
    				$("#prDetailCpnDcAmt").val($("select[name='ordCoupun1_1']").attr("cpamt"));
    			}
    			if($("select[name='ordCoupun2_1']").val() != "0") {
    				$("#prDetailCpnDcAmt").val($("select[name='ordCoupun2_1']").attr("cpamt"));
    			}
    			if($("select[name='ordCoupun3_1']").val() != "0") {
					$("#prDetailCpnDcAmt").val($("select[name='ordCoupun3_1']").attr("cpamt"));
				}
    			
    			//결제 금액
    			$("#ordAmt").val($("#totSaleFee").attr("val"));
    	
    			//장바구니
    			if($("#pageGbn").val() != "D") {
    				var form = $("#frm");
    				$("ul[name='ordNoSn']").each(function(idx, item){
    					var input = $("<input type='hidden' value='"+$(this).attr("cartNo")+"' id='cartNo"+idx+"' name='cartNoArr'>");
    					form.append(input);
    				});
    	
    				//장바구니용 상품 쿠폰 여러 쿠폰 건 사용 시...
    				var form = $("#frm");
    				$("input[name='couponInfoArr']").remove();
    				$("select[name^='ordCoupun']").each(function(idx, item){
    					if(!ValidUtil.isEmpty($(this).find('option:selected').attr("dpPrNo"))) {
	    					var dpPrNo 		= $(this).find('option:selected').attr("dpPrNo");
	    					var itemCd 		= $(this).find('option:selected').attr("itemCd");
	    					var unitcd 		= $(this).find('option:selected').attr("unitCd");
	    					var unitval 	= $(this).find('option:selected').attr("unitVal");
	    					var cpAmt 		= $(this).attr("cpAmt");
	    					var param		= $(this).val()+"@"+dpPrNo+"@"+itemCd+'@'+unitcd+'@'+unitval+"@"+cpAmt;
	    					input = $("<input type='hidden' value='"+param+"' id='couponInfoArr"+idx+"' name='couponInfoArr'>");
	    	
	    					form.append(input);
    					}
    				});
    			}
    			
    		
    			$.ajax({
    			    url: "/order/selectOrdNo",
    			    type: "POST",
    			    cache:false,
    			    processData: false,
    			    data: $("#frm").serialize(),
    			    success: function(data) {
    			    	if(data.rtnCode != "-1") {
    			    		if(mountCd == "40") {
	    			    		$("#orgzCd").val(data.bhfCd); //o2o조직 코드
					  			$("#wrhCd").val(data.wrhCd); //창고 코드
					  			$("#iplZip").val(data.postNo); //거점의 우편번호
    			    		}
    			    		
    			    		if(payGbn == "N"){// 네이버페이결제 add by Jo 2020.10
    			    			if(Number($("#totSaleFee").attr("val")) < 100) {
    			    				ComUtil.unloading();
				    	        	ComUtil.alert("100원 미만 금액은 결제 하실 수 없습니다.");
				    	        	return;
				    	        }
    			    			 
				    			$("#merchantPayKey").val(data.ordNo);
				    			$("#productName").val($("#patternCd").val());
				    			$("#totalPayAmount").val($("#ordAmt").val());	// 총 결제 금액
				    			$("#taxScopeAmount").val($("#ordAmt").val());	// 과세 대상 금액 + 면세 대상 금액 = 총 결제 금액
				    			$("#taxExScopeAmount").val(0);					//면세 대상 없음.
				    			$("#useCfmYmdt").val($("#datepicker11").val().replace(/-/gi, ""));//이용완료일 : 장착 희망일
				    			
				    			ComUtil.unloading();
				    			$('#popNpayInfo').addClass("md-show");
				    		
				    		}else if(payGbn != "K") {
    			    			//KCp - 카드 , 계좌이체
    			    			$("#Pordr_idxx").val(data.ordNo);
    				    		$("#PordNo").val(data.ordNo);
    				    		$("#Pgood_name").val($("#patternCd").val());
    				    		$("#Pcust_no").val("");
    				    		$("#Pgood_mny").val($("#ordAmt").val());
    				    		$("#Pquantity").val($("#cntCdNm").val());
    				    		$("#Pbuyr_name").val($("#orderNmTxt").val());
    				    		$("#Pbuyr_mail").val("");
    				    		$("#Pbuyr_tel1").val($("#phone01").val()+""+$("#phone02").val()+""+$("#phone03").val());
    				    		$("#Pbuyr_tel2").val("");
    	
    				    		if(payGbn == "C") {
    				    			$("#Ppay_method").val("card");
    							} else if(payGbn == "B"){
    					    		$("#Ppay_method").val("acnt");
    							}
    			    		} else {
    			    			//카카오
    			    			$("#ordrIdxx").val(data.ordNo);
    				    		$("#mobYn").val("");
    				    		$("#goodName").val($("#patternCd").val());
    				    		$("#amount").val($("#ordAmt").val());
    				    		$("#buyrName").val($("#orderNmTxt").val());
    				    		$("#buyrMail").val($("#cntCdNm").val());
    				    		$("#buyrTel1").val($("#phone01").val()+""+$("#phone02").val()+""+$("#phone03").val());
    				    		$("#buyrTel2").val("");
    				    		$("#custNo").val("");
    				    		$("#moduleDesc").val("테스트 취소사유 입니다.");
    			    		}
    	
    			    		if(payGbn == "N"){
				    			//
				    		}else if(payGbn != "K") {
    							//KCP 주문
    							fnKcpOrder();
    						} else {
    							//카카오 주문
    							fnKakaoOrder();
    						}
    			    	} else {
    			    		//ComUtil.alert(data.rtnMsg);
    			    		alert(data.rtnMsg);
    			    		return;
    			    	}
    			    },
    			    error: function (request, status, error) {
    			    	console.log(data);
    			    	ComUtil.unloading();
    				}
    			});
    			
    			
    			
			});
		}else {
			ComUtil.alert("스케줄이 변경되었습니다. 오전/오후를 다시 선택해주세요.");
		}
	});
	// -- end tag
	
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
	
  	//얼라이먼트 정비 서비스 변경 시
    $("input[name='alignRd']").on("click" , function(){
    	//오전 오후 초기화
    	$("input[name='timeRd']").prop('checked', false);
	
		//장착 희망시간 초기화
		$("#amArea").hide();
		$("#pmArea").hide();
		
		$("#jobEndTimeMsg").css("display","none");
		
		if($(this).val() == "N") {
			$("#pickUpAlignTxt").show();
		} else {
			$("#pickUpAlignTxt").hide();
		}
		
		//내용초기화
    	//initDetailInfo();
    	
    	//datepicker 이미지 지우기
    	//$('#datepicker11').datepicker("destroy");
    });
	
	$('.js-accordion > .accordion').next('.accordion-info.step1').toggle();
	$('.js-accordion > .accordion').next('.accordion-info.inset-ml').toggle();
	
	$("#amArea span, #pmArea span").on("click" , function(e){
    	if($("[name='mounting']:checked")[0].id=="ser3") return false;
    	
    	var jobEndTime = getJobEndTime($(e.target).attr("schedule"));
    	$("#jobEndTimeMsg").attr("style","display:block;");
    	$("#jobEndTimeMsg span").html("<i class='ico11'></i>종료예정시간: "+jobEndTime);
    });
	
    // 방문장착의 경우 얼라인먼트 현장 서비스 안 됨
    $('#alignReqVisit').click(function(){
		var msg = "얼라인먼트 정비는 매장에서만 가능해요.<br><br>"; 
		    msg += "방문 장착 서비스 선택 시,<br>"; 
		    msg += "향후 이용 가능한<br>"; 
		    msg += "쿠폰 형태로 발급해 드려요.<br>"; 
		    msg += "(※ 장착 완료 시 쿠폰 발급<br>"; 
		    msg += "직영점 직접 내방, 유효기간 1년)<br><br>"; 
		    msg += "타이어 장착 시 얼라인먼트를<br>"; 
		    msg += "함께 정비 받길 원하신다면,<br>"; 
		    msg += "픽업&딜리버리 장착 또는 전문점 장착<br>"; 
		    msg += "서비스를 선택해 주세요."; 
		ComUtil.alert(msg);
        $("#giveCpn").prop("checked", true);
        return false;
    });
    
    // 드라이브스루의 경우 쿠폰서비스만 가능
    $('#alignSerReq').click(function(){
    	
    	var mountCd = $("input[name='mounting']:checked").val();//장착구분
    	var drvThCd = $("input[name='drvThCd']:checked").val();//배송유형세부	    	
		
    	var msg = "역삼점의 Drive Thru 서비스는<br>"; 
	    msg += "타이어 교체 전용으로 얼라인먼트 병행<br>"; 
	    msg += "작업이 불가합니다.<br>"; 
	    msg += "Drive Thru 서비스 선택 시, 향후 이용 가능한<br>"; 
	    msg += "쿠폰 형태로 발급해 드려요.<br>(※ 장착완료 시 쿠폰 발급<br>";
	    msg += "직영점 직접 내방, 유효기간 1년)<br><br>";
	    msg += "타이어 장착 시 얼라인먼트를 함께 정비 받길<br>";
	    msg += "원하신다면, Untact Parking<br>";
	    msg += "또는 일반을 선택해 주세요.";
	    
	    if(mountCd == "40" && drvThCd == "20"){
			ComUtil.alert(msg);
	        $("#giveCpn").prop("checked", true);				
        	return false;
		}
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
    var diffDate_1 = new Date(dt1.substring(0,4), Number(dt1.substring(4,6))-1, dt1.substring(6,8));
    var diffDate_2 = new Date(dt2.substring(0,4), Number(dt2.substring(4,6))-1, dt2.substring(6,8));
 
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

function calcTestAmt(pFixAmt) {
	var cpGbn 	= $("#selectCoupon option:selected").attr("unitCd");	//쿠폰 할인 구분 :  원 / 퍼센트
	var totFee 	= pFixAmt;												//전체 금액
	var cpfee 	= $("#selectCoupon option:selected").attr("unitval");	//쿠폰 가격
	if(cpGbn == "per") {
		cpfee = totFee * Number(cpfee);
        cpfee = Math.floor(cpfee/100) * 100;  
	}
	
	$("#couponTxt01").attr("cpVal" , cpfee);
	$("#couponTxtDel01").attr("cpVal" , cpfee);

	return cpfee;
}

function fn_stoAlert() {
	var param = {};
	var itemCdArr = new Array();
	var itemCntArr = new Array();

	$("ul[name='ordNoSn']").each(function(idx){
		itemCdArr.push($(this).attr("itemcd"));
		itemCntArr.push($("#ordNoCnt"+idx).text());
	});
	
	param["mobNo"] = $("#phone01").val()+""+$("#phone02").val()+$("#phone03").val();
	param["itemCdArr"] = itemCdArr;
	param["itemCntArr"] = itemCntArr;
	param["custNm"] = $("#orderNmTxt").val();
	param["iplAddr"] = $("#popLoadAddr").text() + " " + $("#popDetailAddr").val();

	$.ajax({
        type: "post",
        url: "/order/saveInvAltalkReq",
        data: JSON.stringify(param),
        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
        success: function (data) {
        	ComUtil.alert("입고알람 접수가 완료되었습니다.");
        },
        error: function(xhr,status,error){
        	ComUtil.alert("입고알람 ERROR : 고객센터에 문의 바랍니다.");
        	console.log("error:",error);
        }
    });
	
}

function fu_alignShowCtl(pVal) {
	var mounting = $("input[name='mounting']:checked").val();
	var drvThCd = $("input[name='drvThCd']:checked").val();
	var onOffYn = "N";
	
	$.each($(".optRadio") , function(i , obj){
		var idx = (i+1);
		var checkNm   = $(':radio[name="o2oOptRadio_'+(idx)+'"]:checked').prop("name");
		var plcNo   = $(':input[name="o2oPlcNo_'+(idx)+'"]').val();
		
		if(plcNo == "OPT00000001") {
			if($(':radio[name="' + checkNm + '"]:checked').val() == "Y") {
				onOffYn = "Y";
			} else if($(':radio[name="' + checkNm + '"]:checked').val() == "N") {
				onOffYn = "N";
			}
		}
	});
	
	if(pVal == "show" || pVal == "hide") {
		if(mounting == "10") {
			//방문
			$("#noPickUp").show();
			$("#pickUp").hide();
			$("#junmun").hide();
			
			//드라이브스루
			$("#driveThrough").hide();
			
			$("input[name='alignRd']").prop('checked', false);
			
			if(pVal == "show" && onOffYn == "Y") {
				$("#noPickUpAlign").show();
				$("#pickUpAlign").hide();
			} else {
				$("#noPickUpAlign").hide();
				$("#pickUpAlign").hide();
			}
			$("#giveCpn").prop("checked", true);
			
			//일자,시간 텍스트 변경
			$("#istDtTxt").text("장착일자");
			$("#istTmTxt").text("장착시간");
		} else if(mounting == "20") {
			//픽업
			$("#noPickUp").hide();
			$("#pickUp").show();
			$("#junmun").hide();
			
			//드라이브스루
			$("#driveThrough").hide();
			
			$("input[name='alignRd']").prop('checked', false);
			
			if(pVal == "show" && onOffYn == "Y") {
				$("#noPickUpAlign").hide();
				$("#pickUpAlign").show();
				$("#alignSerReq").prop("checked", true);
			} else {
				$("#noPickUpAlign").hide();
				$("#pickUpAlign").hide();
				$("#giveCpnPick").prop("checked", true);
			}
			
			
			$("#pickUpAlignTxt").hide();
			
			//일자,시간 텍스트 변경
			$("#istDtTxt").text("차량 픽업일자");
			$("#istTmTxt").text("차량 픽업시간");
		} else if(mounting == "40"){
			//전문
			$("#noPickUp").hide();
			$("#pickUp").hide();
			$("#junmun").show();
			
			$("input[name='alignRd']").prop('checked', false);
			
			if(pVal == "show" && onOffYn == "Y") {
				$("#noPickUpAlign").hide();
				$("#pickUpAlign").show();
// 				$("#alignSerReq").prop("checked", true);

				//드라이브스루가 선택되어있을때는 휠얼라인먼트 정비는 [쿠폰발급]으로 고정한다.
 				if(drvThCd == "20"){					
					$("#giveCpnPick").prop("checked", true);
				}else{											
					$("#alignSerReq").prop("checked", true);
				}

			} else {
				$("#noPickUpAlign").hide();
				$("#pickUpAlign").hide();
				$("#giveCpnPick").prop("checked", true);
			}

			$("#pickUpAlignTxt").hide();
			
			//일자,시간 텍스트 변경
			$("#istDtTxt").text("장착일자");
			$("#istTmTxt").text("장착시간");
		}
		
		//오전, 오후, 시간 초기화
		$("input[name='timeRd']").prop('checked', false);
 		$("#amArea").hide();
		$("#pmArea").hide();
		
		//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
	} else if(pVal == "init") {
		if(onOffYn == "Y") {
			if(mounting == "10") {
				//방문
				$("#noPickUp").show();
				$("#pickUp").hide();
				$("#junmun").hide();
				
				if(onOffYn == "Y") {
					$("#noPickUpAlign").show();
					$("#pickUpAlign").hide();
				}
				
				$("input[name='alignRd']").prop('checked', false);
				$("#giveCpn").prop("checked", true);
				
				//일자,시간 텍스트 변경
				$("#istDtTxt").text("장착일자");
				$("#istTmTxt").text("장착시간");
			} else if(mounting == "20") {
				//픽업
				$("#noPickUp").hide();
				$("#pickUp").show();
				$("#junmun").hide();
				
				$("input[name='alignRd']").prop('checked', false);
				
				if(onOffYn == "Y") {
					$("#noPickUpAlign").hide();
					$("#pickUpAlign").show();
					$("#alignSerReq").prop("checked", true);
				} else {
					$("#giveCpnPick").prop("checked", true);
				}
				
				$("#pickUpAlignTxt").hide();
				
				
				//일자,시간 텍스트 변경
				$("#istDtTxt").text("차량 픽업일자");
				$("#istTmTxt").text("차량 픽업시간");
			} else if(mounting == "40"){
				//전문
				$("#noPickUp").hide();
				$("#pickUp").hide();
				$("#junmun").show();
				
				$("input[name='alignRd']").prop('checked', false);
				
				if(onOffYn == "Y") {
					$("#noPickUpAlign").hide();
					$("#pickUpAlign").show();
					$("#alignSerReq").prop("checked", true);
				} else {
					$("#giveCpnPick").prop("checked", true);
				}
				
				$("#pickUpAlignTxt").hide();
				
				
				//일자,시간 텍스트 변경
				$("#istDtTxt").text("장착일자");
				$("#istTmTxt").text("장착시간");
			}
		}
	}
}
</script>
