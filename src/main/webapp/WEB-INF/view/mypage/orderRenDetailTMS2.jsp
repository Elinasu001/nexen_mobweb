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

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header" style="opacity: 0;">
            <h2 class="title-deco"><span>주문하신</span> <span>상품입니다.</span></h2>
            <h3 class="title-deco-sub">주문내역</h3>
          	</div>
          	<!-- //header -->

          	<!-- 주문 정보 안내 -->
          	<div class="order-header-message text-center">
            	<p>주문내역을 확인하실 수 있습니다.</p>
          	</div>
          	<!-- //주문 정보 안내 -->

          	<div class="mynexen-list-wrap">
            	<ul>
              		<c:choose>
				    	<c:when test="${fn:length(myOrdDetail) > 0}">
						<!-- 리스트가 있으면 -->
							<c:forEach var="data" items="${myOrdDetail}" varStatus="status">
							<input type="hidden" id="patternCd" value="${data.patternCd}">
							<input type="hidden" id="dispSize" value="${data.dispSize}">
							<input type="hidden" id="cntVal" value="${data.cntVal}">
							<!-- 렌탈과 구매를 먼저 구분해준다 -->
                			<!-- 렌탈일때 -->
							<li>
								<div class="order-info-summary-wrap">
									<div class="order-info-summary col-1">
										<small>주문일자 ${data.regDtView}</small>
										<small>주문번호 ${data.ordNo}</small>
									</div>
									<div class="align-middle">
										<!--<a href="javascript:fn_orderDetail('R','${data.ordNo}');" class="mynexen-detail">상세</a>-->
									</div>
								</div>

								<article class="order-single inset-m layout-c">
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
							          				<li><span>${data.classNm}</span><span>${data.seasonNm}</span><span>${data.oeYnNm}</span></li>
							          				<li>${data.dispSize}</li>
							          				<li><span>${data.carInfo}</span></li>
							        			</ul>
							      			</div>
							    		</div>
							  		</div>

							  		<div class="layout-c mt-m">
							    		<!-- layout-r inline-s order-rent Start -->
							    		<div class="layout-r inline-s order-rent">
							        		<div class="order-count inline align-middle">
							        			<b class="align-middle">수량</b><span>${data.cntVal}</span>
							        		</div>

								    		<!-- order-rent-info Start -->
				                    		<div class="order-rent-info">
				                      			<dl class="layout-r">
				                        			<dt>렌탈기간</dt>
				                        			<dd>월 렌탈료</dd>
				                        			<dd><fmt:formatNumber value="${data.monAmt}" pattern="#,###" />원</dd>
				                      			</dl>
				                      			<dl class="layout-r">
				                        			<dt><b>${data.periodCdNm} </b></dt>
				                        			<dd>렌탈 등록비</dd>
				                        			<dd><fmt:formatNumber value="${data.regiCdAmt}" pattern="#,###" />원</dd>
				                      			</dl>
				                    		</div>
				                    		<!-- order-rent-info End-->
			                    		</div>
			                    		<!-- layout-r inline-s order-rent End -->
							  		</div>
								</article>

								<div class="inset-m pt-0">
							  		<!-- layout-r Start -->
							  		<div class="layout-r">
								  		<div class="col-1">
									  		<c:if test="${data.reviewCnt eq '0'}">
										  		<c:if test="${fn:contains(data.statCdNm, '장착완료') == true}">
										  			<button type="button" onclick="javascript:fn_Review('${data.patternCd}','R','${data.ordNo}','','${data.matCd}');" class="round btn-primary mr-ss">후기작성</button>
										  		</c:if>
										  		<c:if test="${fn:contains(data.statCdNm, '장착완료') == false}">
										  			<button type="button" onclick="javascript:fn_noReview();" class="round btn-gray-light mr-ss">후기작성</button>
										  		</c:if>
									  		</c:if>
									  		<c:if test="${data.reviewCnt ne '0'}">
											  	<button type="button" onclick="javascript:fn_reviewView('${data.patternCd}','R','${data.ordNo}','','','','${data.matCd}');" class="round btn-primary mr-ss">후기보기</button>
									  		</c:if>
								  		</div>

							      		<div class="layout-c">
							      			<!--  계약진행 -->
								      		<c:if test="${data.zstatus == '03'}">
								        		<span class="round payment">${data.zstatusNm}</span>
								      		</c:if>

								      		<c:if test="${data.zstatus != '03'}">
								      			<c:if test="${fn:contains(data.statCdNm, '취소') eq true}">
								        			<span class="round cancel">${data.statCdNm}</span>
								      			</c:if>
								      			<c:if test="${fn:contains(data.statCdNm, '취소') eq false}">
									      			<c:if test="${fn:contains(data.statCdNm, '완료') eq true}">
									    				<span class="round finish">${data.statCdNm}</span>
									      			</c:if>
									      			<c:if test="${fn:contains(data.statCdNm, '완료') eq false}">
									      				<span class="round continue">${data.statCdNm}</span>
									      			</c:if>
								      			</c:if>
								      		</c:if>
	                                    	<!--계약진행-->

											<!-- 주문취소 시스템 -->
											<c:if test="${data.chanNm eq '온라인'}">
		                            			<c:if test="${data.statCd eq '01' or data.statCd eq '03'}">
			                            			<c:choose>
														<c:when test="${data.zstatus eq '00' or data.zstatus eq '01'}">
														<!-- 00:미존재 / 01:배송요청(Order) 일때는 전체취소 -->
															<c:if test="${data.cancelYn eq 'Y'}">
																<!-- 카드결제 -->
																<c:if test="${data.usePayMethod == '100000000000'}">
						                                        	<%-- <a href="javascript:ordrCancel('STSC','${data.ordNo}','${data.usePayMethod}');" class="deCancel" title="주문취소"></a> --%>
						                                        	<button onclick="javascript:ordrCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${data.patternCd}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																</c:if>

																<!-- 계좌이체 -->
																<c:if test="${data.usePayMethod == '010000000000'}">
																	<!-- 구매확인인 경우 -->
																	<c:if test="${data.buyConfirmYn == 'Y' or data.buyConfirmYn == 'S'}">
																		<%-- <a href="javascript:ordrCashCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCashCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${data.patternCd}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>

																	<!-- 반품요청인 경우 -->
																	<c:if test="${data.buyConfirmYn == 'N'}">
																		<%-- <a href="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${data.patternCd}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>

																	<!-- 구매확인 및 반품요청이 없는 경우 -->
																	<c:if test="${data.buyConfirmYn == ''}">
																		<!-- <a href="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" class="deCancel" title="주문취소"></a> -->
																		<button onclick="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>
																</c:if>

																<!-- 등록금 미결제 주문 취소 -->
																<c:if test="${data.usePayMethod == ''}">
																	<%-- <a href="javascript:ordrCancelNopay('STSC','${data.ordNo}');" class="deCancel" title="주문취소"></a> --%>
																	<button onclick="javascript:ordrCancelNopay('STSC','${data.ordNo}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${data.patternCd}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																</c:if>
															</c:if>
														</c:when>

														<c:when test="${data.zstatus eq '02' or data.zstatus eq '03' or data.zstatus eq '09'}">
														<!-- 02:배송요청(Delivery) / 03:배송중 /09:배송완료일때는 부분취소 -->
															<c:if test="${data.cancelYn eq 'Y'}">
																<!-- 카드결제 -->
																<c:if test="${data.usePayMethod == '100000000000'}">
																	<%-- <a href="javascript:ordrCancel('STPC','${data.ordNo}','${data.usePayMethod}');" class="deCancel" title="주문취소"></a> --%>
																	<button onclick="javascript:ordrCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.agencyCd}');" type="button" class="order-cancel">주문취소<span></span></button>
																</c:if>

																<!-- 계좌이체 -->
																<c:if test="${data.usePayMethod == '010000000000'}">
																	<!-- 구매확인인 경우 -->
																	<c:if test="${data.buyConfirmYn == 'Y' or data.buyConfirmYn == 'S'}">
																		<%-- <a href="javascript:ordrCashCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCashCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>

																	<!-- 반품요청인 경우 -->
																	<c:if test="${data.buyConfirmYn == 'N'}">
																		<%-- <a href="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>

																	<!-- 구매확인 및 반품요청이 없는 경우 -->
																	<c:if test="${data.buyConfirmYn == ''}">
																		<!-- <a href="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" class="deCancel" title="주문취소"></a> -->
																		<button onclick="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>
																</c:if>

																<!-- 등록금 미결제 주문 취소 -->
																<c:if test="${data.usePayMethod == ''}">
																	<%-- <a href="javascript:ordrCancelNopay('STPC','${data.ordNo}');" class="deCancel" title="주문취소"></a> --%>
																	<button onclick="javascript:ordrCancelNopay('STPC','${data.ordNo}','${data.agencyCd}','${carModelNm}','${data.patternCd}','${data.dispSize}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																</c:if>
															</c:if>
														</c:when>
	                            					</c:choose>
		                            			</c:if>
		                            		</c:if>
							      		</div>
						      		</div>
							  		<!-- layout-r End -->
								</div>
			                </li>
							<!-- 렌탈일때 if End-->
						</ul>
					</div>

		<!-- 상품 안내
        <div class="order-middle-message text-center border-bottom">
            <p>상품 주문을 위한 정보를 입력하세요.</p>
            <div class="order-info-summary">
            	<small>고객님의 정보를 정확하게 입력하세요.<br>개인정보가 보호받을 수 있도록 최선을 다하고 있습니다.</small>
            </div>
		</div>
        //상품 안내 -->

        <div class="order-basket">
        	<!-- 주문 정보 상세 -->
            <div class="product-sub-info accordion-box js-accordion">
            	<!-- 01 -->
              	<div class="accordion">
                	<h3>주문자 정보</h3>
              	</div>
              	<div class="accordion-info inset-ml">
                	<div class="submit layout-c mb-m border-bottom">
                		<p class="black">주문자</p>
                		<p class="pt-s pb-s">${data.ordrNm}</p>
              		</div>
              		<div class="submit layout-c border-bottom">
                		<p class="black">휴대전화</p>
                		<p class="pt-s pb-s">
		                	${fn:substring(data.ordrTel1,0,3)} -
		                    ${fn:substring(data.ordrTel1,3,7)} -
		                    ${fn:substring(data.ordrTel1,7,11)}
                		</p>
              		</div>
              		<c:if test="${data.ordrMail ne null and data.ordrMail ne ''}">
	              		<div class="submit layout-c border-bottom">
	                		<p class="black">이메일</p>
	                		<p class="pt-s pb-s">${data.ordrMail}</p>
	              		</div>
              		</c:if>

              		<c:if test="${data.posCd ne null and data.posCd ne ''}">
	              		<div class="submit layout-c">
	                		<p class="black">주소</p>
	               			<p class="pt-s pb-s mb-s border-bottom">(${data.posCd}) ${data.ordrAddr}</p>

	               			<p class="validation">
	                  			<span><i class="ico08"></i>입력해주신 이메일/주소로 메일 또는 우편으로 계약서를 발송해 드립니다.</span>
	                		</p>
	              		</div>
              		</c:if>
              	</div>
              	<!-- //01 -->

              	<!-- 02 -->
              	<div class="accordion">
                	<h3>장착 서비스 정보</h3>
              	</div>





              	<div class="accordion-info inset-ml">


                	<div class="submit border-bottom">
                		<p class="black">장착 서비스</p>
                		<p class="pt-s pb-s">
                           	<c:if test="${data.instCd eq '1010'}">
                           		방문장착
                           	</c:if>
                           	<c:if test="${data.instCd eq '1020'}">
                           		픽업 & 딜리버리
                           	</c:if>
                           	<c:if test="${data.instCd eq '1030'}">
                           		전문점 장착
                           	</c:if>
                           	<c:choose>
	                            <c:when test="${data.alignYn eq 'Y'}">
	                             	&nbsp;/&nbsp;휠 얼라인먼트 요청
	                            </c:when>
	                            <c:when test="${data.alignYn eq 'N'}">
	                             	<!-- <button type="button" onclick="javascript:fn_couponPage();" class="type10" style="margin-left:30px;">쿠폰</button> -->
	                             	&nbsp;/&nbsp;정비 안함
	                            </c:when>
	                            <c:otherwise>
	                            </c:otherwise>
                            </c:choose>
                		</p>
              		</div>

					<c:choose>
							<c:when test="${data.instCd eq '1010'}">
                                <!-- 방문점 장착일때 -->
			              		<div class="submit" id="radioUI01">
			                		<p class="black">주소</p>
			               			<div class="conWrap layout-c mb-s border-bottom">
			               				<p class="pt-s pb-s">${data.insVisitAddr}</p>
			               				<!-- <b>딜리버리 주소</b>
			               				<p class="pt-s pb-s">서울특별시 강서구 마곡중앙로 177 더넥센유니버시티</p> -->
			               			</div>
			              		</div>
                                <!-- 방문점 장착일때 -->
							</c:when>
							<c:when test="${data.instCd eq '1020'}">
								<!-- 픽업 앤 딜리버리 -->
			              		<div class="submit" id="radioUI01">
			                		<p class="black">픽업주소</p>
			               			<div class="conWrap layout-c mb-s border-bottom">
			               				<p class="pt-s pb-s">${data.insVisitAddr}</p>
			               				<!-- <b>딜리버리 주소</b>
			               				<p class="pt-s pb-s">서울특별시 강서구 마곡중앙로 177 더넥센유니버시티</p> -->
			               			</div>
			              		</div>
			              		<div class="submit" id="radioUI01">
			                		<p class="black">딜리버리 주소</p>
			               			<div class="conWrap layout-c mb-s border-bottom">
			               				<p class="pt-s pb-s">${data.insPickAddr}</p>
			               				<!-- <b>딜리버리 주소</b>
			               				<p class="pt-s pb-s">서울특별시 강서구 마곡중앙로 177 더넥센유니버시티</p> -->
			               			</div>
			              		</div>
                                <!-- 픽업 앤 딜리버리 -->
							</c:when>

							<c:otherwise>
								<!-- 전문점 방문장착일때 -->
			              		<div class="submit" id="radioUI01">
			                		<p class="black">주소</p>
			               			<div class="conWrap layout-c mb-s border-bottom">
			               				<p class="pt-s pb-s">(${data.agencyNm})${data.insStorAddr}</p>
			               			</div>
			              		</div>
                                <!-- 전문점 방문장착일때 -->
							</c:otherwise>
						</c:choose>

              		<div class="submit border-bottom">
                		<p class="black">장착 요청일</p>
                		<div class="dateTime layout-r same-size">
                  			<div class="date pl-ml inline">
                    			<p class="inset-s" id="reqDtDiv">${data.reqInsDt} &nbsp;&nbsp;&nbsp;
	                    			<c:if test="${data.instTm != null and data.instTm != ''}">
										${data.instTm.substring(0,2)}:${data.instTm.substring(2)}
									</c:if>
                    			</p>
                  			</div>
                  			<c:if test="${data.statCd eq '01' and o2oShopYn eq 'Y'}">
								<div class="btn w100">
								<!-- 렌탈 예약변경버튼 숨기기 -->
		                        	<button type="button" onclick="javascript:fn_changeDtPop('${data.ordNo}');" class="round payment" style="background-color:#801494;  display:none"><span>변경</span></button>
		                        </div>
		                    </c:if>
                		</div>
              		</div>

              		<div class="submit border-bottom">
                		<p class="black">차량번호</p>
                		<p class="pt-s pb-s">${data.carInfo}</p>
              		</div>
              	</div>
              	<!-- //02 -->

              	<!-- 상품 안내
              	<div class="order-middle-message text-center border-bottom">
                	<p>결제 정보를 입력하세요.</p>
                	<div class="order-info-summary">
                  		<small>월 렌탈 요금 자동이체 등록은 주문 고객님 본인의 계좌 또는 카드만 가능하며 선택한 결제일에 자동으로 결제됩니다. 렌탈 등록비는 장착 후 1회만 청구되며, 1회차 렌탈료와 함께 익월부터 청구됩니다.</small>
                	</div>
              	</div>
              	상품 안내 -->

              	<!-- 03 -->
              	<div class="accordion">
                	<h3>결제 정보</h3>
              	</div>
              	<div class="accordion-info inset-ml">
                	<div class="submit border-bottom">
            			<p class="black">월 렌탈료</p>
            			<p class="pt-s pb-s">&#8361 <fmt:formatNumber value="${data.monAmt}" pattern="#,###" /></p>
          			</div>

          			<div class="submit border-bottom">
            			<p class="black">렌탈 등록비</p>
            			<p class="pt-s pb-s">&#8361 <fmt:formatNumber value="${data.regiCdAmt}" pattern="#,###" /></p>
          			</div>

          			<div class="submit border-bottom">
            			<p class="black">결제수단</p>
            			<p class="pt-s pb-s">
            				<c:if test="${data.bankNm != null and data.bankNm != ''}">
               	 				${data.bankNm}
                			</c:if>
                			<c:if test="${data.cardcomNm != null and data.cardcomNm != ''}">
                    			${data.cardcomNm}
                			</c:if>
            			</p>
          			</div>

          			<div id="radioPaymentUI01">
            			<div class="submit border-bottom layout-c">
              				<p class="black">결제일</p>
              				<p class="pt-s pb-s">${data.payDd}일마다 자동이체</p>
            			</div>

            			<div class="submit layout-c">
              				<p class="black">카드정보</p>
           					<div class="layout-r inline-m border-bottom">
             					<c:if test="${data.cardcomNm != null and data.cardcomNm != ''}">
             						<p class="pt-s pb-s inline">${data.cardcomNm}</p>
             						<p class="pt-s pb-s inline">${data.cardNo}</p>
             					</c:if>
           					</div>
            			</div>

            			<div class="submit layout-c">
              				<p class="black">계좌정보</p>
              				<div class="layout-r inline-m border-bottom">
                				<c:if test="${data.bankNm != null and data.bankNm != ''}">
                					<p class="pt-s pb-s inline">${data.bankNm}</p>
                					<p class="pt-s pb-s inline">${data.acctNo}</p>
                				</c:if>
              				</div>
            			</div>

            			<div class="submit border-bottom">
             			<p class="black">카드소유주</p>
              			<c:if test="${data.cardOwner != null and data.cardOwner != ''}">
              				<p class="pt-s pb-s">${data.cardOwner}</p>
              			</c:if>
            			</div>

            			<div class="submit border-bottom">
              				<p class="black">예금주</p>
              				<c:if test="${data.bankOwner != null and data.bankOwner != ''}">
              					<p class="pt-s pb-s">${data.bankOwner}</p>
              				</c:if>
            			</div>

            			<!-- <div class="submit border-bottom">
              				<p class="black">유효기간</p>
              				<p class="pt-s pb-s">RTRE0020  EXPIRE_YM</p>
            			</div> -->
          			</div>
          			<!-- //신용카드 -->
              	</div>
            </div>

            <!-- 주문 확인 -->
            <div class="orderBox inset-ml" id="sidebar">
            	<article class="contents rent inset-ml">
              		<div class="titleDesc mb-m">
                		<h2 class="mb-s">결제정보</h2>
                		<p>고객님이 결제한 정보입니다.</p>
              		</div>

              		<!-- proInfo -->
              		<div class="proInfo totalPrice">
                		<dl class="layout-r">
                  			<dt>월 렌탈료(1~${data.periodCdNm}개월)</dt>
                  			<dd>
                    			<span><fmt:formatNumber value="${data.monAmt}" pattern="#,###" /></span>
                  			</dd>
                		</dl>
                		<dl class="layout-r">
                  			<dt>렌탈 등록비</dt>
                  			<dd>
                    			<span>- <fmt:formatNumber value="${data.regiCdAmt}" pattern="#,###" /></span>
                  			</dd>
                		</dl>
              		</div>
              		<!-- //proInfo -->

              		<!-- totalPrice -->
              		<div class="totalPrice">
                		<div class="price mt-m">
                  			<dl class="layout-r">
                    			<dt>총 납입금액</dt>
                    			<dd>
                    				<c:set var="periCd" value="${fn:replace(data.periodCdNm, '개월', '') * data.monAmt}" />
                      				<span><fmt:formatNumber value="${periCd + data.regiCdAmt}" pattern="#,###" /></span>
                    			</dd>
                  			</dl>
                  			<dl class="layout-r">
                    			<dt>기본 월 렌탈료</dt>
                    			<dd>
                      				<span><fmt:formatNumber value="${data.monAmt}" pattern="#,###" /></span>
                    			</dd>
                  			</dl>
                  			<dl class="layout-r">
                    			<dt>추가 렌탈료</dt>
                    			<dd>
                      				<span>0</span>
                    			</dd>
                  			</dl>
                  			<dl class="layout-r sale">
                    			<dt>할인금액</dt>
                    			<dd><span><fmt:formatNumber value="${data.saleAmt}" pattern="#,###" /></span></dd>
                  			</dl>
                  			<div class="layout-c last mt-l">
                    			<b class="text-right">최종 월 납입 렌탈료</b>
                    			<div class="text-right"><span><fmt:formatNumber value="${data.regiCdAmt + data.monAmt}" pattern="#,###" /></span></div>
                  			</div>
                		</div>
              		</div>
              		<!-- //totalPrice -->

              		<div class="text-right">
                		<small class="font-gray" style="color:#812990!important; font-weight:bold;">※ 렌탈등록비 및 렌탈료는 장착 후 익월부터 청구됩니다.</small>
              		</div>
            	</article>
            </div>
            </c:forEach>
					</c:when>
				</c:choose>
            <!-- //주문 확인 -->
            <!-- //주문 정보 상세 -->
		</div>

        <div class="btn-wrap">
        	<button type="button" class="btn-primary inset-m full-width" onclick="location.href='/mypage/orderList'">목록</button>
        </div>
	</main>
</div>
<!-- //subContentsWrap -->

<!-- 날짜변경 팝업 영역 시작 -->
    <div class="order-basket">
	<div class="md-effect-1 fullPopup address-popup md-modal-3 md-close" id="modal-ChangeDt">
		<header class="noLine">
			<a href="javascript:sendChildValueCancle('modal-ChangeDt');" class="layPopClose md-close"></a>
				<h2>장착일시 변경</h2>
		</header>
		<div class="popContents">
		<!-- 현재 장착일시  -->
		<div class="submit" style="padding:12px; margin:5px;">
			<div style="height:35px;">
				<label for="datepicker"><span class="black">현재 장착일시</span></label>
			</div>
			<div class="conWrap mb-s">
				<div class="dateTime layout-c mb-m border-gray-bottom">
					<span id="nowIstDt" style="height:30px"></span>
				</div>
			</div>
		</div>
		<!-- //현재 장착일시  -->
		<!-- 장착 희망일시  -->
		<div class="submit" style="padding:0px 0px 0px 16px; margin:0;">
			<div style="height:20px;">
				<label for="datepicker"><span class="essen black">장착일자</span></label>
			</div>
			<div class="conWrap mb-s">
			    <div class="dateTime layout-r same-size border-gray-bottom">
			        <div class="pl-ml inline" style="width:55%">
				        <input type="text" name="datepicker11" class="datepicker" id="datepicker11" title="장착 희망일시 입력란" readonly="readonly" style="padding:1em; width:70%;">
				    </div>

				    <div class="conWrap js-radioUI mt-s" style="width:45%">
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
		</div>
		<!-- //장착 희망일시  -->
		<!-- 시간 선택  -->
		<div class="submit list" style="padding:16px; margin-bottom:5px;">
			<div style="height:35px;">
				<label for="time"><span class="essen black" >장착시간</span></label>
			</div>
			<div class="conWrap mb-s">
				<div class="border-gray-bottom">
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
			</div>
			<p class="validation type04" id="jobEndTimeMsg" style="display:none;">
                <span style="color:#FF0000;"><i class="ico11"></i>종료예정시간</span>
            </p>
		</div>
		<!-- //시간 선택 -->
		<div class="btnArea layout-r bottom-box same-size">
			<button type="button" class="inline btn-gray-light" onclick="sendChildValueCancle('modal-ChangeDt');">취소</button>
  			<button type="button" class="inline btn-primary" onclick="sendChangeDt();">변경</button>
		</div>
    </div>
</div>
</div>
<!-- //날짜변경 팝업 영역 끝 -->

	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>

	<input type="hidden" id="bpStockYn" />
    <input type="hidden" id="rdcStockYn" />
    <input type="hidden" id="bhfType" />
    <input type="hidden" id="tmsOrdNo" />
    <input type="hidden" id="rentalOrdNo" />
    <input type="hidden" id="amPmGbn" />
    <input type="hidden" id="mountCd" />
    <input type="hidden" id="orgzCd" />

    <form id="orderDetailFrm" name="orderDetailFrm" method="post" >
   		<input type="hidden" name="custNo"  			id="custNo"  value="${custNo}"/>
   		<input type="hidden" name="ordergbn"  			id="ordergbn" />   <!--  렌탈이냐 구매냐  -->
		<input type="hidden" name="ordNo"  				id="ordNo" />      <!--  주문번호  -->
    </form>

    <!-- 동현 카피(PC꺼) -->
    <form id="orderInfoFrm" name="orderInfoFrm" method="post" >
    	<input type="hidden" name="patternCd"  	id="patternCd" />
    	<input type="hidden" name="systemGbn"  	id="systemGbn" />
    	<input type="hidden" name="ordNo"  		id="ordNo" 	   />
    	<input type="hidden" name="dpNo"  		id="dpNo" 	   />
    	<input type="hidden" name="classNm"  	id="classNm"   />
    	<input type="hidden" name="dispSize"  	id="dispSize"  />
    	<input type="hidden" name="itemCd"  	id="itemCd"    />
    </form>

<script type="text/javascript">

	// 동현 카피(PC꺼) : 후기 작성
	function fn_Review(pt,gbn,ordn,dpn,itc){
		window.location.href="/mypage/orderRivew?pattenCd="+pt.replace('_','\'')+"&reviewGbn="+gbn+"&ordNo="+ordn+"&dpNo="+dpn+"&itemCd="+itc;
	}

	// 동현 카피(PC꺼) : 후기 보기
   	function fn_reviewView(pt,gbn,ordn,dpn,classNm,dispSize,itc){
		var frm = document.orderInfoFrm;
			frm.ordNo.value = ordn;
			frm.dpNo.value = dpn;
			frm.patternCd.value = pt.replace('_','\'');
			frm.systemGbn.value = gbn;
			frm.classNm.value = classNm;
			frm.dispSize.value = dispSize;
			frm.itemCd.value = itc;
			frm.action = "/mypage/orderRivewView";
			frm.submit();
	}



	var moveDate = "present";//present(현재),next(다음달)

	function enterSchKey() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			selectJuso();
		}
	}

	// 등록금 미결제 주문취소
 	function ordrCancelNopay(canDsc, ordNo, agencyCd,carModelNm,patternCd,dispSize,cntCdNm){
 		var msg = "렌탈 주문을 취소 하시겠습니까?";

		// 취소
		if(confirm(msg)){
			document.onkeydown = noRefresh;
			//var pUrl = "/order/cancelProcNopay";
			//yjw serverMode 제거(20220225)
			pUrl = "/order/cancelProcNopayTMS2";

			var pSendData = {ordNo : ordNo, agencyCd:agencyCd,carModelNm:carModelNm,patternCd:patternCd
					,dispSize:dispSize,cntCdNm:cntCdNm};
				pSendData = JSON.stringify(pSendData);
			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: pSendData,
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
					alert(data.message);
					if(data.success == 0){
						window.location.href="/mypage/orderList";
					}
			    },
			    error: function (e) {
					console.log(e);
				}
			});
		}
 	}

	// 일반 결제 취소
	function ordrCancel(canDsc, orderNo, payMthd, agencyCd,carModelNm,dispSize,patternCd,cntCdNm){
		var msg = "";

		if(payMthd == "010000000000"){
			msg = "계좌이체로 결제하신 주문취소는 회원정보에 등록된 이메일로 주문취소요청을 발급해 드립니다.\n";
			msg = msg + "이메일을 확인하여, 주문최소 해주시기 바랍니다.\n";
			msg = msg + "취소를 진행하시겠습니까?\n";
		}else{
			msg = "렌탈 주문을 취소 하시겠습니까?";
		}

		// 취소
		if(confirm(msg)){
			document.onkeydown = noRefresh;
			var frm = document.orderInfoFrm;
				frm.cancelType.value = canDsc;
				frm.ordrIdxx.value = orderNo;
				frm.agencyCd.value = agencyCd;
				frm.patternCd.value = patternCd;
				frm.dispSize.value = dispSize;
				frm.cntCdNm.value = cntCdNm;
				frm.carModelNm.value = carModelNm;
				frm.action = "/order/orderPreCancel";
				frm.submit();
		}
	}

	// 연동 취소
	function ordrCashCancel(canDsc, ordNo, payMthd, recvSeq, agencyCd,carModelNm,dispSize,patternCd,cntCdNm){
		var msg = "";

		if(recvSeq != ""){
			if(payMthd == "010000000000"){
				msg = "계좌이체로 결제하신 주문취소는 회원정보에 등록된 이메일로 주문취소요청을 발급해 드립니다.\n";
				msg = msg + "이메일을 확인하여, 주문최소 해주시기 바랍니다.\n";
				msg = msg + "취소를 진행하시겠습니까?\n";
			}else{
				msg = "렌탈 주문을 취소 하시겠습니까?\n";
			}

			// 취소
			if(confirm(msg)){
				document.onkeydown = noRefresh;
				check_cashReceitReg(canDsc, ordNo, recvSeq, agencyCd)
			}
		} else {
			ordrCancel(canDsc, ordNo, payMthd, agencyCd,carModelNm,dispSize,patternCd,cntCdNm);
		}
	}

	// 현금영수증 수납거래 조회
	function check_cashReceitReg(canDsc, ordNo, recvSeq, agencyCd){

		var pUrl = "/cash/cashReceiptsRegister";
		var pSendData = {recvSeq : recvSeq,
						   jobGb : 'D',
					 cashModType : canDsc,
				       cashOrdNo : ordNo
						};
			pSendData = JSON.stringify(pSendData);
		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	check_cashReceitReg_result(data, agencyCd);
		    },
		    error: function (e) {
				console.log(e);
			}
		});

	}


	//수납내역결과 저장
	function check_cashReceitReg_result(data, agencyCd){

		var jobGb 		= data.jobGb;
		var recvSeq 	= data.recvSeq;
		var cashSeq 	= data.cashSeq;
		var cashIseq 	= data.cashIseq;
		var resCd 		= data.resCd;
		var resMsg 		= data.resMsg;
		var cash_no 	= data.cash_no;
		var receipt_no 	= data.receipt_no;
		var app_time 	= data.app_time;
		var reg_stat 	= data.reg_stat;
		var reg_desc 	= data.reg_desc;
		var regId 		= data.regId;
		var cashOrdNo 	= data.cashOrdNo;
		var cashModType = data.cashModType;
		var agencyCd 	= agencyCd;

		var pUrl = "/cash/cashReceiptsRegisterOut";
		var pSendData = {
							jobGb 		: jobGb,
			  		      	recvSeq 	: recvSeq,
			  		      	cashSeq 	: cashSeq,
			  		      	cashIseq 	: cashIseq,
			  		      	resCd 		: resCd,
			  		      	resMsg 		: resMsg,
			  		      	cashNo	 	: cash_no,
			  		      	receiptNo 	: receipt_no,
			  		      	appTime 	: app_time,
			  		      	regStat 	: reg_stat,
			  		      	regDesc 	: reg_desc,
			  		      	regId 		: regId,
			  		      	cashOrdNo 	: cashOrdNo,
			  		      	cashModType : cashModType
						};
			pSendData = JSON.stringify(pSendData);

		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	check_cashReceitReg_result_save(data, agencyCd);
		    },
		    error: function (e) {
		    	alert("현금영수증 수납거래번호 정보가 없습니다.고객센터에 문의하세요...");
			}
		});
	}

	function check_cashReceitReg_result_save(data, agencyCd){

	    var cashOrdNo     =        data.cashOrdNo;
	    var cashModType     =      data.cashModType;
	    var agencyCd     =      agencyCd;

		var frm = document.orderInfoFrm;
		frm.cancelType.value = cashModType;
		frm.ordrIdxx.value = cashOrdNo;
		frm.agencyCd.value 		= agencyCd;
		frm.action = "/order/orderPreCancel";
		frm.submit();
	}

	//팝업 가운데 띄우기
	function popOpen(sUrl, sw, sh) {
	 	var cw = screen.availWidth;     //화면 넓이
		var ch = screen.availHeight;    //화면 높이
		var ml=(cw-sw)/2;               //가운데 띄우기위한 창의 x위치
	 	var mt=(ch-sh)/2;               //가운데 띄우기위한 창의 y위치

	 	var popUp = window.open(sUrl, 'popup', 'width='+sw+', height='+sh+', top='+mt+', left='+ml+', resizable=no, scrollbars=yes');
	}


	// 결제 중 새로고침 방지 샘플 스크립트
	function noRefresh(){
	    /* CTRL + N키 막음. */
	    if ((event.keyCode == 78) && (event.ctrlKey == true)){
	        event.keyCode = 0;
	        return false;
	    }
	    /* F5 번키 막음. */
	    if(event.keyCode == 116){
	        event.keyCode = 0;
	        return false;
	    }
	}

	function fn_noReview(){
		alert("후기작성을 쓰실수 없습니다.(장착완료후 활성화 됩니다.)");
		return false;
	}

	//변경  팝업이 나타난다.
	function fn_changeDtPop(ordNo){
		var param = {};

		param["rentalOrdNo"] = ordNo;
		$("#rentalOrdNo").val(ordNo);

		$("#nowIstDt").text($("#reqDtDiv").text());
		ComUtil.loading();

		$.ajax({
	        type: "post",
	        url: "/mypage/selectChangableDate",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	if(data.rtnCode == "0") {
	        		fn_setDatePicker(data.poBhfType, data.hDayList, data.reqDe);
	        		//$("#bpStockYn").val(data.bpStockYn);
	        		//$("#rdcStockYn").val(data.rdcStockYn);
	        		$("#bhfType").val(data.poBhfType);//첫 주문때 선택했던 재고 사용 유형(BHF/RDC)
	        		$("#mountCd").val(data.mountCd);
	        		$("#orgzCd").val(data.orgzCd);
	        		$("#tmsOrdNo").val(data.o2oOrdNo);
	        		$("#modal-ChangeDt").addClass("md-show");
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

	var storechkDay = [];
	function fn_setDatePicker(poBhfType, hDayList, reqDe) {
		//휴일목록

		var deleteRdcDtList = [];
		$.each(hDayList, function(idx, item) {
			storechkDay.push(item.hDate);
		});

		//RDC발주를 한경우 RDC발주 선택 가능한 날짜는 요청날짜보다 빠를 수 없다.
		if(poBhfType == "RDC") {
			deleteRdcDtList = fn_deleteRdcDt(reqDe);
			$.each(deleteRdcDtList, function(idx, item) {
				storechkDay.push(item);
			});
		}

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

		var mDate = poBhfType == "BHF" ? '+0d': bhfLastDay;

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
				var m = day.getMonth()+1 > 9 ? day.getMonth()+1 : "0"+(day.getMonth()+1);
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
				//$("#noneInput").show();
		 	},
		 	onChangeMonthYear: function(year, month, datepicker) {
                var today = new Date();
                var nowMonth = today.getMonth()+1;
                if(nowMonth == month) {
                	moveDate = "present";
                } else {
                	moveDate = "next";
                }
            },
            beforeShow:function(input) {
            	var i_offset= $("#datepicker11").offset(); //클릭된 input의 위치값 체크
            	setTimeout(function(){
                	$('#ui-datepicker-div').css({'top':236});
				});
            }
	    });
		$('#datepicker11').datepicker( "option" , {minDate: mDate,maxDate: '+13d'} );
		$('#datepicker11').val("");
		$("input[name='timeRd']").prop('checked', false);

		$("#amArea").hide();
		$("#pmArea").hide();
		//$("#noneInput").show();

		// 시간선택
	    $('.timeCheck li span').click(function(){
	        $('span.on').removeClass('on');
	        $(this).addClass('on');
	    });

	  //종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
	}

	function fn_deleteRdcDt(reqDe) {
		var rdcStartDt = new Date();
		var chkSunday = false;

		//거점재고일 중 일요일이 있으면 +1일을 더해준다. 오늘, 오늘+첫번째, 오늘 + 두번째 날 = 거점재고일
		for(var j=0; j<3; j++) {
			var chkDay = new Date();
			chkDay.setDate(chkDay.getDate() + j);

			if(chkDay.getDay() == 0) {
				chkSunday = true;
			}
		}

		if(chkSunday) {
			rdcStartDt.setDate(rdcStartDt.getDate() + 4);
		} else {
			rdcStartDt.setDate(rdcStartDt.getDate() + 3);
		}

		var rdcStartDtStr = chgFormatDate(rdcStartDt);//RDC 시작일자 (String)
		var rtnDeleteList = [];

		for(var i=0; i<15; i++) {
			if(rdcStartDtStr == reqDe) {
				break;
			} else if(rdcStartDtStr < reqDe) {
				rtnDeleteList.push(rdcStartDtStr);
				var addDt = new Date(rdcStartDtStr.substring(0,4),Number(rdcStartDtStr.substring(4,6))-1,rdcStartDtStr.substring(6,8));
				addDt.setDate(addDt.getDate() + 1);
				rdcStartDtStr = chgFormatDate(addDt);
			}
		}

		return rtnDeleteList;
	}

	function chgFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '' + month + '' + day;
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
		//var pBhfType = "RDC";//TMS 엔진때 재고 체크를 하지 않게 하기 위해 RDC로 강제 설정.

		var date = $("#nowIstDt").text();		//현재예약한 날짜,시간
		var currentDate = date.substring(13,23);	//날짜
		var currentTime = date.substring(28,33);	//시간

		currentTime2 = currentTime.replace(":","")+"00";
		if(currentTime2 > 000000 && currentTime2 < 115959){
			currentTime = ("오전 "+currentTime);
		}else{
			currentTime = ("오후 "+currentTime);
		}

		param["mountDt"] = $("#datepicker11").val();
		param["bhfType"] = $("#bhfType").val();
		param["amPmGbn"] = $("#amPmGbn").val();
		param["ordNo"] = $("#tmsOrdNo").val();
		param["rentalOrdNo"] = $("#rentalOrdNo").val();
		param["currentDate"] = currentDate;
		param["rentalGbn"] = "R";  //렌탈일때 보내준다.

		var changeSaveSvcTMS2 = "";
		if($("#mountCd").val() == "10") {//방문장착으로 변경시
			changeSaveSvcTMS2 = "/mypage/selectChangeSaveAllocationTMS2";
		} else if($("#mountCd").val() == "20"){//PnD로 변경시
			changeSaveSvcTMS2 = "/mypage/selectChangeSavePndAllocationTMS2";
		}else{//전문점 장착
			changeSaveSvcTMS2 = "/mypage/selectChangeTmsSetTime"
		}

	   	$.ajax({
	        type: "post",
	        url : changeSaveSvcTMS2,
	        //url: "/mypage/selectChangeTmsSetTime",
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
			        	if(data.rtnMount == "pickup") {
			        		//$("#time"+item.time).attr("centerSchedule",JSON.stringify(item.centerSchedule));
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

		param["ordNo"] = $("#tmsOrdNo").val();
		param["orgzCd"] = $("#orgzCd").val();
		param["mountDt"] = $("#datepicker11").val().replace(/-/gi, "");
		param["rentalOrdNo"] = $("#rentalOrdNo").val();

		$.ajax({
	        type: "post",
	        url: "/mypage/selectChgShopTimeList",
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

	function sendChangeDt() {
		if(ValidUtil.isEmpty($("#datepicker11").val())) {
			ComUtil.alert("장착일자를 입력해 주세요");
			return false;
		} else if(ValidUtil.isEmpty($("#amArea span.on, #pmArea span.on").text())) {
			ComUtil.alert("장착시간을 입력해 주세요");
			return false;
		}

		ComUtil.loading();
		var param = {};
		var pBhfType = "RDC";//TMS 엔진때 재고 체크를 하지 않게 하기 위해 RDC로 강제 설정.

		var currentDate = $("#reqDtDiv").text().substring(0,10).replace(/-/gi,".");	//날짜
		var currentTime = $("#reqDtDiv").text().substring(15,20);	//시간
		var currentTime2 = $("#reqDtDiv").text().substring(15,20).replace(":","");

		if(currentTime2 > 0000 && currentTime2 < 1200){
			currentTime = "오전 "+currentTime;
		}else{
			currentTime = "오후 "+currentTime;
		}


		param["istReqDe"] = $("#datepicker11").val().replace(/-/gi, "");
		param["mountDt"] = $("#datepicker11").val();
		param["istDueDe"] = $("#amArea span.on, #pmArea span.on").text().replace(":","")+"00";
		param["currentDate"] = currentDate;		//바뀌기 전 날짜
		param["currentTime"] = currentTime;	//바뀌기 전 시간
		param["carModelNm"]	 = "${carModelNm}";
		param["dispSize"] = $("#dispSize").val();
		param["patternCd"] = $("#patternCd").val();
		param["cntCdNm"] = $("#cntVal").val();

		//조직 코드 = 거점코드
		if($("#mountCd").val() == "40") {
			//전문점 장착의 경우 기존 거점 그대로 전달.
			param["orgzCd"] = $("#orgzCd").val();
		} else {
			//TMS의 경우 스케줄에서 내려온 거점으로 전달.
			param["tmsSchdule"] = JSON.parse($("#amArea span.on, #pmArea span.on").attr("schedule"));//선택한 시간의 스케줄 정보 서버에서 parsing 함.

			//방문장착이 아니면 = 픽업이면
			if($("#mountCd").val() != "10") {
				param["centerSchdule"] = JSON.parse($("#amArea span.on, #pmArea span.on").attr("centerSchedule"));
			}
		}

		param["amPmGbn"] = $("#amPmGbn").val();
		param["ordNo"] = $("#tmsOrdNo").val();
		param["mountCd"] = $("#mountCd").val();
		param["bhfType"] = pBhfType;
		param["rentalOrdNo"] = $("#rentalOrdNo").val();

		$.ajax({
	        type: "post",
	        url: "/mypage/saveIstChangeDt",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	if(data.rtnCode == '0') {
	        		$("#modal-ChangeDt").removeClass("md-show");
	        		//$("#reqDtDiv").html(data.rtnDe.substring(0,4)+"/"+data.rtnDe.substring(4,6)+"/"+data.rtnDe.substring(6,8)+"&nbsp;&nbsp;&nbsp;"+data.rtnTime.substring(0,2)+":"+data.rtnTime.substring(2,4));
	        		fn_orderDetail();
	        	} else {
	        		ComUtil.alert("날짜 변경이 실패하였습니다. 다시 진행 바랍니다.");
	        	}
	        },
	        error: function(xhr,status,error){
	        	console.log("error:",error);
	        	ComUtil.unloading();
	        },
        	complete:function() {
        		ComUtil.unloading();
        		$("#datepicker11").datepicker("destroy");
        	}
	    });
	}

	//상세페이지로 이동
	function fn_orderDetail(){
		var frm = document.orderDetailFrm;
			frm.ordergbn.value = 'R';
			frm.ordNo.value = $("#rentalOrdNo").val();
			frm.action = "/mypage/orderDetail";
			frm.submit();
	}

	$("input[name='timeRd']").on("click" , function(){
    	//function 호출 - 시간을 뿌려주는 function
    	if(ValidUtil.isEmpty($("#datepicker11").val())) {
    		ComUtil.alert("장착희망일을 선택해 주세요.");
    		return false;
    	}

    	//오전 오후를 선택하면 전체 시간을 닫고 시작한다.
    	$("#amArea span, #pmArea span").addClass("off");
    	$("#amArea span, #pmArea span").removeClass("on");

    	if($(this).val() == "AM") {
    		$("#amArea").show();
    		$("#pmArea").hide();
    		//$("#noneInput").hide();
    	} else {
    		$("#pmArea").show();
    		$("#amArea").hide();
    		//$("#noneInput").hide();
    	}
		$("#amPmGbn").val($(this).val());

		if($("#mountCd").val() == "40") {
			getShopTimeList();//전문점 장착용
		} else {
			getTimeList();
		}

		//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });

	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg mynexen-list'></div>");
		/* page background image End */

		//달력 한글화
		$.datepicker.setDefaults($.datepicker.regional["ko"]);
	});

	$("#amArea span, #pmArea span").on("click" , function(e){
    	var jobEndTime = getJobEndTime($(e.target).attr("schedule"));
    	if(jobEndTime=="") return false;
    	$("#jobEndTimeMsg").attr("style","display:block;");
    	$("#jobEndTimeMsg span").html("<i class='ico11'></i>종료예정시간: "+jobEndTime);
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
</script>

