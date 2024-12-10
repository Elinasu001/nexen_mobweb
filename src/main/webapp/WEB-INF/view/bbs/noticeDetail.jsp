<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

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

					<div class="listDetailWrap">
						<!-- listHeader -->
						<div class="listHeader">
							<dl>
								<dt>
								<dd class="f_ell w100per">${noticeDetailVo.getTitle()}</dd>
									<span class="dateView" id="nWritYmd"></span>
								</dt>
							</dl>
						</div>
						<!-- listHeader -->
                  
						<!-- listCon-->
						<div class="listCon">
							<p>
								${noticeDetailVo.nCont} 
							</p>
						</div>
						<!-- listCon -->
                  
						<!-- listHeader -->
						<div class="listPreNext">
							<dl id="preClick">
								<dt>
									이전글
								</dt>
								<dd class="f_ell w100per">
									<a style="cursor : pointer">${noticePreVo.getTitle()}</a>
								</dd>
							</dl>

							<dl id="postClick">
								<dt>
									다음글
								</dt>
								<dd class="f_ell w100per">
									<a style="cursor : pointer">${noticePostVo.getBdojSeq()}</a>
								</dd>
							</dl>
						</div>
						<!-- listHeader -->
                  
					</div>
					<button type="button" id="goBackList" class="btn-primary inset-m full-width"><b>목록</b></button>
        </main>
      </div>
      <!-- //subContentsWrap -->

<script type ="text/javascript">
var bdojSeq = "${noticeDetailVo.getBdojSeq()}";
var prebdojSeq= "${noticePreVo.getBdojSeq()}";
var postbdojSeq= "${noticePostVo.getBdojSeq()}";



function initPage() {
	$("#nWritYmd").text("${noticeDetailVo.getWritYmd()}");
}

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	console.log("result.rtnCode : " + result.rtnCode);
	console.log("result.rtnMsg : " + result.rtnMsg);
	
}


$( document ).ready(function() {
	
	/* page background image Start */
	$("#bgFullImg").append("<div class='customer-bg notice-list'></div>");
	/* page background image End */
	
	$("#goBackList").on("click", function() {
		location.href = '/bbs/noticeList';
	});
	
	if(!ValidUtil.isEmpty(prebdojSeq)){
		$("#preClick").on("click", function() {
			//var preBdojSeq = "${noticePreVo.getBdojSeq()}";
			
			location.href = '/bbs/noticeDetail?bdojSeq='+prebdojSeq;
		});
	}
	if(!ValidUtil.isEmpty(postbdojSeq)){
		$("#postClick").on("click", function() {
			//var postBdojSeq = "${noticePostVo.getBdojSeq()}";
			
			location.href = '/bbs/noticeDetail?bdojSeq='+postbdojSeq;
		});
	} 
	
	
	
	initPage();
	
	
});

</script>      
      