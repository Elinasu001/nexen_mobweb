<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

		<form id="frm" name="frm" method="post" >
			<input type="hidden" name="searchGbn"		id="searchGbn" />		<!-- N : 차량번호 , C : 차종 , S : 사이즈 -->
			<input type="hidden" name="carNo"			id="carNo"  />			<!-- 차량번호 -->
			<input type="hidden" name="makerCd" 		id="makerCd"  />		<!-- 제조사 코드 -->
			<input type="hidden" name="makerNm" 		id="makerNm" />			<!-- 제조사 명 -->
			<input type="hidden" name="modelCd" 		id="modelCd"  />		<!-- 차 모델 코드 -->
			<input type="hidden" name="modelNm" 		id="modelNm" />			<!-- 차 모델  명 -->
			<input type="hidden" name="contentsCd" 		id="contentsCd" />		<!-- 차 사양 코드 -->
			<input type="hidden" name="sectionWidth" 	id="sectionWidth" />	<!-- 단면폭 or sectionWidth -->
			<input type="hidden" name="aspectRatio" 	id="aspectRatio" />		<!-- 편평비 or aspectRatio -->
			<input type="hidden" name="wheelInches" 	id="wheelInches" />		<!-- 인치    or wheelInches -->
			<input type="hidden" name="TireSizeCd" 		id="TireSizeCd" />		<!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->
			<input type="hidden" name="TireSizeNm" 		id="TireSizeNm" />		<!-- 사이즈ㅡ > 단면폭 + 편평비 + 인치 -->

			<!-- 상세 화면 용 -->
			<input type="hidden" name="dMakerCd" 	id="dMakerCd" />	<!-- 제조사 코드 -->
			<input type="hidden" name="petternCd" 	id="petternCd" />	<!-- 패턴 코드 -->
			<input type="hidden" name="frCd" 		id="frCd" />		<!-- 앞뒤 구분 -->
			<input type="hidden" name="classCd" 	id="classCd" />		<!-- 치종 구분 > 승용차 / SUV -->
			<input type="hidden" name="matCd" 		id="matCd" />		<!-- 상품코드 -->
			<input type="hidden" name="plyRating" 	id="plyRating" />	<!-- 강도 -->
			<input type="hidden" name="description" 	id="description" />
			<input type="hidden" name="seasonCd" 		id="seasonCd" />		<!-- 계절 구분-->
			<input type="hidden" name="seasonCdNm" 		id="seasonCdNm" />
			<!-- paging -->
			<input type="hidden" name="pageNo"	id="pageNo"	value="1"/>		<!-- 현재 페이지 -->
			<input type="hidden" name="pageSize"	id="pageSize" 	value="9" />		<!-- 페이지에 표시할 수 -->
		</form>
		
		<!-- layerPopup > 제조사 // -->
		<div class="md-effect-1 fullPopup md-close" id="modal-3">
    		<div class="popContents search-popup">
        		<a  class="layPopClose md-close" onclick="javascript:closeCarSearch('3');"></a>
        		<header>
          			<h2>차종</h2>
          			<button type="button" class="size-check md-trigger" data-modal="tireSizeTip">
            			<span>Tip!</span>
            			<span>사이즈 확인</span>
          			</button>
        		</header>
        
        		<div class="search-car popup-contents" id="searchClCdArea"></div>
      		</div>
		</div>
		<!-- layerPopup > 제조사  // -->

		<!-- layerPopup > 모델명 // -->
		<div class="md-effect-1 fullPopup md-close" id="modal-4">
    		<div class="popContents search-popup">
        		<a  class="layPopClose md-close" onclick="javascript:closeCarSearch('4');"></a>
        		<header>
          			<h2>차종</h2>
          			<button type="button" class="size-check md-trigger" data-modal="tireSizeTip">
            			<span>Tip!</span>
            			<span>사이즈 확인</span>
          			</button>
        		</header>
        
        		<div class="search-car popup-contents" id="modelArea"></div>
      		</div>
		</div>
		<!-- layerPopup > 모델명  // -->

		<!-- layerPopup > 사이즈  // -->
		<div class="md-effect-1 fullPopup md-close" id="modal-5">
    		<div class="popContents search-popup">
        		<a  class="layPopClose md-close" onclick="javascript:closeCarSearch('5');"></a>
        		<header>
          			<h2>차종</h2>
          			<button type="button" class="size-check md-trigger" data-modal="tireSizeTip">
            			<span>Tip!</span>
            			<span>사이즈 확인</span>
          			</button>
        		</header>
        
        		<div class="search-car popup-contents" id="sizeArea"></div>
      		</div>
		</div>
		<!-- layerPopup > 사이즈 // -->
		
		<form name="jusoFrm" id="jusoFrm" method="post" >
			<input type="hidden" name="currentPage" id="currentPage" value="1"/>
			<input type="hidden" name="countPerPage" id="countPerPage" value="4"/>
			<input type="hidden" name="confmKey" id="confmKey" value="<%= AppContext.getString("zipcd.service.key") %>"/>
			<input type="hidden" name="connectTimeout" id="connectTimeout" value="<%= AppContext.getString("zipcd.connect.ConnectTimeout") %>"/>
			<input type="hidden" name="readTimeout" id="readTimeout" value="<%= AppContext.getString("zipcd.connect.ReadTimeout") %>"/>
			<input type="hidden" name="keyword" id="keyword" />
			<input type="hidden" name="zipCode" id="zipCode" />
		</form>
		
	    
		<!-- subContentsWrap -->
    <div class="subContentsWrap">   
      <main>
        <!-- header -->
        <div class="page-header empty">
          <h2 class="title-deco">
            <span>상담신청을</span> <span>남겨주세요.</span>
          </h2>

          <h3 class="title-deco-sub">상담신청</h3>
        </div>
        <!-- header -->
      
        <div class="cart-wrap">
          <!-- TAB -->
          <div class="cart-tab tab-nav js-tab layout-r">
            <button type="button" id="buy" data-tab="tab-1" class="current">렌탈상담</button>
            <button type="button" id="rent" data-tab="tab-2">구매상담</button>
          </div>
          <!-- //TAB -->
  
          <!-- TAB CONTENTS -->
          <div class="cart-tab-contents">
            <!-- TAB CONTENTS: 렌탈상담 -->
            <section id="tab-1" class="tab-content">
              <h3 class="hide">렌탈상담</h3>
            
              <div class="listLine">
                <div class="order-header-message text-center">
                  <p>홈페이지를 통한 렌탈 주문이 불편하신 경우 상담 신청을 남겨주세요</p>
                  
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
                        <dd>이름, 연락처(핸드폰)</dd>
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
                
				  <%-- // 240507 백인천: 상담접수 페이지 내 필요데이터(이름, 전화번호) 외 타 항목 제외. 기타 정보들은 콜센터 통해 수집.
                  <p id="popZipCode" style="display:none;"></p>
                  
                  <div class="submit layout-c mb-m"> <!--border-gray-bottom-->
                    <label for="info02"><span class="essen black">주소</span></label>

                    <div class="conWrap layout-r border-bottom  mb-s">
                      <div class="inline full-width">
                      	<input type="text" name="" class="pl-0 pr-l trans-bg" id="info03" title="주소 입력란" placeholder="주소를 검색해 주세요" onclick="javascript:selectJusoPop();" readonly="readonly">
                      </div>
                      <button type="button" class="align-middle btn-address-search inline md-trigger" data-modal="modal-1" onclick="javascript:selectJusoPop();">검색</button>
                    </div>
                    
                  </div>
                  --%>
                </div>
              </div>
              <!-- 기본정보 -->
              
              <%-- // 240507 백인천: 상담접수 페이지 내 필요데이터(이름, 전화번호) 외 타 항목 제외. 기타 정보들은 콜센터 통해 수집.
              <div class="listLine">
                <div class="order-basket contact">
                  <div class="submit mt-ml">
                    <label for="info01"><span class="black">차량정보</span></label>
                  
                    <!-- js-radio UI -->
                    <div class="conWrap js-radioUI">
                      <ul>
                        <li class="radio">
                          <input type="radio" name="carSearch" id="car02" value="2" class="radioChk" title="차종 선택">
                          <label for="ser2"><span>차종</span></label>
                        </li>
                      </ul>
                    </div>
                    <!-- //js-radio UI -->
                  </div>
                </div>

                <!-- js-radio UI contents -->
                <!-- ###################################### -->
                <!-- 차량정보 -->
                <div class="submit">
                  <div class="inset-ml">
                    <div class="submit layout-c mb-m border-bottom">
                      <p class="black">제조사</p>
                      <p class="pt-s pb-s" id="maker"></p>
                    </div>

                    <div class="submit layout-c mb-m border-bottom">
                      <p class="black">차종</p>
                      <p class="pt-s pb-s" id="model"></p>
                    </div>

                    <div class="submit layout-c mb-m border-bottom">
                      <p class="black">규격</p>
                      <p class="pt-s pb-s" id="size"></p>
                    </div>

                    <div class="submit layout-c">
                      <p class="black">수량</p>
                      <p class="border-bottom">
                        <select class="st01" id="quantity" title="수량 선택">
                          <option value="01">1</option>
                          <option value="02">2</option>       
                          <option value="03">3</option>
                          <option value="04">4</option>      
                        </select>
                      </p>
                    </div>
                  </div>
                  
                  <div class="inset-ml-v01">
                    <small class="font-gray">※ 콜센터  1855-0100 <br/> 운영 시간 평일  09:00 ~ 18:00  (주말 및 공휴일 휴무) 영업시간 기준 우선 접수 순으로 연락 드리겠습니다.</small>
                  </div>
                </div>
                <!-- //차량정보 -->
              </div>
              --%>
              <button type="button" id="rentCounselReg" class="btn-primary inset-m full-width"><b>등록</b></button>
            </section>
          </div>
          <!-- //TAB CONTENTS: 렌탈상담 -->

          <div class="cart-tab-contents">    
            <!-- TAB CONTENTS: 구매상담 -->
            <section id="tab-2" class="tab-content">
              <h3 class="hide">구매상담</h3>
              
              <div class="order-header-message text-center">
                  <p>온라인 구매관련 상담을 남겨주세요.</p>

                  <div class="order-info-summary full-width">
                    <small>문의 전에 ‘자주 묻는 질문’ 리스트에서 궁금하신 사항을 확인하시면, 쉽고 빠르게 궁금증을 해결하실 수 있습니다.</small>
                  </div>
                
                  <button type="button" class="go-view contact" onclick="javascript:location.href='/bbs/qnaList';"><b>자주 묻는 질문 바로가기</b></button>
              </div>
              
              <div class="mynexen-review contact">
	              <div class="contact">
	                <div class="agree-wrap">
	                  <div class="check">
	                    <input type="checkbox" id="allAgree02" name="" value="0" class="type01" onchange="javascript:checkAgree02()" checked>
	                    <label for="allAgree02" class="layout-r"><span></span><b>구매 상담을 위한 개인정보 수집 및 이용</b></label>
	                  </div>
	
	                  <div class="info">
	                    <dl>
	                      <dt>이용목적</dt>
	                      <dd>구매상담</dd>
	                    </dl>
	
	                    <dl>
	                      <dt>항목</dt>
	                      <dd>이름, 연락처(핸드폰)</dd>
	                    </dl>
	
	                    <dl>
	                      <dt>보유기간</dt>
	                      <dd>상담 종료일로부터 90일 이내</dd>
	                    </dl>
	                  </div>
	                </div>
	              </div>
	                
	                <div class="submit layout-c mb-m border-gray-bottom">
	                  <label for="name"><span class="essen black">이름</span></label>
	                  <input type="text" name="" class="type03 trans-bg" id="name01" title="이름 입력란" maxlength="20" placeholder="이름을 입력하세요"> 
	                </div>
	              
	                <div class="submit layout-c border-gray-bottom mb-m">
	                  <label for="phone01"><span class="essen black">휴대전화</span></label>
	                  <div class="layout-r inline-m same-size">
	                    <select class="inline st01 w33per" id="phone21" title="휴대전화 앞자리 선택">
	                      <option>010</option>
	                      <option>011</option>
	                      <option>016</option>
	                      <option>017</option>
	                      <option>018</option>
	                      <option>019</option>      
	                    </select>
	
	                    <span class="divi type02 align-middle"></span>
	                    <input type="text" name="" maxlength="4" class="type03 inline w33per trans-bg" id="phone22" title="휴대폰 중간번호 입력란" onkeyup="return validNumberCheck.keyUp(event);">
	                    <span class="divi type02 align-middle"></span>
	                    <input type="text" name="" maxlength="4" class="type03 inline w33per trans-bg" id="phone23" title="휴대폰 끝번호 입력란" onkeyup="return validNumberCheck.keyUp(event);">
	                  </div>
	                </div>
	                
	                <%-- // 240507 백인천: 상담접수 페이지 내 필요데이터(이름, 전화번호) 외 타 항목 제외. 기타 정보들은 콜센터 통해 수집.
	                <p class="mt-m"><label id="review-title" class="essen black">제목</label></p>
	                <div class="border-bottom">
	                  <input id="tit01" name="review-title" type="text" value="" class="pl-0 type03 trans-bg" placeholder="제목을 입력해주세요" maxlength="30" onkeyup='javascript:fn_chkByte(this,100);'>
	                </div>
	                
	                <p class="mt-m"><label id="review-box" class="essen black">내용</label></p>
	                <div class="text-right border-bottom">
	                    <textarea id="textArea" name="review-box" placeholder="내용을 입력해주세요" onkeyup='javascript:fn_chkByte(this,2000);'></textarea>
	                    <small class="font-gray" id="nowByte">0/2000 Byte</small>
	                </div>
	                
	                <p class="mt-m essen black">첨부이미지</p>
	                <form>
	                  <div class="fileUpWrap layout-c">
	                    <div class="layout-r border-bottom">
	                      <div class="file-caption pt-s pb-s font-gray">5MB 이하의 jpg, png, bmp 만 가능</div>
	                      
	                      <div class="file-attach align-middle">
	                        <input id="fileInput" type="file" onchange="readURL(this);">
	                        <label for="fileInput">파일검색</label>
	                      </div>
	                    </div>
	                    
	                    <div class="preview">
	                      <button id="cancel" class="cancel hide" onclick="return false">취소</button>
	                      <div id="attach-image"></div>
	                    </div>
	                  </div>
	                </form>
	                --%>
              </div>
              <button type="button" id="purcCounselReg" class="btn-primary inset-m full-width"><b>등록</b></button>
            </section>
            <!-- //TAB CONTENTS: 구매상담 -->
          </div>
          <!-- //TAB CONTENTS -->
        </div>

        
      </main>
    </div>
    <!-- //subContentsWrap -->
    
    <!-- page background image -->
    <div class="allBgWrap">
      <div class="customer-bg consulting"></div>
    </div>
    <!-- //page background image -->
    </div>
    <!-- //allWrap -->
    
    <!-- Popup Group -->
    <!-- ######################################### -->
    <div class="md-overlay"></div>
    <!-- ######################################### -->
    <!-- //Popup Group -->
		<!--subContentsWrap-->

<script type="text/javascript">
	var fileData01 = "";
	var Gbn = '${gbn}';	
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
	
	//구매상담 동의
	function checkAgree02(){
		var isChecked = $("#allAgree02").prop("checked");
		$("#purcCounselReg").prop("disabled",!isChecked);
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
	
	//주소 선택 팝업
	function selectJusoPop(){
		$("#totalCount").text("");
		$("#jusoList").html("");
		$("#jusoTxt").val("");
		$("#paging").html("");
		$("#popDetailAddr").val("");
		//$("div[name='popAddr']").addClass("md-show");
		jusoGbn = 'A';
		
		$("#modal-Addr").addClass("md-show");
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
		
		if( $("#size").text() === "" || + $("#size").text() === null) {
			alert("차량을 검색하세요.");
			return false;
		}
		*/
		
		return true;
	}
	
	//필수값 체크 validation
	function chkPurcValidation(){
		if( $("#name01").val() === "" || + $("#name01").val() === null) {
			alert("이름를 입력해주세요.");
			return false;
		}
		if( $("#phone22").val() === "" || + $("#phone22").val() === null) {
			alert("휴대전화를 입력해주세요.");
			return false;
		}
		if( $("#phone23").val() === "" || + $("#phone23").val() === null) {
			alert("휴대전화를 입력해주세요.");
			return false;
		}
		/*
		if($("#tit01").val() === "" || $("#tit01").val() === null) {
			alert("제목을 입력해주세요.");
			return false;
		}
		if($("#textArea").val() === "" || $("#textArea").val() === null) {
			alert("내용을 입력해주세요.");
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

	
		$('#bgFullImg').append('<div class="customer-bg consulting"></div>');
		
		/* 전시상세 구매에서 넘어왔을경우 구매탭으로 바로 이동 시킵디다.*/
		if(Gbn == 'o2o'){$('#rent').click();}		
		
		//검색 버튼 클릭 시 - modal-1 레이어 팝업 호출
		//LAYER POP CLICK EVENT > 차량 간편 검색 선택 시
		//검색 순서 제조사 > 모델명 > 사이즈
		$("input[name='carSearch']").on("click" , function(){
			$(".scrollBox").hide();
			//차종 선택 시 - 제조사 화면 오픈(제조사 검색)
			$("#searchGbn").val("C");

			//common ajax call
			var pUrl = "/product/selectMakerList";
			var pSendData = {classCd : "", recomYn : "" , makerCd : "" , systemGbn:"R"};
			evManager.commonAjax(pUrl, pSendData, callBackManager.makerList);
			// end tag -- common ajax call
		});

		//제조사 선택 이벤트 > 모델 선택 화면 오픈
		$(document).on("click","input[name='makerCd']" , function(){
			$("#makerCd").val($(this).val());
			$("#makerNm").val($(this).attr("makerNm"));

			//모델 목록 조회
			var pUrl = "/product/selectModelList";
			var pSendData = {classCd : "", recomYn : "" , makerCd : $("#makerCd").val() , systemGbn:"R"};
			evManager.commonAjax(pUrl, pSendData, callBackManager.selectModelList);
		});
		// -- end tag

		//모델 선택 이벤트 > 사이즈 선택 화면 오픈
		$(document).on("click","input[name='modelCd']" , function(){
			$("#modelCd").val($(this).val().split("^")[0]);
			$("#contentsCd").val($(this).val().split("^")[1]);
			$("#modelNm").val($(this).attr("modelNm"));

			//사이즈 목록 조회
			var pUrl = "/product/selectTireSizeList";
			var pSendData = {modelCd : $("#modelCd").val() , contentsCd : $("#contentsCd").val(), recomYn : "" , classCd : "", niceGradeCd: null , systemGbn:"R"};
			evManager.commonAjax(pUrl, pSendData, callBackManager.selectTireSizeList);
		});
		
		//사이즈 , 인치 선택 이벤트 > 사이즈 , 인치 선택 화면 오픈
		$(document).on("click","input[name='modelSize'] , input[name='inches'] " , function(){
			var gbn = ""; //이벤트 구분 - 화면이 틀려짐

			//사이즈
			if($(this).attr("name") == "modelSize") {
				gbn = "S";
				$("#TireSizeCd").val($(this).val());
				$("#TireSizeNm").val($(this).attr("sizeNm"));
				$("#sectionWidth").val($(this).val().split("^")[0]);
				$("#aspectRatio").val($(this).val().split("^")[1]);
				$("#wheelInches").val($(this).val().split("^")[2]);
				$("#plyRating").val($(this).attr("plyRating"));
			}
			//인치
			else {
				gbn = "I";
				$("#wheelInches").val($(this).val());
				$("#plyRating").val($(this).attr("plyRating"));
			}

			//필터와 구분 하기 위해
			evManager.searchYn = true;
			$("span.filter").text(0);
			$("span.filter").text(0);

			//검색 여부
			evManager.searchYn = true;

			//팝업 종료
			$("#maker").text($("#makerNm").val());
			$("#size").text($("#TireSizeNm").val());
			$("#model").text($("#modelNm").val());
			$(".layPopClose").click();
			
			//var pUrl = "/product/selectPrdList";
			//파라미터는 공통으로 사용 - evManager.listParam()
			//evManager.commonAjax(pUrl, evManager.listParam(), callBackManager.selectMakePrdList , gbn);
		});
		
		$("#rentCounselReg").on("click", function() {
			
			if(chkRentValidation()) {
				this.setAttribute("disabled","disabled");
		        var fParam = new FormData();
		        var tireSizeCd = $("#TireSizeCd").val() + "";
		        var tireSizeCd2 = tireSizeCd.replace("^","/");
		        var tireSizeCd3 = tireSizeCd2.replace("^","R");
		        
		        fParam.append("custNm", $("#name").val());
		        fParam.append("mobNo", $("#phone11").val() + $("#phone12").val() + $("#phone13").val());
		        /*
		        fParam.append("addr", $("#info03").val());
		        fParam.append("mcNm", $("#model").text());
		        fParam.append("specNm", tireSizeCd3);
		        fParam.append("cnt", $("#quantity").val());
		        fParam.append("zipCd", $("#zipCode").val());
		        */
		        fParam.append("addr", "");
		        fParam.append("mcNm", "");
		        fParam.append("specNm", "");
		        fParam.append("cnt", "");
		        fParam.append("zipCd", "");
		        
		        fParam.append("contactGet", "");
		        
		        $("#loadingWrap").show();
		        //cfnSendRequest("/mypage/insertQuestion",param,'insertQuestion');
				$.ajax({
				    url: "/bbs/insertRentCounsel",
				    type: "POST",
				    cache: false,
				    data: fParam,
				    processData: false,
		            contentType: false,
				    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
				    success: function(data) {
				    	$("#loadingWrap").hide();
				    	if(data.rtnCode == "0") {
				    		alert("성공적으로 등록 되었습니다.");
				    		location.href = "/bbs/counselRegister";
				    	} else {
				    		alert("관리자에게 문의하세요.");
				    	}
				    },
				    error: function (request, status, error) {
				    	$("#loadingWrap").hide();
				    	alert(error);
					}
				});
			}
		});

		$("#purcCounselReg").on("click", function() {
			
			if(chkPurcValidation()) {
				this.setAttribute("disabled","disabled");
				var form = $('#frm')[0];
		        //FormData parameter에 담아줌
		        var fParam = new FormData();
		        
		        fParam.append("writNm", $("#name01").val());
		        fParam.append("mobNo", $("#phone21").val() + $("#phone22").val() + $("#phone23").val());
		        /*
		        fParam.append("title", $("#tit01").val());
		        fParam.append("cont", $("#textArea").val());
		        fParam.append("qustClsCd", "6");
		        */
		        fParam.append("title", "");
		        fParam.append("cont", "");
		        fParam.append("qustClsCd", "6");
		        
		        if(fileData01 !== "" && fileData01 !== null) {
		        	fParam.append("bizFiles", fileData01);
		        }
				
		        $("#loadingWrap").show();
		        //cfnSendRequest("/mypage/insertQuestion",param,'insertQuestion');
				$.ajax({
				    url: "/bbs/insertPurcCounsel",
				    type: "POST",
				    cache: false,
				    data: fParam,
				    processData: false,
		            contentType: false,
				    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
				    success: function(data) {
				    	$("#loadingWrap").hide();
				    	if(data.rtnCode == "0") {
				    		alert("성공적으로 등록 되었습니다.");
				    		location.href = "/bbs/counselRegister";
				    	} else {
				    		alert("관리자에게 문의하세요.");
				    	}
				    },
				    error: function (request, status, error) {
				    	$("#loadingWrap").hide();
				    	alert(error);
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
		,
		//제조사 선택 팝업
		makerList : function(data){
			var htmlStr = "";
			htmlStr	+= "<div class='simple-swipe-outer'>";
			htmlStr	+= "	<div class='simple-swipe-box'>";
			htmlStr	+= "		<div class='simple-swipe'>";
			htmlStr	+= "			<div class='inset-m current'>제조사 선택</div>";
			htmlStr	+= "			<div class='step'></div>";
			htmlStr	+= "			<div class='inset-m'>모델명 선택</div>";
			htmlStr	+= "			<div class='step'></div>";
			htmlStr	+= "			<div class='inset-m'>사이즈 선택</div>";
			htmlStr	+= "		</div>";

			htmlStr	+= "		<ul class='size-select car-brand inset-m'>";
			for(var i=0; i < data.length; i++) {
				htmlStr	+= "		<li class='radio col-3 text-center'>";
				htmlStr	+= "			<input type='radio' id='makerCd1" + (i+1) + "' name='makerCd' value='"+data[i].searchCd+"' makerNm='"+data[i].searchCdNm+"'>";
				htmlStr	+= "			<label for='makerCd" + (i+1) + "'>";
				htmlStr	+= "				<img src='/img/carLogo/" + data[i].searchCd + ".png '  alt='"+data[i].searchCdNm+"'>";
				//htmlStr	+= "				<span>" + data[i].searchCdNm + "</span>";
				htmlStr	+= "			</label>";
				htmlStr	+= "		</li>";
				
			}
			htmlStr	+= "		</ul>";
			htmlStr	+= "	</div>";
			htmlStr	+= "</div>";

			$("#searchClCdArea").html(htmlStr);
			$('#searchClCdArea').css("display","block");

			//화면 disabled
			$("#modal-3").addClass("md-show");
			$(".scrollBox").eq(0).show();
		}
		,
		//모델 선택 팝업
		selectModelList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='simple-swipe-outer'>";
			htmlStr	+= "	<div class='simple-swipe-box'>";
			htmlStr	+= "		<div class='simple-swipe'>";
			htmlStr	+= "			<div class='inset-m'>" + $("#makerNm").val() + "</div>";
			htmlStr	+= "			<div class='step on'></div>";
			htmlStr	+= "			<div class='inset-m current'>모델명 선택</div>";
			htmlStr	+= "			<div class='step'></div>";
			htmlStr	+= "			<div class='inset-m'>사이즈 선택</div>";
			htmlStr	+= "		</div>";

			htmlStr	+= "		<ul class='size-select inset-m'>";
			for(var i=0; i < data.length; i++) {
				htmlStr	+= "		<li class='radio col-1 text-left'>";
				htmlStr += "			<input type='radio' name='modelCd' id='modelCd" + (i+1) + "' value='"+data[i].searchCd+"' modelNm='"+data[i].searchCdNm+"' classCd='"+data[i].classCd+"' class='type04 w300'>";
				htmlStr	+= "			<label for='modelCd"+(i+1)+"'>" + data[i].searchCdNm + "</label>";
				htmlStr	+= "		</li>";
			}
			htmlStr	+= "		</ul>";
			htmlStr	+= "	</div>";
			htmlStr	+= "</div>";

			$("#modelArea").html();
			$("#modelArea").html(htmlStr);
			$('#modelArea').css("display","block");

			var titleHtmlStr = "";
			titleHtmlStr += "<ul>";
			titleHtmlStr += "<li>" + $("#makerNm").val() + "</li>";
			titleHtmlStr += "<li></li>";
			titleHtmlStr += "</ul>";
			$("#modal-4").children(".sizeSelectView").html(titleHtmlStr);

			$("#modal-3").removeClass("md-show");
			$("#modal-4").addClass("md-show");
			$(".scrollBox").eq(1).show();
		}
		,
		//사이즈 선택 팝업
		selectTireSizeList : function(data) {
			var htmlStr = "";
			htmlStr	+= "<div class='simple-swipe-outer'>";
			htmlStr	+= "	<div class='simple-swipe-box'>";
			htmlStr	+= "		<div class='simple-swipe'>";
			htmlStr	+= "			<div class='inset-m'>" + $("#makerNm").val() + "</div>";
			htmlStr	+= "			<div class='step on'></div>";
			htmlStr	+= "			<div class='inset-m'>" + $("#modelNm").val() + "</div>";
			htmlStr	+= "			<div class='step on'></div>";
			htmlStr	+= "			<div class='inset-m current'>사이즈 선택</div>";
			htmlStr	+= "		</div>";
			
			htmlStr	+= "		<ul class='size-select inset-m'>";
			for(var i=0; i < data.length; i++) {
				htmlStr	+= "		<li class='radio col-2'>";
				htmlStr += "			<input type='radio' name='modelSize' id='modelSize" + (i+1) + "' value='"+data[i].searchCd+"' sizeNm='"+data[i].description + " "+ data[i].searchCdNm+"' classCd='"+data[i].classCd+"' plyRating='"+data[i].plyRating+"' class='type04'>";
				htmlStr	+= "			<label for='modelSize"+(i+1)+"'>" + data[i].description+ " " + data[i].searchCdNm + "</label>";
				htmlStr	+= "		</li>";
			}
			htmlStr	+= "		</ul>";
			htmlStr	+= "	</div>";
			htmlStr	+= "</div>";

			$("#sizeArea").css("display","block");
			$("#sizeArea").html();
			$("#sizeArea").html(htmlStr);

			var titleHtmlStr = "";
			titleHtmlStr += "<ul>";
			titleHtmlStr += "<li>" + $("#makerNm").val() + "</li>";
			titleHtmlStr += "<li>" + $("#modelNm").val() + "</li>";
			titleHtmlStr += "<li></li>";
			titleHtmlStr += "</ul>";
			$("#modal-5").children(".sizeSelectView").html(titleHtmlStr);

			$("#modal-4").removeClass("md-show");
			$("#modal-5").addClass("md-show");
			$(".scrollBox").eq(2).show();
		}
	}
	/* ################################# AJAX CALLBACK ARAR #################################  */
</script>