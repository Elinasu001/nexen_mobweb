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
							<span>다양한 소식을</span> <span>만나보세요.</span>
						</h2>
						<h3 class="title-deco-sub">뉴스</h3>
					</div>
					<!-- header -->
				
					<div class="cart-wrap">
						<!-- TAB -->
						<div class="cart-tab tab-nav js-tab layout-r" id="optionTab">
							<button type="button" id="rent" value="9" data-tab="tab-2" class="current">NEWS</button>
							<button type="button" id="buy"  value="8" data-tab="tab-1">타이어팁</button>
						</div>
						<!-- //TAB -->
						<p id="totalCnt" style="display:none"></p>
						<!-- TAB CONTENTS -->
						<div class="cart-tab-contents">
							<!-- TAB CONTENTS:  -->
							<section id="tab-1" class="tab-content">
							
								<h3 class="hide">타이어팁</h3>
																		
								<div class="news-list inset-m bg">
									<ul id="tireTipList">
									</ul>
								</div>
									
								<div class="mb-m">
									<button class="list-more full-width inset-m border-top" onclick="javascript:newsListMore();">
										<span>더보기</span>
									</button>
								</div>
							</section>
						</div>
						<!-- //TAB CONTENTS: 타이어팁 -->
							
						<div class="cart-tab-contents">    
							<!-- TAB CONTENTS: 서포터즈 소식 -->
							<section id="tab-2" class="tab-content">
								<h3 class="hide">서포터즈 소식</h3>
							
								<div class="news-list inset-m bg" id=tab2>
									<ul id="tireTipList2">
									</ul>
								</div>
											
								<div class="mb-m">
									<button class="list-more full-width inset-m border-top" onclick="javascript:newsListMore2();">
										<span>더보기</span>
									</button>
								</div>
							</section>
							<!-- //TAB CONTENTS: 서포터즈 소식 -->
						</div>
						<!-- //TAB CONTENTS -->
					</div>

					<!--<button type="button" class="btn-primary inset-m full-width"><b>등록</b></button>-->
				</main>
			</div>
			<!-- //subContentsWrap -->
			
<script type="text/javascript">
/* var userLoginId = "${userLoginId}"; */

var typeValue;
var tabValue;


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
				$("#pageSize").val("4");
				$("#classCd").val("P1");
				tabValue = $("#optionTab").find('.current').attr('value');

				//list 조회
				var pUrl = "/news/selectTireTipList";
				var pSendData = {
					searchTypeQna : tabValue,
					pageNo : $("#pageNo").val(),
					pageSize : $("#pageSize").val(),
					classCd : $("#classCd").val()
				};
				cfnSendRequest(pUrl,pSendData,'selectTireTipList');
			}
		}
		,
		selectTireTipList : function (nPage) {
			ComUtil.loading();
			$("#pageNo").val(nPage);
			$("#pageSize").val();
			$("#classCd").val("P1");

			//list 조회
			var pUrl = "/news/selectTireTipList";
			var pSendData = {
				searchTypeQna : typeValue,
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val(),
			};
			cfnSendRequest(pUrl,pSendData,'selectTireTipList');
		}
	}
function goDetailPage(pSeq) {
	location.href = '/news/tireTipDetail?bdojSeq='+String(pSeq);
}
function newsListMore() {
	

	
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
		var pUrl = "/news/selectTireTipList";
		var pSendData = {
			searchTypeQna : $("#buy").val(),
			pageNo : $("#pageNo").val(),
			pageSize : $("#pageSize").val(),
			classCd : $("#classCd").val()
		};
		
		cfnSendRequest(pUrl,pSendData,'selectTireTipList');
	}
}
function newsListMore2() {
	

	
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
		var pUrl = "/news/selectTireTipList";
		var pSendData = {
			searchTypeQna : $("#rent").val(),
			pageNo : $("#pageNo").val(),
			pageSize : $("#pageSize").val(),
			classCd : $("#classCd").val()
		};
		
		cfnSendRequest(pUrl,pSendData,'selectTireTipList');
	}
}
function cfnRequestSuccessCallback(callback, result) {
	console.log("result.rtnCode : " + result.rtnCode);
	console.log("result.rtnMsg : " + result.rtnMsg);



	if(result.rtnCode == 0) {

		if(callback == 'selectTireTipList') {

			ComUtil.unloading();

			var data = result.selectTireTipList;
			var pageCommon = result.pageCommon;

	console.log(data);
			if(data != null && data.length > 0 ) {
				//화면 생성
				var listHtml = "";

				if(data[0].brdDivCd == 8){
					for(var i=0; i<data.length; i++){
	                listHtml += "<li>";
	                listHtml += "	<div class='news-box'>";
	                listHtml += "		<dl onclick='goDetailPage(" + data[i].bdojSeq + ");'>";
	                listHtml += "			<dt>";
	                listHtml += "				<div class='title'>";
	                listHtml += "					<span><img src='../img/news/news_logo.png'  alt=''/> </span>";
	                listHtml += "				</div>";
	                listHtml += "			</dt>";
	                listHtml += "			<dd>";
	                listHtml += "				<p>"+data[i].title+"</p>";
	                listHtml += "			</dd>";
	                listHtml += "		</dl>";
	                listHtml += "	</div>";
	                listHtml += "</li>";
	                
					}
					
					if($("#pageNo").val() == "1") {
						$("#tireTipList").html(listHtml);
					} else {
						$("#tireTipList").append(listHtml);
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
						$(".list-more").attr("style","display:none;")
					} else {
						$(".list-more").attr("style","display:block;")
					}
					
				}
				
				if(data[0].brdDivCd == 9){
					for(var i=0; i<data.length; i++){
						listHtml += "<li'>";
		                listHtml += "	<div class='news-box line' onclick='fnVal("+ i +");'>";
		                listHtml += "	<a class='link-box'></a>";
		                listHtml += "			<dl>";
		                listHtml += "				<dt>";
		                listHtml += "					<div class='title'>";
		                listHtml += "						<span><img src='../img/news/news_logo.png'  alt=''/></span>";
		                listHtml += "					</div>";
		                listHtml += "				</dt>";
		                listHtml += "				<dd>";
		                listHtml += "					<p>"+data[i].title+"</p>";
		                listHtml += "				</dd>";
		                listHtml += "			</dl>";
		                listHtml += "	</div>";
		                listHtml += " <div id=contVal"+i+" style='display:none;'>" + data[i].cont;
		                listHtml += " </div>";
		                listHtml += " <div id=contVal2"+i+" style='display:none;'>" + data[i].title;
		                listHtml += " </div>";
		                listHtml += "</li>";
						}
					
					if($("#pageNo").val() == "1") {
						$("#tireTipList2").html(listHtml);
					} else {
						$("#tireTipList2").append(listHtml);
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
						$(".list-more").attr("style","display:none;")
					} else {
						$(".list-more").attr("style","display:block;")
					}		
				}

				}
			else {
				$("#tireTipList").html("등록된 글이 없습니다.");
				$("#tireTipList2").html("등록된 글이 없습니다.");
			}
		}
	} 
}


/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	
	
	if(callback == 'selectTireTipList'){
		alert(status);
	}
	
	ComUtil.unloading();
}
/* ################################# AJAX CALLBACK ARAR #################################  */

function fnVal(pVal) {

	var cont = $("#contVal"+pVal).text();
	var title = $("#contVal2"+pVal).text();
	
	var content = cont.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	window.open(content,title);
}

$(document).ready(function() {

	/* page background image Start */
	$("#bgFullImg").append("<div class='customer-bg news-list'></div>");
	/* page background image End */
	
	
	evManager.init();

	
	$("#buy").on('click',function(){
		
		$("#pageNo").val("1");
		
		var pUrl = "/news/selectTireTipList";
  
 	 	var pSendData = { 
 	 			searchTypeQna : $("#buy").val(),
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
 				cfnRequestSuccessCallback("selectTireTipList", data);
 				},
 				 error:function(e){
 		           console.log(e);
 		        }
 		});
		
	});
 	 
	$("#rent").on('click' ,function() {
		var pUrl = "/news/selectTireTipList";

		$("#pageNo").val("1");
		
		
 	 	var pSendData = { 
 	 			searchTypeQna : $("#rent").val(),
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
 				cfnRequestSuccessCallback("selectTireTipList", data);
 				},
 				 error:function(e){
 		           console.log(e);
 		        }
 		});
		
		
   });
	
});

</script>			