<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

		
	<!-- subContentsWrap -->
    <div class="subContentsWrap">
    	<main class="mynexen">
			<!-- header -->
          	<div class="page-header empty">
            	<h2 class="title-deco">
              		<span>궁금증을</span> <span>해결하세요.</span>
            	</h2>
            	<h3 class="title-deco-sub">1:1문의</h3>
          	</div>
          	<!-- //header -->
          
          	<div class="order-middle-message text-center">
            	<p>고객님의 타이어,<br>넥스트 레벨이 관리해 드립니다.</p>
            	<div class="order-info-summary">
              		<small>넥스트레벨은 항상 고객님께 최상의 서비스로 보답하려고 노력하고 있습니다.</small>
            	</div>
          	</div>

          	<div class="mynexen-review contact">
            	<p><label for="target-product" class="black">문의유형</label></p>                      
	            <div>
		            <ul>
		            	<li class="radio col-2">
		                	<input type="radio" name="qType" id="qType01" checked="checked" value="1" class="radioChk" title="신용카드 선택">
		                    <label for="qType01"><span>신용카드</span></label>
		                </li>
		                <li class="radio col-2">
		                    <input type="radio" name="qType" id="qType02" value="2" class="radioChk" title="계좌이체 선택">
		                    <label for="qType02"><span>계좌이체</span></label>
		                </li>
		                <li class="radio col-2">
		                    <input type="radio" name="qType" id="qType03" value="3" class="radioChk" title="장착관련 선택">
		                    <label for="qType03"><span>장착관련</span></label>
		                </li>
		                <li class="radio col-2">
		                    <input type="radio" name="qType" id="qType04" value="4" class="radioChk" title="배송/반품/교환/AS 선택">
		                    <label for="qType04"><span>배송/반품/교환/AS</span></label>
		                </li>
		                <li class="radio col-2">
		                    <input type="radio" name="qType" id="qType05" value="5" class="radioChk" title="기타 선택">
		                    <label for="qType05"><span>기타</span></label>
		                </li>
					</ul>
					<span class="alert">※ '렌탈' 관련 문의 사항은 원활한 상담을 위해 고객센터 ☎1855-0100으로 문의 바랍니다.</span>
				</div>
		        <p class="mt-m"><label id="review-title" class="essen black">제목</label></p>
		        <div class="border-bottom">
		        	<input name="tit01" type="text" id="tit01" class="pl-0 type03" placeholder="제목을 입력해주세요" maxlength="30" onkeyup="document.getElementById('tit01').innerHTML=fn_chkByte(this,100);">
		        </div>
		            
				<p class="mt-m"><label id="review-box" class="essen black">내용</label></p>
		        <div class="text-right border-bottom">
		        	<textarea id="textArea" name="textArea" placeholder="내용을 입력해주세요" onkeyup="document.getElementById('nowByte').innerHTML=fn_chkByte(this,2000);"></textarea>
		            <small class="font-gray" id="nowByte">0</small><small class="font-gray">/2000 Byte</small>
				</div>
            
	        	<p class="mt-m essen black">첨부이미지</p>
	        	<form>
	            	<div class="fileUpWrap layout-c">
	                	<div class="layout-r border-bottom">
	                  		<div class="file-caption pt-s pb-s font-gray" id="imgFileNm">5MB 이하의 jpg, png, bmp 만 가능</div>
	               			<div class="file-attach align-middle">
	                 			<input id="fileUp01" name="fileUp01" type="file" accept=".jpg, .png, image/jpeg, image/png" multiple onchange="readURL(this);">
	                 			<label for="fileUp01">파일검색</label>
	               			</div>
	                	</div>
	                
						<div class="preview">
		                	<button id="cancel" class="cancel hide" onclick="return false">취소</button>
		                  	<!-- <div id="attach-image"></div> -->
		                  	<img id="fileUp02" name="fileUp02" alt="" src=""/>
		                </div>
					</div>
				</form>
			</div>

          	<div class="btn-wrap layout-r same-size">
            	<button type="button" class="inset-m full-width btn-gray-light" id="goBackList">취소</button>
            	<button type="button" class="inset-m full-width btn-primary" id="quetionReg">등록</button>
          	</div>
        </main>
	</div>
    <!-- //subContentsWrap -->


<script type="text/javascript">

	var fileData01 = "";
	
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
		
		return liByte+"Byte";
	}
	
	// 이미지 업로드
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
	
	//필수값 체크 validation
	function chkValidation(){
		
		if($("#tit01").val() === "" || $("#tit01").val() === null) {
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if($("#textArea").val() === "" || $("#textArea").val() === null) {
			alert("내용을 입력해주세요.");
			return false;
		}
		
	    return true;
	}
	$( document ).ready(function() {
		/* page background image Start */
		$("#bgFullImg").append("<div class='member-bg question-list'></div>");
		/* page background image End */
		
		$("#goBackList").on("click", function() {
			location.href = '/mypage/questionList';
		});

		$("#quetionReg").on("click", function() {
			
			if(chkValidation()) {
				this.setAttribute("disabled","disabled");
				
				var form = $('#frm')[0];
		        //FormData parameter에 담아줌
		        var fParam = new FormData();
		        
		        fParam.append("title", $("#tit01").val());
		        fParam.append("cont", $("#textArea").val());
		        fParam.append("qustClsCd", $("input:radio[name=qType]:checked").val());
		        if(fileData01 !== "" && fileData01 !== null) {
		        	fParam.append("bizFiles", fileData01);
		        }

		        
		        
		        //cfnSendRequest("/mypage/insertQuestion",param,'insertQuestion');
				$.ajax({
				    url: "/mypage/insertQuestion",
				    type: "POST",
				    cache: false,
				    data: fParam,
				    processData: false,
		            contentType: false,
				    //contentType:"application/x-www-form-urlencoded;charset=UTF-8",  // ajax 통신으로 보내는 타입
				    success: function(data) {
				    	if(data.rtnCode == "0") {
				    		$("#goBackList").click();
				    	} else {
				    		alert("관리자에게 문의하세요.");
				    	}
				    },
				    error: function (request, status, error) {
				    	alert(error);
					}

				});
			}
		});
	});
</script>