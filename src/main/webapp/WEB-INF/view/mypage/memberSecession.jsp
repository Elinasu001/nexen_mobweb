<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<!-- subContentsWrap -->
      <div class="subContentsWrap">
        <main class="mynexen mynexen-member">
          <!-- header -->
          <div class="page-header">
            <h2 class="title-deco">
              <span>${userLoginNm}님.</span> <span>감사했습니다.</span>
            </h2>
            <h3 class="title-deco-sub">회원 탈퇴</h3>
          </div>          
          <!-- //header -->

          <div class="inset-m payment">
            <p>
                넥스트레벨을 이용해주셔서 감사합니다.<br>
              <small>사이트 이용 시 불편하셨던 점을 말씀해주시면, 더 나은 서비스로 보답 드리겠습니다.</small>
            </p>
          </div>

          <div class="inset-m bg">
            
            <h3 class="contents-title">회원탈퇴 시 아래 내용을 꼭 확인해주세요.</h3>
            
            <div class="pt-m pb-s mb-l border-bottom">
              <div class="check border-bottom pb-s mb-m">
                <input type="checkbox" id="agree" name="agree" value="0" class="type01">
                <label for="agree" class="layout-r"><span class="align-middle"></span><b class="align-middle">내용을 확인했으며, 해당 내용에 동의합니다. </b></label>
              </div>
              <div class="secession-check">
                <ol>
                  <li>회원 탈퇴를 하실 경우 회원님의 모든 정보가 삭제 되니 신중하게 결정하셔서 신청해 주세요.</li>
                  <li>회원탈퇴 신청 즉시 회원전용 서비스의 이용이 불가능합니다. 회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로, 게시물을 편집하거나 삭제하기 바라시는 경우 게시물 편집/삭제 후 회원 탈퇴를 해 주세요.</li>
                  <li>넥센타이어는 탈퇴한 회원의 개인정보를 90일간 보유 후 삭제 처리가 진행됩니다.</li>
                  <li>회원 탈퇴를 신청하시면 고객님의 아이디가 삭제되어 재가입시 다시 사용하실 수 없으며 SNS 연동이 해지됩니다.</li>
                </ol>
              </div>
            </div>

            <div class="submit layout-c mb-ml">
              <label for="id01"><span class="black">아이디</span></label>
              <div class="layout-r border-bottom">
                <input type="text" value="${userLoginId}" class="pl-0 trans-bg" id="custId" name = "custId">
              </div>
            </div>

            <div class="submit order-basket mb-ml border-bottom">
              <p class="essen black">탈퇴 사유</p>
              <select class="" name="brkyResnCd" id="brkyResnCd" id="coupon" title="탈퇴 사유">
                <option value="0">탈퇴사유선택</option>
                <option value="1">제품사용중단</option>
                <option value="2">사이트 이용 빈도 낮음</option>
                <option value="3">회원가입 혜택 부족</option>
                <option value="4">서비스 불만</option>
                <option value="5">개인정보 유출 우려</option>
                <option value="6">메일 과다 발송</option>
                <option value="7">기타</option>     
              </select> 
            </div>

            <div class="submit border-bottom">
              <p class="essen black">내용</p>
              <div class="text-right border-bottom">
                <textarea name="review-box" name="brkyResnCont" id="brkyResnCont" placeholder="탈퇴사유를 입력해주세요" spellcheck="false" title="탈퇴사유"></textarea>
                <small class="font-gray" id="messagebyte">0/2000 Byte</small>
              </div>
            </div>
          </div>

          <div class="layout-r">
            <button type="button" class="inset-m full-width btn-gray-light" onclick="javascript:fn_back();">취소</button>
            <button type="button" class="inset-m full-width btn-primary" onclick="javascript:userDropOut();">회원 탈퇴</button>
          </div>
        </main>
      </div>
      <!-- //subContentsWrap -->
      
      
      
<script type="text/javascript">
var userLoginId = "${userLoginId}";


$(document).ready(function() {
	//evManager.init();
	/* page background image Start */
	$("#bgFullImg").append("<div class='member-bg mynexen-secession'></div>");
	/* page background image End */
});

//textarea byte 체크
function chkword(obj, maxByte) {
	 
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }
    
    document.getElementById('messagebyte').innerText = totalByte+"byte";
    
    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
        ComUtil.alert(maxByte + "자를 초과 입력 할 수 없습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 4000);
    }
}

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {

	//console.log("result : " + result);
	//console.log("result.rtnCode : " + result.rtnCode);
	//console.log("result.rtnMsg : " + result.rtnMsg);
	
	if(result.rtnCode == 0) {
		if(callback == 'deleteCustInfo') {
			ComUtil.alert('탈퇴 되었습니다.');
			logout();
			//location.href = "/main";
		}
	} else {
		if(callback == 'deleteCustInfo') {
			ComUtil.alert('탈퇴처리가 실패되었습니다.');
		}
	}
	
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	
	if(callback == 'deleteCustInfo'){
		ComUtil.alert('탈퇴처리가 실패되었습니다.');
		//location.href = "/main";
	}
	ComUtil.unloading();
}

function fn_back() {
	location.href = "/mypage/memberModify";
}
function userDropOut() {
	
	if ($('input:checkbox[id="agree"]').is(":checked")) {

		var brkyResnCd = $("#brkyResnCd").val();
		if (brkyResnCd == "0") {                     
			ComUtil.alert("탈퇴사유를 선택해십시오.");                    
			$("#brkyResnCd").focus();                                    
			return false;
		} 
		
		ComUtil.confirm("탈퇴 진행하시겠습니까?",""
				,function(){ 
					var custId = "${userLoginId}";
					
					var pUrl = "/mypage/deleteCustInfo";
					
					var pParams = {
							custId 		: custId
							,brkyResnCd  : brkyResnCd
							,brkyResnCont : $("#brkyResnCont").val()
					};
					cfnSendRequest(pUrl,pParams,'deleteCustInfo');
				}
		);
		
	} else {
		ComUtil.alert("탈퇴내용에 동의 해주십시오");
	}
	
}



</script>      