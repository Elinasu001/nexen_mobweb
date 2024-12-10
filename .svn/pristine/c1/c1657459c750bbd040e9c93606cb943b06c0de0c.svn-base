<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>

      <!-- subContentsWrap -->
      <div class="subContentsWrap">
        <main class="mynexen">

          <!-- header -->
          <div class="page-header">
            <h2 class="title-deco">
              <span>작성해</span> <span>주세요!</span>
            </h2>
            <h3 class="title-deco-sub">주문후기</h3>
          </div>
          <!-- //header -->

          <div class="order-middle-message text-center border-bottom">
            <p>고객님의 타이어,<br>넥스트 레벨이 관리해 드립니다.</p>
            <div class="order-info-summary">
              <small>넥스트레벨은 항상 고객님께 최상의 서비스로 보답하려고 노력하고 있습니다.</small>
            </div>
          </div>

          <div class="mynexen-review-product inset-ml border-bottom">
            <div class="review-summary layout-r">
              <div class="result-data-type layout-r inline-xs mr-m">
              <c:if test="${systemGbn == 'O'}">
                <div class="sell-type-buy">구매</div>
              </c:if>
              <c:if test="${systemGbn == 'R'}">
                <div class="sell-type-rental">렌탈</div>
              </c:if>
              </div>
             <div class="review-info">
                <p class="review-product-title"><b>${review.patternCd}</b></p>
                <p class="review-registration"> </p>
				
             </div>
            </div>
          </div>

          <div class="mynexen-review layout-c">
            <p class="review-title"><b>${review.title}</b></p>
            <p class="review-product-info">${classNm} | ${dispSize}</p>
             	<p class="score0${review.grdPt}"></p>
            <!-- if문 수정 동현 -->
             <p class="review-text">
            	<textarea id="textArea" name="textArea" title="내용 입력란" placeholder="내용을 입력해주세요" class="type01 h200" readonly="readonly">${review.rCont}</textarea>
            </p>
            <p class="review-photo">
            
            <div class="upload-images"> 


				<c:if test="${review.atflYn == 'Y'}">
					<c:forEach var="atfl" items="${reviewAtfl}">
					<div class="imgUpBlock"> 
						<div class="thumb " id="thumb_fileUp01">
<%-- 							<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.atflNm}"/> --%>
							<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${atfl.atflUrl}">
							<div class="remove-btn"></div>
						</div>
					</div>
					</c:forEach>
				</c:if>

				</div>
				<!--  
				<c:if test="${review.atflNm ne null}">
					<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.atflNm}"  alt=""/>
				</c:if>
				<%-- <c:if test="${systemGbn eq 'R'}">
				<c:if test="${review.atflNm ne null}">
					<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.atflNm}"  alt=""/>
				</c:if>
            	<!--  
				<c:if test="${systemGbn eq 'R'}">
					<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile/${review.qImgPath}"  alt="${review.atflNm}"/>
				</c:if>
				<c:if test="${systemGbn eq 'O'}">
					<c:if test="${review.atflNm ne null}">
						<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.atflNm}"  alt=""/>
					</c:if>
				</c:if> --%>
				<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.atflNm}"  alt=""/>
				-->
<%-- 				<c:if test="${review.atflNm ne null}"> --%>
<%-- 					<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${review.atflNm}"  alt=""/> --%>
<%-- 				</c:if> --%>
            </p>
<!--             <p class="review-text"> -->
<%--             	<textarea id="textArea" name="textArea" title="내용 입력란" placeholder="내용을 입력해주세요" class="type01 h200" readonly="readonly">${review.rCont}</textarea> --%>
<!--             </p> -->
          </div>

          <div class="inset-ml border-top">
            <small class="font-gray">※ 상품 및 주문과 관계없는 글(광고성, 양도, 욕설, 비방, 도배) 불법 이미지/사진 등은 예고없이 삭제되며, 경우에 따라 고발 또는 쇼핑몰 이용제한을 받을 수 있습니다.</small>
          </div>
          <div class="btn-wrap layout-r same-size">
            <button type="button" onclick="javascript:fn_reviewDel();" class="inset-m full-width btn-gray-light">삭제</button>
            <button type="button" onclick="javascript:fn_reviewUpdate();" class="inset-m full-width btn-primary">수정</button>
          </div>
        </main>
      </div>
      <!-- //subContentsWrap -->
		
	<form id="orderInfoFrm" name="orderInfoFrm" method="post" >
		<input type="hidden" name="ordNo"  			id="ordNo" 		value="${review.ordNo}" />      <!--  주문번호  -->
		<input type="hidden" name="custNo"  		id="custNo"  	value="${custNo}"/>	
		<input type="hidden" name="custNm"  		id="custNm"  	value="${custNm}"/>	
		<input type="hidden" name="userId"  		id="userId"  	value="${userId}"/>
		<input type="hidden" name="dpNo"  			id="dpNo" 		value="${review.dpNo}" />  			
		<input type="hidden" name="patternCd"  		id="patternCd" 	value="${review.patternCd}" />
		<input type="hidden" name="updDt"  			id="updDt" 	value="${review.updDt}" />
		<input type="hidden" name="systemGbn"  		id="systemGbn" 	value="${systemGbn}" />
		<input type="hidden" name="bdojSeq"  		id="bdojSeq" 	value="${review.bdojSeq}" />
		<input type="hidden" name="usePsNo"  		id="usePsNo" 	value="${review.usePsNo}" />
		<input type="hidden" name="classNm"  		id="classNm" 	value="${classNm}"/>  
		<input type="hidden" name="dispSize"  		id="dispSize" value=""/> 
		<input type="hidden" name="itemCd"  		id="itemCd" 	value="${review.itemCd}" /> <!-- 동현 추가 -->
	</form>
	
	<div class="reviewFullPopup md-effect-1" id="modalPhotoView">
		<header>
				<a href="javascript:;" onclick="closePhotoView();" class="layPopClose"></a>
		</header>
		<div class="modal-body">
		</div>
	
	</div>
		
<script type="text/javascript">
var patternCd = "${review.patternCd}";
var dispSize = '${dispSize}';
var custNm = '${review.custNm}';
var updDt1 = '${review.updDt}';




$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-review'></div>");
	/* page background image End */
	
	$('#paterncode').text(patternCd);
	$('.review-registration').text(calculus());
	
	$(".imgUpBlock").on('click',function(){
		var img_src = $('img',this).attr('src');
		$("#modalPhotoView").show();
		$("#modalPhotoView .modal-body").html( $("<img>").attr('src', img_src ) );
	});
});
function calculus(){
	
	//custNm = custNm.replace(/(?<=.{1})./gi, "*");
	
	var year = updDt1.substring(0,4);
	var month = updDt1.substring(5,7);
	var day = updDt1.substring(8,10);

	
	return custNm+"님 | "+year+"."+month+"."+day;
}
function fn_reviewDel(){
	var msg = "후기를 삭제하시겠습니까?";
	var frm = document.orderInfoFrm;
	if(confirm(msg)){
		frm.action = "/mypage/orderRivewDel";
		frm.submit();
	}
}

function fn_reviewUpdate(){
	var frm = document.orderInfoFrm;
	frm.dispSize.value= dispSize;
		frm.action = "/mypage/orderRivewUpdate";
		frm.submit();
}

function closePhotoView(){
	$("#modalPhotoView").hide();
}


</script>

