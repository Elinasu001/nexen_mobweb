<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>

<%
String[] fBrand = (String[])request.getAttribute("fBrand");
String[] fCarType = (String[])request.getAttribute("fCarType");
String[] fSeason = (String[])request.getAttribute("fSeason");
String[] fRentalYn = (String[])request.getAttribute("fRentalYn");
%>
<%
StringBuffer fBrandValues = new StringBuffer();
StringBuffer fCarTypeValues = new StringBuffer();
StringBuffer fSeasonValues = new StringBuffer();
StringBuffer fRentalYnValues = new StringBuffer();

if(fBrand !=null){
	for (int i = 0; i < fBrand.length; ++i) {
    if (fBrandValues.length() > 0) {
    	fBrandValues.append(',');
    }
    fBrandValues.append('"').append(fBrand[i]).append('"');
	}
}
if(fCarType !=null){
	for (int i = 0; i < fCarType.length; ++i) {
	    if (fCarTypeValues.length() > 0) {
	    	fCarTypeValues.append(',');
	    }
	    fCarTypeValues.append('"').append(fCarType[i]).append('"');
	}
}
if(fSeason !=null){
	for (int i = 0; i < fSeason.length; ++i) {
	    if (fSeasonValues.length() > 0) {
	    	fSeasonValues.append(',');
	    }
	    fSeasonValues.append('"').append(fSeason[i]).append('"');
	}
}
if(fRentalYn !=null){
	for (int i = 0; i < fRentalYn.length; ++i) {
	    if (fRentalYnValues.length() > 0) {
	    	fRentalYnValues.append(',');
	    }
	    fRentalYnValues.append('"').append(fRentalYn[i]).append('"');
	}
}


%>
<link type="text/css" rel="stylesheet" href="/css/new_layout.css">

<link type="text/css" rel="stylesheet" href="/css/product_detail_new.css">
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="/css/jquery-ui.css">

<link rel="stylesheet" type="text/css" href="/css/nice-select.css">
<script src="/js/lib/jquery.nice-select.min.js"></script>

<!-- 무상교체서비스 제외처리 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="toDay" />
<!-- 무상교체서비스 제외처리 -->

<div class="header-choice-size">
	<div class="choice-size-inner">
		<ul id="carSearchParamView">
		</ul>
		<div class="btn-box">
			<a onclick="openSizeFinder( 'num'  )"><img src="/img/product/btn_rescan.png" alt="다시 검색하기" style="cursor:pointer;"/></a>
		</div>
	</div>
</div>
<div class="product-detail-top">
	<div class="step-nav">
		<ul>
			<li>1. 상품 선택</li>
			<li class="active">2. 옵션 선택</li>
			<li>3. 주문 및 결제</li>
		</ul>
	</div>
	<c:if test="${bestYn == 'Y' || hitYn == 'Y' || rcmdYn == 'Y' || recomYn == 'Y'}">
	</c:if>
	<div class="stateIcon">
		<ul class = 'stateIcon01'>
			<!-- 베스트-->
			<c:if test="${resultMapCom.rcmdYn eq 'Y' }">
				<li><img src="/img/product/ico-best-on.png" alt="best" /></li>
			</c:if>
			<!-- 히트-->
			<c:if test="${resultMapCom.hitYn eq 'Y'}">
				<li><img src="/img/product/ico-hot-on.png" alt="hit" /></li>
			</c:if>
		</ul>
	</div>
	<div class="product-slogan">${resultMapCom.stpntCont}</div>
	<div class="product-logo">
		<%--
		<c:if test="${fn:replace(resultMapCom.petternCd,'\\'','') == 'NFERA AU7'}">
			<img src="/img/product/detail_au7.png">
		</c:if>
		<c:if test="${resultMapCom.petternCd == 'NFERA-RU5'}">
			<img src="/img/product/detail_ru5.png">
		</c:if>
		<c:if test="${fn:replace(resultMapCom.petternCd,'\\'','') == 'NFERA AU5'}">
			<img src="/img/product/detail_au5.png">
		</c:if>
		<c:if test="${resultMapCom.petternCd == 'ROADIAN GTX'}">
			<img src="/img/product/detail_gtx.png">
		</c:if>
		<c:if test="${resultMapCom.petternCd == 'NFERA SU1'}">
			<img src="/img/product/detail_su1.png">
		</c:if>
		<c:if test="${resultMapCom.petternCd == 'NPRIZ AH8'}">
			<img src="/img/product/detail_ah8.png">
		</c:if>
		<c:if test="${resultMapCom.petternCd == 'NPRIZ AH5'}">
			<img src="/img/product/detail_ah5.png">
		</c:if>
		<c:if test="${resultMapCom.petternCd == 'NPRIZ RH7'}">
			<img src="/img/product/detail_rh7.png">
		</c:if>
		 --%>
		 <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${logoDtlImgUrl}" alt="" />
	<div class="product-size"></div>

	<!-- product thumbnail -->
	<div class="product-thumb">
		<div class="proThum">
			<!-- 렌탈이 있을경우 -->
			<%--
			<c:if test="${systemGbn eq 'R' || systemGbn eq 'C' }">
				<c:forEach var="name" items="${atflPathNmList}" varStatus="status">
					<c:if test="${status.count != 4}">
						<div><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>/atprdfile_cms/${name}" alt=""/></div>
					</c:if>
					<c:if test="${status.count == 4}">

						<div class="maskWrap">
							<div class="circle">
								<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>/atprdfile_cms/${name}" alt="">
							</div>
							<img src="/img/product/product_thum_mask_bg.png" alt="">
						</div>

					</c:if>
				</c:forEach>
			</c:if>
			<!-- 렌탈은 없고 구매만 있을경우 -->
			<c:if test="${systemGbn eq 'O' }">
					<div><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${resultMapCom.dtlSubImg1Url}" alt=""/></div>
					<div><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${resultMapCom.dtlSubImg2Url}" alt=""/></div>
					<div><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${resultMapCom.dtlSubImg3Url}" alt=""/></div>
					<div class="maskWrap">
						<div class="circle">
							<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${resultMapCom.dtlSubImg4Url}" alt="">
						</div>
						<img src="/img/product/product_thum_mask_bg.png" alt="">
					</div>
			</c:if>
			 --%>
			 <c:forEach var="tireImg" items="${tireImgList}" varStatus="status">
			 	<c:if test="${status.count != 4}">
			 		<div><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${tireImg}" alt="타이어이미지" /></div>
			 	</c:if>
			 	<c:if test="${status.count == 4}">
			 		<div class="maskWrap">
			 			<div class="circle">
			 				<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${tireImg}" alt="" />
			 			</div>
		 				<img src="/img/product/product_thum_mask_bg.png" alt="">
			 		</div>
			 	</c:if>
			 </c:forEach>
		</div>
		<div class="slide-rang">
			<div id="slideBar" ></div>
		</div>
	</div>

	<div class="product-type">
		<div class='review' id="reviewTab">
			<span id="reviewTabStarPoint" class="star point${resultMapCom.reviewGrdPtImg*10}"></span>
			<span id="reviewTabScore" class='score'>${resultMapCom.reviewGrdPt}</span>
			<span id="reviewTabCnt" class='cnt'>(${resultMapCom.reviewCnt})</span>
		</div>
<%--
		<c:if test="${ resultMapCom.classCd eq 'P1' or classCd eq 'P1'}">
        	<span>승용차</span>
        </c:if>
		<c:if test="${ resultMapCom.classCd eq 'S1' or classCd eq 'S1'}">
            <span>SUV</span>
        </c:if>
		<c:if test="${ resultMapCom.seasonCd eq '01'}">
        	<span>사계절용</span>
        </c:if>
		<c:if test="${ resultMapCom.seasonCd eq '02'}">
        	<span>겨울철용</span>
        </c:if>
         --%>
         ${resultMapCom.classCdNm}· ${resultMapCom.seasonCdNm}
         <span id="oeYnTxT">
         <c:if test="${fn:contains(TireSize, '순정') eq true}">순정</c:if>
         <c:if test="${fn:contains(TireSize, '호환') eq true}">호환</c:if>
         <c:if test="${fn:contains(TireSize, '범용') eq true}">범용</c:if>
         </span>

	</div>
	<div class="order-introduce" id="couponYn" style="display:none;">
		<!-- 구매 -->
             <c:if test="${labelType == 'O' || labelType == 'C' }">

		<div class="buy-info">
			<dl class='price'>
				<dt>할인가</dt>
				<dd>
					<span class="org_price"></span>
					<span class="ext_price"></span>
				</dd>
			</dl>
			<dl>
				<dt>기본 할인</dt>
				<dd>40% 할인 쿠폰 제공
				<a href="javascript:;" id="coupon" class="coupon-btn" style="display:none;"><img src="/img/product/get_coupon.png" alt="쿠폰받기"/></a>
				</dd>
			</dl>
			<dl>
				<dt>타이어 장착</dt>
				<dd>무료(TPMS 탈장착비 포함)</dd>
			</dl>
			<dl>
				<dt>항균연막탈취</dt>
				<dd>무료</dd>
			</dl>
			<dl>
				<dt>GO 서비스<br>(방문장착)</dt>
				<dd><b>출장비 무료 이벤트 <span style="text-decoration:line-through; text-decoration-color:red; text-decoration-thickness:2px;">50,000원</span></b></dd>
			</dl>
		</div>

		</c:if>

		<!-- 렌탈-->
           <c:if test="${labelType == 'R' || labelType == 'C' }">
		<div class="rent-info">

			<dl class='price'>
				<dt>월 렌탈 최저가</dt>
				<dd class="monthMinRentAmt"></dd>
			</dl>
			<div class="desc">
				※ 렌탈 최저가는 36개월 2본 렌탈 기준 가격입니다.<br/>
				※ 하나카드 최대 1만6천원 할인, 국민카드 최대 2만원 할인
			</div>
		</div>
		</c:if>
	</div>  <%-- /order-introduce --%>
	</div>
	<!-- //product thumbnail -->
	<!-- layerPopup > 비회원 주문 조회 // -->
	<div class="popupWrap md-modal md-effect-1" id="modal-nonCustContinue">
		<div class="modal-inner">
			<!-- md-show -->
			<header class="noLine">
				<a href="#" class="layPopClose md-close"></a>
			</header>
			<!--contents-->
			<div class="popContents">
				<div class="header">
					<img src="/img/product/no_coupon.png"/>
					비회원으로 주문하시면 <br/>
					쿠폰할인을 받을 수 없습니다.
				</div>
				<div class="agreement">
					<div class="agreement-item">
						개인정보 수집 및 이용<span class="red">(필수)</span>
						<a href="javascript:policyLayPopOpen('modal-privacyPolicy');">view</a>
					</div>
					<div class="agreement-item">
						개인정보 처리업무 위탁 동의<span class="red">(필수)</span>
						<a href="javascript:policyLayPopOpen('modal-consignment');">view</a>
					</div>
				</div>
				<div class="btnArea">
					<button type="button" class="type04 btn-nouser" onclick="javascript:nonCustOrderPass();">모두 동의 후 비회원 주문  </button>
					<button type="button" class="type04 btn-login" onclick="javascript:nonCustLogin();">회원 로그인</button>
				</div>
			</div>
			<!--contents-->
		</div>
	</div>

	<div class="orderbox-wrap">

		<div class="orderbtn-wrap">

			<c:choose>
			   <c:when test="${labelType eq 'O'}">
               		<button class="buy_btn"    onclick="openOrderBox('O')" >구매하기</button>
			   </c:when>
			   <c:when test="${labelType eq 'R'}">
					<button class="rental_btn" onclick="openOrderBox('R')" >렌탈하기</button>
			   </c:when>
			   <c:when test="${labelType eq 'C' && fn:trim(resultMapCom.matCd) == ''}">
					<button class="buy_btn"    onclick="openOrderBox('O')" >구매하기</button>
               </c:when>
			   <c:otherwise>
               		<button class="buy_btn"    onclick="openOrderBox('O')" >구매하기</button>
               		<button class="rental_btn" onclick="openOrderBox('R')" >렌탈하기</button>
               </c:otherwise>
			</c:choose>
		</div>

		<div class="orderWrap_new">
			<div class="close-wrap">
				<a class='close-btn' onclick="$('.orderWrap_new').slideToggle();" ></a>
			</div>
		<div class="orderpop-wrap">
				<div class="orderCheckWrap">
					<div class="orderOptions" >
						<dl class="opt-qty">
							<dt>구매수량</dt>
							<dd>
								<input type='radio' name='o2oQtyRadio' id='radio02' value='02'><label for='radio02'>2본</label>
								<input type='radio' name='o2oQtyRadio' id='radio04' value='04'><label for='radio04'>4본</label>
							</dd>
						</dl>
						<dl class='opt-aline'>
								<small>
							* 얼라이먼트  정비  [최대 80% 할인! (국산차 / 수입차 동일)]
								<br>
							* <b>GO 서비스 출장비 무료 이벤트 <span style="text-decoration:line-through; text-decoration-color:red; text-decoration-thickness:2px;">50,000원</span></b>
								</small>
						</dl>
						<!-- 추가될 내용 : 상품옵션 -->
						<!-- <div id="serviceTemp" style="display:none "> -->
							<c:forEach var="opt" items="${optList}" varStatus="status">
								<c:if test="${status.count > 0 }" >
									<div class='serviceTemp'>
										<dl class='opt-aline ' style="margin-bottom: 10px;">
											<dt>${opt.optPlcNm }</dt>
										</dl>
										<dl class='radio col' style="margin-bottom: 10px;">
											<div class='alignment_002 optRadio' >
												<dd>
													<div class="radio inline" style="width: 45%">
														<input type='radio' name='o2oOptRadio_${status.count}' id='radioOpta_${status.count}' value='Y'>
														<label for='radioOpta_${status.count}'>정비 : <span class="price-actual">&nbsp<fmt:formatNumber value="${opt.optPchsPrc}" pattern="#,###" /></span></label>
													</div>
													<div class="radio inline" style="width: 40%">
														<input type='radio' name='o2oOptRadio_${status.count}' id='radioOptb_${status.count}' value='N' checked><label for='radioOptb_${status.count}'>${opt.afComment}</label>
													</div>
												</dd>
												<input type='hidden' name='o2oPlcNo_${status.count}' value="${opt.optPlcNo}" >
												<input type='hidden' name='o2oOptPchsPrc_${status.count}' value="${opt.optPchsPrc}" >
												<input type='hidden' name='o2oOptPlcNm_${status.count}' value="${opt.optPlcNm}" >
											</div>
										</dl>
									</div>
								</c:if>
							</c:forEach>
						<!-- </div> -->

					</div>
					<hr/>
					<div class="price" id="salePriceDiv" style="display:none;">
						<dl>
							<dt>할인가</dt>
							<dd>
							<span class="org_price"></span>
							<span class="ext_price"></span>
							</dd>
						</dl>

						<!-- <button type="button" class="torder" id="coupon">쿠폰받기</button> -->

						<span id="sale4descText" class="desc"></span>
					</div>

					<div class="price" id="onlyPriceDiv">
						<dl>
							<dt>구매가</dt>
							<dd>
								<span class="price only_price">￦123,456</span>
							</dd>
						</dl>
						<span id="only4descText" class="desc"></span>
					</div>
					<div class="btnArea">
						<button type="button" class="counsel" id="rentalCounsel1">구매상담</button>
						<button type="button" class="cart" id="productCart1">장바구니</button>
						<button type="button" class="torder" id="productOrder1">주문하기</button>
					</div>
				</div> <%-- /orderCheckWrap --%>
				<div class="rentalCheckWrap">
					<ul id="createRentalList">
						<li>
							<div class="rentalList">
								<dl>
									<dt>렌탈수량</dt>
									<dd id='quantityRen'>
										<input type='radio' name='quantity' id='quantity02' value='02'><label for='quantity02'><span>2본</span></label>
										<input type='radio' name='quantity' id='quantity04' value='04'><label for='quantity04'><span>4본</span></label>
								</dl>
								<dl>
									<dt>렌탈기간</dt>
									<dd id="termRen">
										<input type="radio" name="term" id="term12" value="12" class="type06"><label for="term12"><span>12개월</span></label>
										<input type="radio" name="term" id="term24" value="24" class="type06"><label for="term24"><span>24개월</span></label>
										<input type="radio" name="term" id="term36" value="36" class="type06"><label for="term36"><span>36개월</span></label>
										<!-- <input type="radio" name="term" id="term48" value="48" class="type06"><label for="term48"><span>48개월</span></label> -->
									</dd>
								</dl>
								<dl>
									<dt>렌탈등록비</dt>
									<dd id='feeRen'>
										<%-- <input type='radio' name='term000' id='termradio0100' value='01'><label for='termradio0100'>0</label>
										<input type='radio' name='term000' id='termradio02000' value='02'><label for='termradio02000'>50000</label> --%>

												<select class="wide rentalfee" name="rentalfee">
												<option value="rentaltype00">0</option>
												<option value="freeRental111">50,000</option>
											</select>
											<script>
												$('#feeRen select.rentalfee').niceSelect();
											</script>
									</dd>
								</dl>
								<dl>
									<dt>렌탈상품</dt>
									<dd id="rentalStyleWrap">
										<div>
											<select class="wide rentalstyle" name="rentaltype">
												<option value="rentaltype00">자유렌탈</option>
											</select>
											<script>
												$('#rentalStyleWrap select.rentalstyle').niceSelect();
											</script>

										</div>
										<div class="rental-option-detail-wrap">
											<ul class="rental-option-detail" id="tab_rentaltype00">
											<!-- 무상교체서비스 제외처리 -->
											<c:if test="${toDay < 20220101}">

												<li id="tierFreeSelect">
													<span class="label">타이어 무상교체 <span class="info-ico" tip='tipshow01' ></span></span>
													<span class="retn-opt-select">
														<select class="small wide rent-opt" name="tierFrChg" onchange="setSelCodeNew();"></select>
													</span>
													<!-- <span class="retn-opt"><span class="num">3</span>회</span> -->
												</li>
											</c:if>

												<!-- <li id="engineChageSelect">
													<span class="label">엔진오일 교체 <span class="info-ico" tip='tipshow02' ></span></span>
													<span class="retn-opt-select">
														<select class="small wide rent-opt" name="engineChg" onchange="setSelCodeNew();"></select>
													</span>
												</li> -->
												<li id="freeAlinSelect">
													<span class="label">얼라인먼트서비스 <span class="info-ico" tip='tipshow03' ></span></span>
													<span class="retn-opt-select">
														<select class="small wide rent-opt" name="freeAlin" onchange="setSelCodeNew();"></select>
													</span>
												</li>
												<li id="freeGpsChangSelect">
													<span class="label">무상 위치교환 <span class="info-ico" tip='tipshow04' ></span></span>
													<span class="retn-opt-select">
														<select class="small wide rent-opt" name="freeLoc" onchange="setSelCodeNew();"></select>
													</span>
												</li>
												<!-- <li id="visitCheckSelect">
													<span class="label">방문점검 <span class="info-ico" tip='tipshow05' ></span></span>
													<span class="retn-opt-select">
														<select class="small wide rent-opt" name="visitFree" onchange="setSelCodeNew();"></select>
													</span>
												</li> -->
												<li id="freeCheckSelect">
													<span class="label">Check서비스 <span class="info-ico" tip='tipshow06' ></span></span>
													<span class="retn-opt-select">
														<select class="small wide rent-opt" name="freeCheck" onchange="setSelCodeNew();"></select>
													</span>
												</li>
											</ul>
										</div>
									</dd>
								</dl>
							</div>
						</li>
					</ul>
					<div class="price">
						<dl style="display:none;">
							<dt>추가렌탈료</dt>
							<dd id="plusFreeRentalAmt">0000000</dd>
						</dl>
						<dl style="display:none;">
							<dt>할인금액</dt>
							<dd id="saleFreeRentalAmt">0000000</dd>
						</dl>
						<dl class='total-price'>
							<dt>총 납입금액</dt>
							<dd >
								<span id="totalFreeRentalAmt">￦123,456</span>
								<%-- <span class="card_desc">※ 하나카드 최대 1만6천원 할인<br/>※ 국민카드 최대 2만원 할인</span> --%>
							</dd>
						</dl>

						<dl class='month-price'>
							<dt>월 렌탈료</dt>
							<dd id="monthFreeRentalAmt">￦123,456</dd>
						</dl>
					</div>
					<div class="btnArea type05">
						<button type="button" class="counsel" id="rentalCounsel2">렌탈상담</button>
						<button type="button" class="cart" id="productCart2">장바구니</button>
						<button type="button" class="order" id="productOrder2">주문하기</button>
					</div>
				</div> <%-- /rentalCheckWrap --%>
			</div>
		</div>  <%-- /orderWrap_new --%>
	</div>

       <!-- subContentsWrap -->
    <div class="subContentsWrap">
        <main class="product-detail">
        <!-- ADN 상품패널 설치 start -->
		<div id="suggestad_mobie_wrap_container"></div>
		<script type="text/javascript">
		var adn_suggestad_mobile_param = adn_suggestad_mobile_param || [];
		adn_suggestad_mobile_param.push([{
		 ui:'107378',	
		 ci:'1073780002',
		 gi:'102655'
		}]);
		</script>
		<script type="text/javascript"  src="//fin.rainbownine.net/js/across_adn_recommend_mobile_ad_1.0.5.js"></script>
		<!-- ADN 상품패널 설치 end -->
        
        <!-- product accordion menu -->
          <div class="product-sub-info accordion-box js-accordion">
            <!-- 01: 상품정보 -->
            <div id="product-info">
            	<button type="button" class="btn-detail md-trigger" data-modal="detailView">상품정보 자세히 보기</button>
            </div>
			<!-- video -->
			<div class="videoWrap">
				<c:choose>
					<c:when test="${resultMapCom.movUrl != '' && resultMapCom.movUrl != null && resultMapCom.movUrl.indexOf('http') > -1  }">
						<div class="product-video-playbox">
						<!-- 동영상 -->
							<iframe width="1180" height="400" src="${resultMapCom.movUrl}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        </div>
					</c:when>
					<c:otherwise>
						<c:if test="${resultMapCom.movUrl != '' && resultMapCom.movUrl != null }" >
							<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>/img/product/${resultMapCom.movUrl}" alt="" />
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<%--
			<c:if test="${resultMapCom.movUrl ne '' && resultMapCom.movUrl ne null && fn:contains(resultMapCom.movUrl, 'img_') ne true}">
		        <div class="videoWrap">
			        <div class="product-video-playbox">
					<!-- 동영상 -->
					<iframe width="1180" height="400" src="${resultMapCom.movUrl}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			        </div>
		        </div>
			</c:if>
			 --%>
			<!-- //video -->
            <div class="product-info-view">
                <h4 class="product-info-view_title">기술력_</h4>
                <dl>
                  <dt></dt>
                  <dd>
                      <c:if test="${fn:contains(resultMapCom.techSkilIcon, '01') eq true}"><img src="/img/product/@tp_1.gif" alt="" /></c:if>
                      <c:if test="${fn:contains(resultMapCom.techSkilIcon, '02') eq true}"><img src="/img/product/@tp_2.gif" alt="" /></c:if>
                      <c:if test="${fn:contains(resultMapCom.techSkilIcon, '03') eq true}"><img src="/img/product/@tp_3.gif" alt="" /></c:if>
                      <c:if test="${fn:contains(resultMapCom.techSkilIcon, '04') eq true}"><img src="/img/product/@tp_4.gif" alt="" /></c:if>
                      <c:if test="${fn:contains(resultMapCom.techSkilIcon, '05') eq true}"><img src="/img/product/@tp_5.gif" alt="" /></c:if>
                  </dd>
                </dl>
            </div>

            <div class="product-info-view">
                <h4 class="product-info-view_title">상품 기본 정보_</h4>
                <% pageContext.setAttribute("newLineChar", "\n"); %>
                <dl>
                  <dt>품명 및 모델명</dt>
                  <dd>${fn:replace(resultMapCom.petternCd, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>제조년월</dt>
                  <dd>${fn:replace(resultMapCom.relYmCont, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>안정인증(공산품)</dt>
                  <dd>${fn:replace(resultMapCom.safeCertCont, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>제조자</dt>
                  <dd>${fn:replace(resultMapCom.makerCont, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>제조국 또는 원산지</dt>
                  <dd>${fn:replace(resultMapCom.makerNtCont, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>품질보증기간</dt>
                  <dd>${fn:replace(resultMapCom.qltyAssuCont, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>A/S전화번호</dt>
                  <dd>${fn:replace(resultMapCom.asTelNo, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>주문 후 예상배송기간</dt>
                  <dd>${fn:replace(resultMapCom.exptDeprCont, newLineChar, "<br/>")}&nbsp;</dd>
                  <dt>특이사항</dt>
                  <dd>${fn:replace(resultMapCom.sgftCont, newLineChar, "<br/>")}&nbsp;</dd>
                </dl>
            </div>
         <!-- kpi -->
            <div class="kpi inset-l">
            	<h3>Key Performance Indicators _</h3>
	            <dl>
	              <dt class="mb-m"></dt>
	              <dd>
		                <!-- 4계절 -->
		              <c:if test="${(fn:contains(resultMapCom.seasonCd, '01') eq true) or resultMapCom.seasonCd == ''}">
			              <ul class="gauge-list">
			                  <li class="layout-r">
			                    <span class="tit">마른노면</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.drGrdGauge}" style="width:${resultMapCom.drGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.drGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">젖은노면</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.wrGrdGauge}" style="width: ${resultMapCom.wrGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.wrGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">연비성능</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.feGrdGauge}" style="width: ${resultMapCom.feGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.feGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">승차감/소음</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.ctGrdGauge}" style="width: ${resultMapCom.ctGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.ctGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">마모성능</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.waGrdGauge}" style="width: ${resultMapCom.waGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.waGrd}</span>
			                  </li>
			              </ul>
		              </c:if>
		              <!-- 4계절 -->
			          <c:if test="${fn:contains(resultMapCom.seasonCd, '02') eq true}">
	                  <!-- 겨울용 -->
		                  <ul class="gauge-list">
			                  <li class="layout-r">
			                    <span class="tit">눈길성능</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.ctGrdGauge}" style="width: ${resultMapCom.ctGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.ctGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">빙판길성능</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.ctGrdGauge}" style="width: ${resultMapCom.ctGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.ctGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">마른노면</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.drGrdGauge}" style="width:${resultMapCom.drGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.drGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">젖은노면</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.wrGrdGauge}" style="width: ${resultMapCom.wrGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.wrGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">연비성능</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.feGrdGauge}" style="width: ${resultMapCom.feGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.feGrd}</span>
			                  </li>
			                  <li class="layout-r">
			                    <span class="tit">승차감/소음</span>
			                    <span class="gauge">
			                        <span class="bar" data-gauge="${resultMapCom.ctGrdGauge}" style="width: ${resultMapCom.ctGrdGauge}%;"></span>
			                    </span>
			                    <span class="value">${resultMapCom.ctGrd}</span>
			                  </li>
			              </ul>
			                  <!-- 겨울용 -->
			           </c:if>
	              </dd>
	            </dl>
          </div>
          <!-- //kpi -->
            </div>
            <!-- //01: 상품정보 -->

            <!-- 02: 계약,배송,반품,교환,AS -->
            <div id="product-other" class="accordion">
              <h3>계약/배송/반품/교환/AS</h3>
            </div>
            <div class="accordion-info">
              <div class="product-other-view">
                <div class="service">
                  <h4>주문에서 장착 그리고 정기점검까지!_</h4>
                  <div class="swiper-service">
                    <dl>
                      <dt><span>01</span>타이어주문</dt>
                      <dd>인터넷으로 쉽고<br>간편하게 주문<span class="icon01"></span></dd>
                    </dl>
                    <dl>
                      <dt><span>02</span>무료배송</dt>
                      <dd>내가 지정한 전문 <br>렌탈점으로 배송<span class="icon02"></span></dd>
                    </dl>
                    <dl>
                      <dt><span>03</span>도착문자발송</dt>
                      <dd>주문제품 전문 렌탈점에 <br>도착완료 알림<span class="icon03"></span></dd>
                    </dl>
                    <dl>
                      <dt><span>04</span>무료장착</dt>
                      <dd>주문한<br>전문 렌탈점 방문<span class="icon04"></span></dd>
                    </dl>
                    <dl>
                      <dt><span>05</span>친절한 해피콜</dt>
                      <dd>렌탈계약 확인 및 <br>만족도 전화<span class="icon05"></span></dd>
                    </dl>
                    <dl>
                      <dt><span>06</span>안전운전</dt>
                      <dd>새 타이어로 <br>언제나 안전운전<span class="icon06"></span></dd>
                    </dl>
                    <dl>
                      <dt><span>07</span>주기적 정기점검</dt>
                      <dd>정기 점검 서비스<span class="icon07"></span></dd>
                    </dl>
                  </div>
                </div>
                <div class="product-other-view-inner">
                  <div>
                    <h4>계약안내_</h4>
                    <p>렌탈료는 중도완납 하실 수 있습니다. 계약기간 內 해지 시 위약금이 발생합니다. (위약금 : 잔여 렌탈료 40%, 각종 서비스 비용(장착비, 엔진오일&타이어 무상교체 등의 서비스 비용) 일체) 위의 기재된 사항은 회사 내부 사정에 따라서 변경될 수 있습니다.</p>
                  </div>

                  <div>
                    <h4>배송/장착_</h4>
                    <p>전국 무료 배송 배송/장착 소요시간 (3일 이내 타이어 렌탈 전문점(장착점) 도착, 배송 지연 시 별도 안내, 주말/공휴일 제외)</p>
                  </div>

                  <div>
                    <h4>반품/교환_</h4>
                    <dl>
                      <dt>반품/교환 가능한 경우</dt>
                      <dd>
                        <ul>
                          <li>약관에 의하여 청약철회가 가능한 경우 반품, 교환이 가능합니다.</li>
                          <li>제품의 하자, 배송오류 등의 이유로 반품하실 경우, 반품 배송비는 무료입니다.</li>
                          <li>고객님의 오주문 및 단순한 변심에 의해 상품의 교환 또는 반품 요청 시 왕복 배송비용은 고객님 부담이오니, 양해하여 주시기 바랍니다.</li>
                        </ul>
                      </dd>
                      <dt>반품/교환 불가능한 경우</dt>
                      <dd>
                        <ul>
                          <li>구매자의 사용 또는 일부 소비에 의하여 상품가치가 현저히 감소한 경우</li>
                          <li>고객님의 책임으로 인한 상품 멸실 또는 상품이 훼손된 경우</li>
                          <li>반품/교환 배송비(왕복) : 1만원(개당)</li>
                        </ul>
                      </dd>
                    </dl>
                  </div>

                  <div>
                    <h4>A/S안내_</h4>
                    <p>A/S 문의 : 고객센터(1855-0100)</p>
                    <p>A/S 지점 : 넥센타이어에서 지정한 타이어 렌탈 전문점(장착점) </p>
                  </div>

                  <div>
                    <h4>소유권 이전_</h4>
                    <p>소유권 이전은 장착완료일로부터 5년 이후 이전됩니다. 계약기간 종료 후 렌탈료는 청구되지 않으며, 타이어는 자가관리 통한 사용이 가능합니다.</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- //02: 계약,배송,반품,교환,AS -->

            <!-- 03: 구매후기 -->
            <div id="product-review" onclick="javascript:getReviewList('init');" class="accordion">
              <h3>구매후기</h3>
            </div>

			<div class="review-section" id="tab03">

				<div class="review-section-header">
					<div class="title-wrap">
						<span class="title">고객 총 평점</span>
						<span class="point" id ="totStar">4.8</span>
						<div class="star">
							<div class="progrss-bar" style="width:90%"></div>
						</div>
					</div>
					<div class="review-product">
						<span>리뷰제품</span>
						<select id="ptList">
							<c:forEach var="ptAll" items="${patternCdAll}">
								<c:if test="${ptAll.petternCdNm ne \"N'FERA AU7\"}">
									<option value="${ptAll.petternCdNm}" data-dp="${ptAll.dpPrNo}" data-it="${ptAll.itemCd}">${fn:replace(ptAll.petternCdNm, "\'","")}</option>
								</c:if>
							</c:forEach>
						</select>
<!-- 						<select> -->
<!-- 							<option>N'PRIZ AH8</option> -->
<!-- 						</select> -->
					</div>
				</div>

				<div class="review-section-gallery" id="mediaReview">
				</div>

				<div class="review-section-counter">
					<div class="counter">리뷰 <span id="totalCnt">0</span></div>
					<div class="filter-btn"><button type="button" class="" onclick="toggleFilter(this)">필터</button></div>
				</div>

				<div class="review-section-filter">
					<div class="review-order">
						<div><input type='radio' name='reviewOrder' id='reviewOrderItem02' value='reg' checked><label for='reviewOrderItem02'>최신순</label></div>
						<div><input type='radio' name='reviewOrder' id='reviewOrderItem01' value='rcmd'><label for='reviewOrderItem01'>추천순</label></div>
						<div><input type='radio' name='reviewOrder' id='reviewOrderItem03' value='starsHigh'><label for='reviewOrderItem03'>평점 높은 순</label></div>
					</div>
					<div class="review-filter-type">
						<div><input type='radio' name='reviewFilterType' id='reviewFilterType01' value='' checked><label for='reviewFilterType01'>전체</label></div>
						<div><input type='radio' name='reviewFilterType' id='reviewFilterType02' value='O'><label for='reviewFilterType02'>구매</label></div>
						<div><input type='radio' name='reviewFilterType' id='reviewFilterType03' value='R'><label for='reviewFilterType03'>렌탈</label></div>
					</div>
					<hr/>
					<div class="review-filter-service">
						<div><input type="checkbox" name='reviewFilterService' id='reviewFilterService01' value='Go'><label for='reviewFilterService01'>GO서비스만 보기</label></div>
						<div><input type='checkbox' name='reviewFilterService' id='reviewFilterService02' value='File'><label for='reviewFilterService02'>미디어 리뷰만 보기</label></div>
					</div>
					<hr/>
					<div class="review-side-btn">
						<button type="button" class="submit-filter" id="filterBtn">필터 적용</button>
						<button type="button" class="reset-filter" id="btnReset">초기화</button>
					</div>
				</div>

				<div class="review-container">
					<div>
						<ul id="reviewBox">
<!-- 							<li class="review-item"> -->
<!-- 								<div class="review-head"> -->
<!-- 									<div class="review-type"> -->
<!-- 										<div class="buy-type R"></div> -->
<!-- 										<div class="buy-type R after-m"></div> 한달 후기 -->
<!-- 									</div> -->

<!-- 									<div class="service-info"> -->
<!-- 										<div class="review-title"> -->
<!-- 											<div class="title">타이어교체 후기</div> -->
<!-- 										</div> -->

<!-- 										<div class="writer-info"> -->
<!-- 											<div class="writer">구*태</div> -->
<!-- 											<div class="date">2021.12.29</div> -->
<!-- 										</div> -->
<!-- 									</div> -->

<!-- 								</div> -->

<!-- 								<div class="point-info"> -->
<!-- 									<div class="star-box"><div class="star star-3"></div> <span>3.5</span></div> -->
<!-- 									<div class="rec-box"> -->
<!-- 										<button class="thumb_up">25</button> -->
<!-- 										<button class="thumb_up on">25</button> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								<div class="review-content mini"> -->
<!-- 									<div class="content"> -->
<!-- 										<div class="text"> -->
<!-- 											'타이어 방문교체' -->
<!-- 											넥센의 새로운 시도 신선한 충격이네요. -->
<!-- 											약속된 시간에 정확히 방문해서  교체완료. -->
<!-- 											광명점에서 나오신 기사님들도 너무친절 하였고  타이어 위치교환도 부탁했더니  원래  안되는 서비스인데 흔쾌히 들어주셨어요. 앞으로 계속 이용하겠습니다... -->
<!-- 										</div> -->
<!-- 										<div class="purch-info"> -->
<!-- 											<div class="car-box">현대 | 코나 </div> -->
<!-- 											<div class="product-box">N'PRIZ AH8 | 225/55R17 </div> -->
<!-- 											<div class="service-box">GO서비스 | 방문장착</div> -->
<!-- 										</div> -->

<!-- 										<div class="service-star"> -->
<!-- 											<h5>만족도</h5> -->
<!-- 											<div>상품 <div class="star"></div> 3</div> -->
<!-- 											<div>기사 <div class="star"></div> 3</div> -->
<!-- 											<div>서비스 <div class="star"></div> 3</div> -->
<!-- 										</div> -->

<!-- 										<div class="picture"> -->
<!-- 											<a href="javascritp:;" onclick="openReviewItem();" class="vod"><img src="/img/product/review_sample_01.jpg"></a> -->
<!-- 											<a href="javascritp:;" onclick="openReviewItem();"><img src="/img/product/review_sample_02.jpg"></a> -->
<!-- 											<a href="javascritp:;" onclick="openReviewItem();"><img src="/img/product/review_sample_03.jpg"></a> -->
<!-- 											<a href="javascritp:;" onclick="openReviewItem();"><img src="/img/product/review_sample_03.jpg"></a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="review-reply"> -->
<!-- 										<div class="content"> -->
<!-- 											<div class="text"> -->
<!-- 												서비스를 이용해주셔서 감사합니다.<br/> -->
<!-- 												다음번 이용 시 더 나은 서비스로 찾아 뵙겠습니다. -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="reply-ico"> -->
<!-- 											<span>담당자</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="review-more"> -->
<!-- 									<button type="button" onclick="reivewMoreView(this)">더보기</button> -->
<!-- 								</div> -->
<!-- 							</li> -->
							<!--	 구매 후기 영역	-->
							<!--	 구매 후기 영역	-->
						</ul>
					</div>

									<!--paging-->
<!-- 									<div class="paging" id="paging"></div> -->
					<button id="reviewMore" onclick="javascript:getReviewList('more');" class="product-list-more full-width inset-m">
						<span>더보기</span>
					</button>
									<!--paging-->
				</div>

			</div>

<%--
            <div class="accordion-info">
              <div class="product-review-view">
                <div class="count-box utility">
                  <div class="utility-result-total inline">
                    <span>total</span>
                    <span id="totalCnt">0</span>
                  </div>
                </div>
              	<!-- 구매후기 내용 -->
                <div class="review-group js-reviewGroup" id="reviewBox"></div>
                <!-- 구매후기 내용 -->
              <!-- footerUtility -->
		      <button id="reviewMore" onclick="javascript:getReviewList('more');" class="product-list-more full-width inset-m">
		        <span>더보기</span>
		      </button>
              </div>
            </div>
            <!-- //03: 구매후기 -->
--%>



          </div>
          <!-- //product accordion menu -->
        </main>
      </div>
      <!-- //subContentsWrap -->

    <!-- Popup Group -->
    <!-- ################################################################################ -->
	<!-- 렌탈추가검색안내 -->
	<div class="popupWrap md-effect-1 md-modal" id="carInfoSearch">
	    <div class="popContents search-popup">
	        <a href="javascript:fn_carInfoSearchClose();" class="layPopClose md-close"></a>
	        <header>
	          <h2>렌탈 추가 검색 안내</h2>
	        </header>
	        <div class="trans-bg alert text-center inset-ml">
	          <p class="mb-m"><span>렌탈 주문 진행은 정확한 차량번호 또는</span> <span>차종 검색 이후에 가능합니다.</span></p>
	          <img src="../img/common/pop_alert_01.png" alt="">
	        </div>
	    </div>
	    <div class="btn-wrap layout-r same-size">
		  <button type="button" class="inset-m full-width btn-gray-light" onclick="javascript:fn_carInfoSearchClose();">취소</button>
		  <button type="button" class="inset-m full-width btn-primary" onclick="javascript:fn_carInfoSearchPopGo();">차량검색</button>

	    </div>
	</div>

    <!-- 구매주문시 뜨는 팝업-->
      <div class="fullPopup md-effect-1" id="o2ojangchackGuide">
            <div class="popContents search-popup">
              <header>
                  <h2>장착 서비스 이용가이드</h2>
              </header>

              <div class="popup-contents inset-m">
                  <div class="mounting">
                    <h3>방문장착 서비스 _</h3>
                    <p>차량키를 받지 않고 차량 장소(위치)차량번호만 알려주면 원하는 시간대에 타이어 교체 서비스</p>

                    <!-- <h3>픽업&딜리버리 서비스 _</h3>
                    <p>방문장착 서비스가 불가한 현장이거나 차량 이동이 필요한 경우 픽업 후 다시 딜리버리 해주는 서비스</p> -->

                    <h3>전문점 장착 서비스 _</h3>
                    <p>편하신 시간에 가까운 전문점에 방문해서 받는 서비스</p>

                    <h3>현재 O2O 장착 서비스 가능 지역</h3>
                    <p>
                        더 많은 고객들의 편의를 위해 서비스 권역을 확대 중에 있습니다. 많은 관심 부탁 드립니다.
                    </p>

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

                  </div>

                </div>

              <div class="btnArea type03 next-box">
                <button type="button" onclick="javascript:fn_o2oOrderGo();" class="search-popup-control type01 w100per">확인</button>
                </div>
            </div>
          </div>
      <!-- //차량 간편 검색 INDEX -->



      <!-- 타이어 사이즈 확인 TIP -->
      <div class="popupWrap md-modal md-effect-1" id="tireSizeTip">
                <div class="popContents popup-tip">
                  <a href="#" class="layPopClose md-close js-customMdBgClose"></a>
                  <header>
                    <div class="popup-tip-tag">Tip!</div>
                    <h2>타이어의 사이즈 확인</h2>
                  </header>

                  <div>
                    <p class="mt-m"><b>장착할 차량의 타이어 옆면에 있는 숫자가 타이어 사이즈 입니다.</b></p>
                    <small>※ 같은 차종이라도 등급에 따라 타이어 사이즈가 다른 경우가 있습니다.</small>
                    <div class="mt-m">
                      <img src="../img/product/tip_tire_size_check.png" alt="">
                    </div>
                  </div>
                </div>
              </div>
      <!-- //타이어 사이즈 확인 TIP -->
      <!-- 라이프 스타일 -->
      <!-- styleLifePop: 라이프 스타일에 맞는 타이어 -->
            <div class="md-effect-1 fullPopup" id="styleLifePop">
              <div class="popContents js-lifeStyleRecommend">
                <header>
                  <h2>라이프스타일 추천<a href="#" class="layPopClose md-close"></a></h2>
                </header>
                <div class="popup-contents inset-m">
                  <div class="filter-option">
                    <h3>타이어 등급 정보에 순위를 매겨보세요. _</h3>
                    <div class="layout-c inline-m mb-m">
                      <div class="layout-r mb-s">
                        <span class="checkbox type01 inline col-3">
                          <input type="checkbox" class="checkbox-input" name="rating1" id="rating01" checked>
                          <label class="checkbox-label" for="rating01">제동성능</label>
                        </span>
                        <span class="checkbox type01 inline col-3">
                          <input type="checkbox" class="checkbox-input" name="rating1" id="rating02">
                          <label class="checkbox-label" for="rating02">연비효율</label>
                        </span>
                        <span class="checkbox type01 inline col-3">
                          <input type="checkbox" class="checkbox-input" name="rating1" id="rating03">
                          <label class="checkbox-label" for="rating03">승차감/소음</label>
                        </span>
                      </div>
                      <div class="layout-r">
                        <span class="checkbox type01 inline col-3">
                          <input type="checkbox" class="checkbox-input" name="rating1" id="rating04">
                          <label class="checkbox-label" for="rating04">주행거리</label>
                        </span>
                        <span class="checkbox type01 inline col-3">
                          <input type="checkbox" class="checkbox-input" name="rating1" id="rating05">
                          <label class="checkbox-label" for="rating05">눈길성능</label>
                        </span>
                        <span class="checkbox type01 inline col-3">
                          <input type="checkbox" class="checkbox-input" name="rating1" id="rating06">
                          <label class="checkbox-label" for="rating06">빙판길성능</label>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="rank-list">
                    <div class="rank-list-item r01 selected">
                      <span class="rank-sequence">1<sup>st</sup></span>
                      <span class="rank-text">제동성능</span>
                      <button type="button" class="rank-reset">취소</button>
                    </div>
                    <div class="rank-list-item r02">
                      <span class="rank-sequence">2<sup>nd</sup></span>
                      <span class="rank-text">성능을 추가하세요!</span>
                      <button type="button" class="rank-reset">취소</button>
                    </div>
                    <div class="rank-list-item r03">
                      <span class="rank-sequence">3<sup>rd</sup></span>
                      <span class="rank-text">성능을 추가하세요!</span>
                      <button type="button" class="rank-reset">취소</button>
                    </div>
                    <div class="rank-list-item r04">
                      <span class="rank-sequence">4<sup>th</sup></span>
                      <span class="rank-text">성능을 추가하세요!</span>
                      <button type="button" class="rank-reset">취소</button>
                    </div>
                    <div class="rank-list-item r05">
                      <span class="rank-sequence">5<sup>th</sup></span>
                      <span class="rank-text">성능을 추가하세요!</span>
                      <button type="button" class="rank-reset">취소</button>
                    </div>
                    <div class="rank-list-item r06">
                      <span class="rank-sequence">6<sup>th</sup></span>
                      <span class="rank-text">성능을 추가하세요!</span>
                      <button type="button" class="rank-reset">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="btnArea type03 next-box">
                <button type="reset" class="inset-m full-width btn-gray">초기화</button>
                <button type="button" class="inset-m full-width btn-primary">적용</button>
              </div>
            </div>
            <!-- //라이프 스타일에 맞는 타이어 -->
      <!-- //라이프 스타일 -->
      <!-- 필터 -->
      <!-- filterPop: 필터 -->
            <div class="md-effect-1 fullPopup" id="filterPop">
              <div class="popContents">
                <header>
                  <h2>필터<a href="#" class="md-close layPopClose"></a></h2>
                </header>
                <div class="popup-contents">
                  <div class="filter-option">
                    <h3>차량유형</h3>
                    <div class="layout-r inline-m">
                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="cartype" id="cartype01">
                        <label class="checkbox-label" for="cartype01">승용차</label>
                      </span>

                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="cartype" id="cartype02">
                        <label class="checkbox-label" for="cartype02">SUV</label>
                      </span>

                      <span class="checkbox inline type01 col-2">
                        <input class="checkbox-input" type="checkbox" name="cartype" id="cartype03">
                        <label class="checkbox-label" for="cartype03">VAN/소형트럭</label>
                      </span>
                    </div>

                    <h3>브랜드</h3>
                    <div class="layout-r inline-m">
                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="carbrand" id="brand01">
                        <label class="checkbox-label" for="brand01">넥센</label>
                      </span>

                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="carbrand" id="brand02">
                        <label class="checkbox-label" for="brand02">미쉐린</label>
                      </span>

                      <span class="checkbox inline type01 col-2">
                        <input class="checkbox-input" type="checkbox" name="carbrand" id="brand03">
                        <label class="checkbox-label" for="brand03">콘티넨탈</label>
                      </span>
                    </div>

                    <h3>계절</h3>
                    <div class="layout-r inline-m">
                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="season" id="seasonall">
                        <label class="checkbox-label" for="seasonall">사계절</label>
                      </span>

                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="season" id="season01">
                        <label class="checkbox-label" for="season01">여름</label>
                      </span>

                      <span class="checkbox inline type01 col-2">
                        <input class="checkbox-input" type="checkbox" name="season" id="season02">
                        <label class="checkbox-label" for="season02">가을</label>
                      </span>
                    </div>

                    <h3>구매유형</h3>
                    <div class="layout-r inline-m">
                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="sell-type" id="sell">
                        <label class="checkbox-label" for="sell">구매</label>
                      </span>

                      <span class="checkbox inline type01 col-3">
                        <input class="checkbox-input" type="checkbox" name="sell-type" id="rant">
                        <label class="checkbox-label" for="rant">렌탈</label>
                      </span>

                      <span class="checkbox inline type01 col-2"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="btnArea type03 next-box">
                <button type="reset" class="type04 center w50per">초기화</button>
                <button type="button" class="type01 center w50per">적용</button>
              </div>
            </div>
            <!-- <div class="md-overlay"></div> -->
            <!-- //필터 -->
      <!-- //필터 -->
      <!-- ######################################### -->
      <!-- //Popup Group -->

      <!-- 상품 상세 Popup Group -->
      <!-- ######################################### -->
      <!-- 렌탈추가검색안내 -->
      <div class="popupWrap md-effect-1 md-modal" id="alert-1">
    <div class="popContents search-popup">
        <a href="#" class="layPopClose md-close"></a>
        <header>
          <h2>렌탈 추가 검색 안내</h2>
        </header>
        <div class="trans-bg alert text-center inset-ml">
          <p class="mb-m"><span>렌탈 주문 진행은 정확한 차량번호 또는</span> <span>차종 검색 이후에 가능합니다.</span></p>
          <img src="../img/common/pop_alert_01.png" alt="">
        </div>
    </div>
    <div class="btn-wrap layout-r same-size">
      <button type="reset" class="inset-m full-width btn-gray-light">취소</button>
      <button type="submit" class="inset-m full-width btn-primary">차량 검색</button>
    </div>
  </div>
      <!-- //렌탈추가검색안내 -->
      <!-- tip01: 구매하기 - 구매수량 -->
      <div class="popupWrap md-effect-1 md-modal" id="tip1st">
                <div class="popContents popup-tip">
                  <header>
                    <div class="popup-tip-tag">Tip!</div>
                    <h2>타이어 무상 교체 서비스<a href="#" class="md-close layPopClose"></a></h2>
                  </header>
                  <p class="mt-m"><b>고객님께서 렌탈 계약하신 타이어와 동일한 규격의 타이어로 무상교체해드립니다.</b></p>
                  <div class="mt-m mb-m tip-list-type">
                    <ul>
                      <li>렌탈중인 제품이 단종 될 경우 동급의 제품으로 변경되어 제공될 수 있습니다.</li>
                      <li>TPMS, 런플랫 타이어의 경우 장착점에서 추가 비용이 과금될 수 있습니다.</li>
                      <li>계약기간 내 렌탈 타이어가 마모한계선 이하의 마모진행, 주행 불가능한 파손의 경우는 언제나 신청하실 수 있으며, 계약기간 종료 6개월 전 ~ 계약 만료일까지는 조건없이 신청이 가능합니다.</li>
                    </ul>
                  </div>
                </div>
              </div>
      <!-- //tip01: 구매하기 - 구매수량 -->
      <!-- tip01: 구매하기 - 구매수량 -->
      <div class="popupWrap md-effect-1 md-modal" id="tip2nd">
                <div class="popContents popup-tip">
                  <header>
                    <div class="popup-tip-tag">Tip!</div>
                    <h2>엔진오일 교체 서비스<a href="#" class="md-close layPopClose"></a></h2>
                  </header>
                  <p class="mt-m"><b>고객님께서 렌탈 계약하신 차종에 맞는 엔진오일 교체 서비스를 제공해드립니다.</b></p>
                  <div class="mt-m mb-m tip-list-type">
                    <ul>
                      <li>제공되는 엔진오일 부품(엔진오일, 오일크리너, 에어핑터)는 순정이 아닌 고객님의 차종에 맞는 부품이 제공됩니다.</li>
                      <li>수입차량의 경우 부품만 제공되며 교체 공임은 교체점에서 납부하셔야 합니다.(수입차 가능 교체점 확인 필요)
                        </li>
                    </ul>
                  </div>
                </div>
              </div>
      <!-- //tip01: 구매하기 - 구매수량 -->

	    <!-- modal-2: 상품정보 자세히보기 -->
	    <div class="md-effect-1 fullPopup" id="detailView">
	      <div class="popContents popup-dark">
	        <a href="#" class="layPopClose md-close"></a>
	        <header>
	          <h2>상품정보 자세히보기</h2>
	        </header>
	        <div class="popup-contents-nobottom">
	           	<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${prodDtlInfoImg}" alt="타이어 상세정보"/>
	            <%--
	            <c:if test="${systemGbn eq 'R' || systemGbn eq 'C'}">
	           		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atprdfile_cms/${prodViewImg}" alt="타이어 상세정보"/>
	  			</c:if>
	  			<c:if test="${systemGbn eq 'O' }">
	  				<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${resultMapCom.infoDtlImgUrl}"  alt=""/>
	  			</c:if>
	  			 --%>
	        </div>
	      </div>
	    </div>
	    <!-- modal-2: 상품정보 자세히보기 -->

<!-- 후기 팝업 02 -->

<div class="reviewFullPopup md-effect-1" id="reviewDetailView_popup">
	<header>
		<a href="javascript:;" onclick="closeReviewDetailPopup();" class="layPopClose"></a>
		<span>리뷰 자세히 보기</span>
	</header>
	<div class="modal-body">

		<div class="review-container">

			<div class="review-btns" id="pageReview">
<!-- 				<button class="btn-prev" id="preClick">이전 리뷰 보기</button> -->
<!-- 				<button class="btn-next" id="postClick">다음 리뷰 보기</button> -->
			</div>

			<div class="review-gallery" id="reviewImg">
<!-- 				<div class="detail-image"> -->
<!-- 					<img src="/img/product/review_sample_01.jpg"> -->
<!-- 				</div> -->
<!-- 				<div class="thumbs"> -->
<!-- <!-- 					<a href="javascritp:;" class="thumb-vod" ><img src="/img/product/review_sample_01.jpg"></a> -->
<!-- 					<a href="javascript:;" class="thumb-img"><img src="/img/product/review_sample_02.jpg"></a> -->
<!-- 					<a href="javascript:;" class="thumb-img"><img src="/img/product/review_sample_03.jpg"></a> -->
<!-- 					<a href="javascript:;" class="thumb-img"><img src="/img/product/review_sample_03.jpg"></a> -->
<!-- 				</div> -->
			</div>

				<div class="review-item mini" id="reviewPop">
<!-- 					<div class="review-more"> -->
<!-- 						<button type="button" onclick="popup_toggleReivewMoreView(this)">더보기</button> -->
<!-- 					</div> -->
<!-- 					<div class="review-head"> -->
<!-- 						<div class="review-type"> -->
<!-- 							<div class="buy-type R"></div> -->
<!-- 							<div class="buy-type R after-m"></div> 한달 후기 -->
<!-- 						</div> -->

<!-- 						<div class="service-info"> -->
<!-- 							<div class="review-title"> -->
<!-- 								<div class="title">타이어교체 후기</div> -->
<!-- 							</div> -->

<!-- 							<div class="writer-info"> -->
<!-- 								<div class="writer">구*태</div> -->
<!-- 								<div class="date">2021.12.29</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 					</div> -->

<!-- 					<div class="point-info"> -->
<!-- 						<div class="star-box"><div class="star star-3"></div> <span>3.5</span></div> -->
<!-- 						<div class="rec-box"> -->
<!-- 							<button class="thumb_up">25</button> -->
<!-- 							<button class="thumb_up on">25</button> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="review-content"> -->
<!-- 						<div class="content"> -->
<!-- 							<div class="text"> -->
<!-- 								'타이어 방문교체' -->
<!-- 								넥센의 새로운 시도 신선한 충격이네요. -->
<!-- 								약속된 시간에 정확히 방문해서  교체완료. -->
<!-- 								광명점에서 나오신 기사님들도 너무친절 하였고  타이어 위치교환도 부탁했더니  원래  안되는 서비스인데 흔쾌히 들어주셨어요. 앞으로 계속 이용하겠습니다... -->
<!-- 							</div> -->
<!-- 							<div class="purch-info"> -->
<!-- 								<div class="car-box">현대 | 코나 </div> -->
<!-- 								<div class="product-box">N'PRIZ AH8 | 225/55R17 </div> -->
<!-- 								<div class="service-box">GO서비스 | 방문장착</div> -->
<!-- 							</div> -->

<!-- 							<div class="service-star"> -->
<!-- 								<h5>만족도</h5> -->
<!-- 								<div>상품 <div class="star"></div> 3</div> -->
<!-- 								<div>기사 <div class="star"></div> 3</div> -->
<!-- 								<div>서비스 <div class="star"></div> 3</div> -->
<!-- 							</div> -->


<!-- 						</div> -->
<!-- 						<div class="review-reply"> -->
<!-- 							<div class="content"> -->
<!-- 								<div class="text"> -->
<!-- 									서비스를 이용해주셔서 감사합니다.<br/> -->
<!-- 									다음번 이용 시 더 나은 서비스로 찾아 뵙겠습니다. -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="reply-ico"> -->
<!-- 								<span>담당자</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
		</div>
	</div>

</div>

<!-- 후기 팝업 02 //-->

<!-- 후기 팝업 01 -->

<div class="reviewFullPopup md-effect-1" id="reviewGallery_popup">
	<header>
			<a href="javascript:;" onclick="closeReviewGallery();" class="layPopClose"></a>
			<span>리뷰 전체 보기</span>
	</header>
	<div class="modal-body" id="reviewPop2">
<!-- 		<div class="photo-gallery"> -->
<!-- 			<a href="javascript:;" onclick="openReviewItem();" class="vod"><img src="/img/product/review_sample_01.jpg"></a> -->
<!-- 			<a href="javascript:;" onclick="openReviewItem();"><img src="/img/product/review_sample_02.jpg"></a> -->
<!-- 			<div class="more-view"> -->
<!-- 				<button type="button">리뷰 더 보기</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>

</div>

<!-- 후기 팝업 01 //-->

	<!-- ************************로그인팝업************************ -->
	<%@ include file="/WEB-INF/view/login/userLoginPopup.jsp" %>
	<!-- ************************//로그인팝업************************ -->
	<input type="hidden" id="cpnPlcPtrnYn" value="N"> <!-- 쿠폰 정책의 해당 타이어 패턴 존재 유무로 쿠폰 버튼 노출 처리 -->
	<input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->

	<form id="carInfoFrm" name="carInfoFrm" method="post" >

      <!-- 그룹가격 적용여부 -->
		<input type="hidden" name="grpPay" id="grpPay" value="${grpPay}" />
		<input type="hidden" name="dpPrNo"  		id="dpPrNo"      value="${resultMapCom.dpPrNo}" />           <!--  전시상품번호 	 -->
		<input type="hidden" name="matCd"       	id="matCd" 		 value="${resultMapCom.matCd}" />            <!-- 상품코드 -->
		<input type="hidden" name="patternCd"    	id="patternCd" 	 value="${resultMapCom.patternCd}" />        <!-- 패턴 코드 -->
		<input type="hidden" name="rentPatternCd"   id="rentPatternCd" value="${resultMapCom.rentPatternCd}" />  <!-- 렌탈용 패턴 코드 -->
		<input type="hidden" name="makerCd"   		id="makerCd"  	 value="${resultMapCom.makerCd}" />          <!-- 제조사 코드 -->
		<input type="hidden" name="makerNm"    	    id="makerNm"  	 value="${resultMapCom.makerNm}" />          <!-- 제조사 명 -->
		<input type="hidden" name="modelCd"    	    id="modelCd"  	 value="${resultMapCom.modelCd}" />          <!-- 차 모델 코드 -->
		<input type="hidden" name="modelNm"    	    id="modelNm"  	 value="${resultMapCom.modelNm}" />          <!-- 차 모델  명 -->
		<input type="hidden" name="contentsCd"    	id="contentsCd"  value="${resultMapCom.contentsCd}"/>        <!-- 차 사양 코드 -->
		<input type="hidden" name="contentsNm"    	id="contentsNm"  value="${resultMapCom.contentsNm}"/>        <!-- 차 사양명 -->
		<input type="hidden" name="classCd"    	    id="classCd" 	 value="${resultMapCom.classCd}"/>           <!-- 차량분류 -->
		<input type="hidden" name="classCdNew" 	    id="classCdNew" value="${resultMapCom.classCdNew}"/>
		<input type="hidden" name="carNo"      	    id="carNo" 		 value="${resultMapCom.carNo}"/>             <!-- 차량번호 -->
		<input type="hidden" name="dMakerCd"    	id="dMakerCd" 	 value="${resultMapCom.dMakerCd}"/>          <!-- 제조사 코드 -->
		<input type="hidden" name="searchSw"    	id="searchSw" 	 value="${resultMapCom.searchSw}"/>          <!-- 단면폭 -->
		<input type="hidden" name="searchAr"    	id="searchAr" 	 value="${resultMapCom.searchAr}"/>          <!-- 편평비 -->
		<input type="hidden" name="searchWi"    	id="searchWi" 	 value="${resultMapCom.searchWi}"/>          <!-- 인치 -->
		<input type="hidden" name="oeYn"    	    id="oeYn" 	     value=""/>  		                         <!-- 순정 호환 -->
		<input type="hidden" name="plyRating"       id="plyRating" 	 value="${resultMapCom.plyRating}"/>         <!-- 강도 -->
		<input type="hidden" name="TireSizeCd" 	    id="TireSizeCd" />	                                         <!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->
		<input type="hidden" name="TireSizeNm" 	    id="TireSizeNm"	/>	                                         <!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->
		<input type="hidden" name="TireSize"    	id="TireSize" 	 value=""/>                                  <!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->
		<input type="hidden" name="frCd"       	    id="frCd" 		 value="${resultMapCom.frCd}"/>
		<input type="hidden" name="itemCd"       	id="itemCd" 	 value="${resultMapCom.itemCd}"/>
		<input type="hidden" name="itemNm"       	id="itemNm" 	 value="${resultMapCom.itemNm}"/>
		<input type="hidden" name="systemGbn"       id="systemGbn" 	 value="${systemGbn}"/>
		<input type="hidden" name="seasonCd"    	id="seasonCd" 	 value="${resultMapCom.seasonCd}"/>          <!-- 계절구분 -->
		<input type="hidden" name="seasonCdNm"      id="seasonCdNm"  value="${resultMapCom.seasonCdNm}"/>        <!-- 계절 구분-->
		<input type="hidden" name="recomPeriodCd"   id="recomPeriodCd"	value="36"/>                             <!-- 추천상품 기간(Default는 '36'이고, 추천상품 주문 시  periodCd 저장 -->
		<input type="hidden" name="prdtGrp"   		id="prdtGrp"	value="01"/>                                 <!-- 판매유형코드 기본 자유렌탈-->
		<input type="hidden" name="prdtGrpDtl"   	id="prdtGrpDtl"	value="04"/>	                             <!-- 판매유형상세코드  기본 자유렌탈-->
		<input type="hidden" name="cntCdNm"         id="cntCdNm" 	value=""/>                                   <!-- 수량코드 -->
		<input type="hidden" name="accuOrdPdLmtCd"  id="accuOrdPdLmtCd" value=""/>                               <!-- 누적 주문 기간 제한 코드(SD243) -->
		<input type="hidden" name="accuOrdTmeLmtCd" id="accuOrdTmeLmtCd" value=""/>                              <!-- 누적 주문 회차 제한 코드(SD244) -->
		<input type="hidden" name="tmeOrdQyLmtCd"   id="tmeOrdQyLmtCd" value=""/>             	                 <!-- 회차 주문 수량 제한 코드(SD245) -->
		<input type="hidden" name="accuOrdQyLmtCd"  id="accuOrdQyLmtCd" value=""/>                               <!-- 누적 주문 수량 제한 코드(SD246) -->
		<input type="hidden" name="orderGbn"  		id="orderGbn"   value=""/>                                   <!--  주문이 구매인지 렌탈인지 	 -->
		<input type="hidden" name="pageGbn"  		id="pageGbn"    value="D"/> 	                             <!--  페이지 구분(주문에 넘어갈때 확인) 	 -->
		<input type="hidden" name="custGrpCd"       id="custGrpCd" value="${resultMapCom.custGrpCd}" />          <!--  제휴 그룹코드  	 -->

		<!-- 렌탈 판매금액 정보 -->
		<input type="hidden" name="saleNm"          id="saleNm"  value=""/>                                      <!-- 판매상품명-->
		<input type="hidden" name="saleCd"          id="saleCd"  value="S000000001" />                           <!-- 판매상품코드 기본 자유렌탈-->
		<input type="hidden" name="description" 	id="description" />
		<input type="hidden" name="MonthRentalAmt"  id="MonthRentalAmt" value="" />  	                         <!-- 월 렌탈료 -->
		<input type="hidden" name="addRentAmt"  	id="addRentAmt" 	value="" />  	                         <!-- 추가렌탈료 -->
		<input type="hidden" name="discountAmt"     id="discountAmt"    value="" />  	                         <!-- 할인금액 -->
		<input type="hidden" name="totalPayYn"  	id="totalPayYn" 	value="" />  	                         <!-- 총 납입금 -->
		<input type="hidden" name="saleTyCd"  		id="saleTyCd" 	  	value="" />  	                         <!-- 쎄일 타입 씨디 -->

		<!-- 구매에서 넘어온 가격 -->
		<input type="hidden" name="bassSaleFee"  	id="bassSaleFee" 	value="${resultMapCom.bassSaleFee}"/>    <!-- 원가금액 -->
		<input type="hidden" name="saleFee"  		id="saleFee" 		value="${resultMapCom.saleFee}"/> 	     <!-- 할인가 -->
		<input type="hidden" name="stmemSaleAmt"  	id="stmemSaleAmt" 	value="${resultMapCom.stmemSaleAmt}"/>   <!-- 임직원가 -->
		<input type="hidden" name="pointAccurt"  	id="pointAccurt" 	value="${resultMapCom.pointAccurt}"/>    <!-- 적립율 -->

		<!-- 구매 판매금액 정보 -->
		<input type="hidden" name="orderO2oOriAmt"  id="orderO2oOriAmt" 	value="${resultMapCom.bassSaleFee}"/> <!-- 판매금액 -->
		<input type="hidden" name="orderO2oSaleAmt" id="orderO2oSaleAmt" 	value="${resultMapCom.saleFee}"/> 	  <!-- 할인금액 -->
		<input type="hidden" name="orderO2oPayAmt"  id="orderO2oPayAmt" 	value="0"/>  						  <!-- 결제금액 -->
		<input type="hidden" name="orderO2oCnt"  	id="orderO2oCnt" 		value="1"/>  						  <!-- 구매수량 기본 1본-->
		<input type="hidden" name="nomalRentalId"   id="nomalRentalId" 	value="rentaltype00"/>                    <!-- 기본 자유렌탈 선택 -->
		<input type="hidden" name="userId"       	id="userId" 	value="${userVo.loginId}"/>                   <!-- 사용자아이디 -->
		<input type="hidden" name="renThumImg"      id="renThumImg" 	value="${renThumImg}"/>                   <!-- 이미지 썸네일 -->
		<input type="hidden" name="o2oThumImg"      id="o2oThumImg" 	value="${o2oThumImg}"/>                   <!-- 이미지 썸네일 -->
		<input type="hidden" name="prcPlcNo"        id="prcPlcNo"/> <!-- 가격 정책 번호 -->
		<input type="hidden" name="niceGradeCd"     id="niceGradeCd" value="${niceGradeCd}"/>                     <!-- niceGradeCd -->

		<!-- paging -->
		<input type="hidden" name="brdDivCd"        id="brdDivCd" 		value="2"/>                               <!-- 렌탈게시판테이블 구매후기 코드 -->
		<input type="hidden" name="pageNo"			id="pageNo"			value="${pageNo}"/>	                      <!-- 현재 페이지 -->
		<input type="hidden" name="pageClick"		id="pageClick"		value=""/>	                      		  <!-- 구매후기 보여지는 값 구분 -->
		<input type="hidden" name="pageSize"		id="pageSize" 		value="9"/>       	                      <!-- 페이지에 표시할 수 -->
		<input type="hidden"  name="reRentUseYN"  	id="reRentUseYN" 	value="${reRentUseYN}"/>                  <!-- 재렌탈 유무 -->

		<!-- **************주문시에 렌탈로 넘어갈 파라메터 ***************-->
		<!-- 선택한 엔진오일서비스 코드, 가격 -->
		<input type="hidden" name="selEnginCd"      id="selEnginCd" value="" />
		<input type="hidden" name="selEnginCdAmt"   id="selEnginCdAmt" value="" />

		<!-- 선택한 위치교환서비스 코드, 가격 -->
		<input type="hidden" name="selLocCd"        id="selLocCd" value="" />
		<input type="hidden" name="selLocCdAmt"     id="selLocCdAmt" value="" />

		<!-- 선택한 방문점검 코드, 가격 -->
		<input type="hidden" name="selVisCd"        id="selVisCd" value="" />
		<input type="hidden" name="selVisCdAmt"     id="selVisCdAmt" value="" />

		<!-- 선택한 보관 코드, 가격 -->
		<input type="hidden" name="selSaveCd"       id="selSaveCd" value="" />
		<input type="hidden" name="selSaveCdAmt"    id="selSaveCdAmt" value="" />

		<!-- 선택한 타이어 무상 교체 서비스 코드, 가격 -->
		<input type="hidden" name="selTcCd"         id="selTcCd" value="" />
		<input type="hidden" name="selTcCdAmt"      id="selTcCdAmt" value="" />

		<!-- 선택한 프리미엄(사계절보증제도) 코드, 가격 -->
		<input type="hidden" name="selPrCd"         id="selPrCd" value="" />
		<input type="hidden" name="selPrCdAmt"      id="selPrCdAmt" value="" />

		<!-- 선택한 타이어 Check 서비스 코드, 가격 -->
		<input type="hidden" name="selCheckCd" id="selCheckCd" value="" />
		<input type="hidden" name="selCheckCdAmt" id="selCheckCdAmt" value="" />

		<!-- 선택한 얼라인먼트 코드, 가격 -->
		<input type="hidden" name="selArCd"         id="selArCd" value="" />
		<input type="hidden" name="selArAmt"        id="selArAmt" value="" />
		<input type="hidden" name="regiAmt"         id="regiAmt" value="0" />
		<input type="hidden" name="periodCd"        id="periodCd" value="36" />
		<!-- 자유렌탈 이외에 얼라인먼트 값 -->
		<input type="hidden" name="rentArYn" id="rentArYn" value="N" />
		<!-- **************주문시에 렌탈로 넘어갈 파라메터 ***************-->
		<input type="hidden" name="carSearchParam"	id="carSearchParam" 	value='${carSearchParam}' />


		<!-- 상품옵션 추가 내용 2020.08.13-->
		<input type="hidden" name="optTotAmt"       id="optTotAmt" value='0'/>
		<input type="hidden" name="optCo"           id="optCo"     value="N" />
		<input type="hidden" name="optAmt"          id="optAmt" 	 value="0" />
		<input type="hidden" name="optPlcNm"        id="optPlcNm"  value="" />
		<input type="hidden" name="optPlcNo"        id="optPlcNo"  value="" />

		<!-- 전륜후륜 추가 내용 2020.09.15-->
		<input type="hidden" name="searchAddSw"    id="searchAddSw" value="${resultMapCom.searchAddSw}" /><!-- 추가 타이어 단면폭 -->
		<input type="hidden" name="searchAddAr"    id="searchAddAr" value="${resultMapCom.searchAddAr}" /><!-- 추가 타이어 편평비 -->
		<input type="hidden" name="searchAddWi"    id="searchAddWi" value="${resultMapCom.searchAddWi}" /><!-- 추가 타이어 인치 -->
		<input type="hidden" name="tireFrCd"       id="tireFrCd"    value="${resultMapCom.tireFrCd}" /><!-- 추가 타이어 인치 -->
		<input type="hidden" name="tireSizeYn"     id="tireSizeYn"/>  <!-- 전후륜 사이즈 상이한경우 : N 동일시 : Y -->
		<input type="hidden" name="addTireInfo"    id="addTireInfo" value='${resultMapCom.addTireInfo}'/> <!-- 추가 타이어 존재시  json 형식으로 담음  -->
		<input type="hidden" name="driveFwd"       id="driveFwd"    value='${resultMapCom.driveFwd}' />
		<input type="hidden" name="driveRwd"       id="driveRwd"    value='${resultMapCom.driveRwd}' />
		<input type="hidden" name="addDpPrNo"      id="addDpPrNo"   value='${resultMapCom.addDpPrNo}' />
		<input type="hidden" name="addItemCd"      id="addItemCd"   value='${resultMapCom.addItemCd}' />
		<input type="hidden" name="addMatCd"       id="addMatCd"    value='${resultMapCom.addMatCd}' />
		<input type="hidden" name="labelType"      id="labelType"   value='${labelType}' />
		<input type="hidden" name="addTireYn"      id="addTireYn"   value='${resultMapCom.addTireYn}' />

		<input type="hidden" name="sectionWidth" 	id="sectionWidth" 	value="${resultMapCom.sectionWidth}" />	<!-- 단면폭 or sectionWidth -->
		<input type="hidden" name="aspectRatio" 	id="aspectRatio" 	value="${resultMapCom.aspectRatio}" />		<!-- 편평비 or aspectRatio -->
		<input type="hidden" name="wheelInches" 	id="wheelInches" 	value="${resultMapCom.wheelInches}" />		<!-- 인치    or wheelInches -->
		<input type="hidden" name="sectionRwWidth" 	id="sectionRwWidth" value="${resultMapCom.sectionRwWidth}" />	<!-- 후륜 단면폭 or sectionWidth -->
		<input type="hidden" name="aspectRwRatio" 	id="aspectRwRatio" 	value="${resultMapCom.aspectRwRatio}" />		<!-- 후륜 편평비 or aspectRatio -->
		<input type="hidden" name="wheelRwInches" 	id="wheelRwInches" 	value="${resultMapCom.wheelRwInches}" />		<!-- 후륜 인치    or wheelInches -->

	</form>

	<form name="selfRental">
		<!-- 선택한 엔진오일서비스 코드, 가격 -->
		<input type="hidden" name="selEnginCd" value="0" />
		<input type="hidden" name="selEnginCdAmt" value="0" />

		<!-- 선택한 위치교환서비스 코드, 가격 -->
		<input type="hidden" name="selLocCd" value="0" />
		<input type="hidden" name="selLocCdAmt" value="0" />

		<!-- 선택한 방문점검 코드, 가격 -->
		<input type="hidden" name="selVisCd" value="0" />
		<input type="hidden" name="selVisCdAmt" value="0" />

		<!-- 선택한 보관 코드, 가격 -->
		<input type="hidden" name="selSaveCd" value="" />
		<input type="hidden" name="selSaveCdAmt" value="" />

		<!-- 선택한 타이어 무상 교체 서비스 코드, 가격 -->
		<input type="hidden" name="selTcCd" value="" />
		<input type="hidden" name="selTcCdAmt" value="" />

		<!-- 선택한 프리미엄(사계절보증제도) 코드, 가격 -->
		<input type="hidden" name="selPrCd" value="0" />
		<input type="hidden" name="selPrCdAmt" value="0" />

		<!-- 선택한 얼라인먼트 코드, 가격 -->
		<input type="hidden" name="selArCd" value="0" />
		<input type="hidden" name="selArAmt" value="0" />

		<!-- 선택한 check 코드, 가격 -->
		<input type="hidden" name="selCheckCd" value="0" />
		<input type="hidden" name="selCheckCdAmt" value="0" />

		<input type="hidden" name="regiAmt" value="0"/> 	<!-- 디폴트 25000원 -->
		<input type="hidden" name="periodCd" value="36" />  <!-- 디폴트 36개월 -->
	</form>

<!-- 상담신청 -->
<!-- <form name="counselForm" method="post" action="/view/snl/board/goCounsel.do"> -->
<form name="counselForm" method="post">
	<input type="hidden" name="makerCd"/>	<!-- 제조사 -->
	<input type="hidden" name="modelCd"/>	<!-- 차종 -->
	<input type="hidden" name="dispCd"/>	<!-- 규격 -->
	<input type="hidden" name="cntCd"/>		<!-- 수량 -->
</form>
<form id="filterFrm" name="filterFrm" method="post">
		<input type="hidden" name="fBrand"		id="fBrand" />		<!-- N : 차량번호 , C : 차종 , S : 사이즈 -->
		<input type="hidden" name="fCarType"	id="fCarType"  />			<!-- 차량번호 -->
		<input type="hidden" name="fSeason" 	id="fSeason"  />		<!-- 제조사 코드 -->
		<input type="hidden" name="fRentalYn" 	id="fRentalYn" />			<!-- 제조사 명 -->
</form>

<input type="hidden" name="bizAppYn" id="bizAppYn"  value="${clientVo.bizAppYn}" /> <!-- 사업자승인 여부 -->

<!-- [20220824_1] kstka 주문사전가능여부 확인 -->
<input type="hidden" name="custNo" id="custNo" />

<script type="text/javascript">
ex2cts.push('track', 'prdDetail');

var systemGbn = '${resultMapCom.systemGbn}';
var userYn = '${userVo.loginId}';
var TireSize = '${resultMapCom.searchSw}'+'/'+'${resultMapCom.searchAr}'+'R'+'${resultMapCom.searchWi}';
var officerCd = '${officerCd}'; //임직원 코드
var couponItemYn = "Y";
var gbItemCd = "";
var gbItemGrpCd = "";
var gbItemTyCd = "";
var gbItemTyDtlCd = "";

var fBrand = [ <%=fBrandValues.toString()%> ];
var fCarType = [ <%=fCarTypeValues.toString()%> ];
var fSeason = [ <%=fSeasonValues.toString()%> ];
var fRentalYn = [ <%=fRentalYnValues.toString()%> ];

var fncust 		= "";
var fncom 		= "";
var fnid 		= "";
var month 		= "36";//기본 렌탈기간 36개월
var orgPay = {};


//최근에 본상품
$('.proThum').slick({
  arrows:false,
  dots:false

  // draggable:false,
//   pauseOnHover:true,
//   accessibility:false,
//   adaptiveHeight:true
}).on('swipe', function(event, slick, direction){
	var now = $(this).slick('slickCurrentSlide');
	$( "#slideBar" ).slider( "value", now );
});;


$( "#slideBar" ).slider({
  range: "max",
  min: 0,
  max: $(".proThum .slick-slide:not(.slick-cloned)").length -1 ,
  value: 0,
  slide: function( event, ui ) {
		  $('.proThum').slick('slickGoTo', ui.value  );
  }
});


function openOrderBox( mod ){

	var frm = document.carInfoFrm;
	var popSearchGbn = ValidUtil.isEmpty(frm.modelCd.value) ? "N" : "Y";//팝업 조회 구분. 차량번호 , 차종 : Y 사이즈 : N

	if( mod == 'O'){
		if(systemTab == "R") {
			ComUtil.alert("구매하실수 없는 상품입니다.");
		} else {
			$(".orderCheckWrap").show();
			$(".rentalCheckWrap").hide();
			$('.orderWrap_new').slideDown();
		}
	}else if( mod == 'R'){
		if(systemTab == "O") {
			ComUtil.alert("일시불 구매만 가능한 제품입니다. 렌탈 주문은 재검색을 통해서 차종정보를 선택해 주세요.");
		} if(systemTab == "C") {
			if(popSearchGbn == "N"){
				$(".orderCheckWrap").show();
				$(".rentalCheckWrap").hide();
				$('.orderWrap_new').slideDown();

				ComUtil.confirm("일시불 구매만 가능한 제품입니다. 렌탈 주문은 재검색을 통해서 차종정보를 선택해 주세요.",""
					,function() {  //확인함수
						openSizeFinder('car');
					}
					,function() {} //취소함수
					,"차종으로 찾기"
					,"구매 주문하기");

			} else {
				$(".orderCheckWrap").hide();
				$(".rentalCheckWrap").show();
				$('.orderWrap_new').slideDown();
			}
		} else {//systemTab == R
			$(".orderCheckWrap").hide();
			$(".rentalCheckWrap").show();
			$('.orderWrap_new').slideDown();
		}
	}
}



//구매탭을 선택할 것인지 렌탈 탭을 선택할것인지 검색에 대한 값
var systemTab 	= '${labelType}';
var directOrder = ""; // 구매/렌탈 버튼클릭시 주문서로 바로 넘기기


//돈 천단위마다 콤마찍는 함수
function inputNumberWithComma() {

	var minSaleFee = '${minSaleFee}';
	var otPay = '${resultMapCom.otPay}';
	minSaleFee = NumUtil.setComma(minSaleFee);
	otPay = NumUtil.setComma(otPay);
	$('#minSaleFee').append(minSaleFee);
	$('#otPay').append(otPay);

}

	var evManager = {
	loginName : "${userVo.getUsrName()}"
				,
	niceGradeCd : new Array()
				,
		init : function(){
			var makerNm = '${resultMapCom.makerNm}';
			var searchWi = '${resultMapCom.searchWi}';
			var carNo = '${resultMapCom.carNo}';
			var oeYn = '${resultMapCom.description}';

			$(".scrollBox").hide();
			/** 믿음 추가 내용 **/
			var frm = document.carInfoFrm;
			var dpPrNo = frm.dpPrNo.value;
			var popSearchGbn = ValidUtil.isEmpty(frm.modelCd) ? "N" : "Y"; //팝업 조회 구분. 차량번호 , 차종 : Y 사이즈 : N
			var carSearchParam = $("#carSearchParam").val();
		    var fChoiceArr;
		    var fChoiceArrR;
			$('#carSearchParamView').empty();
			$.each(JSON.parse(carSearchParam), function(key, value){
				if(key != 'driveDsp') {
					if(key == 'driveFwd'){
					    fChoiceArr = value.split('/');
					    fChoiceArrR = fChoiceArr[1].split('R');
					    if (fChoiceArrR[0] == '-') {
					    	value = fChoiceArr[0] + 'R'+ fChoiceArrR[1];
					    }
					    $("#driveFwd").val(value);
						value = '(전륜)'+value;
						$('#carSearchParamView').append('<li class="size">'+ value +'</li>');
					}else if(key == 'driveRwd'){
						fChoiceArr = value.split('/');
					    fChoiceArrR = fChoiceArr[1].split('R');
					    if (fChoiceArrR[0] == '-') {
					    	value = fChoiceArr[0] + 'R'+ fChoiceArrR[1];
					    }
					    $("#driveRwd").val(value);
					    value = '(후륜)'+value;
						$('#carSearchParamView').append('<li class="size">'+ value +'</li>');
					}else{
						if(!ValidUtil.isEmpty(value)) {

							if(    key != 'sectionWidth'
								&& key != 'aspectRatio'
								&& key != 'wheelInches'
								&& key != 'sectionRwWidth'
								&& key != 'aspectRwRatio'
								&& key != 'wheelRwInches'
								&& key != 'tireSizeYn'
							){
								$('#carSearchParamView').append('<li>'+ value +'</li>');
							}
						}
					}
				}
				if(key == 'tireSizeYn')    $("#tireSizeYn").val(value);
			});

			if (location.hash == "#tab03") {
				getReviewList('init');
				$("#tab03").fadeIn();
			}

			var tireSizeYn = "Y";
			if($("#tireSizeYn").val() == "N" && !ValidUtil.isEmpty($("#addItemCd").val())){
				tireSizeYn = "N";
			}
			$("#tireSizeYn").val(tireSizeYn);

			$('#TireSize').val(TireSize);
			//$('.product-size').html(TireSize);
			var tireFrNm   = ($("#tireFrCd").val() == "R") ? "후륜" : "전륜";
			var tireSizeNm = (tireSizeYn == "N") ? tireFrNm+" | "+TireSize : TireSize;
			$('.product-size').html(tireSizeNm);

			/** 믿음 추가 내용 **/

			if(oeYn != '' && oeYn != null && oeYn != "null"){
				oeYn = oeYn.replace('(', '');
				oeYn = oeYn.replace(')', '');
				$('#oeYnTxT').text(oeYn);

				if(oeYn == '순정'){
					$('#oeYn').val('Y');
				}else if(oeYn == '호환'){
					$('#oeYn').val('N');
				}

			}
			//초기진입시 구매쪽 기본 본수 체크
			createRentalO2oQty("INIT");
			//초기진입시 구매쪽 기본 본수 체크

			/** 믿음 수정 내용 **/
			if(popSearchGbn == "N"){
				selectGetItemCd(); //itemCd  불러오기
			} else {//타이어 사이즈가 있을때
				if(systemGbn == 'R'){//뭔가 있으면 초기 렌탈정보 보여주기
					if(popSearchGbn == "Y"){//타이어 사이즈가 없으면 렌탈 조회를 못하기 때문에 꼭 있어야 한다.
						//1.초기진입시 렌탈이 있으면 렌탈에 대한 수량 기간 등록비를 조회 및 셋팅해준다.
							fnSelectRntalRegAmtList();

							if(officerCd == "" || officerCd == null ){
						 	 	//임직원 제외 서비스
							 	//2.자유렌탈 서비스 리스트
								freeRentalServiceList();
								setSelCodeNew();
							}

					 	 //3.일반렌탈 리스트 생성
						 	calculateFee();
						 //4.렌탈이 있으면 matCd랑 frCd불러오기
						 	selectGetMatCdFrcd();

					 }
				}else if(systemGbn == 'O'){//뭔가 있으면 초기 구매정보 보여주기
					 selectGetItemCd(); //itemCd  불러오기 및 구매가격 재생성 및 가격 뿌려주기 함수 호출
					 //calculateO2oSet();
				}else{ //요거는 구매 렌탈 둘다 있을때.
					if(TireSize != "" && TireSize != null){//타이어 사이즈가 없으면 렌탈 조회를 못하기 때문에 꼭 있어야 한다.
					 	//1.초기진입시 렌탈이 있으면 렌탈에 대한 수량 기간 등록비를 조회 및 셋팅해준다.
						fnSelectRntalRegAmtList();


						if(officerCd == "" || officerCd == null ){
							//임직원 제외 서비스
							//2.자유렌탈 서비스 리스트
						 	freeRentalServiceList();
						 	setSelCodeNew();
						}

				 		//3.일반렌탈 리스트 생성
					 	calculateFee();
					}
					//2.구매비용 계산 함수
					selectGetItemCd(); //itemCd  불러오기
					//4.렌탈이 있으면 matCd랑 frCd불러오기
					selectGetMatCdFrcd();

/* 					//5.임직원일 경우 렌탈 등록비 재조회
					if(officerCd != "" && officerCd != null ){
						setTimeout(function() {fn_nomalRentalAmt();}, 100);
					}	 */
				}
			}
			/** 믿음 수정 내용 **/

			/* 옵션 가격 설정 */
			fn_calcOptAmt();

			/* 2020.09.21 전후륜 타이어 로직 추가 추가 구매일 경우 구매수량및 옵션 세팅*/
			if(!ValidUtil.isEmpty($("#tireSizeYn").val()) && $("#tireSizeYn").val() == "N"){
				$.each($(':radio[name="o2oQtyRadio"]') , function(idx , obj) {
					var objValue = $(obj).val();
					if(objValue > '02'){
						$('label[for="'+obj.id+'"]').attr("style","display:none");
					}
				});
				$(".serviceTemp").attr("style","display:none")

			}

			//[20221017_1] 렌탈 상품 초기 선택된 내역 조회
			$('select[name="rentaltype"] option:selected').change();

			/* 동현추가 초기 Total값  */
			getReviewList('init');
		},

		//공통 AJAX 호출
		commonAjax : function(url, param, callback) {
			$.ajax({
			    url: url,
			    type: "POST",
			    cache:false,
			    async:false,
			    data: JSON.stringify(param),
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data != null) {
			    		callback(data);
			    	}
			    },
			    error: function (request, status, error) {
			    	callBackManager.error(error)

				}
			});
			// end tag -- common ajax call
		},
		reviewPage : function(url, param, callback) {

		}
	}

	var callBackManager = {
		//에러 처리
		error : function() {
			console.log('error callback : ' + error);
		},
		//해당 전시상품으로 쿠폰 존재 유무 확인
		cpnPlcList : function(data){
			if(data.length > 0) {
				$("#cpnPlcPtrnYn").val("Y");
			}
			var cpnPlcPtrnYn = $("#cpnPlcPtrnYn").val();
			if(cpnPlcPtrnYn == "N") {
				$("#coupon").hide();
			}
		},
		//구매후기 리스트 생성
		<%-- reviewList : function(data){
			var htmlStr = "";
			var pageCommon = data.pageCommon;
			if(data.resultList.length > 0){
				for(var i=0; i < data.resultList.length; i++) {

					htmlStr += '<div class="review-single" onclick="javascript:reviewEvent(this);">';
					htmlStr += '	<div class="review-summary layout-r">';
					htmlStr += '		<div class="result-data-type layout-r inline-xs mr-m">';
				 	if(data.resultList[i].ordChn == "R"){
				 		htmlStr += '		<div class="sell-type-rental">렌탈</div>';
				 	}else{
				 		htmlStr += '		<div class="sell-type-buy">구매</div>';
				 	}
					htmlStr += '		</div>';


					htmlStr += '<div class="review-info">';
					htmlStr += '<p class="review-product-title">'+ data.resultList[i].patternCd +'</p>';
					htmlStr += '<p class="review-product-info">'+ data.resultList[i].title +'</p>';
					htmlStr += '<p class="score0'+ data.resultList[i].grdPt +'"></p>';
					htmlStr += '</div>';
					htmlStr += '</div>';


					htmlStr += '<div class="review-box layout-c">';
					htmlStr += '<p class="review-title">'+ data.resultList[i].title +'</p>';
					htmlStr += '<p class="review-registration">'+ data.resultList[i].maskid +'님 | '+ data.resultList[i].regDt +'</p>';

					if(data.resultList[i].atflPathNm != "" && data.resultList[i].atflPathNm != null && typeof data.resultList[i].atflPathNm != 'undefined'){
						var	imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>"+data.resultList[i].atflPathNm;
						htmlStr += '<p class="review-photo"><img src="'+imgurl+'" alt="리뷰이미지"></p>';
						if(data.resultList.length > 0){
							if(data.pageCommon.pageNo != 1) { // if문 동현추가
								for(var i=0; i < data.resultList.length; i++) {

									htmlStr += '<div class="review-single" onclick="javascript:reviewEvent(this);">';
									htmlStr += '	<div class="review-summary layout-r">';
									htmlStr += '		<div class="result-data-type layout-r inline-xs mr-m">';
								 	//동현수정
								 	if(data.resultList[i].ordChn == "R"){
								 		htmlStr += '		<div class="sell-type-rental">렌탈</div>';
								 	}else{
								 		htmlStr += '		<div class="sell-type-buy">구매</div>';
								 	}
									htmlStr += '		</div>';


									htmlStr += '<div class="review-info">';
									htmlStr += '<p class="review-product-title">'+ data.resultList[i].patternCd +'</p>';
									htmlStr += '<p class="review-product-info">'+ data.resultList[i].title +'</p>';
									htmlStr += '<p class="score0'+ data.resultList[i].grdPt +'"></p>';
									htmlStr += '</div>';
									htmlStr += '</div>';


									htmlStr += '<div class="review-box layout-c">';
									htmlStr += '<p class="review-title">'+ data.resultList[i].title +'</p>';
									htmlStr += '<p class="review-registration">'+ data.resultList[i].maskid +'님 | '+ data.resultList[i].regDt +'</p>';

									if(data.resultList[i].atflPathNm != "" && data.resultList[i].atflPathNm != null && typeof data.resultList[i].atflPathNm != 'undefined'){

										var imgurl = "";
										if(data.resultList[i].dbGbn == 'REN'){
											imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>";
											imgurl += "/atprdfile_cms/";
										}else{
											imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
										}
											imgurl += data.resultList[i].atflPathNm;
										htmlStr += '<p class="review-photo"><img src="'+imgurl+'" alt="리뷰이미지"></p>';
									}

									htmlStr += '<p class="review-text">'+ data.resultList[i].cont +'</p>';
									htmlStr += '</div>';
									htmlStr += '</div>';
									//더보기 버튼 컨트롤
									if(data.resultList.length < 10){
										$('#reviewMore').css("display","none");
									}else{
										$('#reviewMore').css("display","block");
									}
									htmlStr += '<p class="review-text">'+ data.resultList[i].cont +'</p>';
									htmlStr += '</div>';
									htmlStr += '</div>';

									//더보기 버튼 컨트롤
									if(data.resultList.length < 10){
										$('#reviewMore').css("display","none");
									}else{
										$('#reviewMore').css("display","block");
									}
							}

							$("#reviewBox").append(htmlStr);
							$("#totalCnt").text(pageCommon.totalCount);
							$('.js-reviewGroup .review-box').hide();
						}else{
							htmlStr = "<div class='inset-m text-center'>리뷰가 없습니다.</div>";
						}

					$("#reviewBox").append(htmlStr);
					$("#totalCnt").text(pageCommon.totalCount);
					$('.js-reviewGroup .review-box').hide();

				}else {
					var htmlStr = "<div class='inset-m text-center'>리뷰가 없습니다.</div>";
					$("#reviewBox").html(htmlStr);
				}
			}
	},
	 --%>
	rcmdChk : function(data) {
		var btnId = data.rcmdChk.usePsNo;
		var rcmdTotCnt = data.rcmdChk.rcmdTotCnt;

		if(data.rcmdChk.rcmdYn == 'Y') {
			$("#" + btnId).attr('class','thumb_up on');
		} else {
			$("#" + btnId).attr('class','thumb_up');
		}
		$("#" + btnId).text(rcmdTotCnt);
	},
	rcmdChkPop : function(data) {
		getReviewAtflList("", $("#rcmdBtnPop").val());
	},
	reviewList : function(data){
		var htmlStr = "";
		var mediaStr = "";
		var pageCommon = data.pageCommon;
		var snImg = "";

		var totStar = 0;
		var totStarCnt = 0;
		var totStarImg = 0;
		const totImgCnt = data.totImgCnt;

		if(pageCommon.pageNo == 1){
			$('#reviewBox').children().remove();
		}
		$('#mediaReview').children().remove();
		if(data.resultAtflList.length > 0){
			var len;
			if(data.resultAtflList.length > 4) {
				len = 3;
			} else {
				len = data.resultAtflList.length;
			}
			for(var j=0; j < len; j++) {
				if(data.resultAtflList[j].atflUrl != null) {
					mediaStr += '<a href="#" id="opReview" data-img="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+data.resultAtflList[j].atflUrl+'" value="'+data.resultAtflList[j].usePsNo+'"><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+data.resultAtflList[j].atflUrl+'"></a>';

					if(data.resultAtflList.length > 7 && j == (len-1)) {
						mediaStr += '<a href="#" onclick="openReviewGallery();"><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+data.resultAtflList[j+1].atflUrl+'"><div class="more"><div class="num">'+(totImgCnt - 3)+'</div><span>더보기+</span></div></a>';
					}
				}
			}
		}
		if(data.resultList.length > 0){
// 			if($("#pageClick").val() != 0) { // 페이지가 1일때 리뷰를 보여주지 않게 하고 있음. 보여지는 구분값을 따로 추가
			//if(data.pageCommon.pageNo != 1) { // if문 동현추가
				for(var i=0; i < data.resultList.length; i++) {
					/*
					htmlStr += '<div class="review-single" onclick="javascript:reviewEvent(this);">';
					htmlStr += '	<div class="review-summary layout-r">';
					htmlStr += '		<div class="result-data-type layout-r inline-xs mr-m">';
				 	if(data.resultList[i].ordChn == "R"){
				 		htmlStr += '		<div class="sell-type-rental">렌탈</div>';
				 	}else{
				 		htmlStr += '		<div class="sell-type-buy">구매</div>';
				 	}
					htmlStr += '		</div>';
					htmlStr += '<div class="review-info">';
					htmlStr += '<p class="review-product-title">'+ data.resultList[i].patternCd +'</p>';
					htmlStr += '<p class="review-product-info">'+ data.resultList[i].title +'</p>';
					htmlStr += '<p class="score0'+ data.resultList[i].grdPt +'"></p>';
					htmlStr += '</div>';
					htmlStr += '</div>';
					htmlStr += '<div class="review-box layout-c">';
					htmlStr += '<p class="review-title">'+ data.resultList[i].title +'</p>';
					htmlStr += '<p class="review-registration">'+ data.resultList[i].maskid +'님 | '+ data.resultList[i].regDt +'</p>';

					if(data.resultList[i].atflPathNm != "" && data.resultList[i].atflPathNm != null && typeof data.resultList[i].atflPathNm != 'undefined'){
						var imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>" + data.resultList[i].atflPathNm;
						//htmlStr += "<img src='"+imgurl+"' alt='리뷰이미지'/>";
					<%-- if(data.resultList[i].dbGbn == 'REN'){
						imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>";
						imgurl += "/atprdfile_cms/";
					}else{
						imgurl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
					} --%>
						//imgurl += data.resultList[i].atflPathNm;
						htmlStr += '<p class="review-photo"><img src="'+imgurl+'" alt="리뷰이미지"></p>';
					}

					htmlStr += '<p class="review-text">'+ data.resultList[i].cont +'</p>';
					htmlStr += '</div>';
					htmlStr += '</div>';

					//더보기 버튼 컨트롤
					if(data.resultList.length < 10){
						$('#reviewMore').css("display","none");
					}else{
						$('#reviewMore').css("display","block");
					}
 					*/

					htmlStr += '<li class=\"review-item\">';
					htmlStr += '    <div class=\"review-head\">';
					htmlStr += '        <div class=\"review-type\">';
										if(data.resultList[i].ordChn == "R"){
					htmlStr += '            <div class=\"buy-type R\"></div>';
										}else{
					htmlStr += '            <div class=\"buy-type O\"></div>';
										}
										//  class="buy-type R after-m"  한달 후기
					htmlStr += '        </div>';
					htmlStr += '        <div class=\"service-info\">';
					htmlStr += '            <div class=\"review-title\">';
					htmlStr += '                <div class=\"title\">'+ data.resultList[i].title +'</div>';
					htmlStr += '            </div>';
					htmlStr += '            <div class=\"writer-info\">';
					htmlStr += '                <div class=\"writer\">'+ data.resultList[i].custNm +'</div>';
					htmlStr += '                <div class=\"date\">'+ data.resultList[i].regDt +'</div>';
					htmlStr += '            </div>';
					htmlStr += '        </div>';
					htmlStr += '    </div>';
					htmlStr += '    <div class=\"point-info\">';
					htmlStr += '        <div class=\"star-box\"><div class=\"star star-'+ data.resultList[i].totStarsImg +'\"></div> <span>'+ data.resultList[i].totStarsSeCd +'</span></div>';
					htmlStr += '        <div class=\"rec-box\">';
					if(data.resultList[i].rcmdYn == 'Y') {
						htmlStr += '            <button class=\"thumb_up on\" id=\"'+data.resultList[i].usePsNo+'\" name=\"rcmdBtn\" value=\"'+data.resultList[i].usePsNo+'\">'+data.resultList[i].rcmdTotCnt+'</button>';
					} else {
						htmlStr += '            <button class=\"thumb_up\" id=\"'+data.resultList[i].usePsNo+'\" name=\"rcmdBtn\" value=\"'+data.resultList[i].usePsNo+'\">'+data.resultList[i].rcmdTotCnt+'</button>';
					}
					htmlStr += '        </div>';
					htmlStr += '    </div>';
					htmlStr += '    <div class=\"review-content mini\">';
					htmlStr += '        <div class=\"content\">';
					htmlStr += '            <div class=\"text\">';
					htmlStr += '                    '+ data.resultList[i].cont;
					htmlStr += '            </div>';
					htmlStr += '            <div class=\"purch-info\">';
					if(data.resultList[i].carInfo != null){
						htmlStr += '                <div class=\"car-box\">'+data.resultList[i].carInfo+' </div>';
					}
					htmlStr += '                <div class=\"product-box\">'+ data.resultList[i].patternCd +' | '+data.resultList[i].dispSize+' </div>';
					if(data.resultList[i].dlvTyDtlCd == "1030" || data.resultList[i].dlvTyDtlCd == "" || data.resultList[i].dlvTyDtlCd == null){
						htmlStr += '            <div class=\"service-box\">'+data.resultList[i].dlvTyDtlCdNm+'|'+data.resultList[i].procDueBhfNm+'</div>';
				 	} else {
				 		htmlStr += '            <div class=\"service-box\">GO서비스 | '+data.resultList[i].dlvTyDtlCdNm+'</div>';
				 	}
					htmlStr += '            </div>';
					htmlStr += '            <div class=\"service-star\">';
					htmlStr += '                <h5>만족도</h5>';
					htmlStr += '                <div>상품 <div class=\"star\"></div>'+ data.resultList[i].starsSeCd +'</div>';
					htmlStr += '                <div>기사 <div class=\"star\"></div>'+ data.resultList[i].engrStarsSeCd +'</div>';
					htmlStr += '                <div>서비스 <div class=\"star\"></div>'+ data.resultList[i].dlvStarsSeCd +'</div>';
					htmlStr += '            </div>';
					htmlStr += '            <div class=\"picture\">';
					for(var j=0; j < data.resultAtflList.length; j++) {
						if(data.resultList[i].usePsNo == data.resultAtflList[j].usePsNo) {
							if(data.resultAtflList[j].atflUrl != null) {
								snImg = data.resultAtflList[j].atflUrl.replace("DP/RV","DP/RV/SN");
					htmlStr += '                <a href=\"#\" id="opReview" data-img="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+data.resultAtflList[j].atflUrl+'" value="'+data.resultAtflList[j].usePsNo+'"><img src=\"<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+snImg+'\"></a>';
								}
							}
						}
					htmlStr += '            </div>';
					htmlStr += '        </div>';

					if(data.resultList[i].answerYn='Y' && data.resultList[i].answer != "" && data.resultList[i].answer != null){

					htmlStr += '        <div class=\"review-reply\">';
					htmlStr += '            <div class=\"content\">';
					htmlStr += '                <div class=\"text\">';
					htmlStr += '                    '+ data.resultList[i].answer;
					htmlStr += '                </div>';
					htmlStr += '            </div>';
					htmlStr += '            <div class=\"reply-ico\">';
					htmlStr += '                <span>담당자</span>';
					htmlStr += '            </div>';
					htmlStr += '        </div>';
					}
					htmlStr += '    </div>';
					htmlStr += '    <div class=\"review-more\">';
					htmlStr += '        <button type=\"button\" onclick=\"reivewMoreView(this)\">더보기</button>';
					htmlStr += '    </div>';
					htmlStr += '</li>';

					if(data.resultList.length < 10){
						$('#reviewMore').css("display","none");
					}else{
						$('#reviewMore').css("display","block");
					}
				}
// 			}

			/* 10233006 리뷰 별점 수정 */
			$("#reviewTabStarPoint").className = 'star point' + (Math.trunc(data.totStars)*10);
			$("#reviewTabScore").text(data.totStars);
			/* 10233006 리뷰 별점 수정 */

			$("#totStar").text(data.totStars);
			$("#totStarImg").width(data.totStarImg+'%');

			$("#reviewBox").append(htmlStr);
			$("#mediaReview").append(mediaStr);
			$("#totalCnt").text(pageCommon.totalCount);
			$('.js-reviewGroup .review-box').hide();

		}else {
			var htmlStr = "<div class='inset-m text-center'>리뷰가 없습니다.</div>";
			$("#reviewBox").html(htmlStr);
		}
	},

	reviewAtflList : function(data) {
		var htmlStr = "";
		var popStr = "";
		var imgStr = "";
		var pageStr = "";
		var pageCommon = data.pageCommon;
		var atflLen = 0;
		var snImg = "";

		//일단 한번 다 지움
		$('#reviewPop').children().remove();
		$('#reviewPop2').children().remove();
		$('#reviewImg').children().remove();
		$('#pageReview').children().remove();

		if(data.reviewImg.length > 0) {
			popStr += '<div class="photo-gallery">';
			for(var i=0; i < data.reviewImg.length; i++) {
				snImg = data.reviewImg[i].atflUrl.replace("DP/RV","DP/RV/SN");
				popStr += '<a href="#" id="opReview" value="'+data.reviewImg[i].usePsNo+'"><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+snImg+'"></a>';
			}
// 			popStr += '		<div class="more-view">';
// 			popStr += '			<button type="button">리뷰 더 보기</button>';
// 			popStr += '		</div>';
			popStr += '</div>';

			$("#reviewPop2").append(popStr);
		}

		if(data.reviewImg.length > 0) {
			imgStr += '<div class="detail-image">';
			imgStr += '		<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+data.reviewImg[0].atflUrl+'" id="bImg">';
			imgStr += '</div>';
			imgStr += '<div class="thumbs">';
			for(var i=0; i < data.reviewImg.length; i++) {
				imgStr += '<a href="#" class="thumb-img" ><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>'+data.reviewImg[i].atflUrl+'" id="sImg_'+i+'"></a>';
			}
			imgStr += '</div>';

			$("#reviewImg").append(imgStr);
		}
		if(data.reviewDtl.length > 0) {
			htmlStr += '<div class="review-more">';
			htmlStr += '	<button type="button" id="popMore" onclick="popup_toggleReivewMoreView(this)">더보기</button>';
			htmlStr += '</div>';
			htmlStr += '<div class="review-head">';
			htmlStr += '	<div class="review-type">';
			if(data.reviewDtl[0].ordChn == "R"){
			htmlStr += '		<div class="buy-type R"></div>';
		 	}else{
			htmlStr += '		<div class="buy-type O"></div>';
		 	}
			htmlStr += '	</div>';
			htmlStr += '	<div class="service-info">';
			htmlStr += '		<div class="review-title">';
			htmlStr += '			<div class="title">'+ data.reviewDtl[0].title +'</div>';
			htmlStr += '		</div>';
			htmlStr += '		<div class="writer-info">';
			htmlStr += '			<div class="date">'+data.reviewDtl[0].regDt+'</div>';
			htmlStr += '			<div class="writer">'+data.reviewDtl[0].custNm+'</div>';
			htmlStr += '		</div>';
			htmlStr += '	</div>';
			htmlStr += '</div>';
			htmlStr += '<div class="point-info">';
			htmlStr += '	<div class="star-box"><div class="star star-'+ data.reviewDtl[0].totStarsImg +'"></div><span>'+ data.reviewDtl[0].totStarsSeCd +'</span></div>';
			htmlStr += '	<div class="rec-box">';
			if(data.reviewDtl[0].rcmdYn == 'Y') {
			htmlStr += '		<button class="thumb_up on" id="rcmdBtnPop" value="'+data.reviewDtl[0].usePsNo+'">'+data.reviewDtl[0].rcmdTotCnt+'</button>';
			} else {
			htmlStr += '		<button class="thumb_up" id="rcmdBtnPop" value="'+data.reviewDtl[0].usePsNo+'">'+data.reviewDtl[0].rcmdTotCnt+'</button>';
			}
			htmlStr += '	</div>';
			htmlStr += '</div>';
			htmlStr += '<div class="review-content">';
			htmlStr += '	<div class="content">';
			htmlStr += '		<div class="text">';
			htmlStr += '			'+data.reviewDtl[0].cont;
			htmlStr += '		</div>';
			htmlStr += '		<div class="purch-info">';
			if(data.reviewDtl[0].carInfo != null){
			htmlStr += '			<div class="car-box">'+data.reviewDtl[0].carInfo+'</div>';
			}
			htmlStr += '			<div class="product-box">'+data.reviewDtl[0].dispSize+'</div>';
			if(data.reviewDtl[0].dlvTyDtlCd == "1030" || data.reviewDtl[0].dlvTyDtlCd == "" || data.reviewDtl[0].dlvTyDtlCd == null){
				htmlStr += '		<div class="service-box">'+data.reviewDtl[0].dlvTyDtlCdNm+'|'+data.reviewDtl[0].procDueBhfNm+'</div>';
		 	} else {
		 		htmlStr += '		<div class="service-box">GO서비스 | '+data.reviewDtl[0].dlvTyDtlCdNm+'</div>';
		 	}
			htmlStr += '		</div>';
			htmlStr += '		<div class="service-star">';
			htmlStr += '			<h5>만족도</h5>';
			htmlStr += '			<div>상품 <div class="star"></div>'+ data.reviewDtl[0].starsSeCd +'</div>';
			htmlStr += '			<div>기사 <div class="star"></div>'+ data.reviewDtl[0].engrStarsSeCd +'</div>';
			htmlStr += '			<div>서비스 <div class="star"></div>'+ data.reviewDtl[0].dlvStarsSeCd +'</div>';
			htmlStr += '		</div>';
			htmlStr += '	</div>';
			if(data.reviewDtl[0].answerYn='Y' && data.reviewDtl[0].answer != "" && data.reviewDtl[0].answer != null){
			htmlStr += '	<div class="review-reply">';
			htmlStr += '		<div class="content">';
			htmlStr += '			<div class="text">'+data.reviewDtl[0].answer+'</div>';
			htmlStr += '		</div>';
			htmlStr += '		<div class="reply-ico">';
			htmlStr += '			<span>담당자</span>';
			htmlStr += '		</div>';
			htmlStr += '	</div>';
			}
			htmlStr += '</div>';
			var pre  = Number(data.reviewDtl[0].searchType) -1;
			var post = Number(data.reviewDtl[0].searchType) +1;

			atflLen = data.reviewDtl[0].totCnt;

			pageStr += '<button class="btn-prev" id="preClick" value="'+pre+'" data-len="">이전 리뷰 보기</button>';
			pageStr += '<button class="btn-next" id="postClick" value="'+post+'" data-len="'+atflLen+'">다음 리뷰 보기</button>';

			$("#reviewPop").append(htmlStr);
			$("#pageReview").append(pageStr);
		}
	},
	/* 렌탈 금액 가져오기  */
	viewRentalList : function(data){
		fn_CreateViewRentalList(data);
	},
	//등록비 불러오기
	RentalRegAmtList: function(data){
		if(data.regAmtList.length > 0){
			fn_CtreateRentalTab(data);
		}
	},
	//자유렌탈 불러오기
	FreeRentalList: function(data){
		fn_CtreateFreeRentalList(data);

	},
	//자유렌탈 서비스 리스트 가져오기
	FreeRentalServicList: function(data){
		fn_CtreateRentalServicList(data);
	},
	indi_credit: function(data){
		fn_indi_credit_result(data);
	},
	license_credit: function(data){
		fn_license_credit_rslt(data);
	},
	indiLic_credit: function(data){
		fn_indiLic_credit_result(data);
	},
	insertRentalCart: function(data){
		fn_retalInsertAndGoPage(data);
	},
	insertOrderCart: function(data){
		fn_O2oInsertAndGoPage(data);
	},
	returnCarNumSizeInfo : function(data) {
		returnCarNumSizeInfo(data);
	},
	/* [20220824_1] kstka 주문사전가능여부 확인 */
	beforeOrderConfirm: function(data){

		if(data.rtnCode == 0){
			fn_tireItemOrder_after();
		}else{
			ComUtil.alert(data.rtnMsg);
		}
	}
}


function goBack(){
		var frm = document.filterFrm;
		frm.fBrand.value = fBrand;
		frm.fCarType.value = fCarType;
		frm.fSeason.value = fSeason;
		frm.fRentalYn.value = fRentalYn;
		$("#filterFrm").attr("action" , "/product/prdList").submit();
}

function eventFunc(){

}

//옵션 선택시 이벤트
$(".optRadio").on('click', function(e){
	var checkId = $(e.target).attr("id");
	var checkYn = $(e.target).prop("checked");

	if(checkYn == "Y"){
		$.each($(".optRadio") , function(i , obj){
			var idx = (i+1);
			var objId   = $(':radio[name="o2oOptRadio_'+(idx)+'"]:checked').prop("id")
			var optPchsPrc = $(':input[name="o2oOptPchsPrc_'+(idx)+'"]').val();
			if(checkId == objId){
			}
		});
	}
	var optTotAmt  = 0;   //옵션 전체 금액
    var optAmt     = "";  //옵션 별 금액
    var optCo      = "";  //옵션 사용 수량 ( 0 : 사용안함 , 1 : 사용함.)
    var optPlcNo   = "";  //옵션 정책번호
    var optPlcNm   = "";  //옵션 정책명

    var delemeter = "@";
	$.each($(".optRadio") , function(j , obj){
		var idx = (j+1);
		var plcNo      = $(':input[name="o2oPlcNo_'+(idx)+'"]').val();
		var plcNm   = $(':input[name="o2oOptPlcNm_'+(idx)+'"]').val();
		var optPchsPrc = $(':input[name="o2oOptPchsPrc_'+(idx)+'"]').val();

		//$("label[for='radioOpta_"+(idx)+"'").text("정비 : "+optData.optPchsPrc + " 원");
		//$(':radio[name="radioOptb_'+(j+1)+'"]').val();

		var checkYn = $(":radio[name='o2oOptRadio_"+(idx)+"']:checked").val();
		if(checkYn == "Y"){
			optTotAmt += Number(optPchsPrc);
		}
		if($(".optRadio").length == j){
			delemeter ="";
		}
		optCo     += ((checkYn == "Y") ? "1" : "0") + delemeter
		optAmt    += (optPchsPrc).toString() + delemeter;
		optPlcNo  += plcNo + delemeter
		optPlcNm  += plcNm + delemeter
	});

	$("#optTotAmt").val(optTotAmt);
	$("#optAmt").val(optAmt);
	$("#optCo").val(optCo);
	$("#optPlcNo").val(optPlcNo);
	$("#optPlcNm").val(optPlcNm);
	calculateO2oSet();

});


$('input[name="o2oQtyRadio"]').on("click", function(e){
	//calculateO2oSet();
});

$('.order-button').on("click",function(e){
	if(systemTab == 'R'){ //구매는 없고 렌탈만 있으면 렌탈 보여주기
				$('#rental').click();
	}else if(systemTab == 'O'){//렌탈은 없고 구매만 있으면 구매탭 보여주기
		$('#o2oSystem').click();
	}else{ //둘다 있으면 구매 먼저 보여주기
		$('#o2oSystem').click();
	}
});

//쿠폰 받기 이벤트.
$('#coupon').on("click",function(e){
	var custDivCd = "<%=session.getAttribute("custDivCd")%>";
	var comDivCd = "<%=session.getAttribute("comDivCd")%>";
	var userLoginId = "<%=session.getAttribute("userLoginId")%>";

	if(custDivCd == "null"){
		custDivCd = fncust;
	}
	if(comDivCd == "null"){
	    comDivCd = fncom;
	}
	if(userLoginId == "null"){
		userLoginId = fnid;
	}

	fn_o2oDownCoupon(custDivCd, comDivCd, userLoginId);

});

//구매 또는 렌탈 단일 화면일시에 탭을 막아준다.
$('#rental,#o2oSystem').on("click",function(e){
	var id = $(this).attr('id');
	var frm = document.carInfoFrm;
	var popSearchGbn = ValidUtil.isEmpty(frm.modelCd) ? "N" : "Y";//팝업 조회 구분. 차량번호 , 차종 : Y 사이즈 : N

	if(systemTab == "R" &&  id =="o2oSystem"){
		ComUtil.alert("구매하실수 없는 상품입니다.");
		$('#rental').click();
	} else if(systemTab == "O" &&  id =="rental"){
		ComUtil.alert("일시불 구매만 가능한 제품입니다. 렌탈 주문은 재검색을 통해서 차종정보를 선택해 주세요.","","",function(){
			$('#o2oSystem').click();
			openSizeFinder('car');
		});
	} else if(systemTab == "C" &&  id =="rental"){
		if(popSearchGbn == "N"){
			$('#o2oSystem').click();
			ComUtil.confirm("일시불 구매만 가능한 제품입니다. 렌탈 주문은 재검색을 통해서 차종정보를 선택해 주세요.1",""
			,function() {  //확인함수
				openSizeFinder('car');
			}
			,function() {} //취소함수
			,"차종으로 찾기"
			,"구매 주문하기");
		}
	}
});

function chgDateToStr(date) {
	var year = date.getFullYear();              //yyyy
	var month = (1 + date.getMonth());          //M
	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	var day = date.getDate();                   //d
	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}

$('#rentalCounsel1,#productCart1,#productOrder1,#rentalCounsel2,#productCart2,#productOrder2').on("click",function(e){
	//////sap 작업으로 인하여 버튼 막기
	var today = new Date();
	var todayHours = today.getHours();
	var fstChkStartDay = "2021080900";
	var fstChkEndDay = "2021080904";
	var tHours = (todayHours < 10) ? "0"+todayHours : todayHours;
	if((chgDateToStr(today)+''+tHours) >= fstChkStartDay && (chgDateToStr(today)+''+tHours) < fstChkEndDay) {
		ComUtil.alert("시스템 점검으로 인하여 8/9 00:00 ~ 04:00까지 <br> 주문이 불가합니다.");
		return;
	}

	var tabid = $(this).attr('id');

	var custDivCd = "<%=session.getAttribute("custDivCd") %>";
	var comDivCd = "<%=session.getAttribute("comDivCd") %>";
	var userLoginId = "<%=session.getAttribute("userLoginId") %>";

	if(custDivCd == "null"){
		custDivCd = fncust;
	}
	if(comDivCd == "null"){
	    comDivCd = fncom;
	}
	if(userLoginId == "null"){
		userLoginId = fnid;
	}

	if(tabid =="rentalCounsel1"){    //구매 상담
		fn_CounselRegister('o2o');
	}else if(tabid =="productCart1"){//구매 장바구니
		fn_O2oOrderCart(custDivCd,comDivCd,userLoginId);
	}else if(tabid =="productOrder1"){//구매 주문하기

		//전후륜 로직 추가
		//전후륜에 추가 타이어가 존재시 장착 서비스 이용가이드 팝업 제외
		var addTireYn     = ValidUtil.isEmpty($("#addTireYn").val()) ? "N" : $("#addTireYn").val();
		var addTireInfoYn = (ValidUtil.isEmpty($("#addTireInfo").val() )) ? "N" : "Y";
		var orderPurchYn = $("#tireSizeYn").val() == "Y"
			                  || ( addTireYn == "Y" && addTireInfoYn == "Y")
			                  || ValidUtil.isEmpty(addDpPrNo);

		if(!orderPurchYn){
			//fn_o2oOrderGo();
			if ((userYn == null || userYn == '' || userYn == 'null')) {
				//fn_nonCustOrder();
				if(ValidUtil.isEmpty($("#addTireInfo").val())){
					$("#modal-nonCustContinue").addClass("md-show");
				}else{
					$("#modal-nonCustContinue").removeClass("md-show");
				}
			}else{
				fn_o2oOrderGo();
			}
		}else{
			if ((userYn == null || userYn == '' || userYn == 'null')) {
				fn_nonCustOrder();
			}else{
				/* 20230202_장착서비스 팝업 미노출 및 주문페이지로 바로 이동(권형태 선임 요청) */
				// $('#o2ojangchackGuide').addClass("md-show");
				fn_o2oOrderGo();
			}
		}
		/*
		if ((userYn == null || userYn == '' || userYn == 'null')) {
			fn_nonCustOrder();
		}else{
			$('#o2ojangchackGuide').addClass("md-show");
		}
		 */
	}else if(tabid =="rentalCounsel2"){//렌탈 상담
		fn_CounselRegister('rental');
	}else if(tabid =="productCart2"){	//렌탈 장바구니
		fn_rentalOrderCart(custDivCd,comDivCd,userLoginId);
	}else if(tabid =="productOrder2"){	//렌탈 주문하기

		/* [20220829_1] kstka 렌탈 주문 사전검증 */
		fn_beforeOrderConfirm(custDivCd,comDivCd,userLoginId,officerCd, 0);

		//fn_tireItemOrder(custDivCd,comDivCd,userLoginId);
	}
});


//로그인 팝업
function fn_LoginPop(){
	$('#modalLoginPop').addClass("md-show");
}

//로그인 성공시
function fn_loginSuc(safeKey, custDivCd, comDivCd, userLoginId){
	var loginGbn = $('#loginPopGbn').val();
	fnid = "Y";
	$("#modalLoginPop").removeClass("md-show");
	$('#loginPopup').css("display","none");

	$('#safekey').val(safeKey);

	if(loginGbn == 'o2oOrder'){ //구매 주문을 할때
		fn_o2oItemOder(custDivCd,comDivCd,userLoginId);
	}else if(loginGbn == 'retalOrder'){ //렌탈주문할때

		/* [20220829_1] kstka 렌탈 주문 사전검증 */
		fn_beforeOrderConfirm(custDivCd,comDivCd,userLoginId,officerCd, 0);

		//fn_tireItemOrder(custDivCd,comDivCd,userLoginId);
	}else if(loginGbn == 'o2oCart'){ //구매 장바구니
		fn_O2oOrderCart(custDivCd,comDivCd,userLoginId);
	}else if(loginGbn == 'retalCart'){ //렌탈 장바구니
		fn_rentalOrderCart(custDivCd,comDivCd,userLoginId);
	}else if(loginGbn == 'nice'){
		$('#modalLoginPop').css("display","none");
		$('#loginPopup').css("display","none");
		userYn = userLoginId;
		$("#searchGbn").val("N");
		$("#modal-carNumSearch").addClass("md-show");
    	$("#carNumberSearchFailImg").attr("style","display:none;");
    	//사이즈 선택 버튼은 검색 성공때만 보인다. MEPARK
    	$(".next-box.carNumNxt").css({
    		'display': 'block',
    		'height': 0,
    		'overflow': 'hidden'
    	});
	}else if(loginGbn == 'downCoupon'){
		userYn = userLoginId;
		fn_o2oDownCoupon(custDivCd,comDivCd,userLoginId); //쿠폰 다운로드
	}else if(loginGbn == 'rcmdChk'){
		location.reload();
	}else{
		fn_CtreateRentalTab("LoginPop"); //로그인 성공하면 타이어 본수를 1 3본 넣어준다.
	}

	$('#loginArea').children().remove();
	var html = "";
		  html += '<i class="ico04" id="logoutLi"></i><a href="#" onClick="javascript:logout();">로그아웃</a>';
	$('#loginArea').html(html);
}

//로그인 비로그인 본수 갯수 활성화
function createRentalO2oQty(gbn){
	var htmlstr = "";

	//구매 타이어 본수 라디오버튼 생성
	var checkO2o= "";
	var checkRental = "";

	if(gbn == "LoginPop"){
		checkO2o = $('#o2oQtySelect').val();
	}else{
		checkO2o = "02";
	}
	$('#radio'+checkO2o).prop("checked", true);
}

/* 구매 후기 리스트 조회 */
function getReviewList(state){
	var patternCd = $('#patternCd').val();
	var brdDivCd  = $('#brdDivCd').val();
	var num = $("#pageNo").val();

	if(num == ""){
		num = 1;
	}else{
		if(state == 'more') {
			num = Number(num) + 1;
		} else {
			num = 1;
		}
	}
	var patternCd = $('#patternCd').val();
	var usePsNo  = getParameters('usePsNo');
	var sortOrd;
	var ordChn;
	var searchType, searchType2;
	var loginId = "${userVo.loginId}";

	$("input[name='reviewOrder']").each(function(){
		if($(this).is(":checked")) {
			sortOrd = $(this).val();
		}
	});

	$("input[name='reviewFilterType']").each(function(){
		if($(this).is(":checked")) {
			ordChn= $(this).val();
		}
	});

	if($("#reviewFilterService01").is(":checked")) {
		searchType= $("#reviewFilterService01").val();
	}
	if($("#reviewFilterService02").is(":checked")) {
		searchType2= $("#reviewFilterService02").val();
	}

	$("#pageNo").val(num);
	var pUrl = "/product/selectOrderReviewList";
	var pSendData = {patternCd : patternCd
					, brdDivCd : "2"
					, pageNo : num
					, usePsNo   : usePsNo
					, sortOrd  : sortOrd
					, ordChn   : ordChn
					, searchType : searchType
					, searchType2 : searchType2
					, custId : loginId
					};
	evManager.commonAjax(pUrl, pSendData, callBackManager.reviewList);
}

getReviewAtflList = function(num, usePsNo){
	var patternCd = $('#patternCd').val();
	var brdDivCd  = $('#brdDivCd').val();
	var sortOrd;
	var ordChn;
	var loginId = "${userVo.loginId}";

	var pUrl = "/product/selectReviewDtl";
	var pSendData = {
					patternCd : patternCd
					, dpPrNo   : $("#dpPrNo").val()
					, usePsNo   : usePsNo
					, custId : loginId
					, searchType : num
					};
	evManager.commonAjax(pUrl, pSendData, callBackManager.reviewAtflList);
}

// 추천수
$(document).on("click","button[name='rcmdBtn']",function(){
	var loginId = "<%=session.getAttribute("userLoginId") %>";
	if(loginId == "" || loginId == "null") {
		ComUtil.confirm("로그인 후 이용가능 합니다. 로그인 화면으로 이동하시겠습니까?", '' , function(){
			$('#loginPopGbn').val('rcmdChk');
			fn_LoginPop();
			return;
		});

	} else {
		// 추천 눌렀나 체크
		var pUrl = "/product/reviewRcmdCheck";
		var pSendData = {
						usePsNo   : this.value
						, custId	: loginId
						, regId		: loginId
						, chgId		: loginId
						};
		evManager.commonAjax(pUrl, pSendData, callBackManager.rcmdChk);

		// 추천을 눌렀으면 취소, 안눌렀으면 추천, 총 추천 갯수 보여주기
	}

})

$(document).on("click","#rcmdBtnPop",function(){
	var loginId = "<%=session.getAttribute("userLoginId") %>";
	if(loginId == "" || loginId == "null") {
		ComUtil.confirm("로그인 후 이용가능 합니다. 로그인 화면으로 이동하시겠습니까?", '' , function(){
			$('#loginPopGbn').val('rcmdChk');
			fn_LoginPop();
			return;
		});

	} else {
		// 추천 눌렀나 체크
		var pUrl = "/product/reviewRcmdCheck";
		var pSendData = {
						usePsNo   : this.value
						, custId	: loginId
						, regId		: loginId
						, chgId		: loginId
						};
		evManager.commonAjax(pUrl, pSendData, callBackManager.rcmdChkPop);

		// 추천을 눌렀으면 취소, 안눌렀으면 추천, 총 추천 갯수 보여주기
	}

})

var getParameters = function (paramName) {
	// 리턴값을 위한 변수 선언
	var returnValue;

	// 현재 URL 가져오기
	var url = location.href;

	// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

	// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	for (var i = 0; i < parameters.length; i++) {
		var varName = parameters[i].split('=')[0];
		if (varName.toUpperCase() == paramName.toUpperCase()) {
			returnValue = parameters[i].split('=')[1];
			return decodeURIComponent(returnValue);
		}
	}
};

/* 추천 렌탈상품 총주문금액 및 월 렌탈료 생성 */
//일반 렌탈
function calculateFee(){

	var frm = document.carInfoFrm;
	// 단면폭,평면비,휠인치,강도 데이터 파싱
	/*
	// 데이터 파싱
	var tmpSizeArray1 = TireSize.split("/");
	console.log("tmpSizeArray1  :"+tmpSizeArray1);
	// 단면폭
	var sectionWidth  = tmpSizeArray1[0];
	var sectionWidth  = tmpSizeArray1[0];
		sectionWidth  = sectionWidth.replace(' ', '');
	console.log("sectionWidth  :"+sectionWidth);
	var tmpSizeArray2 = tmpSizeArray1[1].split("R");
	console.log("tmpSizeArray2  :"+tmpSizeArray2)
	// 평면비
	var aspectRatio  = tmpSizeArray2[0];
	console.log("aspectRatio  :"+aspectRatio)
	var	tmpSizeArray3 = tmpSizeArray2[1].split(" ");
	console.log("tmpSizeArray3  :"+tmpSizeArray3)
	// 인치
	var wheelInches = tmpSizeArray3[0];
	console.log("wheelInches  :"+wheelInches)
	 */
	var sectionWidth = $("#searchSw").val();
	var aspectRatio  = $("#searchAr").val();
	var wheelInches  = $("#searchWi").val();

	//타이어 수량
	var cntCd = $(':radio[name="quantity"]:checked').val();

	if(ValidUtil.isEmpty(cntCd)){
		cntCd = "02";
	}
	//console.log("cntCd  :"+cntCd)

	// 패턴
	//var petternCd  = frm.patternCd.value;
	var petternCd  = frm.rentPatternCd.value;
	// 기간
	var periodCd = frm.recomPeriodCd.value; // 추천상품은 기간 3년 고정

	// 추천렌탈상품 조회
	var pUrl = "/product/selectRentalViewList";
	var pSendData = {sectionWidth 	: sectionWidth
					,aspectRatio 	: aspectRatio
					,wheelInches 	: wheelInches
					,plyRating 		: $('#plyRating').val()
					,petternCd   	: petternCd
					,cntCd 			: cntCd
					,periodCd 		: periodCd};
	evManager.commonAjax(pUrl, pSendData, callBackManager.viewRentalList);
}

function rentalFeeResult(msg){
	$("#recommProduct").html(msg);
}

//구매금액  셋팅
function calculateO2oSet(){

	var frm = document.carInfoFrm;
	var bassSaleFee 	= frm.bassSaleFee.value;  	//기본판매가
	var saleFee 		= frm.saleFee.value;		//판매가
	var stmemSaleAmt 	= frm.stmemSaleAmt.value;	//임직원가
	var couponSaleAmt	= "";
	var bonQty          = $(':radio[name="o2oQtyRadio"]:checked').val();//수량
	var grpPay          = frm.grpPay.value;
	var optTotAmt       = $("#optTotAmt").val();    //옵션가격

	var bassSaleFeeAmt  = 0;  	//전체 기본판매가
	var saleFeeAmt = 0;     	//전체 정상판매가
	var stmemSaleFeeAmt = 0; 	//전체 임직원판매가

	var discAmt         = 0;            //할인되는 가격
	var custGrpCd       = $("#custGrpCd").val();

	bassSaleFeeAmt 	    = Number(bassSaleFee) * Number(bonQty);        	//기본판매가 * 수량
	saleFeeAmt     	    = Number(saleFee) * Number(bonQty);        		//정상판매가 * 수량
	stmemSaleFeeAmt     = Number(stmemSaleAmt) * Number(bonQty);        //임직원판매가 * 수량


	var sale4descText = "";// 구매하기 밑에 문구 설정
	if($('.ext_price').text()!="" || $('.only_price').text() != "" ){
		if(ValidUtil.isEmpty(custGrpCd)){
	    	if($("#patternCd").val().indexOf('NFERA') > -1 || $("#patternCd").val().indexOf('AU7') > -1) {
	    		sale4descText = "기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> <b>GO 서비스 무료(방문장착 <span style='text-decoration:line-through; text-decoration-thickness:2px;'>50,000원</span>)</b> / 구매 혜택 : 이벤트할인가";
			}else{
	    		sale4descText = "기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> <b>GO 서비스 무료(방문장착 <span style='text-decoration:line-through; text-decoration-thickness:2px;'>50,000원</span>)</b> / 구매 혜택 : 이벤트할인가";
			}
		}else{
    		sale4descText = "기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> <b>GO 서비스 무료(방문장착 <span style='text-decoration:line-through; text-decoration-thickness:2px;'>50,000원</span>)</b> / 구매 혜택 : 제휴할인가";
		}
 	}

 	if(grpPay == "Y"){

 		discAmt = bassSaleFeeAmt - saleFeeAmt;

 		$('#orderO2oOriAmt').val(bassSaleFeeAmt);
 	    $('#orderO2oSaleAmt').val(discAmt);
 	    $('#orderO2oPayAmt').val(saleFeeAmt+Number(optTotAmt));
 	    $('#orderO2oCnt').val(bonQty);

 	    bassSaleFeeAmt 	= NumUtil.setComma(bassSaleFeeAmt);
 	    var couponSaleFee = 0;

    	couponSaleAmt	= NumUtil.setComma(Number(saleFeeAmt)+Number(optTotAmt));
 	  	saleFeeAmt  	= NumUtil.setComma(Number(saleFeeAmt)+Number(optTotAmt));
 		discAmt 		= NumUtil.setComma(discAmt);

		$('.org_price').text('￦' + bassSaleFeeAmt);
	   	$('.ext_price').text('￦' + saleFeeAmt);
	    $("#onlyPriceDiv").attr('style','display:none;');
	    $("#salePriceDiv").attr('style','display:"";');

	    /* if($('.ext_price').text()!=""){
			if(ValidUtil.isEmpty(custGrpCd)){
		    	if($("#patternCd").val().indexOf('NFERA') > -1 || $("#patternCd").val().indexOf('AU7') > -1) {
					$("#sale4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 30% 할인)");	// 구매하기 밑에 문구 설정
				}else{
					$("#sale4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 25% 할인");	// 구매하기 밑에 문구 설정
				}
			}else{
				$("#sale4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 제휴할인가");	// 구매하기 밑에 문구 설정
			}
	 	} */

 	}else{

 		if(officerCd != '' && officerCd != null){ //임직원이면

   	        $('#officerFeeAmt').text("");

//    			$('#orderO2oOriAmt').val(stmemSaleFeeAmt);
   			$('#orderO2oOriAmt').val(bassSaleFeeAmt); // 원래가격은 임직원가가 아닌 기표가로 표기한다.(그룹,임직원,쿠폰할인,할인 모두 동일)
   	        $('#orderO2oSaleAmt').val(discAmt);
   	        $('#orderO2oPayAmt').val(Number(stmemSaleFeeAmt)+Number(optTotAmt));
   	        $('#orderO2oCnt').val(bonQty);

   	        //[보류 - 임직원가 그대로 노출]
// 	   	        var totSaleFeeAmt = stmemSaleFeeAmt; //최종가 (임직원가)
//    	   	        if(stmemSaleFeeAmt > saleFeeAmt){ //임직원가 > 쿠폰가면 쿠폰가를 보여준다.
//    	   	      		totSaleFeeAmt = saleFeeAmt;
//    	   	        }

//    	   	     	bassSaleFeeAmt 	="\\" + NumUtil.setComma(Number(totSaleFeeAmt));
//    	   	  		saleFeeAmt  	="\\" + NumUtil.setComma(Number(totSaleFeeAmt)+Number(optTotAmt));
//    	   			discAmt 		="\\" + NumUtil.setComma(discAmt);

   	     	bassSaleFeeAmt 	=NumUtil.setComma(stmemSaleFeeAmt);
   	  		saleFeeAmt  	=NumUtil.setComma(Number(stmemSaleFeeAmt) +Number(optTotAmt) );
   			discAmt 		=NumUtil.setComma(discAmt);

   	     	$('#officerFeeAmt').text(bassSaleFeeAmt);
   	     	$('.only_price').text('￦' + saleFeeAmt);
   	     	/*
	     	if($('.only_price').text() != ""){
	     		if(ValidUtil.isEmpty(custGrpCd)){
		     		if($("#patternCd").val().indexOf('NFERA') > -1 || $("#patternCd").val().indexOf('AU7') > -1) {
						$("#only4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 30% 할인");	// 구매하기 밑에 문구 설정
					}else{
						$("#only4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 25% 할인");	// 구매하기 밑에 문구 설정
					}
	     		}else {
	     			$("#sale4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 제휴할인가");	// 구매하기 밑에 문구 설정
	     		}
	     	} */
	   	}else{
   	   		discAmt = bassSaleFeeAmt - saleFeeAmt;
   			$('#orderO2oOriAmt').val(bassSaleFeeAmt);
   	        $('#orderO2oSaleAmt').val(discAmt);
   	        $('#orderO2oPayAmt').val(Number(saleFeeAmt)+Number(optTotAmt));
   	        $('#orderO2oCnt').val(bonQty);

   	     	bassSaleFeeAmt 	= NumUtil.setComma(bassSaleFeeAmt);
   	     	var couponSaleFee = 0;
	     	couponSaleAmt	= NumUtil.setComma(Number(saleFeeAmt)+Number(optTotAmt));
   	  		saleFeeAmt  	= NumUtil.setComma(Number(saleFeeAmt)+Number(optTotAmt));
   			discAmt 		= NumUtil.setComma(discAmt);

   			if(couponItemYn == "Y") {
   	        	$('.org_price').text('￦' + bassSaleFeeAmt);
   	   	        $('.ext_price').text('￦' + couponSaleAmt);
   	        	$("#onlyPriceDiv").attr('style','display:none;');
   	        	$("#salePriceDiv").attr('style','display:"";');
				/*
   	        	if($('.ext_price').text()!=""){
					if($("#patternCd").val().indexOf('NFERA') > -1 || $("#patternCd").val().indexOf('AU7') > -1) {
						$("#sale4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 30% 할인");	// 구매하기 밑에 문구 설정
					}else{
						$("#sale4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 25% 할인");	// 구매하기 밑에 문구 설정
					}
   	 			} */
   	        } else {
   	        	$('.only_price').text('￦' + saleFeeAmt);

   	        	/*
   	        	if($('.only_price').text()!=""){
					if($("#patternCd").val().indexOf('NFERA') > -1 || $("#patternCd").val().indexOf('AU7') > -1) {
						$("#only4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 30% 할인");	// 구매하기 밑에 문구 설정
					}else{
						$("#only4descText").html("기본 구매 혜택 : 타이어 장착비 무료 / 항균연막탈취 서비스 무료 <br/> 구매 혜택 : 25% 할인");	// 구매하기 밑에 문구 설정
					}
   	 			}
   	        	 */

   	        }
	   	        /** 믿음 수정 내용 **/
   		}
	}

 	$("#sale4descText").html(sale4descText);

 	//로그인한 유저만 쿠폰가격 적용
	//console.log("usrId="+$("#userId").val())
	if(!ValidUtil.isEmpty($("#userId").val())) {
        fn_calcCouponAmt();
	}

}


function fn_CtreateRentalTab(data){

	var quantityRenHtmlstr = "";
	var termRenHtmlstr = "";
	var feeRenHtmlstr = "";
	var userYn = '${userVo.loginId}';
	var reRentUseYN = $('#reRentUseYN').val();

	var frm = document.selfRental; //첫 진입시는 기본으로 넣어주기

	var quantityChk = $(':radio[name="quantity"]:checked').val();
	var termChk = $(':radio[name="term"]:checked').val();
	var feeChk = $(':radio[name="fee"]:checked').val();

	if(typeof quantityChk == 'undefined' || quantityChk == "01" ){
		quantityChk = "02"; //기본 2본
	}
	if(typeof termChk == 'undefined' ){
		termChk = "36"; //기본 36개월
	}
	if(typeof feeChk == 'undefined' ){
		feeChk = "01"; //기본 해당없음
	}

	//console.log("::::userYn::::::"+userYn);
		//console.log("::::reRentUseYN::::::"+reRentUseYN);
	//팝업 로그인으로 다가왔을때.
	if(data == "LoginPop"){
		//일단 삭제
		$('#quantityRen').children().remove();
		if(reRentUseYN != 'N'){
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity01' value='01' class='type06'><label for='quantity01'><span>1본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity02' value='02' class='type06'><label for='quantity02'><span>2본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity03' value='03' class='type06'><label for='quantity03'><span>3본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity04' value='04' class='type06'><label for='quantity04'><span>4본</span></label>";
		}else{
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity02' value='02' class='type06'><label for='quantity02'><span>2본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity04' value='04' class='type06'><label for='quantity04'><span>4본</span></label>";
		}
		//렌탈 추가
		$("#quantityRen").html(quantityRenHtmlstr);
		$('#quantity'+quantityChk).prop("checked", true);
	}else{
		//일단 삭제
		$('#quantityRen, #termRen, #feeRen').children().remove();
		//타이어 본수 생성
		if(userYn == '' || reRentUseYN == 'N'){
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity02' value='02' class='type06'><label for='quantity02'><span>2본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity04' value='04' class='type06'><label for='quantity04'><span>4본</span></label>";
		}else{
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity01' value='01' class='type06'><label for='quantity01'><span>1본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity02' value='02' class='type06'><label for='quantity02'><span>2본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity03' value='03' class='type06'><label for='quantity03'><span>3본</span></label>";
			quantityRenHtmlstr += "<input type='radio' name='quantity' id='quantity04' value='04' class='type06'><label for='quantity04'><span>4본</span></label>";
		}

		//렌탈 기간 생성
		for(var i=0; i < data.renNapbuList.length; i++) {

			if(data.renNapbuList[i].searchCd1 != "48"){ //48개월 임시 block처리
				termRenHtmlstr += "<input type='radio' name='term' id='term"+ data.renNapbuList[i].searchCd1 +"' value='"+ data.renNapbuList[i].searchCd1 +"' class='type06'><label for='term"+ data.renNapbuList[i].searchCd1 +"'><span>"+ data.renNapbuList[i].searchCdNm +"</span></label>";
			}
		}

		//렌탈 등록비 생성
		for(var i=0; i < data.regAmtList.length; i++) {
			var feeRenAmt = data.regAmtList[i].searchCdNm;
			if(feeRenAmt == 0){
				feeRenHtmlstr += "<input type='radio' name='fee' id='fee"+ data.regAmtList[i].searchCd +"' value='"+ data.regAmtList[i].searchCd +"' class='type06'><label for='fee"+ data.regAmtList[i].searchCd +"'><span>"+ NumUtil.setComma(data.regAmtList[i].searchCdNm) +"</span></label>( <b>등록비 면제 이벤트 <span style='text-decoration:line-through; text-decoration-color:red; text-decoration-thickness:2px;'>50,000원</span></b> )";
			} else {
				feeRenHtmlstr += "<input type='radio' name='fee' id='fee"+ data.regAmtList[i].searchCd +"' value='"+ data.regAmtList[i].searchCd +"' class='type06'><label for='fee"+ data.regAmtList[i].searchCd +"'><span>"+ NumUtil.setComma(data.regAmtList[i].searchCdNm) +"</span></label>";
			}
		}

		//렌탈 추가
		$("#quantityRen").html(quantityRenHtmlstr);
		//렌탈 추가
		$("#termRen").html(termRenHtmlstr);
		//렌탈 추가
		$("#feeRen").html(feeRenHtmlstr);

		$('#quantity'+quantityChk).prop("checked", true);
		$('#term'+termChk).prop("checked", true);
		/* $('#fee'+feeChk).prop("checked", true); */
		$('#fee'+data.regAmtList[0].searchCd).prop("checked", true);
	}

	fn_btnEventInit();
}

//자유렌탈 서비스 리스트 불러오기
function freeRentalServiceList(){
	var periodCd = $(':radio[name="term"]:checked').val();	 //추천개월수
	var cntCd = $(':radio[name="quantity"]:checked').val();		 //타이어 본수

	//처음 진입시 기본 설정
	if(ValidUtil.isEmpty(periodCd)){
		periodCd = "36"; //기본 36개월
	}
	if(ValidUtil.isEmpty(cntCd)){
		cntCd = "02"; //기본 2본
	}

	//console.log("periodCd   : "+periodCd+"     cntCd :"+cntCd);

	var pUrl = "/product/selectFreeRentalServiceList";
	var pSendData = {periodCd : periodCd, cntCd : cntCd};
	evManager.commonAjax(pUrl, pSendData, callBackManager.FreeRentalServicList);
}


//렌탈 등록비 가져오기
function fnSelectRntalRegAmtList(){

	//판매상품코드
	var saleCd = $('select[name="rentaltype"] option:checked').attr('salecd');
	//상품그룹
	var prdtGrp = $('select[name="rentaltype"] option:checked').attr('prdtgrp');
	//상품상세그룹
	var prdtGrpDtl = $('select[name="rentaltype"] option:checked').attr('prdtgrpdtl');
	//타이어 본수
	var cntCd = $(':radio[name="quantity"]:checked').val();

	/* if(ValidUtil.isEmpty(saleCd)){
		saleCd = "S000000092";
	} */

	if(ValidUtil.isEmpty(prdtGrp)){
		prdtGrp = "01";
	}

	if(ValidUtil.isEmpty(prdtGrpDtl)){
		prdtGrpDtl = "04"; //기본 2본
	}

	if(ValidUtil.isEmpty(cntCd)){
		cntCd = "02"; //기본 2본
	}

	var pUrl = "/product/selectRntalRegAmtList";
	/* var pSendData = {cntCd : cntCd}; */
	var pSendData = {
			saleCd 		: saleCd,
			prdtGrp 	: prdtGrp,
			prdtGrpDtl 	: prdtGrpDtl,
			cntCd 		: cntCd
		};
	evManager.commonAjax(pUrl, pSendData, callBackManager.RentalRegAmtList);
}

//자유렌탈
function calculateSelfRentalFee(){

	var frm = document.selfRental;

	var selEnginCd = frm.selEnginCd.value;
	var selLocCd = frm.selLocCd.value;
	var selVisCd = frm.selVisCd.value;
	var selSaveCd = frm.selSaveCd.value;
	var selTcCd = frm.selTcCd.value;
	var selPrCd = frm.selPrCd.value;
	var selArCd = frm.selArCd.value;
	var selCheckCd = frm.selCheckCd.value;

	var selEnginCdAmt = frm.selEnginCdAmt.value;
	var selLocCdAmt = frm.selLocCdAmt.value;
	var selVisCdAmt = frm.selVisCdAmt.value;
	var selSaveCdAmt = frm.selSaveCdAmt.value;
	var selTcCdAmt = frm.selTcCdAmt.value;
	var selPrCdAmt = frm.selPrCdAmt.value;
	var selArAmt = frm.selArAmt.value;
	var selCheckAmt = frm.selCheckCdAmt.value;

	var searchFrm = document.carInfoFrm;
	/*
	// 데이터 파싱
	var tmpSizeArray1 = TireSize.split("/");
	// 단면폭
	var sectionWidth  = tmpSizeArray1[0];
		sectionWidth  = sectionWidth.replace(' ', '');

	var tmpSizeArray2 = tmpSizeArray1[1].split("R");
	// 평면비
	var aspectRatio  = tmpSizeArray2[0];

	var	tmpSizeArray3 = tmpSizeArray2[1].split(" ");
	// 인치, 강도
	var wheelInches = tmpSizeArray3[0];
	 */
	var sectionWidth = $("#searchSw").val();
	var aspectRatio  = $("#searchAr").val();
	var wheelInches  = $("#searchWi").val();


	var cntCd = $(':radio[name="quantity"]:checked').val();

	if(typeof cntCd == 'undefined' ){
		cntCd = "02"; //기본 2본
	}

	// 상담신청 시 수량 값 form 값에 저장 (IE);
	$('input[name="cntCd"]').val(cntCd);

	var cntCdNm = searchFrm.cntCdNm.value;
	if(typeof cntCdNm == 'undefined' || cntCdNm == ""){
		cntCdNm = "2본"; //기본 2본
		searchFrm.cntCdNm.value = cntCdNm;
	}

	var regiAmt = frm.regiAmt.value.replace(',','');
	//var petternCd = searchFrm.patternCd.value;
	var petternCd = searchFrm.rentPatternCd.value;
	var periodCd = frm.periodCd.value;

	var pUrl = "/product/selectCalculateSelfProdFee";
	var pSendData = {
					    selEnginCd 		: selEnginCd
						,selLocCd 		: selLocCd
						,selVisCd 		: selVisCd
						,selSaveCd 		: selSaveCd
						,selTcCd 		: selTcCd
						,selPrCd 		: selPrCd
						,selArCd 		: selArCd
					    ,selEnginCdAmt 	: selEnginCdAmt
						,selLocCdAmt 	: selLocCdAmt
						,selVisCdAmt 	: selVisCdAmt
						,selSaveCdAmt 	: selSaveCdAmt
						,selTcCdAmt 	: selTcCdAmt
						,selPrCdAmt 	: selPrCdAmt
						,selArAmt 		: selArAmt
						,sectionWidth 	: sectionWidth
						,aspectRatio 	: aspectRatio
						,wheelInches 	: wheelInches
						,plyRating 		: $("#plyRating").val()
						,cntCd 			: cntCd
						,regiAmt 		: regiAmt
						,petternCd 		: petternCd
						,periodCd 		: periodCd
						,cntCdNm 		: cntCdNm
					};

	evManager.commonAjax(pUrl, pSendData, callBackManager.FreeRentalList);

}

/* 자유렌탈 서비스 리스트 먼저 역순으로 뿌려줘야 하기때문에 서비스 리스트 만들어주면서 틀을 잡아준다. */
function fn_CtreateRentalServicList(data){

	var htmlstr1 = "";
	var htmlstr2 = "";
	var htmlstr3 = "";
	var htmlstr4 = "";
	var htmlstr5 = "";
	var htmlstr6 = "";
	var htmlstr7 = "";
	var htmlstr8 = "";

	var datapack = [
	   {'id':'tierFreeSelect'    ,'data':data.getProdViewCdList56 ,'code':'B00007' } // 타이어 무상교체
	  ,{'id':'engineChageSelect' ,'data':data.getProdViewCdList51 ,'code':'B00001' } // 엔진오일 교체
	  ,{'id':'freeAlinSelect'    ,'data':data.getProdViewCdList57 ,'code':'B00008' } // 무상 얼라이먼트
	  ,{'id':'freeGpsChangSelect','data':data.getProdViewCdList52 ,'code':'B00002' } // 무상 위치교환
	  ,{'id':'visitCheckSelect'  ,'data':data.getProdViewCdList53 ,'code':'B00003' } // 방문점검
	  ,{'id':'freeCheckSelect'   ,'data':data.getProdViewCdList58 ,'code':'B00010' } // check
	];

	for( var i in datapack ){
		var row = datapack[i];

		if(row.data.length > 0){
			$('#'+row.id+' select').children().remove();

			if(row.code != "B00010"){
				$('#'+row.id+' select').append('<option value="'+row.code+'|0|0">해당없음</option>');
			}

			for(var i=0; i < row.data.length; i++) {
				if(row.data[i].servCnt == '999'){
					$('#'+row.id+' select').append('<option value="'+row.data[i].prsDcd+'|'+row.data[i].servCnt+'|'+row.data[i].servCntAmt+'">무제한</option>');

				}else{
					$('#'+row.id+' select').append('<option value="'+row.data[i].prsDcd+'|'+row.data[i].servCnt+'|'+row.data[i].servCntAmt+'">'+row.data[i].servCnt+'회</option>');
				}
			}
		}
		$('#'+row.id+' select.rent-opt').niceSelect('update').click();;
	}

	$('#tierFreeCnt').text('0');
	/* $('#engineChageCnt').text('0'); */
	$('#freeAlinCnt').text('0');
	$('#freeGpsChangCnt').text('0');
	/* $('#visitCheckCnt').text('0'); */
	/* $('#freeCheckCnt').text('0'); */

		//5.자유렌탈 조회
		//setSelCodeNew();//form 값이 여기서 바뀌고 재조회가 들어간다.
	//5.자유렌탈 조회

    $(".arrowClose").click(function(e) {
 	   $(".selBox").slideUp(300);
        e.preventDefault();
 	});
}

function fn_CtreateFreeRentalList(data){

	var innerHtml = "";
	var saleNm 			= "";
	var totalAmt 		= 0;	//총 렌탈료
	var totalRentAmt 	= 0; 	//총 납입금액
	var dcAmt 			= 0;	//할인금액
	var prdtGrp 		= "";
	var rentAmt 		= 0;	//기본 월 렌탈료
	var prdtGrpDtl 		= "";
    var saleCd 			= "";
    var addRentAmt 		= 0;	//추가렌탈료
    var regiAmt 		= 0;	//렌탈등록비

    if(data.freeList.length > 0 ){
    	saleNm 			= data.freeList[0].saleNm;
    	totalAmt 		= data.freeList[0].totalAmt; 		//총 렌탈료
    	totalRentAmt 	= data.freeList[0].totalRentAmt; 	//총 납입금액
    	dcAmt 			= data.freeList[0].dcAmt;    		//할인금액
    	prdtGrp 		= data.freeList[0].prdtGrp;
    	rentAmt 		= data.freeList[0].rentAmt;  		//기본 월 렌탈료
    	prdtGrpDtl 		= data.freeList[0].prdtGrpDtl;
    	saleCd 			= data.freeList[0].saleCd;
    	addRentAmt 		= data.freeList[0].addRentAmt; 		//추가렌탈료
    	regiAmt 		= data.freeList[0].regiAmt;    		//렌탈등록비
    }else{

		//자유렌탈 상품 정보 없을시 화면내 비활성화
		$('#rentalStyleWrap select.rentalstyle option:eq(0)').remove();

	}

    $('#monthFreeRentalAmt').text("");
    $('#plusFreeRentalAmt').text("");
    $('#saleFreeRentalAmt').text("");
    $('#totalFreeRentalAmt').text("");

    $('#freeRentalHashBox').children().remove();

	var monthRentalAmt =  Number(totalAmt) - Number(dcAmt);  //월 렌탈료
	var addRentalAmt   =  Number(addRentAmt)
	var saleAmt  	   =  Number(dcAmt)
	var totalRentAmt   =  Number(totalRentAmt)


	monthRentalAmt ="￦"+monthRentalAmt; 	// 월렌탈료
	addRentalAmt = "￦"+addRentalAmt;    	// 추가렌탈료
	saleAmt = "￦"+saleAmt;			 	// 할인금액
	totalRentAmt = "￦"+totalRentAmt;		//총 납입금액

    $('#monthFreeRentalAmt').text(NumUtil.setComma(monthRentalAmt));
    $('#plusFreeRentalAmt').text(NumUtil.setComma(addRentalAmt));
    $('#saleFreeRentalAmt').text(NumUtil.setComma(saleAmt));
    $('#totalFreeRentalAmt').text(NumUtil.setComma(totalRentAmt));
    $('#rentalStyleWrap select.rentalstyle option:eq(0)').attr('saleCd',saleCd);
    $('#rentalStyleWrap select.rentalstyle option:eq(0)').attr('prdtGrp',prdtGrp);
    $('#rentalStyleWrap select.rentalstyle option:eq(0)').attr('prdtGrpDtl',prdtGrpDtl);
    if(ValidUtil.isEmpty($('#monthMinRentAmt').text())){
    	$(".monthMinRentAmt").text(NumUtil.setComma(monthRentalAmt) + " ~")
    }

    /* 해시태그 넣어보기 */
    innerHtml = "";//$('select[name="tierFrChg"] option:checked').val()
    var engineChg = $(':radio[name="engineChg"]:checked').next().text();
    var freeLoc = $(':radio[name="freeLoc"]:checked').next().text();
    var visitFree = $(':radio[name="visitFree"]:checked').next().text();
    var strgSevice = $(':radio[name="strgSevice"]:checked').next().text();
    var tierChage = $(':radio[name="tierChage"]:checked').next().text();
    var tierFrChg = $(':radio[name="tierFrChg"]:checked').next().text();
    var freeAlin = $(':radio[name="freeAlin"]:checked').next().text();
    var cntCdNm = $('#cntCdNm').val();
    var periodCd = $('input[name="recomPeriodCd"]').val();

    if(typeof cntCdNm != 'undefined' && cntCdNm != null  && cntCdNm != "" ){
    	innerHtml += '<span class="hash">#타이어수량  '+cntCdNm+'</span>';
    }
    if(typeof periodCd != 'undefined' && periodCd != null  && periodCd != "" ){
    	innerHtml += '<span class="hash">#렌탈기간  '+periodCd+'개월</span>';
    }

	/* innerHtml!!! */
	$('#freeRentalHashBox').html(innerHtml);
}


/* 선택한 서비스 코드 정보 셋팅 */
function setSelCodeNew(code){
	var frm = document.selfRental;

	/* //타이어 무상 교체
	var tierFrChgVal = $('select[name="tierFrChg"] option:checked').val();
	var tierFrChgSplt = tierFrChgVal.split('|');
	frm.selPrCd.value = tierFrChgSplt[1];
	frm.selPrCdAmt.value = tierFrChgSplt[2];
	//엔진오일 교체
	var engineChgVal = $('select[name="engineChg"] option:checked').val();
	var engineChgSplt = engineChgVal.split('|');
	frm.selEnginCd.value = engineChgSplt[1];
	frm.selEnginCdAmt.value = engineChgSplt[2];
	//무상 얼라이먼트
	var freeAlinVal = $('select[name="freeAlin"] option:checked').val();
	var freeAlinSplt = freeAlinVal.split('|');
	frm.selArCd.value = freeAlinSplt[1];
	frm.selArAmt.value = freeAlinSplt[2];
	//무상 위치교환
	var freeLocVal = $('select[name="freeLoc"] option:checked').val();
	var freeLocSplt = freeLocVal.split('|');
	frm.selLocCd.value = freeLocSplt[1];
	frm.selLocCdAmt.value = freeLocSplt[2];
	//방문점검
	var visitFreeVal = $('select[name="visitFree"] option:checked').val();
	var visitFreeSplt = visitFreeVal.split('|');
	frm.selVisCd.value = visitFreeSplt[1];
	frm.selVisCdAmt.value = visitFreeSplt[2]; */

	//타이어 무상 교체
	var tierFrChgVal = $('select[name="tierFrChg"] option:checked').val();
	var tierFrChgSplt;
	if(typeof tierFrChgVal != 'undefined' ){
		tierFrChgSplt = tierFrChgVal.split('|');
		frm.selPrCd.value = tierFrChgSplt[1];
		frm.selPrCdAmt.value = tierFrChgSplt[2];
	}
	//엔진오일 교체
	/* var engineChgVal = $('select[name="engineChg"] option:checked').val();
	var engineChgSplt;
	if(typeof engineChgVal != 'undefined' ){
		engineChgSplt = engineChgVal.split('|');
		frm.selEnginCd.value = engineChgSplt[1];
		frm.selEnginCdAmt.value = engineChgSplt[2];
	} */

	//무상 얼라이먼트
	var freeAlinVal = $('select[name="freeAlin"] option:checked').val();
	var freeAlinSplt;
	if(typeof freeAlinVal != 'undefined' ){
		freeAlinSplt = freeAlinVal.split('|');
		frm.selArCd.value = freeAlinSplt[1];
		frm.selArAmt.value = freeAlinSplt[2];
	}

	//무상 위치교환
	var freeLocVal = $('select[name="freeLoc"] option:checked').val();
	var freeLocSplt;
	if(typeof freeLocVal != 'undefined' ){
		freeLocSplt = freeLocVal.split('|');
		frm.selLocCd.value = freeLocSplt[1];
		frm.selLocCdAmt.value = freeLocSplt[2];
	}

	//방문점검
	/* var visitFreeVal = $('select[name="visitFree"] option:checked').val();
	var visitFreeSplt;
	if(typeof visitFreeVal != 'undefined' ){
		visitFreeSplt = visitFreeVal.split('|');
		frm.selVisCd.value = visitFreeSplt[1];
		frm.selVisCdAmt.value = visitFreeSplt[2];
	} */

	//체크서비스
	var freeCheckVal = $('select[name="freeCheck"] option:checked').val();
	var freeCheckSplt;
	if(typeof freeCheckVal != 'undefined' ){
		freeCheckSplt = freeCheckVal.split('|');
		frm.selCheckCd.value = freeCheckSplt[1];
		frm.selCheckCdAmt.value = freeCheckSplt[2];
	}

	/* 자유렌탈 가격 재호출 */
	calculateSelfRentalFee();
}

function fn_CreateViewRentalList(data){
	var rentalHtml = "";
	
	// 240820 백인천 : 해당 본수 및 렌탈기간이 없다면, 기본 2본 36개월로 구성.
	var temp_quantity = $(':radio[name="quantity"]:checked').val();
	var temp_term = $(':radio[name="term"]:checked').val();
	
	if(ValidUtil.isEmpty(temp_quantity)) {
		$('#quantity02').prop("checked", true);
	}
	
	if(ValidUtil.isEmpty(temp_term)) {
		$('#term36').prop("checked", true);
	}
	
	/* 일단 렌탈 리스트 삭제 */
	$('li[id ^= "nomalRenta"]').remove();
	$('#loginPopLayer').remove();

	if(ValidUtil.isEmpty(officerCd)) {
		//일반
		$('#rentalStyleWrap select.rentalstyle option:not([value=rentaltype00])').remove();
	} else {
		//임직원
		$('#rentalStyleWrap select.rentalstyle option').remove();
	}

	var now_rent_type = $('#nomalRentalId').val();

	if(ValidUtil.isEmpty(officerCd)) {
		//일반
		$(".rental-option-detail-wrap .rental-option-detail:not([id=tab_rentaltype00])").remove();
	} else {
		//임직원
		$(".rental-option-detail-wrap .rental-option-detail").remove();
	}

	for(var i=0; i < data.prodList.length; i++) {
		console.log("length check : " + i);
		// $('#rentalStyleTabsWrap ul').append('<li class="" rel="nomalRental'+i+'" id="tab_nomalRental'+i+'">'+ data.prodList[i].saleNm +'</li>');
		if( now_rent_type == 'rentaltype'+i ) {
			$('#rentalStyleWrap select.rentalstyle').append('<option value="rentaltype'+i+'" selected  saleCd='+ data.prodList[i].saleCd +' prdtGrp='+ data.prodList[i].prdtGrp +' prdtGrpDtl='+ data.prodList[i].prdtGrpDtl +' id="rentaltype'+i+'" value="'+i+'">'+ data.prodList[i].saleNm +'</option>');
			$('#monthFreeRentalAmt').text('￦' + NumUtil.setComma(data.prodList[i].rentAmt));
	        $('#totalFreeRentalAmt').text('￦' + NumUtil.setComma(data.prodList[i].totalRentAmt));
	        if(ValidUtil.isEmpty(data.prodList[i].addRentAmt)) {
	        	$('#plusFreeRentalAmt').text('￦' + 0);
	        	$('#monthFreeRentalAmt').text('￦' + NumUtil.setComma(data.prodList[i].rentAmt));
	        } else {
	        	var monRentlAmt = Number(data.prodList[i].rentAmt) + Number(data.prodList[i].addRentAmt);
	        	$('#plusFreeRentalAmt').text('￦' + NumUtil.setComma(data.prodList[i].addRentAmt));
	        	$('#monthFreeRentalAmt').text('￦' + NumUtil.setComma(monRentlAmt));
	        }
	        if(ValidUtil.isEmpty(data.prodList[i].addRentAmt))
	        	$('#saleFreeRentalAmt').text('￦' + 0);
	        else
	        	$('#saleFreeRentalAmt').text('￦' + NumUtil.setComma(data.prodList[i].dcAmt));
		}
		else
			$('#rentalStyleWrap select.rentalstyle').append('<option value="rentaltype'+i+'" saleCd='+ data.prodList[i].saleCd +' prdtGrp='+ data.prodList[i].prdtGrp +' prdtGrpDtl='+ data.prodList[i].prdtGrpDtl +' id="rentaltype'+i+'" value="'+i+'">'+ data.prodList[i].saleNm +'</option>');

		$('#rentalStyleWrap select.rentalstyle').niceSelect('update');

		// $('#rentalStyleTabsWrap ul').append('<li class="" rel="nomalRental'+i+'" id="tab_nomalRental'+i+'">'+ data.prodList[i].saleNm +'</li>');

		var optionDetail = '';

		$(".rental-option-detail-wrap").append(optionDetail);
		
		if(ValidUtil.isEmpty(officerCd)) {
			//일반
			optionDetail += '<ul class="rental-option-detail" id="tab_rentaltype'+i+'" style="display:none;">';
		} else {
			//임직원
			optionDetail += '<ul class="rental-option-detail" id="tab_rentaltype'+i+'">';
		}


		//무상교체 서비스 제외처리
		if(${toDay} < "20220101"){
			optionDetail += '	<li id="tierFreeSelect">';
			optionDetail += '		<span class="label">타이어 무상교체 <span class="info-ico" tip="tipshow01"></span></span>';

			if(data.prodList[i].selPrCd == '0' || typeof data.prodList[i].selPrCd == 'undefined'){
			optionDetail += '<span class="retn-opt"><span class="noData">해당없음</span></span>';
			}else if(data.prodList[i].selPrCd == '999'){
				optionDetail += '<span class="retn-opt"><span class="noData">무제한</span></span>';
			}else{
				optionDetail += '<span class="retn-opt"><span class="num">'+ data.prodList[i].selPrCd +'</span>회</span>';
			}

			optionDetail += '	</li>';
		}

		optionDetail += '	<li id="freeAlinSelect">';
		optionDetail += '		<span class="label">얼라인먼트서비스 <span class="info-ico" tip="tipshow03"></span></span>';

		if(data.prodList[i].selArCd == '0' || typeof data.prodList[i].selArCd == 'undefined'){
		optionDetail += '<span class="retn-opt"><span class="noData">해당없음</span></span>';
		}else if(data.prodList[i].selArCd == '999'){
			optionDetail += '<span class="retn-opt"><span class="noData">무제한</span></span>';
		}else{
			optionDetail += '<span class="retn-opt"><span class="num">'+ data.prodList[i].selArCd +'</span>회</span>';
		}

		optionDetail += '	</li>';
		optionDetail += '	<li id="freeGpsChangSelect">';
		optionDetail += '		<span class="label">무상 위치교환 <span class="info-ico" tip="tipshow04"></span></span>';

		if(data.prodList[i].selLocCd == '0' || typeof data.prodList[i].selLocCd == 'undefined'){
		optionDetail += '<span class="retn-opt"><span class="noData">해당없음</span></span>';
		}else if(data.prodList[i].selLocCd == '999'){
			optionDetail += '<span class="retn-opt"><span class="noData">무제한</span></span>';
		}else{
			optionDetail += '<span class="retn-opt"><span class="num">'+ data.prodList[i].selLocCd +'</span>회</span>';
		}

		optionDetail += '	</li>';

		optionDetail += '	<li id="freeCheckSelect">';
		optionDetail += '		<span class="label">Check서비스 <span class="info-ico" tip="tipshow06"></span></span>';
		optionDetail += '		<span class="retn-opt"><span class="num">'+ data.prodList[i].selCheckCd +'</span>회</span>';
		optionDetail += '	</li>';

		optionDetail += '</ul>';

		$(".rental-option-detail-wrap").append(optionDetail);

		//임직원일때는 처음에 바로 그려준다.
		if(!ValidUtil.isEmpty(officerCd)) {

			//임직원 상품이 다수일경우 월렌탈료 노출 기준 변경 - 기존은 한개 -> 현재는 선택된 상품의 index기준
			var idx = $('select[name="rentaltype"] option:selected').index();

			//월렌탈료
			var totalAmt 			= data.prodList[idx].totalAmt;
			var totalRentAmt 		= data.prodList[idx].totalRentAmt;
			var dcAmt 				= data.prodList[idx].dcAmt;
			var rentAmt 			= data.prodList[idx].rentAmt;
			var regiAmt 			= data.prodList[idx].regiAmt;
			var addRentAmt			= data.prodList[idx].addRentAmt;

			var monthRentalAmt 	=  Number(totalAmt) - Number(dcAmt);  	//월 렌탈료
			var addRentAmt   	=  Number(addRentAmt) 				 		//추가렌탈료
			var saleAmt  	   	=  Number(dcAmt) 					 	//할인금액
			var totalRentAmt   	=  Number(totalRentAmt) 			     	//총납입금액

			if(isNaN(monthRentalAmt)){
				monthRentalAmt = 0;
			}
			if(isNaN(addRentAmt)){
				addRentAmt = 0;
			}
			if(isNaN(saleAmt)){
				saleAmt = 0;
			}
			if(isNaN(monthRentalAmt)){
				monthRentalAmt = 0;
			}

			var sfrm = document.selfRental;

			var mom_amt = Number(rentAmt) + Number(addRentAmt);  		// 기본렌탈료 + 추가렌료
			var dc_amt = Number(dcAmt);    								// 렌탈 할인료
			var regi_amt = Number(regiAmt);  							// 렌탈 등록비
			var chg_regi_amt = $(':radio[name="fee"]:checked').next().text();
			var periodCd = sfrm.periodCd.value;							// 선택 기간(개월)
			// 계산된 총 렌탈료

			var sum_mom_amt = getRentAmt(mom_amt, regi_amt, chg_regi_amt, dc_amt, periodCd);

			monthRentalAmt ="￦"+monthRentalAmt; 	// 월렌탈료
			addRentAmt = "￦"+addRentAmt;    	// 추가렌탈료
			saleAmt = "￦"+saleAmt;			 	// 할인금액
			totalRentAmt = "￦"+totalRentAmt;		//총 납입금액

	        $('#monthFreeRentalAmt').text(NumUtil.setComma(monthRentalAmt));
	        $('#plusFreeRentalAmt').text(NumUtil.setComma(addRentAmt));
	        $('#saleFreeRentalAmt').text(NumUtil.setComma(saleAmt));
	        $('#totalFreeRentalAmt').text(NumUtil.setComma(totalRentAmt));
		}
	}

	//$(".rental-option-detail").hide();
	if(ValidUtil.isEmpty(officerCd)) {
		//일반
		$("#tab_"+now_rent_type).show();
	} else {
		//임직원
		$(".rental-option-detail-wrap .rental-option-detail").hide(); // 240227 백인천 - 왜 있는거 그냥 다뿌려줘놓고 1번만 show.. 하위옵션 전부 숨긴 후 첫번째 옵션리스트만 show.
		$("#tab_rentaltype0").show();//렌탈상품 dropList
	}

	/* 로그인 팝업 활성화 */
	if(userYn == ''){
		$('#loginPopup').css("display","");
	}
	$('#createRentalList').append(rentalHtml);


	var renGbnId = "";

	if(officerCd != "" && $('#nomalRentalId').val() == 'rentaltype00'){
		renGbnId = 'rentaltype0';
	}else{
		renGbnId = $('#nomalRentalId').val();
	}

	if(renGbnId != ""){
		$('#'+renGbnId).parents(".rentalTypeWrap").show();
		var tab_id = $('#'+renGbnId).parents(".rentalTypeWrap").attr('id')
		$('#rentalStyleTabsWrap li[rel="'+tab_id+'"]').addClass('active');
		$('#'+renGbnId).prop("checked", true);
		if(renGbnId != 'rentaltype00'){
			fn_nomalRentalAmt();
		}
	}

}


// 렌탈료 계산
var getRentAmt = function(mom_amt, regi_amt, chg_regi_amt, dc_amt, periodCd){

	if(regi_amt != chg_regi_amt){
		regi_amt =  eval(regi_amt - chg_regi_amt);
		totRentAmt = mathFloor(eval(mom_amt*periodCd + regi_amt));
		sum_mom_amt = mathFloor(eval(totRentAmt/periodCd - dc_amt));
	}else{
		sum_mom_amt = mathFloor(eval(mom_amt - dc_amt));
	}

	return sum_mom_amt;
};

// 10의자리 버림
var mathFloor = function(num){
	num = Math.floor(eval(num)/10)*10;
	return num;
}

function fn_topRadioBtnControll(id){
	var feeId = $(':radio[name="fee"]:checked').attr('id');
	var frm = document.selfRental;
	var frm2 = document.carInfoFrm;

	$('#nomalRentalId').val(id);
	if(id == 'rentaltype00'){//자유렌탈이면.
		fnSelectRntalRegAmtList();
		if(officerCd == "" || officerCd == null ){
	 	 	//임직원 제외 서비스
			setSelCodeNew();
		}
	}else{
		var html = "";
		//일단 삭제
		$('#feeRen').children().remove();

		//등록비 추가
		$("#feeRen").html(html);

		if(feeId != "fee01" && feeId != "fee02" &&  feeId != "fee04" ){
			$('#fee01').prop("checked", true);
		}else{
			$('#'+feeId).prop("checked", true);
		}
		fn_btnEventInit();
		frm.periodCd.value = $(':radio[name="term"]:checked').val();
		frm.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');

		frm2.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');
		frm2.periodCd.value = $(':radio[name="term"]:checked').val();
		document.carInfoFrm.recomPeriodCd.value = $(':radio[name="term"]:checked').val();
		changBtnReSearchRentalAtm();
	}
}


function fn_btnEventInit(){
	var frm = document.selfRental;
	var frm2 = document.carInfoFrm;

	/* 이벤트 초기화 */
	$(document).off("click","input[name='fee'] , input[name='term'] , input[name='quantity']");

	/* 이벤트 시작 */
	$(document).on("click","input[name='fee'] , input[name='term'] , input[name='quantity']" , function(){

		if( $('select[name="rentaltype"]').val() != 'rentaltype00'){
			// 추천렌탈 등록비 추가 20191207
			fn_nomalRentalAmt();
		}

		frm.periodCd.value = $(':radio[name="term"]:checked').val();
		frm.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');
		frm2.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');
		frm2.periodCd.value = $(':radio[name="term"]:checked').val();
		document.carInfoFrm.recomPeriodCd.value = $(':radio[name="term"]:checked').val();
		changBtnReSearchRentalAtm();
	});
}


/* 렌탈수량 렌탈기간 렌탈등록비가 움직일때마다 계산을 다시 해준다. */
function changBtnReSearchRentalAtm(){
	var id = $('select[name="rentaltype"] option:checked').val();
	if(id == 'rentaltype00'){
		//3.자유렌탈 서비스 리스트
		freeRentalServiceList();
		setSelCodeNew();
	}else{
		if(officerCd == "" || officerCd == null ){
			//3.자유렌탈 서비스 리스트
			freeRentalServiceList();
		}
		//4.일반렌탈 리스트 생성
	 	calculateFee();
	}
}

function fn_o2oOrderGo(){
	$('#o2ojangchackGuide').removeClass("md-show");

	var custDivCd = "<%=session.getAttribute("custDivCd") %>";
	var comDivCd = "<%=session.getAttribute("comDivCd") %>";
	var userLoginId = "<%=session.getAttribute("userLoginId") %>";

		if(custDivCd == "null"){
			custDivCd = fncust;
		}
		if(comDivCd == "null"){
		    comDivCd = fncom;
		}
		if(userLoginId == "null"){
			userLoginId = fnid;
		}

		orgPay = {};
		orgPay.bassSaleFee = $("#bassSaleFee").val();
		orgPay.saleFee = $("#saleFee").val();
		orgPay.stmemSaleAmt = $("#stmemSaleAmt").val();

		fn_o2oItemOder(custDivCd, comDivCd, userLoginId);

	}

	function fn_o2oItemOder(cust,com,id){


		/* 전역변수에다 넣어주기 */
		fncust = cust;
		fncom = com;
		fnid = id;
		$("#modal-nonCustContinue").removeClass("md-show");
		fun_calculateO2oSetAjax();

	}

	/* [20220824_1] kstka 주문사전가능여부 확인 */
	/* 렌탈 주문 사전 검증  */
	fn_beforeOrderConfirm = function(cust, com, id, cd, cnt) {

		var modelCd = $('#modelCd').val();
		var carNo = $('#carNo').val();

		if (systemGbn == 'R' || systemGbn == 'C') {
			if (ValidUtil.isEmpty(modelCd)) {
				$("#carInfoSearch").addClass("md-show");
				return;
			}
		}

		// 로그인이 되어 있을 시에는 신용평가 후 주문하기 페이지로 이동
		// 미로그인 시에는 주문하기 진입  로그인 페이지로 이동
		if ((id == null || id == '' || id == 'null')
				&& (fnid == null || fnid == '')) {
			ComUtil.confirm("로그인 후 이용 가능합니다.</br>로그인 하시겠습니까?", "", function() {
				$('#loginPopGbn').val('retalOrder');
				fn_LoginPop();
				return;
			});
		}

		/* 전역변수에다 넣어주기 */
		fncust = cust;
		fncom = com;
		fnid = id;

		//임직원코드 획특
		officerCd = $.trim(cd);
		if(officerCd != null && officerCd != ""){
			//임직원코드가 있는데 선택된 상품이 임직원 상품이 아닐때
			var prdtGrpDtl = $('select[name="rentaltype"] option:selected').attr('prdtGrpDtl');
			if(cnt > 0){//주문가능횟수가 0보다 크면
				if(prdtGrpDtl != "02"){
					ComUtil.confirm("임직원상품 대상이십니다. 임직원상품 주문으로 진행하시겠습니까?", "", function() {
						evManager.init();

						openOrderBox('R');
						return;
					});
				}
			}
		}

		if($('#bizAppYn').val() == "N") {
			ComUtil.alert("사업자 고객의 경우 렌탈 계약을 위한 </br>승인이 필요합니다.</br>고객센터 ☎1855-0100 으로 </br>전화 주시기 바랍니다.</br>감사합니다.");
			return;
		} else if($('#safekey').val() == "" || $('#safekey').val() == 'null') {
			ComUtil.alert("(인증번호)를 발급 받으셔야 주문이 가능합니다.</br>마이넥센메뉴에서 인증번호를 발급 받으세요.");
			return;
		}

		var rentMonthAmt = $('#monthFreeRentalAmt').text().replace('\\', '').replace(',', '').replace(' ', '');
		if(rentMonthAmt == 0 ){
			ComUtil.alert("렌탈료가 책정되지 않은 상품입니다  고객센터에 문의 바랍니다");
		}else{
			$('#orderGbn').val('R');

			setOrderData();

			var pUrl = "/order/beforeOrderConfirm";
			var pSendData = {};
			evManager.commonAjax(pUrl, pSendData, callBackManager.beforeOrderConfirm);
		}
	}

	/* [20220824_1] kstka 주문사전가능여부 확인 */
	/* 사전검증 후 렌탈주문 */
	fn_tireItemOrder_after = function() {

		ComUtil.confirm("주문을 진행하시겠습니까?", "", function() {

			var frm = document.carInfoFrm;
			frm.periodCd.value = $(':radio[name="term"]:checked').val();
			frm.cntCdNm.value = $(':radio[name="quantity"]:checked').next().text();
			frm.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');
			frm.patternCd.value = $("#rentPatternCd").val();

			frm.action = "/order/orderRentalTMS2";
			frm.submit();
		});

	}

	/* 렌탈주문 */
	function fn_tireItemOrder(cust,com,id){
		var modelNm = $('#modelCd').val();
		var carNo = $('#carNo').val();

		if(systemGbn == 'R' || systemGbn == 'C'){
			if (ValidUtil.isEmpty(modelCd)) {
				$("#carInfoSearch").addClass("md-show");
				return;
			}
		}

		// 로그인이 되어 있을 시에는 신용평가 후 주문하기 페이지로 이동
		// 미로그인 시에는 주문하기 진입  로그인 페이지로 이동
		if((id == null || id == '' || id == 'null') && (fnid == null || fnid == '')){
			if(!confirm("로그인 후 이용 가능합니다.\n\n로그인 하시겠습니까?")) {
				return;
			}else{
				$('#loginPopGbn').val('retalOrder');
				fn_LoginPop();
				return;
			}
		}

		if($('#bizAppYn').val() == "N") {
			ComUtil.alert("사업자 고객의 경우 렌탈 계약을 위한 </br>승인이 필요합니다.</br>고객센터 ☎1855-0100 으로 </br>전화 주시기 바랍니다.</br>감사합니다.");
			return;
		} else if($('#safekey').val() == "" || $('#safekey').val() == 'null') {
			ComUtil.alert("(인증번호)를 발급 받으셔야 주문이 가능합니다.</br>마이넥센메뉴에서 인증번호를 발급 받으세요.");
			return;
		}

		/* 전역변수에다 넣어주기 */
		fncust = cust;
		fncom = com;
		fnid = id;

		var rentMonthAmt = $('#monthFreeRentalAmt').text().replace('￦', '').replace(',', '').replace(' ', '');
		if(rentMonthAmt == 0 ){
			alert("렌탈료가 책정되지 않은 상품입니다  고객센터에 문의 바랍니다");
		}else {
			if(confirm("주문을 진행하시겠습니까?")){
				$('#orderGbn').val('R');
				// 파리미터 값 설정
				setOrderData();
				if(cust == "1"){//개인고객
					indi_credit();
				}else if(cust == "2"){//사업자 고객
					if(com == "1"){//개인 사업자
						license_credit();
					}else{//법인사업자
						//indiLic_credit();
						license_credit();
					}
				}else{//그외

				}
			}
		}
	}

	//개인 고객 신용정보 조회
	function indi_credit(){
		var pUrl = "/order/certifyPerson";
		var pSendData = {};
		evManager.commonAjax(pUrl, pSendData, callBackManager.indi_credit);
	}

	//개인고객 신용정보 조회 성공시 신용조회결과 콜백 함수
	function fn_indi_credit_result(data){
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
			var frm = document.carInfoFrm;
			frm.periodCd.value = $(':radio[name="term"]:checked').val();
			frm.cntCdNm.value = $(':radio[name="quantity"]:checked').next().text();
			frm.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');
			frm.patternCd.value = $("#rentPatternCd").val();

			//yjw serverMode 제거(20220225)
			frm.action = "/order/orderRentalTMS2";
			frm.submit();
		}
	}

	//법인사업자 고객 신용정보조회
	function license_credit(){
		var pUrl = "/order/certifyCompany";
		var pSendData = {};
		evManager.commonAjax(pUrl, pSendData, callBackManager.license_credit);
	}

	//법인사업자신용조회처리결과
	function fn_license_credit_rslt(data){
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
			//개인사업자
			if(fncust == "2" && fncom == "1") {
				license_credit22();
			} else {
				var frm = document.carInfoFrm;
				frm.periodCd.value = $(':radio[name="term"]:checked').val();
				frm.cntCdNm.value = $(':radio[name="quantity"]:checked').next().text();
				frm.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');

				//yjw serverMode 제거(20220225)
				frm.action = "/order/orderRentalTMS2";
				frm.submit();
			}
		}
	}

	//사업주신용조회처리 (개인이나 사업주나 신용정보는 다 똑같아서 개인신용정보 조회 콜백 불러줌)
	function license_credit22(){
		var pUrl = "/order/certifyPerson";
		var pSendData = {};
		evManager.commonAjax(pUrl, pSendData, callBackManager.indi_credit);
	}


	//개인 사업자 고객 신용정보 조회
	function indiLic_credit(){
		var pUrl = "/order/certifyPerson";
		var pSendData = {};
		evManager.commonAjax(pUrl, pSendData, callBackManager.indiLic_credit);
	}

	function fn_indiLic_credit_result(){
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
			var frm = document.carInfoFrm;
			frm.periodCd.value = $(':radio[name="term"]:checked').val();
			frm.cntCdNm.value = $(':radio[name="quantity"]:checked').next().text();
			frm.regiAmt.value = $(':radio[name="fee"]:checked').next().text().replace(',','');

			//yjw serverMode 제거(20220225)
			frm.action = "/order/orderRentalTMS2";
			frm.submit();
		}
	}

	//쿠폰 정책 패턴 존재 유무 조회
	function fn_cpnPlcPtrnYnChk(itemCd, itemGrpCd, itemTyCd, itemTyDtlCd){
		var pUrl = "/product/selectCpnPlcPtrnYnChk";
		var pSendData = {
		    itemCd 		: itemCd,
			itemGrpCd 	: itemGrpCd,
			itemTyCd 	: itemTyCd,
			itemTyDtlCd :itemTyDtlCd
		};

		/* 전역변수에 넣기 */
		gbItemCd = itemCd;
		gbItemGrpCd = itemGrpCd;
		gbItemTyCd = itemTyCd;
		gbItemTyDtlCd = itemTyDtlCd;
		evManager.commonAjax(pUrl, pSendData, callBackManager.cpnPlcList);
	}

	//쿠폰 다운로드
	function fn_o2oDownCoupon(cust, com, id) {

		/* 전역변수에다 넣어주기 */
		fncust = cust;
		fncom = com;
		fnid = id;

		if ((id == null || id == "" || id == null)
				&& (fnid == null || fnid == "")) {
			ComUtil.confirm("로그인 후 이용 가능합니다.</br>로그인 하시겠습니까?", "", function() {
				$('#loginPopGbn').val('downCoupon');
				fn_LoginPop();
				return;
			});
		}

		if(fnid != ""){
			ComUtil.confirm("쿠폰 다운로드 받으시겠습니까?", "", function() {
				var itemCd = gbItemCd;
				var itemGrpCd = gbItemGrpCd;
				var itemTyCd = gbItemTyCd;
				var itemTyDtlCd = gbItemTyDtlCd;
				var pUrl = "/product/saveFoCpnMst";
				var pSendData = {
					itemCd 		: itemCd,
					itemGrpCd 	: itemGrpCd,
					itemTyCd 	: itemTyCd,
					itemTyDtlCd : itemTyDtlCd
				};
				pSendData = JSON.stringify(pSendData);

				$.ajax({
					url : pUrl,
					type : "POST",
					cache : false,
					data : pSendData,
					contentType : "application/json;charset=UTF-8", // ajax 통신으로 보내는 타입
					success : function(data) {
						if (data.rtnCode == "0") {	//쿠폰 생성 성공 시
							ComUtil.alert("쿠폰을 발급 받았습니다.");

							/*
							ComUtil.confirm("쿠폰을 발급 받았습니다. </br> 바로 확인 하시겠습니까?", "", function() {
								window.location.href = "/mypage/couponList";
							});
							*/

						}else if(data.rtnCode == "2") {	//쿠폰 이미 다 발급 시
							ComUtil.alert("이미 쿠폰을 발급 받았습니다.");
						}
					},
					error : function(request, status, error) {
						console.log('error callback : ' + error);
					}
				});
			});
		}
	}

	//파라메터 넣어주기
	function setOrderData(){
		//렌탈주문 & 자유렌탈인 경우
		if($('.orderWrap_new.rental .tabs .active').attr('id') == 'rental') {
			if($('select[name="rentaltype"] option:checked').val() == 'rentaltype00') {
				setSelCodeNew();
			}
		}

		var sfrm = document.selfRental;
		var frm = document.carInfoFrm;
		var rentalName = ""; //렌탈명이 무엇인지
		var salecd = "";	 //판매코드가 무엇인지
		var retalGbnId = ""; //무슨렌탈인지

		rentalName = $('select[name="rentaltype"] option:checked').next().text();
		salecd = $('select[name="rentaltype"] option:checked').attr('salecd');
		retalGbnId = $('select[name="rentaltype"] option:checked').val();

		$('#saleNm').val(rentalName); //판매상품명
		$('#saleCd').val(salecd);	  //판매상품코드

		/* 체크되어있는 렌탈의 가격을 불러온다 */

		var MonthRentalAmt = 0;	  // 원렌탈료
		var addRentAmt     = 0;	  // 추가렌탈료
		var discountAmt    = 0;	  // 할인금액
		var totalPayYn	   = 0;   // 총 납입금액

		if(retalGbnId == 'rentaltype00'){

			MonthRentalAmt 	= $('#monthFreeRentalAmt').text();
			MonthRentalAmt 	= MonthRentalAmt.replace('￦', '').replace(',', '').replace(' ', '');

			addRentAmt 		= $('#plusFreeRentalAmt').text();
			addRentAmt 		= addRentAmt.replace('￦', '').replace(',', '').replace(' ', '');

			discountAmt 	= $('#plusFreeRentalAmt').text();
			discountAmt 	= discountAmt.replace('￦', '').replace(',', '').replace(' ', '').replace('-', '');

			totalPayYn 		= $('#totalFreeRentalAmt').text();
			totalPayYn 		= totalPayYn.replace('￦', '').replace(',', '').replace(' ', '');

			/* 자유렌탈 렌탈서비스 넣어주기  영역 */
			frm.selEnginCd.value 	= sfrm.selEnginCd.value;
			frm.selLocCd.value 		= sfrm.selLocCd.value;
			frm.selVisCd.value 		= sfrm.selVisCd.value;
			frm.selSaveCd.value 	= sfrm.selSaveCd.value;
			frm.selTcCd.value 		= sfrm.selTcCd.value;
			frm.selPrCd.value 		= sfrm.selPrCd.value;
			frm.selArCd.value 		= sfrm.selArCd.value;
			frm.selCheckCd.value = sfrm.selCheckCd.value;
			frm.selEnginCdAmt.value = sfrm.selEnginCdAmt.value;
			frm.selLocCdAmt.value 	= sfrm.selLocCdAmt.value;
			frm.selVisCdAmt.value 	= sfrm.selVisCdAmt.value;
			frm.selSaveCdAmt.value 	= sfrm.selSaveCdAmt.value;
			frm.selTcCdAmt.value 	= sfrm.selTcCdAmt.value;
			frm.selPrCdAmt.value 	= sfrm.selPrCdAmt.value;
			frm.selArAmt.value 		= sfrm.selArAmt.value;
			frm.selCheckCdAmt.value = sfrm.selCheckCdAmt.value;
			frm.regiAmt.value 		= sfrm.regiAmt.value.replace(',','');
			frm.periodCd.value 		= sfrm.periodCd.value;

		}else{
			var num = retalGbnId.replace('rentaltype', '');

			MonthRentalAmt 	= $('#MonthRentalAmt'+num).text();
			MonthRentalAmt 	= MonthRentalAmt.replace('￦', '').replace(',', '').replace(' ', '');
			addRentAmt 		= $('#addRentAmt'+num).text();
			addRentAmt 		= addRentAmt.replace('￦', '').replace(',', '').replace(' ', '');
			discountAmt 	= $('#discountAmt'+num).text();
			discountAmt 	= discountAmt.replace('￦', '').replace(',', '').replace(' ', '').replace('-', '');
			totalPayYn 		= $('#totalPayYn'+num).text();
			totalPayYn 		= totalPayYn.replace('￦', '').replace(',', '').replace(' ', '');

			if($("#tab_"+retalGbnId +" > #freeAlinSelect .num").length > 0) {
				if(Number($("#tab_"+retalGbnId +" > #freeAlinSelect .num").text() > 0)) {
					frm.rentArYn.value = "Y";
				}
			}
		}

		$('#MonthRentalAmt').val(MonthRentalAmt);	// 원렌탈료
		$('#addRentAmt').val(addRentAmt);	  	  	// 추가렌탈료
		$('#discountAmt').val(discountAmt);	  		// 할인금액
		$('#totalPayYn').val(totalPayYn);	      	// 총 납입금액
	}

	function fn_rentalOrderCart(cust,com,id){
		var carNo = $('#carNo').val();
		var modelNm = $('#modelCd').val();
		if (systemGbn == 'R' || systemGbn == 'C') {
			if (ValidUtil.isEmpty(modelCd)) {
				$("#carInfoSearch").addClass("md-show");
				return;
			}
		}

		var retalGbnId = ""; //무슨렌탈인지
			retalGbnId  = $('select[name="rentaltype"] option:checked').attr('value');


		if((id == null || id == '' || id == 'null') && (fnid == null || fnid == '')){
			if(!confirm("로그인 후 이용 가능합니다.\n\n로그인 하시겠습니까?")) {
				return;
			}else{
				$('#loginPopGbn').val('retalCart');
				fn_LoginPop();
				return;
			}
		}

		/* 전역변수에다 넣어주기 */
		fncust = cust;
		fncom = com;
		fnid = id;

		var pSendData = {};
		if(confirm("장바구니에 저장 하시겠습니까?")){
			setOrderData();
			var frm = document.carInfoFrm;
			var regiCd = "ZZZZ"; // 등록비 코드 ZZZZ로 고정
			var dispSize = TireSize;
			if(retalGbnId == "rentaltype00"){ //자유 상품일경우
				//자유 상품 파라미터

				pSendData = {
						//petternCd     : $("#patternCd").val(),
						petternCd     : $("#rentPatternCd").val(),
						matCd         : $("#matCd").val(),
						makerCd       : $("#makerCd").val(),
						modelCd       : $("#modelCd").val(),
						contentsCd    : $("#contentsCd").val(),
						frCd          : $("#frCd").val(),
						dispSize      : dispSize,
						sectionWidth  : $("#searchSw").val(),
						aspectRatio   : $("#searchAr").val(),
						wheelInches   : $("#searchWi").val() + ' '+ $("#plyRating").val() + 'P',
						plyRating     : $("#plyRating").val(),
						carNumber     : $("#carNo").val(),
						cntCd         : $(':radio[name="quantity"]:checked').val(),
						prdtGrp       : $('select[name="rentaltype"] option:checked').attr('prdtGrp'),
						prdtGrpDtl    : $('select[name="rentaltype"] option:checked').attr('prdtGrpDtl'),
						saleCd        : $('select[name="rentaltype"] option:checked').attr('saleCd'),
						saleNm        : $('select[name="rentaltype"] option:checked').text(),
						periodCd      : $(':radio[name="term"]:checked').val(),
						selEnginCd    : $("#selEnginCd").val(),
						selLocCd      : $("#selLocCd").val(),
						selVisCd      : $("#selVisCd").val(),
						selSaveCd     : $("#selSaveCd").val(),
						selTcCd       : $("#selTcCd").val(),
						selPrCd       : $("#selPrCd").val(),
						selArCd       : $("#selArCd").val(),
						selCheckCd    : $("#selCheckCd").val(),
						selEnginCdAmt : $("#selEnginCdAmt").val(),
						selLocCdAmt   : $("#selLocCdAmt").val(),
						selVisCdAmt   : $("#selVisCdAmt").val(),
						selSaveCdAmt  : $("#selSaveCdAmt").val(),
						selTcCdAmt    : $("#selTcCdAmt").val(),
						selPrCdAmt    : $("#selPrCdAmt").val(),
						selArAmt      : $("#selArAmt").val(),
						selCheckCdAmt : $("#selCheckCdAmt").val(),
						regiAmt       : $("#regiAmt").val().replace(',',''),
						regiCd        : regiCd
					};

			}else{ //추천, 일시불 상품 파라미터

				pSendData = {
						//petternCd    : $("#patternCd").val(),
						petternCd    : $("#rentPatternCd").val(),
						matCd        : $("#matCd").val(),
						makerCd      : $("#makerCd").val(),
						modelCd      : $("#modelCd").val(),
						contentsCd   : $("#contentsCd").val(),
						frCd         : $("#frCd").val(),
						dispSize     : dispSize,
						sectionWidth : $("#searchSw").val(),
						aspectRatio  : $("#searchAr").val(),
						wheelInches  : $("#searchWi").val() + ' '+ $("#plyRating").val() + 'P',
						plyRating    : $("#plyRating").val(),
						carNumber    : $("#carNo").val(),
						cntCd        : $(':radio[name="quantity"]:checked').val(),
						prdtGrp      : $('select[name="rentaltype"] option:checked').attr('prdtGrp'),
						prdtGrpDtl   : $('select[name="rentaltype"] option:checked').attr('prdtGrpDtl'),
						saleCd       : $('select[name="rentaltype"] option:checked').attr('saleCd'),
						saleNm       : $('select[name="rentaltype"] option:checked').attr('title'),
						periodCd     : $(':radio[name="term"]:checked').val(),
						regiCd       : regiCd
					};
			}

			var pUrl = "/product/insertRentalCart";
			evManager.commonAjax(pUrl, pSendData, callBackManager.insertRentalCart);
		}
	}

	//구매 장바구니 등록
	function fn_O2oOrderCart(cust,com,id){

		if((id == null || id == '' || id == 'null') && (fnid == null || fnid == '')){
			if(!confirm("로그인 후 이용 가능합니다.\n\n로그인 하시겠습니까?")) {
				return;
			}else{
				$('#loginPopGbn').val('o2oCart');
				fn_LoginPop();
				return;
			}
		}

		/* 전역변수에다 넣어주기 */
		fncust = cust;
		fncom = com;
		fnid = id;

		if(confirm("장바구니에 저장 하시겠습니까?")){

			var pUrl = "/cart/selectCartCheck";
			var pSendData = { itemCd : $("#itemCd").val() };
				pSendData = JSON.stringify(pSendData);

			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: pSendData,
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data.cnt > 0){
			    		if(confirm("이미 장바구니에 등록되어 있습니다.\n\n 장바구니로 이동하시겠습니까?")){
			    			window.location.href="/cart/cartView";
			    		}else{
			    			return;
			    		}
			    	}else{
			    		comfirmO2oCartInsert();
			    	}
			    },
			    error: function (request, status, error) {
					console.log('error callback : ' + error);
				}
			});

		}
	}

	//장바구니 중복 확인 후에.
	function comfirmO2oCartInsert(){

		setOrderData();
		var frm = document.carInfoFrm;

		    var pSendData = {
				    itemCd       : $("#itemCd").val()          ,
					patnNm       : $("#patternCd").val()       ,
					dpPrNo       : $("#dpPrNo").val()          ,
					makerCd      : $("#makerCd").val()         ,
					makerNm      : $("#makerNm").val()         ,
					modelCd      : $("#modelCd").val()         ,
					modelNm      : $("#modelNm").val()         ,
					contentsCd   : $("#contentsCd").val()      ,
					contentsNm   : $("#contentsNm").val()      ,
					classCd      : ValidUtil.isEmpty($("#classCdNew").val()) ? $("#classCd").val() : $("#classCdNew").val()	,
					frCd         : $("#frCd").val()            ,
					tireSize     : $("#TireSize").val()        ,
					sectionWidth : $("#searchSw").val()        ,
					aspectRatio  : $("#searchAr").val()        ,
					wheelInches  : $("#searchWi").val()        ,
					plyRating    : $("#plyRating").val()       ,
					cntCd        : $(':radio[name="o2oQtyRadio"]:checked').val(),
					carNumber    : $("#carNo").val()           ,
					orderOriAmt  : $("#orderO2oOriAmt").val()  ,
					orderSaleAmt : $("#orderO2oSaleAmt").val() ,
					orderPayAmt  : (Number($("#orderO2oPayAmt").val()) - Number($("#optTotAmt").val())).toString()  ,
					bassSaleAmt  : $("#bassSaleFee").val()     ,
					saleAmt      : $("#saleFee").val()         ,
					bassStmemAmt : $("#stmemSaleAmt").val()    ,
					thumimg      : $("#o2oThumImg").val()      ,
					seasonCd     : $("#seasonCd").val()        ,
					seasonCdNm   : $("#seasonCdNm").val()      ,
					itemNm       : $("#itemNm").val()          ,
					pointAccurt  : $("#pointAccurt").val()     ,
					saleTyCd     : $("#saleTyCd").val()        ,
					prcPlcNo     : $("#prcPlcNo").val()        ,
					 //상품옵션 추가 Param
					optTotAmt    : $("#optTotAmt").val()       ,
					optAmt       : $("#optAmt").val()          ,
					optCo        : $("#optCo").val()           ,
					optPlcNm     : $("#optPlcNm").val()        ,
					optPlcNo     : $("#optPlcNo").val()
			   };

		var pUrl = "/product/insertO2oCart";
		evManager.commonAjax(pUrl, pSendData, callBackManager.insertOrderCart);
	}


	/* 해당 상품 유효성 검사 (총 렌탈료 - 할인 금액 = 음수/양수 판단 ) */
	function checkGoodValidation(totalRentAmt){
		if(Number(totalRentAmt) < 0){
			alert("주문할수없는 상품 입니다.");
			return false;
		}
		return true;
	}

	function fn_retalInsertAndGoPage(data){
		if(confirm("상품이 장바구니에 담겼습니다. \n 바로 확인 하시겠습니까?")){
			window.location.href="/cart/cartView?tab=R";
		}
	}

	function fn_O2oInsertAndGoPage(data){
		if(confirm("상품이 장바구니에 담겼습니다. \n 바로 확인 하시겠습니까?")){
			window.location.href="/cart/cartView";
		}
	}

	function selectGetItemCd(){
		var dpPrno = $('#dpPrNo').val();
		if(dpPrno != '' && dpPrno != null){
			$.ajax({
			    url: "/product/selectGetItemCd",
			    type: "POST",
			    cache:false,
			    processData: false,
			    data: $("#carInfoFrm").serialize(),
			    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data.resulet.itemCd != null) {
			    		$('#itemCd').val(data.resulet.itemCd);
			    		$('#itemNm').val(data.resulet.itemNm);
			    		$('#pointAccurt').val(data.resulet.pointAccurt);
			    		$('#saleTyCd').val(data.resulet.saleTyCd);
			    		$('#prcPlcNo').val(data.resulet.prcPlcNo);
			    		fun_calculateO2oSetAjax();

			    		/** 민근 추가 내용 **/
						var itemCd = data.resulet.itemCd;
						var itemGrpCd = data.resulet.itemGrpCd;
						var itemTyCd = data.resulet.itemTyCd;
						var itemTyDtlCd = data.resulet.itemTyDtlCd;
						fn_cpnPlcPtrnYnChk(itemCd, itemGrpCd, itemTyCd, itemTyDtlCd);
			    	}
			    },
			    error: function (request, status, error) {
			    	console.log(error);
					var errCode = dpPrno+"/"+$("#searchSw").val()+"/"+$("#searchAr").val()+"/"+$("#searchWi").val();
					ComUtil.alert(errCode+"\n해당 사이즈 조회 중 에러가 발생 하였습니다.\n표시한 내용과 함께 고객센터로 문의 바랍니다.","","",function(){
						location.href = "/main";
					});
					return;
				}
			});
		}
	}

	function fun_calculateO2oSetAjax(){

		var pUrl = "/product/selectO2oOrderAmt";
		var pSendData = {dpPrNo 		: $("#dpPrNo").val()
				       , itemCd 		: $("#itemCd").val()
	       			};
			pSendData = JSON.stringify(pSendData);

		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    async : false,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	if(data.result.length > 0){
			    	$("#bassSaleFee").val(data.result[0].bassSaleFee);  	//기본판매가
			    	$("#saleFee").val(data.result[0].saleFee);				//판매가
			    	$("#stmemSaleAmt").val(data.result[0].stmemSaleAmt);	//임직원가
			    	$("#grpPay").val(data.result[0].grpPay); //그룹가격적용여부

			    	/** 믿음 추가 내용 **/
					$('.org_price').text('￦' + data.result[0].bassSaleFee);//기표가
					$('.ext_price').text('￦' + data.result[0].saleFee);//기표가
					/** 믿음 추가 내용 **/
				}else{
					if(data.grpYn == "Y"){
						ComUtil.alert("회원님은 제휴코드인증회원입니다. \n 상품을 재검색하여 주시길 바랍니다.","","",function(){
							location.href = "/main";
						});
						return;
					}
				}

		    	//가격 다시 계산
		    	calculateO2oSet();

		    	fn_checkGrp();
		    },
		    error: function (e) {
				console.log(e);
			}
		});
	}

	var params = [];
	function fn_checkGrp(){

		//로그인시 가격계산 다시한다(그룹가격확인)
		if(typeof orgPay.bassSaleFee != 'undefined'){
			if(orgPay.bassSaleFee != $("#bassSaleFee").val()
					|| orgPay.saleFee != $("#saleFee").val()
					|| orgPay.stmemSaleAmt != $("#stmemSaleAmt").val()){

				if(typeof $("#grpPay").val() == "undefined" || $("#grpPay").val() == "Y" || $("#grpPay").val() == ""){
					ComUtil.alert("회원님은 제휴코드인증회원입니다. \n 상품을 재검색하여 주시길 바랍니다.","","",function(){
						location.href = "/main";
					});
					return;
				}
			}else{
				$('#orderGbn').val('O');
				var frm           = document.carInfoFrm;
				var cntCdNm       = $(':radio[name="o2oQtyRadio"]:checked').next().text();
				var addItemCd     = $("#addItemCd").val();
				var addDpPrNo     = $("#addDpPrNo").val();
				var addMatcd      = $("#addMatcd").val();
				var addTireYn     = ValidUtil.isEmpty($("#addTireYn").val()) ? "N" : $("#addTireYn").val();
				var addTireInfoYn = (ValidUtil.isEmpty($("#addTireInfo").val() )) ? "N" : "Y";


				//전후륜이 동일 , 추가 타이어 선택 완료 일경우
				var tireNm      = ($("#tireFrCd").val() == "F") ? "후륜" : "전륜"
				var addTireFrCd = ($("#tireFrCd").val() == "F") ? "R" : "F";

				var orderPurchYn = $("#tireSizeYn").val() == "Y"
				                  || ( addTireYn == "Y" && addTireInfoYn == "Y")
				                  || ValidUtil.isEmpty(addDpPrNo) ;

				if(orderPurchYn ){
					//frm.cntCdNm.value = cntCdNm;
					$("#cntCdNm").val(cntCdNm);
					//yjw serverMode 제거(20220225)
					frm.action = "/order/orderPurchaseTMS2";
					frm.submit();
				}else{
					var confirmMsg = tireNm + " 타이어가 존재 합니다.</br> 추가 구매  하시겠습니까?";
					var cntCd = $(':radio[name="o2oQtyRadio"]:checked').val();
					var cngYn = ( cntCd > "02") ? true : false;
					if( cngYn ){
						confirmMsg = tireNm + " 타이어가 존재 합니다. </br> 위치별 타이어 수량은 2본까지 구매 가능합니다. </br> 추가 구매  하시겠습니까?";
					}
					ComUtil.confirm( confirmMsg, ""
						, function() {
							if(cngYn){
								$(':radio[id="radio02"]').prop("checked",true);
								cntCdNm = $(':radio[name="o2oQtyRadio"]:checked').next().text();
								$("#cntCdNm"       ).val(cntCdNm);
								calculateO2oSet();
							}

							// 구매 결정된 타이어 파라미터 (주문서로 이동할 내역)
							var params = {
									"dpPrNo"         : $("#dpPrNo").val()
								   ,"itemCd"         : $("#itemCd").val()
								   ,"itemNm"         : $("#itemNm").val()
								   ,"frCd"           : $("#frCd").val()
								   ,"pageGbn"        : $("#pageGbn").val()
								   ,"sectionWidth"   : $("#searchSw").val()
								   ,"aspectRatio"    : $("#searchAr").val()
								   ,"wheelInches"    : $("#searchWi").val()
								   ,"plyRating"      : $("#plyRating").val()
								   ,"classCd"        : ValidUtil.isEmpty($("#classCdNew").val()) ? $("#classCd").val() : $("#classCdNew").val()
								   ,"thumimg"        : $("#o2oThumImg").val()
								   ,"o2oThumImg"     : $("#o2oThumImg").val()
								   ,"saleTyCd"       : $("#saleTyCd").val()
								   ,"classCdNm"      : $("#classCdNm").val()
								   ,"contentsCd"     : $("#contentsCd").val()
								   ,"contentsNm"     : $("#contentsNm").val()
								   ,"makerCd"        : $("#makerCd").val()
								   ,"makerNm"        : $("#makerNm").val()
								   ,"modelCd"        : $("#modelCd").val()
								   ,"modelNm"        : $("#modelNm").val()
								   ,"seasonCd"       : $("#seasonCd").val()
								   ,"bassSaleFee"    : $("#bassSaleFee").val()
								   ,"officerCdYn"    : $("#officerCdYn").val()
								   ,"stmemSaleAmt"   : $("#stmemSaleAmt").val()
								   ,"saleFee"        : $("#saleFee").val()
								   ,"orderO2oCnt"    : $("#orderO2oCnt").val()
								   ,"orderO2oOriAmt" : $("#orderO2oOriAmt").val()
								   ,"orderO2oPayAmt" : $("#orderO2oPayAmt").val()
								   ,"tireSize"       : $("#TireSize").val()
								   ,"pointAccurt"    : $("#pointAccurt").val()
								   ,"prcPlcNo"       : $("#prcPlcNo").val()
								   ,"orderPayAmt"    : (Number($("#orderO2oPayAmt").val()) - Number($("#optTotAmt").val())).toString()
								   ,"pakAmt"         : $("#pakAmt").val()
								   ,"optAmt"         : $("#optAmt").val()
								   ,"optCo"          : $("#optCo").val()
								   ,"optPlcNm"       : $("#optPlcNm").val()
								   ,"optPlcNo"       : $("#optPlcNo").val()
								   ,"optBfComment"   : $("#optBfComment").val()
								   ,"optAfComment"   : $("#optAfComment").val()
								   ,"cntCdNm"        : $("#cntCdNm").val()
								   ,"patternCd"      : $("#patternCd").val().replace("'",'')
								   ,"tireSizeYn"     : $("#tireSizeYn").val()
								   ,"stmemSaleAmt"   : $("#stmemSaleAmt").val()
							}
							$("#addTireInfo").val(JSON.stringify(params));

							$("#dpPrNo"        ).val($("#addDpPrNo").val());
							$("#itemCd"        ).val($("#addItemCd").val());
							$("#matCd"         ).val($("#addMatCd").val());
							$("#frCd"          ).val($("#frCd").val());
							$("#tireFrCd"      ).val(addTireFrCd);
							$("#addTireYn"     ).val("Y");

							frm.action = "/product/prdDetail";
							frm.submit();

						}
						, function() {
							//yjw serverMode 제거(20220225)
							frm.action = "/order/orderPurchaseTMS2";
							frm.submit();
						}
						,"예","아니요"
					);
				}
			}
		}
	}

	/* 렌탈이 있으면 matCd랑 frCd불러오기 */
	function selectGetMatCdFrcd(){
		var pUrl = "/product/selectTireSizeList";
		var niceGradeLeng = 0;//$('#niceGradeCd').val().replace("[]", "").length;
		var pSendData = {};

		if(niceGradeLeng > 0 ){
			pSendData = {modelCd : $("#modelCd").val()
				       , contentsCd : $("#contentsCd").val()
				       , recomYn : ""
				       , classCd : $('#classCdNew').val()
				       //, patternCd : $("#patternCd").val()
				       , patternCd : $("#rentPatternCd").val()
				       , systemGbn: "R"
				       , sectionWidth:$('#searchSw').val()
				       , aspectRatio:$('#searchAr').val()
				       , wheelInches:$('#searchWi').val()
					   , niceGradeCd:eval($('#niceGradeCd').val())
					   };
		}else{
			pSendData = {modelCd : $("#modelCd").val()
				       , contentsCd : $("#contentsCd").val()
				       , recomYn : ""
				       , classCd : $('#classCdNew').val()
				       //, patternCd : $("#patternCd").val()
				       , patternCd : $("#rentPatternCd").val()
				       , systemGbn: "R"
				       , sectionWidth:$('#searchSw').val()
				       , aspectRatio:$('#searchAr').val()
				       , wheelInches:$('#searchWi').val()
					   };
		}

			pSendData = JSON.stringify(pSendData);

		$.ajax({
		    url: pUrl,
		    type: "POST",
		    cache:false,
		    data: pSendData,
		    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		    success: function(data) {
		    	if(data != null && data.length > 0 ) {
			    	$('#matCd').val(data[0].matCd);
			    	$('#frCd').val(data[0].frCd);
			    	$('#plyRating').val(data[0].plyRating);
		    	}
		    },
		    error: function (e) {
				console.log(e);
			}
		});
	}

	function reviewEvent(tis){
		$(tis).toggleClass('open');
		$(tis).find('.review-summary + .review-box').slideToggle();
	}

	function fn_innitRentalSearchPop(){
		/* carInfoSearch */
		var modelNm = $('#modelNm').val();
		var carNo = $('#carNo').val();

		if((modelNm == null || modelNm == '' || typeof modelNm == 'undefined') && (systemGbn == 'R'&& carNo == '')){
			$("#carInfoSearch").addClass("md-show");
		}else if((modelNm == null || modelNm == '' || typeof modelNm == 'undefined') && (systemGbn == 'C' && carNo == '')){
			//$('body').addClass('bgFix');
			//$("#carInfoSearch").addClass("md-show");
		}
	}

	function fn_carInfoSearchClose(){
		//$("#carInfoSearch").removeClass("md-show");
		window.history.back();
	}

	function fn_carInfoSearchPopGo(){
		$("#carInfoSearch").removeClass("md-show");
		//검샘 레이어 팝업 오픈
		//$("#modal-initSearch").addClass("md-show");
		//팝업 선택 값 초기화
		openSizeFinder('car');
	}

	/* 일반렌탈일 경우 등록비 본수에 맞게 고정으로 인해 서버에 한번 갔다온다. */
	function fn_nomalRentalAmt(){

			var pUrl = "/product/selectNomalRentalAmt";
			var frm1 = document.selfRental;
			var frm2 = document.carInfoFrm;
			var pSendData = { saleCd 		: $('select[name="rentaltype"] option:checked').attr('salecd'),
							  prdtGrp 		: $('select[name="rentaltype"] option:checked').attr('prdtgrp'),
							  prdtGrpDtl 	: $('select[name="rentaltype"] option:checked').attr('prdtgrpdtl'),
							  cntCd 		: $(':radio[name="quantity"]:checked').val()
							};

					pSendData = JSON.stringify(pSendData);

			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: pSendData,
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	var html = "";
					var feeRenAmt = data.regAmtList[0].searchCdNm;
					
					$('#feeRen').children().remove();
					if(feeRenAmt == 0){
						html += '<input type="radio" checked="checked" name="fee" id="fee01" value="'+data.regAmtList[0].searchCd+'" class="type06"><label for="fee01"><span>'
						+ NumUtil.setComma(data.regAmtList[0].searchCdNm)
						+ '</span></label><br>( <b>등록비 면제 이벤트 <span style="text-decoration:line-through; text-decoration-color:red; text-decoration-thickness:2px;">50,000원</span></b> )';
					} else {
						html += '<input type="radio" checked="checked" name="fee" id="fee01" value="'+data.regAmtList[0].searchCd+'" class="type06"><label for="fee01"><span>'
						+ NumUtil.setComma(data.regAmtList[0].searchCdNm)
						+ '</span></label>';
					}
					frm1.regiAmt.value = data.regAmtList[0].searchCdNm;
					frm2.regiAmt.value = data.regAmtList[0].searchCdNm;
					//등록비 추가
					$("#feeRen").html(html);
			    },
			    error: function (request, status, error) {
					console.log('error callback : ' + error);
				}
			});
	}

	function fn_CounselRegister(gbn){
		location.href = "/bbs/counselRegister?gbn="+gbn;
	}

	function nonCustValidation() {
		var rtnVal = true;

		return rtnVal;
	}

	function fn_nonCustOrder() {
		if(ValidUtil.isEmpty($("#addTireInfo").val())){
			$("#modal-nonCustContinue").addClass("md-show");
		}else{
			$("#modal-nonCustContinue").removeClass("md-show");
			$('#o2ojangchackGuide').addClass("md-show");
		}
	}

	function nonCustOrderPass() {

		if(nonCustValidation()) {
			var addTireYn     = ValidUtil.isEmpty($("#addTireYn").val()) ? "N" : $("#addTireYn").val();
			var addTireInfoYn = (ValidUtil.isEmpty($("#addTireInfo").val() )) ? "N" : "Y";
			var orderPurchYn = $("#tireSizeYn").val() == "Y"
				                  || ( addTireYn == "Y" && addTireInfoYn == "Y")
				                  || ValidUtil.isEmpty(addDpPrNo);

			$("#modal-nonCustContinue").removeClass("md-show");
			//$('#o2ojangchackGuide').addClass("md-show");
			if(orderPurchYn){
				/* 20230202_장착서비스 팝업 미노출 및 주문페이지로 바로 이동(권형태 선임 요청) */
				//$('#o2ojangchackGuide').addClass("md-show");
				fn_o2oOrderGo();
			}else{
				fn_o2oOrderGo();
			}
		} else {
			ComUtil.alert("약관 동의 및 개인정보 수집 동의에 체크해주세요.");
		}
	}

	function nonCustLogin() {
		orgPay = {};
		orgPay.bassSaleFee = $("#bassSaleFee").val();
		orgPay.saleFee = $("#saleFee").val();
		orgPay.stmemSaleAmt = $("#stmemSaleAmt").val();
		$('#loginPopGbn').val('o2oOrder');
		fn_LoginPop();
	}

	/* 옵션가격설정 */
	function fn_calcOptAmt() {
		var pUrl = "/product/selectCalcSvcPrc";

		var pSendData = {
				optPchsQy 	: $(':radio[name="o2oQtyRadio"]:checked').val(),			//수량
				dpPrNo 		: $("#dpPrNo").val()
				};

		pSendData = JSON.stringify(pSendData);

		$.ajax({
				url : pUrl,
				type : "POST",
				cache : false,
				data : pSendData,
				contentType : "application/json;charset=UTF-8", // ajax 통신으로 보내는 타입
				success : function(data) {

			    var optTotAmt  = 0;   //옵션 전체 금액
			    var optAmt     = "";  //옵션 별 금액
			    var optCo      = "";  //옵션 사용 수량 ( 0 : 사용안함 , 1 : 사용함.)
			    var optPlcNo   = "";  //옵션 정책번호
			    var optPlcNm   = "";  //옵션명
			    var delemeter  = "@";


			    $(".serviceTemp").hide();
			    if(data.optDtlList.length > 0 ){

			    	if(!ValidUtil.isEmpty($("#tireSizeYn").val()) && $("#tireSizeYn").val() == "N"){
			    		$(".serviceTemp").hide();
			    	}else{
				    	$.each($(".serviceTemp") , function(j , obj){
				    		var idx = (j+1);
							var plcNo = $(':input[name="o2oPlcNo_'+(idx)+'"]').val();

							$.each(data.optDtlList , function(i , optData){
								if(plcNo == optData.optPlcNo){
									$($(".serviceTemp")[j]).show();
								}
							});
				    	});
			    	}

					$.each(data.optDtlList , function(i , optData){

						$.each($(".optRadio") , function(j , obj){
							var idx = (j+1);
							var plcNo = $(':input[name="o2oPlcNo_'+(idx)+'"]').val();

							if( plcNo == optData.optPlcNo){
								$("label[for='radioOpta_"+(idx)+"'").text("정비 : ￦ "+NumUtil.setComma(optData.optPchsPrc) + "");
								$(':input[name="o2oOptPchsPrc_'+(idx)+'"]').val(optData.optPchsPrc);

								var checkYn = $(":radio[name='o2oOptRadio_"+(idx)+"']:checked").val();
								if(checkYn == "Y"){
									optTotAmt += Number(optData.optPchsPrc);
								}
								if(data.length == i){
									delemeter ="";
								}
								optPlcNo += (optData.optPlcNo) + delemeter;
								optPlcNm += (optData.optPlcNm) + delemeter;
								optCo    += ((checkYn == "Y") ? "1" : "0" )+ delemeter
								optAmt   += (optData.optPchsPrc).toString() + delemeter;
							}
						});
					});
			    }else{
					//$(".serviceTemp").attr("style","display:none");
					$(".serviceTemp").hide();
			    	$.each($(".optRadio") , function(j , obj){
			    		var idx = (j+1);
						var plcNo = $(':input[name="o2oPlcNo_'+(idx)+'"]').val();
			    		$("label[for='radioOpta_"+(idx)+"'").text("해딩없음");
						$('#radioOptb_'+(idx)).prop("checked",true);
			    	});
			    }


				$("#optTotAmt").val(optTotAmt);
				$("#optAmt").val(optAmt);
				$("#optCo").val(optCo);
				$("#optPlcNm").val(optPlcNm);
				$("#optPlcNo").val(optPlcNo);

				calculateO2oSet();
				},
				error : function(request, status, error) {
					console.log('error callback : ' + error);
				}
		});
	}

	/* 쿠폰가격설정 */
	function fn_calcCouponAmt() {
		var pUrl = "/product/selectCouponAmt";
		var itemCnt = Number($(':radio[name="o2oQtyRadio"]:checked').val());

		var pSendData = {
				itemCd 	    : $("#itemCd").val(),
				dpPrNo 	    : $("#dpPrNo").val(),
				ordPkgDcAmt : $("#saleFee").val(),
				optTotAmt   : $("#optTotAmt").val(),
				ordQty      : itemCnt
		};

		pSendData = JSON.stringify(pSendData);
		$.ajax({
				url : pUrl,
				type : "POST",
				cache : false,
				data : pSendData,
				contentType : "application/json;charset=UTF-8", // ajax 통신으로 보내는 타입
				success : function(data) {

					var saleFee   = Number($('#orderO2oPayAmt').val());
					var optTotAmt = Number($("#optTotAmt").val());
					var cpnAmt    = Number(data);

					var cpnSaleFee  	="￦"  + NumUtil.setComma(cpnAmt);

					if(saleFee >= cpnAmt ){
						$("#salePriceDiv dl dt").text("쿠폰할인가");
						$('.ext_price').text(cpnSaleFee);//할인가
					}
				},
				error : function(request, status, error) {
					console.log('error callback : ' + error);
				}
		});
	}


$(document).ready(function() {

	// 240829 백인천 - 4p 기본값으로 재구성
	var prCheck = '${resultMapCom.plyRating}';
	if(ValidUtil.isEmpty(prCheck)) {
		console.log("#### prCheck : " + prCheck);
		$("#plyRating").val("4");
	}
	
	var serverMode = $("#serverMode").val();
	if(serverMode == "prd"){ //운영이면
		//$("#coupon").hide();
		$("#couponYn").css("display","none");
	} else {
		$("#couponYn").css("display","inline");
	}

	$("#modal-nonCustContinue").on('click','.md-close',function(){
		$(event.target).parents('.md-show').removeClass('md-show');
	});

	$('.rent-opt').niceSelect();
	$('select.rent-opt').on('change click',function(){
		// $(".nice-select.rent-opt")
		var opt = $(this).val()? $(this).val().split('|') : [0,0,0];
		$(this).next().find('span.current').html(
			'<span class="num2">'+opt[1]+'</span>회'
		);
	}).click();

	$("input[name='o2oQtyRadio']").on('click',function(){

		/* 옵션 가격 설정 */
		fn_calcOptAmt();

		if( $("input[name='o2oQtyRadio']:checked").val() == '04' ){
			/*$(".alignment_001").hide();
			$(".alignment_002").show();*/
		}else{
			/*$(".alignment_001").show();
			$(".alignment_002").hide();*/
		}
	});

	$('select[name="rentaltype"]').on("change" , function(){

		var opt = $("option:selected",this);

		if($(this).val() != 'rentaltype00'){
			// 추천렌탈 등록비 추가 20191207
			fn_nomalRentalAmt();
		}
		$('#nomalRentalId').val( $(this).val() );
		$('#saleCd').val($(opt).attr('salecd'));
		$('#saleNm').val($(opt).attr('title'));
		$('#prdtGrp').val($(opt).attr('prdtgrp'));
		$('#prdtGrpDtl').val($(opt).attr('prdtgrpdtl'));
		fn_topRadioBtnControll( $(this).val() );

		$(".rental-option-detail").hide();
		$("#tab_"+$(this).val() ).show();
	});

	/* page background image Start */
	$('#bgFullImg').append('<div class="member-bg product-detail"></div>');

	$("#ptList").val($('#patternCd').val());
	// 패턴 선택에 따라 상품페이지 이동이 필요하다.
		$('#ptList').change(function() {
		$('#patternCd').val($(this).val());
		location.href = "/product/prdDctDetail?dpPrNo="+$(this).find("option:selected").data("dp")+"&itemCd="+$(this).find("option:selected").data("it")+"&patternCd="+$('#patternCd').val()+"#tab03";
	});

	$("#reviewTab").on("click" , function(){
		getReviewList('init');
		$("#tab03").fadeIn();

		var height = $("#tab03").offset();
		$("html, body").animate({scrollTop: height.top}, 400);
	});

	$(document).on("click", "#opReview", function() {
		var drno= $(this).attr('value');
		var dataImg= $(this).attr('data-img');
		openReviewItem(drno, dataImg);
	});

	$(document).on("click", "#preClick", function() {
		var drno= $(this).attr('value');
		if(Number(drno) < 1) {
			alert('이전 리뷰가 없습니다.');
			return;
		} else {
			open_review_itemNext(drno);
			$("#popMore").removeClass('on');
			$("#popMore").text('더보기');
			$("#reviewDetailView_popup .review-item").addClass('mini');
			$("#reviewDetailView_popup .review-content").scrollTop(0);
		}
	});

	$(document).on("click", "#postClick", function() {
		var drno= $(this).attr('value');
		var len= $(this).attr('data-len');
		if(Number(len) < Number(drno)) {
			alert('다음 리뷰가 없습니다.');
			return;
		} else {
			open_review_itemNext(drno);
			$("#popMore").removeClass('on');
			$("#popMore").text('더보기');
			$("#reviewDetailView_popup .review-item").addClass('mini');
			$("#reviewDetailView_popup .review-content").scrollTop(0);
		}
	});

	var imgPath = '';

	$(document).on("click", "#sImg_0", function() {
		imgPath = $("#sImg_0").attr('src');
		$("#bImg").attr('src', imgPath);
	});
	$(document).on("click", "#sImg_1", function() {
		imgPath = $("#sImg_1").attr('src');
		$("#bImg").attr('src', imgPath);
	});
	$(document).on("click", "#sImg_2", function() {
		imgPath = $("#sImg_2").attr('src');
		$("#bImg").attr('src', imgPath);
	});

	//뒤로가기
	$(document).on("click",".backBtn" , function(){
		var gbn = $(this).attr("gbn");

		if(gbn == "maker") {
			$("#modal-1").find("input[type='radio']").prop("checked",false);
			$("#modal-1").addClass("md-show");
			$("#modal-3").removeClass("md-show");
		} else if(gbn == "model"){
			$("#modal-3").find("input[type='radio']").prop("checked",false);
			$("#modal-3").addClass("md-show")
			$("#modal-4").removeClass("md-show");
		} else if(gbn == "size"){
			$("#modal-4").find("input[type='radio']").prop("checked",false);
			$("#modal-4").addClass("md-show")
			$("#modal-5").removeClass("md-show");
		} else if(gbn == "size1"){
			$("#modal-1").find("input[type='radio']").prop("checked",false);
			$("#modal-1").addClass("md-show");
			$("#modal-6").removeClass("md-show");
		} else if(gbn == "size2"){
			$("#modal-6").find("input[type='radio']").prop("checked",false);
			$("#modal-6").addClass("md-show")
			$("#modal-7").removeClass("md-show");
		} else if(gbn == "size3"){
			$("#modal-7").find("input[type='radio']").prop("checked",false);
			$("#modal-7").addClass("md-show")
			$("#modal-8").removeClass("md-show");
		} else if(gbn == "nice"){
			$("#modal-1").find("input[type='radio']").prop("checked",false);
			$("#modal-1").addClass("md-show");
			$("#modal-carNumSearch").removeClass("md-show");
		} else if(gbn == "niceSize"){
			$("#modal-carNumSearch").find("input[type='radio']").prop("checked",false);
			$("#modal-carNumSearch").addClass("md-show")
			$("#modal-CarNumSize").removeClass("md-show");
		}
	});


	//init 함수 호출
	evManager.init();
	eventFunc();
	inputNumberWithComma();	//구매 최저가 콤마찍기 함수
	/* 렌탈관련 페이지를 들어왔을 경우 차종이 없으면 주문으로 넘기지 못한다 때문에 무조껀 재조회 하기 위해 알림 팝업을 띄워준다. */
	fn_innitRentalSearchPop();
});

$('#filterBtn').on('click', function () {
	ComUtil.loading();
	getReviewList('init');
	ComUtil.unloading();
});

$('#btnReset').on('click', function () {
	$("#reviewOrderItem01").prop("checked" , true);
	$("#reviewFilterType01").prop("checked" , true);
	$("input[name='reviewFilterService']").prop("checked" , false);

	getReviewList('init');
});

function toggleFilter( btn ){

	if( $(btn).is('.on') ){
		$(btn).removeClass('on');
		$(".review-section-filter").hide();
	}else{
		$(btn).addClass('on');
		$(".review-section-filter").show();
	}
}

function reivewMoreView( btn ){
	var review_item = $(btn).parents('.review-item');
	$('.review-content',review_item).removeClass('mini');
	$(btn).parents('.review-more').hide();
}

function popup_toggleReivewMoreView( btn ){

	if( !$(btn).is('.on') ){
		$(btn).addClass('on');
		$(btn).text('닫기');
		$("#reviewDetailView_popup .review-item").removeClass('mini');
	}else{
		$(btn).removeClass('on');
		$(btn).text('더보기');
		$("#reviewDetailView_popup .review-item").addClass('mini');
	}
	$("#reviewDetailView_popup .review-content").scrollTop(0);


}
function open_review_itemNext(searchType){
	$("#reviewDetailView_popup").show();
	getReviewAtflList(searchType, "");
	$("#reviewGallery_popup").hide();
}

function openReviewItem(usePsNo, dataImg){
	$("#reviewDetailView_popup").show();
	getReviewAtflList("", usePsNo);
	$("#bImg").attr('src', dataImg);
	$("#reviewGallery_popup").hide();
}
function openReviewGallery( ){
	$("#reviewGallery_popup").show();
	getReviewAtflList("", "");
	$("#reviewDetailView_popup").hide();
}

function closeReviewGallery(){
	$("#reviewGallery_popup").hide();

}
function closeReviewDetailPopup(){
	openReviewGallery( );
	$("#reviewDetailView_popup").hide();
}

/* 리뷰 관련 기능 // */

</script>