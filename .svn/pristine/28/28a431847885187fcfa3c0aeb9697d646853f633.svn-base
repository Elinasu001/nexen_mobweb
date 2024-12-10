<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<!DOCTYPE html>

<html>
<head>
<title>Nexen O2O</title>

</head>
<body>
<form id="frm" name="frm" method="get"></form>
	
</body>
<script type="text/javascript">

setCookie("menu_page",'${menu_page}', 1)

/* 쿠키에 집어넣기 */
function setCookie(name, value, expiredays){
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}

function loginProcKakao() {
	var sUrl = "<%=AppContext.getString(WebConstants.SnsKakao.OPENURL)%>"
		+ "?client_id=" + "<%=AppContext.getString(WebConstants.SnsKakao.CLIENTID)%>"
		+ "&redirect_uri=" + "<%=AppContext.getString(WebConstants.SnsKakao.REDIRECTURI)%>"
		+ "&response_type="+ "<%=AppContext.getString(WebConstants.SnsKakao.RESPONSETYPE)%>" 
		+ "&state=" + '${sendUrl}'
		+ "&encode_state="+"<%=AppContext.getString(WebConstants.SnsKakao.ENCODE)%>"
		;
		return sUrl;
	
};

function loginProcNaver() {	
	var sUrl = "<%=AppContext.getString(WebConstants.SnsNaver.OPENURL)%>"				
		+ "?response_type="+"<%=AppContext.getString(WebConstants.SnsNaver.RESPONSETYPE)%>"
		+ "&client_id="+"<%=AppContext.getString(WebConstants.SnsNaver.CLIENTID)%>"
		+ "&redirect_uri="+"<%=AppContext.getString(WebConstants.SnsNaver.REDIRECTURI)%>"
		+ "&state=" + '${sendUrl}'		
		;
	return sUrl;
};

function loginProcFaceb() {
	
	var sUrl = "<%=AppContext.getString(WebConstants.SnsFaceb.OPENURL)%>"
			 + "?client_id="+"<%=AppContext.getString(WebConstants.SnsFaceb.CLIENTID)%>"
			 + "&redirect_uri="+"<%=AppContext.getString(WebConstants.SnsFaceb.REDIRECTURI)%>"
			 + "&state=" + '${sendUrl}'
			 + "&display=popup"
	    	 + "&response_type="+"<%=AppContext.getString(WebConstants.SnsFaceb.RESPONSETYPE)%>"	    	 
			 ;
	return sUrl;
};


function loginProcGoogle() {
	
	var sUrl = "<%=AppContext.getString(WebConstants.SnsGoogle.OPENURL)%>"
	         + "?client_id=<%=AppContext.getString(WebConstants.SnsGoogle.CLIENTID)%>"
	         + "&response_type=<%=AppContext.getString(WebConstants.SnsGoogle.RESPONSETYPE)%>"
	         + "&scope=<%=AppContext.getString(WebConstants.SnsGoogle.SCOPE)%>"
	         + "&state=" + '${sendUrl}'
	         + "&redirect_uri=<%=AppContext.getString(WebConstants.SnsGoogle.REDIRECTURI)%>"	         
		;
	return sUrl;
};


	var sType = '${type}';
	if(sType=='kakao'){
		window.location.href=loginProcKakao();	
	}else if(sType=='naver'){
		window.location.href=loginProcNaver();	
	}else if(sType=='faceb'){
		window.location.href=loginProcFaceb();	
	}else if(sType=='google'){
		window.location.href=loginProcGoogle();	
	}else{
		close();
	}
	
</script>
</html>