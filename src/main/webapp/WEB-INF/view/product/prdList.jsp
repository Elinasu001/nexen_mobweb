<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

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

<link type="text/css" rel="stylesheet" href="/css/nouislider.min.css">
<script type="text/javascript" src="/js/lib/nouislider.min.js"></script>

<link type="text/css" rel="stylesheet" href="/css/product_list_new.css">
<script type="text/javascript" src="/js/lib/classie.js"></script>
<script type="text/javascript" src="/js/lib/modalEffects.js"></script>

<script type="text/javascript" src="/js/lib/jsrender.min.js"></script>


<form id="frm" name="frm" method="post" >
<input type="hidden" name="searchGbn"		id="searchGbn" />		<!-- N : 차량번호 , C : 차종 , S : 사이즈 -->
<input type="hidden" name="carNo"			id="carNo" 			value="${prdSearchVo.carNo}"/>			<!-- 차량번호 -->
<input type="hidden" name="makerCd" 		id="makerCd" 		value="${prdSearchVo.makerCd}" />		<!-- 제조사 코드 -->
<input type="hidden" name="makerNm" 		id="makerNm" />			<!-- 제조사 명 -->
<input type="hidden" name="modelCd" 		id="modelCd" value="${prdSearchVo.modelCd}" />		<!-- 차 모델 코드 -->
<input type="hidden" name="modelNm"       	id="modelNm" value="${prdSearchVo.modelNm}"/>         <!-- 차 모델  명 -->
<input type="hidden" name="contentsCd" 		id="contentsCd" value="${prdSearchVo.contentsCd}" />		<!-- 차 사양 코드 -->
<input type="hidden" name="sectionWidth" 	id="sectionWidth" 	value="${prdSearchVo.sectionWidth}" />	<!-- 단면폭 or sectionWidth -->
<input type="hidden" name="aspectRatio" 	id="aspectRatio" 	value="${prdSearchVo.aspectRatio}" />		<!-- 편평비 or aspectRatio -->
<input type="hidden" name="wheelInches" 	id="wheelInches" 	value="${prdSearchVo.wheelInches}" />		<!-- 인치    or wheelInches -->
<input type="hidden" name="tireSizeYn" 	    id="tireSizeYn" 	value="${prdSearchVo.tireSizeYn}" />		<!-- 후륜/전륜 동일  여부-->
<input type="hidden" name="TireSizeCd" 		id="TireSizeCd" 	value="${prdSearchVo.tireSizeCd}" />		<!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->
<input type="hidden" name="TireSizeNm" 		id="TireSizeNm" 	value="${prdSearchVo.tireSizeNm}" />		<!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->

<!-- 후륜사이트 추가 -->
<input type="hidden" name="sectionRwWidth" 	id="sectionRwWidth" value="${prdSearchVo.sectionRwWidth}" />	<!-- 후륜 단면폭 or sectionWidth -->
<input type="hidden" name="aspectRwRatio" 	id="aspectRwRatio" 	value="${prdSearchVo.aspectRwRatio}" />		<!-- 후륜 편평비 or aspectRatio -->
<input type="hidden" name="wheelRwInches" 	id="wheelRwInches" 	value="${prdSearchVo.wheelRwInches}" />		<!-- 후륜 인치    or wheelInches -->

<!-- 상세 화면 용 -->
<input type="hidden" name="dMakerCd" 		id="dMakerCd" />	<!-- 제조사 코드 -->
<input type="hidden" name="petternCd" 		id="petternCd" />	<!-- 패턴 코드 -->
<input type="hidden" name="frCd" 			id="frCd" />		<!-- 앞뒤 구분 -->
<input type="hidden" name="classCd" 		id="classCd" 	value="${prdSearchVo.classCd}" />		<!-- 치종 구분 > 승용차 / SUV -->
<input type="hidden" name="classCdNew" 		id="classCdNew" value="${prdSearchVo.classCdNew}" />		<!-- 치종 구분 > 승용차 / SUV -->
<input type="hidden" name="matCd" 			id="matCd" />		<!-- 상품코드 -->
<input type="hidden" name="plyRating" 		id="plyRating" 		value="${prdSearchVo.plyRating}"/>	<!-- 강도 -->
<input type="hidden" name="description" 	id="description" />
<input type="hidden" name="seasonCd" 		id="seasonCd" />		<!-- 계절 구분-->
<input type="hidden" name="seasonCdNm" 		id="seasonCdNm" />
<input type="hidden" name="labelType" 		id="labelType" />	<!-- 구매, 렌탈 구분  -->

<input type="hidden" name="otPay" 			id="otPay" />	<!-- 렌탈최저가  -->
<input type="hidden" name="minSaleFee" 		id="minSaleFee" />	<!-- 구매 최저가  -->
<input type="hidden" name="maxSaleFee" 		id="maxSaleFee" />	<!-- 구매 최고가  -->
<!-- 추가 쿠폰 최적가 적용로직 추가 : ITEM CD   -->
<input type="hidden" name="itemCd"          id="itemCd"          value='' /> <!-- 품목 코드  -->
<input type="hidden" name="dpPrNo"          id="dpPrNo"          value='' /> <!-- 선택한 전시 상품 번호 -->

<!-- 추가 전/후륜  적용로직 추가    -->
<input type="hidden" name="driveFwd"        id="driveFwd"        value='' /> <!-- 전륜사이즈  -->
<input type="hidden" name="driveRwd"        id="driveRwd"        value='' /> <!-- 후륜사이즈 -->
<input type="hidden" name="addDpPrNo"       id="addDpPrNo"       value='' /> <!-- 추가전시상품 -->
<input type="hidden" name="addItemCd"       id="addItemCd"       value='' /> <!-- 추가품목코드 -->
<input type="hidden" name="addMatCd"        id="addMatCd"       value='' /> <!-- 추가품목코드 -->
<input type="hidden" name="tireFrCd"        id="tireFrCd"        value='' />  <!-- 타이어 전후륜구분 -->

<!-- paging -->
<input type="hidden" name="pageNo"	id="pageNo"	value="${pageNo}"/>		<!-- 현재 페이지 -->
<input type="hidden" name="pageSize"	id="pageSize" 	value="20" />		<!-- 페이지에 표시할 수 -->
<input type="hidden" name="carSearchParam"	id="carSearchParam" 	value='${prdSearchVo.carSearchParam}' />
<input type="hidden" name="niceGradeCd"   id="niceGradeCd"    value='${prdSearchVo.niceGradeCd}' />
<input type="hidden" name="reviewGrdPt"   id="reviewGrdPt"    value='' />
<input type="hidden" name="reviewCnt"   id="reviewCnt"    value='' />


<div class="header-choice-size">
	<div class="choice-size-inner">
		<ul id="carSearchParamView">

		</ul>

		<div class="btn-box">
			<img onclick="openSizeFinder('num');" src="/img/product/btn_rescan.png" alt="다시 검색하기" style="cursor:pointer;"/>
		</div>

	</div>
</div>

<div class="step-nav">
	<ul>
		<li class="active">1. 상품 선택</li>
		<li>2. 옵션 선택</li>
		<li>3. 주문 및 결제</li>
	</ul>
</div>

<!--subContentsWrap-->
<div class="subContentsWrap">
	<main class="product-list">

	<div class="result-cnt-wrap">
		검색결과 총 <span class="result_cnt" id="totalCnt">0</span>건
	</div>

	<div class="orderType-wrap">
		<div class="order-item">
			<input type="radio" id="order_pop" name="orderType" value="pop" checked ><label for="order_pop" class="order_type">인기순</label>
		</div>
		<div class="order-item">
			<input type="radio" id="order_highFee" name="orderType" value="highFee"><label for="order_highFee" class="order_type">고가순</label>
		</div>
		<div class="order-item">
			<input type="radio" id="order_lowFee" name="orderType" value="lowFee"><label for="order_lowFee" class="order_type">저가순</label>
		</div>

		<button type="button" class="filter-button" onclick="$('#filterPop').fadeIn()" ><span></span><b>필터</b></button>
	</div>

	<!-- 검색결과 리스트 -->
	<section class="result-list">
		<h2 class="title">검색결과</h2>
		<div class="result-list-outer" id="prdList">
		<!-- result single -->

		<!-- //result single -->
		</div>
	</section>

	<hr>
	<!-- //검색결과 리스트 -->
	</main>
</div>
<!--subContentsWrap-->

<!-- footerUtility -->
<%--<button id="btnMore" class="product-list-more full-width inset-m">
	<span>더보기</span>
</button>--%>

<div class="footer-banner">
	<div>
		<img id="tireTipGo" src="/img/product/list_banner_01.png" alt="타이어 교체주기"/>
	</div>
	<div>
		<img id="o2oServiceGo" src="/img/product/list_banner_02.png" alt="타이어 1개까지도 방문장착"/>
	</div>
	<div>
		<img id="eventAlert" src="/img/product/list_banner_03.png" alt="신규타이어 출시 이벤트"/>
	</div>
</div>

<!-- filterPop: 필터 -->
<div class="filterPop" id="filterPop">

	<div class="popContents">
		<header>
			<h2>
			Filter
			<a class="layPopClose" onclick="javascript:$('#filterPop').fadeOut();"></a>
			</h2>
		</header>
		<div class="contents">
			<div class="filter-option">

			<div class="filter-season-wrap">
		<div class="season-item">
			<input type="checkbox" id="fSeason02" name="fSeason" value="03" checked ><label for="fSeason02" class="sun">여름</label>
		</div>
		<div class="season-item">
			<input type="checkbox" id="fSeason03" name="fSeason" value="02" checked ><label for="fSeason03" class="snow">겨울</label>
		</div>
		<div class="season-item">
			<input type="checkbox" id="fSeason01" name="fSeason" value="01" checked ><label for="fSeason01" class="all">사계절</label>
		</div>
	</div>

			<hr>

			<div style="display:none;">
				<!-- 차량유형 -->
				<div><input type="checkbox" id="fCarType01" name="fCarType" value="P1" class="type03" checked ><label for="fCarType01"><em class="w100">승용차</em></label></div>
				<div><input type="checkbox" id="fCarType02" name="fCarType" value="S1" class="type03" checked ><label for="fCarType02"><em class="w100">SUV</em></label></div>
				<div><input type="checkbox" id="fCarType03" name="fCarType" value="V1" class="type03" checked ><label for="fCarType03"><em class="w120">VAN / 소형트럭</em></label></div>

				<hr>

				<!-- 브랜드 -->
				<div><input type="checkbox" id="fBrand01" name="fBrand" value="NXN" class="type03" checked ><label for="fBrand01"><em class="w100">넥센</em></label></div>
				<div><input type="checkbox" id="fBrand02" name="fBrand" value="MC" class="type03"><label for="fBrand02"><em class="w100">미쉐린</em></label></div>
				<div><input type="checkbox" id="fBrand03" name="fBrand" value="CT" class="type03"><label for="fBrand03"><em class="w120">콘티넨탈</em></label></div>

				<%--
				<hr>
				<!-- 구매유형 -->
				<div><input type="checkbox" id="buy01" name="fRentalYn" value="R" class="type03"><label for="buy01"><em class="w100">렌탈</em></label></div>
				<div><input type="checkbox" id="buy02" name="fRentalYn" value="B" class="type03"><label for="buy02"><em class="w100">구매</em></label></div>
				--%>
			</div>

			<div class="filter-priority-wrap">
				<div class="priority-item">
					<input type="radio" id="order_waGrd" name="orderSpec" value="waGrd" txt="마모성능 우선"><label for="order_waGrd">마모성능 우선</label>
				</div>
				<div class="priority-item">
					<input type="radio" id="order_brGrd" name="orderSpec" value="brGrd" txt="제동성능 우선"><label for="order_brGrd">제동성능 우선</label>
				</div>
				<div class="priority-item">
					<input type="radio" id="order_ctGrd" name="orderSpec" value="ctGrd" txt="승차감/소음 우선"><label for="order_ctGrd">승차감/소음 우선</label>
				</div>
				<div class="priority-item">
					<input type="radio" id="order_feGrd" name="orderSpec" value="feGrd" txt="연비효율 우선"><label for="order_feGrd">연비효율 우선</label>
				</div>
			</div>

			<hr>

			<div class="price-range-wrap" id="priceRangeWrap_buy">
				<div class="price-label">구매 가격대</div>
				<div class="price-range">0 ~ 40만원</div>
				<input type="text" id="buy_min" class="range-input" readonly >
				<input type="text" id="buy_max" class="range-input" readonly >
				<div class="price-slider" id="price-buy-range"></div>
			</div>

			<div class="price-range-wrap" id="priceRangeWrap_rent">
				<div class="price-label">월 렌탈 최저 가격대</div>
				<div class="price-range">0 ~ 40만원</div>
				<input type="text" id="rent_min" class="range-input" readonly >
				<input type="text" id="rent_max" class="range-input" readonly >
				<div class="price-slider" id="price-rent-range"></div>
			</div>

			<div class="btn-wrap">
		<button type="reset" class="btn-reset" id="btnReset">초기화</button>
		<button type="button" class="btn-fix2" id="btnFix">적용</button>
	</div>

			</div>
		</div>
	</div>
</div>
<!-- 아래가 로딩바를 집어넣는 div인데 필요한지 확인 필요  -->
<!-- <div id="loadingWrap2"></div> -->

<!-- Naver premium service -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
<script type="text/javascript"> 
	var _nasa={};
	if(window.wcs) _nasa["cnv"] = wcs.cnv("5", "2500");
</script> 
<!-- Naver premium service -->

<!-- //필터 -->
<script type="text/x-template" id="productItemTemplete">

	<!-- result-data-link -->
	<a class='product-item thumBox' dpPrNo='{{:dpPrNo||"null"}}' itemCd='{{:itemCd||"null"}}' tireSize='{{:tireSize||"null"}}' o2oYn={{:o2oYn}}
                                    seasonCd='{{:seasonCd||"null"}}' classCd='{{:classCd||"null"}}' seasonCdNm='{{:seasonCdNm||"null"}}'
                                    matCd='{{:matCd||"null"}}' petternCd='{{:petternCd||"null"}}' petternCdNm='{{:petternCdNm||"null"}}'
                                    frCd='{{:frCd||"null"}}' tireFrCd='{{:tireFrCd||"null"}}' description='{{:description||"null"}}' isPurchase="{{:o2oYn}}"
                                    isRental="{{:rentalYn}}" minSaleFee="{{:minSaleFee}}" maxSaleFee="{{:maxSaleFee}}" otPay="{{:otPay}}"
                                    reviewGrdPt="{{:reviewGrdPt}}" reviewCnt="{{:reviewCnt}}" tireSizeYn="{{:tireSizeYn}}">

		<div class="product-inner">

			<!-- <div class="product-wheel front"></div> --> <!-- 전륜 -->
			<!-- <div class="product-wheel rear"></div> --> <!-- 후륜 -->

            <!--{{if tireFrCd == "F" && o2oYn == "Y" }}<div class="product-wheel front"></div> {{/if}}-->
			<!--{{if tireFrCd == "R" && o2oYn == "Y" }}<div class="product-wheel rear"></div>  {{/if}}-->
			{{if tireFrCd == "F" && tireSizeYn == "N"  }}<div class="product-wheel front"></div> {{/if}}
			{{if tireFrCd == "R" && tireSizeYn == "N"  }}<div class="product-wheel rear"></div>  {{/if}}


			<div class="product-badge">
				{{if hotYn == 'Y' }}<span class="badge-hot"></span>{{else}}<span class="badge-hot off"></span>{{/if}}
				{{if bestYn == 'Y' }}<span class="badge-best"></span>{{else}}<span class="badge-best off"></span>{{/if}}

				{{if o2oYn == 'Y' }}<i class="purchase hide"></i>{{/if}}
				{{if rentalYn == 'Y' }}<i class="rental hide"></i>{{/if}}
			</div>

			<div class="product-slogan">{{:stpntCont}}</div>
			<div class="product-logo">
			{{if img_logo != '' && img_logo != null }}
				<!-- <img src="/img/product/{{:img_logo}}" alt="{{:petternCdNm}}" /> -->
                <div class="product-logo"><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>{{:img_logo}}" alt="{{:petternCdNm}}" /></div>
			{{else}}
				{{:petternCdNm}}
			{{/if}}
			</div>

			<div class="product-type">
				<div class='review'>
					<span class="star point{{:reviewGrdPtImg*10}}"></span>
					<span class='score'>{{:reviewGrdPt}}</span>
					<span class='cnt'>({{:reviewCnt}})</span>
				</div>

				{{:classCdNm}} · {{:seasonCdNm}}
				{{if frCd == "F"}} | 앞{{/if}}
				{{if frCd == "R"}} | 뒤{{/if}}
				{{if frCd == "Z"}} | 범용{{/if}}
			</div>

			<div class="product-spec">
				<ul>
					<li><label>{{:spec_vechicleMile[0] }}</label><div class="spec-wrap"><div class="spec-value"><div class="spec-bar" style="width:{{:spec_vechicleMile[1]*20}}%"></div></div></div></li>
					<li><label>{{:spec_brake[0] }}</label><div class="spec-wrap"><div class="spec-value"><div class="spec-bar" style="width:{{:spec_brake[1]*20}}%"></div></div></div></li>
					<li><label>{{:spec_comfortable[0] }}</label><div class="spec-wrap"><div class="spec-value"><div class="spec-bar" style="width:{{:spec_comfortable[1]*20}}%"></div></div></div></li>
					<li><label>{{:spec_fuel[0] }}</label><div class="spec-wrap"><div class="spec-value"><div class="spec-bar" style="width:{{:spec_fuel[1]*20}}%"></div></div></div></li>
				</ul>
			</div>
			<div class="product-image">
				<!--
                {{if rentalYn == 'Y' }}
				<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atprdfile_cms/{{:atflPathNm}}" alt="{{:petternCd}}" />
				{{else o2oYn == 'Y' }}
				<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>{{:atflPathNm}}" alt="{{:petternCd}}" />
				{{/if}}
                -->
               <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>{{:atflPathNm}}" alt="{{:petternCd}}" />
			</div>
			<div class="product-brand">
				<img src="/img/product/product_brand_logo_nexen.png" alt="NEXENTIRE">
			</div>

			{{if ev_searchYn == "Y"}}
				<div class="product-price  {{if o2oYn == "Y" && rentalYn != "Y" }}buy{{else o2oYn != "Y" && rentalYn == "Y" }}rantal{{else}}both{{/if}}">
					{{if o2oYn == "Y"}}
						{{if bassSaleFee != saleFee || bassSaleFee != stmemSaleAmt }}   <div class="buy-price">    <span class="price">￦{{:price_bassSaleFee}}</span> </div>
						{{else officerCd == "" }}  <div class="buy-price"> <span class="label">구매가</span>   <span class="price">￦{{:price_saleFee}}</span> </div>
						{{else officerCd != "" }}  <div class="buy-price"> <span class="label">구매가</span>   <span class="price">￦{{:price_stmemSaleAmt}}</span> </div>
						{{/if}}

						<div class="coupon-price"> <span class="label">할인가</span><span class="price">￦500,000</span> </div>

					{{/if}}
					{{if rentalYn == "Y" }}<div class="rantal-price"> <span class="label">월 렌탈 최저가</span> <span class="price">￦{{:price_otFee}}/{{:price_feeCnt}}개</span> </div>{{/if}}
				</div>
			 {{else}}
				<div class="product-price   {{if o2oYn == "Y" && rentalYn != "Y" }}buy{{else o2oYn != "Y" && rentalYn == "Y" }}rantal{{else}}both{{/if}}">
					{{if o2oYn == "Y"}}
						{{if grpPay != "Y" && officerCd != ""}}
								<div class="coupon-price">
									<span class="label">임직원가</span>
									<span class="price">
										<span class="org_price">￦{{:price_bassSaleFee}}</span> <span class="dc_price">￦{{:price_stmemSaleAmt}}</span>
									</span>
								</div>
						{{else}}
							{{if discountYn == "Y"}}
							<!-- 할인가 일경우 -->
							<div class="coupon-price">
                	            <span class="label">{{:priceNm}}</span>
								<span class="price">
									<span class="org_price">￦{{:price_bassSaleFee}}</span>   <span class="dc_price">￦{{:price_groupFee}}</span>
								</span>
	                           <!--
								{{if price_couponFee > "0" && cpnDpYn == "Y" }}
								 <span class="label">쿠폰가</span>
								 <span class="price">
								 	<span class="org_price">￦{{:price_groupFee}}</span>   <span class="dc_price">￦{{:price_couponFee}}</span>
								 </span>
    	                       {{/if}}
	                           -->
							</div>
							{{else}}
								<!-- 구매가 일경우 -->
								<div class="buy-price"> <span class="label">{{:priceNm}}</span><span class="price">￦{{:price_groupFee}}</span> </div>
							{{/if}}
						{{/if}}
					{{/if}}
					{{if rentalYn == "Y"}}
						<div class="rantal-price"> <span class="label">월 렌탈 최저가</span> <span class="price">￦{{:price_otPay}} ~</span> </div>
					{{/if}}
				</div>
			 {{/if}}
		</div>
	</a>
</script>


<script type="text/javascript">
	$( function() {
		var rentRange = document.getElementById('price-rent-range');
		noUiSlider.create(rentRange, {
			start: [0, 400000],
			connect: true,
			range: {
				'min': 0,
				'max': 400000
			}
		});
		rentRange.noUiSlider.on('update', function ( values, handle ) {
			//console.log( values, handle );
			$("#rent_min").val(values[0]);
			$("#rent_max").val(values[1]);
			$("#priceRangeWrap_rent .price-range").text( Math.floor( values[0]/10000 ) +' ~ '+Math.ceil( values[1]/10000 )+'만원' );

		});

		var buyRange = document.getElementById('price-buy-range');
		noUiSlider.create(buyRange, {
			start: [0, 400000],
			connect: true,
			range: {
				'min': 0,
				'max': 400000
			}
		});

		buyRange.noUiSlider.on('update', function ( values, handle ) {
			//console.log( values, handle );
			$("#buy_min").val(values[0]);
			$("#buy_max").val(values[1]);

			$("#priceRangeWrap_buy .price-range").text( Math.floor( values[0]/10000 ) +' ~ '+Math.ceil( values[1]/10000 )+'만원' );

		});

/*		buyRange.noUiSlider.on('end', function () {
			var pUrl = "/product/selectPrdList";
			//파라미터는 공통으로 사용 - evManager.listParam()
			evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , "I");
		});

		rentRange.noUiSlider.on('end', function () {
			var pUrl = "/product/selectPrdList";
			//파라미터는 공통으로 사용 - evManager.listParam()
			evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , "I");
		});*/

	});
</script>


<script type="text/javascript">
	$(function() {
		evManager.init();
		//PageScope.init();
		EventScope.init();
	});

	var evManager = {
		//이전 화면 구분 값 : M : 메인  조회 , H : 헤더
		viewGbn : "${viewGbn}",
		loginName : "${userVo.getUsrName()}",
		officerCd : "${userVo.getOfficerCd()}",
		searchYn : false,	//조회 여부
		driveDsp : "",		//조회 사이즈
		fCarType : new Array(), //차구분 : 승용, SUV, VAN
		init : function(){
			//page
			$("#pageNo").val("1");

			//search navi
			var carSearchParam = '${prdSearchVo.carSearchParam}';
			var fChoiceArr;
		    var fChoiceArrR;
			if(!ValidUtil.isEmpty(carSearchParam)){
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
								//$('#carSearchParamView').append('<li>'+ value +'</li>');
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
					}else if(key == 'driveDsp') {
						evManager.driveDsp = value;
					}
				});
			} else {
				//alert 이후에 페이지 전환을 위해 jquery alert을 이용.
				alert("올바른 경로가 아닙니다. 검색을 통해 진행해주세요.");
				location.href = "/main";
				return false;
			}

			var gbn = "I";
			var sectionWidth = "";
			var aspectRatio = "";
			var wheelInches = "";
			//후륜 사이즈 정보 추가
			var sectionRwWidth = "";
			var aspectRwRatio = "";
			var wheelRwInches = "";
			var tireSizeYn = "";

			var searchType = "ALL";

			//메인 검색으로 넘어온 경우
			if(evManager.viewGbn == "MC") {
				gbn = "M";
				sectionWidth = "${prdSearchVo.getSectionWidth()}";
				aspectRatio = "${prdSearchVo.getAspectRatio()}";
				wheelInches = "${prdSearchVo.getWheelInches()}";
				//후륜 사이즈 정보 추가
				sectionRwWidth = "${prdSearchVo.getSectionRwWidth()}";
				aspectRwRatio = "${prdSearchVo.getAspectRwRatio()}";
				wheelRwInches = "${prdSearchVo.getWheelRwInches()}";
				tireSizeYn    = "${prdSearchVo.getTireSizeYn()}";
				searchType = "X";
				evManager.searchYn = true;
			}

			//evManager.fCarType.push("${prdSearchVo.getClassCd()}");
			evManager.fCarType.push("P1");
			evManager.fCarType.push("S1");
			evManager.fCarType.push("V1");

			var fBrand = new Array();
			fBrand.push("NXN");

			var fSeason = new Array();
			fSeason.push("03");
			fSeason.push("01");
			fSeason.push("02");

			var fRentalYn = new Array();
			fRentalYn.push("B");
			fRentalYn.push("R");

			//list 조회
			var pUrl = "/product/selectPrdList";
			var pSendData = {
				modelCd 		: ""
				, contentsCd	: ""
				, classCd 		: ""
				, sectionWidth 	: sectionWidth
				, aspectRatio 	: aspectRatio
				, wheelInches 	: wheelInches
				, sectionRwWidth : sectionRwWidth
				, aspectRwRatio : aspectRwRatio
				, wheelRwInches : wheelRwInches
				, tireSizeYn 	: tireSizeYn
				, fCarType 		: evManager.fCarType
				, fBrand		: fBrand
				, fSeason		: fSeason
				, fRentalYn		: fRentalYn
				, pageNo		: $("#pageNo").val()
				, pageSize		: '20'
				, orderType		: "pop"
				, searchType 	: searchType
				, lifeStyle	: null
				, orderSpec 	: ""
				, buyMinFee     : Math.floor($("#buy_min").val()/10000) * 10000
				, buyMaxFee     : Math.ceil($("#buy_max").val()/10000) * 10000
				, rentMinFee    : Math.floor($("#rent_min").val()/10000) * 10000
				, rentMaxFee    : Math.ceil($("#rent_max").val()/10000) * 10000
			};
			evManager.commonAjax(pUrl, pSendData, callBackManager.selectMakePrdList , gbn);

		},

		//공통 AJAX 호출
		commonAjax : function(url, param, callback , gbn) {
			/* $("#loadingWrap2").show(); */
			//모바일 공통 util의 로딩바
			ComUtil.loading();
			$.ajax({
				url: url,
				type: "POST",
				cache:false,
				data: JSON.stringify(param),
				contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
				success: function(data) {
					/* $("#loadingWrap2").hide(); */
					ComUtil.unloading();
					if(data != null) {
						callback(data , gbn);
					}
				},
				error: function (request, status, error) {
					/* $("#loadingWrap2").hide(); */
					ComUtil.unloading();
					callBackManager.error(error);

				}
			});
		},

		//상품 리스트 호출 - 페이지용
		selectPrdList : function (p) {
			$("#pageNo").val(p);
			$("#pageSize").val($("#pageSize").val());
			var pUrl = "/product/selectPrdList";
			//파라미터는 공통으로 사용 - evManager.listParam()
			evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , "I");
		},

		listParam : function () {
			//브랜드
			var fBrand = new Array();
			$("input[name='fBrand']").each(function(){
				if($(this).is(":checked")) {
					fBrand.push($(this).val());
				}
			});
			//계절구분
			var fSeason = new Array();
			$("input[name='fSeason']").each(function(){
				if($(this).is(":checked")) {
					fSeason.push($(this).val());
				}
			});
			//렌탈유무
			var fRentalYn = new Array();
			if(!$("input[name='fRentalYn']").is(":checked")) {
				fRentalYn.push("R");
				fRentalYn.push("B");
			} else {
				$("input[name='fRentalYn']").each(function(){
					if($(this).is(":checked")) {
						fRentalYn.push($(this).val());
					}
				});
			}

			var searchType = $("#wheelInches").val() == "" ? "ALL" : "X";

			var pSendData = {
				modelCd 		: $("#modelCd").val()
				, contentsCd	: $("#contentsCd").val()
				, classCd 		: $("#classCd").val()
				, sectionWidth 	: $("#sectionWidth").val()
				, aspectRatio 	: $("#aspectRatio").val()
				, wheelInches 	: $("#wheelInches").val()
				, sectionRwWidth : $("#sectionRwWidth").val()
				, aspectRwRatio : $("#aspectRwRatio").val()
				, wheelRwInches : $("#wheelRwInches").val()
				, tireSizeYn 	: $("#tireSizeYn").val()
				, rentalYn 		: $("#rentalYn").val()
				, fCarType 		: evManager.fCarType
				, fBrand		: fBrand
				, fSeason		: fSeason
				, fRentalYn		: fRentalYn
				, pageNo		: $("#pageNo").val()
				, pageSize		: $("#pageSize").val()
				, orderType		: $("input:radio[name=orderType]:checked").val()
				, orderSpec		: $("input:radio[name=orderSpec]:checked").val()
				, o2oYn			: $("#o2oYn").val()
				, searchType 	: searchType
				, buyMinFee     : Math.floor($("#buy_min").val()/10000) * 10000
				, buyMaxFee     : Math.ceil($("#buy_max").val()/10000) * 10000
				, rentMinFee    : Math.floor($("#rent_min").val()/10000) * 10000
				, rentMaxFee    : Math.ceil($("#rent_max").val()/10000) * 10000
			}
			//console(pSendData.toString());

			return pSendData;
		},

		closeFilterPop : function () {
			$("#filterPop").removeClass("md-show");
			$("#filterPop").fadeOut();
		}
	}

	/* ################################# AJAX CALLBACK ARAR #################################  */
	var callBackManager = {
		//에러 처리
		error : function() {
			console.log('error callback : ' + error);
		},

		//상품 리스트
		selectMakePrdList : function(rs , gbn) {
			/* $("#loadingWrap2").hide(); */
		    ComUtil.unloading();
			var tmpl = $.templates("#productItemTemplete"); // Get compiled template

			var data = rs.selectPrdList;
			var pageCommon = rs.pageCommon;
			if(data != null && data.length > 0 ) {
				//화면 생성
				var listHtml = "";
				for(var i=0; i<data.length; i++){

					data[i].ev_searchYn = evManager.searchYn;
					data[i].ev_driveDsp = evManager.driveDsp;

					/*
					if("NFERA AU7" === data[i].petternCd){
						data[i].img_logo = 	"list_au7.png";
					}else if("NFERA-RU5" === data[i].petternCd){
						data[i].img_logo = 	"list_ru5.png";
					}else if("NFERA AU5" === data[i].petternCd){
						data[i].img_logo = 	"list_au5.png";
					}else if("ROADIAN GTX" === data[i].petternCd){
						data[i].img_logo = 	"list_gtx.png";
					}else if("NFERA SU1" === data[i].petternCd){
						data[i].img_logo = 	"list_su1.png";
					}else if("NPRIZ AH8" === data[i].petternCd){
						data[i].img_logo = 	"list_ah8.png";
					}else if("NPRIZ AH5" === data[i].petternCd){
						data[i].img_logo = 	"list_ah5.png";
					}else if("NPRIZ RH7" === data[i].petternCd){
						data[i].img_logo = 	"list_rh7.png";
					} */

					data[i].img_logo              = data[i].logoListImgUrl;
					data[i].spec_brake            = data[i].brake.split("^");
					data[i].spec_fuel             = data[i].fuel.split("^");
					data[i].spec_comfortable      = data[i].comfortable.split("^");
					data[i].spec_vechicleMile     = data[i].vechicleMile.split("^");

					data[i].spec_brake[1]         =  data[i].spec_brake[1] ;
					data[i].spec_fuel[1]          = data[i].spec_fuel[1] ;
					data[i].spec_comfortable[1]   =  data[i].spec_comfortable[1] ;
					data[i].spec_vechicleMile[1]  =  data[i].spec_vechicleMile[1] ;

					data[i].price_bassSaleFee     = NumUtil.setComma( data[i].bassSaleFee );
					data[i].price_saleFee         = NumUtil.setComma( data[i].saleFee );
					data[i].price_stmemSaleAmt    = NumUtil.setComma( data[i].stmemSaleAmt );
					data[i].price_otFee           = NumUtil.setComma( data[i].otFee );
					data[i].price_feeCnt          = NumUtil.setComma( data[i].feeCnt );

					data[i].officerCd = "${userVo.getOfficerCd()}";

					if(data[i].grpPay == "Y"){
						data[i].price_couponFee  = NumUtil.setComma( data[i].cpnSaleFee );  //쿠폰 적용 가격
						data[i].price_groupFee   = NumUtil.setComma( data[i].saleFee );     //그룹 적용가격
						data[i].price_minSaleFee = NumUtil.setComma( data[i].minSaleFee );
						data[i].discountYn = 'Y';
					}else{
						var minSaleFee = 0;
						if(data[i].minSaleFee > 0) {
							//var minSaleFeeDcAmt = Math.round(data[i].minSaleFee * 0.1448);
							//minSaleFeeDcAmt = Math.ceil(minSaleFeeDcAmt/100) * 100;
							//minSaleFee = String(Number(data[i].minSaleFee) - minSaleFeeDcAmt);
							minSaleFee = String(data[i].minSaleFee);
						} else {
							minSaleFee = 0;
						}

						data[i].price_couponFee = NumUtil.setComma( data[i].cpnSaleFee ); //쿠폰 적용 가격
						data[i].price_groupFee = NumUtil.setComma( minSaleFee );          //그룹 적용가격
						data[i].price_minSaleFee = NumUtil.setComma( data[i].minSaleFee );
						data[i].discountYn = 'Y';
					}

					var tmpGroupFree      = NumUtil.rmComma(data[i].price_groupFee );
				    var tmpPriceCouponFee = NumUtil.rmComma(data[i].price_couponFee );
					var tmpPriceStmemSaleAmt = NumUtil.rmComma(data[i].price_stmemSaleAmt ); //임직원

				    //임직원 가격 > 쿠폰할인 가격 일때 쿠폰할인가격을 노출시킨다 [보류 - 임직원가 그대로 노출]
// 				    if(Number(tmpPriceCouponFee) != 0 && (Number(tmpPriceStmemSaleAmt) > Number(tmpPriceCouponFee))){
// 				    	data[i].price_stmemSaleAmt = data[i].price_couponFee;
// 				    }

					if(Number(tmpPriceCouponFee) != 0 && (Number(tmpGroupFree) > Number(tmpPriceCouponFee))){
						data[i].price_groupFee = data[i].price_couponFee;
						data[i].priceNm        = "쿠폰할인가";
					}else{
						data[i].priceNm        = "할인가";
					}

					data[i].price_maxSaleFee = NumUtil.setComma( data[i].maxSaleFee );
					data[i].price_otPay = NumUtil.setComma( data[i].otPay );
					data[i].itemCd       = data[i].itemCd;
					data[i].dpPrNo       = data[i].dpPrNo;
					data[i].tireFrCd     = data[i].tireFrCd;
					data[i].tireSize     = data[i].listTireSize;
					data[i].tireSizeYn   = $("#tireSizeYn").val();

					data[i].petternCd = data[i].petternCd.replace('\'','_');
					data[i].petternCdNm = data[i].petternCdNm.replace('\'','_');
					data[i].cpnDpYn     = (Number(data[i].minSaleFee) > Number(data[i].cpnSaleFee)) ? "Y" : "N";

					listHtml += tmpl.render( data[i] );
				}
				$("#prdList").html(listHtml);

				//전체 조회 데이터 개수
				$("#totalCnt").html(pageCommon.totalCount);

				//paging
				PageUtil.fnPageMakeDisplay(pageCommon.totalCount, pageCommon.pageNo, $('#paging') , 'evManager.selectPrdList', pageCommon.pageSize);

			} else {
				//상품이 없는 경우
				var html1 = "";
				html1 += "<div class='noDataArea'>";
				html1 += "<p>등록된 상품이 없습니다</p>";
				html1 += "</div>";
				$("#prdList").html(html1);
				//paging
				$("#paging").find("a").remove();
				$("#totalCnt").html(0);
			}
		}
	};
	/* ################################# AJAX CALLBACK ARAR #################################  */


	/* 	var PageScope = {

			init() {

			}

		}; */

	var EventScope = {

		init : function() {
			this.clickEventListener();
		},

		clickEventListener : function() {

			//검색조건1 - 인기순, 고가순, 저가순
			$('[name="orderType"]').on('click', function() {
				$("input[name='orderSpec']").prop("checked" , false);

				var pUrl = "/product/selectPrdList";
				//파라미터는 공통으로 사용 - evManager.listParam()
				evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , "I");
			});

			$('#tireTipGo').on('click', function () {
				location.href = "/news/tireTipList";
			});

			$('#o2oServiceGo').on('click', function () {
				location.href = "/contents/o2oServiceIntro";
			});

			$('#eventAlert').on('click', function () {
				location.href = "/evt/evtList";
			});

			//필터 팝업 - 초기화 버튼 클릭 이벤트
			$('#btnReset').on('click', function () {
				$("#order_pop").prop("checked" , true);
				$("input[name='fSeason']").prop("checked" , true);
				$("input[name='orderSpec']").prop("checked" , false);
				document.getElementById('price-buy-range').noUiSlider.reset();
				document.getElementById('price-rent-range').noUiSlider.reset();
			});

			//필터 팝업 - 적용 버튼 클릭 이벤트
			$('#btnFix').on('click', function () {
				//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
				event.preventDefault();

				$("#pageNo").val("1");
				$("#pageSize").val("20");

				if($("input[name='orderSpec']:checked").val() !== undefined){
					$("input[name='orderType']").prop("checked" , false);
				}

				//조회
				var pUrl = "/product/selectPrdList";
				//파라미터는 공통으로 사용 - evManager.listParam()
				evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , "I");

				//팝업 종료
				evManager.closeFilterPop();
			});

			//필터 팝업 - 초기화 버튼 클릭 이벤트
			$('#btnMore').on('click', function () {
				var lastPageItemCnt = Number($("#totalCnt").text()) % 5;
				var maxPage = Math.floor(Number($("#totalCnt").text()) / 5);

				if(lastPageItemCnt !== 0) {
					maxPage +=1;
				}
				var pageNo = Number($("#pageNo").val());
				var nextPage = String(pageNo + 1);

				if(maxPage == pageNo) {
					nextPage = maxPage;
					alert("마지막 페이지 입니다.");
				} else {
					$("#pageNo").val(nextPage);
					$("#pageSize").val("20");
					var pUrl = "/product/selectPrdList";

					evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , "I");
				}
			});

			//상품상세조회
			$(document).on("click",".thumBox" , function(){
				$("#matCd").val($(this).attr("matCd"));
				$("#frCd").val($(this).attr("frCd"));
				$("#tireFrCd").val($(this).attr("tireFrCd"));
				$("#description").val($(this).attr("description"));
				$("#seasonCd").val($(this).attr("seasonCd"));
				$("#seasonCdNm").val($(this).attr("seasonCdNm"));
				$("#classCd").val($(this).attr("classCd"));
				$("#minSaleFee").val($(this).attr("minSaleFee"));
				$("#maxSaleFee").val($(this).attr("maxSaleFee"));
				$("#otPay").val($(this).attr("otPay"));
				$("#itemCd").val($(this).attr("itemCd"));
				$("#dpPrNo").val($(this).attr("dpPrNo"));

				//전후륜 로직 추가
				var selTireSize = $(this).attr("tireSize");
				var selTireFrCd = $("#tireFrCd").val();
				var selDpPrNo   = $("#dpPrNo").val();
				var selItemCd   = $("#itemCd").val();
				var driveFwd    = $("#driveFwd").val(); //전륜 사이즈
				var driveRwd    = $("#driveRwd").val(); //후륜 사이즈

				var addDpPrNo =""; //추가 전시상품 번호
				var addItemCd =""; //추가 itemCd
				var addMatCd  =""; //추가 matCd
				var ptnDpPrNo ="";
				var ptnItemCd ="";
				var ptnMatCd  ="";
				var sizeDpPrNo ="";
				var sizeItemCd ="";
				var sizeMatCd  ="";

				$.each( $(".thumBox") , function(idx , obj){
					// 선택한 사이즈가 전륜 일경우 후륜 타이어의 정보를 담는다.
					// 1.동일 패턴
					// 2.사이즈
					var objItemCd   = $(obj).attr("itemCd");
					var objMatCd    = $(obj).attr("matCd");
					var objDpPrNo   = $(obj).attr("dpPrNo");
					var objTireSize = $(obj).attr("tireSize");
					var objO2oYn    = $(obj).attr("o2oYn");

					if(objO2oYn == "Y" && selDpPrNo == objDpPrNo ){
						if(selTireFrCd == "F"){ //전륜 일경우 후륜 사이즈 비교
							if(objTireSize == driveRwd ){
								ptnDpPrNo = objDpPrNo;
								ptnItemCd = objItemCd;
								ptnMatCd  = objMatCd;
							}
						}else{ //후륜
							if((objTireSize == driveFwd)){
								ptnDpPrNo = objDpPrNo;
								ptnItemCd = objItemCd;
								ptnMatCd  = objMatCd;
							}
						}
					}

					/*
					//동일 패턴 우선
					if( selDpPrNo != objDpPrNo  && selItemCd != objItemCd && objO2oYn == "Y"){ // 선택한 타이어는 제외
						if(selTireFrCd == "F"){ //전륜 일경우 후륜 사이즈 비교
							if(objTireSize == driveRwd && selDpPrNo == objDpPrNo){
								ptnDpPrNo = objDpPrNo;
								ptnItemCd = objItemCd;
								ptnMatCd  = objMatCd;
							}
						}else{ //후륜
							if((objTireSize == driveFwd) && (selDpPrNo == objDpPrNo)){
								ptnDpPrNo = objDpPrNo;
								ptnItemCd = objItemCd;
								ptnMatCd  = objMatCd;
							}
						}
					}

					else{
						//동일 사이즈  우선
						if(selTireFrCd == "F"){ //전륜 일경우 후륜 사이즈 비교
							if(objTireSize == driveRwd ){
								sizeDpPrNo = objDpPrNo;
								sizeItemCd = objItemCd;
								sizeMatCd  = objMatCd;
							}
						}else{ //후륜
							if(objTireSize == driveFwd){
								sizeDpPrNo = objDpPrNo;
								sizeItemCd = objItemCd;
								sizeMatCd  = objMatCd;
							}
						}
					}
					 */
				});
				addDpPrNo = ValidUtil.isEmpty(ptnDpPrNo) ? sizeDpPrNo : ptnDpPrNo;
				addItemCd = ValidUtil.isEmpty(ptnItemCd) ? sizeItemCd : ptnItemCd;
				addMatCd  = ValidUtil.isEmpty(ptnMatCd)  ? sizeMatCd  : ptnMatCd;

				//console.log("addDpPrNo = "+addDpPrNo);
				//console.log("addItemCd = "+addItemCd);
				//console.log("addMatCd = "+addMatCd);
				$("#addDpPrNo").val(addDpPrNo);
				$("#addItemCd").val(addItemCd);
				$("#addMatCd").val(addMatCd);


				$("#reviewGrdPt").val($(this).attr("reviewGrdPt"));//별점
				$("#reviewCnt").val($(this).attr("reviewCnt"));//리뷰

				//구매 , 렌탈 구분
				var labelType1 = false;
				var labelType2 = false;
				var labelType = "";
				if($(this).find(".purchase").length > 0) {
					labelType1 = true;
				}
				if($(this).find(".rental").length > 0) {
					labelType2 = true
				}
				if(labelType1 && !labelType2 ) {
					labelType = "O";
					$("#petternCd").val($(this).attr("petternCdNm").replace('_','\''));
				} else if(!labelType1 && labelType2 ) {
					labelType = "R";
					$("#petternCd").val($(this).attr("petternCdNm").replace('_','\''));
				} else if(labelType1 && labelType2 ) {
					labelType = "C";
					$("#petternCd").val($(this).attr("petternCdNm").replace('_','\''));
				}
				$("#labelType").val(labelType);

				$("#frm").attr("action" , "/product/prdDetail").submit();
			});

		}
	};
</script>

