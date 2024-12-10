<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>


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
              <span>다양한 소식을</span> <span>만나보세요!</span>
            </h2>

            <h3 class="title-deco-sub">공지사항</h3>
          </div>
          <!-- //header -->

          <div class="totalSearch">
            <div class="total">total<span id="totalCnt"></span></div>
            <input type="text" name="searchKeyword" class="type03 trans-bg" id="searchKeyword" title="주문자정보 입력란" value="${boardVO.searchKeyword}" autocomplete="off" maxlength="20" placeholder="제목 + 내용으로 검색합니다.">
            <button type="button" id="search" class="searchBtn">검색</button>
          </div>
            
          <div class="listTypeWrap" id="noticeList">
          </div>

          <div class="mBtnArea">
            <button class="product-list-more full-width inset-m" onclick="javascript:noticeListMore();">
              <span>더보기</span>
            </button>
          </div>
        </main>
      </div>
      <!-- //subContentsWrap -->
      
 	<script type="text/javascript" src="/js/lib/classie.js"></script>
    <script type="text/javascript" src="/js/lib/modalEffects.js"></script>
      
      
<script type="text/javascript">
var evManager = {
		//이전 화면 구분 값 : M : 메인  조회 , H : 헤더
		viewGbn : "${viewGbn}"
		,
		/* loginName : "${userVo.getUsrName()}"
		,
		officerCd : "${userVo.getOfficerCd()}"
		, */
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
				$("#pageSize").val("5");
				$("#classCd").val("P1");

				//list 조회
				var pUrl = "/bbs/selectNoticeList";
				var pSendData = {
					pageNo : $("#pageNo").val(),
					pageSize : $("#pageSize").val(),
					classCd : $("#classCd").val()
				};
				cfnSendRequest(pUrl,pSendData,'selectNoticeList');
			}
		}
		,
		selectNoticeList : function (nPage) {
			ComUtil.loading();
			$("#pageNo").val(nPage);
			$("#pageSize").val();
			$("#classCd").val("P1");

			//list 조회
			var pUrl = "/bbs/selectNoticeList";
			var pSendData = {
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val(),
				searchKeyword : $("#searchKeyword").val()
			};
			cfnSendRequest(pUrl,pSendData,'selectNoticeList');
		}
	}
	
function goDetailPage(pSeq) {
	location.href = '/bbs/noticeDetail?bdojSeq='+String(pSeq);
}	
	
function noticeListMore() {
	var lastPageItemCnt = Number($("#totalCnt").text()) % 5;
	var maxPage = Math.floor(Number($("#totalCnt").text()) / 5);
	
	$("#pageSize").val("5");	//검색을 했을경우엔 #pagesize가 1이기 때문에 다시 5로 바꿔준다.
	
	if(lastPageItemCnt !== 0) {
		maxPage +=1;
	}
	var pageNo = Number($("#pageNo").val());
	var nextPage = String(pageNo + 1);
	
	if(maxPage == pageNo) {
		nextPage = maxPage;
		alert("마지막 페이지 입니다.");
	} else {
		$("#pageNo").val(nextPage);
		$("#pageSize").val();
		$("#classCd").val("P1");

		//list 조회
		var pUrl = "/bbs/selectNoticeList";
		var pSendData = {
			searchKeyword : $("#searchKeyword").val(),
			pageNo : $("#pageNo").val(),
			pageSize : $("#pageSize").val(),
			classCd : $("#classCd").val()
		};
		
		cfnSendRequest(pUrl,pSendData,'selectNoticeList');
	}
}

function cfnRequestSuccessCallback(callback, result) {
	console.log("result.rtnCode : " + result.rtnCode);
	console.log("result.rtnMsg : " + result.rtnMsg);
	
	
	if(result.rtnCode == 0) {
		if(callback == 'selectNoticeList') {
			ComUtil.unloading();

			var data = result.selectNoticeList;
			var pageCommon = result.pageCommon;
			
			if(data != null && data.length > 0 ) {
				//화면 생성
				var listHtml = "";

				for(var i=0; i<data.length; i++){
	                listHtml += "<div class='listType' onclick='goDetailPage(" + data[i].bdojSeq + ");'>";
	                listHtml += "	<dl>";
	                listHtml += "		<dt>";
	                listHtml += "			<dd class='f_ell w100per'>"+data[i].title+"</dd>";
	                listHtml += "			<span class='dateView'>"+data[i].writYmd+"</span>";	
	                listHtml += "		</dt>";
	                listHtml += "	</dl>";
	                listHtml += "</div>";
	                
				}
				if($("#pageSize").val() == "1") {
					$("#noticeList").html(listHtml);
				} else {
					$("#noticeList").append(listHtml);
				}
				
				//전체 조회 데이터 개수
				$("#totalCnt").html(pageCommon.totalCount);

				//더보기 버튼 안보이도록 MEPARK
				var lastPageItemCnt = Number($("#totalCnt").text()) % 5;
				var maxPage = Math.floor(Number($("#totalCnt").text()) / 5);
				
				if(lastPageItemCnt !== 0) {
					maxPage +=1;
				}
				var pageNo = Number($("#pageNo").val());
				
				if(pageNo == maxPage) {
					$(".product-list-more").attr("style","display:none;")
				} else {
					$(".product-list-more").attr("style","display:block;")
				}
				
			} else {
				$("#totalCnt").html(pageCommon.totalCount);
				$("#noticeList").html("<div class='listType'><dl><dt><dd class='f_ell w100per' >검색 결과가 없습니다</dd></td></dt></dl></div>");
			}
		}
	} 
	
}


/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	
	if(callback == 'selectNoticeList'){
		alert(status);
	}
	
	ComUtil.unloading();
}
/* ################################# AJAX CALLBACK ARAR #################################  */



$(document).ready(function() {

	/* page background image Start */
	$("#bgFullImg").append("<div class='customer-bg notice-list'></div>");
	/* page background image End */
	
	evManager.init();
	
	//enter 입력시 작동
 	$("#searchKeyword").keyup(function(e){
 		if(e.keyCode == 13){
 			
 			$("#pageSize").val("1");  //cfnRequestSuccessCallback 함수에서 #pagesize가 1이면 목록을 새로뽑고 , 1이 아니면 붙이기 때문
 			$("#pageNo").val("1");

 	 		var pUrl = "/bbs/selectNoticeList";

 	 		var pSendData = {
 	 				searchKeyword : $("#searchKeyword").val(),
 	 				pageNo : "1",
 					pageSize : "5",
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
 	 				cfnRequestSuccessCallback("selectNoticeList", data);
 	 				},
 	 				 error:function(e){
 	 		           console.log(e);
 	 		        }
 	 		});

 			
 		}
 			
 			
 			 });

 	
 	$("#search").on("click",  function() {

 	
 		$("#pageSize").val("1");	//cfnRequestSuccessCallback 함수에서 #pagesize가 1이면 목록을 새로뽑고 , 1이 아니면 붙이기 때문
 		$("#pageNo").val("1");
 		var pUrl = "/bbs/selectNoticeList";

 		var pSendData = { 
 				searchKeyword : $("#searchKeyword").val(),
 				pageNo : "1",
				pageSize : "5",
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
 				cfnRequestSuccessCallback("selectNoticeList", data);
 				},
 				 error:function(e){
 		           console.log(e);
 		        }
 		});

 		
	}); 
	
});


</script>