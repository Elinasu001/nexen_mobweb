<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil"%>
<%@ page import="com.nexwrms.core.util.SessionUtil"%>

<link rel="stylesheet" type="text/css" href="/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="/css/sizeFinder.css"/>

<style>
.popupWrap header {height: 65px; line-height: 65px;}
.popupWrap header h2 {line-height: 1px;}
</style>

	<form id="prdListFrm" name="prdListFrm" action="/product/prdList" method="post">
		<input type="hidden" name="TireSizeCd" />
		<input type="hidden" name="TireSizeNm" />
		<input type="hidden" name="sectionWidth" />
		<input type="hidden" name="aspectRatio" />
		<input type="hidden" name="wheelInches" />
		<input type="hidden" name="sectionRwWidth" />
		<input type="hidden" name="aspectRwRatio" />
		<input type="hidden" name="wheelRwInches" />
		<input type="hidden" name="tireSizeYn" />
		<input type="hidden" name="plyRating" />
		<input type="hidden" name="viewGbn" value="MC" />
		<input type="hidden" name="pageNo" value="1"/>
		<input type="hidden" name="carNo" value="" />
		<input type="hidden" name="classCd" 		/>		<!-- 치종 구분 > 승용차 / SUV -->
		<input type="hidden" name="classCdNew" 		/>		<!-- 치종 구분 > 승용차 / SUV -->
		<input type="hidden" name="makerCd" 		/>		<!-- 치종 구분 > 승용차 / SUV -->
		<input type="hidden" name="modelCd" 		/>		<!-- 치종 구분 > 승용차 / SUV -->
		<input type="hidden" name="contentsCd" 		/>		<!-- 치종 구분 > 승용차 / SUV -->
		<input type="hidden" name="carSearchParam" 	/>		<!-- 치종 구분 > 승용차 / SUV -->
		<input type="hidden" name="makerNm" 	/>
		<input type="hidden" name="modelNm" 	/>
		<input type="hidden" name="niceGradeCd" 	/>
	</form>


<div class="sizeFinder">

	<div class="modal-wrap">
		<div class='close-btn'>
		<a href="#" class="layPopClose md-close js-customMdBgClose" onclick="fn_Tipclose();"></a>
		</div>


		<div class="type-tab">
			<a data-tab='num' class="active">차량번호</a>
			<a data-tab='car'>차종</a>
			<a data-tab='size'>사이즈</a>
		</div>


		<div class="size-tab type-num step-01" >
			<div class="img-wrap noticeHid">
				<img src="/img/common/car_finder/num_car.png">
			</div>
			<div class="form noticeHid">
				<div class="form-item">
					<div class="label">차량번호</div>
					<div class="input-wrap"><input type="text" id="sizeFinderCarNumberInput" placeholder="차랑번호를 입력해주세요. 예)11차2345" onkeypress="fn_press_nice(this);" maxlength="9" onblur="javascript:validationCmmCarNo(this);"></div>
				</div>
				<div class="form-item">
					<div class="label">소유주명</div>
					<div class="input-wrap"><input type="text" id="sizeFinderCarNameInput" maxlength="30"></div>
				</div>
			</div>
			<!-- 20221128 유의사항 문구 임시 추가 -->
			<div style="margin-bottom:30px; padding-left:20px;">
				<span style="text-align:left; font-size:12px;">※ 영업용 차량 또는 특수목적 차량의 경우, 조회가 안될 수 있습니다.</br>차종 또는 사이즈로 찾기 메뉴로 이용 부탁드립니다.</span>
			</div>
			<div class="agreement noticeHid">
				<div class="agreement-item">
					<span class="label">개인정보 수집 및 이용<span class="red">(필수)</span></span>
					<a href="javascript:policyLayPopOpen('modal-privacyPolicy');">view</a>
				</div>
				<div class="agreement-item">
					<span class="label">개인정보 처리업무 위탁 동의<span class="red">(필수)</span></span>
					<a href="javascript:policyLayPopOpen('modal-consignment');">view</a>
				</div>
			</div>
		
			<div class='btn-wrap noticeHid'>
				<a id="findSizeNumCheck">약관 동의 및 확인</a>
			</div>
			
			<!-- 긴급 공지 -->
			<div id="noticeDiv" style="display:none;">
				<p style="text-align:center; line-height:25px; word-spacing:5px; font-size:1.0em;">
					<br>
					<b>
					[공지]<br>
					<br>
					자동차 대국민포털의 점검으로 인하여<br>
					아래 기간 동안 차량번호 찾기 <br>서비스가 불가하오니,<br>
					차종으로 찾기 또는 사이즈로 찾기를 이용해 주시기 바랍니다.<br>
					<br>
<!-- 					점검 내용 : 정부24의 시스템 점검<br> -->
					점검 내용 : 정부24 및 자동차민원 대국민포털의 정기 작업<br>
					<br>
					</b>
				</p>
				<p style="text-align:left; line-height:25px; word-spacing:5px; padding-left:50px; font-size:1.0em;">
					<b>
					- 1차  2022-04-30 00:00 ~ <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2022-05-01 00:00 (예정)<br>
<!-- 					- 2차  2021-10-16 22:00 ~ <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021-10-17 07:00 (예정)<br> -->
					<br>
					</b>
				</p>
				<p style="text-align:center; line-height:25px; word-spacing:5px; font-size:1.0em;">
					<b>불편을 드려 대단히 죄송합니다.</b>
				</p>
			</div>
			<!-- //긴급 공지 -->
		</div>
		
		<div class="size-tab type-num step-02" >

			<div class="car-info">
				<div class="car-text">
					<div class='car-name'>BMW 3시리즈 320d</div>
					<div class='car-year'> <label>출고연도 : </label> <span>2017년</span></div>
					<div class='car-grade'><label>세부등급 : </label> <select class="small wide grade" onchange="javascript:selectChoiceSizeList();" id='carGradeList'><option>전체</option><option>1</option></select></div>
				</div>
				<div class="img-wrap">
					<img src="/img/common/car_finder/car_resutl_sample.png">
				</div>
			</div>


			<ul class='choice-size'></ul>

			<div class="desc">
				※ 차량 출고 시 타이어 옵션 변경 또는 출고 후 휠 인치 업 등으로 검색 결과와 사이즈가 다른 경우가 있으니, 실제 장착 된 타이어 사이즈를 확인해 주세요.
			</div>

			<div class="tip-wrap">
				<button type="button" class="size-check-tip" data-modal="tireSizeTip">
            			<span>Tip!</span>
            			<span>사이즈 확인</span>
          		</button>
			</div>


			<div class="btn-wrap">
				<a id='findSizeNumRetry' class="retry" >다시선택</a>
				<a id='findSizeNumSubmit' class="submit" >확인</a>
			</div>
		</div>


		
		
		
		
		<div class="size-tab type-car step-01" >
		
			<div class="select-car-step">
				<!--  스크립트 참조 -->
			</div>
			<ul class="item-list">
				<!--  스크립트 참조 -->
			</ul>
		</div>

		<div class="size-tab type-car step-02" >
			<!-- <div class="select-car-step"></div> -->
			
			<div class="car-info">

				<div class="car-name">
					<!--  스크립트 참조 -->
				</div>
				<div class="car-detail">
					<div>
						<label>출고연도 : </label><span class="info-year"><select class="small wide grade" onchange="javascript:selectChoiceGradeSizeList();"><option>전체</option></select></span>
					</div>
					<div>
						<label>세부등급 : </label><span class="info-grade"><select class="small wide grade" onchange="javascript:selectChoiceSizeList();"><option>전체</option></select></span>
					</div>
				</div>

				<div class="car-img" style="text-align: center;">
					<img src="/img/common/car_finder/car_resutl_sample.png"> <!--  스크립트 참조 -->
				</div>

			</div>
			<ul class="choice-size">
				<!--  스크립트 참조 -->
			</ul>
			<div class="desc">
				※ 차량 출고 시 타이어 옵션 변경 또는 출고 후 휠 인치 업 등으로 검색 결과와 사이즈가 다른 경우가 있으니, 실제 장착 된 타이어 사이즈를 확인해 주세요.
			</div>

			<div class="tip-wrap">
				<button type="button" class="size-check-tip" data-modal="tireSizeTip">
            			<span>Tip!</span>
            			<span>사이즈 확인</span>
          		</button>
			</div>

			<div class="btn-wrap">
				<a id='findSizeCarRetry' class="retry" >다시선택</a>
				<a id='findSizeCarSubmit' class="submit" >확인</a>
			</div>
		</div>

	
		
		<div class="size-tab type-size step-01" >

			
			<div class="img-wrap">
				<img src="/img/common/car_finder/size_header.jpg">
			</div>

			<div class="size-step-front">
			</div>
			<div class="size-step">
				<div class="step-item active"><span>단면폭</span></div>
				<div class="step-item"><span>평편비</span></div>
				<div class="step-item"><span>인치</span></div>
			</div>
			<ul class="item-list">
			</ul>

		</div>

		<div class="size-tab type-size step-02" >
			<div class="img-wrap">
				<img src="/img/common/car_finder/size_header.jpg">
			</div>

			<div class="result-size">
				<!-- 225/55R19 -->
			</div>
			<div class="desc">
				※ 후륜 타이어 사이즈가 다른 경우<br/> ‘후륜 타이어 추가’ 버튼을 눌러주세요.
			</div>

			<div class="btn-wrap">
				<a id='findCarSizeRetry' class="retry" >다시선택</a>
				<a id='findCarSizeSubmit' class="submit" >확인</a>
				<a id='findCarSizeAddRear' class="addrear" >후륜 타이어 추가</a>
			</div>
		</div>
		<div class="size-tab type-size step-03" >
			<div class="img-wrap">
				<img src="/img/common/car_finder/size_header.jpg">
			</div>

			<div class="result-size">
				<!-- <div class="size-item front">225/55R18</div>
				<div class="size-item rear">225/55R18</div> -->
			</div>

			<div class="btn-wrap">
				<a id='findCarSizeRetry2' class="retry" >다시선택</a>
				<a id='findCarSizeSubmit2' class="submit" >확인</a>
			</div>
		</div>


	</div>
</div>

<script type="text/javascript">
var loginId = "${loginId}";

function chgDateToStr(date) {
	var year = date.getFullYear();              //yyyy
	var month = (1 + date.getMonth());          //M
	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	var day = date.getDate();                   //d
	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}

$( document ).ready(function() {
	var today = new Date();
	var fstChkStartDay = "20220430";
	var fstChkEndDay = "20220501";
// 	var secChkStartDay = "20211016";
// 	var secChkEndDay = "20211017";
	
	if(chgDateToStr(today) >= fstChkStartDay && chgDateToStr(today) <= fstChkEndDay) {
		var todayHours = today.getHours();
		if(chgDateToStr(today) == fstChkStartDay) {//20210430 
			if(todayHours >= '00') {
				$(".noticeHid").hide();
				$("#noticeDiv").show();
			}
		} else if(chgDateToStr(today) == fstChkEndDay) {//20210501
			if(todayHours < '00') {
				$(".noticeHid").hide();
				$("#noticeDiv").show();
			}
		} else {//20201107
			$(".noticeHid").hide();
			$("#noticeDiv").show();
		}
// 	} else if(chgDateToStr(today) >= secChkStartDay && chgDateToStr(today) <= secChkEndDay) {
// 		var todayHours = today.getHours();
// 		if(chgDateToStr(today) == secChkStartDay) {//20210320 
// 			if(todayHours >= '22') {
// 				$(".noticeHid").hide();
// 				$("#noticeDiv").show();
// 			}
// 		} else if(chgDateToStr(today) == secChkEndDay) {//20210321
// 			if(todayHours < '07') {
// 				$(".noticeHid").hide();
// 				$("#noticeDiv").show();
// 			}
// 		} else {//20201114
// 			$(".noticeHid").hide();
// 			$("#noticeDiv").show();
// 		}
	}
});

function fn_Tipclose() {
	$("#sizeCheckTip").fadeOut();
}

</script>

<div class="popupWrap md-modal md-effect-1 md-close" id="sizeCheckTip" style="z-index: 5000; border-radius: 20px;display:none;">
	<div class="popContents popup-tip">
		<a href="#" class="layPopClose md-close js-customMdBgClose" onclick="fn_Tipclose();"></a>
			<header>
				<div class="popup-tip-tag">Tip!</div>
				<h2>타이어의 사이즈 확인</h2>
			</header>

			<div>
				<p class="mt-m"><b>장착할 차량의 타이어 옆면에 있는 숫자가 타이어 사이즈 입니다.</b></p>
				<small>※ 같은 차종이라도 등급에 따라 타이어 사이즈가 다른 경우가 있습니다.</small>
				<div class="mt-m">
					<img src="/img/product/tip_tire_size_check.png" alt="">
				</div>
			</div>
	</div>
</div>

<script type="text/javascript" src="/js/sizeFinder.js"></script>

<script src="/js/lib/jquery.nice-select.min.js"></script>



