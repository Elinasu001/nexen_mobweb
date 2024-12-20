<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>
<%@ page import="com.nexwrms.core.util.SessionUtil" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="/css/main.css"/>


<!-- subContents Start -->
<!-- 배너영역 -->
<div class="mbannerWrap" style="display:none;">
	<a href="#;" class="btnClose">닫기</a> <!-- 검정 버튼일때 black -->
	<div class="item" id="mainBanner">
	</div>
</div>
<!-- 배너영역 -->

<div id="fullpage">
	<div class="section" id="section0">
		
		<c:if test="${not empty mainImg}">
			<div class="main-caroucel">
				<c:forEach var="main" items="${mainImg}">
					<div class="main-caroucel-item">
						<c:choose>
							<c:when test="${not empty main.linkUrl}">
								<a href="${main.linkUrl}">
									<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${main.imgUrl}" width="750" height="1012"/>
								</a>
							</c:when>
							<c:otherwise>
								<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${main.imgUrl}" alt=""/>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
				<!-- <div class="main-caroucel-item">
					<img src="/img/main/event_popup/20201202_m_popup_3.png" width="750" height="1012"/>
				</div> -->
<!-- 				<div class="main-caroucel-item">  -->
<!-- 					<a href="/evt/evtDetail?bdojSeq=48013&tabNo=11"><img src="/img/main/main_visual_20210107.jpg" width="750" height="1012"/></a> -->
<!-- 				</div> -->
<!-- 				<div class="main-caroucel-item">  -->
<!-- 					<img src="/img/main/main_visual_01.jpg?v15" width="750" height="1012"/> -->
<!-- 				</div> -->
<!-- 				<div class="main-caroucel-item">  -->
<!-- 					<img src="/img/main/main_visual_02.jpg?v15" width="750" height="1012"/> -->
<!-- 				</div> -->
<!-- 				<div class="main-caroucel-item"> -->
<!-- 					<img src="/img/main/main_visual_03.jpg?v15" width="750" height="1012"/> -->
<!-- 				</div> -->
<!-- 				<div class="main-caroucel-item"> -->
<!-- 					<img src="/img/main/main_visual_04.jpg?v15" width="750" height="1012"/> -->
<!-- 				</div> -->
			</div>
		</c:if>
		
		<div class="find-size">
			<!--//[20241220 퍼블] 클래스 .sizeAdjust 추가, 이미지 삭제-->
			<div class="find-size-warp sizeAdjust">
				<div><a onclick="chkCarNum(document.getElementById('mainSizeNumInput'))">차량번호</a></div>
				<div><a onclick="openSizeFinder( 'car' );">차종</a></div>
				<div><a onclick="openSizeFinder( 'size' );">사이즈</a></div>
				<div><a >렌탈전문점</a></div>
			</div>
			<!--[20241220 퍼블] 이미지 삭제//-->

			<div class="car-num-form">
				<div class="input-wrap">
					<!-- <form onsubmit="openSizeFinder( 'num', $('#mainSizeNumInput').val()  ); return false;"> -->
					<input type="text" placeholder="차량 번호를 입력해주세요. ex) 12차 9876" id="mainSizeNumInput" maxlength="9" onblur="javascript:validationCmmCarNo(this);">
					<button onclick="chkCarNum(document.getElementById('mainSizeNumInput'))" ><img src="/img/main/btn_carnum_form.png" alt="" /></button>
					<!-- </form> -->
				</div>
			</div>

		</div>
	</div>


	<div class="section" id="section4">
		<div class="mContent">
			
			
			<div class="section-titie">
				<h3>TV CF</h3>
			</div>
			
			<div class="video-caroucel">
				<!-- 23/07 10233006 추현욱 동영상 노출 동적 처리 개발
				<div class="video-item">
						<a href="https://www.youtube.com/embed/Mp0kl5UHyAU?rel=0&showinfo=0">
							<div class="thumb"><img src="https://i1.ytimg.com/vi/Mp0kl5UHyAU/mqdefault.jpg"></div>
							<span>넥센에게 시키세요_ Next Level GO 편</span>
						</a>
				</div>
				<div class="video-item">
						<a href="https://www.youtube.com/embed/rOeYQn-qQuE?rel=0&showinfo=0">
							<div class="thumb"><img src="https://i1.ytimg.com/vi/rOeYQn-qQuE/mqdefault.jpg"></div>
							<span>넥센에게 시키세요_ Next Level Rental 편</span>
						</a>
				</div>
				<div class="video-item">
						<a href="https://www.youtube.com/embed/zZM1bM2ZnRs?rel=0&showinfo=0">
							<div class="thumb"><img src="https://i1.ytimg.com/vi/zZM1bM2ZnRs/mqdefault.jpg"></div>
							<span>넥스트레벨GO - 비대면 방문 교체 서비스 신청부터 방문 교체까지</span>
						</a>
				</div>
				<div class="video-item">
						<a href="https://www.youtube.com/embed/9ZnUfbJYbbM?rel=0&showinfo=0">
							<div class="thumb"><img src="https://i1.ytimg.com/vi/9ZnUfbJYbbM/mqdefault.jpg"></div>
							<span>넥스트레벨 렌탈 - 언제 어디서나 간편하게 타이어 렌탈 서비스 신청 방법</span>
						</a>
				</div>
				23/07 10233006 추현욱 동영상 노출 동적 처리 개발 -->
			</div>
		</div>
		
	</div>


	<c:if test="${not empty reViewListNew}">
	<div class="section" id="section1">
		<div class="section-titie">
			<h3>Reviews</h3>
		</div>

		<div class="review-caroucel">
			<c:forEach var="review" items="${reViewListNew}">
			<a href="/product/prdDctDetail?dpPrNo=${review.dpNo}&itemCd=${review.itemCd}&usePsNo=${review.usePsNo}&patternCd=${review.patternCd}#tab03">
				<div class="review-item <c:if test='${empty mainReviewAtflList}'>no-pic</c:if>">
					<div class="review-head">
						<div class="review-type">
							<div class="buy-type ${review.ordChn}"></div>
							<!-- <div class="buy-type R after-m"></div> -->  <!-- 한달후기 -->
						</div>
						<div class="review-title">
							<div class="logo">
									<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.logoDtlImgUrl}"/>
							</div>
							<div class="star-box">
								<c:set var="totStars" value="${empty review.totStarsSeCd || review.totStarsSeCd == 'null' ? 0.0 : review.totStarsSeCd }" />
								<fmt:parseNumber var="totStarSe" type="number" value="${totStars}" integerOnly="true"/>
								<div class="star star-${totStarSe}"></div>
							</div>
						</div>
					</div>
	
					<div class="service-info">
						<div class="title">${review.title}</div>
						<div class="rec-box">
							<div class="thumb_up">${review.rcmdCnt}</div>
						</div>
						<div class="car-box">${review.carInfo} <c:if test="${not empty review.carInfo}">|</c:if> ${review.dispSize}</div>
						<c:if test="${review.dlvTyDtlCd == 1030}">
							<div class="service-box">${review.procDueBhfNm} | ${review.dlvTyDtlCdNm}</div>
						</c:if>
						<c:if test="${review.dlvTyDtlCd != 1030}">
							<div class="service-box">GO서비스 | ${review.dlvTyDtlCdNm}</div>
						</c:if>
					</div>
					
					<div class="body">
						<div class="text" style="white-space:pre-line;">
							${review.contents}
						</div>
						<div class="picture">
	<!-- 						<div class="vod"><img src="/img/product/review_sample_01.jpg"></div> -->
							<c:forEach var="atflList" items="${mainReviewAtflList}">
								<c:if test="${not empty atflList.atflUrl}">
									<c:if test="${atflList.usePsNo == review.usePsNo}">
										<div class=""><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${atflList.atflUrl}"></div>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div>
	
					<div class="review-footer">
						<div class="writ-info">
							<fmt:parseDate value="${review.regDe}" var="reviewDate" pattern="yyyyMMdd"/>
							<div class="date"><fmt:formatDate value="${reviewDate}" pattern="yyyy.MM.dd"/></div>
							<div class="writer">${review.custNm}</div>
						</div>
					</div>
				</div>
			</a>
			</c:forEach>
		</div>
<!-- 

				<div class="review-item">
					<div class="buy-type O"></div>
					<div class="writer">타이어교체 후기</div>
					<div class="purchase">
						NFERA AU5
						<span>|</span>
						sks6***
					</div>
					<div class="star star-5"></div>
					<div class="text">
						'타이어 방문교체'
						넥센의 새로운 시도 신선한 충격이네요.
						약속된 시간에 정확히 방문해서  교체완료.
						광명점에서 나오신 기사님들도 너무친절 하였고  타이어 위치교환도 부탁했더니  원래  안되는 서비스인데 흔쾌히 들어주셨어요. 앞으로 계속 이용하겠습니다...
					</div>
				</div>
			-->
	</div>
	</c:if>

	<div class="section" id="section1">
<!-- 수현 추가    MainList 기능 -->
<!-- 여기서 부터 주석 푸시면 됩니다. 주석 시작 

			<div class="section-titie">
				<h3>Reviews</h3>
			</div>
			<div class="review-caroucel">
			<c:forEach var="list" items="${reViewList}" varStatus="status">
				<div class="review-item">
					<div class="buy-type ${list.ordChn}"></div>
					<div class="writer">
					<a href="javascript:;" onclick="javascript:reviewDetail()">${list.title}</a></div>
					<div class="purchase">
					${list.ptRn }
						<span>|</span>
						${list.regUsrId }***
					</div>
					<div class="star star-${list.grdPt1}"></div>
					<div class="text">
					${list.contents}
					</div>
				</div>
				</c:forEach>
			</div>
			주석 끝 -->

		<div class="event-banner" style="background-color: #202759;" >
			<div class="banner-wrap" >
				<div class="banner-item"><a href="/evt/evtList"><img src="/img/main/review_banner_01.jpg"/></a></div>
				<div class="banner-item"><a href="/bbs/counselRegister"><img src="/img/main/review_banner_02.jpg"/></a></div>
			</div>
		</div>
	</div>
	

	<div class="section" id="section2">

		<div class="section-titie">
			<h3>투데이 특가</h3>
		</div>
		
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyyMMdd" /></c:set> 
		<fmt:formatNumber value="${date}" type="number" var="dataNum" groupingUsed="false"/>

		<div class="specialprice-caroucel">
			<!-- 1 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000000112&itemCd=15395NXUA&patternCd=NPRIZ AH8">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/43ecc2b5-f9fe-45e9-974a-8e529978367f.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_ah8.png" alt="" /></div>
					<div class="product-size">205/55R16</div>
					<div class="product-price">
						<div class="buy-price">
						<span class="org_price">￦119,300</span>
						<span class="dc_price">￦83,600</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 2 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000000112&itemCd=12993NXUA&patternCd=NPRIZ AH8">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/43ecc2b5-f9fe-45e9-974a-8e529978367f.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_ah8.png" alt="" /></div>
					<div class="product-size">215/55R17</div>
					<div class="product-price">
						<div class="buy-price">
						<span class="org_price">￦139,900</span>
						<span class="dc_price">￦98,000</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 3 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000003126&itemCd=18288NX&patternCd=NF Supreme">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/5bfaf73f-8d52-40c1-add0-70c284f6fff0.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_supreme.png" alt="" /></div>
					<div class="product-size">225/55R17</div>
					<div class="product-price">
						<div class="buy-price">
							<span class="org_price">￦227,800</span>
							<span class="dc_price">￦148,100</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 4 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000003126&itemCd=18266NX&patternCd=NF Supreme">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/5bfaf73f-8d52-40c1-add0-70c284f6fff0.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_supreme.png" alt="" /></div>
					<div class="product-size">245/45R18</div>
					<div class="product-price">
						<div class="buy-price">
							<span class="org_price">￦265,500</span>
							<span class="dc_price">￦172,600</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 5 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000000112&itemCd=16938NXUA&patternCd=NPRIZ AH8">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/43ecc2b5-f9fe-45e9-974a-8e529978367f.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_ah8.png" alt="" /></div>
					<div class="product-size">205/60R16</div>
					<div class="product-price">
						<div class="buy-price">
						<span class="org_price">￦154,800</span>
						<span class="dc_price">￦108,400</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 6 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000000131&itemCd=17042NXUA&patternCd=ROADIAN GTX">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/5d965d12-cf1d-45ec-a315-aee568857093.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_gtx.png" alt="" /></div>
					<div class="product-size">225/55R18</div>
					<div class="product-price">
						<div class="buy-price">
						<span class="org_price">￦168,400</span>
						<span class="dc_price">￦117,900</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 7 -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000000131&itemCd=17569NXUA&patternCd=ROADIAN GTX">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/5d965d12-cf1d-45ec-a315-aee568857093.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_gtx.png" alt="" /></div>
					<div class="product-size">235/60R18</div>
					<div class="product-price">
						<div class="buy-price">
						<span class="org_price">￦214,900</span>
						<span class="dc_price">￦150,500</span>
						</div>
					</div>
				</span>
			</a>
			<!-- 8  -->
			<a class='main-product-item' href="/product/prdDctDetail?dpPrNo=DP0000000003127&itemCd=18291NX&patternCd=NF Supreme SUV">
				<span>
					<div class="product-image"><img src="https://www.nexen-nextlevel.com/atprdfile_cms/a838c1c0-fcb1-4d63-9289-fb33156242cc.png" alt="" /></div>
					<div class="product-brand"><img src="/img/main/main_brand_logo_nexen.png" alt="" /></div>
					<div class="product-logo"><img src="/img/main/product_logo_supreme_suv.png" alt="" /></div>
					<div class="product-size">235/55R19</div>
					<div class="product-price">
						<div class="buy-price">
							<span class="org_price">￦221,100</span>
							<span class="dc_price">￦143,800</span>
						</div>
					</div>
				</span>
			</a>
		</div>

	</div>
	
	<div class="section" id="section3">


		<div class="service-item">
			<div class="service-image"><a href="/contents/o2oServiceIntro#tab01"><img src="/img/main/service_01.jpg"" alt="" /></a></div>
		</div>
		<!-- <div class="service-item">
			<div class="service-image"><a href="/contents/o2oServiceIntro#tab02"><img src="/img/main/service_02.jpg"" alt="" /></a></div>
		</div> -->
		<div class="service-item">
			<div class="service-image"><a href="/contents/o2oServiceIntro#tab03"><img src="/img/main/service_03.jpg"" alt="" /></a></div>
		</div>
		<div class="service-item">
			<div class="service-image"><a href="/contents/rentalServiceIntro"><img src="/img/main/service_04.jpg"" alt="" /></a></div>
		</div>

	</div>
</div>
	
<!--  수현 추가 팝업 창  화면 -->
<!-- 여기서부터 주석 푸시면 됩니다. 주석시작 
<div class="popupWrap md-modal md-effect-1 " id="o2ojangchackGuide">
    <div class="popContents ">
        <header>
		    <h2>상세 리뷰 <a href="javascript:fn_mainListClose();" class="layPopClose md-close"></a></h2>   
		</header>
		<div class="popup-contents inset-m">
        	<div class="mounting">
				<h3>수현이가 추천합니다!!!!</h3>
					<p></p>
				<h3> NFERA AU5	| kyp***</h3>
						<p></p>			

				<h3> 방문장착 서비스 칭찬합니다.</h3>
				<p>	넥센 타이어는 처음이라 조금은 망설였는데... 대만족 입니다. 소비자 입장에서는 좋은 제품을 싸게 원하는 시간에 구매하길 원하는데 넥센에서는 모든걸 만족해주었습니다. 다음에도 또 구매 의사 있습니다.</p>
			</div>
		</div>
   </div>
</div>
 주석 끝 -->
	<!-- subContents End -->
	
	
	
	
<div class="event-modal">
	<div class="modal-wrap">
		<div class='close-btn'>
			<a onclick="$('.event-modal').hide()"><img src="/img/common/close-white.png"></a>
		</div>
			<div class="modal-body">
				<!-- <a href="https://m.nexen-nextlevel.com/evt/evtDetail?bdojSeq=31028&tabNo=11"><img src="/img/event/main_event_2020810.jpg"/></a> -->
				<img src="/img/event/main_event_20200901.jpg"/>
			</div>
	</div>
</div>




<c:if test="${not empty mainPopupImg}">
<div class="event-popup">
	<div class="popup-wrap">
		<div class="popup-box">
			<div class="popup-body">
				<c:forEach var="popup" items="${mainPopupImg}">
					<a href="${popup.linkUrl}" target="_blank"><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${popup.imgUrl}"/></a>
				</c:forEach>
<!-- 				<a href="/evt/evtDetail?bdojSeq=48013&tabNo=11" target="_blank"><img src="/img/main/event_popup/2021_01_event_1.png"/></a> 1월 이벤트  -->
		 		<!-- <a href="/evt/evtDetail?bdojSeq=43115&tabNo=11" target="_blank"><img src="/img/main/event_popup/20201102_popup_2.png"/></a>  -->
				<!-- <a href="#"><img src="/img/main/event_popup/20200910_popup.jpg" style="margin-left:-1px;"/></a> -->
				<!-- <img src="/img/main/event_popup/20200810_popup.jpg"/> -->
			</div>
			<div class="popup-tail">
				<a href="javascript:;" onclick="close_event_popup( true )"><img src="/img/main/event_popup/today.png"/></a>
				<a href="javascript:;" onclick="close_event_popup( false )"><img src="/img/main/event_popup/close.png"/></a>
			</div>
		</div>
	</div>
</div>
</c:if>





	<%-- <script type="text/javascript" src="/js/lib/jquery.fullPage.js"></script>     --%>
	<script type="text/javascript" src="/js/main.js?v15"></script>
	
	<script type="text/javascript">
		var niceGradeCd = new Array();
		var loginId = "${loginId}";
		var bannerCnt = "${bannerCnt}";
		
		$(document).ready(function(){
			var carSh = location.search;
			if(carSh == "?carSh=num") {
				javascript:openSizeFinder('num');
			}
			
			// main 개발자 콘솔 undefined 에러 임시 해결방안
			var popUn = "${mainPopupImg}"; // 값이 없을때 []
			if(popUn == "[]" || popUn == "") {
				close_event_popup(true);
			}
			
			var bannerData = {
				imgPrposSeCd : "10"
			};
			
			/* 다른화면에서 넘어온 에러문구 파라메터 */
			var error = '${error}';
			
			if(error != '' && error != null ){
				alert(error)
				error == '';
			}	
			/* 다른화면에서 넘어온 에러문구 파라메터 */
			
			bannerData = JSON.stringify(bannerData);
			$.ajax({
				type: "POST" ,
				url:"/main/mainBannerImg",
				cache:false,
				data: bannerData,
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					/* 23/07 10233006 추현욱 동영상 노출 동적 처리 개발 */
					var videos = cfnRequestSuccessCallback("selectMainBannerImg", data);
					
					$('.video-caroucel').slick('slickRemove');
					$('.video-caroucel').slick('slickAdd', videos);
					/* 23/07 10233006 추현욱 동영상 노출 동적 처리 개발 */
				}
			})
		})
		
		function btnCarNumber() {
			if(loginId == "") {
				alert("로그인 후 사용 가능합니다.");
				location.href = "/login/userLogin";
				return;
			} else {
				location.href="/product/prdList?viewGbn=M";
			}
		}
		
		function fn_goToPrdList() {
			window.location.href="/product/prdList";
		}
		
		//띠 배너
		var TBLng;
		var TBCnt = 1;
		var TBIntervalCnt = 0;
		var TBLeft;
		var TBRight;
		var RollingTime = 2500;
		var TBRolling;
		
		function cfnRequestSuccessCallback(callback, result){
			if (callback == "selectMainBannerImg") {
				if (result.rtnCode == 0) {
					var data = result.selectMainBannerImg;
					var linkUrl;
					var htmlStr = "";
					if (data.length > 0) {
						for(var i=0; i < data.length; i++) {
							linkUrl = data[i].linkUrl;
							if (ValidUtil.isEmpty(linkUrl)){
								linkUrl = "#;";
							}
							htmlStr +="	<a href='"+linkUrl+"' style='background:url(<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>"+data[i].imgUrl.replaceAll('\\','/')+") center top no-repeat; background-size:100% 50px'></a>";
						}
						$("#mainBanner").html(htmlStr);
						
						// 롤링셋팅
						TBLng = $('.mbannerWrap > .item > a').length;
						TBCnt = 1;
						TBIntervalCnt = 0;
						TBLeft = $('.mbannerWrap').find('.left');
						TBRight = $('.mbannerWrap').find('.right');
						
						// 배너 컨트롤 초기화
						if (TBLng < 2)
						{
							$('.mbannerWrap').find('.counter').hide();
							$('.mbannerWrap').find('.btns').hide();
						}
						$('.mbannerWrap').find('.allcnt').html(TBLng);
						
						if (TBLng > 1)
						{
							TBRolling = StartInterval();
						}
						
						$(".mbannerWrap").show();
					}
					
					/* 23/07 10233006 추현욱 동영상 노출 동적 처리 개발 */
					var videos = result.selectMainVideos;
					var videoUrl;
					var imgUrl;
					var rm;
					var videoHtmlStr = "";
					if(videos.length > 0) {
						for(var i=0; i < videos.length; i++) {
							videoUrl = videos[i].linkUrl;
							imgUrl = videos[i].imgUrl;
							rm = videos[i].rm;
							
							videoHtmlStr += "<div class='video-item'>"
												+ "<a href='" + videoUrl + "'><div class='thumb'><img src='" + imgUrl + "'></div>"
										  		+ "<span>" + rm + "</span>"
										  		+ "</a>"
										  + "</div>";
							
						}
						return videoHtmlStr;
					/* 23/07 10233006 추현욱 동영상 노출 동적 처리 개발 */
					}
					
				}
			}
		}
		// 배너 -- end
		
		//topbanner close
		$('.mbannerWrap').find('.btnClose').on('click', function(){
			
			//$('#nomore').prop("checked") ? setCookie("no_tb", "y", "7") : setCookie("no_tb", 0, 0);
			StopInterval();
			$('.mbannerWrap').remove();
		});
		
		function StartInterval() {
			i = setInterval(function(){
				TBCnt++;
				if (TBCnt == TBLng + 1)
				{
					TBCnt = 1;
				}
				TBL(TBCnt);
			},RollingTime);
			return i;
		}
		
	/* 	주석 시작 
		// 팝업창 생성 기능  수현추가
		function reviewDetail() {
			  
			 $('#o2ojangchackGuide').addClass("md-show");
				}
		// 수현 끝 
		
		// 팝업창 제거 기능  수현 추가 부분 
		function fn_mainListClose(){
		$("#o2ojangchackGuide").removeClass("md-show");
		}
		// 수현 끝
	 
		주석 끝 */
		
		//롤링 시작
		function restartRolling(){
			TBRolling = StartInterval();
		}
		
		// 재생정지
		function StopInterval(){
			clearInterval(TBRolling);
		}
		
		function TBL(TBCnt) {
			$('.mbannerWrap > .item > a').hide();
			$('.mbannerWrap > .item > a').eq(TBCnt - 1).show();
			$('.mbannerWrap').find('.now').html(TBCnt);
		}
		//TopRollingBanner End
		
	</script>

	<!-- Naver Analytics -->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		// 네이버 애널리틱스
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "86b7aa256bebb8";
		wcs_do();
	</script>
	<!-- Naver Analytics -->
	
	<!-- Facebook Pixel Code -->
	<script>
	!function(f,b,e,v,n,t,s)
	{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
	n.callMethod.apply(n,arguments):n.queue.push(arguments)};
	if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
	n.queue=[];t=b.createElement(e);t.async=!0;
	t.src=v;s=b.getElementsByTagName(e)[0];
	s.parentNode.insertBefore(t,s)}(window,document,'script','https://connect.facebook.net/en_US/fbevents.js');
	fbq('init', '1108490266577703'); 
	fbq('track', 'PageView');
	</script>
	
	<noscript>
		<img height="1" width="1" src="https://www.facebook.com/tr?id=1108490266577703&ev=PageView&noscript=1"/>
	</noscript>
	<!-- End Facebook Pixel Code -->
	
	<!-- ADN 메인패널 설치 start -->
	<script type="text/javascript">
	var adn_mobile_pinad_param = adn_mobile_pinad_param || [];
	adn_mobile_pinad_param.push([{
	 ui:'107378',	
	 ci:'1073780002',
	 gi:'102653'
	}]);
	</script>
	<script type="text/javascript" async src="//fin.rainbownine.net/js/across_adn_mainpanel_mobile_ad_1.0.4.js"></script>
	<!-- ADN 메인패널 설치 end -->
	
	<!-- 인터웍스 -->
	<script type="text/javascript"><!--
		var iwm_ads_id='nexentire', iwm_ads_label='*main';
		//-->
	</script>
	<script type="text/javascript" src="//cdn.interworksmedia.co.kr/js/conversion.min.js"></script>
	<!-- 인터웍스 -->