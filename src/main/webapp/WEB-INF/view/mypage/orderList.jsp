<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="java.net.URLEncoder" %>

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
			<!-- header -->
          	<div class="page-header empty">
            	<h2 class="title-deco">
              		<span>주문하신</span> <span>상품입니다.</span>
            	</h2>
            	<h3 class="title-deco-sub">주문내역</h3>
          	</div>
          	<!-- //header -->

          	<div class="">
            	<a href="http://pf.kakao.com/_GLznj/chat" class="page-link full-width" target="_blank">
              		<span>궁금하신 사항은 ‘1:1문의(카카오톡 채팅상담)’을 통해 쉽고 빠르게 궁금증을 해결하실 수 있습니다.</span>
            	</a>
          	</div>

          	<!-- 주문 정보 안내 -->
          	<div class="order-header-message text-center">
            	<p>주문내역을 확인하실 수 있습니다.</p>
          	</div>
          	<!-- //주문 정보 안내 -->

          	<div class="count-box utility layout-r pl-m pr-m">
            	<div class="utility-result-total pt-0 pb-0 pt-s pb-s">
              		<span>total</span>
              		<span class="totalCnt">${selectPrdListCnt}</span>
            	</div>
            	<div class="period-select">
               		<select class="type04 w120 ml20"  id="searchMonth" name="searchMonth" title="기간선택">
                   		<option <c:if test="${searchMonth == 0}">selected="selected"</c:if> value="0">기간선택</option>
                   		<option <c:if test="${searchMonth == 3}">selected="selected"</c:if> value="3">3개월</option>
                   		<option <c:if test="${searchMonth == 6}">selected="selected"</c:if> value="6">6개월</option>
                   		<option <c:if test="${searchMonth == 9}">selected="selected"</c:if> value="9">9개월</option>
               		</select>
            	</div>
          	</div>

          	<div class="mynexen-list-wrap">
            	<ul>
                	<c:choose>
				    	<c:when test="${fn:length(selectPrdList) > 0}">
						<!-- 리스트가 있으면 -->
							<c:forEach var="data" items="${selectPrdList}" varStatus="status">
								<c:set var="dlvTyDtlCd1"  value="${data.dlvTyDtlCd1}" />
							<!-- 렌탈과 구매를 먼저 구분해준다 -->
                			<!-- 렌탈일때 -->
							<c:if test="${data.systemGbn == '2'}">
								<li>
									<div class="order-info-summary-wrap">
										<div class="order-info-summary col-1">
											<small>주문일자 ${data.regDtView}</small>
											<small>주문번호 ${data.ordNo}</small>
										</div>
										<div class="align-middle">
											<a href="javascript:fn_orderDetail('R','${data.ordNo}','${data.carModelNm}');" class="mynexen-detail">상세</a>
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
					                        			<dd>
															<c:if test="${data.monAmt == 'null' || data.monAmt == ''}">
																${data.monAmt}
															</c:if>
															<c:if test="${data.monAmt != 'null' && data.monAmt != ''}">
																<fmt:formatNumber value="${data.monAmt}" pattern="#,###" />원
															</c:if>
					                        			</dd>
					                      			</dl>
					                      			<dl class="layout-r">
					                        			<dt><b>${data.periodCdNm} </b></dt>
					                        			<dd>렌탈 등록비</dd>
					                        			<dd>
	                                           				<c:if test="${data.regiCdAmt == 'null' || data.regiCdAmt == ''}">
	                                           					${data.regiCdAmt}
	                                           				</c:if>
	                                           				<c:if test="${data.regiCdAmt != 'null' && data.regiCdAmt != ''}">
	                                           					<fmt:formatNumber value="${data.regiCdAmt}" pattern="#,###" />원
	                                           				</c:if>
					                        			</dd>
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
										  		<c:if test="${data.reviewCnt == 0}">
											  		<c:if test="${fn:contains(data.statCdNm, '장착완료') == true}">
											  		<!-- 동현 수정 -->
											  			<button type="button" onclick="javascript:fn_Review('${URLEncoder.encode(data.patternCd,'UTF-8')}','R','${data.ordNo}','${data.dpPrNo}','${data.matCd}');" class="round btn-primary mr-ss">후기작성</button>
											  		</c:if>
											  		<c:if test="${fn:contains(data.statCdNm, '장착완료') == false}">
											  			<button type="button" onclick="javascript:fn_noReview();" class="round btn-gray-light mr-ss">후기작성</button>
											  		</c:if>
										  		</c:if>
										  		<c:if test="${data.reviewCnt > 0}">
										  			<!-- 동현 수정 -->
												  	<button type="button" onclick="javascript:fn_reviewView('${URLEncoder.encode(data.patternCd,'UTF-8')}','R','${data.ordNo}','${data.dpPrNo}','${data.classNm}','${data.dispSize}','${data.matCd}');" class="round btn-primary mr-ss">후기보기</button>
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
							                                        	<%-- <a href="javascript:ordrCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
							                                        	<button onclick="javascript:ordrCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>

																	<!-- 계좌이체 -->
																	<c:if test="${data.usePayMethod == '010000000000'}">
																		<!-- 구매확인인 경우 -->
																		<c:if test="${data.buyConfirmYn == 'Y' or data.buyConfirmYn == 'S'}">
																			<%-- <a href="javascript:ordrCashCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																			<button onclick="javascript:ordrCashCancel('STSC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																		</c:if>

																		<!-- 반품요청인 경우 -->
																		<c:if test="${data.buyConfirmYn == 'N'}">
																			<%-- <a href="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																			<button onclick="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																		</c:if>

																		<!-- 구매확인 및 반품요청이 없는 경우 -->
																		<c:if test="${data.buyConfirmYn == ''}">
																			<!-- <a href="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" class="deCancel" title="주문취소"></a> -->
																			<button onclick="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" type="button" class="order-cancel">주문취소<span></span></button>
																		</c:if>
																	</c:if>

																	<!-- 등록금 미결제 주문 취소 -->
																	<c:if test="${data.usePayMethod == ''}">
																		<%-- <a href="javascript:ordrCancelNopay('STSC','${data.ordNo}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCancelNopay('STSC','${data.ordNo}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>
																</c:if>
															</c:when>

															<c:when test="${data.zstatus eq '02' or data.zstatus eq '03' or data.zstatus eq '09'}">
															<!-- 02:배송요청(Delivery) / 03:배송중 /09:배송완료일때는 부분취소 -->
																<c:if test="${data.cancelYn eq 'Y'}">
																	<!-- 카드결제 -->
																	<c:if test="${data.usePayMethod == '100000000000'}">
																		<%-- <a href="javascript:ordrCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																	</c:if>

																	<!-- 계좌이체 -->
																	<c:if test="${data.usePayMethod == '010000000000'}">
																		<!-- 구매확인인 경우 -->
																		<c:if test="${data.buyConfirmYn == 'Y' or data.buyConfirmYn == 'S'}">
																			<%-- <a href="javascript:ordrCashCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																			<button onclick="javascript:ordrCashCancel('STPC','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																		</c:if>

																		<!-- 반품요청인 경우 -->
																		<c:if test="${data.buyConfirmYn == 'N'}">
																			<%-- <a href="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																			<button onclick="javascript:ordrCashCancel('STE4','${data.ordNo}','${data.usePayMethod}','${data.recvSeq}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
																		</c:if>

																		<!-- 구매확인 및 반품요청이 없는 경우 -->
																		<c:if test="${data.buyConfirmYn == ''}">
																			<!-- <a href="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" class="deCancel" title="주문취소"></a> -->
																			<button onclick="javascript:popOpen('/etc/cncl_guide.html', '650', '570');" type="button" class="order-cancel">주문취소<span></span></button>
																		</c:if>
																	</c:if>

																	<!-- 등록금 미결제 주문 취소 -->
																	<c:if test="${data.usePayMethod == ''}">
																		<%-- <a href="javascript:ordrCancelNopay('STPC','${data.ordNo}','${data.agencyCd}');" class="deCancel" title="주문취소"></a> --%>
																		<button onclick="javascript:ordrCancelNopay('STPC','${data.ordNo}','${data.agencyCd}','${data.carModelNm}','${data.dispSize}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.cntVal}');" type="button" class="order-cancel">주문취소<span></span></button>
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
							</c:if>
							<!-- 렌탈일때 if End-->
							<!-- 구매일때일때 if Start-->
							<c:if test="${data.systemGbn == 1 }">
								<!-- 구매 단건일때 start!!! -->
								<c:if test="${data.sumCnt == 1}">
 									<c:if test="${data.parntsItemCd eq null }">
 									<c:set var="poItemCd" value="${data.itemCd}" />
 									<c:set var="poPatternCd" value="${data.patternCd}" />
 									<c:set var="poDispSize" value="${data.dispSize}" />
 									<c:set var="poClassNm" value="${data.classNm}" />
 									<c:set var="poDpPrNo" value="${data.dpPrNo}" />
 									<c:set var="poReviewCnt" value="${data.reviewCnt}" />

 									<li>
										<div class="order-info-summary-wrap">
									    	<div class="order-info-summary col-1">
									      		<small>주문일자 ${data.regDtView}</small>
									      		<small>주문번호 ${data.ordNo}</small>
									    	</div>
									    	<div class="align-middle">
									      		<a href="javascript:fn_orderDetail('O','${data.ordNo}','${data.carModelNm}','${data.custNo}');" class="mynexen-detail">상세</a>
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
						                          			<li><span>${data.classNm}</span><!-- <span>사계절</span><span>순정</span> --></li>
						                          			<li>${data.dispSize}</li>
						                          			<c:if test="${fn:length(data.grntyNo) > 0}">
						                          				<li class="guNum"><span>보증번호 : ${data.grntyNo}</span>
							                          				<span>
																		<c:choose>
																			<c:when test="${data.grntyUseYn eq 'N'}">
																				(미사용)
																			</c:when>
																			<c:otherwise>
																				(사용)
																			</c:otherwise>
																		</c:choose>
							                          				</span>
						                          				</li>
						                          			</c:if>
						                          			<li><span>${data.carInfo}</span></li>
						                        		</ul>
						                      		</div>
						                    	</div>
						                  	</div>
						                  	<div class="layout-r mt-m">
						                    	<div class="order-count align-middle">
						                      		<div class="order-count-quantity layout-r">
						                        		<b class="align-middle">수량</b><span>${data.cntVal}본</span>
						                      		</div>
						                    	</div>
						                    	<div class="order-pay align-middle">
						                      		<div class="layout-c full-width">
						                        		<c:if test="${data.ordChnCd ne '17'}">
							                        		<div class="text-right">구매할인</div>
							                        		<div class="text-right">
				                                                    <c:if test="${(data.orderBaseAmt * data.cntVal) ne data.orderFinAmt}">
				                                                      	<del class="price-sale"><fmt:formatNumber value="${data.orderBaseAmt * data.cntVal}" pattern="#,###" />원</del>
				                                                    </c:if>
							                          			<span class="price-actual"><fmt:formatNumber value="${data.orderFinAmt}" pattern="#,###" />원</span>
							                        		</div>
						                        		</c:if>
						                      		</div>
						                    	</div>
						                  	</div>
										</article>
									</c:if>
				            		<%--
				            	    <c:if test="${data.ordNoSn == data.totSumCnt }">
									  	<div class="inset-m pt-0">
									    	<div class="layout-r">
									      		<div class="col-1">
		                                    		<c:if test="${data.reviewCnt == 0}">
		                                        		<div class="btn w100">
		                                        			<!-- 장착완료일때만 후기작성를 쓸수 있다. -->
		                                        			<c:if test="${data.stat == '40'}">
		                                            			<button type="button" onclick="javascript:fn_Review('${URLEncoder.encode(poPatternCd,'UTF-8')}','O','${data.ordNo}','${data.dpPrNo}','${poItemCd}');" class="round btn-primary mr-ss">후기작성</button>
		                                        			</c:if>
		                                        			<!-- 아닐때는 걍 경고창 -->
		                                        			<c:if test="${data.stat != '40'}">
		                                            			<button type="button" onclick="javascript:fn_noReview();" class="round btn-gray-light mr-ss">후기작성</button>
		                                        			</c:if>
		                                        		</div>
		                                    		</c:if>
		                                    		<c:if test="${data.reviewCnt > 0}">
		                                        		<div class="btn w100">
			                                        		<button type="button" onclick="javascript:fn_reviewView('${URLEncoder.encode(poPatternCd,'UTF-8')}','O','${data.ordNo}','${data.dpPrNo}','${poClassNm}','${poDispSize}','${poItemCd}');" class="round btn-primary mr-ss">후기보기</button>
		                                        		</div>
		                                    		</c:if>
									      		</div>

									      		<div class="layout-c">
		                                    		<!-- 결제완료일때 -->
									      			<c:if test="${data.stat == '20'}">
			                                        	<span class="round payment">${data.statNm}</span>
			                                    	</c:if>
			                                		<!-- 결제완료일때 -->

			                                    	<!-- 장착진행일때 -->
			                                    	<c:if test="${data.stat == '0'}">
			                                        	<div class="btn w100">
				                                        	<span class="round continue">${data.statNm}</span>
				                                        	<c:if test="${data.condiGbn != '0'}">
				                                        	<span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span>
															</c:if>
														</div>
			                                    	</c:if>
			                                    	<!-- 장착진행일때 -->

			                                    	<!-- 장착완료일때 -->
			                                    	<c:if test="${data.stat == '40'}">
			                                    		<div class="btn w100">
			                                        		<span class="round finish">${data.statNm}</span>
															<span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span>
			                                    		</div>
			                                    	</c:if>
			                                    	<!-- 장착완료일때 -->

			                                    	<!-- 주문취소일때 -->
				                                   	<c:if test="${data.stat == 'O99' or data.stat == 'I99' }">
			                                        	<span class="round cancel">${data.statNm}</span>
			                                    	</c:if>
													<!-- 주문취소일때 -->

													<!-- 진행현황 우측 정렬 -->
													<div class="mynexen-order-cancel-wrap btn-ing">
								                   		<c:if test="${data.stat == '40' || data.stat == '0'}">
								                   			<c:if test="${data.condiGbn != '0'}">
																<a href="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');" class="link">진행현황</a>
															</c:if>
								                   		</c:if>
				                                    	<c:if test="${data.stat == '20'}">
				                                    		<c:if test="${data.rcivMthCd == '32' || data.rcivMthCd == '33' || data.rcivMthCd == '34' || data.rcivMthCd == '35' || data.rcivMthCd == '37' || data.rcivMthCd == '38' || data.rcivMthCd == '39'}">
				                                    			<button onclick="javascript:ordrO2oCancel('${data.rcivMthCd}','${data.ordNo}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.orderFinAmt}','${data.carModelNm}');" type="button" class="order-cancel">주문취소<span></span></button>
				                                    		</c:if>
				                                    	</c:if>
											    	</div>
											    	<!-- 진행현황 우측 정렬 -->
									      		</div>
									    	</div>
									  	</div>
					              	</li>
									</c:if>
									 --%>
								</c:if>
							    <!-- 옵션 정보  -->

		                    	<c:if test="${data.sumCnt == 1 && data.ordNoSn != '1'&& data.parntsItemCd ne null  && data.ordChnCd ne '17'}">    <!-- 구매 옵션 -->
					              	<c:if test="${ (data.optSumCnt + data.ordNoSn -1) == data.totSumCnt }">
					            	<article class="order-single inset-m layout-c">
					            		<li>
						            		<div class="layout-r same-size">
						                		<div class="inlnie border-bottom order-box">
						                  			<div class="order-data-title">
						                    			<h3>옵션</h3>
						                  			</div>
						                		</div>
						              		</div>
						            </c:if>
						              		<div class="layout-c mt-m">
						                		<div class="layout-r inline-s order-rent">
						                  			<div class="order-count inline align-middle">
						                    			<b class="align-middle">${data.patternCd} ${data.alignYnDesc}</b>
						                  			</div>
						                  			<div class="order-pay align-middle align-right">
					                  					<%-- <span><fmt:formatNumber value="${data.ordAmt }" pattern="#,###" /></span> --%>
					                  					<div class="layout-c full-width">
									                    	<c:if test="${data.ordChnCd ne '17'}">
										                    	<div class="text-right">구매할인</div>
									                        	<div class="text-right">
					                								<c:if test="${ data.optBasePrc  ne data.orderFinAmt}">
					                                                   	<del class="price-sale"><fmt:formatNumber value="${data.optBasePrc}" pattern="#,###" />원</del>
					                                                </c:if>
									                          		<span class="price-actual"><fmt:formatNumber value="${data.orderFinAmt}" pattern="#,###" />원</span>
									                        	</div>
								                        	</c:if>
									                  	</div>
					                				</div>
						                		</div>
						              		</div>
						             <c:if test="${data.ordNoSn == data.totSumCnt }">
						            	</li>
						            	</article>
					            	</c:if>
				                </c:if>

			            		<!-- 옵션 정보  -->
								<!-- 구매 단건일때 end!!! -->

								<c:if test="${data.sumCnt == 1 &&  data.ordNoSn == data.totSumCnt }">
								  	<div class="inset-m pt-0">
								    	<div class="layout-r2">
								      		<div>
	                                    		<c:if test="${poReviewCnt == 0}">
	                                        		<div class="btn w100">
	                                        			<!-- 장착완료일때만 후기작성를 쓸수 있다. -->
	                                        			<c:if test="${data.stat == '40'}">
	                                            			<button type="button" onclick="javascript:fn_Review('${URLEncoder.encode(poPatternCd,'UTF-8')}','O','${data.ordNo}','${poDpPrNo}','${poItemCd}');" class="round btn-primary mr-ss">후기작성</button>
	                                        			</c:if>
	                                        			<!-- 아닐때는 걍 경고창 -->
	                                        			<c:if test="${data.stat != '40'}">
	                                            			<button type="button" onclick="javascript:fn_noReview();" class="round btn-gray-light mr-ss">후기작성</button>
	                                        			</c:if>
	                                        		</div>
	                                    		</c:if>
	                                    		<c:if test="${poReviewCnt > 0}">
	                                        		<div class="btn w100">
		                                        		<button type="button" onclick="javascript:fn_reviewView('${URLEncoder.encode(poPatternCd,'UTF-8')}','O','${data.ordNo}','${poDpPrNo}','${poClassNm}','${poDispSize}','${poItemCd}');" class="round btn-primary mr-ss">후기보기</button>
	                                        		</div>
	                                    		</c:if>
								      		</div>

								      		<div class="layout-c">
	                                    		<!-- 결제완료일때 -->
								      			<c:if test="${data.stat == '20'}">
		                                        	<span class="round payment">${data.statNm}</span>
		                                    	</c:if>
		                                		<!-- 결제완료일때 -->

		                                    	<!-- 장착진행일때 -->
		                                    	<c:if test="${data.stat == '0'}">
		                                        	<div class="btn w100">
			                                        	<span class="round continue">${data.statNm}</span>
			                                        	<c:if test="${data.condiGbn != '0'}">
			                                        	<span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span>
														</c:if>
													</div>
		                                    	</c:if>
		                                    	<!-- 장착진행일때 -->

		                                    	<!-- 장착완료일때 -->
		                                    	<c:if test="${data.stat == '40'}">
		                                    		<div class="btn w100">
		                                        		<span class="round finish">${data.statNm}</span>
														<span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span>
		                                    		</div>
		                                    	</c:if>
		                                    	<!-- 장착완료일때 -->

		                                    	<!-- 주문취소일때 -->
			                                   	<c:if test="${data.stat == 'O99' or data.stat == 'I99' }">
		                                        	<span class="round cancel">${data.statNm}</span>
		                                    	</c:if>
												<!-- 주문취소일때 -->

												<!-- 진행현황 우측 정렬 -->
												<div class="mynexen-order-cancel-wrap btn-ing">
							                   		<c:if test="${data.stat == '40' || data.stat == '0'}">
							                   			<c:if test="${data.condiGbn != '0'}">
															<a href="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');" class="link">진행현황</a>
														</c:if>
							                   		</c:if>
			                                    	<c:if test="${data.stat == '20'}">
			                                    		<c:if test="${data.rcivMthCd == '32' || data.rcivMthCd == '33' || data.rcivMthCd == '34' || data.rcivMthCd == '35' || data.rcivMthCd == '37' || data.rcivMthCd == '38' || data.rcivMthCd == '39' || data.rcivMthCd == '40'}">
			                                    			<button onclick="javascript:ordrO2oCancel('${data.rcivMthCd}','${data.ordNo}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.orderFinAmt}','${data.carModelNm}','${data.dlvTyDtlCd1}');" type="button" class="order-cancel">주문취소<span></span></button>
			                                    		</c:if>
			                                    	</c:if>
										    	</div>
										    	<!-- 진행현황 우측 정렬 -->
								      		</div>
								    	</div>
								  	</div>
				              	</li>
								</c:if>

								<!-- 구매 다건일때 start!!! -->
								<c:if test="${data.sumCnt != 1 }">
									<c:if test="${data.ordNoSn == '1' && data.parntsItemCd eq null}">
										<li>
										    <article class="mynexen-double layout-c">
								                <div class="order-info-summary-wrap layout-r border-gray-bottom">
								                    <div class="order-info-summary col-1">
								                    	<small>주문일자 ${data.regDtView}</small>
								                      	<small>주문번호 ${data.ordNo}</small>
								                    </div>
								                    <div class="align-middle">
								                    	<a href="javascript:fn_orderDetail('O','${data.ordNo}','${data.carModelNm}','${data.custNo}');" class="mynexen-detail">상세</a>
								                    </div>
												</div>
							                  	<ul class="mynexen-double-inner-list">
									</c:if>
								    <c:if test="${data.parntsItemCd eq null }">
					                    <li>
							            	<article class="order-single inset-m layout-c">
									        	<div class="layout-r same-size">
									            	<div class="inlnie align-bottom">
									                	<div class="order-data-photo">
									                    	<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${data.listImg}" alt="">
									                    </div>
									                </div>
									                <div class="inlnie border-bottom order-box">
									                	<div class="order-data-title">
									                    	<h3>${data.patternCd}</h3>
									                    </div>
									                    <div class="order-product-info">
									                    	<ul class="mb-s">
									                        	<li><span>${data.classNm}</span><!-- <span>사계절</span><span>순정</span> --></li>
									                          	<li>${data.dispSize}</li>
							                          			<c:if test="${fn:length(data.grntyNo) > 0}">
							                          				<li class="guNum"><span>보증번호 : ${data.grntyNo}</span>
								                          				<span>
																			<c:choose>
																				<c:when test="${data.grntyUseYn eq 'N'}">
																					(미사용)
																				</c:when>
																				<c:otherwise>
																					(사용)
																				</c:otherwise>
																			</c:choose>
								                          				</span>
							                          				</li>
							                          			</c:if>
									                          	<li><span>${data.carInfo}</span></li>
									                        </ul>
									                    </div>
									                </div>
												</div>

									            <div class="layout-r mt-m">
									              	<div class="order-count align-middle">
									               		<div class="order-count-quantity layout-r">
									                  		<b class="align-middle">수량</b><span>${data.cntVal}본</span>
									               		</div>
									               	</div>
									                <div class="order-pay align-middle">
									                	<div class="layout-c full-width">
									                    	<c:if test="${data.ordChnCd ne '17'}">
										                    	<div class="text-right">구매할인</div>
									                        	<div class="text-right">
		                   											<c:if test="${(data.orderBaseAmt * data.cntVal) ne data.orderFinAmt}">
				                                                      	<del class="price-sale"><fmt:formatNumber value="${data.orderBaseAmt * data.cntVal}" pattern="#,###" />원</del>
				                                                    </c:if>
									                          		<span class="price-actual"><fmt:formatNumber value="${data.orderFinAmt}" pattern="#,###" />원</span>
									                        	</div>
								                        	</c:if>
									                  	</div>
													</div>
												</div>
											</article>

											<c:if test="${data.ordNoSn == 1}">
											<div class="inset-m pt-0">
												<div class="col-1">
													<c:if test="${data.reviewCnt == 0}">
				                                    	<div class="btn w100">
				                                        	<!-- 장착완료일때만 후기작성를 쓸수 있다. -->
				                                        	<c:if test="${data.stat == '40'}">
				                                            	<button type="button" onclick="javascript:fn_Review('${URLEncoder.encode(data.patternCd,'UTF-8')}','O','${data.ordNo}','${data.dpPrNo}','${data.itemCd}');" class="round btn-primary mr-ss">후기작성</button>
				                                        	</c:if>
				                                        	<!-- 아닐때는 걍 경고창 -->
				                                        	<c:if test="${data.stat != '40'}">
				                                            	<button type="button" onclick="javascript:fn_noReview();" class="round btn-gray-light mr-ss">후기작성</button>
				                                        	</c:if>
				                                        </div>
													</c:if>
				                                    <c:if test="${data.reviewCnt > 0}">
				                                    	<div class="btn w100">
					                                    	<button type="button" onclick="javascript:fn_reviewView('${URLEncoder.encode(data.patternCd,'UTF-8')}','O','${data.ordNo}','${data.dpPrNo}','${data.classNm}','${data.dispSize}','${data.itemCd}');" class="round btn-primary mr-ss">후기보기</button>
				                                        </div>
													</c:if>
												</div>
											</div>
											</c:if>

										  	<c:if test="${data.ordNoSn != data.sumCnt}">
											  	<hr class="join">
										  	</c:if>
										</li>
									</c:if>

				            		<!-- 옵션 정보  -->

 		                    		<c:if test="${data.ordNoSn != '1'&& data.parntsItemCd ne null && data.ordChnCd ne '17'}">    <!-- 구매 옵션 -->
						              	<c:if test="${ (data.optSumCnt + data.ordNoSn -1) == data.totSumCnt }">
							            	<article class="order-single inset-m layout-c">
							            		<li>
								            		<div class="layout-r same-size">
								                		<div class="inlnie border-bottom order-box">
								                  			<div class="order-data-title">
								                    			<h3>옵션</h3>
								                  			</div>
								                		</div>
								              		</div>
								            </c:if>
								              		<div class="layout-c mt-m">
								                		<div class="layout-r inline-s order-rent">
								                  			<div class="order-count inline align-middle">
								                    			<b class="align-middle">${data.patternCd} ${data.alignYnDesc}</b>
								                  			</div>
								                  			<div class="order-pay align-middle align-right">
							                  					<div class="layout-c full-width">
											                    	<div class="text-right">구매할인</div>
										                        	<div class="text-right">
						                								<c:if test="${ data.optBasePrc  ne data.orderFinAmt}">
						                                                   	<del class="price-sale"><fmt:formatNumber value="${data.optBasePrc}" pattern="#,###" />원</del>
						                                                </c:if>
										                          		<span class="price-actual"><fmt:formatNumber value="${data.orderFinAmt}" pattern="#,###" />원</span>
										                        	</div>
											                  	</div>
							                				</div>
								                		</div>
								              		</div>
								             <c:if test="${data.ordNoSn == data.totSumCnt }">
								            	</li>
								            	<li>&nbsp;</li>
								            </article>
						            	</c:if>
					                </c:if>

				            		<!-- 옵션 정보  -->

								  	<%-- <c:if test="${data.ordNoSn == data.sumCnt}"> --%>
								  	<c:if test="${data.ordNoSn == data.totSumCnt}">
										</ul>

						                <div class="mynexen-double-step">
						                    <!-- 결제완료일때 -->
						                	<c:if test="${data.stat == '20'}">
						                    	<span class="round payment">${data.statNm}</span>
						                    </c:if>
						                    <!-- 결제완료일때 -->

						                    <!-- 장착진행일때 -->
						                    <c:if test="${data.stat == '0'}">
						                     	<div class="btn w100">
						                        	<span class="round continue">${data.statNm}</span>
													<c:if test="${data.condiGbn != '0'}">
					                                <%-- <span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span> --%>
													</c:if>
												</div>
											</c:if>
											<!-- 장착진행일때 -->

						                   	<!-- 장착완료일때 -->
						                   	<c:if test="${data.stat == '40'}">
						                   		<div class="btn w100">
						                       		<span class="round finish">${data.statNm}</span>
													<%-- <span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span> --%>
						                   		</div>
						                   	</c:if>
						                   	<!-- 장착완료일때 -->

						                   	<!-- 주문취소일때 -->
						                   	<c:if test="${data.stat == 'O99' or data.stat == 'I99' }">
						                    	<span class="round cancel">${data.statNm}</span>
						                   	</c:if>
						                    <!-- 주문취소일때 -->

						                    <!-- 진행현황 우측정렬 -->
						                    <div class="mynexen-order-cancel-wrap btn-ing">
								            	<c:if test="${data.stat == '40' || data.stat == '0'}">
													<c:if test="${data.condiGbn != '0'}">
														<a href="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');" class="link">진행현황</a>
													</c:if>
								                </c:if>
												<c:if test="${data.stat == '20'}">
													<c:if test="${data.rcivMthCd == '32' || data.rcivMthCd == '33' || data.rcivMthCd == '34' || data.rcivMthCd == '35'  || data.rcivMthCd == '37' || data.rcivMthCd == '38' || data.rcivMthCd == '39' || data.rcivMthCd == '40'}">
														<button onclick="javascript:ordrO2oCancel('${data.rcivMthCd}','${data.ordNo}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.orderFinAmt}','${data.carModelNm}','${data.dlvTyDtlCd1}');" type="button" class="order-cancel">주문취소<span></span></button>
													</c:if>
												</c:if>
											</div>
										</div>

									</article>
 								</li>
							</c:if>
						</c:if>
						<!-- 구매 다건일때 end!!! -->
					</c:if>
					<!-- 구매일때일때 if End -->
				</c:forEach>
			</c:when>
		</c:choose>
	</ul>
</div>
</main>
</div>
<!-- //subContentsWrap -->

	<form id="orderInfoFrm" name="orderInfoFrm" method="post" >
		<input type="hidden" name="ordergbn"  			id="ordergbn" />   <!--  렌탈이냐 구매냐  -->
		<input type="hidden" name="ordNo"  				id="ordNo" />      <!--  주문번호  -->
		<input type="hidden" name="cancelType"  		id="cancelType" /> <!-- 취소타입  -->

		<input type="hidden" name="ordrIdxx"  			id="ordrIdxx" />
		<input type="hidden" name="good_name"  		id="good_name" />
		<input type="hidden" name="good_mny"  		id="good_mny" />
		<input type="hidden" name="good_car_name"  	id="good_car_name" />
		<input type="hidden" name="cust_no"  			id="cust_no"  value="${custNo}"/>
		<input type="hidden" name="CarModelNm"  	/>

		<input type="hidden" name="dpNo"  			id="dpNo" />
		<input type="hidden" name="classNm"  		id="classNm" value="${data.classNm}"/>
		<input type="hidden" name="dispSize"  		id="dispSize" value="${data.dispSize}"/>
		<input type="hidden" name="patternCd"  		id="patternCd" />
		<input type="hidden" name="systemGbn"  		id="systemGbn" />

		<input type="hidden" name="agencyCd"  		id="agencyCd"/>
		<input type="cntCdNm"name="cntCdNm"  		id="cntCdNm"/>			<!-- 타이어수량 -->
		<input type="hidden" name="itemCd"  		id="itemCd" value="${data.itemCd}"/> <!-- 동현 추가 -->
		<input type="hidden" name="dlvTyDtlCd1"  	id="dlvTyDtlCd1"/> <!-- 배송 유형 상세 코드 -->
	</form>

    <form id="orderDetailFrm" name="orderDetailFrm" method="post" >
    		<input type="hidden" name="custNo"  				id="custNo"  value="${custNo}"/>
    		<input type="hidden" name="ordergbn"  			id="ordergbn" />   <!--  렌탈이냐 구매냐  -->
			<input type="hidden" name="ordNo"  				id="ordNo" />      <!--  주문번호  -->
			<input type="hidden" name="carModelNm"  		id="carModelNm" />      <!--  주문번호  -->
    		<input type="hidden" name="cust_no"  			id="cust_no"  value="${custNo}"/>
    </form>

    <form id="monthPage" name="monthPage" method="post" >
    		<input type="hidden" 	name="searchMonth"  	id="searchMonth" />
    </form>

    <form id="nonCustInfoFrm" name="nonCustInfoFrm" method="post" >
    	<input type="hidden" name="ordNo"  	/>      							<!--  주문번호  -->
    	<input type="hidden" name="custNm"  id="custNm" value="${custNm}"/>		<!-- 비회원 이름 -->
		<input type="hidden" name="mobNo"  	id="mobNo" value="${mobNo}"/>		<!-- 비회원 휴대폰 번호 -->
    </form>

    <!-- 픽업&딜리버리 장착 진행현황 -->
    <input type="hidden" class="md-trigger" data-modal="modal-Delivery">
    <div class="md-effect-1 fullPopup address-popup md-modal-3 md-close" id="modal-Delivery">
  		<div class="popContents">
    		<a href="javascript:sendChildValueCancle('modal-Delivery')" class="layPopClose md-close"></a>
    		<header class="noLine">
      			<h2>픽업&딜리버리 장착 진행현황</h2>
    		</header>

    		<div class="popup-contents-nobottom">
      			<div class="inset-m">
        			<div class="mount-process">
          				<ul id="PickAndDIns"></ul>
        			</div>
      			</div>
    		</div>
  		</div>
	</div>
    <!-- //픽업&딜리버리 장착 진행현황 -->

    <!-- 방문장착 진행현황 -->
    <input type="hidden" class="md-trigger" data-modal="modal-Visit">
    <div class="md-effect-1 fullPopup address-popup md-modal-3 md-close" id="modal-Visit">
  		<div class="popContents">
    		<a href="javascript:sendChildValueCancle('modal-Visit')" class="layPopClose md-close"></a>
    		<header class="noLine">
      			<h2>방문장착 진행현황</h2>
    		</header>

    		<div class="popup-contents-nobottom">
      			<div class="inset-m">
        			<div class="mount-process">
          				<ul id="visitIns"></ul>
        			</div>
      			</div>
    		</div>
  		</div>
	</div>
    <!-- //방문장착 진행현황 -->

    <!-- 썸네일 popup // -->
	<div class="popupWrapGall md-effect-1 fullPopup address-popup md-modal-3" id="modal-12"><!--  md-show -->
	  <div class="popContents">
		<a href="#" class="gallPopClose"></a><!-- md-close -->
		<header>
		  <h2>상세보기</h2>
		</header>

		<div class="popContents">
	        <div class="gallery">
				<img id="gallImg" src="/img/mypage/m_pro_01_large.jpg" />
			</div>
		</div>
	  </div>
	</div>

<script type="text/javascript">

	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg mynexen-list'></div>");
		/* page background image End */

		/* 1:1문의로 가기 */
		$('#question').on('click', function(e){
			window.location.href="/mypage/questionRegister";
	    });

		$('#searchMonth').on('change', function(e){
			var month = $('#searchMonth').val();
			var frm = document.monthPage;
				 frm.searchMonth.value = month;
				 frm.action = "/mypage/orderList";
				 frm.submit();

	    });
	});

	function enterSchKey() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
		}
	}


	//상세페이지로 이동
	function fn_orderDetail(gbn, orderNo,carModelNm,custNo){
		//yjw serverMode 제거(20220225)
		var frm = document.orderDetailFrm;
			frm.ordergbn.value = gbn;
			frm.ordNo.value = orderNo;
			frm.carModelNm.value = carModelNm;
			frm.custNo.value = custNo;
			//frm.action = "/mypage/orderDetail";
			frm.action = "/mypage/orderDetailTMS2";
			frm.submit();
	}

 	// 등록금 미결제 주문취소
 	function ordrCancelNopay(canDsc, ordNo, agencyCd,carModelNm,dispSize,patternCd,cntCdNm){
 		var msg = "렌탈 주문을 취소 하시겠습니까?";
		// 취소
		if(confirm(msg)){
			ComUtil.loading();
			document.onkeydown = noRefresh;
			//yjw serverMode 제거(20220225)
			var pUrl = "/order/cancelProcNopayTMS2";
			var pSendData = {
								ordNo 		: ordNo,
								agencyCd 	: agencyCd,
								carModelNm	: carModelNm,
								dispSize	: dispSize,
								patternCd	: patternCd,
								cntCdNm		: cntCdNm
							};
			pSendData = JSON.stringify(pSendData);
			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: pSendData,
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	ComUtil.alert(data.message);
					if(data.success == 0){
						ComUtil.unloading();
						window.location.href="/mypage/orderList";
					}
			    },
			    error: function (e) {
					console.log(e);
					ComUtil.unloading();
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
			ComUtil.loading();
			//yjw serverMode 제거(20220225)
			var orderPreCancel = "";
			if($("#dlvTyDtlCd1").val() == "1030"){ //전문점장착
				orderPreCancel = "/order/orderPreCancel";
			} else {
				orderPreCancel = "/order/orderPreCancelTMS2";
			}
			document.onkeydown = noRefresh;
			var frm = document.orderInfoFrm;
				frm.cancelType.value = canDsc;
				frm.ordrIdxx.value = orderNo;
				frm.agencyCd.value = agencyCd;
				frm.patternCd.value = patternCd;
				frm.dispSize.value = dispSize;
				frm.cntCdNm.value = cntCdNm;
				frm.carModelNm.value = carModelNm;
				frm.action = orderPreCancel;
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
				msg = "렌탈 주문을 취소 하시겠습니까?";
			}

			// 취소
			if(confirm(msg)){
				document.onkeydown = noRefresh;
				check_cashReceitReg(canDsc, ordNo, recvSeq, agencyCd);
			}
		} else {
			ordrCancel(canDsc, ordNo, payMthd, agencyCd,carModelNm,dispSize,patternCd,cntCdNm);
		}
	}

	// 현금영수증 수납거래 조회
	function check_cashReceitReg(canDsc, ordNo, recvSeq, agencyCd){
		ComUtil.loading();
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
		    	ComUtil.unloading();
		    	check_cashReceitReg_result(data, agencyCd);
		    },
		    error: function (e) {
		    	ComUtil.unloading();
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
	    var orderPreCancel = "";
	  	//yjw serverMode 제거(20220225)
		if($("#dlvTyDtlCd1").val() == "1030"){ //전문점장착
			orderPreCancel = "/order/orderPreCancel";
		} else {
			orderPreCancel = "/order/orderPreCancelTMS2";
		}

		var frm = document.orderInfoFrm;
		frm.cancelType.value = cashModType;
		frm.ordrIdxx.value = cashOrdNo;
		frm.agencyCd.value 		= agencyCd;

		frm.action = orderPreCancel;
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
		alert("후기작성를 쓰실수 없습니다.(장착 완료 후 활성화 됩니다.)");
		return false;
	}

	function ordrO2oCancel(rcivMthCd, ordNo, patternCd, orderFinAmt,carModelNm, dlvTyDtlCd1){
		$('#ordrIdxx').val(ordNo);
		$('#good_name').val(unescape(patternCd));
		$('#good_mny').val(orderFinAmt);
		$('#good_car_name').val(carModelNm);
		$('#dlvTyDtlCd1').val(dlvTyDtlCd1);

		if(rcivMthCd == '40') {
			ComUtil.alert("고객님, 주문취소가 필요하신가요?<br><br> 오픈마켓에서 주문하신 경우 <br>	결제하신 오픈마켓에서 취소 가능해요. <br><br> 만약 직접 취소가 어려우시다면, <br> 저희 고객센터(1855-0100)로 연락해주시면  <br> 친절히 도와드리겠습니다.<br><br>※ 고객센터 운영 시간  <br>평일 09:00~18:00 / 토요일, 공휴일 휴무 ");
		} else {
			if(confirm("주문을 취소하시겠습니까?")){
				if(rcivMthCd == '32'  || rcivMthCd == '33'){
					fnKcpOrderCncl();
				}else if(rcivMthCd == '34' || rcivMthCd == '35'){
					fnKcpOrderKkoCncl();
				}else if(rcivMthCd == '37' || rcivMthCd == '38' || rcivMthCd == '39'){
					fnNpayOrderCncl();
				}else{
					alert("온라인취소가 불가능한 주문입니다. 넥센 고객센터에 문의바랍니다.");
				}
			}
		}
	}

	function fnKcpOrderCncl(){
		//var url = '/order/processOrdCncl';
		var reqId = 'fnKcpOrderCncl';

		//yjw serverMode 제거(20220225)
		var url = "";
		if($("#dlvTyDtlCd1").val() == "1030"){ //전문점장착
			url = '/order/processOrdCncl';
		}else { //방문장착, PnD
			url = '/order/processOrdCnclTMS2';
		}


		var sendJson = {};
		sendJson.ordrIdxx 	= $("#ordrIdxx").val();	//주문번호
		sendJson.mobYn	  	= "";
		sendJson.goodName 	= $("#good_name").val();	//상품명이겠고
		sendJson.amount	  	= $("#good_mny").val();		//상품가격에 수량
		sendJson.buyrName 	= "";
		sendJson.buyrMail 	= "";
		sendJson.buyrTel1 	= "";
		sendJson.buyrTel2 	= "";
		sendJson.custNo	  	= $("#cust_no").val();
		sendJson.moduleDesc = "";
		sendJson.carModelNm = $("#good_car_name").val();

		ComUtil.loading();
		/* 리퀘스트 함수 */
		AjaxUtil.call(
				url,
				JSON.stringify(sendJson),
				function(result){
			    	console.log('success callback : ' + reqId, result);
			    	cfnRequestSuccessCallback(reqId, result);
				},
				{
					contentType:"application/json;charset=UTF-8",
				    fcb: function (request, status, error) {
						console.log('error callback : ' + reqId, status);
						cfnRequestErrorCallback(reqId, status);
					}
				}
		);
	}

	function cfnRequestErrorCallback(callback, status) {
			ComUtil.alert("취소되었습니다.");
			location.href = "/mypage/orderList";
	}

	function fnKcpOrderKkoCncl(){
		//var url = '/order/processOrdKkoCncl';
		var reqId = 'fnKcpOrderCncl';

		//yjw serverMode 제거(20220225)
		var url = "";
		if($("#dlvTyDtlCd1").val() == "1030"){ //전문점장착
			url = '/order/processOrdKkoCncl';
		}else { //방문장착, PnD
			url = '/order/processOrdKkoCnclTMS2';
		}

		var sendJson = {};
		sendJson.ordrIdxx 	= $("#ordrIdxx").val();	//주문번호
		sendJson.mobYn	  	= "";
		sendJson.goodName 	= $("#good_name").val();	//상품명이겠고
		sendJson.amount	  	= $("#good_mny").val();		//상품가격에 수량
		sendJson.buyrName 	= "";
		sendJson.buyrMail 	= "";
		sendJson.buyrTel1 	= "";
		sendJson.buyrTel2 	= "";
		sendJson.custNo	  	= $("#cust_no").val();
		sendJson.moduleDesc = "";
		sendJson.carModelNm = $("#good_car_name").val();

		/* 리퀘스트 함수 */
		AjaxUtil.call(
				url,
				JSON.stringify(sendJson),
				function(result){
			    	console.log('success callback : ' + reqId, result);
			    	cfnRequestSuccessCallback(reqId, result);
				},
				{
					contentType:"application/json;charset=UTF-8",
				    fcb: function (request, status, error) {
				    	ComUtil.unloading();
						console.log('error callback : ' + reqId, status);
						cfnRequestErrorCallback(reqId, status);
					}
				}
		);
	}

	/*
	 * 리퀘스트 후처리 함수 - SUCCESS
	 */
	function cfnRequestSuccessCallback(callback, result) {
		ComUtil.unloading();
		if(result.result == "error"){
			if(callback == "fnKcpOrderCncl"){
				alert("실패: " + result.Message);
			}else if(callback == "fnKkoOrder"){
				alert("실패: " + result.Message);
			}else if(callback == "fnNpayOrderCncl"){
				ComUtil.alert("실패: " + result.Message);
			}
		}else{
			alert("취소되었습니다.");
		}

		if(!ValidUtil.isEmpty($("#mobNo").val())) {//비회원
			var frm = document.nonCustInfoFrm;
			frm.action = "/mypage/orderList";
			frm.ordNo.value = $('#ordrIdxx').val();
			frm.submit();
		} else {//회원
			window.location.href="/mypage/orderList";
		}
	}

	//네이버페이주문취소 : by JO 2020.10
	function fnNpayOrderCncl(){
		//var url = '/order/processOrdNPayCncl';
		var reqId = 'fnNpayOrderCncl';

		//yjw serverMode 제거(20220225)
		var url = "";
		if($("#dlvTyDtlCd1").val() == "1030"){ //전문점장착
			url = '/order/processOrdNPayCncl';
		}else { //방문장착, PnD
			url = '/order/processOrdNPayCnclTMS2';
		}

		var sendJson = {};
		sendJson.merchantPayKey	= $("#ordrIdxx").val();		//주문번호
		sendJson.productName 	= $("#good_name").val();	//상품명
		sendJson.productCount	= $("#cntCdNm").val();		//수량
		sendJson.custNo	  		= $("#cust_no").val();
		sendJson.carModelNm 	= $("#good_car_name").val();

		ComUtil.loading()
		/* 리퀘스트 함수 */
		AjaxUtil.call(
			url,
			JSON.stringify(sendJson),
			function(result){
				console.log(result.result);
		    	cfnRequestSuccessCallback(reqId, result);
			},
			{
				contentType:"application/json;charset=UTF-8",
			    fcb: function (request, status, error) {
			    	ComUtil.unloading()
					console.log('error callback : ' + reqId, status);
					cfnRequestErrorCallback(reqId, status);
				}
			}
		);
	}
	// End by JO

	function fn_ConditionPop(ordNo,condiGbn){
 		if(condiGbn == '1'){//방문장착
			fn_visitCondition(ordNo);
		}else if(condiGbn != '1'){//픽업 앤 딜리버리
			fn_pickUpAnddelivery(ordNo);
		}else{
			ComUtil.alert("진행현황을 조회하실 수 없습니다.");
		}
	}

	/* 방문장착 현황 불러오기 */
	function fn_visitCondition(ordNo){

		var pUrl = "/mypage/selectVisitCondition";
		var pSendData = {ordNo : ordNo};
			pSendData = JSON.stringify(pSendData);
			ComUtil.loading();
		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	ComUtil.unloading();
		    	fn_createVisitCondition(data);
		    },
		    error: function (e) {
		    	ComUtil.unloading();
				console.log(e);
			}
		});
	}

	/* 방문장착 영역 생성 */
	function fn_createVisitCondition(data){
		$("#modal-Visit").addClass("md-show");
		var innerHtml = '';

		$('#visitIns').children().remove();
		$('#PickAndDIns').children().remove();

		innerHtml += '<li>';
		innerHtml += '	<div class="process-info-view">';
		innerHtml += '		<div class="process">';
		innerHtml += '			<span class="process-state">진행</span>';
		innerHtml += '		</div>';
		innerHtml += '		<div class="process-step">';
		innerHtml += '			<ul class="process-title">';
		innerHtml += '				<li>01</li>';
		innerHtml += '				<li>매니저 픽업</li>';
		innerHtml += '			</ul>';
		innerHtml += '			<div class="process-detail">';
		innerHtml += '				<dl>';
		innerHtml += '					<dt>희망일시</dt>';
		innerHtml += '					<dd>' + data.visitCond.dueDe +' '+ data.visitCond.dueTime + '</dd>';
		innerHtml += '				</dl>';
		innerHtml += '				<dl>';
		innerHtml += '					<dt>방문일시</dt>';
		innerHtml += '					<dd>' + data.visitCond.dueDe +' '+ data.visitCond.appnTime + '</dd>';
		innerHtml += '				</dl>';
		innerHtml += '			</div>';
		innerHtml += '		</div>';
		innerHtml += '	</div>';
		innerHtml += '</li>';

		if(data.visitCond.arvlTime != '' && data.visitCond.arvlTime != null){
			innerHtml += '<li>';
		}else{
			innerHtml += '<li class="none">';
		}
		innerHtml += '	<div class="process-info-view">';
		innerHtml += '		<div class="process">';
		innerHtml += '			<span class="process-state">진행</span>';
		innerHtml += '		</div>';
		innerHtml += '		<div class="process-step">';
		innerHtml += '			<ul class="process-title">';
		innerHtml += '				<li>02</li>';
		innerHtml += '				<li>도착 및 작업시작</li>';
		innerHtml += '			</ul>';
		innerHtml += '			<div class="process-detail">';
		innerHtml += '				<dl>';

		if(data.visitCond.arvlTime != '' && data.visitCond.arvlTime != null){
			innerHtml += '					<dt>방문완료</dt>';
			innerHtml += '					<dd>' + data.visitCond.dueDe +' '+ data.visitCond.arvlTime + '</dd>';
		} else {
			innerHtml += '					<dd></dd>';
		}
		innerHtml += '				</dl>';
		innerHtml += '			</div>';
		innerHtml += '		</div>';
		innerHtml += '	</div>';
		innerHtml += '</li>';

		if(data.visitCond.endTime != '' && data.visitCond.endTime != null){
			innerHtml += '<li>';
		}else{
			innerHtml += '<li class="none">';
		}
		innerHtml += '	<div class="process-info-view">';
		innerHtml += '		<div class="process">';
		innerHtml += '			<span class="process-state">진행</span>';
		innerHtml += '		</div>';
		innerHtml += '		<div class="process-step">';
		innerHtml += '			<ul class="process-title">';
		innerHtml += '				<li>03</li>';
		innerHtml += '				<li>장착 작업 완료</li>';
		innerHtml += '			</ul>';
		innerHtml += '			<div class="process-detail">';
		innerHtml += '				<dl>';

		if(data.visitCond.endTime != '' && data.visitCond.endTime != null){
			innerHtml += '					<dt>장착완료</dt>';
			innerHtml += '					<dd>' + data.visitCond.dueDe +' '+ data.visitCond.endTime + '</dd>';
		} else {
			innerHtml += '					<dd></dd>';
		}
		innerHtml += '				</dl>';
		if(data.visitAttFList.length > 0 ){
			if(data.visitAttFList[0].regFileNm != null){
				innerHtml += '				<div>';
				innerHtml += '					<button type="button" class="slider-show endTime2">장착 결과 확인</button>';
				innerHtml += '				</div>';
			}
		}
		innerHtml += '			</div>';

		//slider start
		if(data.visitAttFList.length > 0 ){
			innerHtml += '			<div class="store endTime2">';
			innerHtml += '				<div class="swiper-store">';

			for(var i=0; i < data.visitAttFList.length; i++) {
				if(data.visitAttFList[i].regFileNm != null){
					innerHtml += '					<div>';
					innerHtml += '						<a href="#">';
					var imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
					innerHtml += '							<img src="' + imgurl + data.visitAttFList[i].afilePath + '/' + data.visitAttFList[i].regFileNm +'" data-large="' + imgurl + data.visitAttFList[i].afilePath + '/' + data.visitAttFList[i].regFileNm +'" alt="장착이미지">';
					innerHtml += '							<span>' + data.visitAttFList[i].cmCdNm + '</span>';
					innerHtml += '						</a>';
					innerHtml += '					</div>';
				}
			}
			innerHtml += '				</div>';
			innerHtml += '			</div>';
		}
		//slider end

		innerHtml += '		</div>';
		innerHtml += '	</div>';
		innerHtml += '</li>';

		$('#visitIns').html(innerHtml);

		SwiperPme();
	}

	function fn_pickUpAnddelivery(ordNo){

		var pUrl = "/mypage/selectPickAndDel";
		var pSendData = {ordNo : ordNo};
			pSendData = JSON.stringify(pSendData);
		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	fn_createPickUpAnddelivery(data);
		    },
		    error: function (e) {
				console.log(e);
			}
		});
	}

	function fn_createPickUpAnddelivery(data){
		$("#modal-Delivery").addClass("md-show");
		var innerHtml = '';

		$('#PickAndDIns').children().remove();
		$('#visitIns').children().remove();

	    innerHtml += '<li>';
	    innerHtml += '	<div class="process-info-view">';
	    innerHtml += '  	<div class="process">';
	    innerHtml += '			<span class="process-state">진행</span>';
	    innerHtml += '		</div>';
	    innerHtml += '		<div class="process-step">';
	    innerHtml += '			<ul class="process-title">';
	    innerHtml += '				<li>01</li>';
	    innerHtml += '				<li>매니저 픽업</li>';
	    innerHtml += '			</ul>';
	    innerHtml += '			<div class="process-detail">';
	    innerHtml += '				<dl>';
	    innerHtml += '					<dt>희망일시</dt>';
	    innerHtml += '					<dd>' + data.pickDel.dueDe1 +' '+ data.pickDel.dueTime1 + '</dd>';
	    innerHtml += '				</dl>';
	    if(data.pickDel.appnTime1 != null && data.pickDel.appnTime1 != ''){
		    innerHtml += '				<dl>';
		    innerHtml += '					<dt>방문일시</dt>';
		    innerHtml += '					<dd>' + data.pickDel.dueDe1 +' '+ data.pickDel.appnTime1 + '</dd>';
		    innerHtml += '				</dl>';
	    }
	    innerHtml += '			</div>';
	    innerHtml += '		</div>';
	    innerHtml += '	</div>';
	    innerHtml += '</li>';

	    if(data.pickDel.arvlTime1 != null && data.pickDel.arvlTime1 != ''){
	    	innerHtml += '<li>';
	    } else {
	    	innerHtml += '<li class="none">';
	    }

	    innerHtml += '	<div class="process-info-view">';
	    innerHtml += '		<div class="process">';
	    innerHtml += '			<span class="process-state">진행</span>';
	    innerHtml += '		</div>';
	    innerHtml += '		<div class="process-step">';
	    innerHtml += '			<ul class="process-title">';
	    innerHtml += '				<li>02</li>';
	    innerHtml += '				<li>도착 및 차량 키 전달받음</li>';
	    innerHtml += '			</ul>';

	    if(data.pickDel.arvlTime1 != null && data.pickDel.arvlTime1 != ''){
	    	innerHtml += '			<div class="process-detail">';
		    innerHtml += '				<dl>';
		    innerHtml += '					<dt>픽업완료</dt>';
		    innerHtml += '					<dd>' + data.pickDel.dueDe1 +' '+ data.pickDel.arvlTime1 + '</dd>';
		    innerHtml += '				</dl>';
		    innerHtml += '			</div>';
	    }
	    innerHtml += '		</div>';
	    innerHtml += '	</div>';
	    innerHtml += '</li>';

	    if(data.pickDel.endTime1 != null && data.pickDel.endTime1 != ''){
	    	innerHtml += '<li>';
	    } else {
	    	innerHtml += '<li class="none">';
	    }

	    innerHtml += '	<div class="process-info-view">';
	    innerHtml += '		<div class="process">';
	    innerHtml += '			<span class="process-state">진행</span>';
	    innerHtml += '		</div>';
	    innerHtml += '		<div class="process-step">';
	    innerHtml += '			<ul class="process-title">';
	    innerHtml += '				<li>03</li>';
	    innerHtml += '				<li>장착 전 상태 체크 및 전문점 도착</li>';
	    innerHtml += '			</ul>';

	    if(data.pickDel.endTime1 != null && data.pickDel.endTime1 != ''){
		    innerHtml += '			<div class="process-detail">';
		    innerHtml += '				<dl>';
		    innerHtml += '					<dt>전문점 도착 일시</dt>';
		    innerHtml += '					<dd>' + data.pickDel.dueDe2 +' '+ data.pickDel.endTime1 + '</dd>';
		    innerHtml += '				</dl>';
		    innerHtml += '			<div>';
		    innerHtml += '				<button type="button" class="slider-show endTime1">장착 전 상태 확인</button>';
		    innerHtml += '			</div>';
		    innerHtml += '		</div>';

		    if(data.pickDelAttFList.length > 0 ){
				//slider start
				innerHtml += '		<div class="store endTime1">';
				innerHtml += '			<div class="swiper-store">';
				for(var i=0; i < data.pickDelAttFList.length; i++) {
					if(data.pickDel.acptNo1 == data.pickDelAttFList[i].acptNo && data.pickDelAttFList[i].refCd1 == 'P'){
						console.log(data.pickDel.acptNo1+"::::11::::"+data.pickDelAttFList[i].acptNo+"::::11::::"+data.pickDelAttFList[i].refCd1);
						innerHtml += '				<div>';
						innerHtml += '					<a href="#">';
						var imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
						innerHtml += '						<img src="' + imgurl + data.pickDelAttFList[i].afilePath + '/'+ data.pickDelAttFList[i].regFileNm + '" alt="장착이미지">';
						innerHtml += '						<span>' + data.pickDelAttFList[i].cmCdNm + '</span>';
						innerHtml += '					</a>';
						innerHtml += '				</div>';
					}
				}
				innerHtml += '			</div>';
				innerHtml += '		</div>';
				//slider end
			}

			innerHtml += '	</div>';
			innerHtml += '</li>';
	    }

		if(data.pickDel.endTime2 != null && data.pickDel.endTime2 != ''){
	    	innerHtml += '<li>';
	    } else {
	    	innerHtml += '<li class="none">';
	    }

		innerHtml += '	<div class="process-info-view">';
		innerHtml += '		<div class="process">';
		innerHtml += '			<span class="process-state">진행</span>';
		innerHtml += '		</div>';
		innerHtml += '		<div class="process-step">';
		innerHtml += '			<ul class="process-title">';
		innerHtml += '				<li>04</li>';
		innerHtml += '				<li>장착 작업 완료</li>';
		innerHtml += '			</ul>';

		if(data.pickDel.endTime2 != null && data.pickDel.endTime2 != ''){
			innerHtml += '		<div class="process-detail">';
			innerHtml += '			<dl>';
			innerHtml += '				<dt>장착완료</dt>';
			innerHtml += '				<dd>' + data.pickDel.dueDe2 +' '+ data.pickDel.endTime2 + '</dd>';
			innerHtml += '			</dl>';
			innerHtml += '		</div>';
		}
		innerHtml += '		</div>';
		innerHtml += '	</div>';
		innerHtml += '</li>';

		if(data.pickDel.arvlTime3 != null && data.pickDel.arvlTime3 != ''){
	    	innerHtml += '<li>';
	    } else {
	    	innerHtml += '<li class="none">';
	    }

		innerHtml += '	<div class="process-info-view">';
		innerHtml += '		<div class="process">';
		innerHtml += '			<span class="process-state">진행</span>';
		innerHtml += '		</div>';
		innerHtml += '		<div class="process-step">';
		innerHtml += '			<ul class="process-title">';
		innerHtml += '				<li>05</li>';
		innerHtml += '				<li>서비스 매니저 딜리버리</li>';
		innerHtml += '			</ul>';
		if(data.pickDel.arvlTime3 != null && data.pickDel.arvlTime3 != ''){
			innerHtml += '			<div class="process-detail">';
			innerHtml += '				<dl>';
			innerHtml += '      			<dt>딜리버리 일시</dt>';
			innerHtml += '					<dd>' + data.pickDel.dueDe3 +' '+ data.pickDel.arvlTime3 + '</dd>';
			innerHtml += '				</dl>';
			innerHtml += '			</div>';
		}
		innerHtml += '		</div>';
		innerHtml += '	</div>';
		innerHtml += '</li>';

		if(data.pickDel.endTime3 != null && data.pickDel.endTime3 != ''){
	    	innerHtml += '<li>';
	    } else {
	    	innerHtml += '<li class="none">';
	    }

		innerHtml += '	<div class="process-info-view">';
		innerHtml += '		<div class="process">';
		innerHtml += '			<span class="process-state">진행</span>';
		innerHtml += '		</div>';
		innerHtml += '		<div class="process-step">';
		innerHtml += '			<ul class="process-title">';
		innerHtml += '				<li>06</li>';
		innerHtml += '				<li>고객님 차량 키 전달 완료</li>';
		innerHtml += '			</ul>';

		if(data.pickDel.endTime3 != null && data.pickDel.endTime3 != ''){
			innerHtml += '			<div class="process-detail">';
			innerHtml += '    			<dl>';
			innerHtml += '					<dt>딜리버리 완료</dt>';
			innerHtml += '					<dd>' + data.pickDel.dueDe3 +' '+ data.pickDel.endTime3 + '</dd>';
			innerHtml += '				</dl>';
			innerHtml += '				<div>';
			innerHtml += '					<button type="button" class="slider-show endTime3">장착 후 상태확인</button>';
			innerHtml += '        		</div>';
			innerHtml += '			</div>';

           	if(data.pickDelAttFList.length > 0 ){
           		//slider start
               	innerHtml += '			<div class="store endTime3">';
               	innerHtml += '				<div class="swiper-store">';
           		for(var i=0; i < data.pickDelAttFList.length; i++) {
           			if(data.pickDel.acptNo3 == data.pickDelAttFList[i].acptNo && data.pickDelAttFList[i].refCd1 == 'D'){
           				innerHtml += '				<div>';
                       	innerHtml += '					<a href="#">';
                       	var imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
                       	innerHtml += '						<img src="'+imgurl+''+ data.pickDelAttFList[i].afilePath +'/'+ data.pickDelAttFList[i].regFileNm +'" alt="장착이미지">';
                       	innerHtml += '						<span>' + data.pickDelAttFList[i].cmCdNm + '</span>';
                       	innerHtml += '					</a>';
                       	innerHtml += '				</div>';
           			}
           		}
               	innerHtml += '				</div>';
               	innerHtml += '		    </div>';
 		        //slider end
           	}
		}
		innerHtml += '		</div>';
		innerHtml += '	</div>';
		innerHtml += '</li>';

		$('#PickAndDIns').html(innerHtml);

		SwiperPme();
	}

	//1대1문의로 넘긴다.
	function fn_questionList(){
		window.location.href="/mypage/questionRegister";
	}

	//후기작성로 넘어간다.
	function fn_Review(pt,gbn,ordn,dpn,itc){
		window.location.href="/mypage/orderRivew?pattenCd="+pt+"&reviewGbn="+gbn+"&ordNo="+ordn+"&dpNo="+dpn+"&itemCd="+itc;
	}

	function fn_reviewView(pt,gbn,ordn,dpn,classNm,dispSize,itc){
		var frm = document.orderInfoFrm;
			frm.ordNo.value = ordn;
			frm.dpNo.value = dpn;
			frm.patternCd.value = unescape(pt);
			frm.systemGbn.value = gbn;
			frm.classNm.value = classNm;
			frm.dispSize.value = dispSize;
			frm.itemCd.value = itc;
			frm.action = "/mypage/orderRivewView";
			frm.submit();
	}

	// Swiper
	function SwiperPme() {
		var stepWidth = $('.process-step').outerWidth();
		$('.store').css('width', stepWidth);
		// $('.swiper-store').css('width', stepWidth);
			$('.swiper-store').slick({
				infinite: false,
				arrows: true,
				slidesToShow: 2,
				slidesToScroll:1,
				nextArrow: '<i class="nextArrow"></i>',
				prevArrow: '<i class="prevArrow"></i>',
			});

			$('.slider-show.endTime1').bind('click', function(){
				$(this).toggleClass('on');
				$('.store.endTime1').slideToggle('fast');
			});

			$('.slider-show.endTime3').bind('click', function(){
				$(this).toggleClass('on');
				$('.store.endTime3').slideToggle('fast');
			});

			$('.slider-show.endTime2').bind('click', function(){
				$(this).toggleClass('on');
				$('.store.endTime2').slideToggle('fast');
			});

			$(".store a img").click(function(){
				 var idx = $(this).index();
				 var $imgShow = $(this);

				 $('.popupWrapGall').eq(idx).addClass('md-show');
				 $("#gallImg").attr("src", $imgShow.attr("data-large"));
			});

			$(".gallPopClose").click(function(){
				$(".popupWrapGall").removeClass('md-show');
			});
	}
</script>
