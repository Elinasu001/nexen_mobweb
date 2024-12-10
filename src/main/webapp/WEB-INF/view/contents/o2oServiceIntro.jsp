<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<link rel="stylesheet" type="text/css" href="/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="/css/o2oserviceintro.css"/>


		      <!-- subContentsWrap -->
      <div class="subContentsWrap">
        <main class="o2o">
          <!-- header -->
          <div class="page-header">
            <!-- <h2 class="title-deco">
              <span>스마트</span> <span>컨슈머를 위한!</span>
            </h2>
            <h3 class="title-deco-sub">O2O 서비스</h3> -->
            <img src="/img/service/o2o/keyvisual_text.png" alt="스마트 컨슈머를 위해 비대면 장착이 가능한 O2O서비스 런칭!"/>
          </div>
          <!-- //header -->


          <div class="service-seciton-01">
            <h3>
              O2O 서비스란?
            </h3>
            <p>
              온라인으로 쉽고 편리하게 주문하고,
              방문장착으로 정비해드리는
              넥스트레벨만의 프리미엄 고객 맞춤 서비스입니다
            </p>

            <img src="/img/service/o2o/what_is.png" alt=""/>

          </div>

          <div class="service-seciton-02">
            <h3>
              <span>세상 편리한 Car-life의 시작!</span> <b>O2O 서비스</b>
            </h3>





          </div>

          <ul class="benefit-caroucel">
            <li>
              <div class="benefit-item">
                <div class="ico"><img src="/img/service/o2o/ico_service_01.png" alt=""/></div>
                <div class="subject">맞춤 타이어 추천</div>
                <div class="desc">
                  차량번호 검색으로<br/>
                  타이어 또는 경정비 항목을
                  추천 드립니다.
                  <div class="link-box">
                    <a href="javascript:openSizeFinder('num');" id="btnCarNumberPop">내 차량 검색</a>

                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="benefit-item">
                <div class="ico"><img src="/img/service/o2o/ico_service_02.png" alt=""/></div>
                <div class="subject">시간 절약의 편리성</div>
                <div class="desc">
                  원하는 장소에서<br/>
                  방문장착 서비스로<br/>
                  안전하고 편리하게 맡기세요.
                  <br/><br/>
                  <small class="block">
                    - 급하게 타이어를 교체할 때<br/>
                    - 시간을 내기 어려울 때
                  </small>


                </div>
              </div>
            </li>
            <li>
              <div class="benefit-item">
                <div class="ico"><img src="/img/service/o2o/ico_service_03.png" alt=""/></div>
<!--                 <div class="subject">제조사 직영 서비스</div> -->
				<div class="subject">전문적인 서비스</div>
                <div class="desc">
                	안심하고 맡길 수 있는<br/>
					표준화된 서비스를 전국 동일한<br/>
					합리적인 가격으로 제공합니다.
<!--                   믿을 수 있는 넥센타이어의<br/> -->
<!--                   표준화된 서비스를 전국 동일한<br/> -->
<!--                   합리적인 가격으로 제공합니다. -->
                  <!-- <div class="link-box">
                    <a href="/product/prdList?viewGbn=H" id="goProduct">상품 보기</a>
                    <a href="/bbs/specialDealerList" id="goAgency">전문점 찾기</a>
                  </div> -->
                </div>
              </div>
            </li>
            <li>
              <div class="benefit-item">
                <div class="ico"><img src="/img/service/o2o/ico_service_04.png" alt=""/></div>
                <div class="subject">안심 서비스</div>
                <div class="desc">
                  전문가 서비스 메뉴얼 준수 /<br/>
                  작업 전 후 사진촬영
                </div>
              </div>
            </li>
            <li>
              <div class="benefit-item">
                <div class="ico"><img src="/img/service/o2o/ico_service_05.png" alt=""/></div>
                <div class="subject">부가 서비스</div>
                <div class="desc">
                  타이어 장착<small>(TPMS 부착 차량 포함)</small><br/>
                  / 밸런스 / 항균연막탈취를<br/>
                  무상으로 제공해 드립니다.
                  <br/><br/>
                  <!-- <small class="block">
                    ※ 방문장착 선택 시 쿠폰으로 발급 (유효기간 1년)
                  </small> -->

                </div>
              </div>
            </li>
          </ul>

<a name="tab01">&nbsp;</a>
<a name="tab02">&nbsp;</a>
<a name="tab03">&nbsp;</a>

          <div class="o2o-info-box">
            <div class="mynexen-tab tab-nav js-tab layout-r">
              <button type="button" id="" data-tab="o2o-tab-1">방문장착</button>
              <!-- <button type="button" id="" data-tab="o2o-tab-2">픽업&딜리버리</button> -->
              <button type="button" id="" data-tab="o2o-tab-3">전문점장착</button>
            </div>



            <div id="o2o-tab-1" class="tab-content visit">
              <div class="proInfoView">
                <h3>
                  <img src="/img/service/o2o/service_01_title.png" alt="고객이 원하는 곳에서! 위치만 알려주면! 바로 달려갑니다."/>
                </h3>

                <div class="video">
                  <iframe width="560" height="315" src="https://www.youtube.com/embed/jd5iiNmCmKA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="infoStep">
                  <img src="/img/service/o2o/service_01_step.png" alt="타이어주문 - 방문장착 출발 - 무료장착 - 작업내역확인">
                </div>

                <div class="serMapInfo">
                  <img src="/img/service/o2o/service_012_map.png" alt="비대면의 경우 주차 환경에 따라 요청 시 서비스 매니저에게 키 전달이 필요할 수 있습니다."/>
                </div>
              </div>
            </div>
            <div id="o2o-tab-2" class="tab-content pickup">
              <div class="proInfoView">
                <h3>
                  <img src="/img/service/o2o/service_02_title.png" alt="고객이 편리하게! 키만 건네주면 픽업한 뒤 다시 배달"/>
                </h3>

                <div class="video">
                  <iframe width="560" height="315" src="https://www.youtube.com/embed/LNoZXin6JLw?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>

                <div class="infoStep">
                  <img src="/img/service/o2o/service_02_step.png" alt="타이어주문 - 방문장착 출발 - 무료장착 - 작업내역확인">
                </div>

                <!-- <div class="serMapInfo">
                  <img src="/img/service/o2o/service_012_map.png" alt="차량 픽업을 위해 서비스 매니저에게 키를 건네주세요."/>
                </div> -->
              </div>
            </div>
            <div id="o2o-tab-3" class="tab-content store">
              <div class="proInfoView">
                <h3>
                  <img src="/img/service/o2o/service_03_title.png" alt="고객이 전문매장으로! 원하는 예약시간에 전문매장에서"/>
                </h3>
                <div class="visual-box">
                  <img src="/img/service/o2o/service_03_visual.jpg" alt=""/>
                </div>
                <div class="infoStep">
                  <img src="/img/service/o2o/service_03_step.png" alt="타이어주문 - 방문장착 출발 - 무료장착 - 작업내역확인">
                </div>

                <div class="serMapInfo">
                  <img src="/img/service/o2o/service_03_map.png" alt=""/>
                </div>
              </div>
            </div>
          </div>

<!--           <div> -->
<!--             <button type="button" class="btn-primary inset-m full-width" id="goAgency"><b>O2O 서비스 장착 전문점 찾기</b></button> -->
<!--           </div> -->
        </main>
      </div>
      <!-- //subContentsWrap -->

<script type="text/javascript">
ex2cts.push('track', 'contents');

var userLoginId = "${userLoginId}";

	$(function(){

		if( document.location.hash.indexOf('tab01') != -1 ){
			$(".mynexen-tab button").eq(0).trigger("click");
		}else if( document.location.hash.indexOf('tab03') != -1 ){
			$(".mynexen-tab button").eq(1).trigger("click");
		}

  });

$(document).ready(function() {

	//evManager.init();
	$("#bgFullImg").append("<div class='member-bg service-o2o'></div>");

	// 전문점 찾기
	$("#goAgency").click(function(){
		window.location = "/bbs/specialDealerList";
	});

  $('.benefit-caroucel').on('setPosition', function(event, slick, direction){

      setTimeout(function(){

        var max_h = 0 ;
      $('.benefit-caroucel .slick-slide').each(function( i, obj ){
        max_h = Math.max(  $(obj).height() ,max_h );
      });
      console.log( max_h );
      $('.benefit-caroucel .slick-slide').height( max_h );


      }, 500 );

  });

  $('.benefit-caroucel').slick({
		arrows:true,
		dots:false,
		// centerMode: true,
		// centerPadding: '0px',
    variableWidth:true
		// draggable:false,
		// pauseOnHover:true,
		// accessibility:false,
		// adaptiveHeight:true
    });



});


</script>
