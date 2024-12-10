<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>

	<!--subContentsWrap-->
    <div class="subContentsWrap">
		<main class="order-basket">
			<!-- header -->
			<div class="page-header empty">
	            <h2 class="title-deco">
					<span>탁월한</span> <span>선택!</span>
	            </h2>
	            <div class="page-header-step">
					<img src="../img/order/header_step_01.png" alt="장바구니">
	            </div>
          	</div>
          	<!-- //header -->

			<div class="cart-wrap">
			    <!-- tabs -->
			    <div class="cart-tab tab-nav js-tab layout-r">
					<button type="button" id="buy" data-tab="tab-1" class="current">구매<span>${fn:length(o2oList)}</span></button>
					<button type="button" id="rent" data-tab="tab-2">렌탈<span>${fn:length(freeRenList) + fn:length(nomalRenList) + fn:length(memberRenList)}</span></button>
				</div>
				<!-- tabs -->

				<!-- TAB CONTENTS -->
                <!-- tab01-->
				<div class="cart-tab-contents">
                    <!-- TAB CONTENTS: 구매 -->
              		<section id="tab-1" class="tab-content">
                    	<h3 class="hide">구매</h3>
						<!-- 전체 선택 -->
						<div class="layout-r cart-tab-wrap">
							<div class="cart-tab-allcheck inset-m inline align-middle">
								<input type="checkbox" id="O2oCheckAll" name="O2oCheckAll" value="0" class="type01">
				    			<label for="O2oCheckAll"><span></span>전체선택</label>
				  			</div>
					  		<div class="cart-tab-search pt-m pb-m inline text-right layout-r">
					    		<input type="search" name="searchText" id="searchText" value="${O2osearchText}" placeholder="검색어를 입력하세요" title="구매검색" onkeydown="enterSchKey();">
					    		<!-- <input type="text"   class="type04 w205" placeholder="검색어를 입력하세요" ><a href="javascript:fn_SearchCart(O);" class="searchBtn03"></a> -->
					    		<button type="button" class="" onclick="fn_SearchCart('O');">검색</button>
					  		</div>
						</div>
						<!-- //전체 선택 -->

						<!-- 구매 상품 -->
						<div id="o2oBody">
							<c:choose>
							    <c:when test="${fn:length(o2oList) > 0}">
	    							<c:forEach var="name" items="${o2oList}" varStatus="status">

						                <article class="order-single inset-m layout-c border-bottom" id="cartNumSeq_${name.cartNo}">
											<div class="layout-r same-size">
												<div class="inline check">
													<input type="checkbox" id="basketChk_${name.cartNo}" name="basketChk" value="${name.cartNo}" class="type01" chkGbn="${name.makerNm}@${name.modelNm}" prcPlcNo="${name.prcPlcNo}"  dpPrNo="${name.dpPrNo}" name="basketChk" value="${name.cartNo}" qty="${name.cntCd}" noOrderGbn="${name.noOrderGbn}" ptnNm="${name.patnNm}" itemCd="${name.itemCd}">
													<label for="basketChk_${name.cartNo}"><span></span></label>
												</div>
												<div class="inline text-right">
													<button type="button" class="del" onclick="fn_O2oODel(${name.cartNo});">삭제하기</button>
						                    	</div>
						                  	</div>
						                  	<div class="layout-r same-size">
						                    	<div class="inlnie align-bottom">
						                      		<div class="order-data-photo">
						                        		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${name.thumimg}" alt=""/>
						                      		</div>
						                    	</div>
							                    <div class="inlnie border-bottom order-box">
													<div class="order-data-title">
							                        	<h3>${name.patnNm}</h3>
							                      	</div>
							                      	<div class="order-product-info">
							                        	<ul class="mb-s">
															<li>
																<span>승용차</span><span>${name.seasonCdNm}</span>
																<span>
																	<%-- <c:if test="${fn:contains(name.tireSize, '순정') eq true}">순정</c:if>
		                                                         	<c:if test="${fn:contains(name.tireSize, '호환') eq true}">호환</c:if>
		                                                         	<c:if test="${fn:contains(name.tireSize, '범용') eq true}">범용</c:if> --%>
		                                                         	${name.sectionWidth}/${name.aspectRatio}R${name.wheelInches}
																</span>
															</li>
							                          		<!-- <li>(순정)215/55R17 4P</li> -->
							                          		<c:if test="${name.makerNm != null }">
								                          		<li>
								                          			<span>${name.makerNm}</span>
								                          			<span>${name.modelNm}</span>
								                          		</li>
							                          		</c:if>
							                        	</ul>
							                      	</div>
							                    </div>
											</div>
						                  	<div class="layout-r mt-m mb-m">
						                    	<div class="order-count align-middle">
						                      		<div class="order-count-quantity layout-r" id="basicAmt_${name.cartNo}" bassSaleAmt="${name.bassSaleAmt}" saleAmt="${name.saleAmt}" bassStmemAmt="${name.bassStmemAmt}">
						                        		<button type="button" class="minus align-middle" onclick="fn_minus(${name.cartNo});">삭감</button>
					                        			<span class="circle02 align-middle" id="cndCdSeq_${name.cartNo}">${name.cntCd}</span>
					                        			<button type="button" class="plus align-middle" onclick="fn_plus(${name.cartNo});">추가</button>
						                      		</div>
						                    	</div>

						                    	<div class="order-pay align-middle">
						                      		<div class="layout-c full-width">
						                        		<div class="text-right">구매할인</div>
					                        			<div class="text-right">

						                        			<c:if test="${(name.orderOriAmt * name.cntCd) ne name.orderPayAmt}">
						                          				<del class="price-sale" id="o2oSaleAmt_${name.cartNo}">
		                                                       		<fmt:formatNumber value="${name.orderOriAmt}" pattern="#,###" />
						                          				</del>
		                                                    </c:if>

					                          				<span class="price-actual" id="o2oDisCAmt_${name.cartNo}"><fmt:formatNumber value="${name.orderPayAmt}" pattern="#,###" /></span>
						                      			</div>
						                     		</div>
						                    	</div>
						                  	</div>

						                  <!-- 패키지 할인 추가 2020-01-30 -->
										  <div class="layout-r mb-m">
						                    <div class="order-pay align-middle">
						                      <div class="layout-c full-width" id="pkgArea_${name.cartNo}">
						                      </div>
						                    </div>
						                  </div>

	                                 		<form id="pkg_${name.cartNo}" name="pkg" method="post" >
	                                 			<input type="hidden" name="pkgAmt" id="pkgAmt_${name.cartNo}" /> 		<!-- 패턴코드-->
	                                 			<input type="hidden" name="pkgPlcNo" id="pkgPlcNo_${name.cartNo}" /> 		<!-- 패턴코드-->
	                                 		</form>
						                  <!-- 패키지 할인 추가 2020-01-30 -->


						                  	<div class="text-right">
						                    	<button type="button" class="round btn-gray-dark" onclick="javascript:fn_O2oOder('${name.cartNo}');">바로 주문</button>
						                  	</div>
						                </article>

				                	</c:forEach>
							    </c:when>
							    <c:otherwise>
	                                <!-- noData -->
					                <div class="no-data">
										<div class="text-center inset-xl">
					                    	<img src="../img/common/pop_alert_01.png" alt="">
					                    	<p class="mt-m">장바구니에 담긴 상품이 없습니다.</p>
					                  	</div>
					                </div>
					                <!-- //noData -->
							    </c:otherwise>
							</c:choose>
						</div>
						<!-- 선택삭제 -->
		                <div class="layout-r same-size choice-del">
							<button type="button" class="inline inset-m" onclick="javascript:fn_O2oODelChk();"><span></span>선택삭제</button>
		                </div>
		                <!-- //선택삭제 -->

		                <!-- 버튼 -->
		                <div class="layout-r same-size cart-total">
		                  	<button type="button" class="inline layout-r same-size inset-m">
			                    <span class="inline align-middle text-left">총 구매 예상 금액</span>
			                    <span class="inline text-right" id="o2oTotAmt" onclick="javascript:fn_O2oOderAll();"></span>
		                  	</button>
		                </div>
		                <!-- //버튼 -->
                    </section>
                	<!-- //TAB CONTENTS: 구매 -->

					<!-- TAB CONTENTS: 렌탈 -->
					<section id="tab-2" class="tab-content">
						<h3 class="hide">렌탈</h3>

						<!-- 전체 선택 -->
						<div class="layout-r cart-tab-wrap">
						  	<div class="cart-tab-allcheck inset-m inline align-middle">
						    	<input type="checkbox" id="RentalCheckAll" name="" value="0" class="type01">
						    	<label for="RentalCheckAll"><span></span>전체선택</label>
						  	</div>
						  	<div class="cart-tab-search pt-m pb-m inline text-right layout-r">
						    	<input type="search" name="searchTxtRental" id="searchTxtRental" placeholder="검색어를 입력하세요" title="렌탈검색" value="${RentalsearchText}" onkeydown="enterSchKey();">
						    	<button type="button" class="" onclick="javascript:fn_SearchCart('R');">검색</button>
						  	</div>
						</div>
						<!-- //전체 선택 -->

						<c:choose>
				    		<c:when test="${fn:length(freeRenList) > 0 or fn:length(nomalRenList) > 0 or fn:length(memberRenList) > 0}">
	                            <!-- 자유렌탈 리스트 먼저 보여준다. -->
	                            <c:if test="${fn:length(freeRenList) > 0}">
	    							<c:forEach var="name" items="${freeRenList}" varStatus="status">
	    								<form id="formfree${status.index}" name="formfree${status.index}" method="post" >
											<input type="hidden" name="patternCd"    value="${name.patternCd}" /> 		<!-- 패턴코드-->
											<input type="hidden" name="petternCd"    value="${name.patternCd}" /> 		<!-- 패턴코드 이건 왜 이렇게 해놔가지고 ㅠㅠ-->
											<input type="hidden" name="matCd"        value="${name.matCd}" />   		<!-- 상품코드-->
											<input type="hidden" name="makerCd"      value="${name.makerCd}" />   		<!-- 제조사코드-->
											<input type="hidden" name="makerCdNm"    value="${name.makerCdNm}" />   	<!-- 제조사명-->
											<input type="hidden" name="modelCd"      value="${name.modelCd}" />   		<!-- 차종코드-->
											<input type="hidden" name="carNumber"    value="${name.carNumber}" />       <!--차량번호-->
											<input type="hidden" name="contentsCd"   value="${name.contentsCd}" />   	<!-- 사양코드-->
											<input type="hidden" name="modelCdNm"    value="${name.mcNm}" />   			<!-- 차종코드명-->
											<input type="hidden" name="frCd"         value="${name.frCd}" />   			<!-- 전후구분코드-->
											<input type="hidden" name="dispSize"     value="${name.dispSize}" />   		<!-- 사이즈-->
											<input type="hidden" name="sectionWidth" value="${name.sectionWidth}" />   	<!-- 단면폭-->
											<input type="hidden" name="aspectRatio"  value="${name.aspectRatio}" />   	<!-- 편평비-->
											<input type="hidden" name="wheelInches"  value="${name.wheelInches}" />   	<!-- 휠인치-->
											<input type="hidden" name="cntCdNm"      value="${name.cntCdNm}" />   		<!-- 수량코드명-->
											<input type="hidden" name="periodCdNm"   value="${name.periodCdNm}" />   	<!-- 기간코드명-->
											<input type="hidden" name="regiCdAmt"    value="${name.regiCdAmt}" />   	<!-- 등록비금액-->
											<input type="hidden" name="regiCd"    	 value="${name.regiCd}" />   		<!-- 등록비코드-->
											<input type="hidden" name="rentalAmt"    value="${name.rentalAmt}" />   	<!-- 월렌탈금액-->
											<input type="hidden" name="ordListImg"   value="${name.atflPathNm}" />      <!-- 주문상품 썸네일 이미지 -->
											<input type="hidden" name="classCd"      value="${name.classCd}" />
											<input type="hidden" name="seasonCd"     value="${name.seasonCd}" />
											<input type="hidden" name="seasonCdNm"   value="${name.seasonCdNm}" />
											<input type="hidden" name="safeKey"      value="${clientVo.safeKey}" />
											<input type="hidden" name="periodCd"     value="${name.periodCd}" />
											<input type="hidden" name="saleCd"       value="${name.saleCd}" />
											<input type="hidden" name="limitCnt"     value="${name.limitCnt}" />		<!-- 2+2 타이어 제한갯수 -->
											<input type="hidden" name="cntCd"    	 value="${name.cntCd}" />			<!-- 수량코드 -->
											<input type="hidden" name="saleNm"    	 value="${name.saleNm}" />			<!-- 수량코드 -->
											<input type="hidden" name="plyRating"    value="${name.plyRating}"/>
											<input type="hidden" name="itemNo"       value="${name.itemNo}" />
											<input type="hidden" name="oeYn"       	 value="${name.oeYn}" />
											<input type="hidden" name="pageGbn"  	 id="pageGbn"    value="C"/>	 	<!--  페이지 구분(주문에 넘어갈때 확인) 	 -->
										</form>

										<!-- 구매 상품 -->
										<article class="order-single inset-m layout-c" id="freeList_${status.index}">
										  	<div class="layout-r same-size">
										    	<div class="inline check">
										      		<input type="checkbox" id="freeBasket_${status.index}" name="Basket" value="${status.index}" class="type01">
										      		<label for="freeBasket_${status.index}"><span></span></label>
										    	</div>
										    	<div class="inline text-right">
										      		<button type="button" class="del" onclick="javascript:fn_rentalDelete(${name.itemNo},'free', ${status.index});">삭제하기</button>
										    	</div>
										  	</div>

										  	<div class="layout-r same-size">
										  		<div class="inlnie align-bottom">
										      		<div class="order-data-photo">
										        		<!-- <img src="../img/product/product_thum_01.png" alt=""> -->
										        		<%-- <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atprdfile_cms/${name.atflPathNm}" alt="${name.atflNm}"> --%>
										        		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${name.atflPathNm}" alt="${name.atflNm}">
										      		</div>
										    	</div>
										    	<div class="inlnie border-bottom order-box">
										      		<div class="order-data-title">
										        		<h3>${name.patternCd}</h3>
										      		</div>
										      		<div class="order-product-info">
										        		<ul class="mb-s">
												        	<li>
												        		<c:if test="${name.classCd eq 'P1'}">
												        			<span>승용차</span>
												        		</c:if>
												        		<c:if test="${name.classCd eq 'S1'}">
												        			<span>SUV</span>
												        		</c:if>
												        		<span>${name.seasonCdNm}</span>
												        		<c:if test="${name.oeYn eq 'Y'}">
												        			<span>순정</span>
												        		</c:if>
												        		<c:if test="${name.oeYn eq 'N'}">
												        			<span>호환</span>
												        		</c:if>
												        	</li>
												          	<li>${name.dispSize}</li>
												          	<li>
												          		<span>${name.makerCdNm}</span>
												          		<span>${name.mcNm}</span>
												          	</li>
										        		</ul>
										        		<div class="rental">
                                                        	<span>[ ${name.saleNm} ]</span>
                                                        </div>
										      		</div>
										    	</div>
										  	</div>

										  	<div class="layout-c mt-m">
										    	<div class="layout-r order-rent">
										      		<div class="order-count align-middle">
										        		<span>${name.cntCd}</span>
										      		</div>
										      		<div class="order-rent-info">
										        		<dl class="layout-r">
										          			<dt>렌탈기간</dt>
										          			<dd>월 렌탈료</dd>
										          			<dd name="rentalMonthAmt"><fmt:formatNumber value="${name.rentalAmt}" pattern="#,###" /></dd>
										        		</dl>
										        		<dl class="layout-r">
										          			<dt><b>${name.periodCd}개월</b></dt>
										          			<dd>렌탈 등록비</dd>
										          			<dd><fmt:formatNumber value="${name.regiCdAmt}" pattern="#,###" /></dd>
										        		</dl>
										      		</div>
										    	</div>
										  	</div>

										  	<div class="text-right mt-s">
										    	<button type="button" class="round btn-gray-light mr-ss" onclick="javascript:fn_optionUpdate(${status.index},'free');">옵션 변경</button>
										    	<button type="button" class="round btn-gray-dark" onclick="javascript:check_credit(${name.itemNo},'free', ${status.index});">바로 주문</button>
										  	</div>
										</article>
										<!-- //구매 상품 -->
									</c:forEach>
	                            </c:if>
	                            <!-- 자유렌탈 리스트 끝 -->

	                        	<!-- 일반 렌탈 리스트 보여준다. -->
                            	<c:if test="${fn:length(nomalRenList) > 0}">
    								<c:forEach var="name" items="${nomalRenList}" varStatus="status">
										<form id="formNomal${status.index}" name="formNomal${status.index}" method="post" >
											<input type="hidden" name="patternCd"    value="${name.patternCd}" /> 		<!-- 패턴코드-->
											<input type="hidden" name="petternCd"    value="${name.patternCd}" /> 		<!-- 패턴코드 이건 왜 이렇게 해놔가지고 ㅠㅠ-->
											<input type="hidden" name="matCd"        value="${name.matCd}" />   		<!-- 상품코드-->
											<input type="hidden" name="makerCd"      value="${name.makerCd}" />   		<!-- 제조사코드-->
											<input type="hidden" name="makerCdNm"    value="${name.makerCdNm}" />   	<!-- 제조사명-->
											<input type="hidden" name="modelCd"      value="${name.modelCd}" />   		<!-- 차종코드-->
											<input type="hidden" name="carNumber"    value="${name.carNumber}" />       <!--차량번호-->
											<input type="hidden" name="contentsCd"   value="${name.contentsCd}" />   	<!-- 사양코드-->
											<input type="hidden" name="modelCdNm"    value="${name.mcNm}" />   			<!-- 차종코드명-->
											<input type="hidden" name="frCd"         value="${name.frCd}" />   			<!-- 전후구분코드-->
											<input type="hidden" name="dispSize"     value="${name.dispSize}" />   		<!-- 사이즈-->
											<input type="hidden" name="sectionWidth" value="${name.sectionWidth}" />   	<!-- 단면폭-->
											<input type="hidden" name="aspectRatio"  value="${name.aspectRatio}" />   	<!-- 편평비-->
											<input type="hidden" name="wheelInches"  value="${name.wheelInches}" />   	<!-- 휠인치-->
											<input type="hidden" name="cntCdNm"      value="${name.cntCdNm}" />   		<!-- 수량코드명-->
											<input type="hidden" name="periodCdNm"   value="${name.periodCdNm}" />   	<!-- 기간코드명-->
											<input type="hidden" name="regiCdAmt"    value="${name.regiCdAmt}" />   	<!-- 등록비금액-->
											<input type="hidden" name="regiCd"    	 value="${name.regiCd}" />   		<!-- 등록비코드-->
											<input type="hidden" name="rentalAmt"    value="${name.rentalAmt}" />   	<!-- 월렌탈금액-->
											<input type="hidden" name="ordListImg"   value="${name.atflPathNm}" />      <!-- 주문상품 썸네일 이미지 -->
											<input type="hidden" name="classCd"      value="${name.classCd}" />
											<input type="hidden" name="seasonCd"     value="${name.seasonCd}" />
											<input type="hidden" name="seasonCdNm"   value="${name.seasonCdNm}" />
											<input type="hidden" name="safeKey"      value="${clientVo.safeKey}" />
											<input type="hidden" name="periodCd"     value="${name.periodCd}" />
											<input type="hidden" name="saleCd"       value="${name.saleCd}" />
											<input type="hidden" name="limitCnt"     value="${name.limitCnt}" />		<!-- 2+2 타이어 제한갯수 -->
											<input type="hidden" name="cntCd"    	 value="${name.cntCd}" />			<!-- 수량코드 -->
											<input type="hidden" name="saleNm"    	 value="${name.saleNm}" />			<!-- 수량코드 -->
											<input type="hidden" name="plyRating"    value="${name.plyRating}"/>
											<input type="hidden" name="itemNo"       value="${name.itemNo}" />
											<input type="hidden" name="oeYn"       	 value="${name.oeYn}" />
											<input type="hidden" name="pageGbn"  	 id="pageGbn"    value="C"/>	 	<!--  페이지 구분(주문에 넘어갈때 확인) 	 -->
										</form>

										<!-- 구매 상품 -->
										<article class="order-single inset-m layout-c" id="nomalList_${status.index}">
										  	<div class="layout-r same-size">
										    	<div class="inline check">
										      		<input type="checkbox" id="nomalBasket_${status.index}" name="Basket" value="${status.index}" class="type01">
										      		<label for="nomalBasket_${status.index}"><span></span></label>
										    	</div>
										    	<div class="inline text-right">
										      		<button type="button" class="del" onclick="javascript:fn_rentalDelete(${name.itemNo},'nomal', ${status.index});">삭제하기</button>
										    	</div>
										  	</div>

										  	<div class="layout-r same-size">
										  		<div class="inlnie align-bottom">
										      		<div class="order-data-photo">
										        		<!-- <img src="../img/product/product_thum_01.png" alt=""> -->
										        		<%-- <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atprdfile_cms/${name.atflPathNm}" alt="${name.atflNm}"> --%>
										        		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${name.atflPathNm}" alt="${name.atflNm}">
										      		</div>
										    	</div>
										    	<div class="inlnie border-bottom order-box">
										      		<div class="order-data-title">
										        		<h3>${name.patternCd}</h3>
										      		</div>
										      		<div class="order-product-info">
										        		<ul class="mb-s">
												        	<li>
												        		<c:if test="${name.classCd eq 'P1'}">
												        			<span>승용차</span>
												        		</c:if>
												        		<c:if test="${name.classCd eq 'S1'}">
												        			<span>SUV</span>
												        		</c:if>
												        		<span>${name.seasonCdNm}</span>
												        		<c:if test="${name.oeYn eq 'Y'}">
												        			<span>순정</span>
												        		</c:if>
												        		<c:if test="${name.oeYn eq 'N'}">
												        			<span>호환</span>
												        		</c:if>
												        	</li>
												          	<li>${name.dispSize}</li>
												          	<li>
												          		<span>${name.makerCdNm}</span>
												          		<span>${name.mcNm}</span>
												          	</li>
										        		</ul>
										        		<div class="rental">
                                                        	<span>[ ${name.saleNm} ]</span>
                                                        </div>
										      		</div>
										    	</div>
										  	</div>

										  	<div class="layout-c mt-m">
										    	<div class="layout-r order-rent">
										      		<div class="order-count align-middle">
										        		<span>${name.cntCd}</span>
										      		</div>
										      		<div class="order-rent-info">
										        		<dl class="layout-r">
										          			<dt>렌탈기간</dt>
										          			<dd>월 렌탈료</dd>
										          			<dd name="rentalMonthAmt"><fmt:formatNumber value="${name.rentalAmt}" pattern="#,###" /></dd>
										        		</dl>
										        		<dl class="layout-r">
										          			<dt><b>${name.periodCd}개월</b></dt>
										          			<dd>렌탈 등록비</dd>
										          			<dd><fmt:formatNumber value="${name.regiCdAmt}" pattern="#,###" /></dd>
										        		</dl>
										      		</div>
										    	</div>
										  	</div>

										  	<div class="text-right mt-s">
										    	<button type="button" class="round btn-gray-light mr-ss" onclick="javascript:fn_optionUpdate(${status.index},'nomal');">옵션 변경</button>
										    	<button type="button" class="round btn-gray-dark" onclick="javascript:check_credit(${name.itemNo},'nomal' , ${status.index});">바로 주문</button>
										  	</div>
										</article>
										<!-- //구매 상품 -->
									</c:forEach>
	                            </c:if>
                            	<!-- 일반렌탈 리스트 끝 -->

                            	<!-- 멤버십 렌탈 리스트 보여준다. -->
                            	<c:if test="${fn:length(memberRenList) > 0}">
    								<c:forEach var="name" items="${memberRenList}" varStatus="status">
										<form id="membership${status.index}" name="membership${status.index}" method="post" >
											<input type="hidden" name="patternCd"    value="${name.patternCd}" /> 		<!-- 패턴코드-->
											<input type="hidden" name="petternCd"    value="${name.patternCd}" /> 		<!-- 패턴코드 이건 왜 이렇게 해놔가지고 ㅠㅠ-->
											<input type="hidden" name="matCd"        value="${name.matCd}" />   		<!-- 상품코드-->
											<input type="hidden" name="makerCd"      value="${name.makerCd}" />   		<!-- 제조사코드-->
											<input type="hidden" name="makerCdNm"    value="${name.makerCdNm}" />   	<!-- 제조사명-->
											<input type="hidden" name="modelCd"      value="${name.modelCd}" />   		<!-- 차종코드-->
											<input type="hidden" name="carNumber"    value="${name.carNumber}" />       <!--차량번호-->
											<input type="hidden" name="contentsCd"   value="${name.contentsCd}" />   	<!-- 사양코드-->
											<input type="hidden" name="modelCdNm"    value="${name.mcNm}" />   			<!-- 차종코드명-->
											<input type="hidden" name="frCd"         value="${name.frCd}" />   			<!-- 전후구분코드-->
											<input type="hidden" name="dispSize"     value="${name.dispSize}" />   		<!-- 사이즈-->
											<input type="hidden" name="sectionWidth" value="${name.sectionWidth}" />   	<!-- 단면폭-->
											<input type="hidden" name="aspectRatio"  value="${name.aspectRatio}" />   	<!-- 편평비-->
											<input type="hidden" name="wheelInches"  value="${name.wheelInches}" />   	<!-- 휠인치-->
											<input type="hidden" name="cntCdNm"      value="${name.cntCdNm}" />   		<!-- 수량코드명-->
											<input type="hidden" name="periodCdNm"   value="${name.periodCdNm}" />   	<!-- 기간코드명-->
											<input type="hidden" name="regiCdAmt"    value="${name.regiCdAmt}" />   	<!-- 등록비금액-->
											<input type="hidden" name="regiCd"    	 value="${name.regiCd}" />   		<!-- 등록비코드-->
											<input type="hidden" name="rentalAmt"    value="${name.rentalAmt}" />   	<!-- 월렌탈금액-->
											<input type="hidden" name="ordListImg"   value="${name.atflPathNm}" />      <!-- 주문상품 썸네일 이미지 -->
											<input type="hidden" name="classCd"      value="${name.classCd}" />
											<input type="hidden" name="seasonCd"     value="${name.seasonCd}" />
											<input type="hidden" name="seasonCdNm"   value="${name.seasonCdNm}" />
											<input type="hidden" name="safeKey"      value="${clientVo.safeKey}" />
											<input type="hidden" name="periodCd"     value="${name.periodCd}" />
											<input type="hidden" name="saleCd"       value="${name.saleCd}" />
											<input type="hidden" name="limitCnt"     value="${name.limitCnt}" />		<!-- 2+2 타이어 제한갯수 -->
											<input type="hidden" name="cntCd"    	 value="${name.cntCd}" />			<!-- 수량코드 -->
											<input type="hidden" name="saleNm"    	 value="${name.saleNm}" />			<!-- 수량코드 -->
											<input type="hidden" name="plyRating"    />
											<input type="hidden" name="itemNo"        value="${name.itemNo}" />
											<input type="hidden" name="oeYn"       	 value="${name.oeYn}" />
											<input type="hidden" name="pageGbn"  	 id="pageGbn"    value="C"/> 		<!--  페이지 구분(주문에 넘어갈때 확인) 	 -->
										</form>

										<!-- 구매 상품 -->
										<article class="order-single inset-m layout-c" id="memberList_${status.index}">
										  	<div class="layout-r same-size">
										    	<div class="inline check">
										      		<input type="checkbox" id="memberBasket_${status.index}" name="Basket" value="${status.index}" class="type01">
										      		<label for="memberBasket_${status.index}"><span></span></label>
										    	</div>
										    	<div class="inline text-right">
										      		<button type="button" class="del" onclick="javascript:fn_rentalDelete(${name.itemNo},'member', ${status.index});">삭제하기</button>
										    	</div>
										  	</div>

										  	<div class="layout-r same-size">
										  		<div class="inlnie align-bottom">
										      		<div class="order-data-photo">
										        		<!-- <img src="../img/product/product_thum_01.png" alt=""> -->
										        		<%-- <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atprdfile_cms/${name.atflPathNm}" alt="${name.atflNm}"> --%>
										        		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${name.atflPathNm}" alt="${name.atflNm}">
										      		</div>
										    	</div>
										    	<div class="inlnie border-bottom order-box">
										      		<div class="order-data-title">
										        		<h3>${name.patternCd}</h3>
										      		</div>
										      		<div class="order-product-info">
										        		<ul class="mb-s">
												        	<li>
												        		<c:if test="${name.classCd eq 'P1'}">
												        			<span>승용차</span>
												        		</c:if>
												        		<c:if test="${name.classCd eq 'S1'}">
												        			<span>SUV</span>
												        		</c:if>
												        		<span>${name.seasonCdNm}</span>
												        		<c:if test="${name.oeYn eq 'Y'}">
												        			<span>순정</span>
												        		</c:if>
												        		<c:if test="${name.oeYn eq 'N'}">
												        			<span>호환</span>
												        		</c:if>
												        	</li>
												          	<li>${name.dispSize}</li>
												          	<li>
												          		<span>${name.makerCdNm}</span>
												          		<span>${name.mcNm}</span>
												          	</li>
										        		</ul>
										        		<div class="rental">
                                                        	<span>[ ${name.saleNm} ]</span>
                                                        </div>
										      		</div>
										    	</div>
										  	</div>

										  	<div class="layout-c mt-m">
										    	<div class="layout-r order-rent">
										      		<div class="order-count align-middle">
										        		<span>${name.cntCd}</span>
										      		</div>
										      		<div class="order-rent-info">
										        		<dl class="layout-r">
										          			<dt>렌탈기간</dt>
										          			<dd>월 렌탈료</dd>
										          			<dd name="rentalMonthAmt"><fmt:formatNumber value="${name.rentalAmt}" pattern="#,###" /></dd>
										        		</dl>
										        		<dl class="layout-r">
										          			<dt><b>${name.periodCd}개월</b></dt>
										          			<dd>렌탈 등록비</dd>
										          			<dd><fmt:formatNumber value="${name.regiCdAmt}" pattern="#,###" /></dd>
										        		</dl>
										      		</div>
										    	</div>
										  	</div>

										  	<div class="text-right mt-s">
										    	<button type="button" class="round btn-gray-light mr-ss" onclick="javascript:fn_optionUpdate(${status.index},'member');">옵션 변경</button>
										    	<button type="button" class="round btn-gray-dark" onclick="javascript:check_credit(${name.itemNo},'member', ${status.index});">바로 주문</button>
										  	</div>
										</article>
										<!-- //구매 상품 -->
									</c:forEach>
                            	</c:if>
                            	<!-- 멤버십렌탈 리스트 끝 -->
				    		</c:when>
						    <c:otherwise>
		                        <!-- noData -->
								<div class="no-data">
								  	<div class="text-center inset-xl">
								    	<img src="../img/common/pop_alert_01.png" alt="">
								    	<p class="mt-m">장바구니에 담긴 상품이 없습니다.</p>
								  	</div>
								</div>
								<!-- //noData -->
						    </c:otherwise>
						</c:choose>

						<!-- 선택삭제 -->
						<div class="layout-r same-size choice-del">
						  <button type="button" class="inline inset-m" onclick="javascript:fn_rentalDeleteChk();"><span></span>선택삭제</button>
						</div>
						<!-- //선택삭제 -->

						<!-- 버튼 -->
						<!-- PC에서도 렌탈 일괄 주문은 존재하지 않음. MEPARK -->
						<!-- <div class="layout-c same-size cart-total">
						  	<div class="rent-cart-total layout-c inset-m">
						    	<small class="stack mb-xs">※ 렌탈 등록비는 익월 렌탈료와 함께 청구됩니다.</small>
						    	<div class="stack layout-r same-size mb-xs">
						      		<span class="inline text-left">총 건수</span>
						      		<span class="inline text-right">2건</span>
						    	</div>
							    <div class="stack layout-r same-size">
							      	<span class="inline text-left">총 예상 렌탈 등록비</span>
							      	<span class="inline text-right" id="rentalTotRegAmt"></span>
							    </div>
						  	</div>

						  	<button type="button" class="inline layout-r same-size inset-m">
						    	<span class="inline align-middle text-left">월 예상 렌탈료</span>
						    	<span class="inline text-right" id="rentalMonthTotAmt" onclick="javascript:fn_rentalOderAll();"></span>
						  	</button>
						</div> -->
						<!-- //버튼 -->
					</section>
					<!-- //TAB CONTENTS: 렌탈 -->
				</div>
			</div>
			<!-- 장바구니 Tab-->
		</main>
	</div>
	<!--subContentsWrap-->

	<div class="md-overlay"></div>

	<form id="cartFrm" name="cartFrm" method="post" >
		<input type="hidden" name="cartNo"  			id="cartNo"  value=""/>  			<!--  장바구니 번호 	 -->
		<input type="hidden" name="O2osearchText"  	  	id="O2osearchText"  value=""/>  	<!--  구매 검색값  -->
		<input type="hidden" name="RentalsearchText"  	id="RentalsearchText"  value=""/>  	<!--  렌탈 검색값 -->
		<input type="hidden" name="tabGbn"  			id="tabGbn"  value="O"/>  			<!--  tab구분 기본 구매탭  -->
		<input type="hidden" name="cartNoArr" />
		<input type="hidden" name="pageGbn"  	 id="pageGbn"    value="C"			 	/> 	<!--  페이지 구분(주문에 넘어갈때 확인) 	 -->
		<input type="hidden" name="pkgAmtOne"  	 id="pkgAmtOne"  value="0"				/> 	<!--  페이지 구분(주문에 넘어갈때 확인) 	 -->
	</form>

	<!-- ************************ 옵션수정 레이어 ************************ -->
		<%-- <%@ include file="/WEB-INF/view/cart/cartUpdatePop.jsp" %> --%>
	<!-- ************************ /옵션수정 레이어 ************************ -->

	<!-- 렌탈옵션 수정하기 -->
	<div class="fullPopup md-modal-3 md-effect-1" id="modal-5">
  		<div class="popContents">
    		<a href="javascript:closeCarSearch('5');" class="layPopClose md-close"></a>
    		<header>
      			<h2>렌탈옵션 수정하기</h2>
    		</header>

    		<!--contents-->
    		<div class="popup-contents">
      			<div class="inset-ml">
        			<h3 class="rental-option-title" id="popSaleName"></h3>
        			<div class="inlnie order-box">
          				<div class="order-data-title">
            				<h4 id="popPatternCd"></h4>
          				</div>
          				<div class="order-product-info">
            				<ul class="mb-s">
              					<li><span id="popClassCd"></span>
              						<span id="popSeasonCdNm"></span>
              						<span id="popOeYn"></span>
              					</li>
              					<li>
              						<span id="popMakerCdNm"></span>
              						<span id="popMcNm"></span>
              					</li>
            				</ul>
          				</div>
        			</div>

        			<div class="rent-default">
          				<!-- 렌탈수량 -->
          				<div class="select-outer">
            				<div class="select-design">
              					<div class="select-title-wrap">
                					<label for="rentalBonQty" class="select-title"><b>렌탈수량</b></label>
              					</div>
            				</div>
            				<div>
              					<select id="rentalBonQty" data-select="rentalBonQty" onchange="setSelValue('qty',this);"></select>
            				</div>
          				</div>

          				<!-- 렌탈기간 -->
          				<div class="select-outer layout-r">
            				<div class="select-title-wrap">
              					<label for="rentalMonth" class="select-title"><b>렌탈기간</b></label>
            				</div>
           					<select id="rentalMonth" data-select="rentalMonth" onchange="setSelValue('perd',this);"></select>
          				</div>

          				<!-- 렌탈등록비 -->
          				<div class="select-outer layout-r">
            				<div class="select-title-wrap">
              					<label for="rentalregAmt" class="select-title"><b>렌탈등록비</b></label>
            				</div>
            				<select id="rentalregAmt" data-select="rentalregAmt" onchange="setSelValue('fee',this);"></select>
          				</div>
        			</div>

        			<h3 class="rental-option-title">서비스</h3>

        			<!-- 일반추천렌탈 서비스  옵션 영역 -->
        			<div class="select-group" id="nomalService">
          				<!-- 타이어 무상 교체 -->
          				<div class="select-outer">
            				<div class="select-design">
              					<div class="select-title-wrap">
                					<label for="tireFreeNs" class="select-title"><b>타이어 무상 교체</b></label>
                					<div class="select-tip">
                  						<button type="button" class="small-tip">tip</button>
                					</div>
              					</div>
					              <span class="select-insert" id="tireFreeN">1</span>
					              <span class="quantity-unit">본</span>
            				</div>
            				<div>
              					<select id="tireFreeNs"></select>
            				</div>
          				</div>
          				<!-- //타이어 무상 교체 -->

			        	<!-- 엔진오일 교체 -->
			        	<div class="select-outer">
			        		<div class="select-design">
			            		<div class="select-title-wrap">
			                		<label for="engChangNs" class="select-title"><b>엔진오일 교체</b></label>
			                		<div class="select-tip">
				                  		<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
					              <span class="select-insert" id="engChangN">1</span>
					              <span class="quantity-unit">본</span>
			            	</div>
			            	<div>
			              		<select id="engChangNs"></select>
			            	</div>
			          	</div>
			          	<!-- //엔진오일 교체 -->

			          	<!-- 무상 얼라이먼트 -->
			          	<div class="select-outer">
			            	<div class="select-design">
			              		<div class="select-title-wrap">
			                		<label for="freeArNs" class="select-title"><b>무상 얼라이먼트</b></label>
			                		<div class="select-tip">
			                  			<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
					              <span class="select-insert" id="freeArN">1</span>
					              <span class="quantity-unit">본</span>
			            	</div>
			            	<div>
			              		<select id="freeArNs"></select>
			            	</div>
			          	</div>
			          	<!-- //무상 얼라이먼트 -->

			          	<!-- 무상 위치교환 -->
			          	<div class="select-outer">
			            	<div class="select-design">
			              		<div class="select-title-wrap">
			                		<label for="freeLocatNs" class="select-title"><b>무상 위치교환</b></label>
			                		<div class="select-tip">
			                  			<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
					              <span class="select-insert" id="freeLocatN">1</span>
					              <span class="quantity-unit">본</span>
			            	</div>
			            	<div>
			              		<select id="freeLocatNs"></select>
			            	</div>
			          	</div>
			          	<!-- //무상 위치교환 -->

			          	<!-- 방문점검 -->
			          	<div class="select-outer">
			            	<div class="select-design">
			              		<div class="select-title-wrap">
			                		<label for="visitNs" class="select-title"><b>방문점검</b></label>
			                		<div class="select-tip">
			                  			<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
					              <span class="select-insert" id="visitN">1</span>
					              <span class="quantity-unit">본</span>
			            	</div>
			            	<div>
			              		<select id="visitNs"></select>
			            	</div>
			          	</div>
					</div>



					<!-- 자유렌탈 서비스  옵션 영역 -->
					<!-- 자유렌탈 서비스  옵션 영역 -->
        			<!-- 자유렌탈 서비스  옵션 영역 -->
        			<!-- 자유렌탈 서비스  옵션 영역 -->
        			<div class="select-group" id="freeService">
          				<!-- 타이어 무상 교체 -->
          				<div class="select-outer">
            				<div class="select-design">
              					<div class="select-title-wrap">
                					<label for="tireFreeF" class="select-title"><b>타이어 무상 교체</b></label>
                					<div class="select-tip">
                  						<button type="button" class="small-tip">tip</button>
                					</div>
              					</div>
            				</div>
            				<div>
              					<select id="tireFreeF" data-select="tireFreeF" onchange="setSelCode('B00007',this);"></select>
            				</div>
          				</div>
          				<!-- //타이어 무상 교체 -->

			        	<!-- 엔진오일 교체 -->
			        	<div class="select-outer">
			        		<div class="select-design">
			            		<div class="select-title-wrap">
			                		<label for="engChangF" class="select-title"><b>엔진오일 교체</b></label>
			                		<div class="select-tip">
				                  		<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
			            	</div>
			            	<div>
			              		<select id="engChangF" data-select="engChangF" onchange="setSelCode('B00001',this);"></select>
			            	</div>
			          	</div>
			          	<!-- //엔진오일 교체 -->

			          	<!-- 무상 얼라이먼트 -->
			          	<div class="select-outer">
			            	<div class="select-design">
			              		<div class="select-title-wrap">
			                		<label for="freeArF" class="select-title"><b>무상 얼라이먼트</b></label>
			                		<div class="select-tip">
			                  			<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
			            	</div>
			            	<div>
			              		<select id="freeArF" data-select="freeArF" onchange="setSelCode('B00008',this);"></select>
			            	</div>
			          	</div>
			          	<!-- //무상 얼라이먼트 -->

			          	<!-- 무상 위치교환 -->
			          	<div class="select-outer">
			            	<div class="select-design">
			              		<div class="select-title-wrap">
			                		<label for="freeLocatF" class="select-title"><b>무상 위치교환</b></label>
			                		<div class="select-tip">
			                  			<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
			            	</div>
			            	<div>
			              		<select id="freeLocatF" data-select="freeLocatF" onchange="setSelCode('B00002',this);"></select>
			            	</div>
			          	</div>
			          	<!-- //무상 위치교환 -->

			          	<!-- 방문점검 -->
			          	<div class="select-outer">
			            	<div class="select-design">
			              		<div class="select-title-wrap">
			                		<label for="visitF" class="select-title"><b>방문점검</b></label>
			                		<div class="select-tip">
			                  			<button type="button" class="small-tip">tip</button>
			                		</div>
			              		</div>
			            	</div>
			            	<div>
			              		<select id="visitF" data-select="visitF" onchange="setSelCode('B00003',this);"></select>
			            	</div>
			          	</div>
					</div>






			        <!-- #################################################### -->
			        <p class="small font-gray">※ 렌탈등록비 및 렌탈료는 장착 후 익월부터 청구됩니다.</p>
			        <!-- //렌탈 옵션 영역 -->
				</div>
			</div>
		</div>
		<!--contents-->
		<div class="btnArea layout-r bottom-box same-size">
    		<button type="button" class="inline btn-gray-light" onclick="javascript:closeCarSearch('5');">취소</button>
    		<button type="button" class="inline btn-primary" onclick="javascript:fn_updateCart();">적용</button>
  		</div>
	</div>
    <!-- //렌탈옵션 수정하기 -->

	<form id="cartPopFrm" name="cartPopFrm" method="post" >
		<input type="hidden" name="periodCd"     id="periodCd"  	value="" />
		<input type="hidden" name="cntCd"        id="cntCd"  		value="" />
		<input type="hidden" name="saleCd"       id="saleCd"  		value="" />
		<input type="hidden" name="rentalINdex"  id="rentalINdex"  	value="" />
		<input type="hidden" name="rentalGbn"  	 id="rentalGbn"  	value="" />
		<input type="hidden" name="regiCdAmt"  	 id="regiCdAmt"  	value="" />
		<input type="hidden" name="selEnginCd" 						value=""/><!-- 선택한 엔진오일서비스 코드, 가격 -->
		<input type="hidden" name="selLocCd" 						value=""/><!-- 선택한 위치교환서비스 코드, 가격 -->
		<input type="hidden" name="selVisCd" 						value=""/><!-- 선택한 방문점검 코드, 가격 -->
		<input type="hidden" name="selSaveCd" 						value=""/><!-- 선택한 보관 코드, 가격 -->
		<input type="hidden" name="selTcCd" 						value=""/><!-- 선택한 타이어 교체 서비스 코드, 가격 -->
		<input type="hidden" name="selPrCd" 						value=""/><!-- 선택한 프리미엄(사계절보증제도) 코드, 가격 -->
		<input type="hidden" name="selArCd" 						value=""/><!-- 선택한 얼라인먼트 코드, 가격 -->
    </form>

	<input type="hidden" name="safeKeyNew" id="safeKeyNew"  value="${clientVo.safeKey}" />
	<input type="hidden" name="reRentUseYN"  id="reRentUseYN" value="${reRentUseYN}"/> <!-- 재렌탈 고객여부 -->
	<input type="hidden" name="bizAppYn" id="bizAppYn"  value="${clientVo.bizAppYn}" /> <!-- 사업자승인 여부 -->

	<input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->

<script type="text/javascript">
ex2cts.push('track', 'cart');

var popfrm = document.cartPopFrm;
var officerCd = '${officerCd}'; //임직원 코드
var tabGbn = '${tabGbn}'; //
var reRentUseYN = '${reRentUseYN}';

$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg order-list'></div>");
	/* page background image End */

	o2oTotAmtText();
	init_event();
});

function init_event(){

    $("#o2o").click(function(e) {
    	$('#tabGbn').val('O');
	 });
    $("#ren").click(function(e) {
    	$('#tabGbn').val('R');
	 });

	if(tabGbn == 'R'){
		$('#ren').click();
		//$('#tab-1').css("display","none");
		$('#tab-1').removeClass("current");
		$('#buy').removeClass("current");
		//$('#tab-2').css("display","");
		$('#tab-2').addClass("current");
		$('#rent').addClass("current");
	}

	$('#O2oCheckAll').click(function(e) {
		if($(this).is(":checked")) {
			$("input[name='basketChk']").prop("checked" , true);
		}else{
			$("input[name='basketChk']").prop("checked" , false);
			o2oTotAmtText();
		}
		fn_creatSalePlcAmt();
	});

	$('#RentalCheckAll').click(function(e) {
		if($(this).is(":checked")) {
			$("input[name='Basket']").prop("checked" , true);
		}else{
			$("input[name='Basket']").prop("checked" , false);
		}
	});

	//총 예상 렌탈 등록비
	/* var rentalMonthTotAmt = 0;
	if($(".layout-r dd[name='rentalMonthAmt']").length > 0) {
		$.each($(".layout-r dd[name='rentalMonthAmt']"), function(idx, item) {
			rentalMonthTotAmt += Number($(this).text().replace(/,/gi,''));
		});
	}
	$("#rentalTotRegAmt").text("\\" + NumUtil.setComma(rentalMonthTotAmt)); */

	$("input[name='basketChk']").click(function(e) {
		fn_creatSalePlcAmt();
	});
}

function fn_creatSalePlcAmt(){
	var listArr = [];

	$("input[name='basketChk']").each(function(){
		if($(this).is(":checked")) { //체크면 패키지 가격 가져온다
            var obj = {
            		dpPrNo		: $(this).attr('dpPrNo'), 	// 전시상품번호
            		prcPlcNo 	: $(this).attr('prcPlcNo'),	// 가격정책번호
            		itemCd		: $(this).attr('itemCd'),	// 아이템 번호
            		ordQy		: Number($(this).attr('qty'))		// 수량
        			};
            listArr.push(obj);
		}else{//아니면 원래 가격을 넣어준다.
			var cartNo = $(this).val();
		  		$('#pkgAmt_'+cartNo).val(0);
		  		$('#pkgPlcNo_'+cartNo).val('');
		  		$('#pkgArea_'+cartNo).children().remove();
		}
	});

	console.log(JSON.stringify(listArr));

	if(listArr.length > 0 ){
	     var pUrl = "/cart/pakageO2oAmt";
	     var pSendData = JSON.stringify(listArr);

		$.ajax({
		   url: pUrl,
		   type: "POST",
		   cache:false,
		   data: pSendData,
		   contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		   success: function(data) {

			  if(data.resultList.length > 0){
				  for(var i=0; i < data.resultList.length; i++) {
					  console.log(data.resultList[i].dpPrNo);
					  console.log(data.resultList[i].itemCd);
					  console.log(data.resultList[i].pkgPlcNo);
					  console.log(data.resultList[i].pkgDcAmt);
					  console.log("**************************************");
					  /* 패키지 할인 가격이 있으면 */
					  if(data.resultList[i].pkgDcAmt > 0){
						  $("input[name='basketChk']").each(function(){

							  var itemcd = $(this).attr('itemcd');
							  var dpPrNo = $(this).attr('dpPrNo');
							  var cartNo = $(this).val();

							  if($(this).is(":checked")) {
								  if(itemcd == data.resultList[i].itemCd && dpPrNo == data.resultList[i].dpPrNo){
									  $('#pkgAmt_'+cartNo).val(data.resultList[i].pkgDcAmt);
									  $('#pkgPlcNo_'+cartNo).val(data.resultList[i].pkgPlcNo);
									  $('#pkgArea_'+cartNo).children().remove();

									  var html = "";
									  	  html += "<div class='text-right'>패키지 추가할인</div>";
									  	  html += "<div class='text-right'>";
									  	  html += "<span class='price-actual'>";
										  var pkgDcAmt = data.resultList[i].pkgDcAmt;
										  html +=  NumUtil.setComma(pkgDcAmt);
									  	  html +=  "</span>";
									  	  html +=  "</div>";
									  	$('#pkgArea_'+cartNo).html(html);
								  }
							  }else{
								  $('#pkgAmt_'+cartNo).val(0);
								  $('#pkgPlcNo_'+cartNo).val('');
								  $('#pkgArea_'+cartNo).children().remove();
							  }
						  });
					  }else{ /* 아무것도 없으면 */

						$("input[name='basketChk']").each(function(){
							  var itemcd = $(this).attr('itemcd');
							  var dpPrNo = $(this).attr('dpPrNo');
							  var cartNo = $(this).val();
							  if($(this).is(":checked")) {
								  if(itemcd == data.resultList[i].itemCd && dpPrNo == data.resultList[i].dpPrNo){
									  $('#pkgAmt_'+cartNo).val(0);
									  $('#pkgPlcNo_'+cartNo).val('');
									  $('#pkgArea_'+cartNo).children().remove();
								  }
							  }

						});

					  }
				  }
			  }else{//가지고 온 데이터가 없으면 모두 리셋
				  $("input[name='basketChk']").each(function(){
					  var cartNo = $(this).val();
					  $('#pkgAmt_'+cartNo).val(0);
					  $('#pkgPlcNo_'+cartNo).val('');
					  $('#pkgArea_'+cartNo).children().remove();
				  });
			  }

			   	//총결제금액을 위해서 다시 돌려준다.
			   	var o2oTotAmt = 0;
				$("input[name='basketChk']").each(function(){
					if($(this).is(":checked")) { //체크면 패키지 가격 가져온다
						var cartnum = $(this).val();
						var amt = $('#o2oDisCAmt_'+cartnum).text().replace(/\\/g,'').replace(/,/gi,'');
						var pkgAmt = $('#pkgAmt_'+cartnum).val();

						o2oTotAmt =  o2oTotAmt + Number(amt)- Number(pkgAmt);
					}
				});
				$("#o2oTotAmt").text(NumUtil.setComma(o2oTotAmt));
		   },
		   error: function (e) {
				console.log(e);
			}
		});
	}
}

function fn_minus(cartNo){
	var id = $("#basicAmt_"+cartNo);
	var bassSaleAmt = id.attr('basssaleamt');   //기표가
	var saleAmt = id.attr('saleamt');			//판매가
	var bassStmemAmt = id.attr('bassstmemamt');	//임직원가
	var cntNo = $("#cndCdSeq_"+cartNo).text();

	var orderOriAmt = 0; 	//최종 판매금액
	var orderPayAmt = 0; 	//최종 주문 결제금액
	var orderSaleAmt = 0; 	//최종 할인 차감금액

	cntNo= Number(cntNo)-1;

	if(cntNo < 1){
		alert("최소 1본이 있어야 합니다.");
		return false;
	}

	if(officerCd == "" || officerCd == null){
		/* 일반가 */
		orderOriAmt  = bassSaleAmt * cntNo;
		orderPayAmt  = saleAmt * cntNo;
		orderSaleAmt = orderOriAmt - orderPayAmt;
	}else{
		/* 임직원가 */
		orderOriAmt  = bassSaleAmt * cntNo;
		orderPayAmt  = bassStmemAmt * cntNo;
		orderSaleAmt = orderOriAmt - orderPayAmt;
	}

	console.log("cntNo   :"+cntNo);
	console.log("orderOriAmt   :"+orderOriAmt);
	console.log("orderPayAmt   :"+orderPayAmt);
	console.log("orderSaleAmt  :"+orderSaleAmt);

	fn_cartUpdate(cntNo,orderOriAmt,orderPayAmt,orderSaleAmt,cartNo);
	orderOriAmt ="￦"+orderOriAmt;
	orderPayAmt = "￦"+orderPayAmt;

	$("#cndCdSeq_"+cartNo).text(cntNo);
	$("#o2oSaleAmt_"+cartNo).text(NumUtil.setComma(orderOriAmt));
	$("#o2oDisCAmt_"+cartNo).text(NumUtil.setComma(orderPayAmt));

	o2oTotAmtText();
}

function fn_plus(cartNo){

	var id = $("#basicAmt_"+cartNo);
	var bassSaleAmt = id.attr('basssaleamt');
	var saleAmt = id.attr('saleamt');
	var bassStmemAmt = id.attr('bassstmemamt');
	var cntNo = $("#cndCdSeq_"+cartNo).text();

	var orderOriAmt = 0; 	//최종 판매금액
	var orderPayAmt = 0; 	//최종 주문 결제금액
	var orderSaleAmt = 0; 	//최종 할인 차감금액


	cntNo= Number(cntNo)+1;

	if(cntNo > 4){
		alert("최대 4본 입니다.");
		return;
	}

	if(officerCd == "" || officerCd == null){
		/* 일반가 */
		orderOriAmt  = bassSaleAmt * cntNo;
		orderPayAmt  = saleAmt * cntNo;
		orderSaleAmt = orderOriAmt - orderPayAmt;
	}else{
		/* 임직원가 */
		orderOriAmt  = bassSaleAmt * cntNo;
		orderPayAmt  = bassStmemAmt * cntNo;
		orderSaleAmt = orderOriAmt - orderPayAmt;
	}


	console.log("cntNo   :"+cntNo);
	console.log("orderOriAmt   :"+orderOriAmt);
	console.log("orderPayAmt   :"+orderPayAmt);
	console.log("orderSaleAmt  :"+orderSaleAmt);

	fn_cartUpdate(cntNo,orderOriAmt,orderPayAmt,orderSaleAmt,cartNo);
	orderOriAmt ="\\"+orderOriAmt;
	orderPayAmt = "\\"+orderPayAmt;

	$("#cndCdSeq_"+cartNo).text(cntNo);
	$("#o2oSaleAmt_"+cartNo).text(NumUtil.setComma(orderOriAmt));
	$("#o2oDisCAmt_"+cartNo).text(NumUtil.setComma(orderPayAmt));

	o2oTotAmtText();
}


function fn_cartUpdate(cntCd,orderOriAmt,orderPayAmt,orderSaleAmt, cartNo){

	var pUrl = "/cart/udateO2oCart";
	var pSendData = { 	 cntCd  : "0"+cntCd
						,cartNo : cartNo
						,orderOriAmt : orderOriAmt
						,orderPayAmt : orderPayAmt
						,orderSaleAmt : orderSaleAmt
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
	    	o2oTotAmtText();
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}

function o2oTotAmtText(){
	var o2oTotAmt = 0;
	$("span[id ^= 'o2oDisCAmt_']").each(function(){
		var amt = $(this).text().replace(/\\/g,'').replace(/,/gi,'');
		o2oTotAmt =  o2oTotAmt + Number(amt);
	});

	$("#o2oTotAmt").text(NumUtil.setComma(o2oTotAmt));
}

/* 구매 단건주문 */
function fn_O2oOder(cartNO){

	var noordergbn = $('#basketChk_'+cartNO).attr('noOrderGbn');

	if(noordergbn == 'N'){
		ComUtil.confirm("죄송합니다. 가격변동으로 주문할수 없습니다.<br/> 삭제하시겠습니까?", '' , function(){
			fn_O2oODel(cartNO);
		});
		return;
	}

	if(confirm("주문을 진행하시겠습니까?")){
		var frm = document.cartFrm;
			frm.cartNoArr.value = cartNO;
			if($('#pkgAmt_'+cartNO).val() == ''){
				frm.pkgAmtOne.value = "0";
			}else{
				frm.pkgAmtOne.value = $('#pkgAmt_'+cartNO).val();
			}

			//yjw serverMode 제거(20220225)
			frm.action = "/order/orderPurchaseTMS2";
	 		//frm.action = "/order/orderPurchase";
			frm.submit();
	}
}

function fn_O2oOderAll(){
	var cartChk = new Array();
	var checkNum = 0;
	var bonsu = 0;

	var chkArray = new Array();
	var ischk = false;
	var noordergbn = true;
	var noorderPtn = "";


	$("input[name='basketChk']").each(function(){
		if($(this).is(":checked")) {

			if($(this).attr('noOrderGbn') == 'N'){ //상품중 가격변동이 있는게 하나라도 있다면 진행 불가
				noordergbn = false;
				noorderPtn += "["+ $(this).attr('ptnNm') +"]";
			}else{
				var num = $(this).attr('id').replace('basketChk_', '');
				bonsu += Number($('#cndCdSeq_'+num).text());
				for(var k=0; k<chkArray.length; k++) {
					if($(this).attr("chkGbn") != chkArray[k]) {
						ischk = true;
						return;
					}
				}
				chkArray.push($(this).attr("chkGbn"))
				checkNum++;
			}
		}
	});

	if(!noordergbn){
		alert("죄송합니다./n 가격변동으로 구매하실 수 없는 상품이 있습니다./n 삭제하시고 재주문 하시기 바랍니다. /n 대상 :"+noorderPtn);
		return;
	}

	if(bonsu > 4){
		alert("4본이상 구매하실 수 없습니다.");
		$('#O2oCheckAll').click();
		return false;
	}

 	if(ischk) {
		alert("동일한 제조사 및 차량 모델인 경우에만 주문 가능합니다.");
		return;
	}

	if(checkNum == 0){
		alert("주문하실 상품을 체크해주세요.");
		return false;
	}

	$("input[name='basketChk']").each(function(){
		if($(this).is(":checked")) {
			cartChk.push($(this).val());
		}
	});

	if(confirm("주문을 진행하시겠습니까?")){
		//yjw serverMode 제거(20220225)
		var form = document.createElement("form");
       	form.setAttribute("charset", "UTF-8");
       	form.setAttribute("method", "Post");  //Post 방식
       	form.setAttribute("action", "/order/orderPurchaseTMS2");


		cartChk.forEach(function (item, index, array) {
		console.log("item ::::::::::::::::::::"+item);
 	     var hiddenField = document.createElement("input");
       	 hiddenField.setAttribute("type", "hidden");
       	 hiddenField.setAttribute("name", "cartNoArr");
       	 hiddenField.setAttribute("value", item);
       	 form.appendChild(hiddenField);

		 var hiddenField2 = document.createElement("input");
 		 hiddenField2.setAttribute("type", "hidden");
 		 hiddenField2.setAttribute("name", "pkgAmtArr");
 		 hiddenField2.setAttribute("value", item+'@'+$('#pkgAmt_'+item).val()+'@'+$('#pkgPlcNo_'+item).val());
       	 form.appendChild(hiddenField2);
	});

         document.body.appendChild(form);
         form.submit();
	}
}

function fn_O2oODelChk(){
	var cartChk = new Array();
	var cheknum = 0;

	$("input[name='basketChk']").each(function(){
		if($(this).is(":checked")) {
			cheknum++;
		}
	});

	if(cheknum == 0){
		alert("삭제하실 상품을 선택해주세요.");
		return false;
	}

	if(confirm("상품을 삭제하시겠습니까?")){
		$("input[name='basketChk']").each(function(){
			if($(this).is(":checked")) {
				fn_O2oODel($(this).val());
			}
		});
	}
}

function fn_O2oODel(cartNo){
	var pUrl = "/cart/deleteO2oCart";
	var pSendData = { cartNo : cartNo };
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";

	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	$("#cartNumSeq_"+cartNo).remove();
	    	if($('article[id^=cartNumSeq_]').length == 0){
	    		var shtml = "";
		    		shtml += "<div class='no-data'>";
		    		shtml += "	<div class='text-center inset-xl'>";
		    		shtml += "		<img src='../img/common/pop_alert_01.png' alt=''>";
		    		shtml += "			<p class='mt-m'>장바구니에 담긴 상품이 없습니다.</p>";
		    		shtml += "	</div>";
		    		shtml += "</div>";
		    		$("#o2oBody").html(shtml);
	    	}
	    	o2oTotAmtText();
	    	init_event();
	    	$("#buy span").text(parseInt($("#buy span").text())-1);
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}

/* 구매 단건주문 */
function fn_SearchCart(gbn){

	var frm = document.cartFrm;
	var searchText1 = $('#searchText').val();
	var searchText2 = $('#searchTxtRental').val();
	var url = "";
	frm.O2osearchText.value = searchText1;
	frm.RentalsearchText.value = searchText2;

	if(gbn == 'O'){
		$("#tabGbn").val('O');
		url = "/cart/cartView";
	}else if(gbn == 'R'){
		$("#tabGbn").val('R');
		url = "/cart/cartView?tab=R";
	}

	frm.action = url;
	frm.submit();
}

function enterSchKey(){
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {
		event.keyCode = 0;
		fn_SearchCart();
	}
}

function fn_optionUpdate(index,gbn){
	var frm = "";
	if(gbn == "nomal"){
		frm = document.forms['formNomal'+index];
	}else if(gbn == "free"){
		frm = document.forms['formfree'+index];
	}else if(gbn == "member"){
		frm = document.forms['membership'+index];
	}

	var popfrm = document.cartPopFrm;

	var popSaleName = frm.saleNm.value; //렌탈명
	var popPatternCd = frm.patternCd.value; // 패턴코드

	var popClassCd = frm.classCd.value; //승용차 SUV
	if(popClassCd == 'P1'){
		popClassCd = '승용차용';
	}else{
		popClassCd = 'SUV용';
	}

	var popSeasonCdNm = frm.seasonCdNm.value; //계절

	var popOeYn = frm.matCd.value; //순정 호환
	if(popOeYn == 'Y'){
		popOeYn = '순정';
	}else{
		popOeYn = '호환';
	}

	var popDispSize =  "("+ popOeYn + ") "+  frm.dispSize.value; //디스플레이

	var popMakerCdNm = frm.makerCdNm.value; //자동차회사
	var popMcNm = frm.modelCdNm.value; //자동차 모델명

	popfrm.periodCd.value 	= 	frm.periodCd.value;
	popfrm.cntCd.value 		=	frm.cntCd.value;
	popfrm.saleCd.value 	=	frm.saleCd.value;
	popfrm.rentalINdex.value =	index;
	popfrm.rentalGbn.value =	gbn;
	popfrm.regiCdAmt.value =	frm.regiCdAmt.value; ;

	$('#popSaleName').text(popSaleName);
	$('#popPatternCd').text(popPatternCd);
	$('#popClassCd').text(popClassCd);
	$('#popSeasonCdNm').text(popSeasonCdNm);
	$('#popOeYn').text(popOeYn);
	$('#popDispSize').text(popDispSize);
	$('#popMakerCdNm').text(popMakerCdNm);
	$('#popMcNm').text(popMcNm);

	if(gbn == 'free'){//자유렌탈일때

        $.ajax({
            type: "POST",
            url: "/cart/openCartOption",
            data: $("#formfree"+index).serialize(),
            cache: false,
            processData: false,
            success: function (data) {
            	settingPopup(data,'free');
            	$('#modal-5').addClass('md-show');
            },
            error: function (e) {
                console.log("ERROR : ", e);
            }
        });
	}else if(gbn == 'nomal'){
		var vheelinches = frm.wheelInches.value;
		var plyRating = frm.wheelInches.value;
		var wheelInchesText = frm.wheelInches.value;
		var	wheelInches = wheelInchesText.split(" ")[0];
		var	plyRating = frm.plyRating.value;   /*  wheelInchesText.split(" ")[1].replace('P', ''); */

		frm.plyRating.value = plyRating;

		var pUrl = "/cart/selectUpdateRentalInfo";
		var pSendData = {
							sectionWidth : frm.sectionWidth.value
							,aspectRatio : frm.aspectRatio.value
							,wheelInches : wheelInches
							,plyRating   : plyRating
							,petternCd	 : frm.patternCd.value
							,cntCd		 : frm.cntCd.value
							,periodCd	 : frm.periodCd.value
							,saleCd		 : frm.saleCd.value
							,matCd		 : frm.matCd.value
							,frCd		 : frm.frCd.value
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
				settingPopup(data,'nomal');
		    },
		    error: function (e) {
				console.log(e);
			}
		});


		$('#modal-5').addClass('md-show');

	}else if(gbn == 'member'){

	}
}

/*********렌탈 옵션 변경 MEPARK **************************************************************/

function settingPopup(data, gbn){

	/* 1.렌탈수량 셋팅 */
	var htmlRenQty = "";
	if(data.searchCdList.length > 0){
		$('#rentalBonQty').children().remove();
		for(var i=0; i < data.searchCdList.length; i++) {
			if(reRentUseYN != 'N'){
				if(data.searchCdList[i].searchCd == popfrm.cntCd.value){
					htmlRenQty += "<option value='" + data.searchCdList[i].searchCd + "' selected='selected'>" + data.searchCdList[i].searchCdNm + "</option>";
				}else{
					htmlRenQty += "<option value='" + data.searchCdList[i].searchCd + "' >" + data.searchCdList[i].searchCdNm + "</option>";
				}
			}else{
				if(data.searchCdList[i].searchCd != '01' && data.searchCdList[i].searchCd != '03'){
					if(data.searchCdList[i].searchCd == popfrm.cntCd.value){
						htmlRenQty += "<option value='" + data.searchCdList[i].searchCd + "' selected='selected'>" + data.searchCdList[i].searchCdNm + "</option>";
					}else{
						htmlRenQty += "<option value='" + data.searchCdList[i].searchCd + "' >" + data.searchCdList[i].searchCdNm + "</option>";
					}
				}
			}
		}
	}
	$('#rentalBonQty').html(htmlRenQty);
	//////////////////////////////////////////////////////////////////////////////////////////////////

	/* 2.렌탈기간 셋팅 */
	var htmlRenMonth = "";
	if(data.recomMonthList.length > 0){
		$('#rentalMonth').children().remove();
		for(var i=0; i < data.recomMonthList.length; i++) {
			if(data.recomMonthList[i].searchCd1 == popfrm.periodCd.value){
				//htmlRenMonth += '<input type="radio" name="term" checked="checked" id="renMonth_'+i+'" value="'+ data.recomMonthList[i].searchCd1 +'" class="type06"><label for="renMonth_'+i+'"><span>'+ data.recomMonthList[i].searchCdNm +'</span></label>';
				htmlRenMonth += "<option value='" + data.recomMonthList[i].searchCd1 + "' selected='selected'>" + data.recomMonthList[i].searchCdNm + "</option>";
			}else{
				//htmlRenMonth += '<input type="radio" name="term" id="renMonth_'+i+'" value="'+ data.recomMonthList[i].searchCd1 +'" class="type06"><label for="renMonth_'+i+'"><span>'+ data.recomMonthList[i].searchCdNm +'</span></label>';
				htmlRenMonth += "<option value='" + data.recomMonthList[i].searchCd1 + "' >" + data.recomMonthList[i].searchCdNm + "</option>";
			}

		}
	}
	$('#rentalMonth').html(htmlRenMonth);
	//////////////////////////////////////////////////////////////////////////////////////////////////


	/* 3.등록비  셋팅 */
	var htmlRenRegAmt = "";
	if(data.regAmtList.length > 0){
		$('#rentalregAmt').children().remove();
		for(var i=0; i < data.regAmtList.length; i++) {
			if(gbn == 'nomal'){
				if(data.regAmtList[i].searchCd == '01' || data.regAmtList[i].searchCd == '02' || data.regAmtList[i].searchCd == '04'){
					if(data.regAmtList[i].searchCdNm == popfrm.regiCdAmt.value){
						//htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" checked="checked" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';
						htmlRenRegAmt += "<option value='" + data.regAmtList[i].searchCd + "' selected='selected'>" + data.regAmtList[i].searchCdNm + "원</option>";
					}else{
						//htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';
						htmlRenRegAmt += "<option value='" + data.regAmtList[i].searchCd + "'>" + data.regAmtList[i].searchCdNm + "원</option>";
					}

				}
			}else{
				if(data.regAmtList[i].searchCdNm == popfrm.regiCdAmt.value){
					//htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" checked="checked" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';
					htmlRenRegAmt += "<option value='" + data.regAmtList[i].searchCd + "' selected='selected'>" + data.regAmtList[i].searchCdNm + "원</option>";
				}else{
					//htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';
					htmlRenRegAmt += "<option value='" + data.regAmtList[i].searchCd + "'>" + data.regAmtList[i].searchCdNm + "원</option>";
				}
			}
		}
	}
	$('#rentalregAmt').html(htmlRenRegAmt);
	//////////////////////////////////////////////////////////////////////////////////////////////////
	if(gbn == 'nomal'){
		$("#nomalService").css("display","");
		$("#freeService").css("display","none");
		renNomalServicCnt(data, gbn);
	}else if(gbn == 'free'){
		/* 자유렌탈 서비스 셀렉트박스 셋팅 */
		$("#nomalService").css("display","none");
		$("#freeService").css("display","");
		renFreeServicSelect(data, gbn);
	}
}

function renNomalServicCnt(data, gbn){
	var rentalHtml = "";

	//방문점검
	if(data.serviceMap.selVisCd == '0' || typeof data.serviceMap.selVisCd == 'undefined'){
		$('#visitN').text('0');
	}else if(data.serviceMap.selVisCd == '999'){
		$('#visitN').text('무제한');
	}else{
		$('#visitN').text(data.serviceMap.selVisCd);
	}

	//타이어 무상교체
	if(data.serviceMap.selTcCd == '0' || typeof data.serviceMap.selTcCd == 'undefined'){
		$('#tireFreeN').text('0');
	}else if(data.serviceMap.selTcCd == '999'){
		$('#tireFreeN').text('무제한');
	}else{
		$('#tireFreeN').text(data.serviceMap.selTcCd);
	}

	//엔진오일 교체
	if(data.serviceMap.selEnginCd == '0' || typeof data.serviceMap.selEnginCd == 'undefined'){
		$('#engChangN').text('0');
	}else if(data.serviceMap.selEnginCd == '999'){
		$('#engChangN').text('무제한');
	}else{
		$('#engChangN').text(data.serviceMap.selEnginCd);
	}

	//얼라이먼트
	if(data.serviceMap.selArCd == '0' || typeof data.serviceMap.selArCd == 'undefined'){
		$('#freeArN').text('0');
	}else if(data.serviceMap.selArCd == '999'){
		$('#freeArN').text('무제한');
	}else{
		$('#freeArN').text(data.serviceMap.selArCd);
	}

	//무상위치
	if(data.serviceMap.selLocCd == '0' || typeof data.serviceMap.selLocCd == 'undefined'){
		$('#freeLocatN').text('0');
	}else if(data.serviceMap.selLocCd == '999'){
		$('#freeLocatN').text('무제한');
	}else{
		$('#freeLocatN').text(data.serviceMap.selLocCd);
	}
}

function changeOption(){//옵션을 바꿀때마다 장착서비스 정보를 바꿔준다.
	var pUrl = "/cart/selectChageOptionInfo";
	var pSendData = {
						 cntCd		 : popfrm.cntCd.value
						,periodCd	 : popfrm.periodCd.value
						,saleCd		 : popfrm.saleCd.value
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
	    	renNomalServicCnt(data, 'nomal')
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}

/* 일반 렌탈 장바구니 수정 */
function fn_updateCart(){
	console.log($("#rentalGbn").val());
	if(confirm("수정 하시겠습니까?")){

		if($("#rentalGbn").val() == 'nomal'){
			var frm = document.forms['formNomal'+popfrm.rentalINdex.value];
			frm.cntCd.value = popfrm.cntCd.value;
			var cntCdNm = Number(popfrm.cntCd.value)
			frm.cntCdNm.value = cntCdNm+'본';
			frm.periodCd.value = popfrm.periodCd.value;
			if(Number(popfrm.periodCd.value) != 0){
				var periNm = Number(popfrm.periodCd.value) / 12;
				frm.periodCdNm.value = periNm+'년';
			}else{
				frm.periodCdNm.value = '0년';
			}
			frm.regiCdAmt.value = popfrm.regiCdAmt.value;
			frm.regiCd.value = $(':radio[name="fee"]:checked').val();


	        $.ajax({
	            type: "POST",
	            url: "/cart/modifyCrtItem",
	            data: $("#formNomal"+popfrm.rentalINdex.value).serialize(),
	            cache: false,
	            processData: false,
	            success: function (data) {
	            	sendChildValueCancle('rentalOptPop');
	            	window.location.href="/cart/cartView";
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });

		 }else if($("#rentalGbn").val() == 'free'){
			 	var frm = document.forms['formfree'+popfrm.rentalINdex.value];
				var pUrl = "/cart/modifyCrtService";
				console.log(popfrm.selEnginCd.value);
				console.log(popfrm.selLocCd.value);
				console.log(popfrm.selVisCd.value);
				console.log(popfrm.selSaveCd.value);
				console.log(popfrm.selTcCd.value);
				console.log(popfrm.selPrCd.value);
				console.log(popfrm.selArCd.value);
				console.log(popfrm.cntCd.value);

				console.log(frm.itemNo.value);
				console.log(frm.regiCdAmt.value);
				console.log(frm.sectionWidth.value);
				console.log(frm.aspectRatio.value);
				console.log(frm.wheelInches.value);
				console.log(frm.plyRating.value);
				console.log(frm.patternCd.value);

				var wheelInches = frm.wheelInches.value.split(" ");
				wheelInches = wheelInches[0];

				console.log("wheelInches     :"+wheelInches);

				var pSendData = {
									 selEnginCd 	: popfrm.selEnginCd.value
									,selLocCd 		: popfrm.selLocCd.value
									,selVisCd 		: popfrm.selVisCd.value
									,selSaveCd 		: popfrm.selSaveCd.value
									,selTcCd 		: popfrm.selTcCd.value
									,selPrCd 		: popfrm.selPrCd.value
									,selArCd 		: popfrm.selArCd.value
									,cntCd 			: popfrm.cntCd.value
									,periodCd 		: popfrm.periodCd.value
									,regiAmt 		: popfrm.regiCdAmt.value
									,itemNo 		: frm.itemNo.value
									,sectionWidth 	: frm.sectionWidth.value
									,aspectRatio 	: frm.aspectRatio.value
									,wheelInches 	: wheelInches
									,plyRating 		: frm.plyRating.value
									,petternCd 		: frm.patternCd.value
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
				    	sendChildValueCancle('rentalOptPop');
		            	window.location.href="/cart/cartView";
				    },
				    error: function (e) {
						console.log(e);
					}
				});
		 }else if($("#rentalGbn").val() == 'mamber'){

		 }
	}
}

/* 렌탈 체크된거 삭제 */
function fn_rentalDeleteChk(){

	var chkNum = 0;
	$("input[name='Basket']").each(function(){
		if($(this).is(":checked")) {
			chkNum++;
		}
	});


	if(chkNum == 0){
		alert("삭제하실 렌탈상품을 선택해 주세요.");
		return false;
	}

	if(confirm("상품을 삭제하시겠습니까?")){
		$("input[name='Basket']").each(function(){

			if($(this).is(":checked")) {
				var atr = $(this).attr('id');
				var idx = $(this).val();
				var renGbn = "";
				var frm = "";
				var itemNo = "";

				if(atr.indexOf("nomalBasket_") != -1 ){//일반렌탈
					frm = document.forms['formNomal'+idx];
					renGbn = "nomal";
					itemNo = frm.itemNo.value;
				}else if(atr.indexOf("freeBasket_") != -1){//자유렌탈
					frm = document.forms['formfree'+idx];
					renGbn = "free";
					itemNo = frm.itemNo.value;
				}else if(atr.indexOf("memberBasket_") != -1){//멤버십렌탈
					frm = document.forms['membership'+idx];
					renGbn = "member";
					itemNo = frm.itemNo.value;
				}

				//삭제
				fn_rentalDelete(itemNo,renGbn,idx);
			}
		});
	}
}

function renFreeServicSelect(data, gbn){
	var htmlstr1 = "";
	var htmlstr2 = "";
	var htmlstr3 = "";
	var htmlstr6 = "";
	var htmlstr7 = "";


	console.log("getProdViewCdList51 : "+data.getProdViewCdList51.length);//엔진오일 교체 서비스
	console.log("getProdViewCdList52 : "+data.getProdViewCdList52.length);//위치교환서비스 무상 서비스
	console.log("getProdViewCdList53 : "+data.getProdViewCdList53.length);//방문점검서비스
	console.log("getProdViewCdList54 : "+data.getProdViewCdList54.length);//보관서비스
	console.log("getProdViewCdList55 : "+data.getProdViewCdList55.length);//타이어 교체 서비스
	console.log("getProdViewCdList56 : "+data.getProdViewCdList56.length);//타이어 무상 교체 서비스
	console.log("getProdViewCdList57 : "+data.getProdViewCdList57.length);//얼라인먼트 무상 서비스

	/* 엔진오일 교체 서비스 */
	if(data.getProdViewCdList51.length > 0){
		//일단 삭제
		$('#engChangF').children().remove();

		htmlstr1 += "<option value='0' selected='selected'>해당없음</option>";
		for(var i=0; i < data.getProdViewCdList51.length; i++) {
			if(data.getProdViewCdList51[i].servCnt == '999'){

				htmlstr1 += "<option ";

				if(data.selEnginCd != null || data.selEnginCd != "" || typeof data.selEnginCd != 'undefined'){
					if(data.selEnginCd == '999'){
						htmlstr1 += "selected='selected' ";
					}
				}
				htmlstr1 += 'value="'+data.getProdViewCdList51[i].servCntAmt+'">무제한</option>';
			}else{
				htmlstr1 += "<option ";

				if(data.selEnginCd != null || data.selEnginCd != "" || typeof data.selEnginCd != 'undefined'){
					if(data.selEnginCd == data.getProdViewCdList51[i].servCnt){
						htmlstr1 += "selected='selected' ";
					}
				}

				htmlstr1 += 'value="'+data.getProdViewCdList51[i].servCnt+'">'+data.getProdViewCdList51[i].servCnt+'회</option>';
			}
		}
	}


	/* 위치교환서비스 무상 서비스 */
	if(data.getProdViewCdList52.length > 0){
		//일단 삭제
		$('#freeLocatF').children().remove();

		htmlstr2 += "<option value='0' selected='selected'>해당없음</option>";
		for(var i=0; i < data.getProdViewCdList52.length; i++) {
			if(data.getProdViewCdList52[i].servCnt == '999'){

				htmlstr2 += "<option ";
				if(data.selLocCd != null || data.selLocCd != "" || typeof data.selLocCd != 'undefined'){
					if(data.selLocCd == '999'){
						htmlstr2 += "selected='selected' ";
					}
				}
				htmlstr2 += 'value="'+data.getProdViewCdList52[i].servCntAmt+'">무제한</option>';

			}else{
				htmlstr2 += "<option ";

				if(data.selLocCd != null || data.selLocCd != "" || typeof data.selLocCd != 'undefined'){
					if(data.selLocCd == data.getProdViewCdList52[i].servCnt){
						htmlstr2 += "selected='selected' ";
					}
				}
				htmlstr2 += 'value="'+data.getProdViewCdList52[i].servCnt+'">'+data.getProdViewCdList52[i].servCnt+'회</option>';
			}
		}
	}

	/* 방문점검서비스 */
	if(data.getProdViewCdList53.length > 0){
		//일단 삭제
		$('#visitF').children().remove();

		htmlstr3 += "<option value='0' selected='selected'>해당없음</option>";
		for(var i=0; i < data.getProdViewCdList53.length; i++) {
			if(data.getProdViewCdList53[i].servCnt == '999'){
				htmlstr3 += "<option ";
				if(data.selVisCd != null || data.selVisCd != "" || typeof data.selVisCd != 'undefined'){
					if(data.selVisCd == '999'){
						htmlstr3 += "selected='selected' ";
					}
				}
				htmlstr3 += 'value="'+data.getProdViewCdList53[i].servCntAmt+'">무제한</option>';
			}else{

				htmlstr3 += "<option ";
				if(data.selVisCd != null || data.selVisCd != "" || typeof data.selVisCd != 'undefined'){
					if(data.selVisCd == data.getProdViewCdList53[i].servCnt){
						htmlstr3 += "selected='selected' ";
					}
				}
				htmlstr3 += 'value="'+data.getProdViewCdList53[i].servCnt+'">'+data.getProdViewCdList53[i].servCnt+'회</option>';
			}
		}
	}

	/* 타이어 무상 교체 서비스 */
	if(data.getProdViewCdList56.length > 0){
		//일단 삭제
		$('#tireFreeF').children().remove();
		//htmlstr6 += '<li><a href="#" class="arrowClose" onclick="return false"></a></li>';
		//htmlstr6 += '<li><input type="radio" name="tierFrChg" id="tierFrChg00" ';

		//if(data.selPrCd == null || data.selPrCd == "" || typeof data.selPrCd == 'undefined'){
		//	htmlstr6 += 'checked="checked"';
		//}

		//htmlstr6 += 'value="0" class="type06" onclick="setSelCode(\'B00007\',\'0\',\'0\')"><label for="tierFrChg00"><span>해당없음</span></label></li>';
		htmlstr6 += "<option value='0' selected='selected'>해당없음</option>";
		for(var i=0; i < data.getProdViewCdList56.length; i++) {
			if(data.getProdViewCdList56[i].servCnt == '999'){

				//htmlstr6 += '<li><input type="radio" name="tierFrChg" id="tierFrChg'+i+'" ';
				htmlstr6 += "<option ";
				if(data.selPrCd != null || data.selPrCd != "" || typeof data.selPrCd != 'undefined'){
					if(data.selPrCd == '999'){
						//htmlstr6 += 'checked="checked"';
						htmlstr6 += "selected='selected' ";
					}
				}
				//htmlstr6 += 'value="'+data.getProdViewCdList56[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList56[i].prsDcd +'\',\''+ data.getProdViewCdList56[i].servCnt + '\',\''+ data.getProdViewCdList56[i].servCntAmt +'\')"><label for="tierFrChg'+i+'"><span>무제한</span></label></li>';
				htmlstr6 += "value='"+ data.getProdViewCdList56[i].servCntAmt +"'>무제한</option>";
			}else{
				//htmlstr6 += '<li><input type="radio" name="tierFrChg" id="tierFrChg'+i+'" ';
				htmlstr6 += "<option ";
				if(data.selPrCd != null || data.selPrCd != "" || typeof data.selPrCd != 'undefined'){
					if(data.selPrCd == data.getProdViewCdList56[i].servCnt){
						//htmlstr6 += 'checked="checked"';
						htmlstr6 += "selected='selected' ";
					}
				}
				//htmlstr6 += 'value="'+data.getProdViewCdList56[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList56[i].prsDcd +'\',\''+ data.getProdViewCdList56[i].servCnt + '\',\''+ data.getProdViewCdList56[i].servCntAmt +'\')"><label for="tierFrChg'+i+'"><span>'+data.getProdViewCdList56[i].servCnt+'회</span></label></li>';
				htmlstr6 += "value='"+ data.getProdViewCdList56[i].servCnt +"'>" + data.getProdViewCdList56[i].servCnt + "회</option>";
			}
		}
	}

	/* 얼라인먼트 무상 서비스 */
	if(data.getProdViewCdList57.length > 0){
		//일단 삭제
		$('#freeArF').children().remove();

		htmlstr7 += "<option value='0' selected='selected'>해당없음</option>";
		for(var i=0; i < data.getProdViewCdList57.length; i++) {

			if(data.getProdViewCdList57[i].servCnt == '999'){
				htmlstr7 += "<option ";
				if(data.selArCd != null || data.selArCd != "" || typeof data.selArCd != 'undefined'){
					if(data.selArCd == '999'){
						htmlstr7 += "selected='selected' ";
					}
				}
				htmlstr7 += '">무제한</option>';
			}else{
				htmlstr7 += "<option ";
				if(data.selArCd != null || data.selArCd != "" || typeof data.selArCd != 'undefined'){
					if(data.selArCd == data.getProdViewCdList57[i].servCnt){
						htmlstr7 += "selected='selected' ";
					}
				}

				htmlstr7 += 'value="'+data.getProdViewCdList57[i].servCnt+'">'+data.getProdViewCdList57[i].servCnt+'회</option>';
			}
		}
	}

	//모바일은 숫자를 따로 표기하지 않는다. MEPARK
	if(data.selEnginCd != null && data.selEnginCd != "" && typeof data.selEnginCd != 'undefined'){
		popfrm.selEnginCd.value = data.selEnginCd;
		//$('#engChangCntF').text(data.selEnginCd);
	}else{
		popfrm.selEnginCd.value = '0';
		//$('#engChangCntF').text('0');
	}

	if(data.selLocCd != null && data.selLocCd != "" && typeof data.selLocCd != 'undefined'){
		popfrm.selLocCd.value = data.selLocCd;
		//$('#freeLocatCntF').text(data.selLocCd);
	}else{
		popfrm.selLocCd.value = '0';
		//$('#freeLocatCntF').text('0');
	}

	if(data.selVisCd != null && data.selVisCd != "" && typeof data.selVisCd != 'undefined'){
		popfrm.selVisCd.value = data.selVisCd;
		//$('#visitCntF').text(data.selVisCd);
	}else{
		popfrm.selVisCd.value = '0';
		//$('#visitCntF').text('0');
	}

	if(data.selPrCd != null && data.selPrCd != "" && typeof data.selPrCd != 'undefined'){
		popfrm.selPrCd.value = data.selPrCd;
		//$('#tireFreeCntF').text(data.selPrCd);
	}else{
		popfrm.selPrCd.value = '0';
		//$('#tireFreeCntF').text('0');
	}

	if(data.selArCd != null && data.selArCd != "" && typeof data.selArCd != 'undefined'){
		popfrm.selArCd.value = data.selArCd;
		//$('#freeArCntF').text(data.selArCd);
	}else{
		popfrm.selArCd.value = '0';
		//$('#freeArCntF').text('0');
	}

	/* innerHtml!!! */
	$('#engChangF').html(htmlstr1);
	$('#freeLocatF').html(htmlstr2);
	$('#visitF').html(htmlstr3);
	$("#tireFreeF").html(htmlstr6);
	$('#freeArF').html(htmlstr7);

    $(".arrowClose").click(function(e) {
	 	   $(".selBox").slideUp(300);
	        e.preventDefault();
	 });

}

/* 선택한 서비스 코드 정보 셋팅
 * 모바일에서는 숫자를 따로 표기해주지 않는다. MEPARK
 */
//function setSelCode(prsDcd, servCnt, servCntAmt){
function setSelCode(prsDcd, pVal){
	if(prsDcd == "B00001"){//엔진오일
		popfrm.selEnginCd.value = $(pVal).val();
		//$('#engChangCntF').text(servCnt);
	}else if(prsDcd == "B00002"){//위치교환
		popfrm.selLocCd.value = $(pVal).val();
		//$('#freeLocatCntF').text(servCnt);
	}else if(prsDcd == "B00003"){//방문점검
		popfrm.selVisCd.value = $(pVal).val();
		//$('#visitCntF').text(servCnt);
	}else if(prsDcd == "B00007"){//타이어 무상 교체
		popfrm.selPrCd.value = $(pVal).val();
		//$('#tireFreeCntF').text(servCnt);
	}else if(prsDcd == "B00008"){//얼라인먼트
		popfrm.selArCd.value = $(pVal).val();
		//$('#freeArCntF').text(servCnt);
	}
}

/* 수량, 기간, 등록비 세팅  MEPARK*/
function setSelValue(pLocation, pVal){
	if(pLocation == "qty"){//수량
		popfrm.cntCd.value = $(pVal).val();
	}else if(pLocation == "perd"){//기간
		popfrm.periodCd.value = $(pVal).val();
	}else if(pLocation == "fee"){//등록비
		popfrm.regiCdAmt.value = $('#rentalregAmt option:selected').text().replace('원', '');
	}

	 if($("#rentalGbn").val() == 'nomal'){
		 changeOption();
		 fn_nomalRentalAmt(); /* 렌탈 등록비 재설정 */
	 }else if($("#rentalGbn").val() == 'free'){
		 changeOptionFree();
	 }else if($("#rentalGbn").val() == 'mamber'){

	 }
}


/* 일반렌탈일 경우 등록비 본수에 맞게 고정으로 인해 서버에 한번 갔다온다. */
function fn_nomalRentalAmt() {

	var pUrl = "/product/selectNomalRentalAmt";
	var pSendData = {
						saleCd 		: popfrm.cntCd.value,
						cntCd 		: $('#rentalBonQty').val()
					};

	pSendData = JSON.stringify(pSendData);

	$.ajax({
			url : pUrl,
			type : "POST",
			cache : false,
			data : pSendData,
			contentType : "application/json;charset=UTF-8", // ajax 통신으로 보내는 타입
			success : function(data) {

			},
			error : function(request, status, error) {
				console.log('error callback : ' + error);
			}
		});
}


function changeOptionFree(){
	var pUrl = "/product/selectFreeRentalServiceList";
	var pSendData = {
						 cntCd		 : popfrm.cntCd.value
						,periodCd	 : popfrm.periodCd.value
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
	    	renFreeServicSelect(data, 'free');
	    },
	    error: function (e) {
			console.log(e);
		}
	});

}

/********* 렌탈 옵션 변경 end MEPARK **************************************************************/

/* 렌탈 단일 삭제 */
function fn_rentalDelete(itemNo, renGbn, index){

	var pUrl = "/cart/deleteRentalCart";
	var pSendData = { itemNo : itemNo};
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";

	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
			if(renGbn == 'nomal'){
		    	$("#formNomal"+index).remove();
		    	$("#nomalList_"+index).remove();
			}else if(renGbn == 'free'){
		    	$("#formfree"+index).remove();
		    	$("#freeList_"+index).remove();
			}else if(renGbn == 'member'){
		    	$("#membership"+index).remove();
		    	$("#memberList_"+index).remove();
			}
			$("#rent span").text(parseInt($("#rent span").text())-1);
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}

/* function sendChildValueCancle(callLoca){
	if(callLoca == "rentalOptPop") {
		$("#modal-5").removeClass("md-show");
		$(".layPopClose").click();
	} else {
		$(".layPopClose").click();
	}
}
 */
/******************************************************************************************/
/******************************* 주문하기  ***************************************************/
/******************************************************************************************/

function check_credit(itemNo , gbn , formIdx){
	var custDivCd = "<%=session.getAttribute("custDivCd") %>";
	var comDivCd = "<%=session.getAttribute("comDivCd") %>";
	var userLoginId = "<%=session.getAttribute("userLoginId") %>";
	console.log("custDivCd    : "+custDivCd);
	console.log("comDivCd     :"+comDivCd);
	console.log("userLoginId     :"+userLoginId);


	if(userLoginId == null || userLoginId == ''){
		if(!confirm("로그인 후 이용 가능합니다.\n\n로그인 하시겠습니까?")) {
			return;
		}else{

		}
	}

	if($('#bizAppYn').val() == "N") {
		ComUtil.alert("사업자 고객의 경우 렌탈 계약을 위한 </br>승인이 필요합니다.</br>고객센터 ☎1855-0100 으로 </br>전화 주시기 바랍니다.</br>감사합니다.");
		return;
	} else if($('#safeKeyNew').val() == "" || $('#safeKeyNew').val() == 'null') {
		ComUtil.alert("(인증번호)를 발급 받으셔야 주문이 가능합니다.</br>마이넥센메뉴에서 인증번호를 발급 받으세요.");
		return;
	}

	console.log("custDivCd="+custDivCd)
	if(custDivCd == "1"){//개인고객
		indi_credit(itemNo , gbn , formIdx);
	}else if(custDivCd == "2"){//사업자 고객
		if(comDivCd == "1"){//개인 사업자
			license_credit(itemNo , gbn , formIdx, custDivCd, comDivCd);
		}else{//법인사업자
			//indiLic_credit(itemNo , gbn , formIdx);
			license_credit(itemNo , gbn , formIdx, custDivCd, comDivCd);
		}
	}else{//그외

	}
}

//개인 고객 신용정보 조회
function indi_credit(itemNo , gbn , formIdx){

	var pUrl = "/order/certifyPerson";
	var pSendData = {};
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";

	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	/*
			 * 신용등급 -> 신용포인트로 변경.(crGrade)
			 * 변경일 : 2020.12.28
			 */
			if(data.rtnMap == null || data.rtnMap == ''){
				var alterMsg = '고객님, 죄송합니다.\n';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.\n';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.\n';
				ComUtil.alert(alterMsg);
			}else if(Number(data.rtnMap.creditLvlCd) >= Number(data.rtnMap.crGrade)){
				var alterMsg = '고객님, 죄송합니다.\n';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.\n';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.\n';
				ComUtil.alert(alterMsg);
			}else{
				//yjw serverMode 제거(20220225)
				if(gbn == "free") {
					frm = $("#formfree"+formIdx);
					$("#formNomal"+formIdx).attr("action" , "/order/orderRentalTMS2")
					//$("#formfree"+formIdx).attr("action" , "/order/orderRental")
					$("#formfree"+formIdx).submit();
				} else {
					frm = $("#formNomal"+formIdx);
					$("#formNomal"+formIdx).attr("action" , "/order/orderRentalTMS2")
					//$("#formNomal"+formIdx).attr("action" , "/order/orderRental")
					$("#formNomal"+formIdx).submit();
				}
			}
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}

//법인사업자 고객 신용정보조회
function license_credit(itemNo , gbn , formIdx, custDivCd, comDivCd){

	var pUrl = "/order/certifyCompany";
	var pSendData = {};
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";

	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
			if(data.rtnMap == null || data.rtnMap == ''){
				var alterMsg = '고객님, 죄송합니다.\n';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.\n';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.\n';
				ComUtil.alert(alterMsg);
			}else if(data.rtnMap.gradeYn != 'Y'){
				var alterMsg = '고객님, 죄송합니다.\n';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.\n';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.\n';
				ComUtil.alert(alterMsg);
			}else{
				//개인사업자인경우
				if(custDivCd == "2" && comDivCd == "1") {
					indi_credit();
				} else { //법인사업자인경우
					
					//yjw serverMode 제거(20220225)
					if(gbn == "free") {
						frm = $("#formfree"+formIdx);
						$("#formNomal"+formIdx).attr("action" , "/order/orderRentalTMS2")
						//$("#formfree"+formIdx).attr("action" , "/order/orderRental")
						$("#formfree"+formIdx).submit();
					} else {
						frm = $("#formNomal"+formIdx);
						$("#formNomal"+formIdx).attr("action" , "/order/orderRentalTMS2")
						//$("#formNomal"+formIdx).attr("action" , "/order/orderRental")
						$("#formNomal"+formIdx).submit();
					}
				}
			}
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}


//개인 사업자 고객 신용정보 조회
function indiLic_credit(itemNo){

	var pUrl = "/order/certifyPerson";
	var pSendData = {};
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";

	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	/*
			 * 신용등급 -> 신용포인트로 변경.(crGrade)
			 * 변경일 : 2020.12.28
			 */
			if(data.rtnMap == null || data.rtnMap == ''){
				var alterMsg = '고객님, 죄송합니다.\n';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.\n';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.\n';
				ComUtil.alert(alterMsg);
			}else if(Number(data.rtnMap.creditLvlCd) >= Number(data.rtnMap.crGrade)){
				var alterMsg = '고객님, 죄송합니다.\n';
				alterMsg = alterMsg + '고객님께서는 현재 렌탈 계약이 어렵습니다.\n';
				alterMsg = alterMsg + '[구매]를 추천 드립니다.\n';
				ComUtil.alert(alterMsg);
			}else{
				//yjw serverMode 제거(20220225)
				if(gbn == "free") {
					frm = $("#formfree"+formIdx);
					$("#formNomal"+formIdx).attr("action" , "/order/orderRentalTMS2")
					//$("#formfree"+formIdx).attr("action" , "/order/orderRental")
					$("#formfree"+formIdx).submit();
				} else {
					frm = $("#formNomal"+formIdx);
					$("#formNomal"+formIdx).attr("action" , "/order/orderRentalTMS2")
					//$("#formNomal"+formIdx).attr("action" , "/order/orderRental")
					$("#formNomal"+formIdx).submit();
				}
			}
	    },
	    error: function (e) {
			console.log(e);
		}
	});
}

function fn_goOrder(itemNo){
	alert(itemNo);
}

//차량조회 팝업닫기
function closeCarSearch(modalNo) {
	$("#modal-" + modalNo).removeClass("md-show");
}
</script>
