<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>
<%@ page import="com.nexwrms.core.util.SessionUtil" %>
<c:set var="pathname" value="${requestScope['javax.servlet.forward.request_uri']}" />

	<div id="loadingWrap2"></div>
	<c:choose>
		<c:when test="${pathname == '/main'}">
				<!-- footerArea -->
				<div class="section fp-auto-height main-footer">
					<!--//[20241220 퍼블]-->
					<div class="action-buttons-wrap sizeAdjust keyframes">
						<div class="quick-menu-area">
							<a href="" class="quick-btn">
								<div class="icon-wrap">
									<img src="/img/common/ico_quick.png" alt="">
								</div>
								<div class="text-wrap">
									<p class="line1">간편상담</p>
									<p class="line2">바로가기</p>
								</div>
							</a>
						</div>
					</div>
					<script>
						
						$(document).ready(function () {
							/**
							 * [공통] :: 퀵메뉴 버튼
							 */
							function handleScrollButtons() {
								var $quickW = $(".action-buttons-wrap");
								var $footerW = $(".footerWrap");

								$(window).on('scroll', function() {
									var footerT = $footerW.offset().top; // 푸터의 위치
									var scrollT = $(window).scrollTop();
									var winH = $(window).height();

									var footerVisible = (scrollT + winH) > footerT;

									var newBottom;

									if (footerVisible) {
										newBottom = (scrollT + winH - footerT) + 100;
									} else {
										newBottom = 100;
									}

									$quickW.stop().animate({
										bottom: newBottom + "px"
									}, 300);
								});
							}
							handleScrollButtons();

							
						});
						
					</script>
					<!--[20241220 퍼블]//-->
		        	<footer>
		            	<div class="footerWrap">
		              		<p class="link">
		                		<a href="/contents/termOfService">이용약관</a>
				                <a href="/contents/privacyPolicy"><span style="color:#A566FF">개인정보처리방침</span></a>
				                <a href="http://www.nexentire.com/kr/" target="_blank">기업소개</a>
		              		</p>
		              		<p class="address">
		                		<small>경상남도 양산시 충렬로 355 넥센타이어 주식회사 | 대표번호 1855-0100 | 대표이사 강호찬 | 사업자등록번호 621-81-10769 | 통신판매업신고번호 제2015-경남양산-0139호</small>
		              		</p>
		              		<p class="foLogo"></p>
	              			<div class="foCopyright">
	                			<span>Copyright ⓒ 2019 NEXTLEVEL. all rights reserved </span>
	              			</div>
		            	</div>
		          	</footer>
		        </div>
		        <!-- footerArea -->
	        </div><!-- //fullpage -->
       	</div><!-- //mainWrap -->
		</c:when>
		<c:otherwise>
				<!-- footer -->
				<!--//[20241220 퍼블]-->
				<div class="action-buttons-wrap sizeAdjust keyframes" style="display:none;"><!--[D] : 미반영으로 display:none; 처리-->
					<div class="quick-menu-area">
						<a href="" class="quick-btn">
							<div class="icon-wrap">
								<img src="/img/common/ico_quick.png" alt="">
							</div>
							<div class="text-wrap">
								<p class="line1">간편상담</p>
								<p class="line2">바로가기</p>
							</div>
						</a>
					</div>
				</div>
				<script>
					
					$(document).ready(function () {
						/**
						 * [공통] :: 퀵메뉴 버튼
						 */
						function handleScrollButtons() {
							// var $quickW = $(".action-buttons-wrap");[D] : 미반영으로 주석 처리
							var $footerW = $(".footerWrap");

							$(window).on('scroll', function() {
								var footerT = $footerW.offset().top; // 푸터의 위치
								var scrollT = $(window).scrollTop();
								var winH = $(window).height();

								var footerVisible = (scrollT + winH) > footerT;

								var newBottom;

								if (footerVisible) {
									newBottom = (scrollT + winH - footerT) + 30;
								} else {
									newBottom = 30;
								}

								$quickW.stop().animate({
									bottom: newBottom + "px"
								}, 300);
							});
						}
						handleScrollButtons();

						
					});
					
				</script>
				<!--[20241220 퍼블]//-->
				<footer>
					<div class="footerWrap">
						<p class="foLogo"></p>
						<div class="foCopyright">
							<span>Copyright ⓒ 2019 NEXTLEVEL. all rights reserved </span>
						</div>
					</div>
				</footer>
				<!-- footer -->

				<!-- page background image -->
				<div class="allBgWrap over-wrap">
					<div id="bgFullImg"></div>
				</div>
		        <!-- //page background image -->

		        <!-- 주소 form -->
		        <form name="jusoFrm" id="jusoFrm" method="post" >
					<input type="hidden" name="currentPage" id="currentPage" value="1"/>
					<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
					<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
					<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
					<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
					<input type="hidden" name="keyword" id="keyword" />
				</form>

		        <!-- 우편번호 검색 -->
				<div class="md-effect-1 fullPopup address-popup md-modal-3 md-close" id="modal-Addr">
					<div class="popContents">
						<a href="javascript:sendChildValueCancle('modal-Addr');" class="layPopClose md-close"></a>
						<header class="noLine">
							<h2>우편번호 검색</h2>
						</header>

						<!-- TODO: 높이값 자동으로 취득 기능 검토 -->
						<div class="custom-position" style="height: 170px;">
							<div class="pt-l pl-l pr-l pb-0">
								<div class="search-area layout-r pl-0 pr-0">
									<label for="streetNumber"></label>
									<input type="text" name="jusoTxt" id="jusoTxt" class="" placeholder="도로명/지번/건물명 주소 입력"> <a href="javascript:selectJuso('1');" class="searchBtn"></a>
								</div>
								<small class="desc font-gray">예) 도로명: 마곡중앙로 177 더넥센유니버시티<br>예) 지번: 마곡동 756-5 / 건물명: 넥센유니버시티 </small>
							</div>
							<div class="pl-ml pr-ml">
								<div class="count-box utility border-gray-bottom">
									<div class="utility-result-total">
										<span>total</span>
										<span class="totalCnt" id="totalCount"></span>
									</div>
								</div>
							</div>
						</div>

						<!-- TODO: 높이값 자동 취득 기능 검토 -->
						<div class="popup-contents-nobottom" style="top: 230px">
							<div class="zipCode">
								<ul id="jusoList"></ul>
								<button class="list-more full-width inset-m" onclick="javascript:selectJuso('mob');"> <!-- 현재작업중 -->
									<span id="jusoListMore">더보기</span><!-- 모바일은 서비스가 달라야하는 것 같음. MEPARK -->
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- //우편번호 검색 -->

				<!-- 우편번호 검색 결과 -->
				<input type="hidden" class="md-trigger" data-modal="modal-AddtDtl">
				<div class="fullPopup address-popup md-modal-3 md-close" id="modal-AddtDtl" name="popAddrDetail">
					<div class="popContents">
			        	<!-- 결과화면에서는 닫기가 작동 되지 않는다. 왜일까? MEPARK -->
			        	<a href="#;" class="layPopClose md-close"></a>
			          	<header class="noLine">
			            	<h2>우편번호 검색</h2>
			          	</header>

			          	<div class="popup-contents">
			            	<div class="inset-l">
			              		<div class="search-area layout-r pl-0 pr-0">
			                		<label for="streetNumber"></label>
			                		<input type="text" name="jusoReTxt" id="jusoReTxt" class="" placeholder="도로명/지번/건물명 주소 입력"> <button type="button" class="searchBtn" id="selectReJuso" onclick="javascript:selectReJuso('1');">검색</button>
			              		</div>
			              		<small class="desc font-gray">예) 도로명: 마곡중앙로 177 더넥센유니버시티<br>예) 지번: 마곡동 756-5  / 건물명: 넥센유니버시티 </small>
			            	</div>

			            	<div class="pl-ml pr-ml pb-l">
			              		<div class="address-check">
			                		<div class="mb-ml">
			                  			<b class="">우편번호</b><br>
			                  			<span id="popZipCode"></span>
			                  			<span id="bldMngNoMob" style="display:none;"></span>
			                		</div>

			                		<div class="mb-ml">
			                  			<b class="essen">주소</b>
			                  			<div class="address">
			                    			<ul>
			                      				<li><b>도로명</b><br><span id="popLoadAddr"></span></li>
			                      				<li><b>지번</b><br><span  id="popJibunAddr"></span></li>
			                      				<li><span id="popSiNm" style="display:none;"></span></li>
		                                        <li><span id="popSggNm" style="display:none;"></span></li>
		                                        <li><span id="popEmdNm" style="display:none;"></span></li>
			                    			</ul>
			                  			</div>
			                		</div>
			                		<div class="mb-ml">
			                  			<label for="popDetailAddr"><b class="essen">상세주소</b></label>
			                  			<input type="text" name="" class="pl-0 pr-0" id="popDetailAddr" title="상세주소 입력란" maxlength="65" placeholder="예) 넥센아파트 1동 1101호 지하2층 주차장 N8">
			                		</div>
			                										
								<c:choose>		
							
								<c:when test="${pathname == '/mypage/myRecommend'}">
										<!--  유일하게 NUll -->
			                		</c:when>
			                		<c:otherwise>			                	
			                		<div class="mb-ml" id="popPkLoca">
			                  			<label for="popPkLoca"><b class="essen">차량 주차 위치</b></label>
         						        <div class="conWrap js-radioUI mt-s">
				                        	<ul>
				                        		<li class="radio col-2">
						                       	    <input type="radio" name="pkLoca" id="upStr" value="N" checked="checked" class="type06" title="지상 선택" >
						                       	    <label for="upStr"><span>지상</span></label>
						                       	</li>
						                       	<li class="radio col-4">
						                       		<input type="radio" name="pkLoca" id="dnStr" value="Y" checked="checked" class="type06" title="지하 선택" >
						                       		<label for="dnStr"><span>지하</span></label>
				                        		</li>
				                        	</ul>
			                        	</div>
			                		</div>
			                		</c:otherwise>
			                	  </c:choose>
			              		</div>
			            	</div>
						</div>
			        </div>

			        <div class="btnArea layout-r bottom-box same-size" id="addrBottomBox">
						<button type="button" class="inline btn-gray-light" onclick="sendChildValueCancle('modal-AddtDtl');">취소</button>
			          	<button type="button" class="inline btn-primary" onclick="fn_returnInfo();">적용</button>
			        </div>

			        <div class="btnArea layout-r bottom-box same-size" id="addrBottomBox2" style="display:none;" >
						<div style="width:100%; border-top:1px solid #801494;">
							<label for="popDetailAddrSec" style="background-color:#FFFFFF; padding-left:10px; position:relative; top:2px;"><b class="essen">상세주소</b></label>
		            		<input type="text" name="" class="" id="popDetailAddrSec" title="상세주소 입력란" maxlength="65" placeholder="예) 넥센아파트 1동 1101호 지하2층 주차장 N8">
		            	</div>
		            	<button type="button" class="inline btn-primary" onclick="fn_returnAddrDetail();" style="width:20%;">입력</button>
			        </div>
				</div>
				<!-- //우편번호 검색 결과 -->

				<!-- modal-carNumSearch: 차량번호 -->
		    	<input type="hidden" class="md-trigger" data-modal="modal-carNumSearch">
		    	<div class="md-effect-1 fullPopup md-close" id="modal-carNumSearch">
		        	<div class="popContents search-popup">
		            	<a href="#;" class="layPopClose md-close" onclick="sendChildValueCancle('modal-carNumSearch');"></a>
		            	<header>
		            		<h2>
		          				<a href="#" class="backBtn" gbn="nice"></a>
		          				<span>차량 번호</span>
		          			</h2>
		              		<button type="button" class="size-check md-trigger" data-modal="tireSizeTip">
		                		<span>Tip!</span>
		                		<span>사이즈 확인</span>
		              		</button>
		            	</header>

		            	<div class="search-number popup-contents">
			              	<form>
			                	<!-- 검색 -->
			                	<div id="carNumberStep01">
			                  		<div class="number-search layout-c inset-l">
			                    		<div class="text-center">
			                      			<!-- 검색 단계 -->
			                      			<img src="/img/common/pop_alert_02.png" alt="" id="carNumberSearchImg" style="width:100px;">
			                      			<!-- //검색 단계 -->

				                      		<!-- 검색 실패 상태 -->
				                      		<div class="error" style="display:none;" id="carNumberSearchFailImg">
				                        		<img src="/img/product/search_car_step02_number_error.png" alt="차량정보를 찾지 못했습니다. 다시 한번 검색해보세요.">
				                      		</div>
				                      		<!-- //검색 실패 상태 -->
			                    		</div>

			                    		<div class="layout-r mb-l border-primary-bottom">
			                      			<input type="text" id="carNumber" name="carNumber" onkeyup="fn_press_nice(this);" class="inset-m research-input" placeholder="예)12가1234" onkeydown="SchNullKey()">
			                      			<button type="button" class="number-research" id="btnCarNumber" onclick="carNumValidation();">차량번호검색</button>
			                    		</div>
			                    		<p class="comment">NICE디앤알 빅데이터 기반 검색이 진행됩니다.<br>로그인 후 진행가능하며 소유차량에 대해서 진행 가능합니다.</p>
			                  		</div>
			                	</div>

			                	<!-- 검색 결과 -->
			                	<div id="carNumberStep02" style="display:none;"></div>
			              	</form>
		            	</div>
		          	</div>
		          	<div class="btnArea next-box carNumNxt layout-r inline" style="display:none;" id="searchNiceDnrButton">
 		            	<button type="button" class="inline search-popup-control full-width btn-primary" onclick="reSearchCarNum();">재검색</button>
		            	<button type="button" class="inline search-popup-control full-width btn-gray-light" onclick="niceDnrTireSize();">다음</button>
		            	<!-- 검색 결과 에러일 경우 -->
		            	<!-- <button type="button" class="search-popup-control type04 left w100per">다음</button> -->
		          	</div>
				</div>
		    	<!-- //modal-carNumSearch 차량번호 -->

		    	<!-- modal-9 차종검색 후 사이즈 선택  -->
		    	<input type="hidden" class="md-trigger" data-modal="modal-CarNumSize">
		      	<div class="md-effect-1 fullPopup md-close" id="modal-CarNumSize">
		    		<div class="popContents search-popup">
		        		<a class="layPopClose md-close" onclick="sendChildValueCancle('modal-CarNumSize');"></a>
		        		<header>
		          			<h2>
		          				<a href="#" class="backBtn" gbn="niceSize"></a>
		          				<span>사이즈</span>
		          			</h2>
		          			<button type="button" class="size-check md-trigger" data-modal="tireSizeTip">
		            			<span>Tip!</span>
		            			<span>사이즈 확인</span>
		          			</button>
		        		</header>

		        		<div class="search-size popup-contents" id="carSearchSizeArea"></div>
		      		</div>

		      		<div class="btnArea type03 next-box">
		        		<button type="button" class="search-popup-control type01 left w100per">확인</button>
		      		</div>
		        </div>
		      	<!-- //modal-9 차종검색 후 사이즈 선택  -->



      <!-- modal-10 차종 STEP03 인치 -->
      <div class="md-effect-1 fullPopup" id="modal-15">
	    <div class="popContents search-popup">
	        <a href="#" class="layPopClose md-close" onclick="javascript:closeCarSearch('15');"></a>
	        <header>
	          <h2>차량번호</h2>
	          <button type="button" class="size-check md-trigger" data-modal="tireSizeTip">
	            <span>Tip!</span>
	            <span>사이즈 확인</span>
	          </button>
	        </header>
	        <div class="search-car popup-contents" id="sizeArea15">
	        <!-- innerHtml 영역 -->
	        <!-- innerHtml 영역 -->
	        <!-- innerHtml 영역 -->
	        </div>
	      </div>
<!-- 	      <div class="btnArea type03 next-box">
	        <button type="button" class="search-popup-control type01 left w100per">완료</button>
	      </div> -->
        </div>
      <!-- //modal-10 차종 STEP03 인치 -->











		      	<!-- 타이어 사이즈 확인 TIP -->
      			<div class="popupWrap md-modal md-effect-1 md-close" id="tireSizeTip">
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
                      			<img src="/img/product/tip_tire_size_check.png" alt="">
                    		</div>
                  		</div>
                	</div>
              	</div>
      			<!-- //타이어 사이즈 확인 TIP -->

				<!-- layerPopup > 서비스 약관 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-termOfService">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-termOfService" > <!-- md-show -->

				    <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>서비스 이용약관</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox">
				        <div class="terms">
				          <div class="agreementCont">
				            <h3>제 1 장 총칙</h3>
				            <h4>제 1 조 (목적)</h4>
<<<<<<< .mine
				            <p>이 이용약관(이하 ‘약관’이라 합니다)은 넥센타이어 주식회사(이하 ‘회사’라 합니다)가 운영하는 넥센타이어 공식쇼핑몰(<a href="https://www.nexen-nextlevel.com" target="_blank" title="새창열림">www.tirerental.co.kr</a>, 이하 ‘사이트’이라 합니다) 과 오프라인(off-line) 영업점을 통하여 회사가 제공하는 타이어렌탈 및 구매와 관련된 서비스(이하 ‘서비스’)의 이용과 관련하여 회사와 이용자의 제반 권리와 의무를 명확히 규정함을 목적으로 합니다. </p>
=======
				            <p>이 이용약관(이하 ‘약관’이라 합니다)은 넥센타이어 주식회사(이하 ‘회사’라 합니다)가 운영하는 넥센타이어 공식 쇼핑몰(<a href="http://m.nexen-nextlevel.com/main" target="_blank" title="새창열림">www.nexen-nextlevel.com</a>, 이하 ‘사이트’이라 합니다) 과 오프라인(off-line) 영업점을 통하여 회사가 제공하는 타이어렌탈 및 구매와 관련된 서비스(이하 ‘서비스’)의 이용과 관련하여 회사와 이용자의 제반 권리와 의무를 명확히 규정함을 목적으로 합니다. </p>
>>>>>>> .r2305

				            <h4>제2조(정의)</h4>
				            <p>약관에서 사용되는 용어는 개별 조항에서 달리 정의되지 않는 한 다음 각 항과 같은 의미로 사용됩니다.</p>
				            <ol class="cNumber">
				              <li>① "이용자"란 사이트에 접속하거나 방문하여 서비스를 받는 회원 및 비회원을 말합니다.</li>
				              <li>② "회원"이란 개인정보를 제공하고 개인정보처리방침 및 약관에 동의한 후에 회원등록을 한 이용자를 말합니다.</li>
				              <li>③ "비회원"이란 회원등록을 하지 않은 이용자를 말합니다.</li>
				              <li>④ "포인트" 란 회원에게 제공하는 것으로 그 적립 및 사용 등에 관한 구체적인 사항은 약관에서 정한 바와 같습니다.</li>
				              <li>⑤ “아이디”(ID)라 함은 "회원"의 식별과 "서비스"이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.</li>
				              <li>⑥ "비밀번호"라 함은 "아이디"와 일치되는 "회원"임을 확인하기 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다</li>
				              <li>⑦ "게시물"이라 함은 "회원"이 서비스를 이용함에 있어 게시한 부호, 문자, 음성, 음향, 화상, 동영상 등 정보 형태의 글, 사진, 동영상, 각종 파일, 링크 등 모든 내용을 의미합니다.</li>
				            </ol>

				            <h4>제3조(약관의 효력과 개정)</h4>
				            <ol class="cNumber">
				              <li>① 약관은 모든 이용자에게 적용됩니다.</li>
				              <li>② 회사는 서비스 운영상 필요할 경우 관련 법령에 위배되지 않는 범위 내에서 약관을 개정할 수 있고, 개정된 약관의 효력은 약관 개정 이전에 가입한 회원 및 비회원에게도 적용됩니다.</li>
				              <li>③ 회사는 약관을 개정함에 있어 개정 약관의 적용일 7일 이전에 온라인 공지나 전자우편 등의 방법을 통해 약관의 개정 내용을 회원에게 고지하며 개정된 약관은 적용일부터 효력이 발생합니다. 다만 중대한 사유로 인한 긴급한 약관 개정이 필요할 때에는 회사는 약관을 즉시 개정할 수 있으며 이러한 경우에는 그 중대한 사유를 함께 공지 또는 고지합니다.</li>
				              <li>④ 회원이 약관 개정에 동의하지 않는 경우에는 임의로 탈퇴할 수 있습니다. 다만 약관이 개정된 이후에도 서비스를 이용하는 경우에는 약관 개정에 동의한 것으로 봅니다.</li>
				            </ol>

				            <h4>제4조(약관 외 준칙)</h4>
				            <ol class="cNumber">
				              <li>① 회사는 약관 이외에 서비스에 대한 세부적인 사항을 정할 수 있으며 그 내용은 해당 서비스의 이용안내 등을 통해 공지합니다.</li>
				              <li>② 약관에 명시되지 않은 사항이 관계 법령에 규정되어 있을 경우에는 그 규정에 따릅니다.</li>
				            </ol>

				            <h3>제 2 장 회원가입 및 탈퇴</h3>

				            <h4>제5조(회원가입)</h4>
				            <ol class="cNumber">
				              <li>① 만19세 이상에 한해 약관 및 개인정보처리방침을 동의하고 개인정보를 제공함으로써 회원가입 신청이 가능하며 회사가 이를 승인함으로써 회원이 됩니다.</li>
				              <li>② 회원은 반드시 본인의 식별이 가능한 인증정보 및 개인정보를 제공하여야만 서비스를 이용할 수 있습니다. 본인 인증을 통해 등록되지 않은 사용자는 서비스 이용 및 권리의 제한을 받을 수 있습니다.</li>
				              <li>③ 회원가입은 반드시 실명 또는 실명인증으로 해야 합니다. 실명으로 가입하지 않은 회원에 대해 회사는 실명확인 조치를 할 수 있으며, 실명 미인증 가입에 따른 서비스 제한에 대한 책임은 회원에게 있습니다.</li>
				              <li>④ 회원가입 신청의 양식에 기재된 모든 정보는 반드시 실제정보와 일치해야 하며 실제정보와 일치하지 않거나 사실과 다른 정보를 입력한 회원은 보호를 받을 수 없습니다.</li>
				              <li>⑤ 회원가입을 신청한 이용자가 다음 각 호의 어느 하나에 해당하는 경우에 회사는 가입승인을 거부하거나 취소할 수 있습니다.
				                <ol class="number">
				                  <li>1. 실명이 아닌 경우</li>
				                  <li>2. 본인의 개인정보 및 실명확인 값이 아닌 경우</li>
				                  <li>3. 필요정보를 허위로 기재하는 경우</li>
				                  <li>4. 사회의 안녕 질서 및 미풍양속을 저해할 목적으로 신청한 경우</li>
				                  <li>5. 전기통신기본법, 전기통신사업법, 프로그램 보호법, 개인정보보호법, 신용정보의이용및보호에관한법, 정보통신망이용촉진및정보보호등에관한법률, 정보통신 윤리강령, 정보통신 윤리위원회 심의규정, 기타 관련 법령과 약관이 금지하는 행위를 한 경우</li>
				                  <li>6. 기타 회원으로 등록하는 것이 현저히 곤란하거나 사이트 운영에 지장이 있는 경우</li>
				                </ol>
				              </li>
				            </ol>

				            <h4>제6조(회원의 의무)</h4>
				            <ol class="cNumber">
				              <li>① 회원은 회원정보를 실제사항으로 입력해야 하며 변경이 있을 경우 즉시 변경사항을 수정하여야 합니다. 변경사항을 수정하지 않음으로 인해 발생하는 손해에 대하여는 회원에게 책임이 있습니다.</li>
				              <li>② 회원은 타인의 아이디나 개인정보를 이용하여서는 안됩니다.</li>
				              <li>③ 회원은 약관 및 관련 법령에서 규정한 사항을 반드시 준수해야 하며 아이디, 비밀번호, 개인정보 등을 부주의하게 관리하여 발생하는 모든 책임을 부담합니다.</li>
				              <li>④ 회원은 자신의 아이디가 타인에 의해 도용되고 있는지 수시로 확인하여야 하며, 도용 또는 부정사용의 가능성을 발견할 경우 지체 없이 회사에 신고하여야 합니다.</li>
				              <li>⑤ 회원이 사이트를 정상적으로 종료하지 않아서(로그아웃 하지 않아서) 발생하는 모든 책임은 회원 본인이 부담해야 하며, 회원은 회사가 제공하는 공식적인 방법 이외의 방법으로 제공되는 서비스를 이용하여서는 안됩니다.</li>
				              <li>⑥ 사이트 또는 서비스 이용 도중 버그나 결함을 발견할 경우 회원은 이를 지체 없이 회사에 신고하여야 하며, 이를 악용하여서는 안됩니다.</li>
				            </ol>

				            <h4>제7조(회사의 의무)</h4>
				            <ol class="cNumber">
				              <li>① 회사는 관련 법령 및 약관에서 금지하는 행위를 하지 않습니다.</li>
				              <li>② 회사는 지속적이고 안정적인 서비스를 제공하기 위해 노력합니다.</li>
				              <li>③ 회사는 회원이 제기하는 의견이나 불만사항이 정당하다고 인정되면 즉시 이를 처리합니다. 다만 즉시 처리가 불가능한 경우에는 회원에게 그 사유와 처리되는 일정을 통지하여야 합니다.</li>
				            </ol>

				            <h4>제8조(회원탈퇴)</h4>
				            <ol class="cNumber">
				              <li>① 회원은 언제든지 소정의 방법으로 회원탈퇴를 요청할 수 있으며, 회사는 이를 즉시 처리합니다.</li>
				              <li>② 회사는 탈퇴한 회원의 개인정보를 개인정보처리방침에 따라 처리합니다.</li>
				              <li>③ 회원이 사이트를 마지막으로 방문한 날로부터 3년간 재방문이 없을 경우 회원은 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 의하여 회원에서 탈퇴되고, 개인정보는 개인정보처리방침에 따라 처리됩니다.</li>
				              <li>④ 탈퇴회원의 재가입 시 탈퇴 전 아이디와 동일한 아이디로 재가입을 할 수 없으며, 새로운 아이디로 재가입해야 합니다.</li>
				              <li>⑤ 다음 각 호의 어느 하나에 해당하는 사유가 있는 경우 회사는 사전통보 없이 강제탈퇴를 시키거나 서비스 제공을 중단할 수 있습니다.
				                <ol class="number">
				                  <li>1. 회원가입 신청 시 허위내용을 기재한 경우</li>
				                  <li>2. 타인의 아이디, 비밀번호 등 개인정보를 도용한 경우</li>
				                  <li>3. 회사 또는 제3자의 지적재산권을 침해하는 경우</li>
				                  <li>4. 안녕질서와 미풍양속을 해치는 행위를 하는 경우</li>
				                  <li>5. 타인 또는 회사의 명예를 손상시키거나 불이익을 주는 행위를 한 경우</li>
				                  <li>6. 정보통신망에 장애를 일으킬 수 있는 행위를 하는 경우</li>
				                  <li>7. 회사의 허락 없이 서비스를 이용해 영리행위를 하는 경우</li>
				                  <li>8. 회사가 허락하지 않는 방법으로 회사가 운영, 관리하는 포인트를 취득한 경우</li>
				                  <li>9. 전기통신기본법, 전기통신사업법, 프로그램 보호법, 개인정보보호법, 신용정보의이용및보호에관한법, 정보통신망이용촉진및정보보호등에관한법률, 정보통신 윤리강령, 정보통신 윤리위원회 심의규정, 기타 관련 법령과 약관이 금지하는 행위를 한 경우</li>
				                </ol>
				              </li>
				            </ol>

				            <h4>제9조(회원에 대한 통지)</h4>
				            <ol class="cNumber">
				              <li>① 회사가 회원에게 통지를 하는 경우에 회원이 제공한 e-mail로 통보하며, 그 e-mail 주소가 허위이거나 회원이 확인하지 못한 경우 혹은 회원이 제공한 e-mail 관리 업체의 문제로 전송되지 않았을 경우 회사는 통지 의무에 대한 책임을 지지 않습니다.</li>
				              <li>② 회사는 불특정다수 회원에 대한 통지의 경우 1주일 이상 홈페이지에 이를 게시하며 회원이 게시된 통지를 확인하지 못해 발생하는 피해에 대해서는 회사가 책임지지 않습니다.</li>
				              <li>③ 회사는 회원에게 유용하다고 판단되는 정보나 광고를 e-mail 의 방법으로 전달할 수 있으며 회원은 이를 원하지 않을 경우 개인정보 관리메뉴에서 수신을 거부할 수 있습니다. 다만 e-mail 수신을 거부한 경우에도 약관, 개인정보처리방침, 기타 중대한 영업정책의 변경 등 회원이 반드시 알고 있어야 하는 공지사항이 있는 경우 수신 거부와 관계없이 e-mail 을 발송할 수 있습니다.</li>
				            </ol>

				            <h4>제10조(서비스의 제한)</h4>
				            <ol class="cNumber">
				              <li>① 회원이 개인정보에 관한 사항을 허위로 기재할 경우 그로 인하여 발생한 어떠한 손해도 회원이 부담합니다. 회사는 회원의 성명과 실명 인증 값을 조회하여 실명으로 확인되지 않을 경우 서비스의 일부 혹은 전부를 제한할 수 있습니다.</li>
				              <li>② 회원의 서비스 이용에 대해 별도의 인증이 필요할 경우 회사는 서비스 제공에 앞서 별도의 인증절차를 요구할 수 있습니다.</li>
				              <li>③ 다음 각 호의 어느 하나에 해당하는 회원에 대하여 회사는 사전통보 없이 서비스 이용을 제한 또는 중지할 수 있습니다.
				                <ol class="number">
				                  <li>1. 아이디 및 개인정보를 도용 또는 허위기재 할 경우</li>
				                  <li>2. 비정상적 행위 및 약관 등 제반 규정 위반의 경우</li>
				                  <li>3. 게시판이나 기타 온라인 공간에 욕설 등으로 회사 또는 타인에게 불쾌감이나 피해를 줄 경우</li>
				                  <li>4. 사이트 또는 서비스의 버그나 결함을 악용하는 경우</li>
				                  <li>5. 관련 법령을 위반하였을 경우</li>
				                </ol>
				              </li>
				            </ol>

				            <h3>제 3 장 구매계약</h3>

				            <h4>제11조(구매신청)</h4>
				            <p>회원은 다음 각 호의 방법에 의하여 재화 또는 용역(이하 ‘재화 등’이라 합니다)의 구매를 신청합니다. </p>
				            <ol class="number">
				              <li>1. 재화 등의 규격 등을 확인한 후 구매대상 재화 등 선택</li>
				              <li>2. 재화 등의 공급에 필요한 차종, 주소, 연락처(휴대번호 포함) 등의 입력</li>
				              <li>3. 재화 등의 구매신청 내용 확인</li>
				              <li>4. 결제방법의 선택</li>
				            </ol>

				            <h4>제12조(계약의 성립)</h4>
				            <ol class="cNumber">
				              <li>① 회사는 회원의 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.
				                <ol class="number">
				                  <li>1. 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
				                  <li>2. 구매신청에 승낙하는 것이 기술상 현저히 지장이 있다고 판단하는 경우</li>
				                  <li>3. 신용카드 결제 시, 소유주의 동의를 얻지 않는 불법행위로 추정 또는 확인되었을 경우</li>
				                  <li>4. 회원자격 제한 대상 회원의 구매신청으로 확인된 경우</li>
				                </ol>
				              </li>
				              <li>② 제13조 제1항의 수신확인통지가 회원에게 도달한 시점에 구매계약이 성립한 것으로 봅니다. 다만 결제완료 후 상담원의 전화 상담 시 회원의 의사에 따라 계약 내용이 변경될 수 있습니다.</li>
				              <li>③ 구매계약이 성립된 후, 회사가 제1항의 각 호의 사유를 발견한 경우 회사는 즉시 계약을 취소할 수 있으며 계약 취소 시 이용자가 이미 결제한 대금은 취소 확정 후 즉시 환불처리됩니다. 이 경우 이용자는 회사에 손해배상을 요구할 수 없습니다.</li>
				            </ol>

				            <h4>제13조(수신확인통지, 구매신청 변경 및 취소)</h4>
				            <ol class="cNumber">
				              <li>① 회사는 회원의 구매신청이 있는 경우 회원에게 수신확인통지를 합니다.</li>
				              <li>② 수신확인통지를 한 후 회사는 회원에게 직접 전화를 하여 구매신청내역에 관하여 상담을 진행할 수 있습니다.</li>
				              <li>③ 회사는 배송 전 회원의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다. 다만 이미 대금을 지불한 경우에는 렌탈표준약관에 규정된 청약철회 등에 관한 규정에 따릅니다.</li>
				            </ol>

				            <h4>제14조(배송)</h4>
				            <ol class="cNumber">
				              <li>① 재화 등의 공급시기에 관하여 별도의 약정이 없는 한 회사는 회원이 청약을 한 날부터 7일(대금의 전부나 일부를 이미 받은 경우에는 그 대금을 받은 날부터 3영업일) 이내에 재화 등을 배송할 수 있도록 필요한 조치를 취합니다.</li>
				              <li>② 회사와 회원 간에 재화 등의 인도시기 및 제공시기에 관하여 별도의 약정이 있는 경우에는 그 약정이 우선합니다.</li>
				            </ol>

				            <h4>제15조(환급)</h4>
				            <p>회사는 회원이 신청한 재화 등이 품절 등의 사유로 재화 등을 제공을 할 수 없을 때에는 지체 없이 그 사유를 회원에게 통지하고, 사전에 재화 등 대금을 받은 경우에는 사유 확정 후 즉시 계약해제 및 환급 절차를 취합니다.</p>

				            <h4>제16조(구매계약에 따른 법률관계)</h4>
				            <p>회원과 고객 사이에서 체결된 구매계약에 따른 구체적 법률관계는 렌탈표준약관에서 규정하는 바에 따릅니다.</p>

				            <h3>제 4 장 기 타</h3>

				            <h4>제17조(지식재산권의 귀속 및 이용제한)</h4>
				            <ol class="cNumber">
				              <li>① 회사가 작성한 저작물에 대한 저작권 및 기타 지식재산권은 회사에 귀속되며 이용자는 서비스를 이용하며 얻은 정보를 회사의 사전 승낙 없이 가공, 복제, 출판, 배포, 방송, 판매하는 행위 등 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용 또는 제공해서는 안됩니다.</li>
				              <li>② 이용자가 작성한 게시물에 대한 권리와 책임은 게시한 이용자에게 있으며 회사는 게시한 이용자의 동의 없이 이를 서비스 내에서 영리적인 목적으로 사용할 수 없습니다. 다만 회사가 이용자의 게시물을 이용해 출판 등을 하고자 할 경우 전화, 우편, e-mail 등의 절차를 통해 사전에 이용자의 동의를 얻어야 합니다.</li>
				              <li>③ 회사는 이용자가 작성한 게시물이 내용, 문장, 도형, 상징 등을 통해 다음 각 호에 해당하는 경우 사전통지 없이 그 게시물을 삭제할 수 있습니다.
				                <ol class="number">
				                  <li>1. 다른 이용자 또는 회사를 비방하거나 중상모략으로 명예를 실추시키는 내용인 경우</li>
				                  <li>2. 공공질서 및 미풍양속에 위반되는 내용인 경우</li>
				                  <li>3. 범죄적 행위에 결부된다고 인정되는 내용인 경우</li>
				                  <li>4. 회사 또는 제3자의 지식재산권, 기타 권리를 침해하는 내용인 경우</li>
				                  <li>5. 확인되지 않은 미확인 정보나 거짓된 정보일 경우</li>
				                  <li>6. 광고의 목적으로 게시물을 게시한 경우</li>
				                  <li>7. 회사의 운영자 혹은 관계자를 사칭하는 경우</li>
				                  <li>8. 게시판의 성격에 부합하지 않는 게시물의 경우</li>
				                  <li>9. 기타 관련 법령에 위반된다고 판단되는 경우</li>
				                </ol>
				              </li>
				              <li>④ 이용자가 게시하는 게시물 및 정보로 인해 발생하는 손실이나 문제는 이용자 개인의 책임이며 회사는 이에 대하여 책임을 지지 않습니다.</li>
				              <li>⑤ 이용자의 게시물로 인하여 제3자가 회사에게 청구, 소송, 기타 일체의 분쟁이 발생한 경우 이용자는 그 해결에 소요되는 비용을 부담하고 회사를 위하여 분쟁을 처리해야 하며 회사가 제3자에게 배상하거나 회사에 손해가 발생한 경우 이용자는 회사에 그 손해를 배상하여야 합니다.</li>
				            </ol>

				            <h4>제18조(개인정보 취급방침)</h4>
				            <p>회사는 관련 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력하며 그 내용을 별도의 '개인정보처리방침'으로 공지합니다.</p>

				            <h4>제19조(손해배상과 면책)</h4>
				            <p>이용자에 대하여</p>
				            <ol class="cNumber">
				              <li>① 회사는 무료 서비스 이용과 관련하여 회사의 고의 또는 중과실이 없는 한 이용자에게 발생한 어떠한 손해에 대해서도 배상 및 보상의 책임을 지지 않습니다.</li>
				              <li>② 회사가 천재지변, 비상사태 또는 이에 준하는 불가피한 사정으로 서비스를 중단할 경우 서비스 중단으로 이용자에게 발생되는 문제에 대한 회사의 책임이 면제되며 이용자의 귀책사유로 인한 서비스 이용의 장애에 대해서도 회사는 책임을 지지 않습니다.</li>
				              <li>③ 회사는 이용자의 게시물에 관하여 적합성, 정확성, 시의성, 신빙성에 관한 보증 또는 담보책임을 지지 않으며 회사가 제공한 서비스를 통해 이용자가 취득한 정보나 서비스에 게시된 다른 이용자의 게시물을 통해 필요한 결정을 하고자 할 때에는 반드시 사전에 전문가와 상의할 것을 권고합니다.</li>
				              <li>④ 이용자가 약관이나 관련 법령을 어기고 직거래 등을 이용함으로써 발생하는 피해와 이용방법 미숙지, 공지사항 미확인, 부정확한 정보입력 등 과실로 인해 발생하는 피해에 대해서는 회사가 책임지지 않습니다.</li>
				            </ol>
				            <p>회원에 대하여</p>
				            <ol class="cNumber">
				              <li>⑤ 회사가 제공하는 서비스가 완전히 중단될 경우 회사는 회원이 보유한 포인트에 대하여 현금이나 현금에 준하는 가치를 지닌 유무형의 재화로 보상하지 않습니다.</li>
				              <li>⑥ 회사는 서비스 운영을 위해 회원에게 다양한 광고활동을 할 수 있습니다. 이 때 회사가 아닌 광고주로 인해 회원에게 발생하는 피해는 회사가 책임지지 않습니다.</li>
				            </ol>

				            <h4>제20조(분쟁해결 및 관할법원)</h4>
				            <ol class="cNumber">
				              <li>① 회사는 개인정보 관리, 서비스 이용 등에 대한 불편, 불만사항, 기타 의견을 홈페이지, e-mail, 전화, 서면 등을 통해 접수하고 처리합니다.</li>
				              <li>② 개인정보에 관한 분쟁이 있는 경우 신속하고 효과적인 분쟁해결을 위하여 개인정보분쟁조정위원회에 분쟁의 조정을 신청할 수 있습니다.</li>
				              <li>③ 서비스 및 약관과 관련하여 발생하는 분쟁에 대해 소송이 제기될 경우 서울중앙지방법원 또는 대한민국 민사소송법에 따른 법원을 관할법원으로 합니다.</li>
				            </ol>

				            <h4>제21조(온라인 청구요금 결제)</h4>
				            <ol class="cNumber">
				              <li>① 회사가 제공하는 재화 등의 이용자는 회사가 제공하는 재화 등에 대한 렌탈료 등은 신용카드결제, 실시간 계좌이체 중 본인이 선택한 방법으로 온라인 결제할 수 있습니다.</li>
				              <li>② 회사는 ㈜KCP, 금융결제원 결제대금예치서비스를 이용하여 결제 서비스를 제공합니다.</li>
				            </ol>
				            <h4>제22조 (신용정보 자료 제공)</h4>
				            <ol class="cNumber">
				              <li>① 회사는 결제를 진행함에 있어 고객의 신용조회를 신용정보관리 회사에 의뢰할 수 있으며, 고객의 신용이 회사가 정하는 기준에 부합되지 않을 경우 회사는 결제를 취소, 거부할 수 있습니다.</li>
				            </ol>
				          </div>
				        </div>
				      </div>
				    </div>
				  </div>

			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 서비스 약관 // -->

				<!-- layerPopup > 개인정보처리방침 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-perInfoPolicy">
				<div class="md-effect-1 fullPopup md-close" id="modal-perInfoPolicy" > <!-- md-show -->
			        <header>
						<h2>
							개인정보처리방침
							<a href="#" class="layPopClose md-close" onClick="javascript:layPopClose('modal-perInfoPolicy');"></a>
						</h2>
					</header>

					<!-- 개인정보처리방침 -->
					<div class="termsBox">
			            <div class="terms">
							<div class="agreementCont privacy">
								<h3>총칙</h3>
								<p>넥센타이어 주식회사 (이하 '회사'라 함)는 고객님의 개인정보보호를 매우 중요시하며, 정보통신망 이용촉진 및 정보보호 등에 관한 법, 통신비밀보호법 등에서 요구하는 사항을 준수합니다. 회사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 개인정보처리방침을 홈페이지를 통해 공개하는 등 고객님의 개인정보보호에 최선의 노력을 다하고 있습니다.</p>
								<p>회사의 개인정보 취급방침은 다음과 같은 내용을 담고 있습니다.</p>

								<div class="privacyLink">
									<ol>
										<li><a href="#list01">1. 이용자의 개인 정보 보호</a></li>
										<li><a href="#list02">2. 수집하는 개인정보 항목 및 수집 방법</a></li>
										<li><a href="#list03">3. 개인정보의 수집 및 이용 목적</a></li>
										<li><a href="#list04">4. 수집한 개인정보의 공유 및 제공 (개인정보의 제3자 제공 등)</a></li>
										<li><a href="#list05">5. 개인정보의 취급 위탁</a></li>
										<li><a href="#list06">6. 개인정보의 보유 및 이용 기간</a></li>
										<li><a href="#list07">7. 개인정보 파기 절차 및 방법</a></li>
									</ol>
									<ol>
										<li><a href="#list08">8. 이용자 및 법정대리인의 권리와 행사 방법</a></li>
										<li><a href="#list09">9. 개인정보 자동 수집 장치의 설치 / 운영 및 거부에 관한 사항</a></li>
										<li><a href="#list10">10. 개인정보의 기술적 / 관리적 보호 대책</a></li>
										<li><a href="#list11">11. 개인정보에 관한 민원 서비스</a></li>
										<li><a href="#list12">12. 이용자의 권리와 의무</a></li>
										<li><a href="#list13">13. 고지의 의무</a></li>
									</ol>
								</div>
								<h4 id="list01">1. 이용자의 개인정보 보호</h4>
								<p>"개인정보"란 살아 있는 개인에 관한 정보로서 성명, 전화번호 등 및 영상 등을 통하여 개인을 알아볼 수 있는 정보(해당 정보만으로는 특정 개인을 알아볼 수 없더라도 다른 정보와 쉽게 결합하여 알아볼 수 있는 것을 포함한다)를 말합니다.. 회사는 관련 법률, 정부의 지침을 준수하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. </p>
								<h4 id="list02">2. 수집하는 개인정보 항목 및 수집 방법</h4>
								<dl class="termsList">
									<dt>(1) 개인정보 수집 항목</dt>
									<dd>
										<ol class="termsList2">
											<li>1) 회사는 회원가입, 원활한 고객 상담, 본인 확인, 고지사항 전달 및 확인, 본인의사 확인 등 의사소통을 위한 절차에의 이용, 회사 또는 제휴사의 서비스(상품) 및 이벤트 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.
												<ol class="cNumber">
													<li>① 개인 회원
														<ul class="termsList3">
															<li>필수수집항목 : 성명, 실명 인증값(아이핀회원은 아이핀번호), 생년월일, 성별, 회원ID, 비밀번호, 주소, 휴대전화번호, 이메일, 이메일수신여부</li>
															<li>선택수집항목 : 전화번호, 자동차 보유 여부, 자동차 회사, 자동차명, 차량번호</li>
														</ul>
													</li>
													<li>② 사업자 회원
														<ul class="termsList3">
															<li>필수수집항목 : 상호, 대표자 이름, 사업자번호, 사업자 형태, 업종, 업태, 아이디, 비밀번호, 주소, 휴대전화번호, 이메일, 이메일수신여부, 사업자등록증 사본, 법인(또는 개인사업자) 통장 사본, 법인(또는 개인사업자) 차량등록증 사본</li>
															<li>선택수집항목 : 전화번호, 자동차 보유 여부, 자동차 회사, 자동차명, 차량번호</li>
														</ul>
													</li>
												</ol>
											</li>
											<li>2) 서비스 이용 과정이나 처리과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
												<ul class="termsList3">
													<li>IP Address, 쿠키, 서비스 이용기록, 접속 로그, 방문 일시</li>
												</ul>
											</li>
											<li>3) 유료서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
												<ul class="termsList3">
													<li>신용카드 결제시 : 카드소유주, 카드사명, 카드번호, 유효기간, 법정생년월일, 사업자번호</li>
													<li>계좌이체시 : 예금주, 법정생년월일, 사업자번호, 금융사, 계좌번호</li>
												</ul>
											</li>
											<li>4) 제품 배송 및 서비스 이용과정에서 아래와 같은 정보들이 수집됩니다.
												<ul class="termsList3">
													<li>제품 수취인 및 서비스 이용자 이름, 휴대 전화번호, 기타 연락처</li>
												</ul>
											</li>
											<li>5) 부가 서비스 및 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 추가 정보들이 수집 될 수 있습니다.
												<ul class="termsList3">
													<li>추가로 수집하는 개인정보는 부가 서비스 및 이벤트 응모 페이지를 통해 명시합니다.</li>
												</ul>
											</li>
										</ol>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(2) 개인정보 수집 방법</dt>
									<dd>
										<p>회사는 다음과 같은 방법으로 개인정보를 수집합니다. </p>
										<ul class="termsList3">
											<li>홈페이지, 회원정보 수정</li>
										</ul>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(3) 개인정보 수집 동의</dt>
									<dd>
										<ul class="termsList3">
											<li>회사는 이용자가 만 19세 이상의 분들에 한해 회원 가입이 가능하며, 가입 시 회원 약관, 회사의 개인정보처리방침, 개인정보의 제공ㆍ활용 동의서 또는 이용약관의 내용에 대해 「동의한다」 버튼 또는 「동의하지 않는다」 버튼을 클릭할 수 있는 절차를 마련하여,「동의한다」 버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.</li>
											<li>회사는 다음의 경우 이용자의 동의 없이 개인정보를 수집, 이용할 수 있습니다.
												<ol class="termsList2">
													<li>1) 정보통신서비스의 제공에 관한 계약을 이행하기 위하여 필요한 개인정보로서 경제적, 기술적 사유로 통상적인 동의를 받는 것이 뚜렷하게 곤란한 경우</li>
													<li>2) 정보통신서비스의 제공에 따른 요금정산을 위하여 필요한 경우</li>
													<li>3) 이 법 또는 다른 법률에 특별한 규정이 있는 경우</li>
												</ol>
											</li>
										</ul>
									</dd>
								</dl>
								<h4 id="list03">3. 개인정보의 수집 및 이용 목적</h4>
								<p>회사는 회원 가입, 이용자 맞춤 서비스 등 보다 나은 양질의 서비스를 제공하기 위하여 최소한의 개인정보를 수집하고 있습니다 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
								<dl class="termsList">
									<dt>(1) 회원 관리</dt>
									<dd>
										<p>회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 실명 확인을 통한 타인의 개인정보 도용방지 및 렌탈, 멤버쉽 고객 등의 본인 사용제품 확인, 가입의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(2) 서비스 제공에 관한 계약이행 및 서비스 제공에 따른 요금 정산</dt>
									<dd>
										<p>서비스 제공에 관한 계약 이행 및 요금 정산 컨텐츠 제공, 주문제품 배송, 이벤트 경품 배송, 구매 및 요금 결제, 청구서 발송, 금융거래 본인 인증 및 금융 서비스, 요금 추심 </p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(3) 신규서비스 개발, 마케팅 및 광고에 활용</dt>
									<dd>
										<p>신규 서비스 개발 및 맞춤 서비스 제공, 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계학적 특성에 따른 서비스 제공 및 광고 전달. 상기 정보는 가입 당시 정보뿐만 아니라 정보 수정으로 변경된 정보를 포함합니다.</p>
									</dd>
								</dl>
								<h4 id="list04">4. 개인정보의 공유 및 제공</h4>
								<p>회사는 원칙적으로 "3. 개인정보의 수집 목적 및 이용 목적"에서 고지한 범위를 넘어 이용자의 개인정보를 이용하거나 타인 또는 타기업, 기관에 제공하지 않습니다. 다만, 다음의 경우는 예외로 합니다.</p>
								<dl class="termsList">
									<dt>(1) 이용자가 개인정보의 제3자 제공에 동의한 경우</dt>
								</dl>
								<dl class="termsList">
									<dt>(2) 다른 법률에 특별한 규정이 있는 경우</dt>
								</dl>
								<h4 id="list05">5. 개인정보의 취급 위탁</h4>
								<dl class="termsList">
									<dt>(1) 회사는 이용자에게 다음 각 호의 내용을 알리고 동의를 받은 다음 제3자에게 이용자의 개인정보 수집&middot;보관&middot;처리&middot;이용&middot;제공&middot;관리&middot;파기 등에 관한 업무를 위탁(이하 '개인정보 취급위탁'이라 합니다)하며, 어느 하나의 사항이 변경되는 경우에도 이용자의 동의를 받습니다.</dt>
									<dd>
										<ol class="termsList2">
											<li>1) 개인정보 취급위탁을 받는 자(이하 '수탁자'라 합니다)</li>
											<li>2) 개인정보 취급위탁을 하는 업무의 내용</li>
										</ol>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(2) 회사는 보다 나은 서비스 제공, 고객편의 제공 등 원활한 업무 수행을 위하여 아래와 같이 개인정보를 위탁하고 있습니다.</dt>
									<dd>
										<div>
											<table class="tbl conView" summary="개인정보를 위탁 정보 테이블">
												<caption>개인정보를 위탁</caption>
												<colgroup>
													<col width="40%" />
													<col  />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="tCenter">수탁자</th>
														<th scope="col" class="tCenter">위탁업무 내용</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="tCenter">㈜한국사이버결제</td>
														<td class="tCenter">신용카드 및 실시간 계좌이체 정보</td>
													</tr>
													<tr>
														<td class="tCenter">(주)웅진</td>
														<td class="tCenter">고객 상담센터 운영</td>
													</tr>
													<tr>
														<td class="tCenter">NICE신용정보</td>
														<td class="tCenter">수납 센터 운영 및 채권 추심업무</td>
													</tr>
													<tr>
														<td class="tCenter">㈜쿠콘</td>
														<td class="tCenter">CMS 출금 동의 ARS 녹취</td>
													</tr>
													<tr>
														<td class="tCenter">와이더랩</td>
														<td class="tCenter">계약서 및 만기도래고객 DM발송</td>
													</tr>
													<tr>
														<td class="tCenter">방문점검위탁사업자</td>
														<td class="tCenter">방문점검서비스</td>
													</tr>
													<tr>
														<td class="tCenter">오토앤주식회사</td>
														<td class="tCenter">엔진오일서비스</td>
													</tr>
													<tr>
														<td class="tCenter"><a id="a" href="#"><u>렌탈계약대리점</u></a></td>
														<td class="tCenter">고객 주문 관리, 타이어장착, 서비스 관리</td>
													</tr>
													<tr>
														<td class="tCenter"><a id="b" href="#"><u>방문판매모집원</u></a></td>
														<td class="tCenter">회원가입, 고객 주문 관리, 고객 상담</td>
													</tr>
												</tbody>
											</table>
										</div>
										<p class="tbl_info">※ 위탁 업체 리스트는 해당 서비스 변경 및 계약기간에 따라 변경될 수 있으며 변경 시 공지사항을 통해 사전 공지합니다. 단기 온라인 이벤트는 참여 시에 개별 공지됩니다.</p>
									</dd>
								</dl>
								<h4 id="list06">6. 개인정보의 보유 및 이용 기간</h4>
								<dl class="termsList">
									<dt>(1) 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성되면 지체 없이 파기합니다. 단 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</dt>
								</dl>
								<dl class="termsList">
									<dt>(2) 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</dt>
									<dd>
										<ol class="termsList2">
											<li>1) 계약 또는 청약 철회 등에 관한 기록 : 5년 </li>
											<li>2) 대금결재 및 재화 등의 공급에 관한 기록 : 5년 </li>
											<li>3) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
										</ol>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(3) 고객이 2012년 8월 18일 이후 3년간 정보통신 서비스를 이용하지 않는 경우 회사는 정보통신망법에 따라 개인정보 파기 등의 필요한 조치를 취합니다. 다만 다른 법령에서 별도의 기간을 정하고 있는 경우나 이용자의 요청에 따라 기간을 달리 정한 경우에는 그 기간이 경과한 후 파기 등의 필요한 조치를 취합니다.</dt>
								</dl>
								<h4 id="list07">7. 개인정보 파기 절차 및 방법</h4>
								<p>회사는 원칙적으로 개인정보 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기 절차 및 방법은 다음과 같습니다. </p>
								<dl class="termsList">
									<dt>(1) 파기 절차</dt>
									<dd>
										<ol class="termsList2">
											<li>1) 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라 (보유 및 이용 기간 참조) 일정기간 저장된 후 파기됩니다. </li>
											<li>2) 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.</li>
										</ol>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>2) 파기 방법</dt>
									<dd>
										<ol class="termsList2">
											<li>1) 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다. </li>
											<li>2) 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
										</ol>
									</dd>
								</dl>
								<h4 id="list08">8. 이용자 및 법정대리인의 권리와 행사 방법</h4>
								<dl class="termsList">
									<dt>(1) 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 법률에 의한 대리인의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다.</dt>
								</dl>
								<dl class="termsList">
									<dt>(2) 개인정보 조회, 수정을 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭하여 본인 확인 절차를 거친 후 직접 열람, 정정 또는 탈퇴가 가능합니다.</dt>
								</dl>
								<dl class="termsList">
									<dt>(3) 개인정보 관리 담당자에게 서면, 전화 또는 이메일로 연락하시면 확인 후 조치하겠습니다.</dt>
								</dl>
								<dl class="termsList">
									<dt>(4) 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한, 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.</dt>
								</dl>
								<dl class="termsList">
									<dt>(5) 회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “6. 개인정보의 보유 및 이용 기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</dt>
								</dl>
								<h4 id="list09">9. 개인정보 자동 수집 장치의 설치 / 운영 및 거부에 관한 사항</h4>
								<p>회사는 이용자들에게 특화된 맞춤 서비스를 제공하기 위해서 이용자들의 정보를 저장하고 수시로 불러오는 ‘쿠키 cookie를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버(HTTP)가 이용자의 컴퓨터 브라우저에 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다. 회사는 다음과 같은 목적을 위해 쿠키cookie를 사용합니다. </p>
								<dl class="termsList">
									<dt>(1) 쿠키의 사용 목적</dt>
									<dd>
										<p>회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심 분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공을 위하여 사용합니다.</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(2) 쿠키의 설치 / 운영 및 거부</dt>
									<dd>
										<p>이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때 마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 단, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스는 이용할 수 없습니다. <br /><span class="blt">쿠키 설정 방법 예(인터넷 익스플로러의 경우) : 웹브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보</span></p>
									</dd>
								</dl>
								<h4 id="list10">10. 개인정보의 기술적 / 관리적 보호 대책</h4>
								<p>회사는 이용자들의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안정성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다. </p>
								<dl class="termsList">
									<dt>(1) 비밀번호 암호화</dt>
									<dd>
										<p>회원 아이디(ID)의 비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, (비밀번호는 일방향으로 암호화 합니다), 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 한해서만 가능합니다.</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(2) 해킹 등에 대비한 대책</dt>
									<dd>
										<p>회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신 프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템 등을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적, 관리적 보호조치를 취하고 있습니다.</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(3) 취급 직원의 최소화 및 교육</dt>
									<dd>
										<p>회사의 개인정보관련 취급 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 개인정보처리방침의 준수를 항상 강조하고 있습니다.</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(4) 개인정보보호 전담 기구의 운영</dt>
									<dd>
										<p>사내 개인정보보호 전담기구를 통하여 개인정보 취급방침의 이행 사항 및 담당자의 준수 여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다. 단, 이용자 본인의 부주의나 인터넷상의 문제로 ID, 비밀번호, 실명인증값 등 개인정보가 유출되어 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다.</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(5) 개인 식별 정보 암호화</dt>
									<dd>
										<p>개인 식별이 가능한 실명인증값, 가입인증정보, 전화번호, 계좌번호, 주소(번지, 동, 호수)는 암호화되어 저장 및 관리되고 있어, 개인정보의 확인 및 변경은 본인에 한해서만 가능합니다.</p>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>(6) 접속기록의 위조, 변조 방지</dt>
									<dd>
										<p>개인정보취급자가 개인정보처리시스템에 접속하여 개인정보를 처리한 경우, 접속일시, 처리내역 등을 저장하고 접속기록을 별도로 보관합니다.</p>
									</dd>
								</dl>

								<h4 id="list11">11. 개인정보에 관한 민원 서비스</h4>
								<p>회사는 고객의 의견을 매우 소중하게 생각하며, 회사 서비스를 이용하시며 발생되는 개인정보 관련 민원을 개인정보보호 조직에 신고하실 수 있습니다. (1577 - 2781, nexentire@nexentire.com)</p>
								<dl class="termsList">
									<dt>[개인정보 관리 책임자]</dt>
									<dd class="mt5">
										이름 : 김인 <br />
										소속/직위 : 정보보호팀 / CISO <br />
										이메일 : <a href="mailTo:this@nexentire.com">this@nexentire.com</a>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>[개인정보 관리 담당자]</dt>
									<dd class="mt5">
										이름 : 윤태경 <br />
										소속/직위 : 정보보호팀 / 선임 <br />
										이메일 : <a href="mailTo:tg.yun@nexentire.com">tg.yun@nexentire.com</a>
									</dd>
								</dl>
								<dl class="termsList">
									<dt>고객은 아래 기관을 통하여 개인정보침해에 관한 분쟁해결이나 상담 등을 받으실 수 있습니다.</dt>
									<dd class="mt5">
										개인정보보호 종합지원포탈 : <a href="http://www.privacy.go.kr" target="_blank" title="새창열림">www.privacy.go.kr</a> <br />
										개인정보 침해신고센터 및 분쟁조정위원회 : privacy.kisa.or.kr / (국번없이)118 <br />
										인터넷범죄수사센터 : <a href="http://www.spo.go.kr" target="_blank" title="새창열림">www.spo.go.kr</a> / 02-3480-3600 <br />
										사이버테러대응센터 : <a href="http://www.ctrc.go.kr" target="_blank" title="새창열림">www.ctrc.go.kr</a> / 02-392-0330
									</dd>
								</dl>
								<h4 id="list12">12. 이용자의 권리와 의무</h4>
								<p>고객님의 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방해 주시기 바랍니다.</p>
								<p>
									입력한 부정확한 정보로 인해 발생하는 사고의 책임은 이용자 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회사의 회원자격이 상실되거나 회사 홈페이지 이용이 정지될 수 있습니다. 이용자 개인정보와 관련한 아이디(ID)의 비밀번호에 대한 보안유지책임은 해당 이용자 자신에게 있습니다.</p>
								<p>고객님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 회사는 비밀번호에 대해 어떠한 방법으로도 이용자에게 직접적으로 질문하는 경우는 없으므로 타인에게 비밀번호가 유출되지 않도록 각별히 주의하시기 바랍니다. 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오. 만약 이 같은 책임을 다하지 못하고 타인의 정보를 훼손할 시에는 관계 법령 등에 의해 처벌받을 수 있습니다.</p>
								<p>특히, 공공장소에서 온라인상에서 접속해 있을 경우에는 더욱 유의하셔야 합니다. 회사는 개인정보에 대한 의견수렴 및 불만처리를 담당하는 개인정보 관리책임자 및 담당자를 지정하고 있습니다.</p>
								<h4 id="list13">13. 고지의 의무</h4>
								<p class="etc">현 개인정보 취급방침의 내용 추가, 삭제 및 수정이 있을 시에는 홈페이지의 '공지사항'을 통해 고지할 것입니다. </p>
								<ul class="date_list">
									<li>공고일자 : 2015년 9월 1일</li>
									<li>시행일자 : 2015년 9월 1일</li>
									<li>개정일자 : 2022년 10월 21일</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 개인정보처리방침 -->
			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 서비스 약관 // -->



				<!-- layerPopup > 개인(신용)정보 동의 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-privacyPolicyAgree">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-privacyPolicyAgree" > <!-- md-show -->

				  <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>개인(신용)정보 동의</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox">
				        <table class="tbl conView">
				          <caption>개인(신용)정보 동의</caption>
				          <colgroup>
				            <col style="width:20%"/>
				            <col style="width:40%"/>
				            <col style="width:40%"/>
				          </colgroup>
				          <tbody>
				            <tr>
				              <th scope="col">제공받는자</th>
				              <td class="tCenter fb">
				                NICE평가정보㈜(개인신용평가회사)<br>서울신용평가㈜<br>코리아크레딧뷰로㈜
				              </td>
				              <td class="tCenter">
				                사단법인 금융결제원
				              </td>
				            </tr>
				            <tr>
				              <th scope="col">제공항목</th>
				              <td class="type03 vTop">
				                <p class="fb">- 개인식별정보(성명,생년월일,성별,주소,국적,연락처, E-mail 등)</p>
				                <p>- 신용거래정보(본 거래 이전 및 이후의 실적을 포함한 거래내용)</p>
				                <p>- 연체정보 등 신용도 판단 정보</p>
				              </td>
				              <td class="type03 vTop">
				                <p>- 계좌번호, 은행명, 예금주명</p>
				              </td>
				            </tr>
				            <tr>
				              <th scope="col">제공목적</th>
				              <td class="tCenter fb">
				                  <p>신용정보집중관리·활용,<br/>본인인증·식별확인,<br/>신용도평가,통계작성,연구·분석,<br/>주민등록번호 대체키 발급,<br/>공공기관의 정책자료로 활용등<br/>개인신용평가회사의 업무목적</p>
				              </td>
				              <td class="tCenter">계좌 유효성 인증, 자동이체 계좌 등록, 렌탈료 자동이체</td>
				            </tr>
				            <tr>
				              <th scope="col">제공기간</th>
				              <td class="tCenter fb">제공목적 달성시까지</td>
				              <td class="tCenter">제공목적 달성시까지</td>
				            </tr>
				          </tbody>
				        </table>

				        <p class="desc mt-m">
				          * 귀하는 넥스트레벨 서비스 이용에 필요한 최소한의 개인정보 수집 이용에 동의하지 않을 권리가 있으며, 동의 거부시 거부한 내용에 대한    서비스가 제한될 수 있습니다.<br>
				          * 이 외 서비스 이용과정에서 별도 동의를 통해 추가 정보 수집이 있을 수 있습니다.
				        </p>
						  </div>
				    </div>
				  </div>

			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 개인정보 수집 및 이용에 대한 안내  // -->

				<!-- layerPopup > 개인(신용)정보 조회 동의 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-perInfoSearchAgree">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-perInfoSearchAgree" > <!-- md-show -->

				  <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>개인(신용)정보 조회 동의</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox">
				        <table class="tbl conView">
				          <caption>개인(신용)정보 조회 동의</caption>
				          <colgroup>
				            <col style="width:30%"/>
				            <col style="width:60%"/>
				          </colgroup>
				          <tbody>
				            <tr>
				              <th scope="col">조회기관</th>
				              <td class="tCenter fb">
				                NICE평가정보㈜(개인신용평가회사)<br/>서울신용평가㈜<br/>코리아크레딧뷰로㈜
				              </td>
				            </tr>
				            <tr>
				              <th scope="col">조회내용</th>
				              <td class="type03 vTop">
				                <p class="fb">- 식별정보(성명, 주소, 연락처, E-mail등)</p>
				                <p>- 신용개설정보(대출/카드개설/신용거래개설등)</p>
				                <p>- 연체정보 등 신용도판단정보, 신용등급등</p>
				              </td>
				            </tr>
				            <tr>
				              <th scope="col">조회목적</th>
				              <td class="tCenter fb">
				                상거래 설정/유지 및 채권추심/통계작성/<br/>연구·분석등을 위한 신용정보 조회
				              </td>
				            </tr>
				            <tr>
				              <th scope="col">조회기간</th>
				              <td class="tCenter fb">동의서 제출 시부터<br/>조회목적의 달성 시까지</td>
				            </tr>
				          </tbody>
				        </table>

				        <p class="desc mt-m">
				          * 넥스트레벨 서비스 제공을 위하여 반드시 필요한 정보제공이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.<br/>
				          * 렌탈 계약을 체결하고자 하는 고객에 한해서만 조회되며, 단순 회원 가입고객 정보는 조회되지 않습니다.
				        </p>
				      </div>
				    </div>
				  </div>

			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 개인(신용)정보 조회 동의  // -->



        		<div class="md-overlay"></div>
			</div>
		</c:otherwise>
	</c:choose>
	<!-- //allWrap -->

				<!-- layerPopup > 개인정보 수집 및 이용에 대한 안내 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-privacyPolicy">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-privacyPolicy" > <!-- md-show -->

				  <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>개인(신용)정보 수집 및 이용에 대한 안내</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox">
				        <table class="table conView">
				          <caption>개인(신용)정보 수집 및 이용에 대한 안내</caption>
				          <colgroup>
				            <col style="width:14%"/>
				            <col style="width:11%"/>
				            <col style="width:30%"/>
				            <col style="width:30%"/>
				            <col style="width:15%"/>
				          </colgroup>
				          <thead>
				            <tr>
				              <th scope="col" colspan="2">구분</th>
				              <th scope="col">수집항목</th>
				              <th scope="col">이용목적</th>
				              <th scope="col">보유기간</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
				              <td class="tCenter" rowspan="2" style="text-align:center; vertical-align:middle;">회원가입</td>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">개인</td>
				              <td class="type03 vTop">
				                <p>성명, 실명 인증값(아이핀회원은 아이핀번호), 생년월일, 성별, 회원ID, 비밀번호, 주소, 휴대전화번호, 이메일, 이메일 수신여부
				              </td>
				              <td class="type03 vTop" rowspan="2" style="vertical-align:middle;">
				                <p>이용자 식별, 서비스 이용에 따른 정보 제공(고지사항 전달, 본인의사 확인, 서비스관련상담, 민원사항 처리, 유의사항 등)
				              </td>
				              <td class="tCenter" rowspan="2" style="vertical-align:middle;">회원탈퇴시까지</td>
				            </tr>
				            <tr>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">법인</td>
				              <td class="type03 vTop">
				                <p>상호, 사업자번호, 사업자형태, 업종, 업태, 아이디, 비밀번호, 대표자 이름, 주소, 휴대전화번호, 이메일, 이메일수신여부
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">서비스 신청</td>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">타이어 구매<br/>및<br/>렌탈 신청</td>
				              <td class="type03 vTop" style="vertical-align:middle;">
								<p>계약자 성명, 생년월일, 휴대전화번호, 이메일, 주소, 실사용자 성명, 실사용자 휴대전화번호
							  </td>
				              <td class="type03 vTop">
								<p>구매 및 렌탈신청 상담, 고객 서비스 정보 제공, 계약 정보 제공 및 동의, 계약자 정보 확인 동의, 실사용자 정보 확인 동의
							  </td>
				              <td class="tCenter" style="vertical-align:middle;">5년</td>
				            </tr>
				            <tr>
				              <td class="tCenter" rowspan="2" style="text-align:center; vertical-align:middle;">구매 결제, 등록비 및 렌탈료 납부</td>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">신용카드</td>
				              <td class="type03 vTop">
								<p>카드소유주, 법정생년월일, 사업자번호, 카드사명, 카드번호, 유효기간
							  </td>
				              <td class="type03 vTop" rowspan="2" style="vertical-align:middle;">
								<p>결제정보 확인 및 동의
							  </td>
				              <td class="tCenter" rowspan="2" style="vertical-align:middle;">5년</td>
				            </tr>
				            <tr>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">계좌이체</td>
				              <td class="tCenter">
								<p>예금주, 법정생년월일, 사업자번호, 금융사명, 계좌번호
							  </td>
				            </tr>
				            <tr>
				              <td class="tCenter" colspan="2" style="text-align:center; vertical-align:middle;">제품 배송</td>
				              <td class="type03 vTop">
								<p>제품 수취인 및 서비스 이용자 이름, 휴대전화번호, 주소
							  </td>
				              <td class="type03 vTop" style="vertical-align:middle;">
								<p>배송정보 확인
							  </td>
				              <td class="tCenter">배송 완료 시 까지</td>
				            </tr>
				          </tbody>
				        </table>
				        <p class="desc mt-m">
				          * 귀하는 넥스트레벨 서비스 이용에 필요한 최소한의 개인정보 수집 이용에 동의하지 않을 권리가 있으며, 동의 거부시 거부한 내용에 대한 서비스가 제한될 수 있습니다.<br/>
				          * 이 외 서비스 이용과정에서 별도 동의를 통해 추가 정보 수집이 있을 수 있습니다.
				        </p>
				        <%-- <table class="table conView">
				          <caption>개인(신용)정보 수집 및 이용에 대한 안내</caption>
				          <colgroup>
				            <col style="width:25%"/>
				            <col style="width:50%"/>
				            <col style="width:25%"/>
				          </colgroup>
				          <thead>
				            <tr>
				              <th scope="col">이용목적</th>
				              <th scope="col">항 목</th>
				              <th scope="col">보유기간</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
				              <td class="tCenter">
				                회원가입, 고객 상담, 본인 확인, 고지사항 전달 및 확인 본인의사 확인 회사의 서비스(상품) 및 이벤트 제공
				              </td>
				              <td class="type03 vTop">
				                <p>- 개인 회원 : 성명, 실명 인증값(아이핀회원은 아이핀번호), 생년월일, 성별, 주소, 휴대전화번호, 이메일, 이메일수신여부, 회원ID, 비밀번호</p>
				                <p>- 사업자 회원 :상호, 사업자번호, 사업자 형태, 업종, 업태, 아이디, 비밀번호, 대표자 이름, 주소, 휴대전화번호, 이메일, 이메일수신여부</p>
				              </td>
				              <td class="tCenter">회원 탈퇴시까지</td>
				            </tr>
				            <tr>
				              <td class="tCenter">
				                등록비 및 렌탈료 납부
				              </td>
				              <td class="type03 vTop">
				                <p>- 신용카드 결제시 : 카드소유주, 법정생년월일, 사업자번호, 카드사명, 카드번호, 유효기간</p>
				                <p>- 계좌 이체시 : 예금주, 법정생년월일, 사업자번호, 금융사, 계좌번호</p>
				              </td>
				              <td class="tCenter">계약기간 종료시까지</td>
				            </tr>
				            <tr>
				              <td class="tCenter">
				                제품 배송
				              </td>
				              <td class="type03 vTop">
				                <p>- 제품 수취인 및 서비스 이용자이름, 휴대 전화번호, 기타 연락처</p>
				              </td>
				              <td class="tCenter">배송 완료시까지</td>
				            </tr>
				            <tr>
				              <td class="tCenter">
				                부가 서비스 및 이벤트 응모
				              </td>
				              <td class="type03 vTop">
				                <p>- 이름, 전화번호, 주소</p>
				              </td>
				              <td class="tCenter">이벤트 종료시까지</td>
				            </tr>
				          </tbody>
				        </table>
				        <p class="desc mt-m">
				          * 귀하는 넥스트레벨 서비스 이용에 필요한 최소한의 개인정보 수집 이용에 동의하지 않을 권리가 있으며, 동의 거부시 거부한 내용에 대한    서비스가 제한될 수 있습니다.<br/>
				          * 이 외 서비스 이용과정에서 별도 동의를 통해 추가 정보 수집이 있을 수 있습니다.
				        </p> --%>
				      </div>
				    </div>
				  </div>
			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 개인정보 수집 및 이용에 대한 안내  // -->
				
				<!-- layerPopup > 개인(신용)정보 위탁 동의 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-consignment">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-consignment" > <!-- md-show -->

				  <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>개인(신용)정보 위탁 동의</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox inset-xs">
				        <table class="tbl conView" style="width:100%;">
				          <caption>개인(신용)정보 위탁 동의</caption>
				          <colgroup>
				            <col style="width:5%"/>
				            <col style="width:15%"/>
				            <col style="width:20%"/>
				            <col style="width:35%"/>
				            <col style="width:2%"/>
				          </colgroup>
				          <thead>
				          	<tr>
								<th scope="col" class="tCenter">구분</th>
								<th scope="col" class="tCenter">위탁기관</th>
								<th scope="col" class="tCenter">위탁목적</th>
								<th scope="col" class="tCenter" colspan ="2">위탁항목</th>
								<th scope="col" class="tCenter">위탁기간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="tCenter" rowspan ="8" style="width:10%; border-bottom: 1px solid #e0e2e2;">렌탈</td>
								<td class="tCenter" style="width:200px; border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">엔에이치엔 한국 사이버결제㈜</td>
								<td class="tCenter" style="width:200px; border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">결제정보 전송</td>
								<td class="tCenter" colspan ="2" style="width:30%; border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 전화번호, 카드번호, 카드사명, 유효기간, <br>계좌번호 및 은행명, 예금주(카드주)명</br></td>
								<td class="tCenter" colspan ="2" rowspan ="4" style= "border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">계약 종료 시 까지</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">NICE신용정보</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">수납센터 운영 및 채권 추심업무</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">성명, 법정생년월일, 전화번호, 주소, 결제은행, 결제계좌,<br> 카드번호, 카드사명, 유효기간, 예금주(카드주)명</br></td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 0.5px solid #e0e2e2; border-left:1px solid #e0e2e2">렌탈계약대리점</td>
								<td class="tCenter" style="border-bottom: 0.5px solid #e0e2e2; border-left:1px solid #e0e2e2">장착정보 전송</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 0.5px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">성명, 법정생년월일, 전화번호, 주소, 차종, 결제은행, 카드사명</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">㈜쿠콘</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">CMS 출금 동의 ARS 녹취</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">성명, 법정생년월일, 결제은행, 결제계좌</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">와이더랩</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">계약서 우편발송</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 법정생년월일, 전화번호, 주소, 차종, 차량번호, 결제은행, 결제계좌,<br> 카드번호, 카드사명, 유효기간, 예금주(카드주)명</br></td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">발송 후 5일 이내까지</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">방문점검 위탁 사업자</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">방문점검 서비스</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 전화번호, 주소, 차종, 차량번호</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">방문점검 서비스 종료 시 까지</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">에이제이카리안서비스</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">엔진오일 서비스,<br> 방문점검 서비스</br></td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 전화번호, 차량번호, 차종</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">엔진오일 서비스, <br>방문점검 서비스 종료 시 까지</br></td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">방문판매 모집원</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">렌탈 고객 모집</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 전화번호, 차종, 차량번호</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">계약 종료 시 까지</td>
							</tr>
							<tr>
								<td class="tCenter" rowspan ="4" style="width:10%; border-bottom: 1px solid #e0e2e2;">구매</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">엔에이치엔 한국사이버결제㈜</td>
								<td class="tCenter" rowspan ="4" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">결제 정보 전송</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 전화번호, 카드번호, 카드사명, 유효기간, <br>계좌번호 및 은행명, 예금주(카드주)명</br></td>
								<td class="tCenter" rowspan ="4" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">거래 관계가 종료된 후 최장 5년</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">주식회사 카카오페이</td>
								<td class="tCenter" rowspan ="3" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">성명, 전화번호, 카드번호, 카드사명, 유효기간</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">네이버파이낸셜 주식회사</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2; border-right: 1.1px solid #cbcbcb;">NICE페이먼츠㈜</td>
							</tr>
							<tr>
								<td class="tCenter" rowspan ="2" style="width:10%; border-bottom: 1.5px solid #e0e2e2;">공통</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">주식회사 맨파워 코리아</td>
								<td class="tCenter" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">장착 정보 전송</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 법정생년월일, 전화번호, 주소, 차종, 차량번호</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1px solid #e0e2e2; border-left:1px solid #e0e2e2;">장착 완료 시 까지</td>
							</tr>
							<tr>
								<td class="tCenter" style="border-bottom: 1.5px solid #e0e2e2; border-left:1px solid #e0e2e2;">㈜웅진</td>
								<td class="tCenter" style="border-bottom: 1.5px solid #e0e2e2; border-left:1px solid #e0e2e2">고객 상담 센터 운영</td>
								<td class="tCenter" colspan ="2" style="border-bottom: 1.5px solid #e0e2e2; border-left:1px solid #e0e2e2">성명, 법정생년월일, 전화번호, 주소, 차종, 차량번호, 결제은행, 결제계좌, <br>카드번호, 카드사명, 유효기간, 예금주(카드주)명</br></td>
								<td class="tCenter" style="border-bottom: 1.5px solid #e0e2e2; border-left:1px solid #e0e2e2">계약 종료 시 까지</td>
							</tr>
				          </tbody>
				        </table>
				        <p class="desc mt-m">
				          * 넥스트레벨 서비스 제공을 위하여 반드시 필요한 정보제공이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.<br/>
				          * 렌탈 계약을 체결한 고객에 한해서만 위탁되며, 단순 회원 가입고객 정보는 위탁되지 않습니다.
				        </p>
				      </div>
				    </div>
				  </div>

			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 개인(신용)정보 조회 동의  // -->

				<!-- layerPopup > 마케팅 활용 목적의 개인 정보 수집 및 이용에 대한 안내 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-marketingAgree">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-marketingAgree" > <!-- md-show -->

				  <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>마케팅 활용 목적의 개인 정보 수집 및 이용 동의</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox">
				        <table class="table conView">
				          <caption>마케팅 활용 목적의 개인 정보 수집 및 이용 동의</caption>
				          <colgroup>
				            <col style="width:30%"/>
				            <col style="width:30%"/>
				            <col style="width:30%"/>
				            <col style="width:10%"/>
				          </colgroup>
				          <thead>
				            <tr>
				              <th scope="col">이용목적</th>
				              <th scope="col">수집항목</th>
				              <th scope="col">보유기간</th>
				              <th scope="col">동의 여부(선택)</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">마케팅/홍보, 이벤트 등 광고성 정보 전달, 신상품 및 서비스 소개</td>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">성명, 생년월일, 성별, 휴대전화번호, 이메일</td>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;" rowspan="2">회원 탈퇴 시 또는 동의 철회 시</td>
				              <td class="type03 vTop" style="vertical-align:middle;">
				              	<input type="checkbox" id="chk_marketing_agree_first" name="chk_marketing_agree" gbn="notNecessary" class="inputMarktingAgree">
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">신규 서비스 개발, 맞춤 서비스 제공, 접속 빈도 파악, 회원의 서비스 이용에 대한 성향 및 통계학적 특성에 따른 서비스 제공</td>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">접속빈도, 방문시간, 성별, 생년월일, 상품 구매 내역</td>
				              <td class="type03 vTop" style="vertical-align:middle;">
				              	<input type="checkbox" id="chk_marketing_agree_second" name="chk_marketing_agree" gbn="notNecessary" class="inputMarktingAgree">
				              </td>
				            </tr>
				          </tbody>
				        </table>
				        <p class="desc mt-m">
				          * 귀하는 넥스트레벨 서비스 가입 회원에게 다양한 편의 및 정보를 제공하기 위해 필요한 선택적 개인정보 수집 및 이용에 동의하지 않을 권리가 있으며, 동의 거부시 넥스트레벨 계약의 체결 및 유지, 관리에는 영향이 없으나 거부한 내용에 대한 서비스가 제한될 수 있습니다.
				        </p>
				      </div>
				    </div>
				  </div>
			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 마케팅 활용 목적의 개인 정보 수집 및 이용에 대한 안내  // -->
				
				<!-- layerPopup > 영리목적 광고성 정보 수신 동의에 대한 안내 // -->
				<input type="hidden" class="md-trigger" data-modal="modal-advertisementAgree">
				<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-advertisementAgree" > <!-- md-show -->

				  <div class="popContents">
				    <a href="#" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>영리목적 광고성 정보 수신 동의</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox">
				        <table class="table conView">
				          <caption>영리목적 광고성 정보 수신 동의</caption>
				          <colgroup>
				            <col style="width:100%"/>
				          </colgroup>
				          <thead>
				            <tr>
				              <th scope="col">전송내용</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
				              <td class="tCenter" style="text-align:center; vertical-align:middle;">이벤트 및 관련 서비스 안내, 재구매/재렌탈(재계약) 및 프로모션 안내, 기타 유용한 광고나 정보 수신</td>
				            </tr>
				          </tbody>
				        </table>
				        <p class="desc mt-m">
				          * 수신 동의 시 추가 할인 쿠폰과 더 많은 혜택의 기회가 있습니다.
				        </p>
				      </div>
				    </div>
				  </div>
			    </div>
				<!-- <div class="md-overlay"></div> -->
				<!-- layerPopup > 영리목적 광고성 정보 수신 동의에 대한 안내  // -->
				
	<!-- 세이프키 생성 화면 -->
	<%@ include file="/WEB-INF/view/member/createCustSafeKey.jsp" %>
	<!-- 세이프키 생성 화면 -->

	<!-- 사이즈 찾기 팝업 -->
	<%@ include file="/WEB-INF/view/findSizeModal.jsp" %>
	<!-- 사이즈 찾기 팝업 -->

	<input type="hidden" name="extShape" id="extShape" />

	<script type="text/javascript" src="/js/lib/classie.js"></script>
	<script type="text/javascript" src="/js/lib/modalEffects.js"></script>
	
	<!-- ADN Tracker[방문자] start -->
	<script type="text/javascript">
	window.addEventListener('load', function() {
	    var across_adn_contain = new fn_across_adn_contain();
	    var across_adn_param = [];
	    across_adn_param = {"ut":"Home","ui":"107378"};
	    across_adn_contain.init(across_adn_param);
	});
	</script>
	<!-- ADN Tracker[방문자] end -->
	
	<!-- ADN 클로징패널 설치  start -->
	<script type="text/javascript">
	var adn_mobile_panel_param = adn_mobile_panel_param || [];
	adn_mobile_panel_param.push([{
	 ui:'107378',	
	 ci:'1073780002',
	 gi:'102656'
	}]);
	</script>
	<script type="text/javascript" async src="//fin.rainbownine.net/js/across_adn_closed_mobile_ad_1.0.4.js"></script>
	<!-- ADN 클로징패널 설치 end -->
	
<script>
	var rNiceGradeCd = new Array();

	//modal 팝업 닫기1.
	function sendChildValueCancle(callLoca){
		if(callLoca == "rentalOptPop") {
			$("#modal-5").removeClass("md-show");
			$(".layPopClose").click();
		} else {
			$("#" + callLoca).removeClass("md-show");
		}

	}

	//우편 번호 검색 - 검색 버튼 클릭
	function selectJuso(pageNo) {
		if(pageNo != null){
			if(Number(pageNo)  == 0) {
				$("#currentPage").val("1");
			} else {
				if(pageNo == 'mob') {
					var nextPage = Number($("#currentPage").val()) + 1;
					$("#currentPage").val(String(nextPage));
				} else {
					$("#currentPage").val(pageNo);
				}
			}
		} else {
			$("#currentPage").val("1");
		}

		$("#keyword").val($("#jusoTxt").val());

		ComUtil.loading();
		$.ajax({
			 url :"<%= AppContext.getString("zipcd.url") %>"  //인터넷망
			,type:"post"
			,data:$("#jusoFrm").serialize()
			,dataType:"jsonp"
			,crossDomain:true
			,success:function(xmlStr){
				if(navigator.appName.indexOf("Microsoft") > -1){
					var xmlData = new ActiveXObject("Microsoft.XMLDOM");
					xmlData.loadXML(xmlStr.returnXml)
				}else{
					var xmlData = xmlStr.returnXml;
				}

				var errCode = $(xmlData).find("errorCode").text();
				var errDesc = $(xmlData).find("errorMessage").text();
				if(errCode != "0"){
					alert(errDesc);
				}else{
					if(xmlStr != null){
						makeList(xmlData);
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		    ,complete: function() {
		    	ComUtil.unloading();
		    }
		});
	}

	//우편번호 검색 후 목록 그리기
	function makeList(xmlStr){
		var totCnt = Number($(xmlStr).find("totalCount").text());
		$("#totalCount").text(totCnt);

		var htmlStr = "";
		if(totCnt != 0){
			$(xmlStr).find("juso").each(function(){
				htmlStr += "<li>";
				htmlStr += "	<button type='button' class='address-single' onClick='sendTmsChildValue(\""+$(this).find('zipNo').text()+"\",\""+$(this).find('bdMgtSn').text()+"\",\""+$(this).find('roadAddrPart1').text()+" "+$(this).find('roadAddrPart2').text()+"\",\""+$(this).find('jibunAddr').text()+"\",\"" + $(this).find('siNm').text() + "\",\"" + $(this).find('sggNm').text() + "\",\"" + $(this).find('emdNm').text() + "\");'>";
				htmlStr += "		<p class='zipNum text-left mb-s'>"+$(this).find('zipNo').text()+"</p>";
				htmlStr += "		<div class='address layout-r inline-m mb-s'>";
				htmlStr += "			<b class='roadName inline'>도로명</b>";
				htmlStr += "			<span class='inline text-left'>"+$(this).find('roadAddrPart1').text()+"</span>";
				htmlStr += "		</div>";
				htmlStr += "		<div class='address layout-r inline-m'>";
				htmlStr += "			<b class='nomination inline'>지번</b>";
				htmlStr += "			<span class='inline text-left'>"+$(this).find('jibunAddr').text()+"</span>";
				htmlStr += "		</div>";
				htmlStr += "	</button>";
				htmlStr += "</li>";
			});
		}else{
			htmlStr += "<li>"
			htmlStr += "	<p class='zipNum text-left mb-s'>검색결과가 없습니다.</p>"
			htmlStr += "</li>"
			$("#jusoList").html("");
		}

		if($("#currentPage").val() == "1") {
			$("#jusoList").html(htmlStr);
		} else {
			$("#jusoList").append(htmlStr);
		}
		var totCnt = Number($(xmlStr).find("totalCount").text());
		$("#totalCount").text(totCnt);

	}

	//우편 번호 검색 - 검색 버튼 클릭
	//우편 번호 결과 화면에서 다시 주소를 검색했을 때 다시 검색 목록이 나오도록 , MEPARK
	function selectReJuso(pageNo) {
		//MEPARK
		$("#jusoTxt").val($("#jusoReTxt").val());
		$("#modal-Addr").addClass("md-show");
		$("#modal-AddtDtl").removeClass("md-show");

		if(pageNo != null){
			if(Number(pageNo)  == 0) {
				$("#currentPage").val("1");
			} else {
				$("#currentPage").val(pageNo);
			}
		} else {
			$("#currentPage").val("1");
		}

		$("#keyword").val($("#jusoReTxt").val());

		ComUtil.loading();
		$.ajax({
			 url :"<%= AppContext.getString("zipcd.url") %>"  //인터넷망
			,type:"post"
			,data:$("#jusoFrm").serialize()
			,dataType:"jsonp"
			,crossDomain:true
			,success:function(xmlStr){
				if(navigator.appName.indexOf("Microsoft") > -1){
					var xmlData = new ActiveXObject("Microsoft.XMLDOM");
					xmlData.loadXML(xmlStr.returnXml)
				}else{
					var xmlData = xmlStr.returnXml;
				}

				var errCode = $(xmlData).find("errorCode").text();
				var errDesc = $(xmlData).find("errorMessage").text();
				if(errCode != "0"){
					alert(errDesc);
				}else{
					if(xmlStr != null){
						makeList(xmlData);
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		    ,complete: function() {
		    	ComUtil.unloading();
		    }
		});
	}

	//우편번호 검색 후 상세 우편 번호 입력으로 넘어갈 때. - 검색 목록 중 한개 클릭
	function sendChildValue(zipCode, bdMgtSn, load, jibun) {
		if(jusoGbn == "A") {
			$("#bldMngNo").val(bdMgtSn);
		}

		$("#modal-Addr").removeClass("md-show");
		$("#popZipCode").text(zipCode);
		$("#popLoadAddr").text(load);
		$("#popJibunAddr").text(jibun);
		$("#bldMngNoMob").text(bdMgtSn);	// 건물관리번호
		$("#modal-AddtDtl").addClass("md-show");

		//MEPARK
		$("#jusoReTxt").val($("#jusoTxt").val());

	}

	//TMS용 상세 우편 번호
	function sendTmsChildValue(zipCode, bdMgtSn, load, jibun, siNm, sggNm, emdNm) {
		if(jusoGbn == "A" || mountCheck1 == "P2") { //주문자 정보 탭에서 호출할 때 == 'A'
			$("#bldMngNo").val(bdMgtSn);
			$("#popPkLoca").attr("style","display:none;");
			console.log('jusoGbn TEST::', jusoGbn);
		}
		//if(jusoGbn != "A") {
		else {
			$("#popPkLoca").attr("style","display:block;");
		}

		//우편검색창 재 호출 시, 차량주차 위치 초기화.
		$("input:radio[name='pkLoca']").prop("checked", false);

		$("#modal-Addr").removeClass("md-show");
		$("#popZipCode").text(zipCode);
		$("#popLoadAddr").text(load);
		$("#popJibunAddr").text(jibun);
		$("#bldMngNoMob").text(bdMgtSn);	// 건물관리번호
		$("#popSiNm").text(siNm);
		$("#popSggNm").text(sggNm);
		$("#popEmdNm").text(emdNm);
		$("#modal-AddtDtl").addClass("md-show");

		//MEPARK
		$("#jusoReTxt").val($("#jusoTxt").val());
		$('#popDetailAddr').val('');//상세주소 초기화
	}

	// 주소정보 callback 처리
	function fn_returnInfo() {

		if($('#popDetailAddr').val() == ""){
			alert("상세주소를 입력하세요.");
			$('#popDetailAddr').focus();
			return false;
		}
		
		if(location.pathname == "/mypage/myRecommend") {
		
		}
		else{
			if(ValidUtil.isEmpty($("input[name='pkLoca']:checked").val()) && (jusoGbn != 'A' && mountCheck1 != "P2")) {//PME 2020-02-12
				ComUtil.alert("차량 주차 위치를 선택해주세요.");
				return;
			}
		}
						
		var cbData = {
				  popLoadAddr : $("#popLoadAddr").text()
				, popDetailAddr : $("#popDetailAddr").val()
				, popZipCode : $("#popZipCode").text()
				, bldMngNo : $("#bldMngNoMob").text()
				, popSiNm : $("#popSiNm").text()
				, popSggNm : $("#popSggNm").text()
				, popEmdNm : $("#popEmdNm").text()
				, pkLoca : $("input[name='pkLoca']:checked").val()
		};

		// return function
		returnAddrInfo(cbData);

		//$('#popDetailAddr').val('');
		sendChildValueCancle('modal-AddtDtl');
	}
	//차량번호 입력시 공백제거
	function SchNullKey(){
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if(evt_code == 32){
		    event.preventDefault();
		}
	}

	function carNumValidation() {
		if(location.pathname == "/product/prdDetail") {
		} else {
			<%if(SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO) == null){ %>
				alert("로그인 후 사용 가능합니다.");
				location.href = "/login/userLogin";
				return;
			<%}%>
		}

		var niceCarNo = $("#carNumber").val().replace(/(\s*)/g, "");

		if(niceCarNo == "") {
			alert("차량번호를 입력해 주세요.");
			return false;
		} else {
			//차량번호 패턴
			var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 12저3456
			var pattern2       	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 			// 123저3456 - 신규 찰야 번호
			var pattern3 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234

			if(niceCarNo.length == 7 ){
				if( !pattern1.test(niceCarNo) ){
					alert( "차량번호를 확인하세요.");
					$("#carNumber").val("");
					$("#carNumber").focus();
					return false;
				}
			} else if( niceCarNo.length == 8 &&  ValidUtil.isNumeric( niceCarNo.substring(0,3))){
				if( !pattern2.test(niceCarNo) ){
					alert( "차량번호를 확인하세요.");
					$("#carNumber").val("");
					$("#carNumber").focus();
					return false;
				}
			} else if( niceCarNo.length == 8 || niceCarNo.length == 9){
				if( !pattern2.test(niceCarNo) ){
					alert( "차량번호를 확인하세요.");
					$("#carNumber").val("");
					$("#carNumber").focus();
					return false;
				}
			} else {
				alert( "차량번호를 확인하세요.");
				$("#carNumber").val("");
				$("#carNumber").focus();
				return false;
			}
		}

		/* var data = {
				carInfo : {
					BRAND_NM : "기아"
					,REP_CAR_CLASS_NM : "로체"
					,CAR_CLASS_NM : "로체 어드밴스"
					,ENGINE_FORM : "Threta 2.0 LPi"
				}
		}
		callBackManager.niceGradeList(data); */
		//나이스 DNR 통신
		//MEPARK 임시로 주석. 개발서버에서만 확인 가능
		ComUtil.loading();

		$.ajax({
		    url: "/product/niceDnrApi",
		    type: "POST",
		    cache:false,
		    data: {carNo:niceCarNo},
		    success: function(data) {
		    	if(data.code == "000") {
		    		var rData = data;
		    		returnCarNumInfo(rData);
		    	} else if(data.code == "014") {
		    		alert("로그인이 필요합니다. 로그인 화면으로 이동 하시겠습니까?");
			    	location.href = "/login/userLogin";
			    	return;
			    } else if(data.code == "022") {
			    	alert("차량번호 또는 소유자명 불일치");
			    	$("#carNumberSearchImg").attr("style","display:none;");
			    	$("#carNumberSearchFailImg").attr("style","display:block;");
			    	return;
			    } else {
			    	alert("시스템 오류. ("+ data.code+")");
			    	return;
			    }
		    },
		    error: function (request, status, error) {
		    	console.log("serviceError : " + error);
		    	ComUtil.unloading();
			},
		    complete: function() {
		    	ComUtil.unloading();
		    }
		});
	}

	function returnCarNumInfo(rData) {
		rNiceGradeCd = [];
		for(var i=0; i<rData.gradeList.length; i++) {
			rNiceGradeCd.push(rData.gradeList[i].CAR_GRADE_NBR);
		}

		$('#searchNiceDnrButton').css("display","");
		//완료 팝업 생성
		var htmlStr = "";

		htmlStr += "<div class='number-search layout-c inset-l'>";
		htmlStr += "	<h3>차량번호</h3>";
		htmlStr += "	<div class='result-research'>";
		htmlStr += "		<input type='text' class='research-input' id='niceResultCarNo' readonly='readonly'>";
		htmlStr += "	</div>";
		htmlStr += "	<h3>제조사/차종</h3>";
		htmlStr += "	<div class='result-car'>" + rData.carInfo.BRAND_NM + " | " + rData.carInfo.REP_CAR_CLASS_NM + "</div>";
		htmlStr += "	<h3>모델</h3>";
		htmlStr += "	<div class='result-brand'>" + rData.carInfo.CAR_CLASS_NM + "</div>";
		htmlStr += "	<h3>엔진타입</h3>";
		htmlStr += "	<div class='result-km'>" + rData.carInfo.ENGINE_FORM + "</div>";
		htmlStr += "	<p class='inset-m mt-l'>";
		htmlStr += "		<img src='"+rData.carInfo.CAR_CLASS_REP_IMAGE+"' alt='상품사진'>";
		htmlStr += "	</p>";
		htmlStr += "</div>";
		$("#carNumberStep02").html(htmlStr);

		$("#niceResultCarNo").val($("#carNumber").val().replace(/(\s*)/g, ""));	//타이틀

		//차종 SUV, SEDAN, 나머지..
		$("#extShape").val(rData.carInfo.EXT_SHAPE);

		//화면 disabled
		$("#carNumberStep01").attr("style","display:none;");
		$("#carNumberStep02").attr("style","display:block;");
		//사이즈 선택 버튼은 검색 성공때만 보인다. MEPARK
		$(".next-box.carNumNxt").css({
			'display':'flex',
    		'height': 60
		});
	}

	function niceDnrTireSize() {
		var curUrl = $(location).attr('pathname');
		var extShape = $('#extShape').val();
		var classCd = "";

		//사이즈 구조가 바뀌게 되어 화면마다 분기를 시켜줘야 함. 2019-12-18
		if(curUrl == '/product/prdDetail'){//주문 상세페이지
			niceDnrTireSizePrdDetail(rNiceGradeCd, extShape);
		}else{
			if(extShape.indexOf("SEDAN") != -1){
				classCd	= "P1";
			}else if(extShape.indexOf("SUV") != -1){
				classCd	= "S1";
			}else{
				classCd	= "V1";
			}

			//사이즈 목록 조회
			var pUrl = "/product/selectTireSizeList";
			var pSendData = {classCd : classCd, niceGradeCd:rNiceGradeCd, systemGbn:"R"};
			ComUtil.loading();
			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache:false,
			    data: JSON.stringify(pSendData),
			    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
		    		var htmlStr = "";
		    		htmlStr	+= "<div class='simple-swipe'>";
		    		htmlStr	+= "<div class='inset-m'>" + $("#makerNm").val() + "</div>";
		    		htmlStr	+= "<div class='step on'></div>";
		    		htmlStr	+= "<div class='inset-m'>"+ $("#modelNm").val() +"</div>";
		    		htmlStr	+= "<div class='step on'></div>";
		    		htmlStr	+= "<div class='inset-m current'>사이즈 선택</div>";
		    		htmlStr	+= "</div>";

		    		htmlStr	+= "<div class='inset-m'>";
		    		htmlStr	+= "<h3>렌탈</h3>";
		    		htmlStr	+= "<div class='size-wrap'>";
		    		htmlStr	+= "<ul class='size-select'>";

					for(var i=0; i < data.length; i++) {
						htmlStr	+= "		<li class='radio col-2'>";
						htmlStr += "			<input type='radio' name='sizeCd' id='sizeCdR" + (i+1) + "' value='"+data[i].searchCd+"' sizeNm='"+data[i].description + " "+ data[i].searchCdNm+"' classCd='"+data[i].classCd+"' plyRating='"+data[i].plyRating+"' matCd='"+data[i].matCd+"' frCd='"+data[i].frCd+"' makerCd='"+data[i].makerCd+"' modelCd='"+data[i].modelCd+"' contentsCd='"+data[i].contentsCd+"' systemTab='R' class='type04'>";
						htmlStr	+= "			<label for='sizeCdR"+(i+1)+"'>" + data[i].description+ " " + data[i].searchCdNm + "</label>";
						htmlStr	+= "		</li>";
					}

		    		htmlStr	+= "</ul>";
		    		htmlStr	+= "</div>";

					var	pO2o = {classCd : classCd ,niceGradeCd:rNiceGradeCd, systemGbn:"DD"};
						$.ajax({
						    url: "/product/selectTireSizeList",
						    type: "POST",
						    cache:false,
						    data: JSON.stringify(pO2o),
						    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
						    success: function(data) {
						    	if(data != null) {

						    		htmlStr	+= "<h3>구매</h3>";
						    		htmlStr	+= "<div class='size-wrap'>";
						    		htmlStr	+= "<ul class='size-select'>";
									for(var i=0; i < data.length; i++) {
										htmlStr	+= "		<li class='radio col-2'>";
										htmlStr += "			<input type='radio' name='sizeCd' id='sizeCdO" + (i+1) + "' value='"+data[i].searchCd+"' sizeNm='"+data[i].description + " "+ data[i].searchCdNm+"' classCd='"+data[i].classCd+"' plyRating='"+data[i].plyRating+"' matCd='"+data[i].matCd+"' frCd='"+data[i].frCd+"' makerCd='"+data[i].makerCd+"' modelCd='"+data[i].modelCd+"' contentsCd='"+data[i].contentsCd+"' systemTab='O' class='type04'>";
										htmlStr	+= "			<label for='sizeCdO"+(i+1)+"'>" + data[i].description+ " " + data[i].searchCdNm + "</label>";
										htmlStr	+= "		</li>";
									}
						    		htmlStr	+= "</ul>";
						    		htmlStr	+= "</div>";

						    	}

								$("#sizeArea15").html();
								$("#sizeArea15").html(htmlStr);

								$("#modal-carNumSearch").removeClass("md-show");
								$("#modal-15").addClass("md-show");

						    },
						    error: function (request, status, error) {
						    	/* $('#loadingWrapnew').css("display","none"); */
						    	callBackManager.error(error);
							}
						});
			    },
			    error: function (request, status, error) {
			    	console.log("serviceError : " + error);
				},
			    complete: function () {
			    	ComUtil.unloading();
			    }
			});
		}
	}

	function returnCarNumSizeInfo(rData) {




		var htmlStr = "";
		htmlStr	+= "<div class='simple-swipe-outer'>";
		htmlStr	+= "	<div class='simple-swipe-box'>";
		htmlStr	+= "		<div class='simple-swipe'>";
		htmlStr	+= "			<div class='inset-m'>차량번호 " + $("#carNumber").val() + "</div>";
		htmlStr	+= "			<div class='step on'></div>";
		htmlStr	+= "			<div class='inset-m current'>사이즈</div>";
		htmlStr	+= "			<div class='step'></div>";
		htmlStr	+= "			<div class='inset-m'></div>";
		htmlStr	+= "		</div>";

		htmlStr	+= "		<ul class='size-select inset-m'>";
		for(var i=0; i < rData.length; i++) {
			htmlStr	+= "		<li class='radio col-2'>";
			htmlStr += "			<input type='radio' name='sizeCd' id='sizeCd" + (i+1) + "' value='"+rData[i].searchCd+"' sizeNm='"+rData[i].description + " "+ rData[i].searchCdNm+"' classCd='"+rData[i].classCd+"' plyRating='"+rData[i].plyRating+"' searchClCd='"+rData[i].searchClCd+"' modelCd='"+rData[i].modelCd+"' mcmpCd='"+rData[i].mcmpCd+"' contentsCd='"+rData[i].contentsCd+"' frCd='"+rData[i].frCd+"' matCd='"+rData[i].matCd+"' >";
			htmlStr	+= "			<label for='sizeCd"+(i+1)+"'>" + rData[i].searchCdNm + "</label>";
			htmlStr	+= "		</li>";
		}
		htmlStr	+= "		</ul>";
		htmlStr	+= "	</div>";
		htmlStr	+= "</div>";

		$("#carSearchSizeArea").html(htmlStr);

		$("#modal-carNumSearch").removeClass("md-show");
		$("#modal-CarNumSize").addClass("md-show");
	}

	function reSearchCarNum() {
		//$("#carNumberStep02").html("");//검색결과 내용을 비운다.
		$("#carNumberStep02").empty();
		$("#niceResultCarNo").val("");//검색결과 차번호를 지운다.
		$("#carNumber").val("");//기존 차량번호 검색 내용을 지운다.
		console.log("1:");
		//화면 disabled
		$("#carNumberStep01").attr("style","display:block;");
		$("#carNumberStep02").attr("style","display:none;");

		console.log("2:");
		//사이즈 선택 버튼은 검색 성공때만 보인 다. MEPARK
		$(".next-box.carNumNxt").css({
			'display': 'block',
    		'height': 0,
    		'overflow': 'hidden'
		});
	}

	//사이즈 , 인치 선택 이벤트 > 사이즈 , 인치 선택 화면 오픈
	$(document).on("click","input[name='sizeCd']" , function(){

		var rData = {
				rValue 		: $(this).val(),
				rSizeNm 	: $(this).attr("sizeNm"),
				rClassCd 	: $(this).attr("classCd"),
				rPlyRating 	: $(this).attr("plyRating"),
				rSearchClCd : $(this).attr("searchClCd"),
				//rModelCd 	: $(this).attr("modelCd"),
				rCarNo 		: $("#carNumber").val().replace(/(\s*)/g, ""),
				//rMatCd 		: $(this).attr("matCd"),
				//rFrCd 		: $(this).attr("frCd"),
				rMcmpCd 	: $(this).attr("mcmpCd"),
				//rContentsCd : $(this).attr("contentsCd"),
				//rModelCd 	: $(this).attr("modelCd"),
				classCd 	: $(this).attr("classCd"),
				//makerCd		: $(this).attr("makerCd")
		}

		returnNiceDnrSizeInfo(rData);
		reSearchCarNum();
	});

	// 이용약관
	function termOfServicePup(){
		console.log("termOfServicePup Call");
		$("#modal-termOfService").addClass("md-show");
	}


	// 개인정보처리방침
	function privacyPolicyPup(){
		console.log("privacyPolicyPup Call");
		$("#modal-privacyPolicy").addClass("md-show");
	}

	// 약관팝업열기
	function policyLayPopOpen(id){
		console.log("policyLayPopOpen 1 : " + id);
		$("#"+id).addClass("md-show");
		$("#"+id).show();
	}

	// 팝업 닫기
	function layPopClose(id){
		console.log("layPopClose Call 1!!");
		$("#"+id).removeClass("md-show");
		$("#"+id).hide();
	}

	// Family Site 이동
	function fn_goToSite(selTp){

		var goToUrl;
		if (selTp == '01') {
			goToUrl = $("#familySite").val();
		} else {
			goToUrl = $("#globalSite").val();
		}

		window.open(goToUrl);
	}

	function fn_safeKeyView() {
		<%if(SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO) == null){ %>
			alert("로그인 후 사용 가능합니다.");
			location.href = "/login/userLogin";
			return;
		<%}else{%>
			$(".allMenuClose").click();
			$('#modal-SafeKey').addClass("md-show");
		<%}%>
	}

	/* 나이스 차량 한글과 숫자만 입력 가능 */
	function fn_press_nice(obj)
	{
	    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
	    || event.keyCode == 46 ) return;
	    var deny_pattern = /[^0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\u318D\u119E\u11A2\u2022\u2025a\u00B7\uFE55]/g ; //정규식 숫자+한글+천지인의 점
	    obj.value = obj.value.replace(deny_pattern, '');

	}

	$('#popDetailAddr').click(function() {
		$('#addrBottomBox').hide();
		$("#addrBottomBox2").show();
		$("#popDetailAddrSec").focus();
	});

	function fn_returnAddrDetail() {
		$("#popDetailAddr").val($("#popDetailAddrSec").val());
		$('#addrBottomBox2').hide();
		$("#addrBottomBox").show();
	}

	$("#popDetailAddrSec").blur(function() {
		$("#popDetailAddr").val($("#popDetailAddrSec").val());
		$('#addrBottomBox2').hide();
		$("#addrBottomBox").show();
	});

</script>
