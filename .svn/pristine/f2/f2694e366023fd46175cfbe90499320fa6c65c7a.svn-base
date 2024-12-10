<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="/css/OverlayScrollbars.css">	
<script type="text/javascript" src="/js/order.js"></script>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>


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

          <div class="order-middle-message text-center">
            <p>고객님이 남겨주신 주문후기는 다른 고객분들께 큰 힘이 됩니다. </p>
            <div class="order-info-summary">
              <small>따뜻한 마음으로 소중한 주문후기를 작성해주세요.</small>
            </div>
          </div>
		  <form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
          <div class="mynexen-review">
            <p><label for="target-product" class="black">대상 제품</label></p>
            <div class="border-bottom">
              <input id="target-product" name="target-product" type="text" value="${review.patternCd}" class="pl-0 type03 trans-bg" readonly="readonly">
            </div>
            <p class="mt-m"><label id="review-title" class="essen black">제목</label></p>
            <div class="border-bottom">
              <input name="review-title" type="text" id="tit01" name="tit01" value="${review.title}" class="pl-0 type03 trans-bg" placeholder="제목을 입력해주세요" onkeyup="document.getElementById('tit01').innerHTML=fn_chkByte(this,100);">
            </div>
            <!-- if문 동현 수정 -->
            <p class="mt-m essen black">상품 만족도</p>
            <div class="inline-block">
           	 <div class="star-rating">
               	<input type="radio" id="star5" <c:if test="${review.grdPt1 == 5}">checked="checked"</c:if>name="rate01" value="5" /><label for="star5" title="Outstanding" >5 stars</label>
               	<input type="radio" id="star4" <c:if test="${review.grdPt1 == 4}">checked="checked"</c:if>name="rate01" value="4" /><label for="star4" title="Very Good">4 stars</label>
               	<input type="radio" id="star3" <c:if test="${review.grdPt1 == 3}">checked="checked"</c:if>name="rate01" value="3" /><label for="star3" title="Good">3 stars</label>
               	<input type="radio" id="star2" <c:if test="${review.grdPt1 == 2}">checked="checked"</c:if>name="rate01" value="2" /><label for="star2" title="Poor">2 stars</label>
               	<input type="radio" id="star1" <c:if test="${review.grdPt1 == 1}">checked="checked"</c:if>name="rate01" value="1" /><label for="star1" title="Very Poor">1 star</label>              
           	 </div>
            </div>
           	<p class="mt-m essen black">기사 만족도</p>
           	<div class="inline-block">
            <div class="star-rating">
                <input type="radio" id="star15" <c:if test="${review.grdPt2 == 5}">checked="checked"</c:if> name="rate02" value="5" /><label for="star15" title="Outstanding">5 stars</label>
                <input type="radio" id="star14" <c:if test="${review.grdPt2 == 4}">checked="checked"</c:if> name="rate02" value="4" /><label for="star14" title="Very Good">4 stars</label>
                <input type="radio" id="star13" <c:if test="${review.grdPt2 == 3}">checked="checked"</c:if> name="rate02" value="3" /><label for="star13" title="Good">3 stars</label>
                <input type="radio" id="star12" <c:if test="${review.grdPt2 == 2}">checked="checked"</c:if> name="rate02" value="2" /><label for="star12" title="Poor">2 stars</label>
                <input type="radio" id="star11" <c:if test="${review.grdPt2 == 1}">checked="checked"</c:if> name="rate02" value="1" /><label for="star11" title="Very Poor">1 star</label>
            </div>
            </div>
           	<p class="mt-m essen black">서비스 만족도</p>
           	<div class="inline-block">
            <div class="star-rating">
                <input type="radio" id="star25" <c:if test="${review.grdPt3 == 5}">checked="checked"</c:if> name="rate03" value="5" /><label for="star25" title="Outstanding">5 stars</label>
                <input type="radio" id="star24" <c:if test="${review.grdPt3 == 4}">checked="checked"</c:if> name="rate03" value="4" /><label for="star24" title="Very Good">4 stars</label>
                <input type="radio" id="star23" <c:if test="${review.grdPt3 == 3}">checked="checked"</c:if> name="rate03" value="3" /><label for="star23" title="Good">3 stars</label>
                <input type="radio" id="star22" <c:if test="${review.grdPt3 == 2}">checked="checked"</c:if> name="rate03" value="2" /><label for="star22" title="Poor">2 stars</label>
                <input type="radio" id="star21" <c:if test="${review.grdPt3 == 1}">checked="checked"</c:if> name="rate03" value="1" /><label for="star21" title="Very Poor">1 star</label>
             </div>
            </div>
            <p class="mt-m"><label id="review-box" class="essen black">내용</label></p>
            <div class="text-right border-bottom">
              <textarea id="textArea" name="textArea"  placeholder="내용을 입력해주세요" onkeyup="document.getElementById('messagebyte').innerHTML=fn_chkByte(this,2000);">${review.rCont}</textarea>
              <small class="font-gray" id="messagebyte">0</small><small>/2000 Byte</small>
            </div>
            <p class="mt-m essen black">첨부이미지</p>
            
			<div class="upload-images"> 
					<div class="imgUpBlock <c:if test="${fn:length(reviewAtfl[0].atflUrl) > 0}">on</c:if>"> 
						<label for="fileUp01">
							<input id="fileUp01" name="fileUp01" class="" type="file" name="files" value="" accept=".jpg, .png, image/jpeg, image/png" multiple onchange="readURL(this);" >
						</label>
						<div class="thumb " id="thumb_fileUp01">
							<c:if test="${fn:length(reviewAtfl[0].atflUrl) > 0}">
								<input type="hidden" name="fileYn" id="yn_fileUp01" value="${reviewAtfl[0].atflNo}"/>
								<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${reviewAtfl[0].atflUrl}"/>
							</c:if>
							<c:if test="${fn:length(reviewAtfl[0].atflUrl) < 1}">
								<img src="/img/mypage/upload_holder.gif"/>
								<input type="hidden" name="fileYn" id="yn_fileUp01" value=""/>
							</c:if>
							<div class="remove-btn"></div>
						</div>
					</div>
					<div class="imgUpBlock <c:if test="${fn:length(reviewAtfl[1].atflUrl) > 0}">on</c:if>"> 
						<label for="fileUp02">
							<input id="fileUp02" name="fileUp02" class="" type="file" name="files" value="" accept=".jpg, .png, image/jpeg, image/png" multiple onchange="readURL(this);" >
						</label>
						<div class="thumb " id="thumb_fileUp02">
							<c:if test="${fn:length(reviewAtfl[1].atflUrl) > 0}">
								<input type="hidden" name="fileYn" id="yn_fileUp02" value="${reviewAtfl[1].atflNo}"/>
								<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${reviewAtfl[1].atflUrl}"/>
							</c:if>
							<c:if test="${fn:length(reviewAtfl[1].atflUrl) < 1}">
								<img src="/img/mypage/upload_holder.gif"/>
								<input type="hidden" name="fileYn" id="yn_fileUp02" value=""/>
							</c:if>
							<div class="remove-btn"></div>
						</div>
					</div>
					<div class="imgUpBlock <c:if test="${fn:length(reviewAtfl[2].atflUrl) > 0}">on</c:if>"> 
						<label for="fileUp03">
							<input id="fileUp03" name="fileUp03" class="" type="file" name="files" value="" accept=".jpg, .png, image/jpeg, image/png" multiple onchange="readURL(this);" >
						</label>
						<div class="thumb " id="thumb_fileUp03">
							<c:if test="${fn:length(reviewAtfl[2].atflUrl) > 0}">
								<input type="hidden" name="fileYn" id="yn_fileUp03" value="${reviewAtfl[2].atflNo}"/>
								<img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_URL)%>${reviewAtfl[2].atflUrl}"/>
							</c:if>
							<c:if test="${fn:length(reviewAtfl[2].atflUrl) < 1}">
								<input type="hidden" name="fileYn" id="yn_fileUp03" value=""/>
								<img src="/img/mypage/upload_holder.gif"/>
							</c:if>
							<div class="remove-btn"></div>
						</div>
					</div>
					</div>
					<div class="upload-desc">
						※ 이미지는 각 3MB, 최대 3장까지 업로드 가능합니다.
					</div>


				<p class="mt-m essen black"  style="display: none">첨부영상</p>


				<div class="videoUpBlock"  style="display: none">
					<input type="text" id="text_videoUp01" readonly >
					<label for="videoUp01">찾아보기</label>
					<input id="videoUp01" name="videoUp01" class="" type="file" name="files" value="" accept=".mp4" multiple onchange="videoUp(this);" >
				</div>

				<div class="upload-desc"  style="display: none">
					※ 영상 파일은 최대 128MB까지 업로드 가능 합니다.
				</div>
					
          </div>
          <div class="inset-ml border-top">
            <small class="font-gray">※ 상품 및 주문과 관계없는 글(광고성, 양도, 욕설, 비방, 도배) 불법 이미지/사진 등은 예고없이 삭제되며, 경우에 따라 고발 또는 쇼핑몰 이용제한을 받을 수 있습니다.</small>
          </div>
          <div class="btn-wrap layout-r same-size">
            <button type="button" onclick="javascript:fn_goBack();" class="inset-m full-width btn-gray-light">취소</button>
            <button type="button" onclick="javascript:fn_update();" class="inset-m full-width btn-primary">등록</button>
          </div>
        </main>
      </div>
		<input type="hidden" name="usePsNo"  		id="usePsNo" 		value="${review.usePsNo}"/> <!-- 구매후기 키 -->
		<input type="hidden" name="bdojSeq" 		id="bdojSeq" 		value="${review.bdojSeq}"/>  <!-- 렌탈후기 키 -->
		<input type="hidden" name="brdDivCd" 		id="brdDivCd" 		value="2"/>  <!-- 렌탈후기구분키 -->
		<input type="hidden" name="ordNo" 			id="ordNo" 			value="${review.ordNo}"/>  
		<input type="hidden" name="dpNo" 			id="dpNo" 			value="${review.dpNo}"/>  
		<input type="hidden" name="patternCd" 		id="patternCd"		value="${review.patternCd}"/>
		<input type="hidden" name="systemGbn" 		id="systemGbn" 		value="${reviewGbn}"/>
		<input type="hidden" name="classNm"  		id="classNm" 		value="${classNm}"/>  
		<input type="hidden" name="dispSize"  		id="dispSize" 		value="${dispSize}"/>  
		<input type="hidden" name="itemCd" 			id="itemCd"			value="${review.itemCd}"/> <!-- 동현 추가 -->
      </form>
      <!-- //subContentsWrap -->







<div class="reviewFullPopup md-effect-1" id="modalPhotoView">
	<header>
		<a href="javascript:;" onclick="closePhotoView();" class="layPopClose"></a>
	</header>
	<div class="modal-body">
	</div>

</div>

<script type="text/javascript">

var fileData01 = "";
var systemGbn = '${reviewGbn}'
var dispSize = '${dispSize}';

var frm = document.frm;
frm.dispSize.value = dispSize;

	function fn_chkByte(inTexts, textMax){
	
	var lsStr = inTexts.value; 
	var liStrLen = lsStr.length; 		//전체길이
	
	//변수초기화
	var liMax = textMax; 				//제한할 글자수 크기
	var liByte = 0;   					//한글일경우 2, 그외글자는 1을 더함
	var liLen = 0;    					// substring하기 위해 사용
	var lsOneChar = "";  				//한글자씩 검사
	var lsStr2 = "";      				//글자수를 초과하면 제한한 글자전까지만 보여줌.
	
	for(i=0; i< liStrLen; i++){
		lsOneChar = lsStr.charAt(i); //한글자 추출
		
		if(escape(lsOneChar).length > 4){ 
			liByte +=2;   				//한글이면 2를 더한다
		}else{
			liByte++;     				//한글아니면 1을 다한다
		}
		  
		if(liByte <= liMax){
			liLen = i + 1;
		}
	}
	
	if(liByte > liMax){
		lsStr2 = lsStr.substr(0, liLen);
		inTexts.value = lsStr2;
	}
	
	return liByte+"Byte";
}


$(document).ready(function() {
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-review'></div>");
	/* page background image End */
});

function fn_goBack(){
	var frm = document.frm;
		frm.enctype = "";
		frm.encode = "";
		frm.classNm.value = $("#classNm").val();
		frm.dispSize.value = dispSize;
		frm.action = "/mypage/orderRivewView";
		frm.submit();
}

function readURL(input) {
	if(input.files && input.files[0]) {
		if(chkAttFileExt(input.files[0].name)) {
			var reader = new FileReader();
            reader.onload = function(e) {
            	$('#fileUp02').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
            fileData01 = input.files[0];
            $("#imgFileNm").text(input.files[0].name);
		} else {
			alert("첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.");
		}
    }
}

//파일 업로드에서 이미지 파일만 올리기 (jpg,png,gif,pdf,bmp)
function chkAttFileExt(imgNm){
	var thumbext = imgNm;
	thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

	if(thumbext != "jpg" && thumbext != "png" && thumbext != "gif" 
			&& thumbext != "pdf" && thumbext != "bmp" && thumbext != "jpeg") {
		return false;
	}
    return true;
}

//필수값 체크 validation
function chkValidation(){
	
	if($("#tit01").val() === "" || $("#tit01").val() === null) {
		alert("제목을 입력해주세요.");
		return false;
	}
	
	var manjok1 = $(':radio[name="rate01"]:checked').val();
	var manjok2 = $(':radio[name="rate02"]:checked').val();
	var manjok3 = $(':radio[name="rate03"]:checked').val();

	if(ValidUtil.isEmpty(manjok1)){
		alert("상품 만족도를 선택해 주세요.");
		return false;		
	}
	
	if(ValidUtil.isEmpty(manjok2)){
		alert("기사 만족도를 선택해 주세요.");
		return false;		
	}
	
	if(ValidUtil.isEmpty(manjok3)){
		alert("서비스 만족도를 선택해 주세요.");
		return false;		
	}
	
	if($("#textArea").val() === "" || $("#textArea").val() === null) {
		alert("내용을 입력해주세요.");
		return false;
	}
	
    return true;
}


function fn_update(){
	var files = {};
	if(chkValidation()) {
		
		if(confirm("수정하시겠습니까?")) {
			ComUtil.loading();
			var form = $('#frm')[0];
	        //FormData parameter에 담아줌
	        var fParam = new FormData();
	        var urlT = "";
	    
	        fParam.append("title", $("#tit01").val());
	        fParam.append("cont", $("#textArea").val());
	        fParam.append("patternCd", '${review.patternCd}');
	        fParam.append("itemCd", '${review.itemCd}'); // 동현 추가
	        fParam.append("manjok1", $("input:radio[name=rate01]:checked").val());
        	fParam.append("manjok2", $("input:radio[name=rate02]:checked").val());
            fParam.append("manjok3", $("input:radio[name=rate03]:checked").val());
	        
	        
	        if(systemGbn == 'R'){
	        	urlT = "/mypage/insertRentReview";
	        	
	        	//fParam.append("bdojSeq",$("#bdojSeq").val());
	        	fParam.append("updateGbn","Y");
	            fParam.append("ordNo", $("#ordNo").val());
	            fParam.append("dpPrNo", $("#dpNo").val());
	            fParam.append("usePsNo", $("#usePsNo").val());
	            fParam.append("classNm", $("#classNm").val());
	            fParam.append("dispSize", dispSize);
	            
	        }else if(systemGbn == 'O'){
	        	urlT = "/mypage/insertO2oReview";
	        	
	            fParam.append("ordNo", $("#ordNo").val());
	            fParam.append("dpPrNo", $("#dpNo").val());
	            fParam.append("usePsNo", $("#usePsNo").val());
	            
	            fParam.append("classNm", $("#classNm").val());
	            fParam.append("dispSize", dispSize);
	            
	            fParam.append("updateGbn","Y");
	        }
	    
// 	        if(fileData01 !== "" && fileData01 !== null) {
// 	        	fParam.append("bizFiles", fileData01);
// 	        }

			//file 담기
			for(var i=0; i<$('input[type=file]').length; i++) {
				if(!ValidUtil.isEmpty($('input[type=file]')[i].files[0])) {
					files[i] = $('input[type=file]')[i].files[0];
					fParam.append('bizFiles', files[i]);
					$('#yn_fileUp0'+(i+1)).attr('value','I_'+$('#yn_fileUp0'+(i+1)).val());
				}
				fParam.append('fileYn', $('#yn_fileUp0' + (i+1)).val());
			}
        
			$.ajax({
			    url: urlT,
			    type: "POST",
			    cache: false,
			    data: fParam,
			    processData: false,
	            contentType: false,
			    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
			    success: function(data) {
			    	if(data.rtnCode == "0") {
			    		var frm = document.frm;
			    		frm.enctype = "";
			    		frm.encode = "";
			    		frm.dispSize.value = dispSize;
			    		frm.classNm.value = $("#classNm").val();
						frm.action = "/mypage/orderRivewView";
						frm.submit();				
			    	} else {
			    		alert("관리자에게 문의하세요.");
			    		ComUtil.unloading();
			    	}
			    },
			    error: function (request, status, error) {
			    	alert(error);
			    	ComUtil.unloading();
				}
			});
		}
	}
}

 $( document ).ready(function() {
	$(".upload-images .imgUpBlock .thumb").on('click',function(){
		var up_blokc_id = $(this).attr('id').replace('thumb_','');
		var block = $(this).parents('.imgUpBlock');

		var img_src = $('img',this).attr('src');
		$("#modalPhotoView").show();
		$("#modalPhotoView .modal-body").html( $("<img>").attr('src', img_src ) );
	});
	$(".upload-images .imgUpBlock .remove-btn").on('click',function( e ){
		var up_blokc_id = $(this).parents('.thumb').attr('id').replace('thumb_','');
		var block = $(this).parents('.imgUpBlock');

		$("input[type=file]",block).val('');
		$('#thumb_'+up_blokc_id+' img').attr('src','');
// 		$('#thumb_'+up_blokc_id+' img').css('left', '0px');
// 		$('#thumb_'+up_blokc_id+' img').css('top', '0px');
// 		$('#thumb_'+up_blokc_id+' img').css('width', 'auto');
// 		$('#thumb_'+up_blokc_id+' img').css('height', 'auto');
		$('#thumb_'+up_blokc_id+' img').attr('src','/img/mypage/upload_holder.gif');
		$('#yn_'+up_blokc_id).attr('value','D_'+$('#yn_'+up_blokc_id).val());
		$(block).removeClass('on');
		e.stopPropagation();

	});
});

function closePhotoView(){
	$("#modalPhotoView").hide();
}

 function videoUp(input) {
	if(input.files && input.files[0]) {
		if(chkAttVideoExt(input.files[0].name)) {

			var input_name = $(input).attr('name');
            $("#text_"+input_name ).val(input.files[0].name);

		} else {

			alert("파일 업로드시 영상파일(mp4) 파일만 가능합니다.");

		}
    }
}


function readURL(input) {

	// console.log(input);
	if(input.files && input.files[0]) {
		if(chkAttFileExt(input.files[0].name)) {
			var reader = new FileReader();
            reader.onload = function(e) {

				const img = new Image();
				img.onload = function() {
					console.log(this.width + 'x' + this.height);

					var t_width = 0;
					var t_height = 0;
					var rate = 1;
					var offset_x = 0;
					var offset_y = 0;
					if( this.width <= this.height ){
						rate = 90/this.width;
						t_width = this.width * rate;
						t_height = this.height * rate;
						
						offset_x = 1;
						offset_y = ( ( t_height / 2 ) - 45 ) * -1;


					}else{
						rate = 90/this.height;
						t_width = this.width * rate;
						t_height = this.height * rate;


						offset_x = ( ( t_width / 2 ) - 45 ) * -1;
						offset_y = 0;

					}
					
					
					var input_name = $(input).attr('name');
					$('#thumb_'+input_name+' img').attr('src', e.target.result);
// 					$('#thumb_'+input_name+' img').css('left', offset_x+'px');
// 					$('#thumb_'+input_name+' img').css('top', offset_y+'px');
// 					$('#thumb_'+input_name+' img').css('width', t_width+'px');
// 					$('#thumb_'+input_name+' img').css('height', t_height+'px');
					$('#thumb_'+input_name+'').parents('.imgUpBlock').addClass('on');

				}

				img.src = e.target.result;

				// console.log(input_name);


            }
            reader.readAsDataURL(input.files[0]);
            // fileData01 = input.files[0];
            // $("#imgFileNm").text(input.files[0].name);
		} else {
			alert("첨부파일은 이미지(jpg, png, gif, pdf, bmp) 파일만 가능합니다.");
		}
    }
}

</script>