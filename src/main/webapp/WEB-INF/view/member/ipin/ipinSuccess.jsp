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

$( document ).ready(function() {

	var diVal  		= "${diVal}";
	var vnVal  		= "${vnVal}";
	var ciVal  		= "${ciVal}";
	var custNm		= "${custNm}";
	var phone  		= "${phone}";
	var gendCd  	= "${gendCd}";
	var legrBrthYmd = "${legrBrthYmd}";
	var frgnCd = "${frgnCd}";
	
	/*
	 * 쿠키로 다음 목적지 url 설정.  
	*/
	var cook = document.cookie + ";";
	var idx = cook.indexOf("idpwgbn", 0);
	var val = "";
	if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape( cook.substring(begin, end) );
	}

	opener.document.getElementById("userinfo_form").diVal.value  = diVal;
	opener.document.getElementById("userinfo_form").vnVal.value  = vnVal;
	opener.document.getElementById("userinfo_form").ciVal.value  = ciVal;
	opener.document.getElementById("userinfo_form").custNm.value = custNm;
	opener.document.getElementById("userinfo_form").phone.value  = phone;
	opener.document.getElementById("userinfo_form").gendCd.value = gendCd;
	opener.document.getElementById("userinfo_form").legrBrthYmd.value = legrBrthYmd;
	opener.document.getElementById("userinfo_form").frgnCd.value = frgnCd;
		
	opener.result();
    close();    
   
});

</script>


