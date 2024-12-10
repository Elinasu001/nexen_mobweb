<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<style>


</style>

      <!-- subContentsWrap -->
      <div class="subContentsWrap">
        <main class="order-basket">
          <!-- header -->
          <div class="page-header">
            <h2 class="title-deco">
              <span>품질에 대한</span> <span>자신감</span>
            </h2>
            <h3 class="title-deco-sub">보증제도</h3>
          </div>
          <!-- //header -->

          <!--  -->
          <div class="bg mt-m">
            <div class="warranty-2020 service-tab">
              <div class="tab-nav js-tab layout-r inline same-size">
                <button type="button" id="" data-tab="tab-1" class="inline current">엔페라 新 명품 보증제도</button>
                <button type="button" id="" data-tab="tab-5" class="inline">타이어렌탈 무상 보증 제도</button>
                <!-- <button type="button" id="" data-tab="tab-2" class="inline">윈터 명품 보증제도</button> -->
                <button type="button" id="" data-tab="tab-3" class="inline">특별품질 보증제도</button>
                <button type="button" id="" data-tab="tab-4" class="inline">일반 보증제도</button>
              </div>
            </div>
            <div class="service-list-type02">
              <section id="tab-5" class="tab-content">
                <div class="service-list-type01 inset-ml free-warranty">

                  <dl >
                    <dt>
                      <div class="numTitle">
                        <span class="num">01</span>
                        <h3>무상 파손 보증</h3>
                      </div>
                    </dt>
                    <dd>
                      
                      
                      <p>
						계약 기간 동안 타이어 파손 시 동일한 타이어로 무상 교체해드리는  보증 제도입니다.<br/><br/>
					</p>
					
					<ul class="pason-desc">
						<li>
							1) 보증 대상 : 타이어렌탈 고객 중 보증 서비스 가입자 <br/>
							(사계절용 타이어, 승용 / SUV 차종)
						</li>
					</ul>
					<ul class="pason-desc">
						<li>
							2) 보증 기간, 수량 : 렌탈 계약기간 / 계약 수량 이내<br/>
							※ 회사에서 제공하는 서비스(무상 보증/타이어 무상 교체) 보증 수량은 계약 수량을 초과할 수 없음
						</li>
					</ul>
					<ul class="pason-desc">
						
						<li>
							<span>3) 보증 기준</span>
							<ul>
								<li><span>① 사용자 과실</span>
									<ul>
										<li>
											- 펑크나 외상, 관통 등 순수 운행 중 발생된 손상에 한함
										</li>
										<li>
											- 펑크의 경우 수리 운행 가능할 시 교환 대상에서 제외
										</li>
										<li>
											- 외상은 코드가 보이는 경우에 보상
										</li>
									</ul>
								</li>
								<li>② 제조상 과실
									<ul>
										<li>- 사용자 불만(쏠림, 진동 등)은 회사 AS 유관부서에서 직접 처리</li>
									</ul>
								</li>
	
								<li>③ 보상 운영 참고사항
									<ul>
										<li>- 잔여 그루브 깊이가 마모한계(1.6mm) 초과인 제품에 한함</li>
										<li>- 제품이 단종되었을 경우 동일한 등급의 제품으로 대체될 수 있음</li>
									</ul>
								</li>
							</ul>
							
						</li>
					</ul>
					
					
					<ul class="pason-desc">
						<li>
							4) 보증 가입 / 신청 절차
							<ul>
								<li>① 가입 절차 : 모바일/PC페이지 보증 서비스 가입서 작성 →  심사 후 가입 승인여부 고객 안내 → 가입 완료</li>
								<li>② 신청 절차 : 콜센터(☎1855-0100) 또는 홈페이지(NEXT LEVEL] 신청 → 심사 후 타이어 발송 → 장착점 방문 후 교체</li>
							</ul>
						</li>
						<li>
							※ 배송 기간 : 신청 후 영업일 기준 3일 이내 <br/>
							(재고 부족으로 지연될 수 있습니다.)
						</li>
					</ul>

					<ul class="pason-desc">
						<li>
							5) 보증 제외
							<ul>
								<li>- 렌탈계약이후 1개월 이내 보증 서비스 미 가입 시</li>
								<li>- 승합[SUV 차종 제외] / 경트럭용 차종</li>
								<li>- 잔여 그루브 깊이가 마모한계(1.6mm) 이하인 제품에 한함</li>
								<li>- 여름용 / 겨울용 타이어</li>
								<li>- 보증 서비스 가입 내용과 파손 시 서비스 신청 내용이 상이할 경우(가입, 신청 시 휠/타이어가 서로 상이한 경우 등)</li>
								<li>- 보상을 목적으로 한 고의 손상품이나 흠집, 외상, 펑크 등 변형을 시킬 경우(타인에 의한 경우 포함)</li>
								<li>- 렌탈계약으로 장착한 타이어가 아닌 경우</li>
								<li>- 외부의 화학물질(약품, 제설제)과의 접촉에 의한 경우</li>
								<li>- 휠 얼라인먼트(부적절한 차륜 정렬) 오류 등의 차량 이상으로  인한 이상마모로 발생한 파손인 경우</li>
								<li>- 국가, 시 또는 지방 자치단체가 포장한 도로 및 간선도로 외에서 운행으로 발생한 파손</li>
								<li>- 픽업 및 배송, 유상 운송, 운반, 견인, 도로 보수, 건축, 제설 또는 기타 영업 목적으로 사용되는 차량</li>
								<li>- 경주용, 임대용, 리무진, 택시, 경찰, 구급차, 견인차, 구난차,  장의차 또는 기타 긴급 용도로 사용되는 차량 </li>
								<li>- 해당 차량에 적절치 않은 규격의 제품을 장착한 경우 <br/> (당사 패턴가이드 기준)</li>
								<li>- 판매처, 제조일자 또는 출처 불분명한 중고품</li>
								<li>- 차량 제조사 또는 다른 보증 프로그램에서 보상되는 교체</li>
								<li>- 차량 제조사가 공고 또는 리콜을 통해 제조 결함에 대한  교환의 책임을 알린 경우</li>
								<li>- 타이어 체인에 의해 발생된 파손</li>
								<li>- 넥센타이어의 사전 승인 없이 진행된 교체</li>
								<li>- 핵연료 물질 또는 핵연료 물질에 의하여 오염된 물질의 방사성, 폭발성 또는 그 밖의 유해한 특성에 의한 사고로 생긴 파손</li>
								<li>- 상기 외의 방사선을 쬐는 것 또는 방사능 오염으로 인한 파손</li>
								<li>- 전쟁, 혁명, 내란, 사변, 테러, 폭동, 소요, 노동쟁의 기타 이들과 유사한 사태로 생긴 파손</li>
								<li>- 지진, 분화, 홍수, 해일 또는 이와 비슷한 천재지변으로 생긴 파손</li>
								<li>- 화재, 폭발, 날아온 물체, 떨어지는 물체에 의한 파손</li>
								<li>- 포장도로용 승용차량 외 차량 </li>							
							</ul>
						</li>
					</ul>
                    </dd>
                  </dl>


				<dl >
					<dt>
						<div class="numTitle">
							<span class="num">02</span>
							<h3>무상 파손/조기 마모 보증</h3>
						</div>
					</dt>
					<dd>
						<p>
							
							계약 기간 동안 타이어 파손/조기 마모 시 동일한 타이어로 무상 교체해드리는 보증 제도입니다.<br/>
							※ 아래 내용은 조기 마모에 대한 안내 입니다. 파손의 경우 ‘1. 무상 파손 보증‘ 안내에 준합니다.
						</p>
						
						<br/>
						<ul class="pason-desc">
							<li>
								1) 보증 대상 : 타이어렌탈 초기 장착과 동시에 얼라인먼트 서비스  신청 및 사용 고객 중 보증 서비스 가입자 (사계절용 타이어, 승용 / SUV 차종)
							</li>
						</ul>

						<ul class="pason-desc">
							<li>
								2) 보증 기간, 수량 : 렌탈 계약기간 / 계약 수량 이내<br/>
								※ 회사에서 제공하는 서비스(무상 보증/타이어 무상 교체) 보증  수량은 계약 수량을 초과할 수 없음
							</li>
						</ul>

						<ul class="pason-desc">
							<li>
								3) 보증 신청 조건
								<ul>
									<li>- 보증 서비스 신청 전, 6개월 이내 NEXT LEVEL CHECK 서비스 점검 고객</li>
								</ul>
							</li>
						</ul>

						<ul class="pason-desc">
							<li>
								4) 보증 기준
								<ul>
									<li>① 조기마모로 인해 더 이상 주행이 불가할 경우 <br/> [주행거리 30,000km 이내]</li>
									<li>
										② 보상 운영 참고사항
										<ul>
											<li>- 잔여 그루브 깊이가 마모한계(1.6mm) 이하인 제품에 한함</li>
											<li>- 제품이 단종되었을 경우 동일한 등급의 제품으로 대체될 수 있음</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>


						

						<ul class="pason-desc">
							<li>
								5) 보증 가입 / 신청 절차
								<ul>
									<li>
										① 가입 절차 : 모바일/PC페이지 보증 서비스 가입서 작성 → 심사 후 가입 승인여부 고객 안내 → 가입 완료
									</li>
		 							<li>
										 ② 신청 절차 : 콜센터(☎1855-0100) 또는 홈페이지(NEXT LEVEL] 신청 → 심사 후 타이어 발송 → 장착점 방문 후 교체
									 </li>
								</ul>
							</li>
							<li>※ 배송 기간 : 신청 후 영업일 기준 3일 이내 <br/> (재고 부족으로 지연될 수 있습니다.)</li>
						</ul>

						<ul class="pason-desc">
							<li>
								6) 보증 제외
								<ul>
									<li>- 렌탈계약이후 1개월 이내 보증 서비스 미 가입 시</li>
									<li>- 승합[SUV 차종 제외] / 경트럭용 차종</li>
									<li>- 마모율 90% 이내 (마모잔존율 10% 이상) 제품</li>
									<li>- 잔여 그루브 깊이가 마모한계(1.6mm) 초과인 제품</li>
									<li>- 여름용 / 겨울용 타이어</li>
									<li>- 조기 마모 보증 서비스 가입 내용과 조기마모 시 서비스 신청 내용이 상이할 경우(가입, 신청 시 휠/타이어가 서로 상이한 경우 등)</li>
									<li>- 보상을 목적으로 한 고의적인 마모행위로 인해 조기마모가 발생한 경우</li>
									<li>- 렌탈계약으로 장착한 타이어가 아닌 경우</li>
									<li>- 외부의 화학물질(약품, 제설제)과의 접촉에 의한 경우</li>
									<li>- 휠 얼라이먼트(부적절한 차륜 정렬) 오류 등의 차량 이상으로 인한 이상마모인 경우</li>
									<li>- 국가, 시 또는 지방 자치단체가 포장한 도로 및 간선도로 외에서 운행으로 인한 조기마모</li>
									<li>- 픽업 및 배송, 유상 운송, 운반, 견인, 도로 보수, 건축, 제설 또는 기타 영업 목적으로 사용되는 차량</li>
									<li>- 경주용, 임대용, 리무진, 택시, 경찰, 구급차, 견인차, 구난차, 장의차 또는 기타 긴급 용도로 사용되는 차량</li>
									<li>- 해당 차량에 적절치 않은 규격의 제품을 장착한 경우 <br/>(당사 패턴가이드 기준)</li>
									<li>- 판매처, 제조일자 또는 출처 불분명한 중고품</li>
									<li>- 넥센타이어의 사전 승인 없이 진행된 교체</li>
									<li>- 포장도로용 승용차량 외 차량</li>
								</ul>
							</li>
						</ul>


					</dd>
				</dl>

                  

                </div>
              </section>


              
              <section id="tab-1" class="tab-content">
                <div class="text-center service-message-box inset-l pb-0 border-white-top">
                  <b>엔페라 新 명품보증제도</b>
                  <small><span>2024년 N’FERA Supreme, N’FERA Supreme SUV, The new N’FERA AU7<br>제품을 구매하신 고객에 한해 구매일로부터 1년간<br>엔페라 新 명품보증제도 혜택을 드립니다.</span></small>
                </div>
                <div class="service-list-type01 inset-ml">
                  <ol>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">01</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">엔페라 新 명품<br>보증 대상</div>
                            <!-- <div class="inline">
                              <small class="service-info">고객님께 딱 맞는 렌탈 상품을 직접 설계 해보세요.</small>
                            </div> -->
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <img src="../img/service/guarantee_inner_01.png" alt="">
                          <!-- <p>
                            <b>계약 내용 선택</b>
                            <small>타이어 렌탈 수량 선택 / 계약 기간 선택 (12/24/36/48개월) / 렌탈등록비 선택</small>
                          </p>
                          <p>
                            <b>부가 서비스 선택</b>
                            <small>타이어 무상교체 서비스 / 엔진오일 교체 서비스 / 기본 Care 서비스 3종 (방문점검서비스, 위치교환, 얼라인먼트)</small>
                          </p> -->
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">02</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">엔페라 新 명품<br>보증 기간</div>
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <p class="guarantee">2024년 넥스트레벨(넥센타이어 본사 운영 쇼핑몰)에서 구매시<br>구매일로부터 1년간 엔페라 新 명품보증제도 자동 등록 및 혜택 제공</p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">03</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">엔페라 新 명품<br>보증 장소</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>구매 대리점 및 고객만족센터(1577-2781), 전국 A/S지정점</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">04</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">엔페라 新 명품<br>보증 내용</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <b>사용자 과실</b>
                          <ul>
                            <li>펑크나 외상, 관통 등 순수 운행 중 발생된 손상에 한함</li>
                            <li>펑크의 경우 수리 운행 가능할 시 교환 대상에서 제외</li>
                            <li>외상은 코드가 보이는 경우에 보상</li>
                          </ul>
                          <b>제조상 과실</b>
                          <ul>
                            <li>사용자 불만 (쏠림, 진동 등)은 한국고객만족실에서 직접 처리</li>
                          </ul>
                          <b>보상운영 참고사항</b>
                          <ul>
	                      	<li>구매 당일 한 차종에 동일 패턴 4개 구매 시 명품보증제도 적용</li>
	                        <li>마모율 30% 이내(마모잔존율 70% 이상) 제품에 한함</li>
	                        <li>타이어 교체비용은 고객 부담이며, AS 지정점에서만 교환 가능</li>
	                        <li>제조상 과실인 경우 교체비용 회사 부담</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">05</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">엔페라 新 명품<br>보증 처리 절차</div>
                          </div>
                        </div>
                        <div class="product-other-view service">
                          <div class="service-data-detail guarantee layout-r inline-s">
                            <div class="step inline">
                              <b>Process 1.</b><br>
                              고객만족센터<br>
                              (1577-2781)에<br>
                              클레임 접수<br>
                              <img src="../img/service/guarantee_inner_icon01.png" alt="">
                              <!-- <span class="icon01"></span> -->
                            </div>
                            <div class="step inline">
                              <b>Process 2.</b><br>
                              서비스 지정점 방문하여<br>
                              타이어교환<br><br>
                              <img src="../img/service/guarantee_inner_icon02.png" alt="">
                              <!-- <span class="icon02"></span> -->
                            </div>
                            <div class="step inline">
                              <b>Process 3.</b><br>
                              고객에게<br>
                              해피콜 실시<br><br>
                              <img src="../img/service/guarantee_inner_icon03.png" alt="">
                              <!-- <span class="icon03"></span> -->
                            </div>
                          </div>
                          <div class="rent-footer">
                            <ul>
                              <li>서비스 지정점의 재고 상황에 따라 보상이 지연될 수 있습니다.</li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">06</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">엔페라 新 명품<br>보증 제외</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <b>사용자 과실</b>
                          <ul>
                            <li>보상을 목적으로 한 고의 손상품이나 흠집, 외상, 펑크 등 변형을 시킬 경우(타인에 의한 경우 포함)</li>
                            <li>외부의 화학물질(약품, 제설제)과의 접촉에 의한 경우</li>
                            <li>잘못된 장착(당사 제품가이드 기준), 부적절한 차륜 정렬 등 차량의 이상 및 공기압 관리 부족에 의한 마모 경우</li>
                            <li>2023년, 2024년 생산품이 아닌 경우</li>
                            <li>넥스트레벨 사이트 내 구매가 아닌 타 홈페이지를 통해 구입한 고객, 넥스트레벨 렌탈 이용 고객(렌탈시 별도 렌탈보증제도 적용)</li>
                            <li>마모율이 30% 초과인 경우</li>
                            <li>포장도로 및 간선도로 외에서 운행 중 발생한 사고</li>
                            <li>경주용, 리무진, 택시, 경찰차, 구급차, 기타 영업 및 긴급 용도로 사용되는 차량</li>
                            <li>해당 차량에 적절치 않은 규격의 제품을 장착한 경우</li>
                            <li>판매처, 제조일자 또는 출처 불분명한 중고품(중고차량 포함)</li>
                            <li>新 명품보증제도를 이용하여 타사품 교환 또는 환불 요청은 불가</li>
                            <li>新 명품보증제도의 신품교환은 1회로 한정(특별품질보증제 중복 보상 불가)</li>
                            <li>신차 출고용 타이어 및 1개월 이내 단기 임대용 차량 제외</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                  </ol>
                </div>
              </section>
              <section id="tab-2" class="tab-content">
                <div class="text-center service-message-box inset-l pb-0 border-white-top">
                  <b>윈터 명품보증제도</b>
                  <small><span>WINGUARD SPORT2, WINGUARD SPORT2 SUV, WINGUARD SPORT, WINGUARD ice (LTR, 70~75시리즈 제외) 상품을 구매하신 고객 중 클레임을 제기한 모든 고객님께 제조상 과실뿐 아니라 사용자 과실에도 단, 1회에 한하여 신품 교환보상을 해드립니다.</span></small>
                </div>
                <div class="service-list-type01 inset-ml">
                  <ol>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">01</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">윈터 명품<br>보증 대상</div>
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <img src="../img/service/guarantee_inner_02.jpg" alt="">
                          <p>
                            <small>(단, 70시리즈 이상 / LTR 제외)</small>
                          </p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">02</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">윈터 명품<br>보증 기간</div>
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <p class="guarantee">명품보증서 지급기간 : 2019.10.01 ~ 2020.02.28 까지 구매고객 대상<br>명품보증서비스 시행기간 : 2019.10.01 ~ 2020.06.30까지</p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">03</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">윈터 명품<br>보증 장소</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>구매 대리점 및 고객만족센터 : 1577-2781</li>
                            <li>서울서비스센터 : 02-6671-7003</li>
                            <li>부산서비스센터 : 051-929-0042</li>
                            <li>전국 A/S지정점</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">04</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">윈터 명품<br>보증 내용</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <b>사용자 과실</b>
                          <ul>
                            <li>펑크나 외상, 관통 등 순수 운행 중 발생된 손상에 한함</li>
                            <li>펑크의 경우 수리 운행 가능할 시 교환 대상에서 제외</li>
                            <li>외상은 코드가 보이는 경우에 보상</li>
                          </ul>
                          <b>제조상 과실</b>
                          <ul>
                            <li>사용자 불만 (쏠림, 진동 등)은 고객만족팀에서 직접 대면 처리</li>
                          </ul>
                          <b>보상운영 참고사항</b>
                          <ul>
                            <li>대상제품 4개 구매시 보증서 1매 제공</li>
                            <li>보증서를 소지하고 온라인에 등록한 고객에게 혜택 제공<br>(2가지 충족시 제공)</li>
                            <li>마모율 50% 이내(마모잔존율 50% 이상) 제품에 한함</li>
                            <li>타이어 교체비용은 고객 부담이며, 구매점 및 AS지정점에서만 교환가능</li>
                            <li>제조상 과실인 경우 교체비용 회사 부담</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">05</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">윈터 명품<br>보증 처리 절차</div>
                          </div>
                        </div>
                        <div class="product-other-view service">
                          <div class="service-data-detail guarantee layout-r inline-s">
                            <div class="step inline">
                              <b>Process 1.</b><br>
                              고객만족센터<br>
                              (1577-2781) 또는<br>
                              구입처에 클레임 접수<br>
                              <span class="icon01"></span>
                            </div>
                            <div class="step inline">
                              <b>Process 2.</b><br>
                              구입처 또는 서비스<br>
                              지정점 방문하여<br>
                              타이어교환(보증서 회수)<br>
                              <span class="icon02"></span>
                            </div>
                            <div class="step inline">
                              <b>Process 3.</b><br>
                              고객에게<br>
                              해피콜 실시<br><br>
                              <span class="icon03"></span>
                            </div>
                          </div>
                          <div class="rent-footer">
                            <ul>
                              <li>구입처 또는 서비스 지정점의 재고 상황에 따라 보상이 지연될 수 있습니다.</li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">06</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">윈터 명품<br>보증 제외</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <b>사용자 과실</b>
                          <ul>
                            <li>- 보상을 목적으로 한 고의 손상품이나 흠집, 외상, 펑크 등 변형을 시킬 경우(타인에 의한 경우 포함)</li>
                            <li>- 외부의 화학물질(약품, 제설제)과의 접촉에 의한 경우</li>
                            <li>- 휠 얼라이먼트(부적절한 차륜 정렬) 오류 등의 차량 이상으로 인한 이상마모인 경우</li>
                            <li>- 2018년, 2019년, 2020년 생산품이 아닌 경우</li>
                            <li>- 온라인에서 구입한 경우 / 넥스트레벨 렌탈 고객 (단, 넥센타이어 직영몰에서 구매한 경우 제외)</li>
                            <li>- 타이어렌탈(넥스트레벨) 계약 고객인 경우</li>
                            <li>- 마모율이 50% 이상(마모잔존율 50% 이하)인 경우</li>
                            <li>- 포장도로 및 간선도로 외에서 운행 중 발생한 사고</li>
                            <li>- 경주용, 임대용(단기렌트 포함), 법인차량(법인리스 포함), 리무진, 택시, 경찰차, 구급차, 기타 영업 및 긴급용도로 사용되는 차량</li>
                            <li>(※단, 개인리스, 장기렌트(3년 이상)의 경우 계약서 별도 제출 필요)</li>
                            <li>- 해당 차량에 적절치 않은 규격의 제품을 장착한 경우 (당사 차종별 타이어가이드 기준)</li>
                            <li>- 판매처, 제조일자 또는 출처 불분명한 중고품</li>
                            <li>- 윈터 명품보증제도를 이용하여 타사품 교환 또는 환불 요청은 불가</li>
                            <li>- 윈터 명품보증제도의 신품교환은 1회로 한정</li>
                            <li>- 보증서 미보유 및 온라인에 미등록한 고객 (두가지 충족 필수 )</li>
                            <li>※단, 넥센타이어 직영몰에서 제품 구매시 제외(보증번호 자동생성 및 명품보증 자동등록)</li>
                            <li>- 구입처에서 윈터 명품보증서를 발급 받지 않은 경우</li>
                            <li>※단, 넥센타이어 직영몰에서 제품 구매시 제외</li>
                            <li>- 구입후 1개월 이내 온라인 미등록시</li>
                            <li>- 보증서 작성 내용과 온라인 등록 내용이 상이할 경우</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                  </ol>
                </div>
              </section>
              <section id="tab-3" class="tab-content">
                <div class="text-center service-message-box inset-l pb-0 border-white-top">
                  <b>특별품질보증제도</b>
                  <small><span>N’FERA AU5, N’FERA AU7, N’FERA RU5, N'FERA Primus AS T1, N8000, N7000 PLUS, N7000, N’blue eco (편평비: 55시리즈 이하, 인치: 16인치 이상, 속도지수: V등급 이상) 상품을 구매하신 고객 중 <br/>
                            클레임을 제기한 모든 고객님께 제조상 과실뿐 아니라 사용자 과실(단,코드절상)에도 단, 1회에 한하여 신품 교환보상을 해 드립니다.</span></small>
                </div>
                <div class="service-list-type01 inset-ml">
                  <ol>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">01</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">특별 품질<br>보증 대상</div>
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <div class="service-data-detail layout-c">
                            <p class="guarantee">제조일로부터 2년 이내 클레임을 제기한 고객(단, 마모잔존율 50% 이내 )<br>
                              N’FERA AU5, N’FERA AU7, N’FERA RU5, N8000, N7000 PLUS, N7000, N’blue eco (편평비: 55시리즈 이하, 인치: 16인치 이상, 속도지수: V등급 이상)</p>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">02</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">특별 품질<br>보증 범위</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>보증대상 제품을 2개 이상 장착한 차량에 한함</li>
                            <li>사용자 과실(코드절상에 한함)</li>
                            <li>타이어 교체비용은 고객 부담이며, 구매점 및 AS지정점에서만 교환가능</li>
                          </ul>
                        </div>
                        <div class="rent-footer">
                          <ul>
                            <li>코드절상이란? 돌출물이나 외부의 충격으로 인해 타이어 옆면이 부풀어 오른 경우를 말함</li>
                          </ul>
                        </div>
                        <div class="service-data-detail layout-c">
                          <b>코드절상이란?</b>
                          <p class="guarantee">Carcass는 타이어 steel belt와 inner liner 사이에 고무로 topping된 textile cord로 구성되어있습니다. Carcass의 textile cord가 외부충격에 의해 끊어져, 내부의 높은 공기압이 끊어진 부위를 집중적으로 밀어내어 타이어 옆면이 혹처럼 부풀어 오르는 현상을 코드 절상(Cold Impact Break)이라고 합니다.</p>
                          <img src="../img/service/guarantee_inner_03.jpg" alt="">
                        </div>
                      </div>
                    </li>
                    <!-- <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">03</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">서비스<br>제공</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>공기압 무상 점검 및 보충</li>
                            <li>휠밸런스 무상 점검</li>
                            <li>무상 위치 교환 서비스(10,000~15,000km 운행 후)</li>
                            <li>N7000 PLUS 제외</li>
                          </ul>
                        </div>
                        <div class="rent-footer">
                          <ul>
                            <li>본 서비스는 구입처에 한하여 제공되며, 서비스 내용은 구입처에 따라 상이할 수 있습니다.</li>
                          </ul>
                        </div>
                      </div>
                    </li> -->
                    
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">03</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">특별 품질<br>보증 장소</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>구매 대리점 및 고객만족센터 : 1577-2781</li>
                            <li>서울서비스센터 : 02-6671-7003</li>
                            <li>부산서비스센터 : 051-929-0042</li>
                            <li>전국 A/S지정점</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">04</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">특별 품질<br>보증 처리 절차</div>
                          </div>
                        </div>
                        <div class="product-other-view service">
                          <div class="service-data-detail guarantee layout-r inline-s">
                            <div class="step inline">
                              <b>Process 1.</b><br>
                              고객만족센터<br>
                              (1577-2781) 또는<br>
                              구입처에 클레임 접수<br>
                              <span class="icon01"></span>
                            </div>
                            <div class="step inline">
                              <b>Process 2.</b><br>
                              구입처 또는 서비스<br>
                              지정점 방문하여<br>
                              타이어교환(보증서 회수)<br>
                              <span class="icon02"></span>
                            </div>
                            <div class="step inline">
                              <b>Process 3.</b><br>
                              고객에게<br>
                              해피콜 실시<br><br>
                              <span class="icon03"></span>
                            </div>
                          </div>
                          <div class="rent-footer">
                            <ul>
                              <li>구입처 또는 서비스 지정점의 재고 상황에 따라 보상이 지연될 수 있습니다.</li>
                              <li>특별품질보증 기간이 지난 경우 일반보증제도가 적용됩니다.(일반보증기간은 제조일로부터 6년 이내 제품에 한함)</li>
                              <li>피해보상 기준은 피해보상규정(제정경제고시 제2002-23호)을 적용합니다.</li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">05</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">특별 품질<br>보증 제외</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>타이어 1본 렌탈 계약 제외</li>
                            <li>보상을 목적으로 한 고의 손상품이나 흠집, 외상, 펑크 등 변형을 시킬경우(타인에 의한 경우 포함)</li>
                            <li>경주용, 임대용, 리무진, 택시, 경찰차, 구급차, 기타 영업 및 긴급용도로 사용되는 차량 (리스, 렌트, 법인 등 서비스 불가)</li>
                            <li>해당 차량에 적절치 않은 규격의 타이어를 장착한 경우(당사 차종별 타이어가이드 기준)</li>
                            <li>판매처, 제조일자 또는 출처 불분명한 중고품의 경우</li>
                            <li>잘못된 장착(당사 패턴가이드 기준), 부적절한 차륜 정렬 등 차량의 이상 및 공기압 관리 부족에 의한 마모 경우</li>
                            <li>온라인에서 구입한 경우 / 넥스트레벨 렌탈 고객<br/>(단, 넥센타이어 직영몰에서 구매한 경우 제외)</li>
                            <li>얼라이먼트 불량에 의한 편마모 및 손상</li>
                            <li>외부의 화학물질(약품, 제설제)과의 접촉에 의한 경우</li>
                            <li>신차 출고용 타이어 제외</li>
                            <li>기타, 진동, 쏠림 등 고객 감성적인 부분 제외(일반 클레임으로 처리)</li>
                            <li>당사 보증제도를 이용하여 타사품 교환 또는 환불 요청 불가</li>
                            <li>당사 보증제도를 이용하여 신품교환은 1회로 한정</li>
                            <li>N7000 PLUS 외 온라인 구매제품은 품질보증에서 제외</li>
                            <li>편평비: 55시리즈 초과, 인치: 16인치 미만, 속도지수: V등급 미만(H, T 등급 이하) 구매 제품 보증제외</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                  </ol>
                </div>
              </section>
              <section id="tab-4" class="tab-content">
                <div class="text-center service-message-box inset-l pb-0 border-white-top">
                  <b>일반보증제도</b>
                  <small><span>넥센타이어에서 제조, 판매하고 있는 제품에 제조상의 과실에 의한 하자가 발생할 시 공정거래위원회 제2011-10호 ‘소비자분쟁해결기준’에 준하여 보상하고 있습니다. </span></small>
                </div>
                <div class="service-list-type01 inset-ml">
                  <ol>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">01</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">일반<br>보증 기간</div>
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <p class="guarantee">제조일로부터 6년 이내, 홈 깊이가 20% 이상 남은 제품(사용율을 제외한 잔존율에 따라 보상)</p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">02</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">일반<br>보증 대상</div>
                          </div>
                        </div>
                        <div class="service-data-detail layout-c">
                          <p class="guarantee">제조상 과실에 한하며 승용차용, 승합차용 및 1.5톤 이하 경트럭용 타이어에 한해 적용</p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">03</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">일반<br>보증 장소</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <ul>
                            <li>구매 대리점 및 고객만족센터 : 1577-2781</li>
                            <li>서울서비스센터 : 02-6671-7003</li>
                            <li>부산서비스센터 : 051-929-0042</li>
                            <li>전국 A/S지정점</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">04</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">일반<br>보증 처리 절차</div>
                          </div>
                        </div>
                        <div class="product-other-view service">
                          <div class="service-data-detail guarantee layout-r inline-s">
                            <div class="step inline">
                              <b>Process 1.</b><br>
                              고객만족센터<br>
                              (1577-2781) 또는<br>
                              구입처에 클레임 접수<br>
                              <span class="icon01"></span>
                            </div>
                            <div class="step inline">
                              <b>Process 2.</b><br>
                              구입처 또는 서비스<br>
                              지정점 방문하여<br>
                              타이어교환(보증서 회수)<br>
                              <span class="icon02"></span>
                            </div>
                            <div class="step inline">
                              <b>Process 3.</b><br>
                              고객에게<br>
                              해피콜 실시<br><br>
                              <span class="icon03"></span>
                            </div>
                          </div>
                          <div class="rent-footer">
                            <ul>
                              <li>구입처 또는 서비스 지정점의 재고 상황에 따라 보상이 지연될 수 있습니다.</li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="service-data inline-m text-left">
                        <div class="layout-r pt-m pb-m">
                          <div class="service-data-number">05</div>
                          <div class="layout-c">
                            <div class="service-data-title inline after-line">일반<br>보증 제외</div>
                          </div>
                        </div>
                        <div class="service-data-detail guarantee layout-c">
                          <b>사용자 과실</b>
                          <ul>
                            <li>타이어 1본 렌탈 계약 제외</li>
                            <li>외상 또는 충격에 의한 손상, 도로상의 위험 요소에 의한 손상(예: 외상, 긁힘, 코드절상, 펑크 등)</li>
                            <li>과적 및 공기압 과부족에 의한 파열(조기마모, 코드파열, 세파레이션 등)</li>
                            <li>차륜 정렬 (캠버각, 토우인 또는 아웃) 불량 및 위치교환 미 실시에 의한 이상마모, 기마모 등</li>
                            <li>브레이크 드럼과 열에 의한 비드부 파열</li>
                            <li>기후나 오존의 영향에 의한 손상</li>
                            <li>외부의 화학물질에 의한 손상</li>
                            <li>타이어 사이드 월에 표시되어진 하중 및 속도지수와 차량 제조업체가 권장하는 하중 및 속도지수를 초과하여 적재 또는 운행한 차량에 의한 타이어 손상</li>
                            <li>부적절한 밸브사용 및 밸브 손상에 의한 타이어 손상일 경우</li>
                            <li>타이어 장착 불량</li>
                            <li>해당 차량에 적절치 않은 규격의 타이어를 장착한 경우(당사 차종별 타이어 가이드 기준)</li>
                            <li>경주용 또는 특수목적(캠핑카 등)에 사용한 경우</li>
                            <li>보관상의 부주의</li>
                            <li>보증기간이 초과한 경우</li>
                            <li>비정상적인 유통경로 및 중고로 구매한 타이어</li>
                            <li>상표명 및 D.O.T(제조 번호, 주차)를 확인할 수 없는 경우</li>
                            <li>용도 외에 사용한 경우 및 기타 제조 결함 사항이 아닌 운행 중 발생된 모든 손상</li>
                          </ul>
                        </div>
                      </div>
                    </li>
                  </ol>
                </div>
              </section>
            </div>
          </div>
          <!--  -->
        </main>
      </div>
      <!-- //subContentsWrap -->

<script type="text/javascript">
var userLoginId = "${userLoginId}";


$(document).ready(function() {

	//evManager.init();

	$("#bgFullImg").append("<div class='member-bg service-rental'></div>");

	// 차량검색
	$("#btnCarNumber").click(function(){
		window.location = "/product/prdList?viewGbn=H";
	});

	// 상품둘러보기
	$("#goProduct").click(function(){
		window.location = "/product/prdList?viewGbn=H";
	});

	// 전문점 찾기
	$("#goAgency").click(function(){
		window.location = "/bbs/specialDealerList";
	});

});


</script>
