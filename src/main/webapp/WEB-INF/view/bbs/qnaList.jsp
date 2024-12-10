<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>


		<form id="frm" name="frm" method="post">
			<!-- paging -->
			<input type="hidden" name="pageNo"	id="pageNo"	value="${pageNo}"/>		<!-- 현재 페이지 -->
			<input type="hidden" name="pageSize"	id="pageSize" 	value="" />		<!-- 페이지에 표시할 수 -->			
		</form>

		<!--subContentsWrap-->
        <div class="subContentsWrap">
			<!-- header -->
          	<div class="page-header empty">
            	<h2 class="title-deco">
              		<span>궁금증을</span> <span>해결하세요.</span>
            	</h2>
            	<h3 class="title-deco-sub">자주 묻는 질문</h3>
          	</div>
       		<!-- header --> 
       		<!-- searchKeyword -->
			<div class="question-wrap">
            	<div class="search-area">
              		<div class="conWrap layout-r mb-s">
              			<input type="text" name="searchKeyword" class="type03 trans-bg" id="searchKeyword" title="제목 + 내용" placeholder="제목 + 내용으로 검색합니다." maxLength="20"  >
                		<button type="button" class="align-middle btn-address-search" id="searchBtnQna">검색</button>
              		</div>
              	</div>
              	<!-- tab-wrap -->
            <div class="tabsWrap">
            	<div class="tab-header">
            		<!-- TAB -->
            		<div class="question-tab tab-nav js-tab" id="optionTab" >
                		<button type="button" id="question00" data-tab="tab-0" class="optionTab current" value="0">전체</button>
                  		<button type="button" id="question01" data-tab="tab-1" class="optionTab" value="1">주문 및 결제</button>
                  		<button type="button" id="question02" data-tab="tab-2" class="optionTab" value="2">상품문의 및 장착</button>
                  		<button type="button" id="question03" data-tab="tab-3" class="optionTab" value="3">배송/반품/교환/AS</button>
                  		<button type="button" id="question04" data-tab="tab-4" class="optionTab" value="4">회원가입 및 탈퇴</button>             
                	</div>
                	<!-- TAB -->
                </div>
                
                <!-- TAB CONTENTS -->
                
                
                <!-- TAB CONTENTS -->
                <!-- 전체 질문-->
              	<div class="cart-tab-contents">                          
                	<section id="tab-0" class="tab-content">
                  		<h3 class="hide">전체 질문</h3>
                  		<div class="accordion-info">
                    		<div class="question-view">
                    			<div class="count-box utility">
                        			<div class="utility-result-total inline" id="tab">
                          				<span>total</span>
                          				<span class="totalCnt" id="totalCnt0"></span>
                        			</div>
                      			</div>
                      			
                      			<div class="review-group js-reviewGroup">
                      				<div id="qnaList0"></div>
                      			</div>
                    		
                    		</div>
                    	</div>
                   </section>                  
                </div>
                <!-- 전체 질문-->
               
                <!-- 주문 및 결제 질문-->
              	<div class="cart-tab-contents">                          
                	<section id="tab-1" class="tab-content">
                  		<h3 class="hide">주문 및 결제 질문</h3>
                  		<div class="accordion-info">
                    		<div class="question-view">
                    			<div class="count-box utility">
                        			<div class="utility-result-total inline" id="tab">
                          				<span>total</span>
                          				<span class="totalCnt" id="totalCnt1"></span>
                        			</div>
                      			</div>
                      			
                      			<div class="review-group js-reviewGroup">
                      				<div id="qnaList1"></div>
                      			</div>
                    		
                    		</div>
                    	</div>
                   </section>                  
                </div>
                <!-- //주문 및 결제 질문 -->
                
                <!-- 상품문의 및 장착 질문-->
              	<div class="cart-tab-contents">                          
                	<section id="tab-2" class="tab-content">
                  		<h3 class="hide">상품문의 및 장착 질문</h3>
                  		<div class="accordion-info">
                    		<div class="question-view">
                    			<div class="count-box utility">
                        			<div class="utility-result-total inline" id="tab">
                          				<span>total</span>
                          				<span class="totalCnt" id="totalCnt2"></span>
                        			</div>
                      			</div>
                      			
                      			<div class="review-group js-reviewGroup">
                      				<div id="qnaList2"></div>
                      			</div>
                    		
                    		</div>
                    	</div>
                   </section>                  
                </div>
                <!-- //상품문의 및 장착 질문 -->
                
                <!-- 배송/반품/교환/AS 질문 -->
              	<div class="cart-tab-contents">                          
                	<section id="tab-3" class="tab-content">
                  		<h3 class="hide">배송/반품/교환/AS 질문</h3>
                  		<div class="accordion-info">
                    		<div class="question-view">
                    			<div class="count-box utility">
                        			<div class="utility-result-total inline" id="tab">
                          				<span>total</span>
                          				<span class="totalCnt" id="totalCnt3"></span>
                        			</div>
                      			</div>
                      			
                      			<div class="review-group js-reviewGroup">
                      				<div id="qnaList3"></div>
                      			</div>
                    		
                    		</div>
                    	</div>
                   </section>                  
                </div>
                <!-- //배송/반품/교환/AS 질문 -->
                
                <!-- 회원가입 및 탈퇴 질문-->
              	<div class="cart-tab-contents">                          
                	<section id="tab-4" class="tab-content">
                  		<h3 class="hide">회원가입 및 탈퇴 질문</h3>
                  		<div class="accordion-info">
                    		<div class="question-view">
                    			<div class="count-box utility">
                        			<div class="utility-result-total inline" id="tab">
                          				<span>total</span>
                          				<span class="totalCnt" id="totalCnt4"></span>
                        			</div>
                      			</div>
                      			
                      			<div class="review-group js-reviewGroup">
                      				<div id="qnaList4"></div>
                      			</div>
                    		
                    		</div>
                    	</div>
                   </section>                  
                </div>
                <!-- //회원가입 및 탈퇴 질문 -->
               
            </div>
            <!-- tab-wrap-->
            </div>
            <!-- searchKeyword -->
            
            
            <div class="mBtnArea">
            <button class="product-list-more full-width inset-m" onclick="javascript:qnaListMore();">
              <span>더보기</span>
            </button>
            </div>
          <!-- //subContentsWrap -->
          </div>
       
            
                      
		
<script type="text/javascript">
var userLoginId = "${userLoginId}";
var tab = 0;
var typeValue;
/* 각 컨텐츠 값 */
var moreInfo = 0;
var lastPageItemCnt;
var maxPage;
var nextPage="0";
var searchCk = 0;
var exTypeValue;
//클릭 유무확인
var checkCk = 0;
var keyword = $("#searchKeyword").val();

	var evManager = {
		//이전 화면 구분 값 : M : 메인  조회 , H : 헤더
		viewGbn : "${viewGbn}"
		,
		loginName : "${userVo.getUsrName()}"
		,
		officerCd : "${userVo.getOfficerCd()}"
		,
		tabType : "${qnaListVo.getQustClsCd()}"
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
			$("#pageNo").val("1");	//pageNo 초기화
			typeValue = "0";
			lastPageItemCnt = Number($("#totalCnt"+parseInt(typeValue)).html()) % 5;
			maxPage = Math.floor(Number($("#totalCnt"+parseInt(typeValue)).html()) / 5);
			//메인에서 검색 조회 시만 보여 주는 검색  영역
			if(evManager.viewGbn == "M") {
				
			} else {
				ComUtil.loading();
				$("#pageNo").val("1");
				$("#pageSize").val("5");
				$("#classCd").val("P1");

				//list 조회
				var pUrl = "/bbs/selectQnaList";
				var pSendData = {
					searchTypeQna : typeValue,
					pageNo : $("#pageNo").val(),
					pageSize : $("#pageSize").val(),
					classCd : $("#classCd").val()
				};
				cfnSendRequest(pUrl,pSendData,'selectQnaList');
			}
		}
		,
		selectQnaList : function (nPage) {
			ComUtil.loading();
			$("#pageNo").val(nPage);
			$("#pageSize").val();
			$("#classCd").val("P1");

			
			//list 조회
			var pUrl = "/bbs/selectQnaList";
			var pSendData = {
				searchKeyword : keyword,
				searchTypeQna : typeValue,
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val()
			};
			cfnSendRequest(pUrl,pSendData,'selectQnaList');
		}
	}

	
	

	/* ################################# AJAX CALLBACK ARAR #################################  */
	/*
	 * 리퀘스트 후처리 함수 - SUCCESS
	 */
	 
	 
	function cfnRequestSuccessCallback(callback, result) {
		
		var typeId = typeValue+typeValue + moreInfo;
		
		if(result.rtnCode == 0) {
			if(callback == 'selectQnaList') {
				ComUtil.unloading();
				
				var data = result.selectQnaList;
				var pageCommon = result.pageCommon;
				if(data != null && data.length > 0 ) {
					//화면 생성
					var listHtml = "";
					for(var i=0; i<data.length; i++){
						
						var idx = parseInt(typeId+i);
						
						listHtml += "<div class='review-single' id='review-single"+idx+"' onclick='fnReviewGroup("+idx+")'>";
						listHtml += "	<div class='review-summary layout-r' id='review-summary'>";
						listHtml += "		<div class='result-data-type layout-r inline-xs mr-m'>";
						listHtml += "			<div class='qu-type-q'></div>";
						listHtml += "		</div>";
						listHtml += "		<div class='question-info mr-l'>";
						listHtml += "			<p class='question-title'>"+data[i].qustClsCdNm+"</p>"			
		                listHtml += "			<p class='question-info'>"+data[i].title+"</p>";
		                listHtml += "		</div>";
		                listHtml += "	</div>"	
		                listHtml += " 	<div class='review-box layout-r' id='review-box"+idx+"' ' style='display:none'>";
		                listHtml += "		<div class='result-data-type'>";        
		                listHtml += "			<div class='qu-type-a'></div>";
		                listHtml += "		</div>";
                        listHtml += "		<div class='review-text'>"+data[i].cont+"</div>";                   
                        listHtml += "  	</div>";                
                    	listHtml += "</div>";
                    	
					}
					if($("#pageNo").val() == "1") {
						if(typeValue == "1" && checkCk != 1) {
							
							$("#qnaList"+parseInt(typeValue)).html(listHtml);
						} else if(typeValue == "2"&& checkCk != 1){
							$("#qnaList"+parseInt(typeValue)).html(listHtml);
						} else if(typeValue == "3"&& checkCk != 1){
							$("#qnaList"+parseInt(typeValue)).html(listHtml);
						} else if(typeValue == "4"&& checkCk != 1){
							$("#qnaList"+parseInt(typeValue)).html(listHtml);
						} else if(typeValue == "0" && checkCk != 1){
							$("#qnaList"+typeValue).html(listHtml);
						}
						/* 검색시 */
						else if(checkCk == 1){
							$("#qnaList0").html(listHtml);
						}
						
					} 
					else if($("#pageNo").val() == "-1"){
						console.log("fin");
					}
					
					else{
						if(typeValue == "1"&& checkCk != 1) {
							$("#qnaList"+parseInt(typeValue)).append(listHtml);
						} else if(typeValue == "2"&& checkCk != 1){
							$("#qnaList"+parseInt(typeValue)).append(listHtml);
						} else if(typeValue == "3"&& checkCk != 1){
							$("#qnaList"+parseInt(typeValue)).append(listHtml);
						} else if(typeValue == "4"&& checkCk != 1){
							$("#qnaList"+parseInt(typeValue)).append(listHtml);
						} else if(typeValue == "0"&& checkCk != 1) {
							$("#qnaList"+parseInt(typeValue)).append(listHtml);
						} else if(checkCk == 1){
							$("#qnaList0").append(listHtml);
						}
					}
						
					
					//전체 조회 데이터 개수
					$("#totalCnt"+parseInt(typeValue)).html(pageCommon.totalCount);
					//검색시 데이터개수 조회
					if(keyword != null){
						$("#totalCnt0").html(pageCommon.totalCount);
					}
					
				} 
				
				else {
					    	
					if(searchCk == 0){
						$("#qnaList" + typeValue).html("등록된 질문이 없습니다.");
					}else{
						$("#qnaList"+ typeValue).html("검색결과가 없습니다.");
					}	
				}
			}
		} 
		
	}
	
	/* 더보기 */
	function qnaListMore() {
		if(checkCk != 1){
			keyword = null;
		}
		if(keyword != null){
			typeValue = "0";
		}
		
		lastPageItemCnt = Number($("#totalCnt"+parseInt(typeValue)).html()) % 5;
		maxPage = Math.floor(Number($("#totalCnt"+parseInt(typeValue)).html()) / 5);
		moreInfo += 5;		//더보기 했을경우 나오는 데이터 인덱스값+
		$("#pageSize").val("5");	//검색을 했을경우엔 #pagesize가 1이기 때문에 다시 5로 바꿔준다.
		
		if(lastPageItemCnt !== 0) {
			maxPage +=1;
		}
		var pageNo = Number($("#pageNo").val());
		nextPage = String(pageNo + 1);
		
		if(maxPage == pageNo) {
			nextPage = maxPage;
			alert("마지막 페이지 입니다.");
			/* 더보기탭 비활성화 */
			$("#pageNo").val("-1");
			
		}else if(maxPage < pageNo){
			alert("마지막 페이지 입니다.");
		} else if(pageNo == "-1"){
			alert("마지막 페이지 입니다.");
		}
		
		
		
		else {
			$("#pageNo").val(nextPage);
			$("#pageSize").val();
			$("#classCd").val("P1");
			
			//list 조회
			var pUrl = "/bbs/selectQnaList";
			var pSendData = {
				searchTypeQna : typeValue,
				searchKeyword : keyword,
				pageNo : $("#pageNo").val(),
				pageSize : $("#pageSize").val(),
				classCd : $("#classCd").val()
			};
			exTypeValue = typeValue;
			cfnSendRequest(pUrl,pSendData,'selectQnaList');
		}
		
	}
	
	/* 토글 */
	function fnReviewGroup(pId) {
	    if($('#review-single' + pId).attr('class') == 'review-single open') {
	      $('#review-single' + pId).removeClass('open');
 	        $('#review-box' + pId).slideUp('100');

	    } else {
 	      $("#review-single" + pId).addClass('open');
 	        $('#review-box' + pId).slideDown('100');
	    }
	    console.log("fin");
	  }
	
	
	
	/*
	 * 리퀘스트 후처리 함수 - ERROR
	 */
	function cfnRequestErrorCallback(callback, status) {
		
		if(callback == 'selectQnaList'){
			alert(status);
		}
		
		ComUtil.unloading();
	}
	/* ################################# AJAX CALLBACK ARAR #################################  */

	


$(document).ready(function() {
	
	$("#bgFullImg").append("<div class='customer-bg question'></div>");
	
	evManager.init();
	
	
	$(".optionTab").click( function(){
	$("#pageNo").val("1");	//pageNo 초기화
	checkCk = 0;
			nextPage = "0";
			typeValue = $(this).val();
			
			var pUrl = "/bbs/selectQnaList";
			moreInfo = 0;
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
	 				 $("#searchKeyword").val("");
	 				cfnRequestSuccessCallback("selectQnaList", data);
 				},
 				 error:function(e){
 		           console.log(e);
 		        },
 		       complete : function(){
	 		        $("#searchKeyword").val("");
	 		       	checkCk = 0;
	 		    }
			});
	});
	

	/* 제목+내용 아이콘 클릭 검색*/
	  $("#searchBtnQna").click( function() {
		  searchCk = 1;
		  checkCk = 1;
		  $("#pageNo").val("1");  //pageNo 초기화
			var pUrl = "/bbs/selectQnaList";
			
		  	/* 검색시 컨텐츠 보여주는 class 활성화 */
		  	$("#tab-"+typeValue).removeAttr("class");
		  	$("#tab-"+typeValue).attr("class","tab-content");
			$("#question0"+typeValue).removeAttr("class");
			$("#question0"+typeValue).attr("class", "optionTab" );
			$("#tab-0").attr("class","tab-content current");
			$("#question00").attr("class", "optionTab current");
			keyword = $("#searchKeyword").val();
			
	 	 	var pSendData = { 
	 	 			searchTypeQna : "0",
	 	 			searchKeyword : keyword,
	 				pageNo : $("#pageNo").val(),
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
	 				cfnRequestSuccessCallback("selectQnaList", data);
	 			},
	 			error:function(e){
	 		        console.log(e);
	 		    },
	 		    complete : function(){
	 		        
	 		        searchCk = 0;
	 		    }
	 				
	 		});		
     });
	
	  
	
	  /* 제목+내용 검색길이 제한 */
	  $("#searchKeyword").keyup( function(e) {
		  
		  searchCk = 1;
		  var key = document.getElementById("searchKeyword");
		  if(key.value.length > key.maxLength){
			  key.value = key.value.slice(0, key.value.maxLength)				  													  
		  	}
		  
     });
	
});


</script>
    