<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>


		<form id="frm" name="frm" method="post" >
			<!-- paging -->
			<input type="hidden" name="pageNo"		id="pageNo"	value="${pageCommon.pageNo}"/>		<!-- 현재 페이지 -->
			<input type="hidden" name="pageSize"	id="pageSize" 	value="10" />		<!-- 페이지에 표시할 수 -->
		</form>



       <!-- subContentsWrap -->
      <div class="subContentsWrap">
        <main class="mynexen">
          <!-- header -->
          <div class="page-header empty">
            <h2 class="title-deco">
              <span>책임지고</span> <span>관리합니다</span>
            </h2>
            <h3 class="title-deco-sub">나의 렌탈 관리</h3>
          </div>
          <!-- //header -->

          <div class="inset-m pt-0">
            <div class="my-rental-wrap">
              <ul>
                <li>
                  <!--나의 렌탈정보-->
                  <div class="my-rental">
                    <dl>
                      <dt class="title">이용중인 렌탈</dt>
                      <dd class="">
                        <span class="infor num">${fn:length(payList) }</span><em>건</em>
                        <%-- <a href="#" class="go-view"></a> --%>
                      </dd>
                    </dl>
                    <dl>
                      <dt class="title">총 렌탈</dt>
                      <dd class="">
                        <span class="infor num">${endCnt}</span><em>건</em>
                        <%-- <a href="#" class="go-view"></a> --%>
                      </dd>
                    </dl>
                    <dl>
                      <dt class="title">총 주문금액</dt>
                      <dd class="total">
                        <span><fmt:formatNumber value="${totSumAmt}" pattern="#,###" /></span>
                      </dd>
                    </dl>
                    <dl>
                      <dt class="title">이번달 렌탈료 청구 금액</dt>
                      <dd class="total">
                        <span><fmt:formatNumber value="${totRentAmt }" pattern="#,###" /></span>
                      </dd>
                    </dl>
                  </div>
                  <!--나의 렌탈정보-->
                </li>
                <li>
                  <!--나의 렌탈정보-->
                  <div class="my-rental">
                    <dl>
                      <dt class="title">납부 연체된 렌탈</dt>
                      <dd>
                        <span class="">${fn:length(myOverdueMapList) }</span><em>건</em>
                        <%-- <a href="#" class="go-view"></a> --%>
                      </dd>
                    </dl>
                    <dl>
                      <dt class="title">연체금 청구 금액</dt>
                      <dd class="total">
                        <span><fmt:formatNumber value="${myOverdueMap.arreAmt }" pattern="#,###" /></span>
                      </dd>
                    </dl>
                  </div>
                  <!--나의 렌탈정보-->
                </li>
              </ul>
              <!-- <div class="text-right">
                <a href="#" class="overdue">전체 연체금 납부안내</a>
              </div> -->
            </div>
          </div>


			  <c:choose>
          			<c:when test="${ fn:length(rentalList) > 0}">
			          <div class="mynexen-rental-list-wrap">
          				<c:forEach var="list" items="${rentalList}" varStatus="status">

			            <!-- Type01 -->
						<div class="order-info-summary-wrap">
			              <div class="order-info-summary col-1">
			                <small>주문일자 ${list.ORD_DAY }</small>
			                <small>${list.chanNm } </small>
			              </div>
			              <div class="align-middle">
			                <a href="#none" class="mynexen-detail" onclick="goDetail('${list.ordNo}');">상세</a>
			              </div>
			            </div>

			            <article class="order-single inset-m layout-c">
			                  <a href="#none" class="mynexen-link" onclick="goDetail('${list.ordNo}');"></a>
			                  <div class="layout-r same-size">
			                    <div class="inlnie align-bottom">
			                      <div class="order-data-photo">
			                        <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${list.atflPathNm}" alt="${list.saleNm}" >
			                      </div>
			                    </div>
			                    <div class="inlnie border-bottom order-box">
			                      <div class="order-data-title">
			                        <h3>${list.ordNo}</h3>
			                        <h4>${list.saleNm}</h4>
			                      </div>

			                      <div class="layout-rwd">
			                        <!-- <button type="button" class="go-view">서비스내역</button> -->
			                        <div class="order-count layout-r">

			                          <b class="align-middle">수량</b> <span class=" align-middle">${fn:replace(list.cntNm,'본','') }</span>
			                        </div>
			                      </div>

			                    </div>
			                  </div>
			                  <div class="layout-c mt-m">
			                    <div class="layout-rwd order-rent">
			                      <div class="order-rent-info">
			                        <dl class="layout-r">
			                          <dt>월 렌탈료</dt>
			                          <dd><fmt:formatNumber value="${list.MON_AMT }" pattern="#,###" /></dd>
			                        </dl>
			                        <dl class="layout-r">
			                          <dt>렌탈기간</dt>
			                          <dd>${list.periodNm}<small>(${list.procDay} ~ ${list.osDay})</small></dd>
			                        </dl>
			                      </div>
			                    </div>
			                  </div>
			                </article>

				            <div class="inset-m pt-0">
				            
						    	<div class="layout-r">
						      		<div class="col-1">
						      			<span class="round finish" onclick="goDetail('${list.ordNo}');">상세페이지</span>
						      		</div>
						      		<div class="layout-c">
						                <c:if test="${ list.STAT_NM eq '계약진행'}" >
						                  <span class="round finish">${list.STAT_NM}</span>
						                </c:if>
						                <c:if test="${ list.STAT_NM ne '계약진행'}" >
						                  <span class="round finish">${list.STAT_NM}</span>
						                </c:if>
						                <fmt:parseNumber var="arreCnt" type="number" value="${list.arreCnt}" />
						                <c:if test="${arreCnt > 0}">
					                      <span class="my-rental-util-info">${list.arreCnt}개월 연체</span>
					                    </c:if>
						      		</div>
						      	</div>
				            
				            <%-- 
				              <div class="align-right">
				                <div class="my-rental-util-box">
					                <c:if test="${ list.STAT_NM eq '계약진행'}" >
					                  <span class="round finish">${list.STAT_NM}</span>
					                </c:if>
					                <c:if test="${ list.STAT_NM ne '계약진행'}" >
					                  <span class="round finish">${list.STAT_NM}</span>
					                </c:if>
					                <fmt:parseNumber var="arreCnt" type="number" value="${list.arreCnt}" />
					                <c:if test="${arreCnt > 0}">
				                      <span class="my-rental-util-info">${list.arreCnt}개월 연체</span>
				                    </c:if>
				                </div>
				              </div>
				               --%>
				            </div>
			            <!-- //Type01 -->
		          	</c:forEach>
					</div>
          			</c:when>
          			<c:otherwise>
          				 <!-- No Data -->
				          <div class="no-data">
				            <div class="alert text-center inset-xl">
				              <img src="/img/common/pop_alert_01.png" alt="">
				              <p class="mb-m"><span>이용중인 렌탈 상품이 없습니다</span></p>
				            </div>
				          </div>
				          <!-- //No Data -->
          			</c:otherwise>

          		</c:choose>




          <!-- <div class="mb-m">
            <button class="list-more full-width inset-m border-top">
              <span>더보기</span>
            </button>
          </div> -->




        </main>
      </div>
      <!-- //subContentsWrap -->



	<script type="text/javascript" src="/js/lib/classie.js"></script>

<script type="text/javascript">
	var evManager = {

	}

	function selectMyRentalList(pageNo) {
		location.href = "/mypage/myRentalList?pageNo="+pageNo;
	}


	function goDetail(ordNo) {
		location.href= "/mypage/myRentalDetail?ordNo="+ordNo;
	}

	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg mynexen-worryzero'></div>");
		/* page background image End */

		//init 함수 호출

		//paging
   		PageUtil.fnPageMakeDisplay("${pageCommon.totalCount}", $("#pageNo").val() ,  $('#paging') , 'selectMyRentalList', 10);
	});
</script>

