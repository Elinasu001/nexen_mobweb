<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.nexwrms.core.constants.CoreConstants" %>
<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>
<link type="text/css" rel="stylesheet" href="/css/privacyPolicies.css">

<style>
body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
         .table th, .table td {			     	
            padding: 15px;
            text-align: cneter;
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
        } 
        .table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        /* .table .icon {
            width: 50px;
            height: 50px;
            background-color: #00aaff;
            color: #fff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            font-weight: bold;
        } */
       /*  .table .icon i {
            margin-right: 5px;
        }
        .table .icon p {
            font-size: 14px;
            font-weight: bold;
        }
        .table .yellow {
            color: #f4a623;
        }
        .table .blue {
            color: #00aaff;
        } */
}
</style>

<!-- subContentsWrap -->
	<div class="subContentsWrap">
    	<main class="order-basket">
        <!-- header -->
        	<div class="page-header">
            	<h2 class="title-deco">
                	<span>꼭!</span> <span>확인하세요.</span>
            	</h2>
            	<h3 class="title-deco-sub">개인정보처리방침</h3>
          	</div>
          	<!-- //header -->
          
          	<div class="bg">
				<p class="text-center inset-ml">
					<b>넥센타이어는 고객님의 정보보호를<br>최우선으로 생각합니다.</b>
				</p>
			</div>

			<div class="termsBox bg mt-0 ml-0 mr-0" id="termsBoxId">
				
			</div>
				<!-- 개인정보처리방침 -->
		    	<!--subContentsWrap-->
				<select class="selectPolicy" id="inlineId" style = "margin:0 auto; text-align: center; border:2px solid #454545; border-radius: 20px; background-color: white;" onchange="selectChange(this.value);">
					<option value="20241001policies.html" selected="selected" style = "text-align-last: center; text-align: center;">2024년 10월 14일</option>
					<option value="20240109policies.html" style = "text-align-last: center; text-align: center;">2024년 1월 09일</option>
					<option value="20230424policies.html" style = "text-align-last: center; text-align: center;">2023년 4월 24일</option>
					<option value="20230130policies.html" style = "text-align-last: center; text-align: center;">2023년 1월 30일</option>
					<option value="20230116policies.html" style = "text-align-last: center; text-align: center;">2023년 1월 16일</option>
					<option value="20221124policies.html" style = "text-align-last: center; text-align: center;">2022년 11월 30일</option>
					<option value="20221114policies.html" style = "text-align-last: center; text-align: center;">2022년 10월 21일</option>
				</select>    
			</main>
		</div>
      <!-- //subContentsWrap -->

<script type="text/javascript">
var userLoginId = "${userLoginId}";

function initPage() {  // 초기화 background: transparent; align-items: center;
	//$("#termsBoxId").text("${questionDetailVo.getQustClsCdNm()}");  
	$("#termsBoxId").val("1");
}

function selectChange(refine) {
	var policiesUrl = refine;
	$.ajax({
        url: "/html/policies/"+policiesUrl, //contents
        type: "GET",
	    contentType:"application/json;charset=UTF-8",
        success: function (data) {
        	$("#termsBoxId").html(data);
        	//console.log("success:",data);
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
        }
    });
}


$(document).ready(function() {
	// 첫 화면 보여줘야 함 (init) 
	initPage();
	// select 를 눌럿을때  해당 페이지를 보여줘야 함
	$.ajax({
        url: "/html/policies/20241001policies.html", //contents
        type: "GET",
	    contentType:"application/json;charset=UTF-8",
        success: function (data) {
        	$("#termsBoxId").html(data);
        	console.log("success:",data);
        },
        error: function(xhr,status,error){
        	console.log("error:",error);
        }
    });
	
	
	
	$('#bgFullImg').append('<div class="member-bg service-common"></div>'); //기존에 존재 함
});


</script>
    