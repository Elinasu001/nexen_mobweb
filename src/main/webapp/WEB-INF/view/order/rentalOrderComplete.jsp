<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="order-basket">
        	<!-- header -->
          	<div class="page-header">
            	<h2 class="title-deco">
              		<span>${orderVO.ordrNm}님의</span> <span>탁월한 선택!</span>
            	</h2>
            	<h3 class="title-deco-sub">주문완료</h3>
          	</div>
          	<!-- //header -->

          	<!-- 주문 정보 안내 -->
          	<div class="order-header-message text-center border-bottom">
            	<p id="openEvt">NEXT LEVEL 주문완료 되었습니다.</p>
            	<div class="order-info-summary">
              		<small>주문일자 ${ ordDt}</small>
              		<small>주문번호 ${orderVO.ordrIdxx}</small>
            	</div>
          	</div>
          	<!-- //주문 정보 안내 -->

          	<!-- 상품 목록 -->
          	<section class="order-list-wrap">
            	<article class="order-single inset-ml layout-c border-bottom">
              		<div class="layout-r same-size">
                		<div class="inlnie align-bottom">
                  			<div class="order-data-photo">
                               	<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${orderVO.renThumImg }" alt="타이어 사진">
                  			</div>
                		</div>
                		<div class="inlnie border-bottom order-box">
                  			<div class="order-data-title">
                    			<h3>${orderVO.patternCd}</h3>
                  			</div>
                  			<div class="order-product-info">
                    			<ul class="mb-s">
                      				<li>
                      					<c:if test="${orderVO.classCd  eq 'P1'}">
                      						<span>승용차</span>
                      					</c:if>
                      					<c:if test="${orderVO.classCd  eq 'S1'}">
                      						<span>SUV</span>
                      					</c:if>
                      					<c:if test="${orderVO.classCd  eq 'V1'}">
                      						<span>VAN / 소형트럭</span>
                      					</c:if>
                      					<span>${orderVO.seasonCdNm}</span><span>${orderVO.dispSize}</span></li>
                      				<li><span>${orderVO.makerCdNm}</span><span>${orderVO.modelCdNm}</span></li>
                    			</ul>
                  			</div>
                		</div>
              		</div>
              		<div class="layout-c mt-m">
                		<div class="layout-r inline-s order-rent">
                  			<div class="order-count inline align-middle">
                    			<b class="align-middle">수량</b><span>${orderVO.cntCd }</span>
                  			</div>
                  			<div class="order-rent-info">
                    			<dl class="layout-r">
                      				<dt>렌탈기간</dt>
                      				<%-- <dd>월 렌탈료</dd>
                      				<dd><fmt:formatNumber value="${orderVO.rentalAmt }" pattern="#,###" /></dd> --%>
                    			</dl>
                    			<dl class="layout-r">
                      				<dt><b>${orderVO.periodCd }개월</b></dt>
                      				<%-- <dd>렌탈 등록비</dd>
                      				<dd><fmt:formatNumber value="${orderVO.regiCdAmt }" pattern="#,###" /></dd> --%>
                    			</dl>
                  			</div>
                		</div>
	                	<%-- <div class="order-rent-pay">
	                  		<span><fmt:formatNumber value="${orderVO.sumTotalAmt }" pattern="#,###" /></span>
	                	</div> --%>
              		</div>
				</article>

	            <div class="pt-l pr-ml pl-ml order-total">
	            	<div class="order-total-count layout-r same-size mb-sm">
	                	<span class="inline align-middle">총 렌탈상품</span>
	                	<span class="inline text-right"><b>1</b>건</span>
	              	</div>
	              	<div class="order-total-pay layout-r same-size mb-sm">
	                	<span class="inline align-middle">렌탈 등록비</span>
	                	<span class="inline text-right"><fmt:formatNumber value="${orderVO.regiCdAmt }" pattern="#,###" /></span>
	              	</div>
	              	<div class="order-total-pay layout-r same-size">
	                	<span class="inline align-middle">최종 월 납입 렌탈료</span>
	                	<span class="text-right"><fmt:formatNumber value="${orderVO.rentalAmt + orderVO.addRentAmt }" pattern="#,###" /></span>
	              	</div>
				</div>

	            <div class="rent-footer">
	            	<div class="inset-ml rent-footer-comment">
	                	<ul>
	                  		<li>※ 장착일시 및 주소 변경은 마이넥센 - 나의 주문내역 - 주문 상세 페이지에서 변경 가능합니다.</li>
	                	</ul>
	              	</div>
	            </div>
			</section>
        	<!-- //상품 목록 -->

	        <!-- 버튼 -->
	        <div class="layout-r same-size border-bottom">
	        	<button type="button" class="btn-gray-dark inline inset-m" onclick="javascript:location.href='/main'">홈</button>
	            <button type="button" class="btn-primary inline inset-m" onclick="javascript:location.href='/mypage/orderList'">주문내역</button>
        	</div>
        	<!-- //버튼 -->
		</main>
	</div>
	<!-- //subContentsWrap -->
	
	<input type="hidden" name="orgzCd" id="orgzCd" value="${orderVO.orgzCd }"/>			<!-- 거점코드 : bhfCd -->
	<input type="hidden" name="instCd" id="instCd" value="${orderVO.instCd }"/>			<!-- 장착유형 -->

    <!-- Naver premium service -->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
	<script type="text/javascript"> 
		var _nasa={};
		if(window.wcs) _nasa["cnv"] = wcs.cnv("1", "450000");
	</script> 
	<!-- Naver premium service -->
	
<script type="text/javascript">
$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg order-complete'></div>");
	/* page background image End */

	//$("#ordNm").text("${orderVO.ordrNm}");
	
	// 역삼점 오픈을 위한 임시 
	var orgzCd = $('#orgzCd').val();
	var instCd = $('#instCd').val();
	
	var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    
    var today = year + month + day;
    var startDay = 20210331;
    var endDay = 20210630;
    
	// 이벤트 팝업날짜.
    if(today < endDay && today > startDay) {
		if(orgzCd == "114883" && instCd == "40") {
			$("#openEvt").text("NEXT LEVEL 역삼점 주문완료 되었습니다.");
			ComUtil.confirm("[역삼점 예약 완료] </br> 매장 방문만 해도 선물이 팡팡! </br> 넥스트레벨 역삼점 오픈 이벤트를 확인하세요.","",
					function() {
				window.location.href = "/evt/evtDetail?bdojSeq=54914&tabNo=11";
			},function() {
				window.close();}
				,"이벤트페이지 이동","닫기",function() {
			});
		}
 	}
});
</script>