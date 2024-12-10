<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

      <form id="cartPopFrm" name="cartPopFrm" method="post" >
      	<input type="hidden" name="periodCd"     id="periodCd"  	value="" />
		<input type="hidden" name="cntCd"        id="cntCd"  		value="" />
		<input type="hidden" name="saleCd"       id="saleCd"  		value="" />
		<input type="hidden" name="rentalINdex"  id="rentalINdex"  	value="" />
		<input type="hidden" name="rentalGbn"  	 id="rentalGbn"  	value="" />
		<input type="hidden" name="regiCdAmt"  	 id="regiCdAmt"  	value="" />
		<input type="hidden" name="reRentUseYN"  id="reRentUseYN" value="${reRentUseYN}"/> <!-- 재렌탈 고객여부 -->
		
		<input type="hidden" name="selEnginCd" value=""/><!-- 선택한 엔진오일서비스 코드, 가격 -->	
		<input type="hidden" name="selLocCd" value=""/><!-- 선택한 위치교환서비스 코드, 가격 -->	
		<input type="hidden" name="selVisCd" value=""/><!-- 선택한 방문점검 코드, 가격 -->	
		<input type="hidden" name="selSaveCd" value=""/><!-- 선택한 보관 코드, 가격 -->	
		<input type="hidden" name="selTcCd" value=""/><!-- 선택한 타이어 교체 서비스 코드, 가격 -->	
		<input type="hidden" name="selPrCd" value=""/><!-- 선택한 프리미엄(사계절보증제도) 코드, 가격 -->	
		<input type="hidden" name="selArCd" value=""/><!-- 선택한 얼라인먼트 코드, 가격 -->				
      </form>

<script type="text/javascript">
var popfrm = document.cartPopFrm;
var reRentUseYN = '${reRentUseYN}';

$( document ).ready(function() {
	init_eventFunc();
});

function init_eventFunc(){
	$(document).on("click","input[name='quantity'] , input[name='term'] , input[name='fee']" , function(){
		 popfrm.cntCd.value = $(':radio[name="quantity"]:checked').val();
		 popfrm.periodCd.value = $(':radio[name="term"]:checked').val();
		 popfrm.regiCdAmt.value = $(':radio[name="fee"]:checked').next().text().replace('원', '');
		 if($("#rentalGbn").val() == 'nomal'){
			 changeOption();	 
		 }else if($("#rentalGbn").val() == 'free'){
			 changeOptionFree();
		 }else if($("#rentalGbn").val() == 'mamber'){
			 
		 }
		
	});	
}


function settingPopup(data, gbn){

	/* 1.렌탈수량 셋팅 */
	var htmlRenQty = "";
	if(data.searchCdList.length > 0){
		$('#rentalBonQty').children().remove();
		for(var i=0; i < data.searchCdList.length; i++) {
			if(reRentUseYN != 'N'){
				if(data.searchCdList[i].searchCd == popfrm.cntCd.value){
					htmlRenQty += '<input type="radio" name="quantity" checked="checked" id="bonQty_'+i+'" value="'+ data.searchCdList[i].searchCd +'" class="type06"><label for="bonQty_'+i+'"><span>'+ data.searchCdList[i].searchCdNm +'</span></label>';
				}else{
					htmlRenQty += '<input type="radio" name="quantity" id="bonQty_'+i+'" value="'+ data.searchCdList[i].searchCd +'" class="type06"><label for="bonQty_'+i+'"><span>'+ data.searchCdList[i].searchCdNm +'</span></label>';	
				}				
			}else{
				if(data.searchCdList[i].searchCd != '01' && data.searchCdList[i].searchCd != '03'){
					if(data.searchCdList[i].searchCd == popfrm.cntCd.value){
						htmlRenQty += '<input type="radio" name="quantity" checked="checked" id="bonQty_'+i+'" value="'+ data.searchCdList[i].searchCd +'" class="type06"><label for="bonQty_'+i+'"><span>'+ data.searchCdList[i].searchCdNm +'</span></label>';
					}else{
						htmlRenQty += '<input type="radio" name="quantity" id="bonQty_'+i+'" value="'+ data.searchCdList[i].searchCd +'" class="type06"><label for="bonQty_'+i+'"><span>'+ data.searchCdList[i].searchCdNm +'</span></label>';	
					}									
				}
			}
		}
	}
	$('#rentalBonQty').html(htmlRenQty);
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
	/* 2.렌탈기간 셋팅 */
	var htmlRenMonth = "";
	if(data.recomMonthList.length > 0){
		$('#rentalMonth').children().remove();
		for(var i=0; i < data.recomMonthList.length; i++) {
			if(data.recomMonthList[i].searchCd1 == popfrm.periodCd.value){
				htmlRenMonth += '<input type="radio" name="term" checked="checked" id="renMonth_'+i+'" value="'+ data.recomMonthList[i].searchCd1 +'" class="type06"><label for="renMonth_'+i+'"><span>'+ data.recomMonthList[i].searchCdNm +'</span></label>';				
			}else{
				htmlRenMonth += '<input type="radio" name="term" id="renMonth_'+i+'" value="'+ data.recomMonthList[i].searchCd1 +'" class="type06"><label for="renMonth_'+i+'"><span>'+ data.recomMonthList[i].searchCdNm +'</span></label>';	
			}
						
		}
	}
	$('#rentalMonth').html(htmlRenMonth);
	//////////////////////////////////////////////////////////////////////////////////////////////////
	

	/* 3.등록비  셋팅 */
	var htmlRenRegAmt = "";
	if(data.regAmtList.length > 0){
		$('#rentalregAmt').children().remove();
		for(var i=0; i < data.regAmtList.length; i++) {
			if(gbn == 'nomal'){
				if(data.regAmtList[i].searchCd == '01' || data.regAmtList[i].searchCd == '02' || data.regAmtList[i].searchCd == '04'){
					if(data.regAmtList[i].searchCdNm == popfrm.regiCdAmt.value){
						htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" checked="checked" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';
					}else{
						htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';	
					}
						
				}
			}else{
				if(data.regAmtList[i].searchCdNm == popfrm.regiCdAmt.value){
					htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" checked="checked" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';
				}else{
					htmlRenRegAmt += '<input type="radio" name="fee" id="regAmt_'+i+'" value="'+ data.regAmtList[i].searchCd +'" class="type06"><label for="regAmt_'+i+'"><span>'+ data.regAmtList[i].searchCdNm +'원</span></label>';	
				}	
			}
		}
	}
	$('#rentalregAmt').html(htmlRenRegAmt);	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	if(gbn == 'nomal'){
		$('#nomalServiceTxt').css("display","");
		$("#nomalService").css("display","");
		$('#freeServiceTxt').css("display","none");
		$("#freeService").css("display","none");		
		/* 4.일반렌탈 서비스 횟수 셋팅 */
		renNomalServicCnt(data, gbn);		
	}else if(gbn == 'free'){
		/* 자유렌탈 서비스 셀렉트박스 셋팅 */
		$('#nomalServiceTxt').css("display","none");
		$("#nomalService").css("display","none");
		$('#freeServiceTxt').css("display","");
		$("#freeService").css("display","");				
		renFreeServicSelect(data, gbn);	
	}


}

function renNomalServicCnt(data, gbn){
		var rentalHtml = "";
		
		console.log(data.serviceMap.selVisCd);
		console.log(data.serviceMap.selTcCd);
		console.log(data.serviceMap.selEnginCd);
		console.log(data.serviceMap.selArCd);
		console.log(data.serviceMap.selLocCd);
		

		//방문점검
		$('#visitCon').children().remove();
		if(data.serviceMap.selVisCd == '0' || typeof data.serviceMap.selVisCd == 'undefined'){
			rentalHtml += '<div class="count type02"><span class="noData">해당없음</span></div>';
		}else if(data.serviceMap.selVisCd == '999'){
			rentalHtml += '<div class="count type02"><span class="noData">무제한</span></div>';
		}else{
			rentalHtml += '<div class="count type02"><span class="circle">'+ data.serviceMap.selVisCd +'</span>회</div>';
		}
		$('#visitCon').html(rentalHtml);
	
		
		rentalHtml = "";
		//타이어 무상교체
		$('#tierFreeChng').children().remove();
		if(data.serviceMap.selTcCd == '0' || typeof data.serviceMap.selTcCd == 'undefined'){
			rentalHtml += '<div class="count type02"><span class="noData">해당없음</span></div>';
		}else if(data.serviceMap.selTcCd == '999'){
			rentalHtml += '<div class="count type02"><span class="noData">무제한</span></div>';
		}else{
			rentalHtml += '<div class="count type02"><span class="circle">'+ data.serviceMap.selTcCd +'</span>회</div>';
		}
		$('#tierFreeChng').html(rentalHtml);
		
		
		rentalHtml = "";
		//엔진오일 교체
		$('#engineChng').children().remove();
		if(data.serviceMap.selEnginCd == '0' || typeof data.serviceMap.selEnginCd == 'undefined'){
			rentalHtml += '<div class="count type02"><span class="noData">해당없음</span></div>';
		}else if(data.serviceMap.selEnginCd == '999'){
			rentalHtml += '<div class="count type02"><span class="noData">무제한</span></div>';
		}else{
			rentalHtml += '<div class="count type02"><span class="circle">'+ data.serviceMap.selEnginCd +'</span>회</div>';
		}
		$('#engineChng').html(rentalHtml);
		
		
		rentalHtml = "";
		//얼라이먼트
		$('#freeAri').children().remove();
		if(data.serviceMap.selArCd == '0' || typeof data.serviceMap.selArCd == 'undefined'){
			rentalHtml += '<div class="count type02"><span class="noData">해당없음</span></div>';
		}else if(data.serviceMap.selArCd == '999'){
			rentalHtml += '<div class="count type02"><span class="noData">무제한</span></div>';
		}else{
			rentalHtml += '<div class="count type02"><span class="circle">'+ data.serviceMap.selArCd +'</span>회</div>';
		}
		$('#freeAri').html(rentalHtml);
		
		
		rentalHtml = "";
		//무상위치
		$('#freeLocat').children().remove();
		if(data.serviceMap.selLocCd == '0' || typeof data.serviceMap.selLocCd == 'undefined'){
			rentalHtml += '<div class="count type02"><span class="noData">해당없음</span></div>';
		}else if(data.serviceMap.selLocCd == '999'){
			rentalHtml += '<div class="count type02"><span class="noData">무제한</span></div>';
		}else{
			rentalHtml += '<div class="count type02"><span class="circle">'+ data.serviceMap.selLocCd +'</span>회</div>';
		}
		$('#freeLocat').html(rentalHtml);		
	
} 

function changeOption(){//옵션을 바꿀때마다 장착서비스 정보를 바꿔준다.	
	var pUrl = "/cart/selectChageOptionInfo";
	var pSendData = {
						 cntCd		 : popfrm.cntCd.value
						,periodCd	 : popfrm.periodCd.value
						,saleCd		 : popfrm.saleCd.value
					};
	
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";
	
	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	renNomalServicCnt(data, 'nomal')
	    },
	    error: function (e) {
			console.log(e);
		}
	}); 		
}

function fn_closePop(){
	$('#rentalUPPop').removeClass('md-show');	
}
/* 일반 렌탈 장바구니 수정 */
function fn_updateCart(){
	
	if(confirm("수정 하시겠습니까?")){
		
		if($("#rentalGbn").val() == 'nomal'){
			var frm = document.forms['formNomal'+popfrm.rentalINdex.value];
			frm.cntCd.value = popfrm.cntCd.value;
			var cntCdNm = Number(popfrm.cntCd.value)
			frm.cntCdNm.value = cntCdNm+'본';
			frm.periodCd.value = popfrm.periodCd.value;
			if(Number(popfrm.periodCd.value) != 0){
				var periNm = Number(popfrm.periodCd.value) / 12;
				frm.periodCdNm.value = periNm+'년';
			}else{
				frm.periodCdNm.value = '0년';
			}
			frm.regiCdAmt.value = popfrm.regiCdAmt.value;		
			frm.regiCd.value = $(':radio[name="fee"]:checked').val();
			

	        $.ajax({
	            type: "POST",
	            url: "/cart/modifyCrtItem",
	            data: $("#formNomal"+popfrm.rentalINdex.value).serialize(),
	            cache: false,
	            processData: false,
	            success: function (data) {
	            	fn_closePop();
	            	window.location.href="/cart/cartView?tab=R";
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });				 	
	        
		 }else if($("#rentalGbn").val() == 'free'){
			 	var frm = document.forms['formfree'+popfrm.rentalINdex.value];
				var pUrl = "/cart/modifyCrtService";
				console.log(popfrm.selEnginCd.value);
				console.log(popfrm.selLocCd.value);
				console.log(popfrm.selVisCd.value);
				console.log(popfrm.selSaveCd.value);
				console.log(popfrm.selTcCd.value);
				console.log(popfrm.selPrCd.value);
				console.log(popfrm.selArCd.value);
				console.log(popfrm.cntCd.value);
				
				console.log(frm.itemNo.value);
				console.log(frm.regiCdAmt.value);
				console.log(frm.sectionWidth.value);
				console.log(frm.aspectRatio.value);
				console.log(frm.wheelInches.value);
				console.log(frm.plyRating.value);
				console.log(frm.patternCd.value);
				
				var pSendData = { 	
									 selEnginCd 	: popfrm.selEnginCd.value
									,selLocCd 		: popfrm.selLocCd.value
									,selVisCd 		: popfrm.selVisCd.value
									,selSaveCd 		: popfrm.selSaveCd.value
									,selTcCd 		: popfrm.selTcCd.value
									,selPrCd 		: popfrm.selPrCd.value
									,selArCd 		: popfrm.selArCd.value
									,cntCd 			: popfrm.cntCd.value
									,periodCd 		: popfrm.periodCd.value
									,regiAmt 		: popfrm.regiCdAmt.value									
									,itemNo 		: frm.itemNo.value
									,sectionWidth 	: frm.sectionWidth.value
									,aspectRatio 	: frm.aspectRatio.value
									,wheelInches 	: frm.wheelInches.value
									,plyRating 		: frm.plyRating.value
									,petternCd 		: frm.patternCd.value
								};
					pSendData = JSON.stringify(pSendData);
				var pReqId = "";
				
				$.ajax({
				    url: pUrl,
				    type: "POST",
				    cache:false,
				    data: pSendData,
				    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
				    success: function(data) {
		            	fn_closePop();
		            	window.location.href="/cart/cartView?tab=R";
				    },
				    error: function (e) {
						console.log(e);
					}
				}); 				
				
				
			 
		 }else if($("#rentalGbn").val() == 'mamber'){
			 
		 }

	
	}
}

function renFreeServicSelect(data, gbn){
	var htmlstr1 = "";
	var htmlstr2 = "";
	var htmlstr3 = "";
	var htmlstr6 = "";
	var htmlstr7 = "";
	

	console.log("getProdViewCdList51 : "+data.getProdViewCdList51.length);//엔진오일 교체 서비스
	console.log("getProdViewCdList52 : "+data.getProdViewCdList52.length);//위치교환서비스 무상 서비스
	console.log("getProdViewCdList53 : "+data.getProdViewCdList53.length);//방문점검서비스
	console.log("getProdViewCdList54 : "+data.getProdViewCdList54.length);//보관서비스
	console.log("getProdViewCdList55 : "+data.getProdViewCdList55.length);//타이어 교체 서비스
	console.log("getProdViewCdList56 : "+data.getProdViewCdList56.length);//타이어 무상 교체 서비스
	console.log("getProdViewCdList57 : "+data.getProdViewCdList57.length);//얼라인먼트 무상 서비스	

	/* 엔진오일 교체 서비스 */
	if(data.getProdViewCdList51.length > 0){
		//일단 삭제
		$('#engChangF').children().remove();
		htmlstr1 += '<li><a href="#" class="arrowClose" onclick="return false"></a></li>';
		htmlstr1 += '<li><input type="radio" name="engineChg" id="engineChg00"';
			if(data.selEnginCd == null || data.selEnginCd == "" || typeof data.selEnginCd == 'undefined'){
				htmlstr1 += 'checked="checked"';		
			}
		htmlstr1 += 'value="0" class="type06" onclick="setSelCode(\'B00001\',\'0\',\'0\')"><label for="engineChg00"><span>해당없음</span></label></li>';
		
		for(var i=0; i < data.getProdViewCdList51.length; i++) {
			if(data.getProdViewCdList51[i].servCnt == '999'){
				
				htmlstr1 += '<li><input type="radio" name="engineChg" id="engineChg'+i+'" ';
				
				if(data.selEnginCd != null || data.selEnginCd != "" || typeof data.selEnginCd != 'undefined'){
					if(data.selEnginCd == '999'){
						htmlstr1 += 'checked="checked"';
					}
				}						
				htmlstr1 += 'value="'+data.getProdViewCdList51[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList51[i].prsDcd +'\',\''+ data.getProdViewCdList51[i].servCnt + '\',\''+ data.getProdViewCdList51[i].servCntAmt +'\')"><label for="engineChg'+i+'"><span>무제한</span></label></li>';
			}else{
				htmlstr1 += '<li><input type="radio" name="engineChg" id="engineChg'+i+'" ';
				
				if(data.selEnginCd != null || data.selEnginCd != "" || typeof data.selEnginCd != 'undefined'){
					if(data.selEnginCd == data.getProdViewCdList51[i].servCnt){
						htmlstr1 += 'checked="checked"';
					}
				}				
				
				htmlstr1 += 'value="'+data.getProdViewCdList51[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList51[i].prsDcd +'\',\''+ data.getProdViewCdList51[i].servCnt + '\',\''+ data.getProdViewCdList51[i].servCntAmt +'\')"><label for="engineChg'+i+'"><span>'+data.getProdViewCdList51[i].servCnt+'회</span></label></li>';
			}
		}
	}


	/* 위치교환서비스 무상 서비스 */
	if(data.getProdViewCdList52.length > 0){
		//일단 삭제
		$('#freeLocatF').children().remove();
		htmlstr2 += '<li><a href="#" class="arrowClose" onclick="return false"></a></li>';
		htmlstr2 += '<li><input type="radio" name="freeLoc" id="freeLoc00" '; 
		
		if(data.selLocCd == null || data.selLocCd == "" || typeof data.selLocCd == 'undefined'){
			htmlstr2 += 'checked="checked"';		
		}		
		htmlstr2 += 'value="0" class="type06" onclick="setSelCode(\'B00002\',\'0\',\'0\')"><label for="freeLoc00"><span>해당없음</span></label></li>';

		for(var i=0; i < data.getProdViewCdList52.length; i++) {
			if(data.getProdViewCdList52[i].servCnt == '999'){
				
				htmlstr2 += '<li><input type="radio" name="freeLoc" id="freeLoc'+i+'" '; 
				if(data.selLocCd != null || data.selLocCd != "" || typeof data.selLocCd != 'undefined'){
					if(data.selLocCd == '999'){
						htmlstr2 += 'checked="checked"';
					}
				}					
				htmlstr2 += 'value="'+data.getProdViewCdList52[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList52[i].prsDcd +'\',\''+ data.getProdViewCdList52[i].servCnt + '\',\''+ data.getProdViewCdList52[i].servCntAmt +'\')"><label for="freeLoc'+i+'"><span>무제한</span></label></li>';
				
			}else{
				htmlstr2 += '<li><input type="radio" name="freeLoc" id="freeLoc'+i+'" ';
				
				if(data.selLocCd != null || data.selLocCd != "" || typeof data.selLocCd != 'undefined'){
					if(data.selLocCd == data.getProdViewCdList52[i].servCnt){
						htmlstr2 += 'checked="checked"';
					}
				}					
				htmlstr2 += 'value="'+data.getProdViewCdList52[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList52[i].prsDcd +'\',\''+ data.getProdViewCdList52[i].servCnt + '\',\''+ data.getProdViewCdList52[i].servCntAmt +'\')"><label for="freeLoc'+i+'"><span>'+data.getProdViewCdList52[i].servCnt+'회</span></label></li>';
			}
		}
	}
	
	/* 방문점검서비스 */
	if(data.getProdViewCdList53.length > 0){
		//일단 삭제
		$('#visitF').children().remove();
		htmlstr3 += '<li><a href="#" class="arrowClose" onclick="return false"></a></li>';		
		htmlstr3 += '<li><input type="radio" name="visitFree" id="visitFree00" '; 
		if(data.selVisCd == null || data.selVisCd == "" || typeof data.selVisCd == 'undefined'){
			htmlstr3 += 'checked="checked"';		
		}
		htmlstr3 += 'value="0" class="type06" onclick="setSelCode(\'B00003\',\'0\',\'0\')"><label for="visitFree00"><span>해당없음</span></label></li>';
		
		for(var i=0; i < data.getProdViewCdList53.length; i++) {
			if(data.getProdViewCdList53[i].servCnt == '999'){
				htmlstr3 += '<li><input type="radio" name="visitFree" id="visitFree'+i+'" ';
				if(data.selVisCd != null || data.selVisCd != "" || typeof data.selVisCd != 'undefined'){
					if(data.selVisCd == '999'){
						htmlstr3 += 'checked="checked"';
					}
				}				
				htmlstr3 += 'value="'+data.getProdViewCdList53[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList53[i].prsDcd +'\',\''+ data.getProdViewCdList53[i].servCnt + '\',\''+ data.getProdViewCdList53[i].servCntAmt +'\')"><label for="visitFree'+i+'"><span>무제한</span></label></li>';
			}else{
				
				htmlstr3 += '<li><input type="radio" name="visitFree" id="visitFree'+i+'" ';
				if(data.selVisCd != null || data.selVisCd != "" || typeof data.selVisCd != 'undefined'){
					if(data.selVisCd == data.getProdViewCdList53[i].servCnt){
						htmlstr3 += 'checked="checked"';
					}
				}				
				htmlstr3 += 'value="'+data.getProdViewCdList53[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList53[i].prsDcd +'\',\''+ data.getProdViewCdList53[i].servCnt + '\',\''+ data.getProdViewCdList53[i].servCntAmt +'\')"><label for="visitFree'+i+'"><span>'+data.getProdViewCdList53[i].servCnt+'회</span></label></li>';
			}
		}
	}

	/* 타이어 무상 교체 서비스 */
	if(data.getProdViewCdList56.length > 0){
		//일단 삭제
		$('#tireFreeF').children().remove();
		htmlstr6 += '<li><a href="#" class="arrowClose" onclick="return false"></a></li>';
		htmlstr6 += '<li><input type="radio" name="tierFrChg" id="tierFrChg00" ';
		
		if(data.selPrCd == null || data.selPrCd == "" || typeof data.selPrCd == 'undefined'){
			htmlstr6 += 'checked="checked"';  
		}

		htmlstr6 += 'value="0" class="type06" onclick="setSelCode(\'B00007\',\'0\',\'0\')"><label for="tierFrChg00"><span>해당없음</span></label></li>';
		for(var i=0; i < data.getProdViewCdList56.length; i++) {
			if(data.getProdViewCdList56[i].servCnt == '999'){
				
				htmlstr6 += '<li><input type="radio" name="tierFrChg" id="tierFrChg'+i+'" '; 
				if(data.selPrCd != null || data.selPrCd != "" || typeof data.selPrCd != 'undefined'){
					if(data.selPrCd == '999'){
						htmlstr6 += 'checked="checked"';		
					}
				}
				htmlstr6 += 'value="'+data.getProdViewCdList56[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList56[i].prsDcd +'\',\''+ data.getProdViewCdList56[i].servCnt + '\',\''+ data.getProdViewCdList56[i].servCntAmt +'\')"><label for="tierFrChg'+i+'"><span>무제한</span></label></li>';
			}else{
				htmlstr6 += '<li><input type="radio" name="tierFrChg" id="tierFrChg'+i+'" ';
				
				if(data.selPrCd != null || data.selPrCd != "" || typeof data.selPrCd != 'undefined'){
					if(data.selPrCd == data.getProdViewCdList56[i].servCnt){
						htmlstr6 += 'checked="checked"';
					}
				}
				htmlstr6 += 'value="'+data.getProdViewCdList56[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList56[i].prsDcd +'\',\''+ data.getProdViewCdList56[i].servCnt + '\',\''+ data.getProdViewCdList56[i].servCntAmt +'\')"><label for="tierFrChg'+i+'"><span>'+data.getProdViewCdList56[i].servCnt+'회</span></label></li>';
			}
		}
	}

	/* 얼라인먼트 무상 서비스 */
	if(data.getProdViewCdList57.length > 0){
		//일단 삭제
		$('#freeArF').children().remove();
		htmlstr7 += '<li><a href="#" class="arrowClose" onclick="return false"></a></li>';
		
		htmlstr7 += '<li><input type="radio" name="freeAlin" id="freeAlin00" '
			if(data.selArCd == null || data.selArCd == "" || typeof data.selArCd == 'undefined'){
					htmlstr7 += 'checked="checked"';		
			}
		htmlstr7 += 'value="0" class="type06" onclick="setSelCode(\'B00008\',\'0\',\'0\')"><label for="freeAlin00"><span>해당없음</span></label></li>';
		
		for(var i=0; i < data.getProdViewCdList57.length; i++) {

			if(data.getProdViewCdList57[i].servCnt == '999'){
				htmlstr7 += '<li><input type="radio" name="freeAlin" id="freeAlin'+i+'" value="'+data.getProdViewCdList57[i].servCntAmt+'" ';
				if(data.selArCd != null || data.selArCd != "" || typeof data.selArCd != 'undefined'){
					if(data.selArCd == '999'){
						htmlstr7 += 'checked="checked"';
					}
				}
				htmlstr7 += 'class="type06" onclick="setSelCode(\''+ data.getProdViewCdList57[i].prsDcd +'\',\''+ data.getProdViewCdList57[i].servCnt + '\',\''+ data.getProdViewCdList57[i].servCntAmt +'\')"><label for="freeAlin'+i+'"><span>무제한</span></label></li>';
			}else{
				
				htmlstr7 += '<li><input type="radio" name="freeAlin" id="freeAlin'+i+'" ';
				if(data.selArCd != null || data.selArCd != "" || typeof data.selArCd != 'undefined'){
					if(data.selArCd == data.getProdViewCdList57[i].servCnt){
						htmlstr7 += 'checked="checked"';
					}
				}
				
				htmlstr7 += 'value="'+data.getProdViewCdList57[i].servCntAmt+'" class="type06" onclick="setSelCode(\''+ data.getProdViewCdList57[i].prsDcd +'\',\''+ data.getProdViewCdList57[i].servCnt + '\',\''+ data.getProdViewCdList57[i].servCntAmt +'\')"><label for="freeAlin'+i+'"><span>'+data.getProdViewCdList57[i].servCnt+'회</span></label></li>';
			}
		}
	}	
  	
	
	
	if(data.selEnginCd != null && data.selEnginCd != "" && typeof data.selEnginCd != 'undefined'){
		popfrm.selEnginCd.value = data.selEnginCd;
		$('#engChangCntF').text(data.selEnginCd);
	}else{
		popfrm.selEnginCd.value = '0';
		$('#engChangCntF').text('0');
	}

	if(data.selLocCd != null && data.selLocCd != "" && typeof data.selLocCd != 'undefined'){
		popfrm.selLocCd.value = data.selLocCd;
		$('#freeLocatCntF').text(data.selLocCd);
	}else{
		popfrm.selLocCd.value = '0';
		$('#freeLocatCntF').text('0');
	}
	
	if(data.selVisCd != null && data.selVisCd != "" && typeof data.selVisCd != 'undefined'){
		popfrm.selVisCd.value = data.selVisCd;
		$('#visitCntF').text(data.selVisCd);
	}else{
		popfrm.selVisCd.value = '0';
		$('#visitCntF').text('0');
	}
	
	if(data.selPrCd != null && data.selPrCd != "" && typeof data.selPrCd != 'undefined'){
		popfrm.selPrCd.value = data.selPrCd;
		$('#tireFreeCntF').text(data.selPrCd);
	}else{
		popfrm.selPrCd.value = '0';
		$('#tireFreeCntF').text('0');
	}
	
	if(data.selArCd != null && data.selArCd != "" && typeof data.selArCd != 'undefined'){
		popfrm.selArCd.value = data.selArCd;
		$('#freeArCntF').text(data.selArCd);
	}else{
		popfrm.selArCd.value = '0';
		$('#freeArCntF').text('0');
	}
	
	/* innerHtml!!! */
	$('#engChangF').html(htmlstr1);
	$('#freeLocatF').html(htmlstr2);
	$('#visitF').html(htmlstr3);
	$('#tireFreeF').html(htmlstr6);
	$('#freeArF').html(htmlstr7);
	
    $(".arrowClose").click(function(e) {
	 	   $(".selBox").slideUp(300);
	        e.preventDefault();
	 });	
	
}


/* 선택한 서비스 코드 정보 셋팅 */
function setSelCode(prsDcd, servCnt, servCntAmt){
	if(prsDcd == "B00001"){//엔진오일
		popfrm.selEnginCd.value = servCnt;
		$('#engChangCntF').text(servCnt);
	}else if(prsDcd == "B00002"){//위치교환
		popfrm.selLocCd.value = servCnt;
		$('#freeLocatCntF').text(servCnt);
	}else if(prsDcd == "B00003"){//방문점검
		popfrm.selVisCd.value = servCnt;
		$('#visitCntF').text(servCnt);
	}else if(prsDcd == "B00007"){//타이어 무상 교체
		popfrm.selPrCd.value = servCnt;
		$('#tireFreeCntF').text(servCnt);
	}else if(prsDcd == "B00008"){//얼라인먼트
		popfrm.selArCd.value = servCnt;
		$('#freeArCntF').text(servCnt);
	}
}

function changeOptionFree(){
	var pUrl = "/product/selectFreeRentalServiceList";
	var pSendData = {
						 cntCd		 : popfrm.cntCd.value
						,periodCd	 : popfrm.periodCd.value
					};
	
		pSendData = JSON.stringify(pSendData);
	var pReqId = "";
	
	$.ajax({
	    url: pUrl,
	    type: "POST",
	    cache:false,
	    data: pSendData,
	    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	    success: function(data) {
	    	renFreeServicSelect(data, 'free');
	    },
	    error: function (e) {
			console.log(e);
		}
	}); 
	
}


</script>
