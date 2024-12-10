<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%!
public String toKorean(String param) {
	try{
		param=new String(param.getBytes("ISO-8859-1"),"utf-8");
	}catch(Exception e){
	}
	return param;
}
%>

<%
response.setHeader("Pragma","No-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader ("Cache-Control", "no-cache");
%>

<%
String accessUrl = request.getRequestURL().toString();
//로그파일명
String log_filename = request.getParameter("log_filename") == null ? "": request.getParameter("log_filename");
//로그파일이 있는 디렉토리
String log_dir = "";
if(accessUrl.indexOf("172.17.0.137") != -1) { // 운영
	log_dir = "////100.100.100.200//was//O2O//logs//FO_MOB";
} else {
	log_dir = "D:/O2O/logs/FO_MOB";
}

long log_length = 10000;
//디렉토리인 객체를 생성
File myDir = new File(log_dir);
//디렉토리의 내용 구하기
File[] list_files = myDir.listFiles();

//파일시작위치
long start_point = 0;
//파일끝위치
long end_point = 0;
//파일내용
String log_data = "";
if(!log_filename.equals("")){
	StringBuffer sb = new StringBuffer();
	//RandomAccessFile read_file = new RandomAccessFile(log_dir+"\\"+log_filename, "r");
	RandomAccessFile read_file = new RandomAccessFile(log_dir+"//"+log_filename, "r");

	//파일 길이를 구한다.
	long str_length = read_file.length();
	//파일을 읽을 위치를 정한다.
	start_point = (str_length<log_length)?0:(str_length-log_length);
	read_file.seek(start_point);
	String str;
	end_point = str_length;
	while((str = read_file.readLine()) != null){
		sb.append(str+"\n");
		//파일을 읽고 마지막 위치를 알아낸다.
		end_point = read_file.getFilePointer();
		read_file.seek(end_point);
	}
	read_file.close();
	//파일내용
	log_data = new String(sb.toString().getBytes("ISO-8859-1"),"euc-kr");
}
%>
<HTML>
<HEAD>
<title>로그파일보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
a {text-decoration:none; color: black;}
a:link {text-decoration:none; color: black;}
a:visited {text-decoration:none; color: black;}
a:active {text-decoration:none; color: black;}
a:hover {text-decoration:none; color:black;}
body,table,tr,td {  font-family: "굴림"; font-size: 9pt; font-style: normal; color: black;}
-->
</style>
<script>
	//ajax를 위한 함수입니다.
	function getXmlHttpRequest(){
		var xmlhttp = false;
		// Mozilla/Safari
		if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
		}
		// IE
		else if (window.ActiveXObject) {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}
</script>
</head>

<body>
<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
	<tr height="10%">
		<td align="left" valign="bottom">
			<table border="0" cellspacing="0" cellpadding="0">
			<form name="fileform" method="post" action="logTail.jsp">
				<tr>
					<td align="left" valign="bottom" height="20">
						로그파일을 tail -f 명령어 처럼 보여줍니다.
					</td>
				</tr>
				<tr>
					<td>
						<select name="log_filename">
							<option value="">파일선택</option>
							<%
							if (list_files != null) {
								for (int i = 0; i < list_files.length; i++) {
									if(!list_files[i].isDirectory()){
										String filename = list_files[i].getName();
										filename = filename.substring(filename.lastIndexOf("/")+1,filename.length());
										if (filename.indexOf("fo_mob.log") != -1) {
							%>
							<option value="<%=filename%>" <%=log_filename.equals(filename)?"selected":""%>><%=filename%></option>
							<%
										}
									}
								}
							}
							%>
						</select>
					</td>
					<td>
						<input type="submit" value="로그파일보기">
					</td>
				</tr>
			</form>
			</table>
		</td>
	</tr>
	<tr height="90%">
		<td>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
			<form name="logform">
				<tr>
					<td><textarea id="log_data_area" name="log_data" style="width:100%;height:100%;"><%=log_data%></textarea></td>
				</tr>
			</form>
			</table>
		</td>
	</tr>
</table>
<%
if(!log_filename.equals("")){
%>
<script>
	var end_point = <%=end_point%>;
	function include_ajax_repeat(){
		var url = 'logTailAjax.jsp?log_filename=<%=log_filename%>&end_point='+end_point;
		//alert(url);
		var xmlhttp = getXmlHttpRequest();
		if(url){
			xmlhttp.open("GET", url, true);
			xmlhttp.onreadystatechange = function() {
				if(xmlhttp.readyState == 4) {
					if(xmlhttp.status == 200) {
						var resText = xmlhttp.responseText;
						//마지막 위치
						end_point = resText.substring(0,resText.indexOf(',|||'));
						//새로운 로그 데이타
						var log_data = resText.substring(resText.indexOf(',|||')+1,resText.length);
						document.logform.log_data.value = document.logform.log_data.value + log_data;

					} else {
						alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");
					}
				}
			}
			xmlhttp.send(null);
		}

		return false;
	}
	//include_ajax_repeat();
	setInterval("include_ajax_repeat()", 20000);//msec 마다 서버와 통신함
</script>
<%
}
%>
</body>
</html>

