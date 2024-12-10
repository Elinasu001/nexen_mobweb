<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link type="text/css" rel="stylesheet" href="/css/OverlayScrollbars.css">
<script type="text/javascript" src="/js/lib/jquery.overlayScrollbars.js"></script>
<script type="text/javascript" src="/js/scroll.js"></script>

<form id="frm" name="frm" method="post" >
	<!-- paging -->
	<input type="hidden" name="pageNo"	id="pageNo"	value="${pageNo}"/>		<!-- 현재 페이지 -->
	<input type="hidden" name="pageSize"	id="pageSize" 	value="9" />		<!-- 페이지에 표시할 수 -->
</form>

<!-- subContentsWrap -->
<div class="subContentsWrap">
	<main class="mynexen mynexen-member">
    	<!-- header -->
	    <div class="page-header empty">
	        <h2 class="title-deco">
	        	<span>쿠폰으로</span> <span>알뜰하게!</span>
	        </h2>
	        <h3 class="title-deco-sub">나의 쿠폰</h3>
	    </div>
      <!-- //header -->
		<c:if test="${empty mobNo}">
		<div class="bg">
      		<div class="order-middle-message">
	        	<h3 class="content-title">쿠폰이용 참고사항</h3>
	          	<span>주문취소 시 쿠폰은 유효기간 내에 다시 이용하실 수 있으며, 발급된 쿠폰은 주문 시 1회 사용 가능합니다.<br>
	            	상품 쿠폰의 경우 쿠폰에 따라서 최대 2개까지, 결제 쿠폰의 경우 최대 1개만 적용 가능합니다.</span>
	        </div>
      	</div>
     	
		<div class="addcoupon-section">
			<form>
				<input type="text" id="cpnPlcNo" name="cpnPlcNo" maxlength="5" placeholder="쿠폰번호를 입력해주세요" >
				<button type="button" id="btnCpnReg" >쿠폰등록</button>
			</form>
		</div>
		</c:if>
		<c:if test="${not empty mobNo}">
		<div class="bg">
      		<div class="order-middle-message">
	        	<h3 class="content-title">쿠폰이용 참고사항</h3>
	          	<span>비회원 주문 시 휠 얼라인먼트 등의 정비 옵션을 함께 결제하신 경우 정비 쿠폰 조회가 가능합니다.<br>
	            	정비 쿠폰은 넥센타이어 직영점에 한하여 이용 가능하며, 사전 유선 예약이 필요합니다.</span>
	        </div>
      	</div>
		</c:if>
      	<div class="mynexen-coupon-list inset-l pt-0 bg">
        	<ul id="couponListDiv"></ul>
      	</div>

<!-- 
<div class="coupon-single maintenance">
	<div class="coupon-data">
		<div>휠 얼라이먼트<span class="pay">1</span>회</div>
		<div><a href="/bbs/o2oSearchList">넥센 직영점 찾기</a></div>
		<div>2021.01.07~2031.01.05</div>
		<div>(3651일 남음)</div>
	</div>
	<div class="coupon-addition">
		<div class="title"><img src="/img/mynexen/coupon_tit_03.png" alt="쿠폰상품할인"></div>
		<div class="view"></div>
	</div>
</div>
-->

      	<!-- <div class="mb-m">
        	<button class="list-more full-width inset-m border-top">
          		<span>더보기</span>
        	</button>
      	</div> -->
	</main>
</div>
<!-- //subContentsWrap -->
<!-- 적용 상품 보기 -->
<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-2">
	<div class="popContents" id="applyGoods"></div>
</div>
<!-- //적용 상품 보기 -->

<!-- 적용상품 카테고리 -->
<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-3">
	<div class="popContents" id="applyCategory"></div>
</div>
<!-- //적용상품 카테고리 -->
<form id="nonCustInfoFrm" name="nonCustInfoFrm" method="post" >
	<input type="hidden" name="ordNo"  	id="ordNo" value="${ordNo}"/>     <!--  주문번호  -->
	<input type="hidden" name="custNm"  id="custNm" value="${custNm}"/>		<!-- 비회원 이름 -->
	<input type="hidden" name="mobNo"  	id="mobNo" value="${mobNo}"/>		<!-- 비회원 휴대폰 번호 -->
</form>
<script type="text/javascript" src="/js/lib/classie.js"></script>
<script type="text/javascript" src="/js/lib/modalEffects.js"></script>
<script type="text/javascript">
	var evManager = {
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
			ComUtil.loading();

			//list 조회
			var pUrl = "/mypage/selectMyCouponList";
			var pSendData = {};
			cfnSendRequest(pUrl,pSendData,'selectMyCouponList');
		}
		,
		//상품 리스트 호출 - 페이지용
		selectMyCouponList : function (p) {
			var pUrl = "/mypage/selectMyCouponList";
			var pSendData = {};
			cfnSendRequest(pUrl,pSendData,'selectMyCouponList');
		}//쿠폰 다운로드
		,selectMyCpnDownLoad : function(p){
			//console.log("selectMyCpnDownLoad");
			var pUrl = "/mypage/selectMyCpnDownLoad";
			var pSendData = p;
			cfnSendRequest(pUrl,pSendData,'selectMyCpnDownLoad');
		}
	}

	/* ################################# AJAX CALLBACK ARAR #################################  */
	/*
	 * 리퀘스트 후처리 함수 - SUCCESS
	 */
	function cfnRequestSuccessCallback(callback, result) {
		//console.log("result.rtnCode : " + result.rtnCode);
		//console.log("result.rtnMsg : " + result.rtnMsg);

		if(result.rtnCode == 0) {
			if(callback == 'selectMyCouponList') {
				ComUtil.unloading();

				var data = result.selectMyCouponList;
				fnCouponListHtml(data);
				
			} else if(callback == 'selectMyCouponDispList') {
				var itemList = result.selectMyCouponDispList;
				var categoryHtml = "";

				categoryHtml += "<a href='#' class='layPopClose md-close' onclick='javascript:fn_closePopup(2);'></a>";
				categoryHtml += "<header class='noLine'>";
				categoryHtml += "	<h2>적용 상품보기	<a href='' class='layPopClose md-close'></a></h2>";
				categoryHtml += "</header>";

				categoryHtml += "<div class='popup-contents-nobottom'>";
				categoryHtml += "	<div class='inset-l coupon-page-list'>";
				categoryHtml += "		<ul>";
				if(itemList != null && itemList.length > 0) {
					for(var i=0; i<itemList.length; i++) {
						categoryHtml += "			<li>" + itemList[i].ptrnNm + "</li>";
					}
				} else {
					categoryHtml += "			<li>적용 가능 품목 없음</li>";
				}
				categoryHtml += "       </ul>";
				categoryHtml += "	</div>";
				categoryHtml += "</div>";

				$("#applyGoods").html(categoryHtml);
			} else if(callback == 'selectMyCouponDispList') {
				
				ComUtil.unloading();
				var data = result.selectMyCouponList;
				 
				fnCouponListHtml(data);
			}else if(callback == 'selectMyCpnDownLoad') {
				ComUtil.unloading();
				var data = result.selectMyCouponList;
				if(data != null && data.length > 0 ) {
					ComUtil.alert("정상적으로 쿠폰다운 완료 했습니다. ");
				}
				fnCouponListHtml(data);
			} else if(callback == 'selectNonCustCouponList') {
				ComUtil.unloading();
				var data = result.selectNonCustCouponList;
				fnCouponListHtml(data);
			}
		} else if(result.rtnCode == -1){
			ComUtil.alert(result.rtnMsg);
			return false;
		}
	}
	
	function fnCouponListHtml (data){
		if(data != null && data.length > 0 ) {
			$("#couponListDiv").html("");
			//화면 생성
			var listHtml = "";
			
			for(var i=0; i<data.length; i++){
				if(data[i].dcSeCd == "10") {//상품할인
					listHtml += "<li>";
					listHtml +=	"	<div class='coupon-single pay'>";
					if(data[i].dcCndSeCd == "10") {//전시상품
//							listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_ItemPopup(\""+data[i].dpPrNo+"\");'>적용상품 보기</a>";
//							listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_ItemPopup(\""+data[i].itemCd+"\");'>적용상품 보기</a>";
						listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_ItemPopup(\""+data[i].cpnPlcNo+"\");'>적용상품 보기</a>";
					} else if(data[i].dcCndSeCd == "20") {//품목유형
						//listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_CategoryPopup("+JSON.stringify(data[i])+");'>적용상품 보기</a>";
					}
					listHtml +=	"		<div class='coupon-data'>";
					if(data[i].dcUnitCd == "10") {//정액
						listHtml +=	"		<div>￦ <span class='pay'>" + data[i].dcUnitVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span> 할인</div>";
					} else if(data[i].dcUnitCd == "20"){//정율
						listHtml +=	"		<div><span class='pay'>" + data[i].dcUnitVal + "%</span> 할인</div>";
					}
					listHtml +=	"		<div>" + data[i].cpnNm + "</div>";
					listHtml +=	"		<div>" + data[i].startDe.substring(0,4) + "." + data[i].startDe.substring(4,6) + "." + data[i].startDe.substring(6,8) + "~" + data[i].endDe.substring(0,4) + "." + data[i].endDe.substring(4,6) + "." + data[i].endDe.substring(6,8) + "</div>";
					listHtml +=	"		<div>(" + data[i].remainDay + "일 남음)</div>";
					listHtml +=	"	</div>";
					listHtml +=	"	<div class='coupon-addition'>";
					listHtml +=	"		<div class='title'>";
					listHtml +=	"			<img src='/img/mynexen/coupon_tit.png' alt='쿠폰상품할인'>";
					listHtml +=	"		</div>";
					listHtml +=	"		<div class='view'>";
					if(data[i].dcCndSeCd == "10") {//전시상품
						listHtml +=	"			<img src='/img/mynexen/coupon_btn.png' alt='적용상품보기'>";
					} else if(data[i].dcCndSeCd == "20") {//품목유형
						//listHtml +=	"			<img src='/img/mynexen/coupon_btn.png' alt='적용카테고리보기'>";
					}
					
					if(data[i].condText !== null && data[i].condText !== '') {
						listHtml +=	'<h3 class="type06">' + data[i].condText + '</h3>';
					}
					
					listHtml +=	"		</div>";
					listHtml +=	"	</div>";
					listHtml +=	"</li>";
				}

				if(data[i].dcSeCd == "20") {//결제할인
					listHtml += "<li>";
					listHtml +=	"	<div class='coupon-single percent'>";
					if(data[i].dcCndSeCd == "10") {//전시상품
//							listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_ItemPopup(\""+data[i].dpPrNo+"\");'>적용상품 보기</a>";
//							listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_ItemPopup(\""+data[i].itemCd+"\");'>적용상품 보기</a>";
						listHtml +=	"		<a href='#' class='coupon-link' onclick='javascript:fn_ItemPopup(\""+data[i].cpnPlcNo+"\");'>적용상품 보기</a>";
					} else if(data[i].dcCndSeCd == "20") {//품목유형
						//listHtml +=	"		<a href='#' class='coupon-link' onclick='fn_CategoryPopup("+JSON.stringify(data[i])+");'>적용상품 보기</a>";
					}
					listHtml +=	"		<div class='coupon-data'>";
					if(data[i].dcUnitCd == "10") {//정액
						listHtml +=	"		<div>￦ <span class='pay'>" + data[i].dcUnitVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</span> 할인</div>";
					} else if(data[i].dcUnitCd == "20"){//정율
						if(data[i].cpnPlcNo == "CP0000000000081") {
							listHtml += "		<div><span class='pay'>5%</span> 할인</div>";
						} else {
							listHtml +=	"		<div><span class='pay'>" + data[i].dcUnitVal + "%</span> 할인</div>";
						}
					}
					listHtml +=	"		<div>" + data[i].cpnNm + "</div>";
					listHtml +=	"		<div>" + data[i].startDe.substring(0,4) + "." + data[i].startDe.substring(4,6) + "." + data[i].startDe.substring(6,8) + "~" + data[i].endDe.substring(0,4) + "." + data[i].endDe.substring(4,6) + "." + data[i].endDe.substring(6,8) + "</div>";
					listHtml +=	"		<div>(" + data[i].remainDay + "일 남음)</div>";
					listHtml +=	"	</div>";
					listHtml +=	"	<div class='coupon-addition'>";
					listHtml +=	"		<div class='title'>";
					listHtml +=	"			<img src='/img/mynexen/coupon_tit_02.png' alt='쿠폰결제할인'>";
					listHtml +=	"		</div>";
					listHtml +=	"		<div class='view'>";
					if(data[i].dcCndSeCd == "10") {//전시상품
						listHtml +=	"			<img src='/img/mynexen/coupon_btn.png' alt='적용상품보기'>";
					} else if(data[i].dcCndSeCd == "20") {//품목유형
						//listHtml +=	"			<img src='/img/mynexen/coupon_btn.png' alt='적용카테고리보기'>";
					}
					
					if(data[i].condText !== null && data[i].condText !== '') {
						listHtml +=	'<h3 class="type06">' + data[i].condText + '</h3>';
					}
					
					listHtml +=	"		</div>";
					listHtml +=	"	</div>";
					listHtml +=	"</li>";
				}
				
				if(data[i].dcSeCd == "30") {//차량정비
					listHtml += "<li>";
					listHtml +=	"	<div class='coupon-single maintenance'>";
					listHtml +=	"		<div class='coupon-data'>";
					listHtml +=	"			<div>" + data[i].cpnNm + "</div>";
					listHtml +=	"			<div><a href='/bbs/o2oSearchList'>넥센 직영점 찾기</a></div>";
					listHtml +=	"			<div>" + data[i].startDe.substring(0,4) + "." + data[i].startDe.substring(4,6) + "." + data[i].startDe.substring(6,8) + "~" + data[i].endDe.substring(0,4) + "." + data[i].endDe.substring(4,6) + "." + data[i].endDe.substring(6,8) + "</div>";
					listHtml +=	"			<div>(" + data[i].remainDay + "일 남음)</div>";
					listHtml +=	"			<div>" + data[i].cpnNo + "</div>" ;
					listHtml +=	"		</div>";
					listHtml +=	"		<div class='coupon-addition'>";
					listHtml +=	"			<img src='/img/mynexen/coupon_tit_03.png' alt='차량정비'>";
					listHtml +=	"			<div class='view'></div>";
					listHtml +=	"		</div>";
					listHtml +=	"</li>";
				}
			}
			$("#couponListDiv").append(listHtml);
		} else {
			var listHtml = "";
			listHtml += "<div class='no-data'>";
			listHtml += "	<div class='text-center inset-xl'>";
			listHtml += "		<img src='../img/common/pop_alert_01.png' alt=''>";
			listHtml += "		<p class='mt-m'>쿠폰이 없습니다.</p>";
			listHtml += "	</div>";
			listHtml += "</div>";

			$("#couponListDiv").html(listHtml);
		}
	}

	/*
	 * 리퀘스트 후처리 함수 - ERROR
	 */
	function cfnRequestErrorCallback(callback, status) {

		if(callback == 'selectMyCouponList'){
			alert(status);
		} else if(callback == 'selectMyCouponDispList'){
			alert(status);
		}

	}
	/* ################################# AJAX CALLBACK ARAR #################################  */

	//적용 카테고리 팝업
	function fn_CategoryPopup(pVal) {
		$("#modal-3").addClass("md-show");
		$("#applyCategory").html("");

		var categoryHtml = "";

		categoryHtml += "<a href='#' class='layPopClose md-close' onclick='javascript:fn_closePopup(3);'></a>";
		categoryHtml += "<header class='noLine'>";
		categoryHtml += "	<h2>적용 카테고리보기</h2>";
		categoryHtml += "</header>";

		categoryHtml += "<div class='popup-contents-nobottom'>";
		categoryHtml += "	<div class='inset-l coupon-page-list'>";
		categoryHtml += "		<ul>";
		categoryHtml += "			<li>";
		categoryHtml += "				<span>"+ValidUtil.nvl(pVal.itemGrpNm,"")+"</span>";
		if(!ValidUtil.isEmpty(pVal.itemTyCd)) {
			categoryHtml += "		   		&gt; <span>"+pVal.itemTyNm+"</span>";
		}
		if(!ValidUtil.isEmpty(pVal.itemTyDtlCd)) {
			categoryHtml += "		   		&gt; <span>"+pVal.itemTyDtlNm+"</span>";
		}
		categoryHtml += "			</li>";
		categoryHtml += "       </ul>";
		categoryHtml += "	</div>";
		categoryHtml += "</div>";

		$("#applyCategory").html(categoryHtml);
	}

	//적용 상품 팝업
	function fn_ItemPopup(pVal) {
		$("#modal-2").addClass("md-show");
		$("#applyGoods").html("");

		getDispList(pVal);
	}

	//전시품목 가져오기
	function getDispList(pDpPrNo) {
		var resultVal = {};
		var param = {};
// 		param["dpPrNo"] = pDpPrNo;
// 		param["itemCd"] = pDpPrNo;
		param["cpnPlcNo"] = pDpPrNo;

		cfnSendRequest("/mypage/selectMyCouponDispList",param,'selectMyCouponDispList');

		return resultVal;
	}

	function fn_closePopup(pId) {
		$("#modal-"+pId).removeClass("md-show");
	}

	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg mynexen-coupon'></div>");
		/* page background image End */

		if(!ValidUtil.isEmpty($("#mobNo").val())) {//비회원
			var mobNo = $("#mobNo").val();
			var custNm = $("#custNm").val();
			var ordNo = $("#ordNo").val();
			
			var pUrl = "/mypage/selectNonCustCouponList";
			var pSendData = {"mobNo": mobNo, "custNm" : custNm, "ordNo" : ordNo };
			cfnSendRequest(pUrl,pSendData,'selectNonCustCouponList');
		} else {
			//init 함수 호출
			evManager.init();
		}
		
		$("#cpnPlcNo").bind("keydown",function(){
			var plcNo = $(this).val();
			plcNo = fnChkValid(plcNo);
			$(this).val(plcNo);
		});
		
		$("#cpnPlcNo").bind("keyup",function(){
			var plcNo = $(this).val();
			plcNo = fnChkValid(plcNo);
			$(this).val(plcNo);
		});
		
		fnChkValid = function(plcNo){
			var strLen = plcNo.length;
			var strTmp = plcNo.substr(strLen-1 , strLen);
			
			if(!ValidUtil.isOnlyNumAlphabet(strTmp)){
				plcNo = plcNo.replace(strTmp,"");
			}
			return plcNo.toUpperCase();
		}
		
		//쿠폰 다운로드 추가(2020.11.19)
		$("#btnCpnReg").on("click",function(){
			var cpnPlcNo = $("#cpnPlcNo").val();
			if(ValidUtil.replaceChar(cpnPlcNo," ","") == ""){
				ComUtil.alert("쿠폰번호를 입력해 주세요.");
				return false;
			}
			if(!ValidUtil.isOnlyNumAlphabet(cpnPlcNo)){
				ComUtil.alert("알파벳과 숫자만 입력해 주세요.");
				return false;
			}
			if( cpnPlcNo.length != 5){
				ComUtil.alert("쿠폰번호는 5자리 입니다. 다시 확인후 주세요.");
				return false;
			}
			
			var pSendData = {"cpnPlcNo": cpnPlcNo }
			
			evManager.selectMyCpnDownLoad(pSendData);
		});
	});
</script>

