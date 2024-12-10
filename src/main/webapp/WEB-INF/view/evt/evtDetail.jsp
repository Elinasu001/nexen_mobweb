<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<link type="text/css" rel="stylesheet" href="/css/OverlayScrollbars.css">
<script type="text/javascript" src="/js/lib/jquery.overlayScrollbars.js"></script>
<script type="text/javascript" src="/js/scroll.js"></script>

<script type="text/javascript" src="/js/lib/classie.js"></script>
   <script type="text/javascript" src="/js/lib/modalEffects.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>

<!-- subContentsWrap -->
      <div class="subContentsWrap">
        <main>
          <!-- header -->
          <div class="page-header empty">
            <h2 class="title-deco">
              <span>다양한 이벤트를</span> <span>만나보세요.</span>
            </h2>

            <h3 class="title-deco-sub">이벤트</h3>
          </div>
          <!-- header -->

          <div class="listDetailWrap">
            <!-- listHeader -->
            <div class="listHeader">
              <dl>
                <dt>
                  <span class="state" id="compYn"></span>
                  <span class="state">기간 : ${evtDetailVo.getEvent_str_dy()}~${evtDetailVo.getEvent_end_dy()}</span>
                </dt>
                <dd class="f_ell full-width">${evtDetailVo.getTitle()}</dd>
              </dl>
            </div>
            <!-- listHeader -->

            <!-- listCon-->
            <div class="listCon bgW pl-0 pr-0">
              <p>
                <%-- <img src="<%=AppContext.getString(WebConstants.FileDir.IMGFILE_RENTAL_URL)%>/atfile_cms/${evtDetailVo.atflPathNm}" alt=""/>
                                <br/> --%>
                ${evtDetailVo.getCont() }

						<p>
<!-- <img alt="" src="/img/main/1주.jpg" border="0" usemap="#Map"> -->
<!-- <map name="Map"> -->
<!-- <area id="btnCpn" shape="rect" coords="99,960,416,1038" target="_blank"> </map> -->
<!-- <area id="btnCpn" shape="rect" coords="322,955,639,1037" target="_blank"> </map> -->
<!-- <area id="btnCpn" shape="rect" coords="545,961,860,1037" target="_blank"> </map> -->
<!-- <area id="btnCpn" shape="rect" coords="766,961,1082,1037" target="_blank"> </map> -->
<!-- </p> -->
              </p>
            </div>
            <!-- listCon -->

            <!-- listHeader -->
            <div class="listPreNext">

              	<c:choose>
              		<c:when test="${param.tabNo eq '22'}">
              		<div class="list-nav">
              			<a href='/evt/evtDetail?bdojSeq=${evtWinPostVo.getBdojSeq()}&tabNo=22' class="link-box"></a>

						<dl>
                  			<dt>
                  			이전글
                  			</dt>
                  			<dd class="f_ell full-width">
                  			<a href='#'>${evtWinPostVo.getTitle()}</a>
                  			</dd>
                  		</dl>
                  		</div>
                  		<div class="list-nav">
                  		<a href='/evt/evtDetail?bdojSeq=${evtWinPreVo.getBdojSeq()}&tabNo=22' class="link-box"></a>
						<dl>
                  			<dt>
                  			다음글
                  			</dt>
                  			<dd class="f_ell full-width">
                  			<a href='#'>${evtWinPreVo.getTitle()}</a>
                  			</dd>
                  		</dl>
                  		</div>
              		</c:when>

              		<c:when test="${param.tabNo eq '11'}">
              		<div class="list-nav">
              			<a href='/evt/evtDetail?bdojSeq=${evtPostVo.getBdojSeq()}&tabNo=11' class="link-box"></a>
						<dl>
                  			<dt>
                  			이전글
                  			</dt>
                  			<dd class="f_ell full-width">
                  			<a href='#'>${evtPostVo.getTitle()}</a>
                  			</dd>
                  		</dl>
                  		</div>
                  		<div class="list-nav">
                  		<a href='/evt/evtDetail?bdojSeq=${evtPreVo.getBdojSeq()}&tabNo=11' class="link-box"></a>
						<dl>
                  			<dt>
                  			다음글
                  			</dt>
                  			<dd class="f_ell full-width">
                  			<a href='#'>${evtPreVo.getTitle()}</a>
                  			</dd>
                  		</dl>
                  		</div>
              		</c:when>
              	</c:choose>

            </div>
            <!-- listHeader -->
          </div>

        </main>
      </div>
      <!-- //subContentsWrap -->


<script type ="text/javascript">
var bdojSeq = "${evtDetailVo.getBdojSeq()}";
var prebdojSeq= "${evtPreVo.getBdojSeq()}";
var postbdojSeq= "${evtPostVo.getBdojSeq()}";
var evtPreVo = "${evtPreVo.getTitle()}";
var evtPostVo = "${evtPostVo.getTitle()}";
var evtInProgress = "${evtDetailVo.getEvtInProgress()}";

console.log("evtPreVo :: "+ evtPreVo);
console.log("evtPostVo :: "+ evtPostVo);


/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	console.log("result.rtnCode : " + result.rtnCode);
	console.log("result.rtnMsg : " + result.rtnMsg);

}

/* 현재 날짜 포맷  */
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '.' + month + '.' + day;
}

$( document ).ready(function() {

	$("#bgFullImg").append("<div class='customer-bg event-bg'></div>");

	//진행하는 이벤트인지 체크
	if(evtInProgress == "false"){
		ComUtil.alert("해당 이벤트는 진행하지 않는 이벤트 입니다.","","",function(){
			location.href = "/evt/evtList";
		});
	}

	$("#goBackList").on("click", function() {
		location.href = '/evt/evtList';
	});

	var today = new Date();
	today = getFormatDate(today);

	if("${evtDetailVo.getEvent_end_dy()}"> today){
		$("#compYn").text("진행중");
	}else{
		$("#compYn").text("완료");
	}

	$('img[usemap]').rwdImageMaps();

	$("#btnCpn").on("click",function(){
		var cpnPlcNo = "";
		var evtUrl = "";

		var today = new Date();
		today = getFormatDate(today);

		var evtDay = today.replaceAll(".","");
		var loginId = "${userVo.loginId}";

		if(evtDay >= "20210804" && evtDay < "20210811") {
			cpnPlcNo = "NX081";
			evtUrl = "/evt/evtDetail?bdojSeq=60307&tabNo=11";
		} else if (evtDay >= "20210811" && evtDay < "20210818") {
			cpnPlcNo = "NX082";
			evtUrl = "/evt/evtDetail?bdojSeq=60308&tabNo=11";
		} else if (evtDay >= "20210818" && evtDay < "20210825") {
			cpnPlcNo = "NX083";
			evtUrl = "/evt/evtDetail?bdojSeq=60309&tabNo=11";
		} else if (evtDay >= "20210825" && evtDay < "20210901") {
			cpnPlcNo = "NX084";
			evtUrl = "/evt/evtDetail?bdojSeq=60310&tabNo=11";
		} else {
			alert("쿠폰이벤트가 끝났습니다.");
			return;
		}

		if(loginId == "") {
			ComUtil.confirm("로그인 후 이용가능 합니다. 로그인 화면으로 이동하시겠습니까?", '' , function(){
				location.href = "/login/userLogin?sendUrl=" + evtUrl;
				return;
			});

		} else {
			var pSendData = {"cpnPlcNo": cpnPlcNo }
			var pUrl = "/mypage/selectMyCpnDownLoad";
			cfnSendRequest(pUrl,pSendData,'selectMyCpnDownLoad');
		}

	});

});

function cfnRequestErrorCallback(callback, status) {
	alert(status);
}

function cfnRequestSuccessCallback(callback, result) {
	if(result.rtnCode == 0) {
		ComUtil.unloading();
		var data = result.selectMyCouponList;
		if(data != null && data.length > 0 ) {
			ComUtil.confirm("정상적으로 쿠폰다운 완료 했습니다. 나의 쿠폰함 화면으로 이동하시겠습니까?", '' , function(){
				location.href = "/mypage/couponList";
				return;
			});
		}
	} else if(result.rtnCode == -1){
		ComUtil.alert(result.rtnMsg);
		return false;
	}
}
</script>