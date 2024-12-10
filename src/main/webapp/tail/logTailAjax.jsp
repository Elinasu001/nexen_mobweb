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
long end_point = (request.getParameter("end_point")==null)? 0:Long.parseLong(request.getParameter("end_point")+"");
//로그파일이 있는 디렉토리
String log_dir = "";
if(accessUrl.indexOf("172.17.0.137") != -1) { // 운영
	log_dir = "////100.100.100.200//was//O2O//logs//FO_MOB";
} else {
	log_dir = "D:/O2O/logs/FO_MOB";
}


StringBuffer sb = new StringBuffer();
//RandomAccessFile read_file = new RandomAccessFile(log_dir+"\\"+log_filename, "r");
RandomAccessFile read_file = new RandomAccessFile(log_dir+"//"+log_filename, "r");
long str_length = read_file.length();
long start_point = (end_point>0)?end_point:str_length;
read_file.seek(start_point);
String str;
long file_point = start_point;
int i=0;
while((str = read_file.readLine()) != null){
	sb.append(str+"\n");
	file_point = read_file.getFilePointer();
	read_file.seek(file_point);
	i++;
}
read_file.close();
String log_data = sb.toString();
String file_point_log_data = file_point+",|||"+log_data;
out.print(new String(file_point_log_data.getBytes("ISO-8859-1"),"euc-kr"));
%>

