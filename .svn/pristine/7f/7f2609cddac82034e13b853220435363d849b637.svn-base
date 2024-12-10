<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/jquery-ui.css">
<link type="text/css" rel="stylesheet" href="/css/layout.css">
<script type="text/javascript" src="/js/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<script type="text/javascript" src="/js/common_type.js"></script>
<script type="text/javascript" src="/js/common_ui.js"></script>

<script type="text/javascript">
var result = '${sMessage}';
var key = "";

$( document ).ready(function() {
	
	if(result == 'error'){
		alert('세이프키를 저장하는데 오류가 생겼습니다!');
	}else{
		key = result;
		alert('정상적으로 생성되었습니다.');
	}
	window.close();   
	window.opener.close();
	window.opener.opener.safekeyClose(key);
	 
});

</script>


