<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

		<!--  subContentsWrap -->
    <div class="subContentsWrap">   
      <main>
        <!-- header -->
        <!-- <div class="page-header">
          <h2 class="title-deco">
            <span>GS25와 함께하는</span> <span>렌탈상담</span>
          </h2>

          <h3 class="title-deco-sub">상담신청</h3>
        </div> -->
		<!-- header -->
		
		<a href="/" target="_blank"><img src="/img/event/gs_20210119_01.jpg"/></a>
		<img src="/img/event/gs_20210119_02.jpg"/>
      
        <div class="cart-wrap">
          <!-- TAB -->
          <!-- <div class="cart-tab tab-nav js-tab layout-r">
            <button type="button" id="buy" data-tab="tab-1" class="current">렌탈상담</button>
          </div> -->
          <!-- //TAB -->
  
          <!-- TAB CONTENTS -->
          <div class="cart-tab-contents" >
            <!-- TAB CONTENTS: 렌탈상담 -->
            <section id="tab-1" class="tab-content" style="display: block;">
              <h3 class="hide">렌탈상담</h3>
            
              <div class="listLine">
                <div class="order-header-message text-center">
                  <p>국내 최초 신개념 타이어 렌탈 서비스
					지금 상담 신청하세요!
					</p>
                  
                  <div class="order-info-summary">
                    <small>타이어 렌탈 가입 상담을 원하시지 않을 경우 동의하지 않으실 수 있으며,   동의하지 않으실 경우 가입 안내 전화를 드리지 않습니다.</small>
                  </div>
                </div>
            
                <div class="contact">
                  <div class="agree-wrap">
                    <div class="check">
                      <input type="checkbox" id="allAgree" name="" value="0" class="type01" onchange="javascript:checkAgree()" checked>
                      <label for="allAgree" class="layout-r"><span></span><b>타이어 렌탈 가입 상담을 위한 개인정보 수집 및 이용에 동의합니다.  </b></label>
                    </div>

                    <div class="info">
                      <dl>
                        <dt>이용목적</dt>
                        <dd>타이어 렌탈 가입 상담 및 계약 체결</dd>
                      </dl>

                      <dl>
                        <dt>항목</dt>
                        <dd>이름, 주소, 연락처(핸드폰), 차종</dd>
                      </dl>

                      <dl>
                        <dt>보유기간</dt>
                        <dd>상담 종료일로부터 90일 이내</dd>
                      </dl>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- 기본정보 -->
              <div class="listLine">
                <div class="inset-ml">
                  <div class="submit layout-c mb-m border-gray-bottom">
                    <label for="name"><span class="essen black">이름</span></label>
                    <input type="text" name="" class="type03 trans-bg" id="name" title="이름 입력란" placeholder="이름을 입력하세요" maxlength ="20"> 
                  </div>
                
                  <div class="submit layout-c border-gray-bottom mb-m">
                    <label for="phone01"><span class="essen black">휴대전화</span></label>
                    <div class="layout-r inline-m same-size">
                      <select class="inline st01 w33per" id="phone11" title="휴대전화 앞자리 선택">
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                        <option>017</option>
                        <option>018</option>
                        <option>019</option>      
                      </select>

                      <span class="divi type02 align-middle"></span>
                      <input type="text" name="" maxlength="4" class="type03 inline w33per trans-bg" id="phone12" title="휴대폰 중간번호 입력란" onkeyup="return validNumberCheck.keyUp(event);">
                      <span class="divi type02 align-middle"></span>
                      <input type="text" name="" maxlength="4" class="type03 inline w33per trans-bg" id="phone13" title="휴대폰 끝번호 입력란" onkeyup="return validNumberCheck.keyUp(event);">
                    </div>
                  </div>
                
                  <p id="popZipCode" style="display:none;"></p>
                  
                  <div class="submit layout-c mb-m" style="display:none;"> <!--border-gray-bottom-->
                    <label for="info02"><span class="essen black">주소</span></label>

                    <div class="conWrap layout-r border-bottom  mb-s">
                      <div class="inline full-width">
                      	<input type="text" name="" class="pl-0 pr-l trans-bg" id="info03" title="주소 입력란" placeholder="주소를 검색해 주세요" onclick="javascript:selectJusoPop();" readonly="readonly">
                      </div>
                      <button type="button" class="align-middle btn-address-search inline md-trigger" data-modal="modal-1" onclick="javascript:selectJusoPop();">검색</button>
                    </div>
                    
                  </div>
                </div>
              </div>
              <!-- 기본정보 -->
              
              <div class="listLine">
                <div class="submit">
                  <div class="inset-ml-v01">
                    <small class="font-gray">※ 콜센터  1855-0100 <br/> 운영 시간 평일  09:00 ~ 18:00  (주말 및 공휴일 휴무) 영업시간 기준 우선 접수 순으로 연락 드리겠습니다.</small>
                  </div>
                </div>
              </div>
              <button type="button" id="rentCounselReg" class="btn-primary inset-m full-width"><b>상담 접수</b></button>
            </section>
          </div>
          <!-- //TAB CONTENTS: 렌탈상담 -->
        </div>

        
      </main>
    </div>
    <!-- //subContentsWrap -->
    
    <!-- page background image -->
    <!-- <div class="allBgWrap">
      <div class="customer-bg consulting"></div>
    </div> -->
    <!-- //page background image -->
    
    <!-- //allWrap -->
    
    <!-- Popup Group -->
    <!-- ######################################### -->
    <div class="md-overlay"></div>
    <!-- ######################################### -->
    <!-- //Popup Group -->
	<!--subContentsWrap-->
	
	<!-- 주소 form -->
	<form name="jusoFrm" id="jusoFrm" method="post" >
		<input type="hidden" name="currentPage" id="currentPage" value="1"/>
		<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
		<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
		<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
		<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
		<input type="hidden" name="keyword" id="keyword" />
		<input type="hidden" name="zipCode" id="zipCode" />
	</form>
	
	<!-- 우편번호 검색 -->
	<div class="md-effect-1 fullPopup address-popup md-modal-3 md-close" id="modal-Addr">
		<div class="popContents">
			<a href="javascript:sendChildValueCancle('modal-Addr');" class="layPopClose md-close"></a>
			<header class="noLine">
				<h2>우편번호 검색</h2>
			</header>
	
			<div class="custom-position" style="height: 170px;">
				<div class="pt-l pl-l pr-l pb-0">
					<div class="search-area layout-r pl-0 pr-0">
						<label for="streetNumber"></label>
						<input type="text" name="jusoTxt" id="jusoTxt" class="" placeholder="도로명/지번/건물명 주소 입력"> <a href="javascript:selectJuso('1');" class="searchBtn"></a>
					</div>
					<small class="desc font-gray">예) 도로명: 마곡중앙로 177 더넥센유니버시티<br>예) 지번: 마곡동 756-5 / 건물명: 넥센유니버시티 </small>
				</div>
				<div class="pl-ml pr-ml">
					<div class="count-box utility border-gray-bottom">
						<div class="utility-result-total">
							<span>total</span>
							<span class="totalCnt" id="totalCount"></span>
						</div>
					</div>
				</div>
			</div>
	
			<div class="popup-contents-nobottom" style="top: 230px">
				<div class="zipCode">
					<ul id="jusoList"></ul>
					<button class="list-more full-width inset-m" onclick="javascript:selectJuso('mob');"> <!-- 현재작업중 -->
						<span id="jusoListMore">더보기</span><!-- 모바일은 서비스가 달라야하는 것 같음. MEPARK -->
							</button>
						</div>
					</div>
				</div>
			</div>
		<!-- //우편번호 검색 -->
	
	<!-- 우편번호 검색 결과 -->
	<input type="hidden" class="md-trigger" data-modal="modal-AddtDtl">
	<div class="fullPopup address-popup md-modal-3 md-close" id="modal-AddtDtl" name="popAddrDetail">
		<div class="popContents">
	       	<!-- 결과화면에서는 닫기가 작동 되지 않는다. 왜일까? MEPARK -->
	     	<a href="#;" class="layPopClose md-close"></a>
	       	<header class="noLine">
	         	<h2>우편번호 검색</h2>
	       	</header>
	
	       	<div class="popup-contents">
	         	<div class="inset-l">
	           		<div class="search-area layout-r pl-0 pr-0">
	             		<label for="streetNumber"></label>
	             		<input type="text" name="jusoReTxt" id="jusoReTxt" class="" placeholder="도로명/지번/건물명 주소 입력"> <button type="button" class="searchBtn" onclick="javascript:selectReJuso('1');">검색</button>
	           		</div>
	           		<small class="desc font-gray">예) 도로명: 마곡중앙로 177 더넥센유니버시티<br>예) 지번: 마곡동 756-5  / 건물명: 넥센유니버시티 </small>
	         	</div>
	
	         	<div class="pl-ml pr-ml pb-l">
	           		<div class="address-check">
	             		<div class="mb-ml">
	               			<b class="">우편번호</b><br>
	               			<span id="popZipCode"></span>
	               			<span id="bldMngNoMob" style="display:none;"></span>
	             		</div>
	
	             		<div class="mb-ml">
	               			<b class="essen">주소</b>
	               			<div class="address">
	                 			<ul>
	                   				<li><b>도로명</b><br><span id="popLoadAddr"></span></li>
	                   				<li><b>지번</b><br><span  id="popJibunAddr"></span></li>
	                   				<li><span id="popSiNm" style="display:none;"></span></li>
	                                    <li><span id="popSggNm" style="display:none;"></span></li>
	                                    <li><span id="popEmdNm" style="display:none;"></span></li>
	                 			</ul>
	               			</div>
	             		</div>
	
	             		<div class="mb-ml">
	               			<label for="popDetailAddr"><b class="essen">상세주소</b></label>
	               			<input type="text" name="" class="pl-0 pr-0" id="popDetailAddr" title="상세주소 입력란" maxlength="65" placeholder="예) 넥센아파트 1동 1101호 지하2층 주차장 N8">
	             		</div>
				
	             		<div class="mb-ml" id="popPkLoca">
	               			<label for="popPkLoca"><b class="essen">차량 주차 위치</b></label>
	   						        <div class="conWrap js-radioUI mt-s">
	                      	<ul>
	                      		<li class="radio col-2">
	                       	    <input type="radio" name="pkLoca" id="upStr" value="N" checked="checked" class="type06" title="지상 선택" >
	                       	    <label for="upStr"><span>지상</span></label>
	                       	</li>
	                       	<li class="radio col-4">
	                       		<input type="radio" name="pkLoca" id="dnStr" value="Y" checked="checked" class="type06" title="지하 선택" >
	                       		<label for="dnStr"><span>지하</span></label>
	                      		</li>
	                      	</ul>
	                     	</div>
	             		</div>
	           		</div>
	         	</div>
	</div>
	     </div>
	
	     <div class="btnArea layout-r bottom-box same-size" id="addrBottomBox">
	<button type="button" class="inline btn-gray-light" onclick="sendChildValueCancle('modal-AddtDtl');">취소</button>
	       	<button type="button" class="inline btn-primary" onclick="fn_returnInfo();">적용</button>
	     </div>
	     
	     <div class="btnArea layout-r bottom-box same-size" id="addrBottomBox2" style="display:none;" >
	<div style="width:100%; border-top:1px solid #801494;">
		<label for="popDetailAddrSec" style="background-color:#FFFFFF; padding-left:10px; position:relative; top:2px;"><b class="essen">상세주소</b></label>
	        		<input type="text" name="" class="" id="popDetailAddrSec" title="상세주소 입력란" maxlength="65" placeholder="예) 넥센아파트 1동 1101호 지하2층 주차장 N8">
	        	</div>
	        	<button type="button" class="inline btn-primary" onclick="fn_returnAddrDetail();" style="width:20%;">입력</button>
	       </div>
	</div>
	<!-- //우편번호 검색 결과 -->
	<div id="loadingWrap2"></div>

<script type="text/javascript">
	var fileData01 = "";
	var Gbn = '${gbn}';	
	var Gubun = '${gubun}';	
	var Flag = '${flag}';	
	var jusoGbn = "";
	var mountCheck1 = "";
	
	// 글자수 세기 keyon
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
		
		if(inTexts.id == "textArea"){
			document.getElementById("nowByte").innerHTML = liByte + "/" + textMax + " Byte";
		}
		return liByte+"Byte";
	}
	
	// 파일 업로드에서 이미지 파일만 올리기 (jpg,png,gif,pdf,bmp)
	function chkAttFileExt(imgNm){
		var thumbext = imgNm;
		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

		if(thumbext != "jpg" && thumbext != "png" && thumbext != "gif" 
				&& thumbext != "pdf" && thumbext != "bmp" && thumbext != "jpeg") {
			return false;
		}
	    return true;
	}
	
	//렌탈상담 동의
	function checkAgree(){
		var isChecked = $("#allAgree").prop("checked");
		$("#rentCounselReg").prop("disabled",!isChecked);
	}
	
	//차량조회 팝업닫기
	function closeCarSearch(modalNo) {
		$("#modal-" + modalNo).removeClass("md-show");
	}
	
	//차량번호,우편 번호 검색 - enterKey
	function enterSchKey(gubun) {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			selectJuso('1');
		}
	}
	
	function returnAddrInfo(cbData) {
		$("#info03").val($("#popLoadAddr").text()+' '+$("#popDetailAddr").val());
			
	}
	
	//우편 번호 검색 - 검색 버튼 클릭
	function selectJuso(pageNo) {
		if(pageNo != null){
			if(Number(pageNo)  == 0) {
				$("#currentPage").val("1");
			} else {
				if(pageNo == 'mob') {
					var nextPage = Number($("#currentPage").val()) + 1;
					$("#currentPage").val(String(nextPage));
				} else {
					$("#currentPage").val(pageNo);
				}
			}
		} else {
			$("#currentPage").val("1");
		}

		$("#keyword").val($("#jusoTxt").val());
		$("#loadingWrap").show();

		$.ajax({
			 url :"<%= AppContext.getString("zipcd.url") %>"
			,type:"post"
			,data:$("#jusoFrm").serialize()
			,dataType:"jsonp"
			,crossDomain:true
			,success:function(xmlStr){
				$("#loadingWrap").hide();
				
				if(navigator.appName.indexOf("Microsoft") > -1){
					var xmlData = new ActiveXObject("Microsoft.XMLDOM");
					xmlData.loadXML(xmlStr.returnXml)
				}else{
					var xmlData = xmlStr.returnXml;
				}

				var errCode = $(xmlData).find("errorCode").text();
				var errDesc = $(xmlData).find("errorMessage").text();
				if(errCode != "0"){
					alert(errDesc);
				}else{
					if(xmlStr != null){
						makeList(xmlData,pageNo);
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		});
	}
	
	function sendChildValueCancle() {
		$(".layPopClose").click();
	}
	
	function chkRentValidation(){
		if( $("#name").val() === "" || + $("#name").val() === null) {
			alert("이름를 입력해주세요.");
			return false;
		}
		if( $("#phone12").val() === "" || + $("#phone12").val() === null) {
			alert("휴대전화를 입력해주세요.");
			return false;
		}
		
		if( $("#phone13").val() === "" || + $("#phone13").val() === null) {
			alert("휴대전화를 입력해주세요.");
			return false;
		}
		/* 
		if( $("#info03").val() === "" || + $("#info03").val() === null) {
			alert("주소를 입력해주세요.");
			return false;
		}
		
		if( $("#popZipCode").text() === "" || + $("#popZipCode").text() === null) {
			alert("주소를 검색하세요.");
			return false;
		}
		 */
		return true;
	}
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$('#attach-image').append('<img id="fileUp" alt="">');
				$('#fileUp').attr('src', e.target.result);
				$('#cancel').removeClass('hide');
			};

			reader.readAsDataURL(input.files[0]);       
			fileData01 = input.files[0];
		}

		// 취소 추가
		$('#cancel').click(function(){
			$(this).addClass('hide');
			$('#fileUp').remove();
		});
	}
	
	$( document ).ready(function() {

	
		// $('#bgFullImg').append('<div class="customer-bg consulting"></div>');
		
		/* 전시상세 구매에서 넘어왔을경우 구매탭으로 바로 이동 시킵디다.*/
		//if(Gbn == 'o2o'){$('#rent').click();}		
		
		
		$("#rentCounselReg").on("click", function() {
			
			if(chkRentValidation()) {
				this.setAttribute("disabled","disabled");
		        var fParam = new FormData();
		        
		        fParam.append("custNm", $("#name").val());
		        fParam.append("addr", $("#info03").val());
		        fParam.append("mobNo", $("#phone11").val() + $("#phone12").val() + $("#phone13").val());
		        fParam.append("zipCd", $("#zipCode").val());
		        fParam.append("contactGet", "");
		        fParam.append("mcNm", "");
		        fParam.append("cnt", 0);
		        fParam.append("specNm", "");
		        fParam.append("gbn", Gbn);
		        fParam.append("gubun", Gubun);
		        fParam.append("flag", Flag);
		        
		        ComUtil.loading();
				$.ajax({
				    url: "/bbs/insertRentEventCounsel",
				    type: "POST",
				    cache: false,
				    data: fParam,
				    processData: false,
		            contentType: false,
				    success: function(data) {
				    	if(data.rtnCode == "0") {
				    		ComUtil.alert("성공적으로 접수 되었습니다. <br>상담사가 입력하신 전화번호로 <br>연락 드리겠습니다."
				    				,"알림"
				    				,"확인"
				    				,fn_location);
				    		//location.href = "/main";
				    	} else {
				    		ComUtil.alert("고객센터로 연락 바랍니다. 1855-0100");
				    		return false;
				    	}
				    },
				    error: function (request, status, error) {
				    	alert(error);
					},
					complete: function() {
						ComUtil.unloading();
					}
				});
			}
		});

	});
	
	var evManager = {
			//이전 화면 구분 값 : M : 메인  조회 , H : 헤더
			viewGbn : "${viewGbn}"
			,
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
			//검색 여부
			searchYn : false
			,
			niceGradeCd : new Array()
			,
			//공통 AJAX 호출
			commonAjax : function(url, param, callback , gbn) {
				$("#loadingWrap").show();
				$.ajax({
				    url: url,
				    type: "POST",
				    cache:false,
				    data: JSON.stringify(param),
				    contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
				    success: function(data) {
				    	$("#loadingWrap").hide();
				    	if(data != null) {
				    		callback(data , gbn);
				    	}
				    },
				    error: function (request, status, error) {
				    	$("#loadingWrap").hide();
				    	callBackManager.error(error)

					}
				});
				// end tag -- common ajax call
			}
		}
	
	/* ################################# AJAX CALLBACK ARAR #################################  */
	var callBackManager = {
		//에러 처리
		error : function(error) {
			console.log('error callback : ' + error);
		}
	}
	/* ################################# AJAX CALLBACK ARAR #################################  */
	
	/** 주소 스크립트 **/
	//주소 선택 팝업
	function selectJusoPop(){
		$("#totalCount").text("");
		$("#jusoList").html("");
		$("#jusoTxt").val("");
		$("#paging").html("");
		$("#popDetailAddr").val("");
		jusoGbn = 'A';
		
		$("#modal-Addr").addClass("md-show");
	}
	
	//우편 번호 검색 - 검색 버튼 클릭
	function selectJuso(pageNo) {
		if(pageNo != null){
			if(Number(pageNo)  == 0) {
				$("#currentPage").val("1");
			} else {
				if(pageNo == 'mob') {
					var nextPage = Number($("#currentPage").val()) + 1;
					$("#currentPage").val(String(nextPage));
				} else {
					$("#currentPage").val(pageNo);
				}
			}
		} else {
			$("#currentPage").val("1");
		}

		$("#keyword").val($("#jusoTxt").val());

		ComUtil.loading();
		$.ajax({
			 url :"<%= AppContext.getString("zipcd.url") %>"  //인터넷망
			,type:"post"
			,data:$("#jusoFrm").serialize()
			,dataType:"jsonp"
			,crossDomain:true
			,success:function(xmlStr){
				if(navigator.appName.indexOf("Microsoft") > -1){
					var xmlData = new ActiveXObject("Microsoft.XMLDOM");
					xmlData.loadXML(xmlStr.returnXml)
				}else{
					var xmlData = xmlStr.returnXml;
				}

				var errCode = $(xmlData).find("errorCode").text();
				var errDesc = $(xmlData).find("errorMessage").text();
				if(errCode != "0"){
					alert(errDesc);
				}else{
					if(xmlStr != null){
						makeList(xmlData);
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		    ,complete: function() {
		    	ComUtil.unloading();
		    }
		});
	}

	//우편번호 검색 후 목록 그리기
	function makeList(xmlStr){
		var totCnt = Number($(xmlStr).find("totalCount").text());
		$("#totalCount").text(totCnt);

		var htmlStr = "";
		if(totCnt != 0){
			$(xmlStr).find("juso").each(function(){
				htmlStr += "<li>";
				htmlStr += "	<button type='button' class='address-single' onClick='sendTmsChildValue(\""+$(this).find('zipNo').text()+"\",\""+$(this).find('bdMgtSn').text()+"\",\""+$(this).find('roadAddrPart1').text()+" "+$(this).find('roadAddrPart2').text()+"\",\""+$(this).find('jibunAddr').text()+"\",\"" + $(this).find('siNm').text() + "\",\"" + $(this).find('sggNm').text() + "\",\"" + $(this).find('emdNm').text() + "\");'>";
				htmlStr += "		<p class='zipNum text-left mb-s'>"+$(this).find('zipNo').text()+"</p>";
				htmlStr += "		<div class='address layout-r inline-m mb-s'>";
				htmlStr += "			<b class='roadName inline'>도로명</b>";
				htmlStr += "			<span class='inline text-left'>"+$(this).find('roadAddrPart1').text()+"</span>";
				htmlStr += "		</div>";
				htmlStr += "		<div class='address layout-r inline-m'>";
				htmlStr += "			<b class='nomination inline'>지번</b>";
				htmlStr += "			<span class='inline text-left'>"+$(this).find('jibunAddr').text()+"</span>";
				htmlStr += "		</div>";
				htmlStr += "	</button>";
				htmlStr += "</li>";
			});
		}else{
			htmlStr += "<li>"
			htmlStr += "	<p class='zipNum text-left mb-s'>검색결과가 없습니다.</p>"
			htmlStr += "</li>"
			$("#jusoList").html("");
		}

		if($("#currentPage").val() == "1") {
			$("#jusoList").html(htmlStr);
		} else {
			$("#jusoList").append(htmlStr);
		}
		var totCnt = Number($(xmlStr).find("totalCount").text());
		$("#totalCount").text(totCnt);

	}

	//우편 번호 검색 - 검색 버튼 클릭
	//우편 번호 결과 화면에서 다시 주소를 검색했을 때 다시 검색 목록이 나오도록 , MEPARK
	function selectReJuso(pageNo) {
		//MEPARK
		$("#jusoTxt").val($("#jusoReTxt").val());
		$("#modal-Addr").addClass("md-show");
		$("#modal-AddtDtl").removeClass("md-show");

		if(pageNo != null){
			if(Number(pageNo)  == 0) {
				$("#currentPage").val("1");
			} else {
				$("#currentPage").val(pageNo);
			}
		} else {
			$("#currentPage").val("1");
		}

		$("#keyword").val($("#jusoReTxt").val());

		ComUtil.loading();
		$.ajax({
			 url :"<%= AppContext.getString("zipcd.url") %>"  //인터넷망
			,type:"post"
			,data:$("#jusoFrm").serialize()
			,dataType:"jsonp"
			,crossDomain:true
			,success:function(xmlStr){
				if(navigator.appName.indexOf("Microsoft") > -1){
					var xmlData = new ActiveXObject("Microsoft.XMLDOM");
					xmlData.loadXML(xmlStr.returnXml)
				}else{
					var xmlData = xmlStr.returnXml;
				}

				var errCode = $(xmlData).find("errorCode").text();
				var errDesc = $(xmlData).find("errorMessage").text();
				if(errCode != "0"){
					alert(errDesc);
				}else{
					if(xmlStr != null){
						makeList(xmlData);
					}
				}
			}
		    ,error: function(xhr,status, error){
		    	alert("에러발생");
		    }
		    ,complete: function() {
		    	ComUtil.unloading();
		    }
		});
	}

	//우편번호 검색 후 상세 우편 번호 입력으로 넘어갈 때. - 검색 목록 중 한개 클릭
	function sendChildValue(zipCode, bdMgtSn, load, jibun) {
		$("#modal-Addr").removeClass("md-show");
		$("#zipCode").text(zipCode);
		$("#popLoadAddr").text(load);
		$("#popJibunAddr").text(jibun);
		$("#modal-AddtDtl").addClass("md-show");
		$("#jusoReTxt").val($("#jusoTxt").val());
	}
	
	//TMS용 상세 우편 번호
	function sendTmsChildValue(zipCode, bdMgtSn, load, jibun, siNm, sggNm, emdNm) {
		if(jusoGbn == "A" || mountCheck1 == "P2") { //주문자 정보 탭에서 호출할 때 == 'A'
			$("#bldMngNo").val(bdMgtSn);			
			$("#popPkLoca").attr("style","display:none;");
			console.log('jusoGbn TEST::', jusoGbn);
		}
		//if(jusoGbn != "A") {
		else {
			$("#popPkLoca").attr("style","display:block;");
		}
		
		//우편검색창 재 호출 시, 차량주차 위치 초기화.
		$("input:radio[name='pkLoca']").prop("checked", false);
		
		$("#modal-Addr").removeClass("md-show");
		$("#zipCode").text(zipCode);
		$("#popZipCode").text(zipCode);
		$("#popLoadAddr").text(load);
		$("#popJibunAddr").text(jibun);
		$("#bldMngNoMob").text(bdMgtSn);	// 건물관리번호
		$("#popSiNm").text(siNm);
		$("#popSggNm").text(sggNm);
		$("#popEmdNm").text(emdNm);
		$("#modal-AddtDtl").addClass("md-show");

		//MEPARK
		$("#jusoReTxt").val($("#jusoTxt").val());
		$('#popDetailAddr').val('');//상세주소 초기화
	}

	// 주소정보 callback 처리
	function fn_returnInfo() {

		if($('#popDetailAddr').val() == ""){
			alert("상세주소를 입력하세요.");
			$('#popDetailAddr').focus();
			return false;
		}else if(ValidUtil.isEmpty($("input[name='pkLoca']:checked").val()) && (jusoGbn != 'A' && mountCheck1 != "P2")) {//PME 2020-02-12
			ComUtil.alert("차량 주차 위치를 선택해주세요.");
			return;
		}
		
		var cbData = {
				  popLoadAddr : $("#popLoadAddr").text()
				, popDetailAddr : $("#popDetailAddr").val()
				, popZipCode : $("#popZipCode").text()
				, bldMngNo : $("#bldMngNoMob").text()
				, popSiNm : $("#popSiNm").text()
				, popSggNm : $("#popSggNm").text()
				, popEmdNm : $("#popEmdNm").text()
				, pkLoca : $("input[name='pkLoca']:checked").val()
		};

		// return function
		returnAddrInfo(cbData);

		//$('#popDetailAddr').val('');
		sendChildValueCancle('modal-AddtDtl');
	}
	
	//modal 팝업 닫기1.
	function sendChildValueCancle(callLoca){
		if(callLoca == "rentalOptPop") {
			$("#modal-5").removeClass("md-show");
			$(".layPopClose").click();
		} else {
			$("#" + callLoca).removeClass("md-show");
		}

	}
	
	function returnAddrInfo(pData) {
		$("#info03").val(pData.popLoadAddr + ' ' + pData.popDetailAddr);
		$("#zipCode").val(pData.popZipCode);
	}
	/** 주소 스크립트 **/ 
	function fn_location(){
		location.href = "/main";
	}
</script>