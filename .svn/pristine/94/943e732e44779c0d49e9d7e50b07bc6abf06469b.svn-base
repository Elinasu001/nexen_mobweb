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
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header empty">
            	<h2 class="title-deco">
              		<span>궁금증을</span> <span>해결하세요.</span>
            	</h2>
            	<h3 class="title-deco-sub">1:1문의</h3>
          	</div>
          	<!-- //header -->

          	<div>
            	<a href="/bbs/qnaList" class="page-link full-width">
              		<span>문의 전에 <u>‘자주 묻는 질문’</u> 리스트에서 궁금하신 사항을 확인하시면, 쉽고 빠르게 궁금증을 해결하실 수 있습니다.</span>
            	</a>
          	</div>
          	<div class="btn-wrap layout-r same-size">
	            <button type="button" class="inset-m full-width" id="qRegisterBtn">
	            	<img src="/img/customer/m_kakaoChat_btn.png" alt="1:1문의">
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
		loginName : "${userVo.getUsrName()}"
		,
		officerCd : "${userVo.getOfficerCd()}"
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
				$("#pageSize").val("5");
				$("#classCd").val("P1");

				//list 조회
				var pUrl = "/mypage/selectQuestionList";
				var pSendData = {
					pageNo : $("#pageNo").val(),
					pageSize : $("#pageSize").val(),
					classCd : $("#classCd").val()
				};
				cfnSendRequest(pUrl,pSendData,'selectQuestionList');
			}
		}
		,
		selectQuestionList : function (nPage) {
			ComUtil.loading();
			$("#pageNo").val(nPage);
			$("#pageSize").val();
			$("#classCd").val("P1");

			//list 조회
			var pUrl = "/mypage/selectQuestionList";
			var pSendData = {
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val()
			};
			cfnSendRequest(pUrl,pSendData,'selectQuestionList');
		}
	}


	/* ################################# AJAX CALLBACK ARAR #################################  */
	/*
	 * 리퀘스트 후처리 함수 - SUCCESS
	 */
	function cfnRequestSuccessCallback(callback, result) {
		console.log("result.rtnCode : " + result.rtnCode);
		console.log("result.rtnMsg : " + result.rtnMsg);
		
		if(result.rtnCode == 0) {
			if(callback == 'selectQuestionList') {
				ComUtil.unloading();

				var data = result.selectQuestionList;
				var pageCommon = result.pageCommon;
				if(data != null && data.length > 0 ) {
					//화면 생성
					var listHtml = "";
		            
					for(var i=0; i<data.length; i++){
		                listHtml += "<li>";
		                listHtml += "	<a class='question-link' onclick='goDetailPage(" + data[i].bdojSeq + ");'></a>";
		                listHtml += "	<div class='list-info-top'>";
		                listHtml += "		<span class='state' name='seq' style='display:none;'>" + data[i].bdojSeq + "</span>";
		                listHtml += "		<span class='state'>" + data[i].qustClsCdNm + "</span>";
		                listHtml += "		<span class='date'>" + data[i].writYmd + "</span>";
		                listHtml += "	</div>";
		                listHtml += "	<div class='list-info-bottom'>";
		                listHtml += "		<p>" + data[i].title + "</p>";
		                listHtml += "		<span>" + data[i].replyYn + "</span>";
		                listHtml += "	</div>";
		                listHtml += "</li>";
					}
					if($("#pageSize").val() == "1") {
						$("#questionList").html(listHtml);
					} else {
						$("#questionList").append(listHtml);
					}

					//전체 조회 데이터 개수
					$("#totalCnt").html(pageCommon.totalCount);

					//paging
					//PageUtil.fnPageMakeDisplay(pageCommon.totalCount, pageCommon.pageNo, $('#paging') , 'evManager.selectQuestionList', pageCommon.pageSize);
					
					//더보기 버튼 안보이도록 MEPARK
					var lastPageItemCnt = Number($("#totalCnt").text()) % 5;
					var maxPage = Math.floor(Number($("#totalCnt").text()) / 5);
					
					if(lastPageItemCnt !== 0) {
						maxPage +=1;
					}
					var pageNo = Number($("#pageNo").val());
					
					if(pageNo == maxPage) {
						$(".list-more").attr("style","display:none;")
					} else {
						$(".list-more").attr("style","display:block;")
					}
				} else {
					$("#questionList").html("<li><div class='list-info-top'></div><div class='list-info-bottom'><p>등록된 질문이 없습니다.</p></div></li>");
				}
			}
		} else {
			if(callback == 'selectQuestionList') {
				location.href = '/main';
			}
		}
	}
	
	/*
	 * 리퀘스트 후처리 함수 - ERROR
	 */
	function cfnRequestErrorCallback(callback, status) {
		
		if(callback == 'selectQuestionList'){
			alert(status);
		}
		
		//ComUtil.unloading();
	}
	/* ################################# AJAX CALLBACK ARAR #################################  */

	function goDetailPage(pSeq) {
		location.href = '/mypage/questionDetail?bdojSeq='+String(pSeq);
	}
	
	function questionListMore() {
		var lastPageItemCnt = Number($("#totalCnt").text()) % 5;
		var maxPage = Math.floor(Number($("#totalCnt").text()) / 5);
		
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
			var pUrl = "/mypage/selectQuestionList";
			var pSendData = {
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val()
			};
			
			cfnSendRequest(pUrl,pSendData,'selectQuestionList');
		}
	}

	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg question-list'></div>");
		/* page background image End */
		
		//init 함수 호출
		//evManager.init(); 카카오톡 1:1채팅 대체로 인한 로그인 및 게시판 사용 안함.
		
		$("#qRegisterBtn").on("click", function() {
			window.open("http://pf.kakao.com/_GLznj/chat");
		});

	});
</script>

