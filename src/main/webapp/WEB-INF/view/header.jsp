<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>
<%@ page import="com.nexwrms.core.util.SessionUtil" %>
<c:set var="pathname" value="${requestScope['javax.servlet.forward.request_uri']}" />



<!-- allWrap -->
	<!-- topArea -->
	<div class="topAreaWrap <c:if test="${pathname == '/product/prdList'}">fixwhite</c:if> <c:if test="${pathname == '/order/orderRental'}">fixwhite</c:if> <c:if test="${pathname == '/order/orderPurchase'}">fixwhite</c:if> <c:if test="${pathname == '/product/prdDetail'}">fixwhite</c:if><c:if test="${pathname == '/product/prdDctDetail'}">fixwhite</c:if>">
		<div class="topArea">
			<c:choose>
				<c:when test="${pathname == '/main'}">
					<header>
	 					<h1>
	                        <a href="/main" class="logo">Next Level</a>
	                    </h1>
	                    <div class="rTopBtn">
		            		<a href="#" class="allMenu">전체메뉴</a>
		            		<%-- <a href="/cart/cartView" class="basket">장바구니</a> --%>
		          		</div>
                    </header>
				</c:when>
				<c:otherwise>
					<div class="topArea-outer">
						<c:choose>
						    <c:when test="${pathname == '/login/userLogin'}">
								<h1 class="topArea-pageTitle"></h1>
								<a href="/main" class="logo">Next Level</a>
								<!-- <button class="topArea-back" onclick="location.href='/main'">뒤로가기</button> -->
						    </c:when>
						    <c:when test="${pathname == '/cart/cartView'}">
								<h1 class="topArea-pageTitle">장바구니</h1>
								<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/order/orderPurchase' or pathname == '/order/orderRental'}">
								<h1 class="topArea-pageTitle">주문서 작성/결제</h1>
			            		<button class="topArea-back" onclick="history.back();">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/product/prdList'}">
								<h1 class="topArea-pageTitle">타이어</h1>
								<button class="topArea-back" onclick="goBack();">뒤로가기</button>
							</c:when>
						    <c:when test="${pathname == '/product/prdDetail'}">
								<h1 class="topArea-pageTitle">타이어</h1>
								<button class="topArea-back" onclick="history.back();">뒤로가기</button>
							</c:when>
						    <c:when test="${pathname == '/product/prdDctDetail'}">
								<h1 class="topArea-pageTitle">타이어</h1>
								<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
							</c:when>
						    <c:when test="${pathname == '/mypage/orderRivew' or pathname == '/mypage/orderRivewView' }">
								<h1 class="topArea-pageTitle">주문후기</h1>
			            		<button class="topArea-back" onclick="location.href='/mypage/orderList'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/bbs/noticeList'}">
								<h1 class="topArea-pageTitle">공지사항</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/bbs/noticeDetail'}">
								<h1 class="topArea-pageTitle">공지사항</h1>
			            		<button class="topArea-back" onclick="location.href='/bbs/noticeList'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/orderList' }">
								<h1 class="topArea-pageTitle">주문내역</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/questionList' or pathname == '/mypage/questionDetail' or pathname == '/mypage/questionRegister'}">
								<h1 class="topArea-pageTitle">1:1문의</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/bbs/specialDealerSearchList'}">
								<h1 class="topArea-pageTitle">렌탈 전문점 찾기</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/couponList' }">
								<h1 class="topArea-pageTitle">나의 쿠폰</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
							<c:when test="${pathname == '/bbs/o2oSearchList'}">
								<h1 class="topArea-pageTitle">넥센 직영점 찾기</h1>
								<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
							</c:when>
   							<c:when test="${pathname == '/mypage/memberModifyPassword'}">
								<h1 class="topArea-pageTitle">회원정보 수정</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/mypage/memberModify'}">
								<h1 class="topArea-pageTitle">회원정보 수정</h1>
			            		<button class="topArea-back" onclick="location.href='/mypage/memberModifyPassword'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/contents/privacyPolicy'}">
								<h1 class="topArea-pageTitle">개인정보처리방침</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/contents/termOfService'}">
								<h1 class="topArea-pageTitle">이용약관</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/member/join'}">
								<h1 class="topArea-pageTitle">회원가입</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/member/termsConditionAgree'}">
								<h1 class="topArea-pageTitle">약관동의</h1>
			            		<button class="topArea-back" onclick="location.href='/member/join'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/member/customerAuth'}">
								<h1 class="topArea-pageTitle">실명인증</h1>
			            		<button class="topArea-back" onclick="location.href='/member/termsConditionAgree'">뒤로가기</button>
						    </c:when>
   							<c:when test="${pathname == '/contents/o2oServiceIntro'}">
								<h1 class="topArea-pageTitle">O2O 서비스</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						     <c:when test="${pathname == '/bbs/counselRegister'}">
								<h1 class="topArea-pageTitle">상담하기</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <%-- 믿음 추가 영역 --%>
						    <c:when test="${pathname == '/mypage/engineServiceCreate' }">
								<h1 class="topArea-pageTitle">엔진오일 서비스</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/orderDetail' }">
								<h1 class="topArea-pageTitle">주문 내역</h1>
			            		<button class="topArea-back" onclick="location.href='/mypage/orderList'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/zeroServiceCreate' }">
								<h1 class="topArea-pageTitle">걱정제로 서비스</h1>
			            		<button class="topArea-back" onclick="location.href='/mypage/myRentalList'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/myRentalList' or pathname == '/mypage/myRentalDetail' }">
								<h1 class="topArea-pageTitle">나의  렌탈관리</h1>
			            		<button class="topArea-back" onclick="javascript:history.go(-1);">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/order/orderComplete' or pathname == '/order/rentalOrderComplete' or pathname == '/order/kakaoComplate' or pathname == '/order/npayComplate'}">
								<h1 class="topArea-pageTitle">주문 완료</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <%-- //믿음 추가 영역 --%>

						    <%-- 보경 추가 영역 --%>
						    <c:when test="${pathname == '/contents/rentalServiceIntro' }">
								<h1 class="topArea-pageTitle">렌탈 서비스</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/bbs/qnaList' }">
								<h1 class="topArea-pageTitle">자주 묻는 질문</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/evt/evtList' }">
								<h1 class="topArea-pageTitle">이벤트</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/evt/evtDetail' }">
								<h1 class="topArea-pageTitle">이벤트</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <%-- 보경 추가 영역 --%>
						    <c:when test="${pathname == '/news/tireTipList' }">
								<h1 class="topArea-pageTitle">뉴스</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/news/tireTipDetail' }">
								<h1 class="topArea-pageTitle">뉴스</h1>
			            		<button class="topArea-back" onclick="location.href='/news/tireTipList'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/contents/guaranteeSystem' }">
								<h1 class="topArea-pageTitle">보증제도 안내</h1>
			            		<button class="topArea-back" onclick="location.href='/main'">뒤로가기</button>
						    </c:when>
						    <c:when test="${pathname == '/mypage/memberSecession' }">
								<h1 class="topArea-pageTitle">회원 탈퇴</h1>
			            		<button class="topArea-back" onclick="location.href='/mypage/memberModify'">뒤로가기</button>
						    </c:when>
						    <c:otherwise></c:otherwise>
						</c:choose>
						<c:if test="${pathname != '/bbs/o2oSearchList'}">
					    <div class="rTopBtn topArea-rightMenu">
		            		<a href="#" class="allMenu">전체메뉴</a>
		          		</div>
						</c:if>
		       		</div>
       			</c:otherwise>
       		</c:choose>
		</div>
    </div>
<!-- //allWrap -->

     <!-- allMenu -->
     <div class="allMenuWrap">
         <div class="allMenuBox">
             <header>
             	<div class="menu-logo">
                	<a href="/main" class="logo" title="Next Level">Next Level</a>
                </div>
                <div class="topArea">
                     <ul class="topMenu">
                         <%if(SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO) == null){ %>
                         <li><i class="ico02"></i><a href="/member/join">회원가입</a></li>
                         <%}else{%>
                         <li><i class="ico02"></i><a href="/mypage/memberModifyPassword">회원정보</a></li>
                         <%}%>
                         <li><i class="ico03"></i><a href="/cart/cartView">장바구니</a></li>
						 <%if(SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO) != null){ %>
	                         <li id="loginArea"><i class="ico04" id="logoutLi"></i><a href="#" onClick="javascript:logout();">로그아웃</a></li>
						 <%}else{%>
                         <li id="loginArea"><i class="ico04" id="loginLi"></i><a href="#" onClick="javascript:goTologin();">로그인</a></li>
						 <%}%>
                     </ul>
                 </div>
                 <a href="#" class="allMenuClose"></a>
             </header>
             <form id="logoutFrm" name="logoutFrm" method="post" action="/login/logout">
                 <input type="hidden" id="usrId" name="usrId" value="<%=SessionUtil.getAttribute("userLoginId") %>">
             </form>

             <!-- allMenu content-->
             <div class="content">
                 <div class="siteMapWrap">
                     <!--sMenuBox-->
                     <div class="sMenuBox">
                         <!--sMenu-->
                         <div class="sMenu">
                             <h3 class="type03">마이넥센</h3>
                             <ul>
	                             <li><a href="/mypage/orderList">나의 주문내역</a></li>
	                             <li><a href="/mypage/myRentalList">나의 렌탈 관리</a></li>
	                             <li><a href="/mypage/couponList">나의 쿠폰</a></li>
	                             <li><a href="/mypage/myRecommend">나의 추천인 코드</a></li>
	                             <li><a href="/mypage/questionList">1:1 문의</a></li>
	                             <li><a href="/mypage/memberModifyPassword">회원정보 관리</a></li>
	                             <li><a href="javascript:fn_safeKeyView();">인증번호 발급</a></li>
                             </ul>
                         </div>
                         <!--sMenu-->

                         <!--sMenu-->
                         <div class="sMenu">
                             <h3 class="type03">주문하기</h3>
                             <ul>
                                 <!-- <li><a href="/product/prdList?viewGbn=H">타이어</a></li> -->
                                 <li><a onclick="openSizeFinder( 'num' );">차량번호로 찾기</a></li>
                                 <li><a onclick="openSizeFinder( 'car' );">차종으로 찾기</a></li>
                                 <li><a onclick="openSizeFinder( 'size' );">사이즈로 찾기</a></li>
                             </ul>
                         </div>
                         <!--sMenu-->
                         <!--sMenu-->
                         <div class="sMenu">
                             <h3 class="type03">혜택/서비스</h3>
                             <ul>
                                 <li><a href="/contents/o2oServiceIntro">O2O 서비스</a></li>
		                         <li><a href="/contents/rentalServiceIntro">렌탈 서비스</a></li>
		                         <li><a href="/contents/guaranteeSystem">보증제도 안내</a></li>
                             </ul>
                         </div>
                         <!--sMenu-->
                         <!--sMenu-->
                         <div class="sMenu">
                             <h3 class="type03">뉴스/<br/>이벤트</h3>
                             <ul>
                                 <li><a href="/news/tireTipList">NEWS&TIP</a></li>
                                 <li><a href="/evt/evtList">이벤트</a></li>
                             </ul>
                         </div>
                         <!--sMenu-->

                         <!--sMenu-->
                         <div class="sMenu">
                             <h3 class="type03">고객지원</h3>
                             <ul>
								 <li><a href="/bbs/noticeList">공지사항</a></li>
	                             <li><a href="/bbs/qnaList">자주묻는 질문</a></li>
	                             <li><a href="/bbs/counselRegister">상담하기</a></li>
	                             <li><a href="/bbs/specialDealerSearchList">렌탈 전문점 찾기 </a></li>
	                             <li><a href="/bbs/o2oSearchList">넥센 직영점 찾기 </a></li>
                             </ul>
                         </div>
                         <!--sMenu-->
                     </div>
                     <!--sMenuBox-->
                 </div>
             </div>
             <!-- allMenu content-->

			<!-- customer -->
             <div class="customer">
                 <ul>
                     <li class="fn ls01">고객센터 <span>1855-0100</span></li>
                     <li>평일 09:00 ~ 18:00 / 토요일, 공휴일 휴무</li>
                 </ul>
             </div>
             <!-- customer -->
         </div>
     </div>
     <!-- allMenu -->
