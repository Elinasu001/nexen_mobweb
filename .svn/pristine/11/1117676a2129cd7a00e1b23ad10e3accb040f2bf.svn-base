<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

		<!--subContentsWrap-->
        <div class="subContentsWrap"> 
            <div class="subContents">
                <div class="descInfo type06">
                    <h3 class="type08">회원탈퇴 시 아래 내용을 꼭 확인해 주세요.</h3>
                </div>
                <!-- dropform Start -->
                <form name="dropform">
                <div class="secession">
                    <!-- 회원탈퇴 -->
                    <table class="tbl submit">
                        <caption>회원탈퇴</caption>
                        <colgroup>
                            <col style="width:150px">
                            <col >
                        </colgroup>
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <!--내용에 동의-->
                                    <div class="agreeBox">
                                        <p>
                                            <input type="checkbox" id="agree" name="agree" class="type01"><label for="agree" class="fb po_04"><span></span>내용을 확인했으며, 해당 내용에 동의합니다.</label>
                                        </p>
                                        
                                        <div class="conView">
                                            <dl>
                                                <dt>01</dt>
                                                <dd>회원 탈퇴를 하실 경우 회원님의 모든 정보가 삭제 되니 신중하게 결정하셔서 신청해 주세요.</dd>
                                            </dl>
                                            <dl>
                                                <dt>02</dt>
                                                <dd>회원탈퇴 신청 즉시 회원전용 서비스의 이용이 불가능합니다. 회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로, 게시물을 편집하거나 삭제하기 바라시는 경우 게시물 편집/삭제 후 회원 탈퇴를 해 주세요.</dd>
                                            </dl>
                                            <dl>
                                                <dt>03</dt>
                                                <dd>넥센타이어는 탈퇴한 회원의 개인정보를 90일간 보유 후 삭제처리가 진행됩니다.</dd>
                                            </dl>
                                            <dl>
                                                <dt>04</dt>
                                                <dd>회원 탈퇴를 신청하면 고객님의 아이디가 삭제되어 재가입시 다시 사용하실 수 없으며 SNS 연동이 해지됩니다.</dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <!--내용에 동의-->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="tit01"><span class="black">아이디</span></label> 
                                </th>
                                <td>
                                    <p>
										<input type="text" id="custId" name="custId" value="${userLoginId}" class="type03 w280"  title="아이디" readonly="readonly" data-json-obj="true" />
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="tit01"><span class="essen black">탈퇴사유</span></label> 
                                </th>
                                <td>
                                    <select class="type04 w280" name="brkyResnCd" id="brkyResnCd" title="탈퇴사유 선택">
                                        <option value="0">탈퇴사유선택</option>
                                        <option value="1">제품사용중단</option>
                                        <option value="2">사이트 이용 빈도 낮음</option>
                                        <option value="3">회원가입 혜택 부족</option>
                                        <option value="4">서비스 불만</option>
                                        <option value="5">개인정보 유출 우려</option>
                                        <option value="6">메일 과다 발송</option>
                                        <option value="7">기타</option>     
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="con01"><span class="essen black">내용</span></label>
                                    <em><div class="byte"><span class="cnt" id="messagebyte">0</span> / 2000 Byte</div></em>
                                </th>
                                <td>
                                    <textarea  name="brkyResnCont" id="brkyResnCont" title="탈퇴사유 입력란" placeholder="탈퇴사유를 입력해주세요" class="type02 h200" onkeyup="chkword(this, 2000);"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- 회원탈퇴 -->              
                </div>
                </form>
                <!-- dropform End -->              
                
              
                <div class="btnArea type01 center">
                     <button type="button" class="type05 center w387" onclick="javascript:fn_back();">취소</button>
                     <button type="button" class="type01 center w387" onclick="javascript:userDropOut();">회원탈퇴</button>
                </div>
            </div>
		</div>
		<!--subContentsWrap-->

<script type="text/javascript">
var userLoginId = "${userLoginId}";


$(document).ready(function() {

	//evManager.init();
	
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
        alert(maxByte + "자를 초과 입력 할 수 없습니다.");
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
			alert('탈퇴 되었습니다.');
			logout();
			//location.href = "/main";
		}
	} else {
		if(callback == 'deleteCustInfo') {
			alert('탈퇴처리가 실패되었습니다.');
		}
	}
	
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	
	if(callback == 'deleteCustInfo'){
		alert('탈퇴처리가 실패되었습니다.');
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
			alert("탈퇴사유를 선택해십시오.");                    
			$("#brkyResnCd").focus();                                    
			return false;
		} 
		
		var custId = "${userLoginId}";
		
		var pUrl = "/mypage/deleteCustInfo";
		
		var pParams = {
				custId 		: custId
				,brkyResnCd  : brkyResnCd
				,brkyResnCont : $("#brkyResnCont").val()
		};
		cfnSendRequest(pUrl,pParams,'deleteCustInfo');
		
	} else {
		alert("탈퇴내용에 동의 해주십시오");
	}
	
}



</script>
    