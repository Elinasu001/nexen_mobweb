<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

	<script type="text/javascript" src="/js/common_ui.js"></script>
	<!-- 다음 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=AppContext.getString(WebConstants.KAKAO_MAP_APPKEY)%>&libraries=services"></script>
		<!--subContentsWrap-->
        <div class="subContentsWrap">   
          <main>
			<!-- header -->
			
			<%-- 
			<div class="page-header">
				<h2 class="title-deco">
					<span style="font-size:2rem">전문점을</span> <span style="font-size:2rem">찾아보세요.</span>
				</h2>
	
				<h3 class="title-deco-sub" style="margin-top:10px !important">전문점 찾기</h3>
			</div>
			--%>
			<!-- header -->
	             
			<div class="store-map-wrap">
				<div class="popup-map-ui">
					<button type="button" class="btn-position" onclick="javascript:callMap('1');">현재위치</button>
					<button type="button" class="btn-map-list change-list" id="fngoSearch"><span></span><b>목록</b></button>
				</div>
			</div>
	             
			<div id="mapwrap">
				<div id="mapDiv" style="width: 100%; height:600px;"></div>
			</div>
          </main>
		</div>
		<!--subContentsWrap-->

<script type="text/javascript">
var userLoginId = "${userLoginId}";

//전문점찾기 - Start
var pageAddr = "";
var positions = [];
var mapTargetDiv;
var agencyNm;

function callMap(gbn) {
	//현재 내 위치 또는 고정 좌표로 호출
	var myLat = 37.57001757231217; //나의 위치 위도 (기본 위치)
	var myLon = 126.827499331455; //나의 위치 경도 (기본 위치)


	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if(navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	myLat = position.coords.latitude, // 위도
	    	myLon = position.coords.longitude; // 경도
		});
	}
	
	var obj = {
        			title	: "",
        			addr 	: "",
        			lat		: myLat,
        			lon		: myLon,
        			};
	positions.push(obj)
	mapTargetDiv = "mapDiv";
	
	mapDraw(myLon , myLat , "" , positions, "mapDiv");
	
	//나의 위치 근처 렌탈 전문점 가져오기
 	getRentStore(myLat, myLon);
}

//위도 경도로 주소 가져 오기
function getAddr(result) {
	var addrTxt =  result[0].road_address.address_name;

	
}

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
        ,clickable: true
        });
    	agencyNm = positions[i].title;
    	console.log("agencyNm :: " + agencyNm);
    	 infoWindow(marker, positions[i].title);
    }
   

}

function infoWindow(marker, agencyBhfNm, tel_no, rep_nm, city, street, addr3, agency_cd, salesGroup, salesOffice, pos_cd){
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:2px;"><span style="font-weight:bold;">영업점명 </span> : '+agencyBhfNm+'</div>'
/* 
    				+'<div style="padding:2px;"><span style="font-weight:bold;">전화번호 </span> : '+tel_no+'</div>'
    				+'<div style="padding:2px;"><span style="font-weight:bold;">주소 </span> : '+ city + street + '('+ addr3 +')</div>'
    				+'<div style="padding:2px;"><span style="font-weight:bold;">대표자 </span> : '+rep_nm+'</div>'
*/	    				
    				,iwRemoveable = true;// removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
/* 
 	// 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });

 	// 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseover', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, marker);
    });

 	// 마커에 마우스아웃 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
    });
 	
 	// 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커 위에 인포윈도우를 표시합니다
        $("#meajang").val(agencyBhfNm);
		//parent.setRentalInf(city, street, agency_nm, addr3, agency_cd, salesGroup, salesOffice, tel_no, pos_cd);
		selectStore('1');
    });
*/
	//마커에 클릭이벤트를 등록합니다.
	if(agencyBhfNm != ""){
	daum.maps.event.addListener(marker, 'click', function()	{
		// 마커 클릭시 해당 매장 정보 확인합니다.
		Login.fnGoToUrl("/bbs/specialDealerSearchList", "getAgencyNm" , agencyNm);
		});
	}
}

$(document).ready(function() {

	//evManager.init();
	/* page background image Start */
	$("#bgFullImg").append("<div class='customer-bg store'></div>");
	
	// footer 띄우기 <footer>
	/* 
position: fixed;
    bottom: 0;
    z-index: 9999;
	 */
	/* page background image End */
	
	$("#fngoSearch").click(function(){
		location.href='/bbs/specialDealerSearchList';
	});
	
});

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

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	if(result.rtnCode == 0) {
		if (callback == 'selectAroundRentalStoreMap') {
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
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDiv");
            	} else {
	            	mapDraw(result.rtnList[0].posYSrc , result.rtnList[0].posXSrc, result.rtnList[0].agencyNm , positions, "mapDivPopup");
            	}
            }
		}
	}
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	if(result.rtnCode != 0) {
		if (callback == 'selectAroundRentalStoreMap') { 
			// selectAroundRentalStoreMap
		}
	}
}

callMap("1");

</script>
    