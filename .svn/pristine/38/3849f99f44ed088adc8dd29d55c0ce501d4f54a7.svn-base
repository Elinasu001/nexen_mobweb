<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<body class="nopage-wrap">

	  <div class="nopage">
        <!-- subContentsWrap -->
        <div class="subContentsWrap">
          <main class="">
            <!-- header -->
            <div class="page-header">
              <h2 class="title-deco">
                <span>고객님께서</span> <span>요청하신 페이지를</span> <span>찾을 수 없습니다.</span>
              </h2>
            </div>
            <!-- //header -->

            <!-- 페이지 헤더 -->
            <div class="nopage-header">
              <p class="nopage-header-catch">이용에 불편을 드려 죄송합니다. </p>
              <p class="nopage-header-description">입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
            </div>
            <!-- //페이지 헤더 -->

            <div class="">
              <a href="/main" class="go-main">메인으로 가기</a>
            </div>
          </main>
        </div>
        <!-- //subContentsWrap -->
      </div>

	</body>


	<script type="text/javascript">

		$( document ).ready(function() {
			var code = "${rtnCode}";
			var msg = "${rtnMsg}";
			if(code == "-1") {
				//$("#msg").html(msg);
				//$("#cont").html(msg);
				//ComUtil.alert(msg);
				$(".nopage-header-description").html(msg);
			}
			//카카오 결제 실패
			else if(code == "-100") {
				/* $("#loadingWrap", opener.document).hide();
				window.self.close(); */
				var msg1 = msg.substring(0,5);
				if(msg1 == "ERROR") {
					var msg2 = msg.slice(-5);
					if(msg2 == "00067"){
						$(".nopage-header-description").html("[E" + msg2 + "] - 주문에 실패하였습니다. <br> 계속 발생 시 에러코드와 함께 고객센터로 문의 바랍니다.");
					} else if(msg2 == "00065") {
						$(".nopage-header-description").html("[E" + msg2 + "] - 재고 일시 품절로 주문을 진행할 수 없습니다. <br> 계속 발생 시 에러코드와 함께 관리자에게 문의 바랍니다.");
					} else {
						$(".nopage-header-description").html("[E" + msg2 + "] - 결제 시 문제가 발생하였습니다. <br> 계속 발생 시 에러코드와 함께 관리자에게 문의 바랍니다.");
					}
				} else {
					$(".nopage-header-description").html(msg);
				}
			} else {
				var exceptionMsg = "${error.MESSAGE}";
				if(!ValidUtil.isEmpty(exceptionMsg)) {
					$(".nopage-header-description").html(exceptionMsg);
				}
			}
		});


	</script>

</html>