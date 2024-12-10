<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
		
	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header">
            	<h2 class="title-deco">
              		<span>궁금증을</span> <span>해결하세요.</span>
            	</h2>
            	<h3 class="title-deco-sub">1:1문의</h3>
          	</div>
          	<!-- //header -->

          	<div class="order-middle-message text-center border-bottom">
            	<p>고객님의 타이어,<br>넥스트 레벨이 관리해 드립니다.</p>
            	<div class="order-info-summary">
              		<small>넥스트레벨은 항상 고객님께 최상의 서비스로 보답하려고 노력하고 있습니다.</small>
            	</div>
          	</div>
          
          	<div class="listDetailWrap">
            	<!-- listHeader -->
            	<div class="listHeader">
              		<dl>
                		<dt>
                  			<span class="state" id="questClsCdNm"></span>
                  			<span class="dateView" id="qWritYmd"></span>
                		</dt>
                		<dd class="f_ell w100per">${questionDetailVo.getTitle()}</dd>
              		</dl>
            	</div>
            	<!-- listHeader -->
                    
            	<!-- listCon-->
            	<div class="listCon">
              		<p>${questionDetailVo.getqCont()}</p>
              		<br>
              		<div class="mb-s"><small><b>첨부이미지</b></small></div>
             		<p class="attachment">
               			<img id="qImgPath" src="" style="display:none;">
             		</p>
            	</div>
            	<!-- listCon -->

				<c:if test="${!empty questionDetailVo.getrCont() and questionDetailVo.getrCont() ne 'null' }">
            	<!-- listHeader -->
            	<div class="listHeader answerDiv">
              		<dl>
                		<dt>
                  			<span class="state"></span>
                  			<span class="dateView" id="rWritYmd"></span>
                		</dt>
                		<dd class="f_ell w100per">1:1문의 답변</dd>
              		</dl>
            	</div>
            	<!-- //listHeader -->
            
            	<!-- listCon -->
            	<div class="listCon answerDiv">
              		${questionDetailVo.getrCont()}
            	</div>
            	<!-- //listCon --> 
          	</div>
          	</c:if>

          	<div class="btn-wrap layout-r same-size">
            	<button type="button" class="inset-m full-width btn-gray-light" id="delQuestion">삭제</button>
            	<button type="button" class="inset-m full-width btn-primary" id="goBackList">목록</button>
          	</div>
		</main>
	</div>
    <!-- //subContentsWrap -->

<script type="text/javascript" src="/js/lib/classie.js"></script>
<script type="text/javascript" src="/js/lib/modalEffects.js"></script>

<script type="text/javascript">
	var bdojSeq = "${questionDetailVo.getBdojSeq()}";
	
	function initPage() {
		$("#questClsCdNm").text("${questionDetailVo.getQustClsCdNm()}");
		$("#qWritYmd").text("${questionDetailVo.getWritYmd()}");
		
		
		if("${questionDetailVo.getqImgPath()}" !== "") {
			var qPath = "${questionDetailVo.getqImgPath()}";
			$("#qImgPath").attr("style","display:block;margin-left:auto;margin-right:auto;width: auto; height:300px; pointer-events: none;cursor: default");
			$("#qImgPath").attr("src","${qImgPath}" + qPath);
		};
		
/* 		if("${questionDetailVo.getrCont()}" !== "") {
			$(".answerDiv").attr("style","display:block;");
			$("#rWritYmd").text("${questionDetailVo.getWritYmd()}");
			$("#rCont").text("${questionDetailVo.getrCont()}");
		} */
	}
	
	/*
	 * 리퀘스트 후처리 함수 - SUCCESS
	 */
	function cfnRequestSuccessCallback(callback, result) {
		console.log("result.rtnCode : " + result.rtnCode);
		console.log("result.rtnMsg : " + result.rtnMsg);
		
		if(result.rtnCode == 0) {
			if(callback == 'deleteQuestion') {
				alert('문의 내용이 삭제 되었습니다.');
				$("#goBackList").click();
			}
		} 
	}
	
	/*
	 * 리퀘스트 후처리 함수 - ERROR
	 */
	function cfnRequestErrorCallback(callback, status) {
		
		if(callback == 'deleteQuestion'){
			alert('처리 실패 되었습니다.');
		}
		
	}
	
	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg question-detail'></div>");
		/* page background image End */
		
		$("#goBackList").on("click", function() {
			location.href = '/mypage/questionList';
		});
		
		$("#delQuestion").on("click", function() {
			if(confirm("삭제하겠습니까?")) {
				var param = {};
				
				param["bdojSeq"] = bdojSeq;
				param["brdDivCd"] = "4";
				
				cfnSendRequest("/mypage/deleteQuestion",param,'deleteQuestion');
			}
		});

		initPage();
	});
</script>