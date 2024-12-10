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
              <span>다양한 소식을</span> <span>만나보세요.</span>
            </h2>

            <h3 class="title-deco-sub">뉴스</h3>
          </div>
          <!-- header -->
        
          <div class="listDetailWrap">
            <!-- listHeader -->
            <div class="listHeader">
              <dl>
                <dt>
                  <span class="state">운전수칙</span>
                </dt>
                <dd class="f_ell full-width">${tireTipDetailVo.getTitle()}</dd>
              </dl>
            </div>
            <!-- listHeader -->
                  
            <!-- listCon-->
            <div class="listCon bgW">
              <p>
                <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile_cms/${tireTipDetailVo.atflPathNm}" alt=""/>
              </p>
            </div>
            <!-- listCon -->
                  
            <!-- listHeader -->
            <div class="listPreNext">
              <div class="list-nav">
                <dl>
                  <dt>
                    이전글
                  </dt>
                  <dd class="f_ell full-width" id ="preClick">
                    <a style="cursor : pointer">${tireTipPreVo.getTitle()}</a>
                  </dd>
                </dl>
              </div>
              <div class="list-nav">
                <dl>
                  <dt>
                    다음글
                  </dt>
                  <dd class="f_ell full-width" id ="postClick">
                    <a style="cursor : pointer">${tireTipPostVo.getTitle()}</a>
                  </dd>
                </dl>
              </div>
            </div>
            <!-- listHeader -->            
          </div>
        </main>
      </div>
      <!-- //subContentsWrap -->
      
<script type ="text/javascript">
var bdojSeq = "${tireTipDetailVo.getBdojSeq()}";
var prebdojSeq= "${tireTipPreVo.getBdojSeq()}";
var postbdojSeq= "${tireTipPostVo.getBdojSeq()}";




/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	console.log("result.rtnCode : " + result.rtnCode);
	console.log("result.rtnMsg : " + result.rtnMsg);
	
}


$( document ).ready(function() {
	
	/* page background image Start */
	$("#bgFullImg").append("<div class='customer-bg news-list'></div>");
	/* page background image End */
	
	
	if(!ValidUtil.isEmpty(prebdojSeq)){
		$("#preClick").on("click", function() {
			
			location.href = '/news/tireTipDetail?bdojSeq='+prebdojSeq;
		});
	}
	if(!ValidUtil.isEmpty(postbdojSeq)){
		$("#postClick").on("click", function() {
			
			location.href = '/news/tireTipDetail?bdojSeq='+postbdojSeq;
		});
	} 

	
	
});

</script>		