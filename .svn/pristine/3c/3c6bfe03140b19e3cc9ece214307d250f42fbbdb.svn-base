<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>
<%@ page import="com.nexwrms.core.util.SessionUtil" %>


<div>

<br/>
<br/>
<br/>
<br/>
<br/>
 
MAIN BODY
<br/>
<%if(SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO) != null){ %>
<!-- 로그아웃 테스트 영역 시작 -->
<div class="logout">  
	<form id="logoutFrm" name="logoutFrm" method="post" action="/login/logout">
	<h2 class="type01">******* 로그아웃 테스트 *****</h2>         
        <li>
            <button type="button" name="" class="type12 w100per" onClick="javascript:logout();">Logout</button>
            <input type="hidden" id="usrId" name="usrId" value="<%=SessionInfoUtil.getRentalUsrId() %>">
        </li>
    </ul>
    </form>
</div>
<!-- 로그아웃 테스트 영역 종료 -->
<%}else{%>
<!-- 로그인 테스트 영역 시작 -->
<div class="login">  
	<form id="loginFrm" name="loginFrm" method="post" action="/login/userLogin">
	<input type="hidden" id="sendUrl" name="sendUrl" value="/main">
        <li>
            <button type="button" name="" class="type12 w100per" onClick="javascript:goTologin();">Login</button>
        </li>
    </ul>
    </form>
</div>
<!-- 로그인 테스트 영역 종료 -->	      
<%}%>
<br>
<br>
<br>
<br>
<!-- KCP 연동 테스트 영역 시작 -->
<div class="kcp">  
	<h2 class="type01">******* KCP 연동 테스트 *****</h2>         
    <ul class="idpw">
        <li>
            <button type="button" name="" class="type12 w100per" onClick="javascript:fnKcpOrder();">KCP 결제 테스트</button>
        </li>
    </ul>
</div>
<!-- KCP 연동 테스트 영역 시작 -->	  


<!-- 컨텐츠영역 시작 -->
<form id="form" name="form" action="">
	<input type="hidden"	id="curPage"	name="curPage"	value="${pageCommon.pageNo eq null or pageCommon.pageNo eq '' ? 1 : pageCommon.pageNo }"/>
	
</form>
<div class="contents quickWrap">
	<h2 class="type01">******* 데이터 리스트 조회 테스트(페이징-번호) *****</h2>
	
	<!--공지사항 리스트-->
	<div class="listTable">
		<div class="num">전체 &nbsp;<span id="totCnt"></span>&nbsp;건</div>

		<table class="tableStyle03">
			<colgroup>
				<col class="w980" />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col" class="last">등록일</th>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
	</div>
	<!--공지사항 리스트-->

	<!-- 페이징 표시 -->
	<div class="paging" id="paging" style="display:none;"></div>
	<!-- 페이징 표시 -->

</div>
<!-- 컨텐츠영역 끝 -->
<br/>
<br/>
<br/>
<br/>
<br/>
</div>

<script type="text/javascript">

function fnKcpOrder() {
	document.location.href="/order/ordSamplePage";
	/* $.popModalCenter({
		url       : "/order/openKcpPayment",
		scroll    : "yes",
		width     : "940",
		resizable : "yes"
	}); */
}


$( document ).ready(function() {

	fnList(1);
});



function fnList(curPage){

	CodeUtil.getCodeName("FI004", '04' , changeBankNm);
	CodeUtil.getCodeList("FI004", changeBankNmList);
	CodeUtil.getCodeInfo("CM032", 'CODE', 'refCd1', changeBankNmInfo);
	
	
	var url = '/main/noticeList';
	var reqId = 'noticeList';
		
	
	var params = {
			searchFromDate:'20190101'
			,searchToDate:'20191231'
			,pageNo:curPage
	};
	
	$("#curPage").val(curPage);
	
	/*
	 * 리퀘스트 함수 
	 */
	cfnSendRequest(url, params, reqId);
	
	
	//window.location.hash = '#page' + curPage;
}

function changeBankNm(data) {
	console.log("data : " + data);
}

function changeBankNmList(list) {
	console.log("list : " + list);
	for(var i=0;i<list.length;i++){
		var item = list[i];
		console.log("cmCd : " + item.cmCd + ", cmCdNm : " + item.cmCdNm);
	}
}

function changeBankNmInfo(item) {
	console.log("refCd1 : " + item.refCd1);
}


/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	if(result.rtnCode == 0){
		console.log("result.rtnCode : " + result.rtnCode);
		console.log("result.rtnMsg : " + result.rtnMsg);
		if(callback == 'noticeList'){
			var list = result.list;
			var pageCommon = result.pageCommon;

			$('#list').empty();

			var html = '';
			for(var i=0;i<list.length;i++){
				var item = list[i];
				html += '<tr>';
				html += '	<td>';
				html += '		<a href="#" class="tit01 ico" > ';
				html += 			item.subject +'</a>';
				html += '	</td>';	
				html += '	<td>';
				html += 			item.regUsrNm;
				html += '	</td>';	
				html += '</tr>';
			}

			$('#list').append(html);
			$('#totCnt').text(pageCommon.totalCount);

			PageUtil.fnPageMakeDisplay(pageCommon.totalCount, pageCommon.pageNo, $('#paging'), 'fnList', pageCommon.pageSize);


		}else{
			$('#totCnt').text('0');
			$('#list').empty();
			$('#list').append('<td colspan="2" class="noResult">등록된 공지사항이 없습니다.</td></tr>');
			$('#paging').hide();
		}
		
	}
	
	ComUtil.unloading();
	
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
	if(callback == 'noticeList'){
		alert(status);
		ComUtil.unloading();
	}
	
}

/*
 * 윈도우 팝업 오픈
 */
function fnWinPopOpen(sUrl){
	$.popModalCenter({
		url       : sUrl,
		scroll    : "yes",
		width     : "940",
		resizable : "yes"
	});
}

function loginProcKakao() {
	
	
	var sUrl = "https://kauth.kakao.com/oauth/authorize"
		+ "?client_id=" + "8c639ea0511905bdd4f17ec930b1dd63"
		+ "&redirect_uri=" + "http://localhost:18080/loginProcKakao"
		+ "&response_type=code" 
		+ "&state=/product/main"
		+ "&encode_state=true"	
	fnWinPopOpen(sUrl);
	
	
};

function logout() {
	document.logoutFrm.submit();
}


function goTologin() {
	document.loginFrm.submit();
}


</script>