<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<link type="text/css" rel="stylesheet" href="/css/OverlayScrollbars.css">
<script type="text/javascript" src="/js/lib/jquery.overlayScrollbars.js"></script>
<script type="text/javascript" src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/lib/classie.js"></script>
<script type="text/javascript" src="/js/lib/modalEffects.js"></script>	
	
	<form id="frm" name="frm" method="post" >
		<!-- paging -->
		<input type="hidden" name="pageNo"	id="pageNo"	value="${pageNo}"/>		<!-- 현재 페이지 -->
		<input type="hidden" name="pageSize"	id="pageSize" 	value="" />		<!-- 페이지에 표시할 수 -->
	</form>
	
<!-- subContentsWrap -->
      <div class="subContentsWrap">   
        <main>
          <!-- header -->
          <div class="page-header empty">
            <h2 class="title-deco">
              <span>다양한 이벤트를</span> <span>만나보세요.</span>
            </h2>

            <h3 class="title-deco-sub">이벤트</h3>
          </div>
          <!-- header -->
        
          <div class="cart-wrap">
            <!-- TAB -->
            <div class="cart-tab tab-nav js-tab layout-r">
              <button type="button" id="11" data-tab="tab-1" class="current">이벤트</button>
              <button type="button" id="22" data-tab="tab-2">당첨자 발표</button>
            </div>
            <!-- //TAB -->
    
            <!-- TAB CONTENTS -->
            <div class="cart-tab-contents">
              <!-- TAB CONTENTS:  -->
              <section id="tab-1" class="tab-content">
                <h3 class="hide">이벤트</h3>
        
                <div class="event-list inset-m bg">
                  <ul id="EvtList">
                    
                  </ul>
                </div>
                      
                <div class="mb-m">
                  <button class="list-more full-width inset-m border-top" id="moreInfo11" onclick="javascript:evtListMore();">
                    <span>더보기</span>
                  </button>
                </div>
              </section>
            </div>
            <!-- //TAB CONTENTS: 이벤트 -->
              
            <div class="cart-tab-contents">    
              <!-- TAB CONTENTS: 당첨자발표 -->
              <section id="tab-2" class="tab-content">
                <h3 class="hide">당첨자발표</h3>

                <div class="totalSearch">
                  <div class="total">total<span id="CongTotalCnt"></span></div>
                </div>
                
                <div class="listTypeWrap" id="EvtList2">
                 
                </div>
                                  
                <div class="mb-m">
                  <button class="list-more full-width inset-m border-top" id="moreInfo22" onclick="javascript:evtWinListMore();">
                    <span>더보기</span>
                  </button>
                </div>
              </section>
              <!-- //TAB CONTENTS: 당첨자발표 -->
            </div>
            <!-- //TAB CONTENTS -->
          </div>

        </main>
      </div>
      <!-- //subContentsWrap -->
		
<script type="text/javascript">
/* var userLoginId = "${userLoginId}"; */

var typeValue;
var tabNo = 11;
var evtTotalCnt = 0;
var moreInfo = 0;
var lastPageItemCnt;
var maxPage;
var nextPage="0";

var evManager = {
		//이전 화면 구분 값 : M : 메인  조회 , H : 헤더
		viewGbn : "${viewGbn}"
		,
		//조회 여부
		searchYn : false
		,
		//필터 선택 수
		filterCnt : 0
		,
		//lifeStyle
		lifeStyleArray : new Array()
		,
		lifeStyleNmArray : new Array()
		,
		//검색 여부
		searchYn : false
		,
		niceGradeCd : new Array()
		,
		init : function(){
			//page
			$("#pageNo").val("1");
			//메인에서 검색 조회 시만 보여 주는 검색  영역
			if(evManager.viewGbn == "M") {
				
			} else {
				ComUtil.loading();
				$("#pageNo").val("1");
				$("#pageSize").val("9");
				$("#classCd").val("P1");

				//list 조회
				var pUrl = "/evt/selectEvtList";
				var pSendData = {
					pageNo : $("#pageNo").val(),
					pageSize : $("#pageSize").val(),
					classCd : $("#classCd").val()
				};
				cfnSendRequest(pUrl,pSendData,'selectEvtList');
			}
		}
		,
		selectEvtList : function (nPage) {
			ComUtil.loading();
			$("#pageNo").val(nPage);
			$("#pageSize").val();
			$("#classCd").val("P1");

			//list 조회
			var pUrl = "/evt/selectEvtList";
			var pSendData = {
				searchTypeQna : typeValue,
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val(),
			};
			cfnSendRequest(pUrl,pSendData,'selectEvtList');
		}
	}
function goDetailPage(pSeq,tabNo) {
	
	location.href = '/evt/evtDetail?bdojSeq='+String(pSeq)+'&tabNo='+String(tabNo);
}

/* 현재 날짜 포맷  */
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '.' + month + '.' + day;
}

function cfnRequestSuccessCallback(callback, result) {
	console.log("result.rtnCode : " + result.rtnCode);
	console.log("result.rtnMsg : " + result.rtnMsg);
	
	//alert("구분구분");
	if(result.rtnCode == 0) {

		if(callback == 'selectEvtList') {

			ComUtil.unloading();

			var data = result.selectEvtList;
			var pageCommon = result.pageCommon;

	
			if(data != null && data.length > 0 ) {
				//화면 생성
					var congCnt = 0;
				
					var today = new Date();
					today = getFormatDate(today);
					var listHtml;
					console.log("::::selectEvtList::::");
					console.log(data);
					for(var i=0; i<data.length; i++){
							tabNo = 11;			
								listHtml = "";
								listHtml += "<li>"
								if(data[i].event_end_dy < today){							
									listHtml += "<div class='event-box end'>";
									listHtml += "<div class='result-data-type'>";
									listHtml += "<div class='sell-type-end'>종료</div>";
									listHtml += "</div>";
				                }
								if(data[i].event_end_dy >= today){
									listHtml += "<div class='event-box'>";
									listHtml += "	<a onclick='goDetailPage(" + data[i].bdojSeq + ","+tabNo+");' class='link-box'></a>";
				                }
				                listHtml += "	<div class='bannerWrap'>";
				               
				                console.log("tabNo :: " + tabNo);
				                listHtml += "		<div class='bannerView'>";
				                console.log("data[i].atflPathnm :: "+data[i].atflPathNm);
				                if(data[i].atflPathNm == null){
				                	listHtml += "		<img src='../img/event/img_null_02.jpg' alt=''> ";
				                }
				                else{
				                	listHtml += "		<img src='<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile_cms/"+data[i].atflPathNm+"' alt=''/>";
				                }
				                listHtml += "		</div>";
				                listHtml += "		<div class='bannerCon'>";
				                listHtml += "			<p>"+data[i].title+"</p>";
				                listHtml += "			<p>"+data[i].event_str_dy+"~"+data[i].event_end_dy+"</p>";
				                listHtml += "		</div>";
				                
				                listHtml += "	</div>";
				                listHtml += "</div>"
				                listHtml += "</li>"
				              $("#EvtList").append(listHtml);
				                evtTotalCnt = pageCommon.totalCount;
				                
						if(data[i].win_annou_yn == "Y"){
							congCnt++;
							tabNo = 22;
							var listHtml = "";
								listHtml += "<div class='listType'>"
				                listHtml += "	<a onclick='goDetailPage(" + data[i].bdojSeq +","+tabNo+");' class='link-box'></a>";
				                listHtml += "	<dl>";
				                listHtml += "		<dt>";
				                listHtml += "			<span class='state'>당첨자 발표</span>";
				                listHtml += "			<span class='dateView'>"+data[i].writYmd+"</span>";
				                listHtml += "		</dt>";
				                listHtml += "		<dd class='f_ell full-width'>"+data[i].title+"</dd>";
				                listHtml += "	</dl>";
				                listHtml += "<div>";
				                
				                $("#EvtList2").append(listHtml);
						}
						
						$("#CongTotalCnt").text(congCnt);
					}

			} else {
				var listHtml = "";
				
				listHtml += "<tr class='noData'>";
				listHtml += "	<td class='tCenter' colspan='4'>";
				listHtml += "		<div class='noDataArea type03'><p>등록된 이벤트가 없습니다.</p></div>";
				listHtml += "	</td>";
				listHtml += "</tr>";
				
				
				$("#EvtList2").html(listHtml);
				
				listHtml = "";
				listHtml += "<tbody>";
				listHtml += "<tr class='noData'>";
				listHtml += "	<td class='tCenter' colspan='4'>";
				listHtml += "		<div class='noDataArea type03'><p>등록된 이벤트가 없습니다.</p></div>";
				listHtml += "	</td>";
				listHtml += "</tr>";
				listHtml += "</tbody>";
				$("#EvtList").html(listHtml);
			}
		}
	} 
	
}


/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	
	
	if(callback == 'selectEvtList'){
		alert(status);
	}
	
	ComUtil.unloading();
}
/* ################################# AJAX CALLBACK ARAR #################################  */

function fnVal(pVal) {

	var cont = $("#contVal"+pVal).text();
	var title = $("#contVal2"+pVal).text();

	
	var content = cont.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	window.open(content,title,'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes' );
}

/* 더보기 */
function evtListMore() {
	
	lastPageItemCnt = Number(evtTotalCnt) % 5;
	maxPage = Math.floor(Number(evtTotalCnt) / 5);
	moreInfo += 5;		//더보기 했을경우 나오는 데이터 인덱스값+
	console.log(typeValue);
	$("#pageSize").val("5");	//검색을 했을경우엔 #pagesize가 1이기 때문에 다시 5로 바꿔준다.
	
	if(lastPageItemCnt !== 0) {
		maxPage +=1;
	}
	var pageNo = Number($("#pageNo").val());
	console.log(Number($("#pageNo").val()));
	nextPage = String(pageNo + 1);
	
	if(maxPage == pageNo) {
		nextPage = maxPage;
		$("#moreInfo11").attr("style","display:none;");
		alert("마지막 페이지 입니다.");
		$("#pageNo").val("1");
		
	}else if(maxPage < pageNo){
		$("#moreInfo11").attr("style","display:none;");
		
	} 
	
	else {
		$("#pageNo").val(nextPage);
		$("#pageSize").val();
		$("#classCd").val("P1");

		//list 조회
		var pUrl = "/evt/selectEvtList";
		var pSendData = {
			
			pageNo : $("#pageNo").val(),
			pageSize : $("#pageSize").val(),
			classCd : $("#classCd").val()
		};
		
		cfnSendRequest(pUrl,pSendData,'selectEvtList');
	}
	
}

/* 더보기 */
function evtWinListMore() {
	
	lastPageItemCnt = Number($("#CongTotalCnt").html()) % 5;
	maxPage = Math.floor(Number($("#CongTotalCnt").html()) / 5);
	moreInfo += 5;		//더보기 했을경우 나오는 데이터 인덱스값+
	
	$("#pageSize").val("5");	//검색을 했을경우엔 #pagesize가 1이기 때문에 다시 5로 바꿔준다.
	
	if(lastPageItemCnt !== 0) {
		maxPage +=1;
	}
	var pageNo = Number($("#pageNo").val());
	console.log(Number($("#pageNo").val()));
	nextPage = String(pageNo + 1);
	
	if(maxPage == pageNo) {
		nextPage = maxPage;
		$("#moreInfo22").attr("style","display:none;");
		alert("마지막 페이지 입니다.");
		$("#pageNo").val("1");
		
	}else if(maxPage < pageNo){
		$("#moreInfo22").attr("style","display:none;");
		
	} 
	
	else {
		$("#pageNo").val(nextPage);
		$("#pageSize").val();
		$("#classCd").val("P1");

		//list 조회
		var pUrl = "/evt/selectEvtList";
		var pSendData = {
			
			pageNo : $("#pageNo").val(),
			pageSize : $("#pageSize").val(),
			classCd : $("#classCd").val()
		};
		
		cfnSendRequest(pUrl,pSendData,'selectEvtList');
	}
	
}

$(document).ready(function() {

	$("#bgFullImg").append("<div class='customer-bg event-bg'></div>");
	evManager.init();

	
	
	$("#optionTab").on('click',"li" ,function() {
		var pUrl = "/evt/selectEvtList";
		
		typeValue = $(this).val();
	  
 	 	var pSendData = { 
 	 			searchTypeQna : typeValue,
 				pageNo : "1",
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val()
 		};
		pSendData = JSON.stringify(pSendData);
		
		$.ajax({ 
 			type: "POST" ,
 			url: pUrl,
 			cache:false,
 			data: pSendData,
 			 contentType:"application/json;charset=UTF-8",
 			success : function(data) {
 				//success
 				cfnRequestSuccessCallback("selectEvtList", data);
 				},
 				 error:function(e){
 		           console.log(e);
 		        }
 		});
   });
	
});


</script>