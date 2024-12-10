<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil"%>
<%@ page import="com.nexwrms.core.util.SessionUtil"%>

<link rel="stylesheet" type="text/css" href="/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="/css/sizeFinder.css"/>
<style>
div.modalTitle {
  margin-bottom: 0.5%;
}

div.modalTitle img {
  width: 100%;
}

div.modalLogo {
  margin-top: 3%;
}

div.modalLogo img.nexenLogo {
  width: 15%;
  float: left;
}

div.modalLogo img.emartLogo {
  width: 15%;
  float: right;
}
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
	    <div class="modalTitle">
	        <img src="/img/emart/title.bmp">
	    </div>
		<div class="type-tab">
			<a data-tab='num' class="active">차량번호</a>
			<a data-tab='car'>차종</a>
			<a data-tab='size'>사이즈</a>
		</div>

		<div class="size-tab type-num step-01">
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
		</div>
		
		<div class="size-tab type-num step-02" >

			<div class="car-info">
				<div class="car-text">
					<div class='car-name'>BMW 3시리즈 320d</div>
					<div class='car-year'> <label>모델연도 : </label> <span>2017년</span></div>
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
				<a id="findSizeNumRetryChk" data-clipboard-text="" class="retry" style="margin: 10px auto 10px auto;">품목확인</a>
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
			<div class="car-info">
				<div class="car-name">
					<!--  스크립트 참조 -->
				</div>
				<div class="car-detail">
					<div>
						<label>모델연도 : </label><span class="info-year"><select class="small wide grade" onchange="javascript:selectChoiceGradeSizeList();"><option>전체</option></select></span>
					</div>
					<div>
						<label>세부등급 : </label><span class="info-grade"><select class="small wide grade" onchange="javascript:selectChoiceSizeList();"><option>전체</option></select></span>
					</div>
				</div>

				<div class="car-img">
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
				<a id='findSizeCarChk' class="retry" style="margin: 10px auto 10px auto;">품목확인</a>
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
				<a id="findCarSizeChk" class="retry" style="margin: 10px auto 10px auto;">품목확인</a>
				<a id='findCarSizeAddRear' class="addrear" >후륜 타이어 추가</a>
			</div>
		</div>
		<div class="size-tab type-size step-03" >
			<div class="img-wrap">
				<img src="/img/common/car_finder/size_header.jpg">
			</div>

			<div class="result-size">
			</div>

			<div class="btn-wrap">
				<a id='findCarSizeRetry2' class="retry" >다시선택</a>
				<a id="findCarSizeChk2" data-clipboard-text="" class="submit" style="margin: 10px auto 10px auto;">품목확인</a>
			</div>
		</div>
		<!-- 로고 이미지 추가 -->
        <div class="modalLogo">
            <img class="nexenLogo" src="/img/emart/nexen_logo.bmp">
            <img class="emartLogo" src="/img/emart/emart_logo.bmp">
        </div>
	</div>
</div>
		
<div id="loadingWrap2"></div>

<script type="text/javascript">
$(document).ready(function() {
	var tab;
	if( tab == '' || tab == null  ) tab = 'num';
	
	screen_change(  tab , '1' );
	
	$('.sizeFinder .type-tab a').removeClass('active');
	$(".sizeFinder .type-tab a[data-tab="+tab+"]").addClass('active');
	
	$('.sizeFinder').show();
	$('.allMenuClose').click();//전체메뉴 닫기
});

//약관팝업열기
function policyLayPopOpen(id){
	console.log("policyLayPopOpen 1 : " + id);
	$("#"+id).addClass("md-show");
	$("#"+id).show();
}

//팝업 닫기
function policyLayPopClose(id){
	$("#"+id).removeClass("md-show");
}

//품목별 판매카드 색상
var cardImgArray = {
		'12098NX'   : 'red',
		'12108NX'   : 'red',
		'15395NXUA' : 'orange',
		'13466NXUA' : 'yellow',
		'16938NXUA' : 'navy',
		'14324NXUA' : 'navy',
		'12993NXUA' : 'blue',
		'14749NXUA' : 'blue',
		'14198NXUA' : 'navy',
		'14694NX'   : 'green',
		'17042NXUA' : 'purple',
		'15348NXUA' : 'purple',
		'17045NXUA' : 'grey',
		'15349NX'   : 'purple',
		'15351NX'   : 'purple',
		'17051NXUA' : 'black',
		'16583NXUA' : 'grey',
		'17142NXUA' : 'black'
};

$("#findCarSizeChk").on('click',function(){
	var fwdArry = size_search.getSizeStr('F'); // 전륜
	var rwdArry = size_search.setMode == 'R' ? size_search.getSizeStr('R') : size_search.getSizeStr('F'); // 후륜
	
	var wheelInches = fwdArry.split("R");
	var sectionWidth = fwdArry.split("/");
	var aspectRatio = wheelInches[0].split("/");
	
	var result = ''; 

	var param = { 
		  wheelInches : wheelInches[1]
		, sectionWidth : sectionWidth[0]
		, aspectRatio : aspectRatio[1]
	};
		
	$.ajax({ 
		url: "/product/selectEmartItemListNew",
		type: "POST",
		cache:false,
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(param),
		success: function(data) {
			$.each(data, function (index, item) {
				//console.dir(item);
				
				result = '<img src="/img/emart/voucher_'+cardImgArray[item.itemCd]+'.bmp"><br/>';
				result += '이마트 넥센타이어 판매규격입니다.<br/>매대에서 해당 색상 카드를 픽업해주세요.'; 
			})
			
			if(result == '') {
				result = '이마트 넥센타이어 판매규격이 아닙니다.';
			}
			ComUtil.alert(result);
		},
		error: function (request, status, error) {
			ComUtil.alert("code:"+request.status+"\n"+"error:"+error);
		}
	});
});

$("#findCarSizeChk2").on('click',function(){
	var fwdArry = size_search.getSizeStr('F'); // 전륜
	var rwdArry = size_search.setMode == 'R' ? size_search.getSizeStr('R') : size_search.getSizeStr('F'); // 후륜
	
	var wheelInches = rwdArry.split("R");
	var sectionWidth = rwdArry.split("/");
	var aspectRatio = wheelInches[0].split("/");
	
	var result = ''; 

	var param = { 
		  wheelInches : wheelInches[1]
		, sectionWidth : sectionWidth[0]
		, aspectRatio : aspectRatio[1]
	};
	
	$.ajax({ 
		url: "/product/selectEmartItemListNew",
		type: "POST",
		cache:false,
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(param),
		success: function(data) {
			$.each(data, function (index, item) { 
				result = '<img src="/img/emart/voucher_'+cardImgArray[item.itemCd]+'.bmp"><br/>';
				result += '이마트 넥센타이어 판매규격입니다.<br/>매대에서 해당 색상 카드를 픽업해주세요.'; 
			})
			
			if(result == '') {
				result = '이마트 넥센타이어 판매규격이 아닙니다.';
			}
			ComUtil.alert(result);
		},
		error: function (request, status, error) {
			ComUtil.alert("code:"+request.status+"\n"+"error:"+error);
		}
	});
});

$("#findSizeCarChk").on('click',function(){
	var split = [];
	var dataArry = $(".size-tab.type-car.step-02 .choice-size .active").data('code').split('|');
	var fwdArry = dataArry[1]; // 전륜
	var selSizeArr1 = fwdArry.split('/');
	var selSizeArr2 = selSizeArr1[1].split('R');
	//후륜 로직 추가 
	var rwdArry = dataArry[2]; // 후륜
	var selRwdSizeArr1 = rwdArry.split('/');
	var selRwdSizeArr2 = selRwdSizeArr1[1].split('R');
	
	var param = { 
		  sectionWidth : selSizeArr1[0]
		, aspectRatio : selSizeArr2[0]
		, wheelInches : selSizeArr2[1]
	};
	
	var result = '';
	
	$.ajax({ 
		url: "/product/selectEmartItemListNew",
		type: "POST",
		cache:false,
		async:false,
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(param),
		success: function(data) {
			$.each(data, function (index, item) { 
				result += cardImgArray[item.itemCd]; 
			})
		},
		error: function (request, status, error) {
			ComUtil.alert("code:"+request.status+"\n"+"error:"+error);
		}
	});
	
	var param2 = { 
			  sectionWidth : selRwdSizeArr1[0]
			, aspectRatio : selRwdSizeArr2[0]
			, wheelInches : selRwdSizeArr2[1]
		};
	
	var result2 = '';
	
	$.ajax({ 
		url: "/product/selectEmartItemListNew",
		type: "POST",
		cache:false,
		async:false,
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(param2),
		success: function(data) {
			$.each(data, function (index, item) { 
				result2 += cardImgArray[item.itemCd]; 
			})
		},
		error: function (request, status, error) {
			ComUtil.alert("code:"+request.status+"\n"+"error:"+error);
		}
	});
	
	if(result == '' && result2 == '') {
		ComUtil.alert("이마트 넥센타이어 판매규격이 아닙니다.");
	} else if(result != result2) {
		if(result == ''){
			result = '이마트 넥센타이어 판매규격이 아닙니다.';
			result2 = '<img src="/img/emart/voucher_'+result2+'.bmp">';
		} else if(result2 == '') {
			result = '<img src="/img/emart/voucher_'+result+'.bmp">';
			result2 = '이마트 넥센타이어 판매규격이 아닙니다.';
		} else {
			result = '<img width="75%" src="/img/emart/voucher_'+result+'.bmp">';
			result2 = '<img width="75%" src="/img/emart/voucher_'+result2+'.bmp">';
			result2 += '<br/>이마트 넥센타이어 판매규격입니다.';
		}
		ComUtil.alert("전륜:" + result + "<br/>후륜:" + result2 + "<br/>매대에서 해당 색상 카드를 픽업해주세요.");
	} else {
		result = '<img src="/img/emart/voucher_'+result+'.bmp">';
		result += '<br/>이마트 넥센타이어 판매규격입니다.<br/>매대에서 해당 색상 카드를 픽업해주세요.';
		ComUtil.alert(result);
	}
});

$("#findSizeNumRetryChk").on('click',function(){
	if(ValidUtil.isEmpty($(".size-tab.type-num.step-02 .choice-size .active").data('code'))) {
		alert("사이즈를 선택해주세요.");
		return false;
	}
	var split = [];
	var dataArry = $(".size-tab.type-num.step-02 .choice-size .active").data('code').split('|');
	var fwdArry = dataArry[1]; // 전륜
	var selSizeArr1 = fwdArry.split('/');
	var selSizeArr2 = selSizeArr1[1].split('R');
	
	var rwdArry = dataArry[2]; // 후륜
	var selRwdSizeArr1 = rwdArry.split('/');
	var selRwdSizeArr2 = selRwdSizeArr1[1].split('R');

	var param = { 
		  sectionWidth : selSizeArr1[0]
		, aspectRatio : selSizeArr2[0]
		, wheelInches : selSizeArr2[1]
	};
	
	var result = '';
	$.ajax({ 
		url: "/product/selectEmartItemListNew",
		type: "POST",
		cache:false,
		async:false,
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(param),
		success: function(data) {
			$.each(data, function (index, item) { 
				result += cardImgArray[item.itemCd];
			})
		},
		error: function (request, status, error) {
			alert("code:"+request.status+"\n"+"error:"+error);
		}
	});
	
	var param2 = { 
			  sectionWidth : selRwdSizeArr1[0]
			, aspectRatio : selRwdSizeArr2[0]
			, wheelInches : selRwdSizeArr2[1]
		};
	
	var result2 = '';
	
	$.ajax({ 
		url: "/product/selectEmartItemListNew",
		type: "POST",
		cache:false,
		async:false,
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(param2),
		success: function(data) {
			$.each(data, function (index, item) { 
				result2 += cardImgArray[item.itemCd]; 
			})
		},
		error: function (request, status, error) {
			ComUtil.alert("code:"+request.status+"\n"+"error:"+error);
		}
	});
	
	if(result == '' && result2 == '') {
		ComUtil.alert("이마트 넥센타이어 판매규격이 아닙니다.");
	} else if(result != result2) {
		if(result == ''){
			result = '이마트 넥센타이어 판매규격이 아닙니다.';
			result2 = '<img src="/img/emart/voucher_'+result2+'.bmp">';
		} else if(result2 == '') {
			result = '<img src="/img/emart/voucher_'+result+'.bmp">';
			result2 = '이마트 넥센타이어 판매규격이 아닙니다.';
		} else {
			result = '<img width="75%" src="/img/emart/voucher_'+result+'.bmp">';
			result2 = '<img width="75%" src="/img/emart/voucher_'+result2+'.bmp">';
			result2 += '<br/>이마트 넥센타이어 판매규격입니다.';
		}
		ComUtil.alert("전륜:" + result + "<br/>후륜:" + result2 + "<br/>매대에서 해당 색상 카드를 픽업해주세요.");
	} else {
		result = '<img src="/img/emart/voucher_'+result+'.bmp">';
		result += '<br/>이마트 넥센타이어 판매규격입니다.<br/>매대에서 해당 색상 카드를 픽업해주세요.';
		ComUtil.alert(result);
	}
});

</script>
	<div class="popupWrap md-modal md-effect-1" id="sizeCheckTip" style="z-index: 5000; border-radius: 20px;display:none;">
		<div class="popContents popup-tip">
			<a href="javascript:$('#sizeCheckTip').fadeOut();" class="layPopClose md-close js-customMdBgClose" ></a>
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

	<!-- 개인정보 수집 및 이용에 대한 안내 -->
	<input type="hidden" class="md-trigger" data-modal="modal-privacyPolicy">
	<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-privacyPolicy" > <!-- md-show -->
		<div class="popContents">
			<a href="javascript:policyLayPopClose('modal-privacyPolicy');" class="layPopClose md-close"></a>
			<header class="noLine">
				<h2>개인(신용)정보 수집 및 이용에 대한 안내</h2>
			</header>

			<div class="popup-contents-nobottom">
				<div class="termsBox">
					<table class="table conView">
						<caption>개인(신용)정보 수집 및 이용에 대한 안내</caption>
						<colgroup>
							<col style="width:25%"/>
							<col style="width:50%"/>
							<col style="width:25%"/>
						</colgroup>
						<thead>
	            <tr>
	              <th scope="col">이용목적</th>
	              <th scope="col">항 목</th>
	              <th scope="col">보유기간</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	              <td class="tCenter">
	                회원가입, 고객 상담, 본인 확인, 고지사항 전달 및 확인 본인의사 확인 회사의 서비스(상품) 및 이벤트 제공
	              </td>
	              <td class="type03 vTop">
	                <p>- 개인 회원 : 성명, 실명 인증값(아이핀회원은 아이핀번호), 생년월일, 성별, 주소, 휴대전화번호, 이메일, 이메일수신여부, 회원ID, 비밀번호</p>
	                <p>- 사업자 회원 :상호, 사업자번호, 사업자 형태, 업종, 업태, 아이디, 비밀번호, 대표자 이름, 주소, 휴대전화번호, 이메일, 이메일수신여부</p>
	              </td>
	              <td class="tCenter">회원 탈퇴시까지</td>
	            </tr>
	            <tr>
	              <td class="tCenter">
	                등록비 및 렌탈료 납부
	              </td>
	              <td class="type03 vTop">
	                <p>- 신용카드 결제시 : 카드소유주, 법정생년월일, 사업자번호, 카드사명, 카드번호, 유효기간</p>
	                <p>- 계좌 이체시 : 예금주, 법정생년월일, 사업자번호, 금융사, 계좌번호</p>
	              </td>
	              <td class="tCenter">계약기간 종료시까지</td>
	            </tr>
	            <tr>
	              <td class="tCenter">
	                제품 배송
	              </td>
	              <td class="type03 vTop">
	                <p>- 제품 수취인 및 서비스 이용자이름, 휴대 전화번호, 기타 연락처</p>
	              </td>
	              <td class="tCenter">배송 완료시까지</td>
	            </tr>
	            <tr>
	              <td class="tCenter">
	                부가 서비스 및 이벤트 응모
	              </td>
	              <td class="type03 vTop">
	                <p>- 이름, 전화번호, 주소</p>
	              </td>
	              <td class="tCenter">이벤트 종료시까지</td>
	            </tr>
	          </tbody>
	        </table>
	        <p class="desc mt-m">
	          * 귀하는 넥스트레벨 서비스 이용에 필요한 최소한의 개인정보 수집 이용에 동의하지 않을 권리가 있으며, 동의 거부시 거부한 내용에 대한    서비스가 제한될 수 있습니다.<br/>
	          * 이 외 서비스 이용과정에서 별도 동의를 통해 추가 정보 수집이 있을 수 있습니다.
	        </p>
	      </div>
	    </div>
	  </div>
    </div>
    <!-- 개인정보 수집 및 이용에 대한 안내 -->
    
    <!-- 개인(신용)정보 위탁 동의 -->
	<input type="hidden" class="md-trigger" data-modal="modal-consignment">
	<div class="md-effect-1 fullPopup address-popup md-modal-3" id="modal-consignment" > <!-- md-show -->

				  <div class="popContents">
				    <a href="javascript:policyLayPopClose('modal-consignment');" class="layPopClose md-close"></a>
				    <header class="noLine">
				      <h2>개인(신용)정보 위탁 동의</h2>
				    </header>

				    <div class="popup-contents-nobottom">
				      <div class="termsBox inset-xs">
				        <table class="tbl conView">
				          <caption>개인(신용)정보 위탁 동의</caption>
				          <colgroup>
				            <col style="width:25%"/>
				            <col style="width:25%"/>
				            <col style="width:25%"/>
				            <col style="width:25%"/>
				          </colgroup>
				          <thead>
				            <tr>
				              <th scope="col">위탁기관</th>
				              <th scope="col">위탁항목</th>
				              <th scope="col">위탁목적</th>
				              <th scope="col">위탁기간</th>
				            </tr>
				          </thead>
				          <tbody>
				            <tr>
				              <td class="tCenter fb">
				                ㈜웅진
				              </td>
				              <td class="tCenter fb">
				                계약 관련 사항 전체
				              </td>
				              <td class="tCenter fb">
				                고객 상담 센터 운영
				              </td>
				              <td rowspan="5" class="tCenter fb">계약 종료시까지</td>
				            </tr>
				            <tr>
				              <td class="tCenter">
				                ㈜한국 사이버결재
				              </td>
				              <td class="tCenter">
				                카드번호, 카드사명, 유효기간, 계좌번호 및 은행명, 예금주(카드주)명
				              </td>
				              <td class="tCenter fb">
				                결제정보 전송
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter">
				        NICE신용정보
				              </td>
				              <td class="tCenter">
				                성명, 법정생년월일, 전화번호, 주소, 결제은행, 결제계좌, 카드번호, 카드사명, 유효기간, 예금주(카드주)명
				              </td>
				              <td class="tCenter fb">
				                수납센터 운영 및 채권 추심업무
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter fb">
				                렌탈계약대리점
				              </td>
				              <td class="tCenter fb">
				                주문정보, 배송정보
				              </td>
				              <td class="tCenter fb">
				                장착정보 전송
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter fb">
				                ㈜쿠콘
				              </td>
				              <td class="tCenter">
				                <span class="fb">성명, 법정생년월일,</span> 결제은행, 결제계좌
				              </td>
				              <td class="tCenter fb">
				                CMS 출금 동의 ARS 녹취
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter fb">
				                와이더랩
				              </td>
				              <td class="tCenter fb">
				                계약 관련 사항 전체
				              </td>
				              <td class="tCenter fb">
				                계약서 우편발송
				              </td>
				              <td class="tCenter fb">
				                발송 후 5일 이내까지
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter fb">
				                방문점검 위탁 사업자
				              </td>
				              <td class="tCenter">
				                <span class="fb">성명, 전화번호, 주소,</span> 차종, 차량번호
				              </td>
				              <td class="tCenter fb">
				                방문점검 서비스
				              </td>
				              <td class="tCenter fb">
				                방문점검 서비스<br/>종료 시 까지
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter fb">
				                오토앤주식회사
				              </td>
				              <td class="tCenter">
				                <span class="fb">성명, 전화번호,</span> 차량번호
				              </td>
				              <td class="tCenter fb">
				                엔진오일 서비스
				              </td>
				              <td class="tCenter fb">
				                엔진오일 서비스<br/>종료 시 까지
				              </td>
				            </tr>
				            <tr>
				              <td class="tCenter fb">
				                방문판매 모집원
				              </td>
				              <td class="tCenter">
				                <span class="fb">성명, 전화번호,</span> 차종, 차량번호
				              </td>
				              <td class="tCenter fb">
				                렌탈 고객 모집
				              </td>
				              <td class="tCenter fb">
				                계약 종료 시 까지
				              </td>
				            </tr>
				          </tbody>
				        </table>
				        <p class="desc mt-m">
				          * 넥스트레벨 서비스 제공을 위하여 반드시 필요한 정보제공이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.<br/>
				          * 렌탈 계약을 체결한 고객에 한해서만 위탁되며, 단순 회원 가입고객 정보는 위탁되지 않습니다.
				        </p>
				      </div>
				    </div>
				  </div>

			    </div>
	<!-- 개인(신용)정보 조회 동의 -->
    
<script type="text/javascript" src="/js/sizeFinder.js"></script>
<script src="/js/lib/jquery.nice-select.min.js"></script>
<script src="/js/clipboard.min.js"></script>

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
	var fstChkStartDay = "20210528";
	var fstChkEndDay = "20210529";
// 	var secChkStartDay = "20210320";
// 	var secChkEndDay = "20210321";
	
	if(chgDateToStr(today) >= fstChkStartDay && chgDateToStr(today) <= fstChkEndDay) {
		var todayHours = today.getHours();
		if(chgDateToStr(today) == fstChkStartDay) {//20210430 
			if(todayHours >= '22') {
				$(".noticeHid").hide();
				$("#noticeDiv").show();
			}
		} else if(chgDateToStr(today) == fstChkEndDay) {//20210501
			if(todayHours < '07') {
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
</script>