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
<%@ page import="java.net.URLEncoder" %>

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
			<!-- header -->
          	<div class="page-header" style="opacity: 0;">
            	<h2 class="title-deco">
              		<span>주문하신</span> <span>상품입니다.</span>
            	</h2>
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
							<!-- 구매일때일때 if Start-->
							<c:if test="${data.systemGbn == 1 }">
								<!-- 구매 단건일때 start!!! -->
								<c:if test="${data.sumCnt == 1}">
									<c:if test="${data.parntsItemCd eq null }">
									
									<c:set var="poItemCd" value="${data.itemCd}" />
 									<c:set var="poPatternCd" value="${data.patternCd}" />
 									<c:set var="poDispSize" value="${data.dispSize}" />
 									<c:set var="poClassNm" value="${data.classNm}" />
 									<c:set var="poStatNm" value="${data.statNm}" />
 									<c:set var="poStat" value="${data.stat}" />
 									<c:set var="poRcivMthCd" value="${data.rcivMthCd}" />
 									<c:set var="poDpPrNo" value="${data.dpPrNo}" />
 									<c:set var="poReviewCnt" value="${data.reviewCnt}" />
 									
	 									<li>
											<div class="order-info-summary-wrap">
										    	<div class="order-info-summary col-1">
										      		<small>주문일자 ${data.regDtView}</small>
										      		<small>주문번호 ${data.ordNo}</small>
										    	</div>
										    	<div class="align-middle">
										      	<!--<a href="javascript:fn_orderDetail('O','${data.ordNo}');" class="mynexen-detail">상세</a>-->
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
					            		
					              	</li>
								</c:if>
								
								<!-- 옵션 정보  -->
	                    		<c:if test="${data.sumCnt == 1 && data.ordNoSn != '1'&& data.parntsItemCd ne null && data.ordChnCd ne '17'}">    <!-- 구매 옵션 -->
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
						            	</article>
					            	</c:if>
				                </c:if>
			            		<!-- 옵션 정보  -->
				                <c:if test="${data.sumCnt == 1 && data.systemGbn == 1 && data.ordNoSn == data.totSumCnt && data.ordChnCd ne '17'}">
								  	<div class="inset-m pt-0">
								    	<div class="layout-r">
								      		<div class="col-1">
	                                    		<c:if test="${poReviewCnt == 0}">
	                                        		<div class="btn w100">
	                                        			<!-- 장착완료일때만 후기작성를 쓸수 있다. -->
	                                        			<c:if test="${poStat == '40'}">
	                                            			<button type="button" onclick="javascript:fn_Review('${URLEncoder.encode(poPatternCd,'UTF-8')}','O','${data.ordNo}','${poDpPrNo}','${poItemCd}');" class="round btn-primary mr-ss">후기작성</button>
	                                        			</c:if>
	                                        			<!-- 아닐때는 걍 경고창 -->
	                                        			<c:if test="${poStat != '40'}">
	                                            			<button type="button" onclick="javascript:fn_noReview();" class="round btn-gray-light mr-ss">후기작성</button> 
	                                        			</c:if>							                                        		                                        
	                                        		</div>
	                                    		</c:if>   
	                                    		<c:if test="${poReviewCnt > 0}">
	                                        		<div class="btn w100">
		                                        		<button type="button" onclick="javascript:fn_reviewView('${URLEncoder.encode(poPatternCd,'UTF-8')}','O','${data.ordNo}','${poDpPrNo}','${poItemCd}');" class="round btn-primary mr-ss">후기보기</button>	                                        					                                        
	                                        		</div> 
	                                    		</c:if>   								      
								      		</div>
								      
								      		<div class="layout-c">
	                                    		<!-- 결제완료일때 -->
								      			<c:if test="${poStat == '20'}">
		                                        	<span class="round payment">${poStatNm}</span>							                                    
		                                    	</c:if>
		                                		<!-- 결제완료일때 -->    
		                                    
		                                    	<!-- 장착진행일때 -->
		                                    	<c:if test="${poStat == '0'}">
		                                        	<div class="btn w100">
			                                        	<span class="round continue">${poStatNm}</span>
			                                        	<c:if test="${data.condiGbn != '0'}">
			                                        	<%-- <span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span> --%>
														</c:if>							
													</div>	                                        								                                    
		                                    	</c:if>						
		                                    	<!-- 장착진행일때 -->
		                                                      
		                                    	<!-- 장착완료일때 -->
		                                    	<c:if test="${poStat == '40'}">
		                                    		<div class="btn w100">
		                                        		<span class="round finish">${poStatNm}</span>
														<%-- <span class="info" onclick="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');">▶ 진 행 현 황 ◀</span> --%>					                                    
		                                    		</div>					
		                                    	</c:if>
		                                    	<!-- 장착완료일때 -->
		                                    
		                                    	<!-- 주문취소일때 -->
			                                   	<c:if test="${poStat == 'O99' or poStat == 'I99' }">
		                                        	<span class="round cancel">${poStatNm}</span>                          
		                                    	</c:if>										        
												<!-- 주문취소일때 -->								        
								      		</div>
								    	</div>
								    	
								    	<div class="mynexen-order-cancel-wrap">
					                   		<c:if test="${poStat == '40' || poStat == '0'}">			
					                   			<c:if test="${data.condiGbn != '0'}">		                                    
													<a href="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');" class="link">진행현황</a>
												</c:if>
					                   		</c:if>								    
	                                    	<c:if test="${poStat == '20'}">
	                                    		<c:if test="${poRcivMthCd == '32' || poRcivMthCd == '33' || poRcivMthCd == '34' || poRcivMthCd == '35' || poRcivMthCd == '37' || poRcivMthCd == '38' || poRcivMthCd == '39' || poRcivMthCd == '40'}">
	                                    			<button onclick="javascript:ordrO2oCancel('${data.rcivMthCd}','${data.ordNo}','${URLEncoder.encode(poPatternCd,'UTF-8')}','${data.orderFinAmt}','${carModelNm}');" type="button" class="order-cancel">주문취소<span></span></button>
	                                    		</c:if>
	                                    	</c:if>									    
								    	</div>
								  	</div>
			            		</c:if>
								<!-- 구매 단건일때 end!!! -->							
							
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
								                    <!--<a href="javascript:fn_orderDetail('O','${data.ordNo}');" class="mynexen-detail">상세</a>-->
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
									                    	<div class="text-right">구매할인</div>
								                        	<div class="text-right">
								                          		<del class="price-sale"><fmt:formatNumber value="${data.orderBaseAmt}" pattern="#,###" />원</del>
								                          		<span class="price-actual"><fmt:formatNumber value="${data.orderFinAmt}" pattern="#,###" />원</span>
								                        	</div>
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
					                                    	<button type="button" onclick="javascript:fn_reviewView('${URLEncoder.encode(data.patternCd,'UTF-8')}','O','${data.ordNo}','${data.dpPrNo}','${data.itemCd}');" class="round btn-primary mr-ss">후기보기</button>	                                        					                                        
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
 		                    		<c:if test="${data.ordNoSn != '1'&& data.parntsItemCd ne null }">    <!-- 구매 옵션 -->
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
										</div>
						                  
						                <div class="mynexen-order-cancel-wrap">
							            	<c:if test="${data.stat == '40' || data.stat == '0'}">			
												<c:if test="${data.condiGbn != '0'}">		                                    
													<a href="javascript:fn_ConditionPop('${data.ordNo}','${data.condiGbn}');" class="link">진행현황</a>
												</c:if>
							                </c:if>								    
											<c:if test="${data.stat == '20'}">
												<c:if test="${data.rcivMthCd == '32' || data.rcivMthCd == '33' || data.rcivMthCd == '34' || data.rcivMthCd == '35' || data.rcivMthCd == '37' || data.rcivMthCd == '38' || data.rcivMthCd == '39' || data.rcivMthCd == '40'}">
													<button onclick="javascript:ordrO2oCancel('${data.rcivMthCd}','${data.ordNo}','${URLEncoder.encode(data.patternCd,'UTF-8')}','${data.orderFinAmt}','${carModelNm}');" type="button" class="order-cancel">주문취소<span></span></button>
												</c:if>
											</c:if>									
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
                			<p class="pt-s pb-s">${myOrdDetailInfo.custNm}</p>
              			</div>
              			<div class="submit layout-c border-bottom">
                			<p class="black">휴대전화</p>
                			<p class="pt-s pb-s">${myOrdDetailInfo.mobNo}</p>
              			</div>
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
                				${myOrdDetailInfo.dlvTyDtlCd1}
								<c:choose>
									<c:when test="${myOrdDetailInfo.drvThCd eq '20'}">
										&nbsp;/&nbsp;Drive Thru 서비스
									</c:when>
									<c:when test="${myOrdDetailInfo.drvThCd eq '30'}">
										&nbsp;/&nbsp;Parking
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>                				
                				<c:choose>
                                	<c:when test="${myOrdDetailInfo.alignYn eq 'Y'}">
                                		&nbsp;/&nbsp;휠 얼라인먼트 요청	
                                	</c:when>
                                	<c:when test="${myOrdDetailInfo.alignYn eq 'N'}">
                                		<c:if test="${!fn:contains(custNo, 'NO')}">
                                			<!-- <button onclick="javascript:fn_couponPage();" type="button" style="background-color:#801494; margin-left:30px;" class="round payment"><span>쿠폰</span></button> -->
                                			&nbsp;/&nbsp;쿠폰
                                		</c:if>
                                	</c:when>
                                	<c:otherwise>
                                	</c:otherwise>
                               	</c:choose>
                			</p>
              			</div>

						<!-- 전문점 방문장착일때 -->
						<c:choose>
						    <c:when test="${myOrdDetailInfo.pickupBassAddr != '' && myOrdDetailInfo.pickupBassAddr != null}">
		              			<div class="submit border-bottom" id="radioUI01">
		                			<p class="black">픽업 주소</p>
		                			<p class="pt-s pb-s">${myOrdDetailInfo.pickupBassAddr} ${myOrdDetailInfo.pickupDtlAddr}</p>
		              			</div>						    
								<div class="submit border-bottom" id="radioUI01">
		                			<p class="black">딜리버리 주소</p>
		                			<p class="pt-s pb-s">${myOrdDetailInfo.iplAddr} ${myOrdDetailInfo.iplDtlAddr}</p>
		              			</div>		              			
						    </c:when>
						    <c:otherwise>
		              			<div class="submit border-bottom" id="radioUI01">
		                			<p class="black">장착 주소</p>
		                			<p class="pt-s pb-s">${myOrdDetailInfo.iplAddr} ${myOrdDetailInfo.iplDtlAddr}</p>
		              			</div>
						    </c:otherwise>
						</c:choose>
						<!-- 전문점 방문장착일때 -->

              			<div class="submit border-bottom">
                			<p class="black">장착 희망일시</p>
                			<div class="dateTime layout-r same-size">
                  				<input type="hidden" id="ordDe" value="${myOrdDetailInfo.ordDe}">
                  				<div class="date pl-ml inline">
                    				<p class="inset-s" id="reqDtDiv">${myOrdDetailInfo.istReqDe}</p>
                  				</div>
                  				<div class="time pl-ml inline">
                    				<p class="inset-s" id="reqDtDiv2">${myOrdDetailInfo.istReqTime}</p>
                  				</div>
								<c:if test="${myOrdDetailInfo.chgBtnYn == 'Y'}">
									<button onclick="javascript:fn_changeDtPop('${myOrdDetailInfo.ordNo}');" type="button" style="background-color:#801494" class="round payment"><span>변경</span></button>
								</c:if>  
                			</div>
              			</div>
              			
              			<div class="submit border-bottom">
                			<p class="black">차량번호</p>
                			<p class="pt-s pb-s">${myOrdDetailInfo.carNo}</p>
              			</div>
              		</div>
              		<!-- //02 -->
              
              		<!-- 03 쿠폰정보 없음 -->		
              		<!-- 04 -->
              		<div class="accordion">
                		<h3>구매 결제 정보</h3>
              		</div>
              		<div class="accordion-info inset-ml">
                		<div class="submit border-bottom">
                			<p class="black">결제수단</p>
                			<p class="pt-s pb-s">
	                			<c:choose>
				                	<c:when test="${myOrdDetailInfo.ordChnCd eq '17'}">
				                		쿠팡 사이트 참조
				                	</c:when>
				                	<c:otherwise>
				                		${myOrdDetailInfo.payGbn}
			                			<c:if test="${myOrdDetailInfo.ordMarketNo ne null}">
					                    (${myOrdDetailInfo.ordMarketNo})
					                    </c:if>
				                	</c:otherwise>
				                </c:choose>
                			</p>
              			</div>
              		</div>
              		<!-- //04 -->
            	</div>

            	<!-- 주문 확인 -->
            	<div class="orderBox inset-ml" id="sidebar">
              		<article class="contents inset-ml">
              			<c:choose>
		                	<c:when test="${myOrdDetailInfo.ordChnCd eq '17'}">
		                		<div class="titleDesc mb-m">
		                			<h2 class="mb-s">결제정보</h2>
		                			<p>결제 정보는 쿠팡 사이트를 참조 해주시기 바랍니다.</p>
		              			</div>
		                	</c:when>
		                	<c:otherwise>
		                		<div class="titleDesc mb-m">
		                			<h2 class="mb-s">결제정보</h2>
		                			<p>고객님이 결제한 정보입니다.</p>
		              			</div>
		                  
		              			<!-- totalPrice -->
		              			<div class="totalPrice">
		                			<div class="price mt-m">
		                  				<dl class="layout-r">
		                    				<dt>총 주문금액</dt>
		                    				<dd><span><fmt:formatNumber value="${myOrdDetailInfo.ordAmt}" pattern="#,###" /></span></dd>
		                  				</dl>
		                  				<dl class="layout-r sale">
		                    				<dt>쿠폰할인</dt>
		                    				<dd><span><fmt:formatNumber value="${myOrdDetailInfo.setlCpnDcAmt}" pattern="#,###" /></span></dd>
		                  				</dl>
		                  				<c:forEach var="opt" items="${myOrdOptList}" varStatus="status">
						                   <dl class="layout-r">
						                       <dt>${opt.itemNm}</dt>
						                       <dd>&#8361 <fmt:formatNumber value="${opt.saleAmt}" pattern="#,###" /></dd>
						                   </dl>
				                 		</c:forEach>
		                  
		                  				<div class="layout-c last mt-l">
		                    				<b class="text-right">최종 결제 금액</b>
		                    				<div class="text-right"><span><fmt:formatNumber value="${myOrdDetailInfo.setlAmt}" pattern="#,###" /></span></div>
		                  				</div>
		                			</div>                                
		              			</div>
		              			<!-- //totalPrice -->
		                	</c:otherwise>
		                </c:choose>
            		</article>
            	</div>
            	<!-- //주문 확인 -->
          	</div>
            <!-- //주문 정보 상세 -->

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
				<label for="nowDatepicker"><span class="black">현재 장착일시</span></label>
			</div>
			<div class="conWrap mb-s">
				<div class="dateTime layout-c mb-m border-gray-bottom">
					<span id="nowIstDt" style="height:30px"></span>
				</div>
			</div>
		</div>
		<!-- //현재 장착일시  -->
		<!-- 최대변경 가능일  -->
		<div class="submit" style="padding:12px; margin:5px;">
			<div style="height:35px;">
				<label for="nowDatepicker"><span class="black">최대변경 가능일</span></label>
			</div>
			<div class="conWrap mb-s">
				<div class="dateTime layout-c mb-m border-gray-bottom">
					<span id="maxIstDt" style="height:30px"></span>
				</div>
			</div>
		</div>
		<!-- //최대변경 가능일  -->
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

	<!-- 방문장착 진행현황 레이어 팝업 영역 -->
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
    <!-- 방문장착 진행현황 레이어 팝업 영역 -->
    
    
    <!-- 픽업 앤 딜리버리 레이어 팝업 영역 -->
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
    <!-- 픽업 앤 딜리버리 레이어 팝업 영역 -->
    
	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script> 
    
	<form id="orderInfoFrm" name="orderInfoFrm" method="post" >
		<input type="hidden" name="ordergbn"  		id="ordergbn" />   <!--  렌탈이냐 구매냐  -->
		<input type="hidden" name="ordNo"  			id="ordNo" />      <!--  주문번호  -->
		<input type="hidden" name="cancelType"  	id="cancelType" /> <!-- 취소타입  -->
		<input type="hidden" name="dpNo"  			id="dpNo" />
		<input type="hidden" name="patternCd"  		id="patternCd" />
		<input type="hidden" name="systemGbn"  		id="systemGbn" />
		
		<input type="hidden" name="ordrIdxx"  		id="ordrIdxx" />   
		<input type="hidden" name="good_name"  		id="good_name" />   		
		<input type="hidden" name="good_mny"  		id="good_mny" />
		<input type="hidden" name="good_car_name"  	id="good_car_name" />		<!-- 상세페이지에서 주문취소할때 차량정보 넘기기위한것 -->
		<input type="hidden" name="cust_no"  		id="cust_no"  value="${custNo}"/>				
		<input type="hidden" name="itemCd"  		id="itemCd"  value=""/>				
	</form>     	
	
	<form id="orderDetailFrm" name="orderDetailFrm" method="post" >
   		<input type="hidden" name="custNo"  			id="custNo"  value="${custNo}"/>
   		<input type="hidden" name="ordergbn"  			id="ordergbn" />   <!--  렌탈이냐 구매냐  -->
		<input type="hidden" name="ordNo"  				id="ordNo" />      <!--  주문번호  -->
    </form>
    
    <form id="nonCustInfoFrm" name="nonCustInfoFrm" method="post" >
    	<input type="hidden" name="ordNo"  	/>      							<!--  주문번호  -->
    	<input type="hidden" name="custNm"  id="custNm" value="${custNm}"/>		<!-- 비회원 이름 -->
		<input type="hidden" name="mobNo"  	id="mobNo" value="${mobNo}"/>		<!-- 비회원 휴대폰 번호 -->
    </form>
    	
	<input type="hidden" id="bpStockYn" />
    <input type="hidden" id="rdcStockYn" />
    <input type="hidden" id="bhfType" />
    <input type="hidden" id="tmsOrdNo" />
    <input type="hidden" id="amPmGbn" />
    <input type="hidden" id="mountCd" />
    <input type="hidden" id="drvThCd" />
    <input type="hidden" id="orgzCd" />
    <input type="hidden" id="nowUseStock" />
    
<script type="text/javascript">
	var moveDate = "present";//present(현재),next(다음달)
	
	function enterSchKey() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			selectJuso();
		}
	}

	
	function fn_noReview(){
		alert("후기작성를 쓰실수 없습니다.(장착완료후 활성화 됩니다.)");
		return false;
	}
	
	function ordrO2oCancel(rcivMthCd, ordNo, patternCd, orderFinAmt,carModelNm){
		$('#ordrIdxx').val(ordNo);
		$('#good_name').val(unescape(patternCd));
		$('#good_mny').val(orderFinAmt);
		$('#good_car_name').val(carModelNm);
		
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
		var url = '/order/processOrdCncl';
		var reqId = 'fnKcpOrderCncl';

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

		//$("#loadingWrap").show();
		ComUtil.loading();
		/* 리퀘스트 함수 */
		AjaxUtil.call(
				url,
				JSON.stringify(sendJson),
				function(result){
					ComUtil.unloading();
			    	console.log('success callback : ' + reqId, result);
			    	cfnRequestSuccessCallback(reqId, result);
				},
				{
					contentType:"application/json;charset=UTF-8",
					dataType:"text",
				    fcb: function (request, status, error) {

						console.log('error callback : ' + reqId, status);
						cfnRequestErrorCallback(reqId, status);
					}
				}
		);
	}

	function fnKcpOrderKkoCncl(){
		var url = '/order/processOrdKkoCncl';
		var reqId = 'fnKcpOrderCncl';

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
					ComUtil.unloading();
			    	console.log('success callback : ' + reqId, result);
			    	cfnRequestSuccessCallback(reqId, result);
				},
				{
					contentType:"application/json;charset=UTF-8",
					dataType:"text",
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
				ComUtil.alert("실패: " + result.Message);
			}else if(callback == "fnKkoOrder"){
				ComUtil.alert("실패: " + result.Message);
			}else if(callback == "fnNpayOrderCncl"){
				ComUtil.alert("실패: " + result.Message);
			}
		}else{
			if(callback == "fnKcpOrderCncl"){
				ComUtil.alert("완료되었습니다.");
			}else if(callback == "fnKkoOrder"){
				$.popModalCenter({
					url       : result,
					scroll    : "yes",
					width     : "940",
					resizable : "yes"
				});
			}else if(callback == "fnNpayOrderCncl"){
				ComUtil.alert("완료되었습니다.");
			}
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
		var url = '/order/processOrdNPayCncl';
		var reqId = 'fnNpayOrderCncl';

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
			alert("진행현황을 조회하실 수 없습니다.");
		}
	}
	
	/* 방문장착 현황 불러오기 */
	function fn_visitCondition(ordNo){
		
		var pUrl = "/mypage/selectVisitCondition";
		var pSendData = {ordNo : ordNo};
			pSendData = JSON.stringify(pSendData);
			//$("#loadingWrap").show();
			ComUtil.loading();
		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	//$("#loadingWrap").hide();
		    	ComUtil.unloading();
		    	fn_createVisitCondition(data);
		    },
		    error: function (e) {
		    	//$("#loadingWrap").hide();
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
			innerHtml += '				<div>';
			innerHtml += '					<button type="button" class="slider-show endTime2">장착 결과 확인</button>';
			innerHtml += '				</div>';
		}
		innerHtml += '			</div>';

		//slider start
		if(data.visitAttFList.length > 0 ){
			innerHtml += '			<div class="store endTime2">';
			innerHtml += '				<div class="swiper-store">';
			
			for(var i=0; i < data.visitAttFList.length; i++) {
				innerHtml += '					<div>';
				innerHtml += '						<a href="#">';
				var imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
				innerHtml += '							<img src="' + imgurl + data.visitAttFList[i].afilePath + '/' + data.visitAttFList[i].regFileNm +'" alt="장착이미지">';
				innerHtml += '							<span>' + data.visitAttFList[i].cmCdNm + '</span>';
				innerHtml += '						</a>';
				innerHtml += '					</div>';
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
	
	function fn_reviewView(pt,gbn,ordn,dpn,itc){
		var frm = document.orderInfoFrm;
			frm.ordNo.value = ordn;
			frm.dpNo.value = dpn;
			frm.patternCd.value = unescape(pt);
			frm.systemGbn.value = gbn;
			frm.itemCd.value = itc;
			
			frm.action = "/mypage/orderRivewView";
			frm.submit();			
	}
	
	var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
	var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수
	
	//변경  팝업이 나타난다. 
	function fn_changeDtPop(ordNo){
		var param = {};
		
		param["ordNo"] = ordNo;
		$("#tmsOrdNo").val(ordNo);
		$("#modal-ChangeDt").addClass("md-show");
		$("#nowIstDt").html($("#reqDtDiv").text()+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +$("#reqDtDiv2").text())
		fn_calcMaxChgDt($("#ordDe").val());
		ComUtil.loading();
		
		$.ajax({
	        type: "post",
	        url: "/mypage/selectChangableDate",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	if(data.rtnCode == "0") {
	        		fn_setDatePicker(data.bpStockYn, data.rdcStockYn, data.hDayList, data.reqDe, data.nowUseStock, data.mountCd);
	        		$("#bpStockYn").val(data.bpStockYn);
	        		$("#rdcStockYn").val(data.rdcStockYn);
	        		$("#mountCd").val(data.mountCd);
	        		if(data.drvProcDueBay > 0){
						$("#drvThCd").val("20");
	        		}	        		
	        		$("#orgzCd").val(data.orgzCd);
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
	function fn_setDatePicker(bpStockYn, rdcStockYn, hDayList, reqDe, nowUseStock, mountCd) {
		//휴일목록
		
		var deleteRdcDtList = [];
		$.each(hDayList, function(idx, item) {
			storechkDay.push(item.hDate);
		});

		//RDC발주를 한경우 RDC발주 선택 가능한 날짜는 요청날짜보다 빠를 수 없다.
		if(nowUseStock == "RDC") {
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
		
		var mDate = bpStockYn == "Y" ? '+0d': bhfLastDay;
		
		/*
		 * 1. 지금 내가 거점재고를 쓰는지 RDC발주를 냈는지 확인한다.
		 * 2. 발주를 낸 경우 거점재고 사용 날짜 범위까지 다가 왔는데 첫 발주날짜 이후라면 재고 체크없이 이후날짜 선택가능.
		 * 수정일 : 2020.08.26
		 */
		if(nowUseStock == "RDC" && bpStockYn == "N") {
			var tdayDt = new Date();
			var tdayStr = chgFormatDate(tdayDt);
			var tdayDtTrs = new Date(tdayStr.substring(0,4),Number(tdayStr.substring(4,6))-1,tdayStr.substring(6,8));
			var orgReqDt = new Date(reqDe.substring(0,4),Number(reqDe.substring(4,6))-1,reqDe.substring(6,8));
			
			var diff = (orgReqDt.getTime() - tdayDtTrs.getTime()) / (1000*60*60*24);
			mDate = '+'+diff+'d';
		}
		
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
	      		
	      		//1013 휴무추가 2020-10-05
	      		storechkDay.push("20201013");

			    for (i = 0; i < storechkDay.length; i++) {
			        if($.inArray((y+""+m+""+d) , storechkDay) != -1) {
			        	if(mountCd == "40" && ((y+""+m+""+d) == "20200930")) {		
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
				//$("#noneInput").show();
				
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
            },
            beforeShow:function(input) {
            	var i_offset= $("#datepicker11").offset(); //클릭된 input의 위치값 체크
            	setTimeout(function(){
                	$('#ui-datepicker-div').css({'top':236});
				});
            }
	    });
		//$('#datepicker11').datepicker( "option" , {minDate: mDate,maxDate: '+13d'} );
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
	
	function chgFormatDate(date, pType){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    
	    if(!ValidUtil.isEmpty(pType))
	    	return  year + '/' + month + '/' + day;
	    else
	    	return  year + '' + month + '' + day;
	}
	
	function getTimeList() {
		//param : 날짜 + 오전,오후 + 해당날짜 거점
		//return : 시간List (어느거점, 어느차 정보 포함)
		//여기서 색칠해야함.
		ComUtil.loading();
		var param = {};
		var pBhfType = "";
		
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
				
				//휴일 중복값 제거
				var delDupStorechkDay = storechkDay.filter(function(item, idx) {
					if(storechkDay.indexOf(item) == idx) return item;
				});
				
				//휴일 목록에 있는지 확인한다.
				var chkHday = 0;
				$.each(delDupStorechkDay, function (idx, item){
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
		
		param["mountDt"] = $("#datepicker11").val();
		param["bhfType"] = pBhfType;
		param["amPmGbn"] = $("#amPmGbn").val();
		param["ordNo"] = $("#tmsOrdNo").val();

	   	$.ajax({
	        type: "post",
	        url: "/mypage/selectChangeTmsSetTime",
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
		
		param["ordNo"] = $("#tmsOrdNo").val();
		param["orgzCd"] = $("#orgzCd").val();
		param["mountDt"] = $("#datepicker11").val().replace(/-/gi, "");
		param["mountCd"] = $("#mountCd").val();
		param["drvThCd"] = $("#drvThCd").val();		
		
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
		
		var currentDate = $("#reqDtDiv").text();	//날짜
		var currentTime = $("#reqDtDiv2").text();	//시간
		
		currentTime2 = currentTime.replace(":","")+"00";
		if(currentTime2 > 000000 && currentTime2 < 115959){
			currentTime = ("오전 "+currentTime);
		}else{
			currentTime = ("오후 "+currentTime);
		}
		
		ComUtil.loading();
		var param = {};
		
		param["istReqDe"] = $("#datepicker11").val().replace(/-/gi, "");
		param["mountDt"] = $("#datepicker11").val();
		param["istDueDe"] = $("#amArea span.on, #pmArea span.on").text().replace(":","")+"00";
		param["currentDate"] = currentDate.replace(/\//gi, ".");		//바뀌기 전 날짜
		param["currentTime"] = currentTime;	//바뀌기 전 시간
		param["carModelNm"]	 = "${carModelNm}";
		
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
		param["drvThCd"] = $("#drvThCd").val();
		
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
				
				//휴일 중복값 제거
				var delDupStorechkDay = storechkDay.filter(function(item, idx) {
					if(storechkDay.indexOf(item) == idx) return item;
				});
				
				//휴일 목록에 있는지 확인한다.
				var chkHday = 0;
				$.each(delDupStorechkDay, function (idx, item){
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
		param["bhfType"] = pBhfType;
		
		$.ajax({
	        type: "post",
	        url: "/mypage/saveIstChangeDt",
	        data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: function (data) {
	        	if(data.rtnCode == '0') {
	        		//$(".layPopClose").click();
	        		$("#modal-ChangeDt").removeClass("md-show");
	        		//$("#reqDtDiv").text(data.rtnDe.substring(0,4)+"/"+data.rtnDe.substring(4,6)+"/"+data.rtnDe.substring(6,8));
	        		//$("#reqDtDiv2").text(data.rtnTime.substring(0,2)+":"+data.rtnTime.substring(2,4));
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
	
	//방문장착 - 오전,오후 선택시
	//장착 서비스 변경 시
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
   		
   		if(!fn_validMaxChgDt($("#datepicker11").val().replace(/-/gi, ""))) {
			ComUtil.alert("주문일 기준 50일 이후로는 일정변경이 불가합니다.");
			return false;
		} else {
			if($("#mountCd").val() == "40") {
				getShopTimeList();//전문점 장착용
			} else {
				getTimeList();
			}
		}
   		
   		//종료예정시간 hidden처리
    	$("#jobEndTimeMsg").css("display","none");
    });
	
	
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
	}
	
	//상세페이지로 이동
	function fn_orderDetail(){			
		var frm = document.orderDetailFrm;
			frm.ordergbn.value = 'O';
			frm.ordNo.value = $("#tmsOrdNo").val();
			frm.action = "/mypage/orderDetail";
			frm.submit();	
	}
	
	//쿠폰페이지로 이동
	function fn_couponPage(){			
		location.href = "/mypage/couponList";
	}
	
	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg mynexen-list'></div>");
		/* page background image End */
		
		//달력 한글화
		$.datepicker.setDefaults($.datepicker.regional["ko"]);
		
		$("#modal-ChangeDt").on("show", function() {
			$("body").addClass("md-modal-open");
		}).on("hidden", function() {
			$("body").removeClass("md-modal-open");
		});
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
	
	function fn_calcMaxChgDt(pOrdDe) {
		var ordDe = new Date(pOrdDe.substring(0,4), Number(pOrdDe.substring(4,6))-1, pOrdDe.substring(6,8));
		
		ordDe.setDate(ordDe.getDate() + 50);
		$("#maxIstDt").text(chgFormatDate(ordDe, "C"));
	}
	
	function fn_validMaxChgDt(pSelectDt) {
		var selcetDt = new Date(pSelectDt.substring(0,4), Number(pSelectDt.substring(4,6))-1, pSelectDt.substring(6,8));
		var ordDt = new Date($("#ordDe").val().substring(0,4), Number($("#ordDe").val().substring(4,6))-1, $("#ordDe").val().substring(6,8));
		
		ordDt.setDate(ordDt.getDate() + 50);
		
		if(selcetDt.getTime() > ordDt.getTime()) {
			return false;
		} else {
			return true;
		}
	}
</script>

