<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.core.constants.CoreConstants" %>

	<script type="text/javascript" src="/js/lib/jquery-3.4.1.min.js"></script>
		<input type="hidden" id="serverMode" value="<%=System.getProperty(CoreConstants.SERVER_MODE)%>"> <!-- 임시로 -->
    <script type="text/javascript">
	    /*
        $( document ).ready(function() {
	    	$("#ordrIdxx", window.opener.document).val("${ordrIdxx}");
	    	$("#pgToken", window.opener.document).val("${pgToken}");
			$("#frm", window.opener.document).attr("action" , "/order/kakaoComplate").submit();
	    	window.self.close();
		});
         */
	    window.opener.document.getElementById('ordrIdxx').value = "${ordrIdxx}";
	    window.opener.document.getElementById('pgToken').value = "${pgToken}";

	  //yjw serverMode 제거(20220225)
		window.opener.document.getElementById('frm').action = "/order/kakaoComplateTMS2";
	    window.opener.document.getElementById('frm').submit();

	    window.self.close();
    </script>
</html>
