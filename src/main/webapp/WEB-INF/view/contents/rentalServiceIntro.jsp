<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.nexwrms.core.constants.CoreConstants"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants"%>
<%@ page import="com.nexwrms.core.context.AppContext"%>

<link rel="stylesheet" type="text/css" href="/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="/css/rentalserviceintro.css"/>


<!-- subContentsWrap -->
<div class="subContentsWrap">
	<main class="o2o"> <!-- header -->
		<div class="page-header">
			<img src="/img/service/rental/key_visual_txt.png" alt="국내 최초 신개념 타이어 렌탈 서비스! 나에게 맞는 합리적인 타이어 렌탈!"/>
		</div>
		<!-- //header -->
		
		<div class="service-seciton-01">
			<h3> NEXT LEVEL 타이어 렌탈<span class="light">이란?</span> </h3>
			<p> 
				목돈 부담 없는 타이어 교체는 물론, 계약기간 동안 <br/>
				타이어가 파손되어도 걱정 없는 타이어 교체 서비스입니다.
			</p>
			<img src="/img/service/rental/what_is.png" alt=""/>
		</div>


		<div class="service-seciton-02">
			<h3>넥센타이어 렌탈만의 장점 소개</h3>
			
			<div class="benefit-item">
				<h4>
					1. 목돈 부담없이 타이어 교체
				</h4>
				<p>
					비싼 타이어 비용을 월 렌탈료로 나눠 내 부담이 적습니다.
				</p>
				<img src="/img/service/rental/benefit_ico_01.png" alt=""/>
			</div>
			<div class="benefit-item">
				<h4>
					2. 제휴카드 이용 시, 공짜로 타이어 렌탈
				</h4>
				<p>
					제휴카드를 이용하면 최대 0원으로 고급형 타이어를 교체할 수 있습니다.
				</p>
				<img src="/img/service/rental/benefit_ico_02.png" alt=""/>
			</div>
			<div class="benefit-item">
				<h4>
					3. 계약 만료되어도 타이어 반납 없이 이용
				</h4>
				<p>
					렌탈 계약 이후에도 타이어 반납 없이 사용이 가능합니다.
				</p>
				<img src="/img/service/rental/benefit_ico_03.png" alt=""/>
			</div>
			<div class="benefit-item">
				<h4>
					4. 주행 중 파손 및 조기 마모 되어도 무상 교체
				</h4>
				<p>
					추가 렌탈료 없이 렌탈 계약기간 동안 고객 과실로 인한 타이어 <br/>	파손도 무상으로 교체해드립니다.
				</p>
				<img src="/img/service/rental/benefit_ico_04.png" alt=""/>
			</div>
			<div class="benefit-item">
				<h4>
					5. NEXT LEVEL CHECK서비스
				</h4>
				<p>
					렌탈 계약기간 동안 주기적으로 가까운 렌탈전문점에 방문하여  <br/>	타이어 무상점검을 받으실 수 있습니다.
				</p>
				<img src="/img/service/rental/benefit_ico_05.png" alt=""/>
			</div>
		</div>





		<div class="service-seciton-03">

			<h3> 타이어렌탈 장착 과정 안내  </h3>
			<p> 고객센터(☎1855-0100), 렌탈전문점에서도 주문 가능합니다.			</p>

			<img src="/img/service/rental/step.png" alt="타이어주문 - 인터넷으로 쉽고 간편하게 주문 / 무료배송 - 내가 지정한 전문 렌탈점으로 배송 / 도착문자발송 - 주문제품 전문 렌탈점에 도착완료 알림 / 무료장착 - 주문한 렌탈 전문점 방문 / 친절한 해피콜 - 렌탈계약 확인 및 만족도 전화 / 안전운전 - 새 타이어로 언제나 안전운전 / 주기적 정기점검 - 정기 점검 서비스"/>

		</div>


		<div class="service-seciton-04">

			<h3> 타이어렌탈 상품 안내 </h3>
			<p class="desc"> 상품의 종류, 서비스 선택에 따라 렌탈료는 변경될 수 있습니다.</p>
<div class="text-center">
	
				<img src="/img/service/rental/rental_type.png" alt="알뜰케어 렌탈 :  - 타이어 렌탈 - 위치교환 1회 - NEXT LEVEL CHECK (대리점 점검 서비스) - 무상 파손 보증 / 안심케어 렌탈 :  - 알뜰케어 렌탈 - 얼라인먼트 1회 (얼라인먼트 품질 보증) - 무상 파손 보증 - 무상 조기 마모 보증 / 자유 렌탈 :  - 알뜰케어 렌탈 - 고객 선택 서비스 1) 타이어 무상 교체 2) 얼라인먼트 3) 위치교환"/>
</div>

		</div>


	<!-- //타이어 렌탈 상품 안내 --> <!-- 타이어 렌탈 서비스 -->
	<div class="service-seciton-05">

		<h3> 타이어렌탈 서비스 안내 </h3>
		<p class="desc"> 넥센타이어 렌탈만의 차별화된 서비스를 소개합니다.</p>

		<div class="service-year-type">
			<div class="service-year-type-item">
				<div>2019년 2월 ~ 2020년 10월</div>
				<a href="#;" class="go-view md-trigger" data-modal="modal-3"><b>계약고객 안내</b></a>
			</div>
			<div class="service-year-type-item">
				<div>2018년 3월 ~ 2019년 1월</div>
				<a href="#;" class="go-view md-trigger" data-modal="modal-2"><b>계약고객 안내</b></a>
			</div>
			<div class="service-year-type-item">
				<div>2016년 1월 ~ 2018년 2월</div>
				<a href="#;" class="go-view md-trigger" data-modal="modal-1"><b>계약고객 안내</b></a>
			</div>
		</div>


	</div>



	<!-- //타이어 렌탈 서비스 --> <!-- TAB 컨텐츠 -->
	<div class="service-tab">
		<div class="tab-nav js-tab layout-r inline same-size">
			<button type="button" id="liTab1" data-tab="tab-1" class="inline current">무상 파손/조기 마모 보증 서비스</button>
			<button type="button" id="liTab2" data-tab="tab-2" class="inline">위치교환/얼라인먼트 서비스</button>
			<button type="button" id="liTab3" data-tab="tab-3" class="inline">NEXT LEVEL CHECK 서비스</button>
		</div>
		<div class="service-list-type02">
			<section id="tab-1" class="tab-content">
				<div class="warranty-info">
					<dl >
						<dt>
							<div class="numTitle">
								<span class="num">01</span>
								<h3>무상 파손 보증</h3>
							</div>
						</dt>
						<dd>
							<p>
								<strong>무상 파손보증 서비스란?</strong><br/>
								계약 기간 동안 사용자 과실의 타이어 파손 시 동일 타이어로 무상 교체해드리는 서비스입니다.<br/>
								대상 : 타이어렌탈 고객 중 보증 서비스 가입자<br/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(사계절용 타이어, 승용/SUV 차종에 한함)
							</p>
							<img src="../img/service/rental/damage_img.png" alt=""/>
							
						</dd>
					</dl>
					
					<dl>
						<dt>
							<div class="numTitle">
								<span class="num">02</span>
								<h3>무상 파손/조기 마모 보증 서비스</h3>
							</div>
						</dt>
						<dd>
							<p>
								<strong>무상 파손/조기 마모 보증 서비스란?</strong><br/>
								계약 기간 동안 사용자 과실의 타이어 파손/조기 마모 시 동일 타이어로 무상 교체해드리는 서비스입니다.<br/>
								대상 : 초기 장착과 동시에 휠 얼라인먼트 서비스를 완료한 타이어렌탈 고객 중 보증 서비스 가입자<br/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (사계절용 타이어, 승용/SUV 차종에 한함)
							</p>
							<img src="../img/service/rental/abrasion_img.png" alt=""/>
						</dd>
					</dl>
					
					<div class="warranty-howto">
						<div class="howto-join">
							<h4>
								보증 서비스 가입 방법
							</h4>
							<p>
								① 장착 익일 고객님 휴대폰으로 URL 문자 발송 → 보증 서비스 가입<br/>
								② 넥스트레벨 홈페이지 로그인 → 마이페이지 → 계약번호 선택 → 보증 서비스 가입 <br/>
								<small>※ 정확한 사진 미 첨부 시, 보증 서비스 가입이 거절 될 수 있습니다.</small>
							</p>
							<img src="../img/service/rental/warranty_join.png" alt=""/>
						</div>
						
						<div class="howto-use">
							<h4>
								타이어 파손 후 보증 서비스 신청 방법<small>(조기 마모 동일)</small>
							</h4>
							<p>
								① 타이어렌탈 고객센터☎1855-0100 접수<br/>
								② 넥스트레벨 홈페이지 로그인 → 마이페이지 → 계약번호 선택 → 보증 서비스 신청<br/>
								<small>※ 정확한 사진 미 첨부 시, 보증 서비스 신청이 거절 될 수 있습니다.</small>
							</p>
							<img src="../img/service/rental/warranty_use.png" alt=""/>
						</div>
					</div>

					<div class="warranty-noti">
						※ 무상 보증 서비스에 대한 자세한 내용 및 보증 범위는<br/> <a href="/contents/guaranteeSystem">[보증제도 안내]</a>에서 확인 가능합니다.
					</div>

					

				</div>


			</section>

			<section id="tab-2" class="tab-content tab02">
				<dl>
					<dt>
						<div class="numTitle">
							<span class="num">01</span>
							<h3>무료 위치 교환 서비스</h3>
						</div>
					</dt>
					<dd>
						<p>
							정기적으로 타이어 위치교환을 해주면 4개의 타이어를 일정하게
							마모시킴으로써 수명을 연장할 수 있습니다. 주행거리에 따라 위치교환 주기가 달라지지만 연 1회 정도 위치교환 서비스를  받으면 4개의 타이어가 비슷하게 마모가 됩니다.
						</p>
						<img src="/img/service/inner_img_01.jpg" alt="">
					</dd>
				</dl>
				<dl>
					<dt>
						<div class="numTitle">
							<span class="num">02</span>
							<h3>얼라인먼트 교정 서비스</h3>
						</div>
					</dt>
					<dd>
						<p>
							타이어의 교체 후 정기적인 얼라인먼트 교정은 차량의 방향성을 좋아지게 하여 안정성을 높여주며, 타이어의 균형적인 마모를 통해 수명을 늘릴 수 있습니다. 
						</p>
						<img src="/img/service/inner_img_02.jpg" alt="">
						<p class="small">
							※ 휠얼라인먼트(바퀴 정렬): <br/>
							 주행 안정성, 조정성, 타이어 마모와 연관이 깊다.
						</p>
					</dd>
				</dl>
			</section>

			<section id="tab-3" class="tab-content tab03">
				<dl>
					<dt>
						<h3>고객의 눈으로 안심할 때까지</h3>
					</dt>
					<dd>
						<p>
							매일 같이 타고 다니는 자동차, 주기적인 점검이 필요합니다.
							고객님 근처 렌탈전문점으로 내방하시어 편안하게 타이어 뿐만 아니라 차량도 문제 없는지 점검 받아 보세요.
						</p>
						<img src="/img/service/rental/service_check_img.jpg" alt="">
						<p>
							※ 렌탈전문점 사정에 따라 타이어 외 정비는 제한될 수 있습니다.
						</p>
					</dd>
				</dl>
			</section>
			
			
		</div>
	</div>
	<!-- //TAB 컨텐츠 -->

	<div class="service-seciton-07 service-tab">

		<h3> 타이어렌탈 제휴카드 안내 </h3>
		<p class="desc"> 제휴카드를 이용하면 더욱 부담 없는 가격으로 렌탈 서비스  이용이 가능합니다.</p>




		<div class="">
			<div class="service-data inline-m text-left pb-m">
				<div class="mt-m service-data-detail layout-c">
					<p class="detail-inner">
						N'FERA SUPREME 245/40R 19<br/>
알뜰케어 렌탈 4본 36개월 계약기준 

					</p>
					<p class="detail-inner">
						<b><mark>
						                     비싼 19인치 타이어도 타이어렌탈 시, <br>
								제휴카드 월 30만원 이상 이용하면<br> 최대 월 1만 3천원 할인!!
							</mark></b>
					</p>
					<p class="detail-inner full-width text-right">
						<img src="/img/service/rental/inner_car_img_01.png" alt="" style="width: 83%;">
					</p>
				</div>
			</div>
		</div>
		<div class="">
			<div class="">
				<div class="service-data-detail layout-c">
					<div class="card-example">
						<p>
							<img src="../img/service/rental/inner_card_sample_01.png" alt="">
						</p>
						<p>
							<img src="../img/service/rental/inner_card_sample_02.png" alt="">
						</p>
					</div>

<div class="precaution">
	
						<b>유의사항</b>
						<ul>
							<li>제휴카드사별 할인 금액 및 할인 조건은 상이함 (카드사별 안내 페이지 참조해주세요)</li>
							<li>해당 계산은 넥센타이어 하나카드, 우리카드로 계산한 내용입니다.</li>
							<li>제휴카드 할인은 청구할인으로 실제 렌탈료 결제시 할인이 아닌 카드사에서 고객님께 카드비용을 청구하는
								시점에 할인이 적용됩니다.</li>
						</ul>
</div>


				</div>
			</div>
	
			<div class="inner-service-tab">
				<div class="tab-nav js-tab-inner layout-r inline same-size">
					<!-- <button type="button" id="" data-tab="inner-tab-2" class="inline current"><span>우리</span> <span>카드</span></button> -->
					<button type="button" id="" data-tab="inner-tab-3" class="inline"><span>롯데</span> <span>카드</span></button>
					<button type="button" id="" data-tab="inner-tab-1" class="inline"><span>하나</span> <span>카드</span></button>
					<button type="button" id="" data-tab="inner-tab-4" class="inline"><span>국민</span> <span>카드</span></button>
				</div>
	
				<div class="service-list-inner-tab">
				<!-- tab-1 -->
					 <section id="inner-tab-1" class="tab-content-inner"> 
						 <div class="inset-m pl-0 pr-0"> 
							 <div class="text-center"> 
								 <h3>넥센타이어 하나카드</h3> 
								 <img src="/img/service/card_hana.png" alt="" class="card-l"> 
							 </div> 
							 <div class="card-info-01 stack-m"> 
								 <div class="stack layout-r inline-m align-center"> 
									 <div class="inline number align-middle">01</div> 
									 <div class="layout-c"> 
										 <div class="inline title">하나카드 신청 콜센터</div> 
										 <div class="inline tel">1599-6538</div> 
									 </div> 
								 </div> 
								 <div class="stack layout-r inline-m align-center"> 
									 <div class="inline number align-middle">02</div> 
									 <div class="layout-c"> 
										 <div class="inline title"> 
											 렌탈료 자동이체 신청<br> 
											 <span>넥센타이어 고객센터</span> 
										 </div> 
										 <div class="inline tel">1855-0100</div> 
									 </div> 
								 </div> 
								 <div class="text-center"> 
									 <small>제휴카드 관련 규정은 카드사의 홈페이지를 통해서 확인하세요.</small> <a 
										 href="https://m.hanacard.co.kr/MKCDCM1010M.web?CD_PD_SEQ=11875" class="go-view"><b>자세히 
											 보기</b></a> 
								 </div> 
							 </div> 
	
							 <div class="card-info-02"> 
								 <div class=""> 
									 <p> 
										 <b>넥센타이어 렌탈료 할인 서비스는 해당 카드로 렌탈료 자동이체 시 적용됩니다.</b> 
									 </p> 
									 <small>- 넥센타이어 렌탈료 결제 시 청구 할인됩니다.<br/> 
								 - 지난달 1일부터 말일까지(승인시점 기준) 국내외 일시불/할부 이용금액 30만원/70만원 이상 시 서비스 제공<br/> 
								 - 지난달 이용실적 산정 제외 대상 : 넥센타이어 렌탈 청구할인 적용 받은 매출금액 전체, 아파트관리비, 국세, 지방세, 공과금, 상품권, 선불카드 충전, 기프트카드 구매, 도시가스, 대학등록금 이용금액<br/> 
								 &nbsp;&nbsp;&nbsp;최초 카드 사용 등록 후 다음달 말일까지는 지난달 카드 실적 30만원 미만 시에도 카드 실적 30만원 이상 70만원 미만 기준으로 제공<br/> 
								 - 할부 사용 건은 사용 월의 사용금액으로 전액 합산 처리<br/> 
								 - 서비스별 월 한도는 매달 1일부터 말일까지의 국내외 일시불/할부 원금 합계금액을 기준으로 산정되며, 매출 취소 시 취소 접수된 월의 사용금액 및 적립대상금액에서 차감<br/> 
								 - 교통요금, 통신요금, 해외 이용금액 등 무승인 매입의 경우 매출접수 월의 사용금액에 반영<br/> 
									 </small> 
									 <ul> 
										 <li> 
											 <div class="inner-item"> 
												 <div class="inner-item-number">01</div> 
												 <div class="inner-item-info"> 
													 <span>전월 이용실적</span> <span>30만원 이상</span> 
												 </div> 
												 <div class="inner-item-dc">월 1만 3천원 할인</div> 
											 </div> 
										 </li> 
										 <li> 
											 <div class="inner-item"> 
												 <div class="inner-item-number">02</div> 
												 <div class="inner-item-info"> 
													 <span>전월 이용실적</span> <span>70만원 이상</span> 
												 </div> 
												 <div class="inner-item-dc">월 1만 6천원 할인</div> 
											 </div> 
										 </li> 
										 <li> 
											 <div class="inner-item"> 
												 <div class="inner-item-number">03</div> 
												 <div class="inner-item-info"> 
													 <span>전월 이용실적</span> <span>70만원 이상 이용시</span> 
												 </div> 
												 <div class="inner-item-dc"></div> 
											 </div> 
										 </li> 
									 </ul> 
								 </div> 
							 </div> 
	
							 <div class="card-info-03"> 
								 <b>카드할인 예시</b> 
								 <ul> 
									 <li>넥센타이어 렌탈 요금 2만 3천원 1회 발생 → <b>1만 6천원 청구할인</b></li> 
									 <li>넥센타이어 렌탈 요금 건당 1만원 2회 발생 → <b>각각 1만원/6천원 (총 1만 
											 6천원) 청구 할인</b></li> 
									 <li>넥센타이어 렌탈 요금 1만원 1회 발생 → <b>1만원 청구할인</b></li> 
								 </ul> 
							 </div> 
							 
							 <br />
							 <small>
<!-- 								 - <b>상환능력에 비해 신용카드 사용액이 과도할 경우 귀하의 신용등급 또는 개인신용평점이 하락할 수 있습니다.</b><br/> -->
<!-- 								 - <b>신용등급 또는 개인신용평점 하락 시 금융거래 관련된 불이익이 발생할 수 있습니다.</b><br/> -->
<!-- 								 - <b>일정기간 원리금을 연체할 경우, 모든 원리금을 변제할 의무가 발생할 수 있습니다.</b><br/> -->
								- <b>본 이벤트는 넥센타이어 와 제휴하는 롯데카드(신용카드업)의 이용권유 이벤트 입니다.</b><br/>
								- <b>넥센타이어 는 다수의 신용카드를 대리하거나 중개합니다.</b><br/>
								- <b>금융상품 직접판매업자로 부터 금융상품 계약권을 부여받지 아니한 금융상품 판매대리 · 중개업자의 경우  금융상품 계약을 체결할수 없습니다.</b><br/>
								- <b>넥센타이어 는 금융관계법률에 따라 신용카드사와 위탁계약을 체결한 금융상품 판매대리 · 중개업자입니다. </b><br/>
	 							 ※  연체이자율(약정이율+최대 3%)은 회원별·이용상품별로 차등 적용되며, 법정 최고금리(20%)를 초과하지 않습니다.<br/> 
	 									 - 단, 연체 발생 시점에 약정이율이 없는 경우는 아래와 같이 적용함 <br/> 
	 									 &nbsp;&nbsp;&nbsp;일시불 거래 연체 시 : 거래발생 시점의 최소기간(2개월) 유이자 할부금리<br/> 
	 									 &nbsp;&nbsp;&nbsp;무이자 할부 거래 연체 시 : 거래발생 시점의 동일한 할부 계약기간의 유이자 할부금리<br/> 
	 									 - 그 외의 경우 : 약정이율은 상법상 상사법정이율과 상호금융 가계자금대출금리* 중 높은 금리 적용<br/> 
	 									 * 한국은행에서 매월 발표하는 가장 최근의 비은행 금융기관 가중평균대출금리(신규대출 기준)<br/> 
	 										※ 신용카드 남용은 가계경제에 위협이 됩니다.<br/> 
	 									※ 여신금융상품 이용 시 귀하의 신용등급 또는 개인신용평점이 하락할 수 있습니다.<br/> 
	 	                                    ※ 여신금융협회 심의필<br/>
	 									  &nbsp;&nbsp;- 당사 준법심의: 준법심의 20-0067 (2020.01.16)<br/>   
	 									  &nbsp;&nbsp;- 여신금융협회 심의필 제 2020-C1h-00498호 (2020.01.21)
	 	
							 </small>
						
						 </div> 
					 </section> 
						<!-- tab-1 -->
						
						<!-- tab-2 -->
					<section id="inner-tab-2" class="tab-content-inner">
						<div class="inset-m pl-0 pr-0">
							<div class="text-center">
								<h3>카드의 정석 넥센타이어 렌탈 우리카드</h3>
								<img src="/img/service/card_06.PNG" alt="" class="card-l">
							</div>
							<div class="card-info-01 stack-m">
								<div class="stack layout-r inline-m align-center">
									<div class="inline number align-middle">01</div>
									<div class="layout-c">
										<div class="inline title">카드의 정석 넥센타이어 렌탈 우리카드 문의</div>
										<div class="inline tel">1800-0635</div>
									</div>
								</div>
								<div class="stack layout-r inline-m align-center">
									<div class="inline number align-middle">02</div>
									<div class="layout-c">
										<div class="inline title">
											렌탈료 자동이체 신청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<br>
											<span>넥센타이어 고객센터</span>
										</div>
										<div class="inline tel">1855-0100</div>
									</div>
								</div>
								<div class="text-center">
									<small>제휴카드 관련 규정은 카드사의 홈페이지를 통해서 확인하세요.</small> <a
										href="https://m.wooricard.com/dcmw/yh1/crd/crd01/M1CRD101S02.do?cdPrdCd=835615" class="go-view"><b>자세히
											보기</b></a></br>
									<small>＊연회비 : 국내전용(BC) 1만 2천원 / 해외겸용(MasterCard) 1만 5천원</small>
								</div>
							</div>
	
							<div class="card-info-02">
								<div class="">
									<p> 이벤트 기간내 자동이체 시 첫 자동납부 달부터 최대 36개월까지 제공됩니다.</p>
									<small>
									    - 대상: 기간 내 카드의정석 넥센타이어 렌탈 우리카드로 넥센타이어 렌탈 자동이체 등록한 회원(가족카드 적용 불가)</br>
									    - 내용: 전월실적 30만원 이상 이용시 월 15,000(상품서비스 13,000원 + 추가할인 2,000원)할인, </br>
									    &nbsp;&nbsp;&nbsp;100만원 이상 이용시 월 20,000원 할인</br></br>
									</small>
									<p>넥센타이어 렌탈 자동이체 청구할인 서비스는 해당카드로 자동이체시 적용됩니다.</p>
									<small>
										- 넥센타이어 렌탈요금 자동이체 시에만 전월실적에 따른 할인 혜택이 제공되며, 자동이체가 등록된</br>
										  &nbsp;&nbsp;&nbsp;렌탈요금이 카드사에 청구되는 시점부터 적용</br>
										- <u>무이자할부, 도시가스요금, 공공요금, 국세/지방세/관세, 단기카드대출(현금서비스), 장기카드대출(카드론),</u></br>
										  &nbsp;&nbsp;&nbsp;<u>수수료, 이자, 연회비는 전월실적에 미포함</u></br>
										- 전월 실적은 전월 1일부터 말일(매출승인일 기준)까지 카드별 국내외 가맹점 이용실적이며, 교통카드</br>
										  &nbsp;&nbsp;&nbsp;이용금액 및 통신료 자동이체 금액은 매출표 접수일 기준으로 해당 월 실적에 합산 적용</br>
										- 자동이체건이 여러건인 경우에도, 합산하여 할인한도 내에서 적용</br>
										- 월 할인한도보다 월 자동이체 금액이 적을 경우 월 자동이체 금액 만큼만 할인이 적용</br>
										  &nbsp;&nbsp;&nbsp;ex) 월 자동이체 금액이 12,000원인 경우, 전월 실적이 100만원 이상이더라도 12,000원까지만 할인</br>
										  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(월 자동이체금액 < 월 할인한도)</br>
										- 카드거래정지(분실신고 등), 한도부족, 카드 재발급 후 변경번호 자동이체 재등록 누락등 자동결제 불가 사유발생시 </br>
										  &nbsp;&nbsp;&nbsp;할인 적용 불가합니다.</br></br>
										상기 프로모션은 우리카드에서 제공하는 서비스로 예산 소진 등의 우리카드 상황에 따라 프로모션의 혜택이 중단 또는 변경될 수 있습니다.</br>
									</small>
									
									<ul>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">01</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>30만원 이상~</span> <span>100만원
														미만</span>
												</div>
												<div class="inner-item-dc">월 1만 5천원 할인한도</br>
																		  <h6>(상품서비스 1만3천원 + 추가할인 2천원)</h6></div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">02</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>100만원 이상</span>
												</div>
												<div class="inner-item-dc">월 2만원 할인한도</div>
											</div>
										</li>
										<!-- <li>
											<div class="inner-item">
												<div class="inner-item-number">03</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>100만원 이상 이용시</span>
												</div>
												<div class="inner-item-dc"></div>
											</div>
										</li> -->
									</ul>
								</div>
							</div>
	
							<!-- <div class="card-info-03">
								<b>카드할인 예시</b>
								<ul>
									<li>넥센타이어 렌탈 요금 2만 5천원 1건인 경우 → <b>2만원 할인</b></li>
									
									<li>넥센타이어 렌탈 요금 1만원 1건인 경우 → <b>1만원 할인</b></li>
								</ul>
							</div> -->
							<small>
								
								<br />
								※상세혜택 및 이용조건은 카드를 발급받기 전에 홈페이지(www.wooricard.com), 상품설명서 및 약관 등을 통해 확인하시기 바랍니다.</br> 
								※신용카드 발급이 부적정한 경우(개인신용평점 낮음 등) 카드발급이 제한될 수 있습니다.</br>
								※카드이용대금과 이에 수반되는 모든 수수료를 지정된 대금결제일에 상환합니다..
								※금융소비자는 금융소비자보호법 제19조 제1항에 따라 해당상품 또는 서비스에 대하여 설명을 받을 권리가 있으며,</br> 
								그 설명을 듣고 내용을 충분히 이해한 후 거래하시기 바랍니다.</br> 
								<b>※상환능력에 비해 신용카드 사용액이 과도할 경우 귀하의 신용등급 또는 개인신용평점이 하락할 수 있습니다.</b><br/>
								<b>※개인신용평점 하락시 금융거래와 관련된 불이익이 발생할 수 있습니다.</b><br/>
								<b>※일정기간 원리금을 연체할 경우, 모든 원리금을 변제할 의무가 발생할 수 있습니다.</b><br/>
								<b>※연체이율 : 회원별/이용상품별 정상이자율 + 최대 3% (법정 최고금리(20%) 이내)</b><br/> 
								<b>&nbsp;&nbsp;&nbsp;단, 연체 발생 시점에 정상이자율이 없는 경우는 아래와 같이 적용함</b><br/>
								<b>- 일시불 거래 연체 시 : 거래발생 시점의 최소기간(2개월) 유이자 할부금리</b><br/>
								<b>- 무이자 할부 거래 연체 시 : 거래 발생 시점의 동일한 할부 계약기간의 유이자 할부금리</b><br/>
								<b>- 그 외의 경우 : 정상이자율은 상법상 상사법정이율과 상호금융 가계자금대출금리 중 높은 금리적용</b><br/>
								<b>* 한국은행에서 매월 발표하는 가장 최근의 비은행 금융기관 가중평균대출금리(신규대출 기준) </b><br/><br/>
								※본 이벤트는 넥센타이어와 제휴하는 (주)우리카드(신용카드업)의 이용 권유 이벤트입니다.</br>
								※넥센타이어는 (주)우리카드의 신용카드회원 모집업무를 대리·중개합니다.</br>
								※넥센타이어는 다수의 신용카드사를 대리하거나 중개합니다.</br>
								※넥센타이어는 (주)우리카드의 금융상품에 대한 계약체결 권한이 없습니다.</br>
								※넥센타이어는 금융관계법률에 따라 (주)우리카드와 위탁계약을 체결한 금융상품 판매 대리·중개업자입니다.</br>
								<br/>
									※ 여신금융협회 심의필 제2023-C1h-00999호 (2023.02.08 ~ 2024.02.07)
		
							</small>
						</div>
					</section>
					<!-- tab-2 -->
					
					<!-- tab-3 -->
					<section id="inner-tab-3" class="tab-content-inner">
						<div class="inset-m pl-0 pr-0">
							<div class="text-center">
								<h3>넥센타이어 롯데카드</h3>
								<img src="/img/service/card_lotte.png" alt="" class="card-p">
							</div>
							<div class="card-info-01 stack-m">
								<div class="stack layout-r inline-m align-center">
									<div class="inline number align-middle">01</div>
									<div class="layout-c">
										<div class="inline title">롯데카드 신청 콜센터</div>
										<div class="inline tel">1899-4082</div>
									</div>
								</div>
								<div class="stack layout-r inline-m align-center">
									<div class="inline number align-middle">02</div>
									<div class="layout-c">
										<div class="inline title">
											렌탈료 자동이체 신청<br>
											<span>넥센타이어 고객센터</span>
										</div>
										<div class="inline tel">1855-0100</div>
									</div>
								</div>
								<div class="text-center">
									<small>제휴카드 관련 규정은 카드사의 홈페이지를 통해서 확인하세요.</small> <a
										href="https://www.lottecard.co.kr" class="go-view"><b>자세히
											보기</b></a>
											
									<small>＊연회비 : 국내전용 12,000원, 해외전용(MASTER) 1만5천원, 가족카드 면제</small>
								</div>
							</div>
	
							<div class="card-info-02">
								<div class="">
									<p>
										<b>넥센타이어 렌탈료 결제시 청구 할인됩니다.</b>
									</p>
									<small> 지난달(1일~말일) 프리미엄 렌탈DC 넥센타이어 롯데카드 일시불 및 할부(이용일을 기준으로 총 금액) 이용금액에 따라 이번달(1일~말일) 렌탈료 할인금액이 월 1회 적용됩니다.<br/>
								프리미엄 렌탈DC 넥센타이어 롯데카드로 넥센타이어 가전제품 렌탈료 자동이체시에만 할인혜택을 받으실 수 있습니다.<br/>
								할인금액이 렌탈요금보다 큰 경우 렌탈요금 청구금액까지만 할인 받으실 수 있으며, 대상 가맹점에 적용되는 롯데카드의 다른 청구할인 서비스와 중복으로 할인 받으실 수 없습니다.
									</small>
									<ul>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">01</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>30만원 이상</span>
												</div>
												<div class="inner-item-dc">1만 1천원 할인</div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">02</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>60만원 이상</span>
												</div>
												<div class="inner-item-dc">1만 5천원 할인</div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">03</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>100만원 이상</span>
												</div>
												<div class="inner-item-dc">2만원 할인</div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">04</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>70만원 이상 이용시</span>
												</div>
												<div class="inner-item-dc"></div>
											</div>
										</li>
									</ul>
								</div>
							</div>
	
							<small>
								<br/>
								    - <b>상환능력에 비해 신용카드 사용액이 과도할 경우 귀하의 신용등급 또는 개인신용평점이 하락할 수 있습니다.</b><br/>
									- <b>신용등급 또는 개인신용평점 하락 시 금융거래 관련된 불이익이 발생할 수 있습니다.</b><br/>
									- <b>일정기간 원리금을 연체할 경우, 모든 원리금을 변제할 의무가 발생할 수 있습니다.</b><br/>
									- 카드신청 전 이용조건 및 상세혜택은 홈페이지 또는 상품설명서, <br/>
									&nbsp;&nbsp;&nbsp;약관을 확인하시기 바랍니다.<br/>
									- 업종을 기준으로 제공하는 혜택은 롯데카드에 등록된 가맹점 업종을 <br/>
									&nbsp;&nbsp;&nbsp;기준으로 제공됩니다.<br/>
									- 연체이자율 : 회원별 · 이용상품별 약정이율 + 최대 3%, 법정 최고금리(연20%) 이내<br/>
									※ 단, 연체발생 시점에 약정이율이 없는 경우 아래와 같이 약정이율을 적용<br/>
									- 일시불 거래 연체시 : 거래 발생시점의 최소기간(2개월) 유이자 할부 금리<br/>
									- 무이자 할부 거래 연체시 : 거래 발생 시점의 동일한 할부 계약기간의 유이자 할부 금리 </br>
									<!-- &nbsp;&nbsp;&nbsp;필요 이상으로 카드를 발급받을 경우 개인신용등급 또는 신용평점, 이용한도 등에 영향을 미칠 수 있습니다. </br>
									&nbsp;&nbsp;&nbsp;신용카드 남용은 가계경제에 위협이 됩니다.<br/>
									&nbsp;&nbsp;&nbsp;여신 금용 상품 이용시 귀하의 신용등급 또는 개인신용평점이 하락할 수 있습니다.<br/> -->
									- 계약체결 전 금융상품설명서와 약관을 확인하시기 바랍니다. </br>
									- 신용카드 발급이 부적정한 경우(개인신용평점 낮음 등) 카드발급이 제한될 수 있습니다. </br>
									- 카드이용대금과 이에 수반되는 모든 수수료를 지정된 대금결제일에 상환해야 합니다. </br>
									- 금융소비자는 금소법제19제1항에 따라 해당상품 또는 서비스에 대하여 설명을 받을 권리가 있습니다. </br>
									- 상환 능력에 비해 신용카드 사용액이 과도할 경우 귀하의 개인신용평점이 하락할 수 있습니다. </br>
									- 개인신용평점 하락 시 금융거래와 관련된 불이익이 발생할 수 있습니다. </br>
									- 일정기간 원리금을 연체할 경우 모든 원리금을 변제할 의무가 발생할 수 있습니다. </br>									
									※ 여신금융협회 심의필 제2019-C1h-09226호 (2019.10.16)<br/>   
							</small>
							
						</div>
					</section>
					<!-- tab-3 -->
					
					<!-- tab-4 -->
					<section id="inner-tab-4" class="tab-content-inner">
						<div class="inset-m pl-0 pr-0">
							<div class="text-center">
								<h3>넥센타이어 KB국민카드</h3>
								<img src="/img/service/card_kb.png" alt="" class="card-l">
							</div>
							<div class="card-info-01 stack-m">
								<div class="stack layout-r inline-m align-center">
									<div class="inline number align-middle">01</div>
									<div class="layout-c">
										<div class="inline title">KB국민카드 신청 콜센터</div>
										<div class="inline tel">1644-8388</div>
									</div>
								</div>
								<div class="stack layout-r inline-m align-center">
									<div class="inline number align-middle">02</div>
									<div class="layout-c">
										<div class="inline title">
											렌탈료 자동이체 신청<br>
											<span>넥센타이어 고객센터</span>
										</div>
										<div class="inline tel">1855-0100</div>
									</div>
								</div>
								<div class="text-center">
									<small>제휴카드 관련 규정은 카드사의 홈페이지를 통해서 확인하세요.</small> <a
										href="https://m.kbcard.com/CXHIACRC0002.cms?mainCC=b&allianceCode=04426" class="go-view"><b>자세히
											보기</b></a>
									<small>＊연회비 : 국내전용 12,000원, K-WORLD 12,000원, 해외겸용 14,000원</small>
								</div>
							</div>
							
							
	
							<div class="card-info-02">
								<div class="">
									<p>
										<b>넥센타이어 렌탈료 결제시 청구 할인됩니다.</b>
									</p>
									<small>
									- 넥센타이어 렌탈료 결제 시 청구 할인됩니다.<br/>                               
								 &nbsp;&nbsp;&nbsp;할인한도보다 자동이체 승인된 금액이 작을 경우 승인금액만큼 할인 적용<br/>
								 &nbsp;&nbsp;&nbsp;넥센타이어 렌탈료 자동이체 승인 건이 여러 건인 경우 합산하여 월 할인금액 내에서 할인<br/>
								 &nbsp;&nbsp;&nbsp;이용한달의 월간 할인한도 내에서 할인이 적용되며, 월간 잔여할인한도는 이월되지 않습니다.<br/>
								- 전월 이용 실적 기준은 전월 1일 ~ 말일까지 넥센타이어 KB국민카드의 일시불 및 할부 승인금액 기준(해외 이용금액은 전월 1일 ~ 말일까지 매입 완료기준)에 따라 적용됩니다.<br/>
								- 넥센타이어 KB국민카드를 이용하여 넥센타이어 렌탈료 자동이체시에만 할인 혜택을 받으실 수 있습니다.<br/>
								- 이용실적 제외대상 : 넥센타이어 KB국민카드로 할인받은 이용금액(해당 이용금액 전체), 단기카드대출(현금서비스), 장기카드대출(카드론), 각종 세금 및 공과금, 아파트관리비, 정부지원금, 대학(대학원)등록금, <br/>
								  &nbsp;&nbsp;&nbsp;각종수수료 및 이자, 연체료, 연회비, 상품권 및 선불카드 구입/충전금액, 무승인전표(대중교통,자판기,터널이용료,항공기내 이용 등), 취소금액은 제외됩니다.
							
									</small>
									<ul>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">01</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>30만원 이상</span>
												</div>
												<div class="inner-item-dc">1만 1천원 할인</div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">02</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>70만원 이상</span>
												</div>
												<div class="inner-item-dc">1만 5천원 할인</div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">03</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>100만원 이상</span>
												</div>
												<div class="inner-item-dc">2만원 할인</div>
											</div>
										</li>
										<li>
											<div class="inner-item">
												<div class="inner-item-number">04</div>
												<div class="inner-item-info">
													<span>전월 이용실적</span> <span>70만원 이상 이용시</span>
												</div>
												<div class="inner-item-dc"></div>
											</div>
										</li>
									</ul>
								</div>
							</div>
	
							<div class="card-info-03">
								<b>카드할인 예시</b>
								<ul>
									<li>넥센타이어 렌탈 요금 2만 5천원 1건인 경우 → <b>1만 5천원 할인</b></li>
									<li>넥센타이어 렌탈 요금 건당 1만원 2건인 경우 → <b>각 1만원/5천원 (총 1만
											5천원) 할인</b></li>
									<li>넥센타이어 렌탈 요금 1만원 1건인 경우 → <b>1만원 할인</b></li>
								</ul>
							</div>
	
							<small>
						    - <b>상환능력에 비해 신용카드 사용액이 과도할 경우 귀하의 신용등급 또는 개인신용평점이 하락할 수 있습니다.</b><br/>
							- <b>신용등급 또는 개인신용평점 하락 시 금융거래 관련된 불이익이 발생할 수 있습니다.</b><br/>
							- <b>일정기간 원리금을 연체할 경우, 모든 원리금을 변제할 의무가 발생할 수 있습니다.</b><br/>
							- 카드신청 전 혜택 및 이용조건은 홈페이지 또는 상품설명서, 약관을 확인하시기 바랍니다.<br/>
								- 업종별로 제공되는 할인(적립) 서비스는 이용 가맹점이 해당카드 할인대상 KB 국민카드 가맹점 업종 코드로 <br/>
									&nbsp;&nbsp;&nbsp;등록된 경우에 한하여 제공됩니다.<br/>
								- 연체이자율 : 회원별, 이용상품별 약정이율 + 최대 3%, 법정 최고금리(연20%) 이내<br/>
								  ※ 단, 연체발생 시점에 정상이율이 없는 경우 아래와 같이 약정이율을 적용<br/>
								   - 일시불 거래 연체시 : 거래 발생시점의 최소기간(2개월) 유이자 할부 금리<br/>
								   - 무이자 할부 거래 연체시 : 거래 발생 시점의 동일한 할부 계약기간의 유이자 할부 금리<br/>
								- 신용카드 남용은 가계경제에 위협이 됩니다.<br/>
								- 여신 금용 상품 이용시 귀하의 신용등급이 하락할 수 있습니다.<br/>                                        
								※ 여신금융협회 심의필 제2020-C1h-00876호 (2020.02.06)             
							</small>
						</div>
					</section>
				</div>
			</div>
		</div>



	</div>

	</main>







</div>
<!-- //subContentsWrap -->

<!-- Popup Group -->
<!-- ######################################### -->
<!-- 타이어 렌탈 서비스 2016~2018 -->
<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-1">
	<div class="popContents">
		<a href="#" class="layPopClose md-close"></a>
		<header class="noLine">
			<h2>타이어 렌탈 서비스</h2>
		</header>

		<div class="popup-contents-nobottom">
			<div class="mb-xl">
				<div class="inset-m">
					<p class="service-term">2016년 1월 ~ 2018년 2월 계약 고객 대상</p>
				</div>

				<div class="service-important">
					<div class="mb-m">
						<p>
							<b>NEXT LEVEL 걱정ZERO 프로그램</b>
						</p>
						<small>타이어 렌탈을 하시면 NEXT LEVEL 걱정ZERO 프로그램 혜택을 제공해드립니다</small>
					</div>
					<ol class="">
						<li>
							<div class="service-data layout-c">
								<span class="after-line">타이어 무상 제공 서비스, 명품보증제도</span> 
								<small class="service-info">
									고객의 안전운전을 위해 타이어 파손, 마모 시 유상 교체해드리는 
								서비스입니다.<br/>
								[4개 렌탈 시 2개, 2개 렌탈 시 1개 제공]
								</small>

								   
								<ul class="service-data-inner-style">
									<li>※ 제공 기준</li>
									<li>계약기간 내 타이어 마모 한계선(1.6mm) 이내까지 닳았을 경우 제공해드립니다.</li>
									<li>계약기간 내 운행 불가한 파손이 발생한 경우 제공해드립니다.</li>
									<li>계약기간 내 운행 마모/파손에 의한 제공이 없었을 경우, 계약만료 6개월 전부터 제공 신청이 가능 합니다.</li>
									<li>제공되는 타이어에 대한 교체 장착비는 유상입니다.<br/>(장착비는 렌탈 전문점에서 확인 가능합니다.)</li>
	
								</ul>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">정기 방문점검 무상 서비스, 차량 10대 항목 점검</span> <small
									class="service-info">고객님의 집이나 직장 등으로 장소 약속 후 방문 점검해
									드립니다.<br> [서비스 : 엔진오일, 부동액/냉각수, 배터리, 타이어공기압 외 6개 항목]<br>
									[계약기간 내 4, 6, 12개월 주기, 계약조건에 따라 서비스 내용이 다를 수 습니다.]
								</small>
								<ul class="service-data-inner-style">
									<li>도서/ 산간지역은 지역에 따라 서비스 이용 제한이 있을 수 있습니다.</li>
								</ul>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">차량 무상점검 서비스, 차량 10대 항목 점검</span> <small
									class="service-info">가까운 타이어 렌탈 전문점에서 언제든 무상점검 가능합니다.<br>[서비스
									: 엔진오일, 부동액/냉각수, 배터리, 타이어공기압 외 6개 항목]
								</small>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">타이어 위치교환 무상 서비스</span> <small
									class="service-info">타이어 위치 교환 서비스를 무상으로 제공해 드립니다.<br>[렌탈기간
									내 1회]
								</small>
							</div>
						</li>
					</ol>
				</div>


			</div>
		</div>
	</div>
</div>
<!-- //타이어 렌탈 서비스 2016~2018 -->
<!-- 타이어 렌탈 서비스 2018~2019 -->
<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-2">
	<div class="popContents">
		<a href="#" class="layPopClose md-close"></a>
		<header class="noLine">
			<h2>타이어 렌탈 서비스</h2>
		</header>

		<div class="popup-contents-nobottom">
			<div class="mb-xl">
				<div class="inset-m">
					<p class="service-term">2018년 3월 ~ 2019년 2월 계약 고객 대상</p>
				</div>

				<div class="service-important">
					<div class="mb-m">
						<p>
							<b>NEXT LEVEL 프리미엄 서비스(택1)</b>
						</p>
						<small>어려운 타이어 관리, 차량 관리는 렌탈 서비스로 걱정제로</small>
					</div>
					<ol class="border-bottom">
						<li>
							<div class="service-data layout-c">
								<span class="after-line">타이어 마모파손 Care</span> <small
									class="service-info">4개 렌탈 시 2개, 2개 렌탈 시 1개를 무상교체 해
									드립니다.(렌탈전문점으로 배송기간 2~3일 소요, 런플렛/TPMS 차량 별도 공임비 발생)</small>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">엔진오일 정비 Care</span> <small
									class="service-info">4개 렌탈 시 엔진오일 2회, 2개 렌탈 시 엔진오일 1회
									무상교체 해드립니다. (수입차는 공임비 별도)</small>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">타이어 + 엔진오일 정비 Total Care</span> <small
									class="service-info">타이어 + 엔진오일 Total Care 타이어와 엔진오일을
									동시에 무상교체 해 드립니다. (월 렌탈료 2,500원 추가)</small>
							</div>
						</li>
					</ol>
				</div>

				<div class="service-important pt-m">
					<div class="mb-m">
						<p>
							<b>기본 Care서비스</b>
						</p>
						<small>넥스트레벨만의 타이어 관리, 차량관리는 렌탈 서비스로 걱정제로</small>
					</div>
					<ol class="">
						<li>
							<div class="service-data layout-c">
								<span class="after-line">방문점검 서비스</span> <small
									class="service-info">정기방문을 통해 타이어 및 차량 10대 항목을 무상점검
									해드립니다. (도서/산간 지역은 지역에 따라 서비스 이용에 제한이 있을 수 있습니다.)</small>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">위치교환 서비스</span> <small
									class="service-info">계약기간 내 2회 한정, 타이어 위치교환 서비스를
									제공합니다.(전ㆍ후륜 상이차량 서비스 불가/ TPMS 차량 추가 공임비 발생)</small>
							</div>
						</li>
						<li>
							<div class="service-data layout-c">
								<span class="after-line">휠얼라이먼트 무상교정 서비스</span> <small
									class="service-info">계약기간 내 1회 한정, 타이어 휠얼라이먼트 무상교정 서비스를
									제공합니다. (수입차 추가 공임비 발생)</small>
							</div>
						</li>
					</ol>
				</div>


			</div>
		</div>
	</div>
</div>

<div class="md-effect-1 fullPopup address-popup md-modal-3 service-modal" id="modal-3">
	<div class="popContents">
		<a href="#" class="layPopClose md-close"></a>
		<header class="noLine">
			<h2>타이어 렌탈 서비스</h2>
		</header>

		<div class="popup-contents-nobottom">
			<div class="mb-xl">
				<div class="inset-m">
					<p class="service-term">2019년 2월 ~ 2020년 10월 계약 고객 대상</p>
				</div>

				<div class="service-important">
					<div class="mb-m">
						<p style='font-size:0.95em;'>
							<b>
								NEXT LEVEL <br/>
								알뜰/베이직/표준/더블/슈퍼/자유 렌탈 상품 중 택 1
							</b>
						</p>



						<h4>추천 렌탈 상품</h4>
						<p class="desc"> 고객님들의 소중한 의견을 담은 추천 상품으로 <br/> 타이어 맞춤 렌탈 하세요.</p>
					
					
						<ul class="serice-tabs">
							<li class="active" rel="typeTab1" id="liTab11">알뜰</li>
							<li class="" rel="typeTab2" id="liTab12">베이직</li>
							<li class="" rel="typeTab3" id="liTab13">표준</li>
							<li class="" rel="typeTab4" id="liTab14">더블</li>
							<li class="" rel="typeTab5" id="liTab15">슈퍼</li>
						</ul>
						<div id="typeTab1" class="serice-tabs-item">
							<img src="/img/service/rental/type_01.png" alt=""/>
						</div>
						<div id="typeTab2" class="serice-tabs-item" style="display:none;">
							<img src="/img/service/rental/type_02.png" alt=""/>
						</div>
						<div id="typeTab3" class="serice-tabs-item" style="display:none;">
							<img src="/img/service/rental/type_03.png" alt=""/>
						</div>
						<div id="typeTab4" class="serice-tabs-item" style="display:none;">
							<img src="/img/service/rental/type_04.png" alt=""/>
						</div>
						<div id="typeTab5" class="serice-tabs-item" style="display:none;">
							<img src="/img/service/rental/type_05.png" alt=""/>
						</div>
						<script type="text/javascript">
						$(function(){
							$(".serice-tabs li").on('click',function(){
								var target = $(this).attr('rel');
								$(".serice-tabs li").removeClass('active');
								$(this).addClass('active');
								$(".serice-tabs-item").hide();
								$("#"+target).show();
							});
						})
						</script>
					
						<h4>자유 렌탈 상품</h4>
						<img src="/img/service/rental/type_free.png" alt=""/>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- //타이어 렌탈 서비스 2018~2019 -->
<div class="md-overlay"></div>
<!-- ######################################### -->
<!-- //Popup Group -->
<script type="text/javascript">
var userLoginId = "${userLoginId}";

$(document).ready(function() {

	//evManager.init();
	$("#bgFullImg").append("<div class='member-bg service-rental'></div>");
	
	// 우리카드 이벤트 날짜 자동 변경
	const date = new Date();
	const year = date.getFullYear();
	const month = date.getMonth()+1;
	const lastDate = new Date(year, month, 0).getDate();
	
	$("#inner-tab-2 .card-info-02 small").eq(0).prepend("- 이벤트 기간: "+year+"년"+month+"월"+"1일 ~ "+month+"월"+lastDate+"일</br>");
});


function fnTabActive(id) {
	$("#liTab1").removeClass("current");
	$("#liTab2").removeClass("current");
	$("#liTab3").removeClass("current");
	$("#liTab4").removeClass("current");
	$("#liTab" + id).addClass("current");
	
	$("#tab-1").removeClass("current");
	$("#tab-2").removeClass("current");
	$("#tab-3").removeClass("current");
	$("#tab-4").removeClass("current");
	$("#tab-" + id).addClass("current");
	
	var data = "liTab" + id;
	fnMove(data);
}


    $('.benefit-slide').slick({
		arrows:true,
		dots:false,
		// centerMode: true,
		// centerPadding: '50px',
    	// variableWidth: true
	  });

    $('.rental_type').slick({
		arrows:true,
		dots:false,
		// centerMode: true,
		// centerPadding: '50px',
    	// variableWidth: true
	  });

	  

</script>
