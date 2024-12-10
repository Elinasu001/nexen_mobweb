<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="java.net.URLEncoder" %>


<script src="/js/lib/clipboard.min.js"></script>
<!-- 엄수현 매니저  추천인 화면 개발 완료. -->
<!-- subContentsWrap -->
<div class="subContentsWrap myrecommend">
	<main class="mynexen">
		<!-- header -->
		<div class="page-header empty">
			<h2 class="title-deco">
				<span>추천인</span> <span>상품입니다.</span>
			</h2>
			<h3 class="title-deco-sub">추천인</h3>
		</div>
		<!-- //header -->
		
		<!-- 주문 정보 안내 -->
		<div class="myrecommend-header-message text-center">
			고객님의 추천 활동 내역을 확인하실 수 있습니다.
		</div>
		<!-- //주문 정보 안내 -->
	
		<!-- 추천인 코드가 없다면 화면  Validation  -->
		<c:if test="${empty recNum}">
			<div class="notics-box">
				<img src="/img/mypage/myrecommend/notics_no_order.png"  alt="아직 나의 추천인 코드가 생성되지 않았어요"/>
			</div>
		</c:if>
		
		
		<!-- 추천인 코드가 있을 경우에 나오는  뿌려 주는 화면 및 기능 -->
 
			<c:if test="${not empty recNum}">
					<div class="user-info-wrap">
			
			<c:choose>
				<c:when test="${fn:length(selectEvtList) > 0}">
					<div class="user-info">
						<div class="info-item">
							<div class="info-title">추천인 코드</div>
							<div class="info-data"><span>${recNum}</span> <a class="btn-copy-code" data-clipboard-text="${recNum}">복사하기</a> </div>
						</div>
						<div class="info-item">
							<div class="info-title">가입 회원</div>
							<div class="info-data"> 이번 주 <span> ${thisWeekRecCnt}</span>명  /  총 <span> ${totalRecCnt}</span>명 </div>
						</div>
					</div>
					
					<div class="user-info">
						<div class="info-item">
							<div class="info-title">구매 타이어</div>
							<div class="info-data">	<span>${totalOrdQy}</span>개 </div>
						</div>
						<div class="info-item">
							<div class="info-title">선물 신청</div>
							<div class="info-data">	<span>${usedPt}</span>개 </div>
						</div>
						<div class="info-item">
							<div class="info-title">잔여 타이어</div>
							<div class="info-data" >
								<span>${leftPt}</span>개 
							</div>
						</div>
					</div>
				
					<div class="user-info">
						<div class="info-item">
							<div class="info-title">경품 신청하기</div>
							
							<ul class="gift-list">
								<c:forEach var="data" items="${selectEvtList}" varStatus="status">
									<li>
										<div class="cnt"><span class="tire-cnt">${data.recPt}</span></div>
										<div class="thumb"><img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${data.imgUrl}" ></div>
										<div class="btn-wrap"><a class='btn btn-apply on' data-value="${data.recPt}" onclick="open_gift_form('<c:out value="${data.recPrTp}"/>','<c:out value="${data.dtlSeq}"/>','<c:out value="${data.recPt}"/>','<c:out value="${data.recPrNm}"/>');">신청하기</a></div>
										<input type="hidden" name="imgUrl_${data.dtlSeq}" id="imgUrl_${data.dtlSeq}" value="${data.imgUrl}" />
									</li>
								</c:forEach>
							</ul> 
						</div>
					</div>
					
					<div class="gift-apply-form">
						<div class="gift-title"><span>경품 신청</span></div>
						<div class="gift-info">
							<div class="gift-image" id="giftImg">
								<img src=""/>
							</div>
							<div class="input-group-wrap">
								<div class="input-group">
									<label for="inp001"><span class="black">이름 </span></label>
									<input type="text" id="in_recipNm" name="in_recipNm" placeholder="이름을 입력해주세요." maxlength="20" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"/>
								</div>
								<div class="input-group">
									<label for="inp002"><span class="black">휴대전화 </span></label>
									<input type="text" id="in_hpNo" name="in_hpNo" placeholder="휴대폰번호를 입력해주세요." maxlength="11" onkeyup="validNumberCheck.keyUp(event);"/>						
 								</div>
								<div class="input-group" id="addrDiv">
									<label for="inp003"><span class="black">주소 </span></label>
									
									<div class="addr-input md-trigger" data-modal="modal-Addr">
									<!-- <a href="#" name="selectAddr" val="P1" class="searchBtn03 md-trigger" onclick="return false" tabindex="-1" data-modal="modal-22"></a>  -->	
										<input type="text" name="addrFull" id="addrFull" readonly="readonly" title="주소 입력란" placeholder="주소를 검색하세요">
										<input type="hidden" id="addr" name="addr" data-json-obj="true" value="">
										<input type="hidden" id="detlAddr" name="detlAddr" data-json-obj="true" value="">
										<input type="hidden" id="posNo" name="posNo" data-json-obj="true" value="">
										<input type="hidden" id="bldMngNo" name="bldMngNo" data-json-obj="true" value="">
									</div>
								</div>
								
								<div class="desc" id="desc"></div>
							</div>
						</div>
					</div>
					
					<div class="precautions">
						<div class="precautions-title">유의 사항</div>
						<div class="precautions-text">
							1) 넥스트레벨 회원만 참여가 가능합니다.<br/>
							2) 넥스트레벨 회원 정보 마케팅 활용 동의하지 않은 회원은 경품 발송이 불가합니다.<br/>
							3) 경품 신청 시 각 경품의 필요 타이어 수량 만큼 경품 신청 가능 타이어 수량에서 차감됩니다.<br/>
							4) 경품의 액수가 총 5만원을 초과하는 경우 제세공과금은 본인 부담됩니다.<br/>
							5) 경품 신청 후 취소 및 변경은 불가합니다.<br/>
							6) 잘못된 회원 정보 제공으로 경품 미발송 및 오발송은 당사에서 책임지지 않으며, 재발송되지 않습니다.
						</div>
					</div>
					
					<div class="btn-gift-apply-wrap">
						<a class='btn-gift-apply apply-cancel' href="javascript:;" onclick="gift_cancel();"> 취소</a>
						<a class='btn-gift-apply apply-submit' href="javascript:;" onclick="gift_apply();"> 신청하기</a>
					</div>
				
					<c:choose>
						<c:when test="${fn:length(selectOrdEvtList) > 0}">
							<div class="gift-order-wrap">
								<div class="order-title">나의 경품 신청 내역</div>
								<ul class="order-list">
									<c:forEach var="item" items="${selectOrdEvtList}" varStatus="status">
									<li>
										<div class="order-item">${item.recPrNm}</div>
										<div class="order-point"><div class="tire-cnt">${item.usedPt}</div></div>
										<div class="order-status"><a href="javascript:;" class="status ready" data-value="${item.ordStsCd}" onclick="check_delivery('<c:out value="${item.recOrdNo}"/>')">${item.ordStsNm}</a></div>
									</li>
									</c:forEach>
								</ul>
							</div>	
						</c:when>    
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:when>    
				<c:otherwise>
				<!--  현업분들 요구사항 
				   이벤트 기간이 아니면 추천인 코드 X
					<div class="user-info">
						<div class="info-item">
							<div class="info-title">추천인 코드</div>
							<div class="info-data"><span>${recNum}</span> <a class="btn-copy-code" data-clipboard-text="${recNum}">복사하기</a> </div>
						</div>
					</div>
					 -->
					<div class="notics-box">
						<img src="/img/mypage/myrecommend/notics_wait_event.png"  alt="지금은 추천인 이벤트 기간이 아닙니다."/>
					</div>
				</c:otherwise>					                
	        </c:choose>
	        </div>
		</c:if>
	</main>
</div>
<!-- //subContentsWrap -->



<!-- 클립 보드 버튼 기능을 누를시에 나오는 팝업 화면 -->
<div class="myreco-modal small" id="copyCodeResult">

	<div class="modal-wrap">
		<div class='close-btn'>
		<a onclick="close_popup()" ><img src="/img/common/car_finder/close.png"></a>
		</div>

		<div class="popContents">
			나의 추천인 코드가 클립보드에 복사되었습니다.<br/>
			추천드릴 분께 붙여넣기 후 전송해주세요.
			<div class="btn-wrap">
				<a onclick="close_popup()">확&nbsp;&nbsp;&nbsp;&nbsp;인</a>
			</div>
		</div>
			
	</div>

</div>

<div class="myreco-modal small" id="giftApplicationCompleted">

	<div class="modal-wrap">
		<div class='close-btn'>
		<a onclick="close_popup()" ><img src="/img/common/car_finder/close.png"></a>
		</div>
		<header>
			<h2> 신청 완료</h2>			
		</header>
	<div class="popContents">
			<div class="text-center" id="complete_desc"></div>
		<div class="gift-info">
			<div class="item-name" id="complete_recPrNm"></div>
			<div class="tire-cnt" id="complete_usedPt"></div>
		</div>
			
			
			<div class="gift-image" id="complete_image">
				<img src=""/>
			</div>
			
			<div class="text-center">
				나의 추천인 코드에서 배송 정보를 확인해 주세요.<br/>
				경품 신청 후 변경 및 취소는 불가합니다.
			</div>
			
			<div class="btn-wrap">
				<a onclick="close_popup_select()">확&nbsp;&nbsp;&nbsp;&nbsp;인</a>
			</div>
		</div>
			
	</div>

</div>


<div class="myreco-modal small" id="checkDelivery">

	<div class="modal-wrap">
		<div class='close-btn'>
		<a onclick="close_popup()" ><img src="/img/common/car_finder/close.png"></a>
		</div>
		<header>
			<h2> 배송 정보 조회</h2>			
		</header>
		<div class="popContents">
		
			<div class="gift-info">
				<div class="item-name" id="dlv_recPrNm"></div>
				<div class="tire-cnt" id="dlv_recPt"></div>
			</div>
			<div class="gift-image" id="dlv_imgUrl">
				<img src=""/>
			</div>
			<div class="user-info-wrap">
				<div class="user-info">
					<div class="info-item">
						<div class="info-title">이름</div>
						<div class="info-data" id="dlv_recipNm"><span>권형태</span> </div>
					</div>
					<div class="info-item">
						<div class="info-title">휴대전화</div>
						<div class="info-data" id="dlv_hpNo">	<span>010-1234-1234</span> </div>
					</div>
					<div class="info-item" id="dlv_divAddr">
						<div class="info-title">주소</div>
						<div class="info-data" id="dlv_addr">	<span>서울특별시 강서구 마곡중앙로 177 501호</span> </div>
					</div>
				</div>
			</div>

			<div class="text-center" id="dlv_desc">
				고객님의 경품이‘상품 준비 중’입니다.<br/>
				상품의 준비가 끝나는 대로 발송 처리 될 예정입니다.
			</div>
			
			<div class="btn-wrap">
				<a onclick="close_popup()">확&nbsp;&nbsp;&nbsp;&nbsp;인</a>
			</div>
		</div>
			
	</div>

</div>




<form id="frm" name="frm" method="post">
	<input type="hidden" name="recNum" id="recNum" value="${recNum}" />
	<input type="hidden" name="evtSeq" id="evtSeq" value="${evtSeq}" />
	<input type="hidden" name="dtlSeq" id="dtlSeq" value="" />
	<input type="hidden" name="custNo" id="custNo" value="${custNo}" />
	<input type="hidden" name="recipNm" id="recipNm" value="" />
	<input type="hidden" name="dvlAddr" id="dvlAddr" value="" />
	<input type="hidden" name="dvlAddrDtl" id="dvlAddrDtl" value="" />
	<input type="hidden" name="postNo" id="postNo" value="" />
	<input type="hidden" name="hpNo" id="hpNo" value="" />
	<input type="hidden" name="usedPt" id="usedPt" value="" />
	<input type="hidden" name="custId" id="custId" value="${custId}" />

	<input type="hidden" name="recPrNm" id="recPrNm" value="" />
	<input type="hidden" name="recPrTp" id="recPrTp" value="" />
	<input type="hidden" name="leftPt" id="leftPt" value="${leftPt}" />
</form>
    


<script type="text/javascript">
var jusoGbn = "";
var mountCheck1 = "";	//현재 선택 된 장착서비스 유형 --- footer.jsp 우편번호 사용을 위해 추가


$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-myrecommend'></div>");
	/* page background image End */
	
	/* Validation에 따라서 Button 색상 변화 (Gray/Pupple) 및 Button Click On/Off
	 1. 경품 신청하기  신청 가능 하면  Pupple & Button Click ON // 신청이 가능 하지 않다면 Gray & Button Click OFF
	 2. 나의 경품 신청 내역에서 상품준비중/배송중 은 Button Pupple & Button Click ON // 배송완료가 되면 Button Pupple(색상) & Button Click OFF  
	*/
	
	$('.gift-list li div a').each(function(i, obj){  
		if($(this).attr("data-value")<=$("#leftPt").val()){
			$(this).attr('class','btn btn-apply on');
			
		}else{
			$(this).attr('class','btn btn-apply');
			$(this).attr("onclick",  null);

		}
	});
	$('.order-list li div a').each(function(i, obj){
		if($(this).attr("data-value") == "30"){
			$(this).attr('class','status delivery');
			$(this).attr("onclick",  null);

		}else{
			$(this).attr('class','status ready');
		}
	});

});


//추천인 코드 Copy 버튼
$(function(){
	var clipboard = new ClipboardJS('.btn-copy-code');

	clipboard.on('success', function(e) {
		// copy_code();
		$("#copyCodeResult").show();
		e.clearSelection();
	});
	clipboard.on('error', function(e) {
	    // console.error('Action:', e.action);
    	// console.error('Trigger:', e.trigger);
		alert("지원되지 않는 브라우져 입니다.\n직접 선택하여 복사해 주세요.");
	});

});

function copy_code(){
	$("#copyCodeResult").show();
}

// 상품 선택 후 취소 버튼
function gift_cancel(){
	// $("#giftApplicationCompleted").show();
	
// 취소 버튼을  클릭 할시 무조건 데이터 값 초기화	
if($("#inp001").val() != '' || $("#inp002").val() != '' ||$("#inp003").val() != '' )
 {
	$('#inp001').val('');
	$('#inp002').val('');
	$('#inp003').val('');
  }

	$(".gift-apply-form").hide();
	$(".btn-gift-apply-wrap").hide();
}

//신청 완료 팝업
function close_popup_select(){
	$(".popupWrap").removeClass("md-show");
	var frm = document.frm;
	frm.action = '/mypage/myRecommend';
	frm.submit();
}



// 팝업 닫기 
function close_popup(){
	$(".myreco-modal").hide();
}

// 특수문자 제거
function characterCheck(obj){
	  var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 

	  if( regExp.test(obj.value) ){
	     obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	  }
}

//신청하기_조회!! 
function open_gift_form(recPrTp, dtlSeq, recPt, recPrNm){
	var check_leftPt = Number($("#leftPt").val()) - Number(recPt);
	if(check_leftPt < 0){
		ComUtil.alert("포인트가 부족합니다.");
		return;
	}

	var imgUrl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
	$(".gift-apply-form").show();
	$(".btn-gift-apply-wrap").show();
	$("#giftImg").find("img").attr('src', imgUrl+$("#imgUrl_"+dtlSeq).val());
	if(recPrTp == 20){
		$('#addrDiv').show();
	}else{
		$('#addrDiv').hide();
	}
	$("#desc").html("타이어 "+ recPt +"개가 소진되며<br/>신청 후 잔여 타이어는 "+ check_leftPt +"개 입니다.");
	
	$("#usedPt").val(recPt);
	$("#recPrTp").val(recPrTp);
	$("#dtlSeq").val(dtlSeq);
	$("#recPrNm").val(recPrNm);
	
	//신청 후 팝업에 사용
	$("#complete_image").find("img").attr('src', imgUrl+$("#imgUrl_"+dtlSeq).val());
	$("#complete_desc").html("축하합니다.경품 신청 완료 되었습니다.<br/>경품 신청 후 잔여 타이어는 "+ check_leftPt +"개 입니다.");
	$("#complete_usedPt").html(recPt);
	$("#complete_recPrNm").html(recPrNm);
}

//신청하기 - 저장!!
function gift_apply(){

	if($("#in_recipNm").val() == "" || $("#in_recipNm").val() == null){
		$("#in_recipNm").focus();
		ComUtil.alert("이름을 입력하세요.");
		return;
	}
	if($("#in_hpNo").val() == "" || $("#in_hpNo").val() == null){
		$("#in_hpNo").focus();
		ComUtil.alert("휴대전화를 입력하세요.");
		return;
	}
	if($("#recPrTp").val() == "20" && ($("#in_hpNo").val() == "" || $("#in_hpNo").val() == null)){
		ComUtil.alert("주소 입력하세요.");
		return;
	}
	
	$("#recipNm").val($("#in_recipNm").val());
	$("#hpNo").val($("#in_hpNo").val());
	var formData = $("#frm").serializeObject();

	$.ajax({
	    type: "POST",
	    url: "/mypage/saveRecommendEvent",
	    cache:false,
	    data: JSON.stringify(formData),
	    contentType:"application/json;charset=UTF-8",
	    success: function(data) {
	    	if(data.successCode == "S") {
	    		$("#giftApplicationCompleted").show(); //$("#giftApplicationCompleted").show();

	    	}else{
		    	ComUtil.alert("신청중에 오류가 발생하였습니다. 고객센터에 문의 바랍니다.");
	    	}
	    },
	    error: function (request, status, error) {
	    	ComUtil.alert("신청중에 오류가 발생하였습니다. 고객센터에 문의 바랍니다.");
	    	console.log(error)
		}
	});	
}



//경품내역_배송조회
function check_delivery(recOrdNo){
	//$("#checkDelivery").addClass("md-show");
	$.ajax({
	    url: "/mypage/selectOrdEvtList",
	    type: "GET",
	    data: {param : recOrdNo},
	    success: function(data) {
	    	console.log(data);
	    	$("#dlv_recPrNm").html(data.recPrNm);
	    	$("#dlv_recPt").html(data.usedPt);
	    	
	    	var imgUrl = "<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>";
	    	$("#dlv_imgUrl").find("img").attr('src', imgUrl+data.imgUrl);

	    	$("#dlv_recipNm").html("<span>"+data.recipNm+"</span>");
	    	$("#dlv_hpNo").html("<span>"+data.hpNo+"</span>");
	    	if(data.recPrTp == "20"){
	    		$("#dlv_divAddr").show();
		    	$("#dlv_addr").html("<span>"+data.dvlAddr + " " +data.dvlAddrDtl+"</span>");
	    	}else{
	    		$("#dlv_divAddr").hide();
	    	}
			if(data.ordStsCd == "10"){
	    		$("#dlv_desc").html("고객님의 경품이‘상품 준비 중’입니다.<br/> 상품의 준비가 끝나는 대로 발송 처리 될 예정입니다.");
			}else if (data.ordStsCd == "20"){
	    		$("#dlv_desc").html("고객님의 경품이‘배송 중’입니다.조금만 기다려주세요!");
			}
			
	    	$("#checkDelivery").show();
	    },
	    error: function (request, status, error) {
	    	console.log(error)
		}
	});
}

function close_gift_form(){
	$(".gift-apply-form").hide();
	$(".btn-gift-apply-wrap").hide();
}


// 모바일은  우편 번호 검색이  footer 에 공통으로 묶여있다. mob footer.jsp 에서 수정 완료
// 상세 주소 화면  (주소 값 가져 올수 있도록 하는것)
function returnAddrInfo(cbData) {

	$("#addrFull").val(cbData.popLoadAddr + " " + cbData.popDetailAddr);
	$("#addr").val(cbData.popLoadAddr);
	$("#detlAddr").val(cbData.popDetailAddr);
	$("#posNo").val(cbData.popZipCode);
	$("#bldMngNo").val(cbData.bldMngNo);
	
	$("#postNo").val(cbData.popZipCode);
	$("#dvlAddr").val(cbData.popLoadAddr);       //   서울특별시 서초구 서초대로 202 (서초동, 서초아파트) 
	$("#dvlAddrDtl").val(cbData.popDetailAddr);  // 1층 101동 

	}

</script>