<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<script type="text/javascript" src="/js/common_ui.js"></script>
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/jquery.timepicker.min.js"></script>

<!-- 다음 맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>
	
<!-- speacialDealerList에서 마커 클릭시 넘겨주는 값 -->
<form>
	<input type="hidden" id="getAgencyNm" value="<%= request.getParameter("getAgencyNm") %>">
</form>
		
<!--subContentsWrap-->
<div class="subContentsWrap">   
	<main>
		<div class="store-wrap shop-search bg">
			<div class="mapInfoBox custom-position">
				<div class="mapInfoTop">
				
					<!-- 찾기 검색 -->
					<div class="search-area-wrap-rental inset-m">
						<div class="layout-c">
							<div class="layout-r inline-m border-gray-bottom">
								<select class="inline border-none" title="시/도 선택" onchange="selectSiGunGu();" id="sido">
									<option value="">시/도 선택</option>
									<c:forEach var="list" items="${selectSiDoList}" varStatus="status">
									<option value="${list.cdNm }">${list.cdNm }</option>
									</c:forEach>       
								</select>
							
								<select class="inline border-none" title="시/군/구 선택" id="sigungu">
									<option value="">시/군/구 선택</option>
								</select>
							</div>
							<%-- <c:set var="name" value="<%= request.getParameter("getAgencyNm") %>"></c:set> --%>
							<%-- <c:if test="${name not empty and name != 'null'}"> --%>
							<%-- <input type="text" name="meajang" id="meajang" class="type03  pl-0 border-gray-bottom" id="shopName" title="매장명 입력란" placeholder="매장명을 입력해보세요" value="<%= request.getParameter("getAgencyNm") %>"> --%>
							<%-- </c:if> --%>
							<%-- <c:if test="${name == 'null'}"> --%>
							<!-- <input type="text" name="meajang" id="meajang" class="type03  pl-0 border-gray-bottom" id="shopName" title="매장명 입력란" placeholder="매장명을 입력해보세요"> -->
							<%-- </c:if> --%>
							<input type="text" name="meajang" id="meajang" class="type03 trans-bg pl-0 border-gray-bottom" id="shopName" title="매장명 입력란" placeholder="매장명을 입력해보세요">
						</div>
						
						<button type="button" class="go-view full-width inset-s" onclick="selectStoreAll('1');"><b>렌탈 전문점 한눈에 보기</b></button>
					</div>
					<!-- 찾기 검색 -->

					<button type="button" class="search-shop" onclick="selectStore('1'); return false;"><span></span>렌탈 전문점 찾기</button>
                
					<!--total-->
					<div class="count-box utility layout-r pl-m pr-m totalBar" style="display:none;">
						<div class="utility-result-total">
							<span>total</span>
							<span class="totalCnt"><span id="storeListCnt"></span></span>
						</div>
						<!-- 
						<div class="utility-result-map">
							<button type="button" class="change-map pr-0"><span></span>지도</button>
						</div>
						-->
					</div>
					<!--total-->

				</div>
			</div>
			<div class="position">
				<div class="shop-search-result">
					<ul id="storeList"></ul>
				</div>
				<!--더보기-->
				<div id="pagingMap" class="bg" style="display:none;"></div>
				<!--더보기-->
			</div>
		</div>
	</main>
</div>
<!--subContentsWrap-->
		
<!-- Popup Group -->
<!-- ######################################### -->
<div class="fullPopup md-modal-3 md-effect-1 " id="modalAgencyDetl">
	<div class="popContents order-basket">
		<a href="#" onclick="javascript:fn_popupClose();" class="layPopClose md-close"></a>
	
		<header class="title" id="agencyHeader"></header>
	
		<!--contents-->
		<div class="popup-contents-nobottom">
			<div class="inset-ml">
				<div class="submit layout-c mb-m border-bottom">
					<p class="black">주소</p>
					<p class="pt-s addressView" id="agencyAddr"></p>
				</div>
			        
				<div class="submit layout-c mb-m border-bottom">
					<p class="black">전화번호</p>
					<p class="pt-s pb-s" id="agencyTel"></p>
				</div>
			        
				<div class="submit layout-c mb-m border-bottom">
					<p class="black">영업시간</p>
					<p class="pt-s pb-s" id="agencyBizTime"></p>
				</div>
			        
				<div class="submit layout-c border-bottom">
					<p class="black">취급품목</p>                          
					<p class="pt-s pb-s">
						<!-- 상태아이콘 -->
						<div class="pb-s">
							<div class="shop-state-icon layout-r inline inline-s" id="agencyWkTp"></div>
						</div>
						<!-- 상태아이콘 -->
					</p>
				</div>
			        
				<div class="submit layout-c border-bottom">
					<p class="black">탈착기</p>                          
					<p class="pt-s pb-s pInfo" id="agencyOpt1"></p>
				</div>
			
				<div class="submit layout-c border-bottom">
					<p class="black">얼라인먼트</p>                          
					<p class="pt-s pb-s pInfo" id="agencyOpt2"></p>
				</div>
			
				<div class="submit layout-c border-bottom">
					<p class="black">밸런스</p>                          
					<p class="pt-s pb-s" id="agencyOpt3"></p>
				</div>
			
				<p class="desc small font-gray po_m10">
				  ※ 수입차 및 대형 차량의 경우 고급형 장비가 있는 곳에서 교체하시기 바랍니다.
				</p>
			        
				<div class="mapView" style="height:200px" id="mapDivPopup"></div>
			
				<!-- slider -->
				<div class="store" >
					<div id="agencyGall"></div>
				</div>            
				<!-- //slider -->
			</div>
		</div>
		<!--contents-->
		
	</div>
</div>

<div class="md-overlay"></div>
<!-- ######################################### -->
<!-- //Popup Group -->
    
<script type="text/javascript" src="../js/lib/classie.js"></script>
<script type="text/javascript" src="../js/lib/modalEffects.js"></script>
   
<input type="hidden" name="pageNo"		id="pageNo"		value="${pageNo}"/>		<!-- 현재 페이지 -->
<input type="hidden" name="pageSize"	id="pageSize" 	value="5" />		<!-- 페이지에 표시할 수 -->

<script type="text/javascript">
var userLoginId = "${userLoginId}";

//주소로 거점 재고 체크
//방문 ,픽업
var pageAddr = "";
var detailList = [];	//거점 조회 시 주문 가능일자만 표시 위한 변수
var storechkDay = []; 	//거점 조회 시 주문 가능일자만 표시 위한 변수

//지도 그리기
function mapDraw(lon , lat , bhfNm , positions, mapId){
	var agencyLat 	= lat; 	//대리점의 위도
	var agencyLon 	= lon; 	//대리점의 경도
	var agencyBhfNm	= bhfNm; 	

    //var mapContainer = document.getElementById('mapDiv'), // 지도를 표시할 div
    var mapContainer = document.getElementById(mapId), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(agencyLat, agencyLon), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커를 생성합니다
	var imageSrc = "/img/common/icon_pin.png";
    var imageSize = new daum.maps.Size(50, 50);
    for (var i = 0; i < positions.length; i ++) {

    	console.log(positions[i].lat +"/"+  positions[i].lon + "/ " + positions[i].title)

        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: new daum.maps.LatLng(positions[i].lat, positions[i].lon), // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : new daum.maps.MarkerImage(imageSrc, imageSize) // 마커 이미지
            //clickable: true
        });
    }
}

$(document).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='customer-bg store'></div>");
	/* page background image End */
	var winW = $(window).outerWidth();
		
	$('.position').css({
		'top': 255,
		'height': 416 - 95,
		'width': winW,
		'overflow-y': 'auto',
		'padding': 0
	});
	
	$(".totalBar").show();
	
	$('.search-shop').bind('click', function(){
		var getH = $('.position').height();
		if ( !$('.position').hasClass('on') ) {
			$('.position').addClass('on');
			$('.search-shop').addClass('on');
			$('.search-area-wrap-rental').slideUp();
			$('.position').animate({
				"height": getH + 160,
				"top": 95
			});
		} else {
			$('.position').removeClass('on');
			$('.search-shop').removeClass('on');
			$('.search-area-wrap-rental').slideDown();
			$('.position').animate({
				"height": getH - 160,
				"top": 255
			});
		}
	});
	
	selectStoreAll('1');
});


//렌탈 전문점 한눈에 보기
function selectStoreAll(pageNo){
	
	//$(".totalBar").hide();
	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	var param = {orderType : "A", pageNo : pageNo};

	$.ajax({
		type: "post",
		url: "/order/rentalList",
		data: JSON.stringify(param),
		contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		success: function (data) {
			if(data.rtnCode == "-1") {
				alert(data.rtnMsg);
				return;
			}
			
			var list = data.rtnList;
			var pageCommon = data.pageCommon;
			
			var html = "";
			
     		if(list.length > 0 ) {
        	
	   			//페이지용
		    	for(var i=0; i<list.length; i++) {
		 			html +="<li>";
		 			html +="	<div class='shop-search-single'>";
		 			html +="		<div class='layout-r'>";
		 			html +="			<div class='shop-content-box layout-c'>";
		 			html +="				<ul class='mb-m'>";
					if(list[i].reviewCnt > 0){
				  		html +="					<li><b>"+list[i].agencyNm+"</b> <img src='/img/product/map_star.png'/>"+list[i].reviewGrdPt+"점("+list[i].reviewCnt+")</li>";
					} else {
				  		html +="					<li><b>"+list[i].agencyNm+"</b></li>";
					}
		 			html +="					<li>"+list[i].city + " " +list[i].street+"</li>";
		 			/* html +="					<li><b>수입차 경정비 가능</b></li>"; */
		 			html +="				</ul>";
		 			html +="				<div class='layout-r'>";
		 			html +="					<div class='shop-state-icon layout-r inline inline-s'>";
		 			html +=							makingTypeLabel(html, list[i]);
		 			html +="					</div>";
		 			html +="				</div>";
		 			html +="			</div>";
		 			html +="			<div class='shop-btn-box inline text-right align-bottom layout-c'>";
		 			html +="				<button type='button' class='road' onClick='goFind(\""+list[i].agencyNm+"\", \""+list[i].posX+"\", \""+list[i].posY+"\");'><b>길찾기</b><span></span></button>";
		 			html +="				<button type='button' class='' onClick='fn_searchAgencyInfo(\""+list[i].agencyCd+"\");'><b>선택하기</b><span></span></button>";
		 			html +="			</div>";
		 			html +="		</div>";
		 			html +="	</div>";
		 			html +="</li>";
		 		}
	 		
				if(pageNo > 1) {
					$("#storeList").append(html);
				} else {
					$("#storeList").html(html);
				}
				$("#storeListCnt").html(pageCommon.totalCount);
		
				$("#pageNo").val(pageNo);
				PageUtil.fnPageMakeMoreDisplay(pageCommon.totalCount, $("#pageNo").val() , $("#pagingMap") , "selectStoreAll", 5);
	
	 		} else {
		 		html += "<li>";
		 		html += "<div class='storeList text-center inset-m'>";
		 		html += "    <ul>";
		 		html += "		<li>조회된 전문점이 없습니다.</li>";
		 		html += "    </ul>";
		 		html += "</div>";
		 		html += "</li>";
		 		
	 			$("#storeList").html(html);
				$("#storeListCnt").html("0");
	
				$("#pageNo").val('1');
				PageUtil.fnPageMakeMoreDisplay(pageCommon.totalCount, $("#pageNo").val() , $("#pagingMap") , "selectStoreAll", 5);
			}
		},
		error: function(xhr,status,error){
			//alert(support0014);
		}
	});
}


function selectStore(pageNo){
	var sido = $("#sido").val();
	var meajang = $("#meajang").val();
	
	if(meajang == "" && sido == "") {
		alert("시도 정보 또는 매장명을 입력 하세요.");
		return false;
	}

	//$(".totalBar").hide();
	// searchClCd : 시  - sido
	// searchPtnCd : 시군구  - sigungu
	// searchFm : 수입차
	// searchKeyword : 검색어  - meajang
	// pageIndex : 페이지 번호

	var param = {searchClCd : $("#sido").val() ,  searchPtnCd : $("#sigungu").val() , searchKeyword : $("#meajang").val() , orderType : "A", pageNo : pageNo};

	$.ajax({
		type: "post",
		url: "/order/rentalList",
		data: JSON.stringify(param),
		contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
		success: function (data) {
			if(data.rtnCode == "-1") {
				alert(data.rtnMsg);
				return;
			}
			var list = data.rtnList;
			var pageCommon = data.pageCommon;
			
			var html = "";
			if(list.length > 0 ) {
				//페이지용
			 	for(var i=0; i<list.length; i++) {
					html +="<li>";
					html +="	<div class='shop-search-single'>";
					html +="		<div class='layout-r'>";
					html +="			<div class='shop-content-box layout-c'>";
					html +="				<ul class='mb-m'>";
					if(list[i].reviewCnt > 0){
						html +="					<li><b>"+list[i].agencyNm+"</b> <img src='/img/product/map_star.png'/>"+list[i].reviewGrdPt+"점("+list[i].reviewCnt+")</li>";
					} else {
						html +="					<li><b>"+list[i].agencyNm+"</b></li>";
					}
					html +="					<li>"+list[i].city + " " +list[i].street+"</li>";
					html +="				</ul>";
					html +="				<div class='layout-r'>";
					html +="					<div class='shop-state-icon layout-r inline inline-s'>";
					html +=							makingTypeLabel(html, list[i]);
					html +="					</div>";
					html +="				</div>";
					html +="			</div>";
					html +="			<div class='shop-btn-box inline text-right align-bottom layout-c'>";
					html +="				<button type='button' class='road' onClick='goFind(\""+list[i].agencyNm+"\", \""+list[i].posX+"\", \""+list[i].posY+"\");'><b>길찾기</b><span></span></button>";
					html +="				<button type='button' class='' onClick='fn_searchAgencyInfo(\""+list[i].agencyCd+"\");'><b>선택하기</b><span></span></button>";
					html +="			</div>";
					html +="		</div>";
					html +="	</div>";
					html +="</li>";
				}
			
				if(pageNo > 1) {
					$("#storeList").append(html);
				} else {
					$("#storeList").html(html);
				}
				$("#storeListCnt").html(pageCommon.totalCount);
			
				$("#pageNo").val(pageNo);
				PageUtil.fnPageMakeMoreDisplay(pageCommon.totalCount, $("#pageNo").val() , $("#pagingMap") , "selectStore", 5);
			} else {
				html += "<li>";
				html += "<div class='storeList text-center inset-m'>";
				html += "    <ul>";
				html += "		<li>조회된 전문점이 없습니다.</li>";
				html += "    </ul>";
				html += "</div>";
				html += "</li>";
				$("#storeList").html(html);
				$("#storeListCnt").html("0");
				
				$("#pageNo").val('1');
				PageUtil.fnPageMakeMoreDisplay(pageCommon.totalCount, $("#pageNo").val() , $("#pagingMap") , "selectStore", 5);
			}
		},
		error: function(xhr,status,error){
			//alert(support0014);
		}
	});
}

//시도 셀렉트 선택 시 시군구 조회
function selectSiGunGu(){
	var sido = $("#sido").val();
	
	if (ValidUtil.isEmpty(sido)) {
    	var html = "";
    	html += "<option value=''>시/군/구 선택</option>";
    	$("#sigungu").html(html);
		return false;
	}
	
	$.ajax({
		url: "/order/selectSiGunGu",
		type: "GET",
		data: {param : $("#sido").val()},
		success: function(data) {
			console.log(data);
			var html = "<option value=''>전체</option>";
			for(var i=0; i<data.length; i++) {
				html += "<option value='"+data[i].cd+"'>" + data[i].cdNm + "</option>";
			}
			$("#sigungu").html(html);
		},
		error: function (request, status, error) {
			console.log(error);
		}
	});
}


function fn_searchAgencyInfo(agencyCd) {
	var pUrl = "/order/rentalAgencyInfo";
	var pParams = {
		agencyCd : agencyCd
	};
	
	console.log("fn_searchAgencyInfo rentalAgencyInfo !!!");
	console.log(pParams);
	cfnSendRequest(pUrl,pParams,'rentalAgencyInfo');
}


/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	if(result.rtnCode == 0) {
		if (callback == 'rentalAgencyInfo') {
			var html = "";
			html += "<h2 class='f_ell'>";
			html += result.rtnList[0].agencyNm;
			html += "</h2>"
			html += "<div class='state'>";
			if(result.rtnList[0].chYn == "Y") {
				html += "	<img src='../img/common/state_big_ico01.png' alt='추천'> ";
			}
			html += "   <img src='../img/common/state_big_ico02.png' alt='타이어'>";
			html += "</div>";
			$("#agencyHeader").empty();
			$("#agencyHeader").html(html);
			
            // 주소정보
			html = "";
			html += "<span>";
            html += result.rtnList[0].city + " " +result.rtnList[0].street;
            html += "</span>";
            html += "<button type='button' class='road' onClick='goFind(\""+result.rtnList[0].agencyNm+"\", \""+result.rtnList[0].posX+"\", \""+result.rtnList[0].posY+"\");'><b>길찾기</b><span></span></button>";
			$("#agencyAddr").html(html);
			
            // 전화번호
			$("#agencyTel").text(phoneFomat(result.rtnList[0].telNo));
            
            // 영업시간
			$("#agencyBizTime").text(result.rtnList[0].agencyBizTime);
            $("#agencyWkTp").html(makingTypeLabel("", result.rtnList[0]);
            
            // 탈착기
            if (!ValidUtil.isEmpty(result.rtnList[0].desorptNm)){
	            html = "";
	            html +="<span>"+result.rtnList[0].desorptNm+"</span>";
	            $("#agencyOpt1").html(html);            	
            }
            
            // 얼라이먼트
            if (!ValidUtil.isEmpty(result.rtnList[0].alignNm)){
	            html = "";
	            html +="<span>"+result.rtnList[0].alignNm+"</span>";
	            $("#agencyOpt2").html(html);
            }
            
            // 밸런스
            if (!ValidUtil.isEmpty(result.rtnList[0].balanceNm)){
	            html = "";
	            html +="<span>"+result.rtnList[0].balanceNm+"</span>";
	            $("#agencyOpt3").html(html);		
            }

            // 이미지
		    html = "";
            for(var j=0; j < result.acyFileList.length; j++) {
	            if (!ValidUtil.isEmpty(result.acyFileList[j].atflPathNm)){
		            html +="<div>";
		            html +="	<img src='<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile_cms/agency/"+result.acyFileList[j].atflPathNm+"' alt='장착점' />";
		            html +="</div>";
	            }
            }
            
            if (result.acyFileList.length == 0) {
            	html += "<div>";
            	html += "	<a href='#'><img src='../img/customer/m_slider_01.jpg' alt='장착점' /></a>";
            	html += "</div>";
            	html += "<div>";
            	html += "	<a href='#'><img src='../img/customer/m_slider_02.jpg' alt='장착점' /></a>";
            	html += "</div>";
            	html += "<div>";
            	html += "	<a href='#'><img src='../img/customer/m_slider_03.jpg' alt='장착점' /></a>";
            	html += "</div>";
            	html += "<div>";
            	html += "	<a href='#'><img src='../img/customer/m_slider_01.jpg' alt='장착점' /></a>";
            	html += "</div>";
            }
            
		    $("#agencyGall").removeClass("slick-initialized slick-slider swiper-store1");
		    $("#agencyGall").html(html);
		    $("#agencyGall").addClass("swiper-store1");
		    
		    $('.swiper-store1').slick({
				infinite: false,
				arrows: true,
				slidesToShow: 2,
				slidesToScroll:1,
				nextArrow: '<i class="nextArrow"></i>',
				prevArrow: '<i class="prevArrow"></i>',
			});
		    
			/* var $swiper_store = $('.swiper-store');
			$swiper_store.slick(); */
		    
		    positions = [];
            var obj = {
            		title	: result.rtnList[0].agencyNm,
            		addr 	: result.rtnList[0].city + " " +result.rtnList[0].street,
            		lat		: result.rtnList[0].posX,
            		lon		: result.rtnList[0].posY
            };
            positions.push(obj);
            mapTargetDiv = "mapDivPopup";
            mapDraw(result.rtnList[0].posY , result.rtnList[0].posX, result.rtnList[0].agencyNm , positions, "mapDivPopup");
			
            getRentStore(result.rtnList[0].posX,result.rtnList[0].posY);
 
			$("#modalAgencyDetl").addClass("md-show");
			
		} else if (callback == 'selectAroundRentalStoreMap') {
			// selectAroundRentalStoreMap
	        var obj;
            for(var j=0; j < result.rtnList.length; j++) {
	            obj = {
	            		title	: result.rtnList[j].agencyNm,
	            		addr 	: result.rtnList[j].city + " " +result.rtnList[j].street,
	            		lat		: result.rtnList[j].posX,
	            		lon		: result.rtnList[j].posY,
	            };
	            positions.push(obj);
            }
            console.log("mapTargetDiv::" + mapTargetDiv);
            if (result.rtnList.length > 0) {
            	if(mapTargetDiv == "mapDiv") {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, '' , positions, "mapDiv");
            	} else {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, '' , positions, "mapDivPopup");
            	}
            }
		}
	}
}


//전문점 취급품목 유형 라벨 만들기
function makingTypeLabel(html, info) {
	
	var htmlStr = "";
	htmlStr += "        <div class='state inline'>";
	htmlStr += "            <img src='/img/common/state_ico02.png'  alt='타이어'/>";
	htmlStr += "            <span>타이어</span>";
	htmlStr += "        </div>";
	if(info.chYn == "Y") {
		htmlStr += "        <div class='state inline'>";
		htmlStr += "            <img src='/img/common/state_ico01.png'  alt='추천'/>";
		htmlStr += "            <span>추천</span>";
		htmlStr += "        </div>";
	}
	if(info.cwYn == "Y") {
		htmlStr += "        <div class='state inline'>";
		htmlStr += "            <img src='/img/common/state_ico05.png'  alt='세차'/>";
		htmlStr += "            <span>세차</span>";
		htmlStr += "        </div>";
	}
	if(info.fmYn == "Y") {
		htmlStr += "        <div class='state inline'>";
		htmlStr += "            <img src='/img/common/state_ico05.png'  alt='1급정비'/>";
		htmlStr += "            <span>1급정비</span>";
		htmlStr += "        </div>";
	}
	if(info.lmYn == "Y") {
		htmlStr += "        <div class='state inline'>";
		htmlStr += "            <img src='/img/common/state_ico03.png'  alt='경정비'/>";
		htmlStr += "            <span>경정비</span>";
		htmlStr += "        </div>";
	}
	if(info.seasonGbn == "02") {
		htmlStr += "        <div class='state inline'>";
		htmlStr += "            <img src='/img/common/state_ico04.png'  alt='겨울용'/>";
		htmlStr += "            <span>겨울용</span>";
		htmlStr += "        </div>";
	}
	
	html += htmlStr;
	return htmlStr;
}


/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	if(result.rtnCode != 0) {
		if (callback == 'rentalAgencyInfo') { 
			// rentalAgencyInfo
			console.log(status);
		} else if (callback == 'selectAroundRentalStoreMap') {
			// selectAroundRentalStoreMap
		}
	}
}


function fn_popupClose() {
	$("#modalAgencyDetl").removeClass("md-show");
}


/* 나의 위치 근처 렌탈 전문점 가져오기 */
function getRentStore(lat,lon){
	
	var pUrl = "/order/selectAroundRentalStoreMap";
	
	var pParams = {
			"posX" : lat
			,"posY" : lon
	};
	
	console.log("f_searchRentStore  !!!");
	console.log(pParams);
	cfnSendRequest(pUrl,pParams,'selectAroundRentalStoreMap');
}

</script>
    