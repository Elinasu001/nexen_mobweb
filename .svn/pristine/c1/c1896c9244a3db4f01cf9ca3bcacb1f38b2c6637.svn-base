<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import = "java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.text.DecimalFormat"%>
<%@ page import = "javax.net.ssl.TrustManager" %>
<%@ page import = "javax.net.ssl.HostnameVerifier" %>
<%@ page import = "javax.net.ssl.HttpsURLConnection" %>
<%@ page import = "javax.net.ssl.SSLContext" %>
<%@ page import = "javax.net.ssl.SSLSession" %>
<%@ page import = "javax.net.ssl.X509TrustManager" %>
<%@ page import = "java.security.cert.X509Certificate" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	//int year = cal.get(java.util.Calendar.YEAR);
	int yy = cal.get(java.util.Calendar.YEAR);
	int mm = cal.get(java.util.Calendar.MONTH);

	DecimalFormat df = new DecimalFormat("00");
	String hour="";
	String min="";

	if( cal.get(java.util.Calendar.AM_PM) == cal.PM){
		hour = df.format(cal.get(java.util.Calendar.HOUR)+12) + df.format(cal.get(java.util.Calendar.MINUTE)); //Calendar.PM이면 12를 더한다
	} else {
	    hour = df.format(cal.get(java.util.Calendar.HOUR)) + df.format(cal.get(java.util.Calendar.MINUTE));
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
%>

<link rel="stylesheet" type="text/css" href="/css/mypage_damage.css">



<!-- <script type="text/javascript" src="/js/common_ui.js"></script> -->
<script type="text/javascript" src="/js/lib/jquery-ui.js"></script>
<script type="text/javascript" src="/js/lib/datepicker-ko.js"></script>
<script type="text/javascript" src="/js/lib/jquery.timepicker.min.js"></script>

	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
        	<!-- header -->
          	<div class="page-header empty">
            	<h2 class="title-deco">
              		<span>무상 파손 / 조기 마모 보증 서비스 가입</span>
            	</h2>
            	<h3 class="title-deco-sub">  </h3>
          	</div>
          	<!-- //header -->

          	<div class="order-middle-message text-center">
            	<p>무상 파손 / 조기 마모 보증 서비스 가입</p>
          	</div>


            	<div class="inset-ml">
                    <p class="h3-desc">
						보증 서비스 가입을 위해 아래와 같이 사진을 첨부해주세요.
					</p>
					<div class="dam-notic3">
						<h4>
							안내사항
						</h4>
						<ul>

							<li>조기 마모 보증 서비스의 경우 휠 얼라인먼트 서비스 선택 및 사용 완료(초기 장착과 동시) 고객께 한하여 제공됩니다.</li>
							<li>(4계절 용 타이어, 승용차, SUV 차량 한정 30,000Km 보증</li>
							<li>차량 전면 사진은 차량번호판이 노출되어야 합니다.</li>
							<li>계기판 사진은 차량의 누적 주행거리가 노출되어야 합니다.(TRIP 제외)</li>
							<li>타이어 사진은 사이즈와 휠이 동시에 노출되어야 합니다.</li>
							<li>예시와 맞지 않은 사진이 첨부되는 경우, 보증 서비스 신청이 거절 될 수 있습니다.(위와 같은 경우, 본 신청페이지가 메시지로 재 발송됩니다.)</li>
							<li>보증 서비스 가입이 완료되면 별도 메시지를 보내드립니다.</li>
							<li>렌탈 타이어 초기 장착 완료일 기준 1개월 이내 정상 신청되지 않는 경우, 보증 서비스에 가입 할 수 없습니다.</li>
							<li>회사에서 무상제공하는 모든 타이어는 렌탈 타이어 본 품 수량에 한합니다.</li>
						</ul>
					</div>



					<div class="tire-desc">
						<img src="/img/mypage/carline.png">
					</div>

					<div class="tire-item-container">

						<div class="tire-item item-1">
							<div class="tire-block">
								<h4>계기판</h4>
								<div class="tire-thumb"><img src="/img/mypage/sample/panel.png"> <button type="button" class="img-zoom"></button></div>
								<div class="tire-actions">
									<div class="upload-box">
										<label for="tireImage1">사진 등록하기</label>
										<input type="file" accept="image/*"  id="tireImage1">
									</div>
									<div class="dist">
										<input type="text" maxlength="6" id="carMileage" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />Km
									</div>
								</div>
							</div>
						</div>

						<div class="tire-item item-2">
							<div class="tire-block">
								<h4>차량 전면</h4>
								<div class="tire-thumb"><img src="/img/mypage/sample/front.png"> <button type="button" class="img-zoom"></button></div>
								<div class="tire-actions">
									<div class="upload-box">
										<label for="tireImage2">사진 등록하기</label>
										<input type="file" accept="image/*"  id="tireImage2">
									</div>
								</div>
							</div>
						</div>

						<div class="tire-item item-3">
							<%--<div class="tire-block file-request"> 재 요청시  tire-block 항목에 file-request 클래스를 추가하면 됩니다. --%>
								<div class="tire-block">
								<h4>타이어 전륜(좌)</h4>
								<div class="tire-thumb"><img src="/img/mypage/sample/tire.png"> <button type="button" class="img-zoom"></button></div>
								<div class="tire-actions">
									<div class="upload-box">
										<label for="tireImage3">사진 등록하기</label>
										<input type="file" accept="image/*"  id="tireImage3">
									</div>
								</div>
							</div>
						</div>

						<div class="tire-item item-4">
							<div class="tire-block">
								<h4>타이어 전륜(우)</h4>
								<div class="tire-thumb"><img src="/img/mypage/sample/tire.png"> <button type="button" class="img-zoom"></button></div>
								<div class="tire-actions">
									<div class="upload-box">
										<label for="tireImage4">사진 등록하기</label>
										<input type="file" accept="image/*"  id="tireImage4">
									</div>
								</div>
							</div>
						</div>

						<div class="tire-item item-5">
							<div class="tire-block">
								<h4>타이어 후륜(좌)</h4>
								<div class="tire-thumb"><img src="/img/mypage/sample/tire.png"> <button type="button" class="img-zoom"></button></div>
								<div class="tire-actions">
									<div class="upload-box">
										<label for="tireImage5">사진 등록하기</label>
										<input type="file" accept="image/*"  id="tireImage5">
									</div>
								</div>
							</div>
						</div>

						<div class="tire-item item-6">
							<div class="tire-block">
								<h4>타이어 후륜(우)</h4>
								<div class="tire-thumb"><img src="/img/mypage/sample/tire.png"> <button type="button" class="img-zoom"></button></div>
								<div class="tire-actions">
									<div class="upload-box">
										<label for="tireImage6">사진 등록하기</label>
										<input type="file" accept="image/*"  id="tireImage6">
									</div>
								</div>
							</div>
						</div>

					</div>

            	</div>


          	<div class="btn-wrap">
	        	<button type="button" class="btn-primary inset-m full-width" onclick="javascript:fn_insertEarlyAbrasionSrv();">가입 등록</button>
	        </div>
		</main>

       	<form id="nonCustFrm" name="ordFrm" method="post">
			<input type="hidden" name="ordNo" value="${detailMap.ordNo}">
		</form>
	</div>
    <!-- //subContentsWrap -->



<div class="popZoomImage">
	<div class="modal-wrap">
		<div class='close-btn'>
		<a ><img src="/img/common/car_finder/close.png"></a>
		</div>
		<div class="popContents"></div>
	</div>
</div>


<script type="text/javascript">

var files = {};
var imgPicSets = ['01', '02', '03', '04', '05', '06'];

$( document ).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-worryzero'></div>");
	/* page background image End */

	//가입 및 승인 상태 체크
	var pUrl = "/mypage/freeDamageSrvCheck";
	var param = {ordNo : '${detailMap.ordNo}'};

	$.ajax({
	    url: pUrl,
	    type: "GET",
	    cache: false,
	    data: param,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	console.log(data);
	    	console.log(data.b00011UseCnt);
	    	console.log(data.registIngYn);
			//url로 호출했는데 가입 안 한 경우
	    	if(data.url == 1 && data.b00011UseCnt == -1 && data.registIngYn == "N") {
				return true;
			//url로 호출했는데 가입 승인 중인 경우
	    	}else if(data.url == 1 && data.registIngYn == "Y") { //url로 호출했는데 가입 승인 중인 경우
	    		ComUtil.alert("가입 승인 중입니다.", "", "", function(){goBack();});
	    	//url로 호출했는데 가입 완료된 경우
	    	}else if(data.url == 1 && data.b00011UseCnt >= 0){
	    		ComUtil.alert("이미 가입 되었습니다.", "", "", function(){goBack();});
	    	//url로 호출 안 한 경우
	    	}else if(data.url != 1) {
	    		return true;
	    	}

	    }
	    ,error: function (e) {
			console.log('e::', e);
			ComUtil.alert("에러발생! 관리자에 문의하시기 바랍니다.", "", "", function(){goBack();});
		}
	});

});



$(function(){
	// $(".opt-checkbox input").on("click",function(){
	// 	$(".tire-item-container .check-count").text( $(".opt-checkbox input[type=radio][value=Y]:checked").length  );
	// });

	$(".upload-box input[type=file]").on('change',function( ev1 ){
		var $img = $(ev1.target).parents(".tire-block").find('.tire-thumb img');

		if( ["image/png","image/jpeg","image/gif"].indexOf( ev1.target.files[0].type ) == -1 ){
			ev1.target.value = "";
			alert("이미지만 업로드 하실 수 있습니다.");
			return;
		}

		if(ev1.target.files[0].size >= '5242880') {  //byte단위
			alert("5MB미만인 이미지만 업로드 하실 수 있습니다.");
			return;
		}

		$(ev1.target).parents(".tire-block").removeClass('file-request');

		var file = ev1.target.files[0];
		var reader = new FileReader();

		reader.onload = function(event) {
			$img.attr('src', event.target.result);
		};

		reader.readAsDataURL(file);

	});
	$(".tire-item-container button.img-zoom").on('click',function( ev ){

		var src = $(ev.target).parents(".tire-thumb").find('img').attr('src');
		$('.popZoomImage').show();
		$(".popZoomImage .popContents").empty();
		$(".popZoomImage .popContents").append( $("<img>").attr('src',src )   );


	});
	$(document).on("click",".popZoomImage .close-btn a" , function(){
		$(".popZoomImage").hide();
	});

});

//필수값 체크 validation
function chkValidation(){

	//이미지 등록 갯수 체크
	if(Object.keys(files).length < 1) {
		ComUtil.alert("이미지 등록은 필수입니다.");
		return false;
	}

	if($('#carMileage').val() == null || $('#carMileage').val() == ""){
		ComUtil.alert("계기판 Km를 입력해주세요");
		return false;
	}

	/*
	if($('#tireImage1').val() == null || $('#tireImage1').val() == ""){
		ComUtil.alert("계기판 사진을 등록해주세요");
		return false;
	}

	if($('#tireImage2').val() == null || $('#tireImage2').val() == ""){
		ComUtil.alert("차량 전면 사진을 등록해주세요");
		return false;
	}

	if($('#tireImage3').val() == null || $('#tireImage3').val() == ""){
		ComUtil.alert("타이어 전륜(좌)사진을 등록해주세요");
		return false;
	}

	if($('#tireImage4').val() == null || $('#tireImage4').val() == ""){
		ComUtil.alert("타이어 전륜(우)을 등록해주세요");
		return false;
	}

	if($('#tireImage5').val() == null || $('#tireImage5').val() == ""){
		ComUtil.alert("타이어 후륜(좌)사진을 등록해주세요");
		return false;
	}

	if($('#tireImage6').val() == null || $('#tireImage6').val() == ""){
		ComUtil.alert("타이어 후륜(우)사진을 등록해주세요");
		return false;
	}
	*/

    return true;
}

function fn_goBack(ordNo){

	window.location.href = "/mypage/myRentalDetail?ordNo="+ordNo;
}

//무상 파손 보증& 조기마모 서비스 가입 등록하기
function fn_insertEarlyAbrasionSrv() {

    var formData = new FormData();
	var pUrl = "/mypage/insertEarlyAbrasionSrv";

	formData.append("cMileage", $('#carMileage').val());
	formData.append("agencyCd", "${detailMap.agencyCd}");
	formData.append("carNo", 	"${detailMap.carNo}");
	formData.append("ordNo",    "${detailMap.ordNo}");
	formData.append("custNm",   "${detailMap.custNm}");
	formData.append("custNo",   "${detailMap.custNo}");
	formData.append("matnr", 	"${detailMap.matCd}");
	formData.append("dlvTel",   "${detailMap.mobNo}");
	formData.append("kwmeng",   "${detailMap.cntCd1}");
	formData.append("cntCd",    "${detailMap.cntCd}");
	
	//file 담기
	for(var i=0; i<imgPicSets.length; i++) {
		if(!ValidUtil.isEmpty($('input[type=file]')[i].files[0])) {
			files[i] = $('input[type=file]')[i].files[0];

			formData.append('files', files[i]);
			formData.append('picSets', imgPicSets[i]);
		}
	}

	if(chkValidation()) {

		if(confirm("가입 등록하시겠습니까?")){
			ComUtil.loading();
			$.ajax({
			    url: pUrl,
			    type: "POST",
			    cache: false,
			    data: formData,
			    async: false,
		        processData: false,
			    contentType: false,
		        success: function(data) {
		         	if(data.urlGbn == "URL") {
		         		ComUtil.unloading();
		         		ComUtil.alert(data.returnMessage, "", "", function(){goBack();});

		        	}else if(data.urlGbn === null || data.urlGbn === "" || data.urlGbn === 'undefined') {
		        		ComUtil.unloading();
		        		ComUtil.alert(data.returnMessage, "", "", function(){fn_goBack('${detailMap.ordNo}');});

		        	}
			    },
			    error: function (e) {
					console.log('e::', e);
					ComUtil.unloading();
					ComUtil.alert("가입등록에 실패하였습니다. 관리자에 문의하시기 바랍니다.", "", "", null);
					//ComUtil.alert("가입등록에 실패하였습니다. 관리자에 문의하시기 바랍니다.", "", "", function(){fn_goBack('${detailMap.ordNo}');});
				}
			});
		}
	}
}

</script>