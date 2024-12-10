<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nexwrms.cfo.util.SessionInfoUtil" %>

<div class="contents quickWrap">
	<h2>******* 주문테스트 *****</h2>
	
	<div class="listTable">
		<table class="w100per">
			<colgroup>
				<col style="width:5%"/>
				<col style="width:70%"/>
			</colgroup>
			<thead>
				<tr style="width:5%"></tr>
				<tr style="width:70%"></tr>
			</thead>
			<tbody id="list">
				<tr>
					<td>주문번호</td>
					<td><input type="number" id="ordr_idxx" class="w100per" value="11114" maxlength="40"/></td>
				</tr>
				<tr>
					<td>결제방법</td>
					<td>
						<select id="action_result">
			                <option value="" selected>선택하십시오</option>
			                <option value="card">신용카드</option>
			                <option value="acnt">계좌이체</option>
			            </select>
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" id="good_name" class="w100per" value="운동화"/></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input type="number" id="good_mny"  class="w100per" value="1004" maxlength="9"/><!--숫자만 입력 --></td>
				</tr>
				<tr>
					<td>상품수량</td>
					<td><input type="number" id="quantity"  class="w100per" value="1" maxlength="9"/><!--숫자만 입력 --></td>
				</tr>
				<tr>
					<td>구매자명</td>
					<td><input type="text" id="buyr_name" class="w100per" value="홍길동"/></td>
				</tr>
				<tr>
					<td>고객번호</td>
					<td><input type="text" id="cust_no" class="w100per" value="1111"/></td>
				</tr>
				<tr>
					<td>구매자메일</td>
					<td><input type="email" id="buyr_mail" class="w100per" value="test@test.co.kr" maxlength="30" /></td>
				</tr>
				<tr>
					<td>구매자연락처1</td>
					<td><input type="text" id="buyr_tel1" class="w100per" value="02-2108-1000"/></td>
				</tr>
				<tr>
					<td>구매자연락처2</td>
					<td><input type="text" id="buyr_tel2" class="w100per" value="010-0000-0000"/></td>
				</tr>
				<tr>
					<td>취소사유</td>
					<td><input type="text" id="module_desc" class="w100per" value="테스트 취소사유 입니다."/></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="margin-bottom: 50px; margin-top: 10px;">
		<ul>
	        <li>
	            <button type="button" name="" style="height:50px; width:25%; background-color: gray; color: white;" class="type12" onClick="javascript:fnKcpOrder();">주문</button>
	            <button type="button" name="" style="height:50px; width:25%; background-color: gray; color: white;" class="type12" onClick="javascript:fnKkoOrder();">카카오주문</button>
	            <button type="button" name="" style="height:50px; width:24%; background-color: red; color: white;" class="type12" onClick="javascript:fnKcpOrderCncl();">주문취소</button>
	            <button type="button" name="" style="height:50px; width:24%; background-color: red; color: white;" class="type12" onClick="javascript:fnKcpOrderKkoCncl();">카카오취소</button>
	        </li>
	    </ul>
	</div>
</div>


<script type="text/javascript">
	  
function fnKcpOrder() {
	var kcpOrdUrl = "/order/openKcpPayment";
	kcpOrdUrl += "?ordr_idxx="	   + $("#ordr_idxx").val();
	kcpOrdUrl += "&action_result=" + $("#action_result").val();
	kcpOrdUrl += "&good_name="	   + $("#good_name").val();
	kcpOrdUrl += "&good_mny="	   + $("#good_mny").val() * $("#quantity").val();
	kcpOrdUrl += "&buyr_name="	   + $("#buyr_name").val();
	kcpOrdUrl += "&buyr_mail="	   + $("#buyr_mail").val();
	kcpOrdUrl += "&buyr_tel1="	   + $("#buyr_tel1").val();
	kcpOrdUrl += "&buyr_tel2="	   + $("#buyr_tel2").val();
	document.location.href=kcpOrdUrl;
}

function fnKcpOrderCncl(){
	var url = '/order/processOrdCncl';
	var reqId = 'fnKcpOrderCncl';
	
	var sendJson = {};
	sendJson.ordrIdxx 	= $("#ordr_idxx").val();
	sendJson.mobYn	  	= "Y";
	sendJson.goodName 	= $("#good_name").val(),
	sendJson.amount	  	= $("#good_mny").val() * $("#quantity").val(),
	sendJson.buyrName 	= $("#buyr_name").val(),
	sendJson.buyrMail 	= $("#buyr_mail").val(),
	sendJson.buyrTel1 	= $("#buyr_tel1").val(),
	sendJson.buyrTel2 	= $("#buyr_tel2").val(),
	sendJson.custNo	  	= $("#cust_no").val(),
	sendJson.moduleDesc = $("#module_desc").val()
	
	/* 리퀘스트 함수 */
	AjaxUtil.call(
			url,
			JSON.stringify(sendJson),
			function(result){
				ComUtil.unloading();
		    	console.log('success callback : ' + reqId, result);
		    	cfnRequestSuccessCallback(reqId, result);
			},
			{
				contentType:"application/json;charset=UTF-8",
				dataType:"text",
			    fcb: function (request, status, error) {
					ComUtil.unloading();
					console.log('error callback : ' + reqId, status);
					cfnRequestErrorCallback(reqId, status);
				}
			}
	);
}

function fnKcpOrderKkoCncl(){
	var url = '/order/processOrdKkoCncl';
	var reqId = 'fnKcpOrderCncl';
	
	var sendJson = {};
	sendJson.ordrIdxx 	= $("#ordr_idxx").val();
	sendJson.mobYn	  	= "Y";
	sendJson.goodName 	= $("#good_name").val(),
	sendJson.amount	  	= $("#good_mny").val() * $("#quantity").val(),
	sendJson.buyrName 	= $("#buyr_name").val(),
	sendJson.buyrMail 	= $("#buyr_mail").val(),
	sendJson.buyrTel1 	= $("#buyr_tel1").val(),
	sendJson.buyrTel2 	= $("#buyr_tel2").val(),
	sendJson.custNo	  	= $("#cust_no").val(),
	sendJson.moduleDesc = $("#module_desc").val()
	
	/* 리퀘스트 함수 */
	AjaxUtil.call(
			url,
			JSON.stringify(sendJson),
			function(result){
				ComUtil.unloading();
		    	console.log('success callback : ' + reqId, result);
		    	cfnRequestSuccessCallback(reqId, result);
			},
			{
				contentType:"application/json;charset=UTF-8",
				dataType:"text",
			    fcb: function (request, status, error) {
					ComUtil.unloading();
					console.log('error callback : ' + reqId, status);
					cfnRequestErrorCallback(reqId, status);
				}
			}
	);
}

/*
 * 리퀘스트 후처리 함수 - SUCCESS
 */
function cfnRequestSuccessCallback(callback, result) {
	if(result == "error"){
		if(callback == "fnKcpOrderCncl"){
			alert("실패: " + "주문번호가 존재하지 않습니다.");
		}else if(callback == "fnKkoOrder"){
			alert("실패: " + "페이지를 열 수 없습니다.");
		}
	}else{
		if(callback == "fnKcpOrderCncl"){
			alert("완료되었습니다.");
		}else if(callback == "fnKkoOrder"){
			document.location.href=result
		}
	}
}

/*
 * 리퀘스트 후처리 함수 - ERROR
 */
function cfnRequestErrorCallback(callback, status) {
		alert("실패: " + status);
}

function fnKkoOrder(){
	var url = '/order/openKkoPayment';
	var reqId = 'fnKkoOrder';
	
	var sendJson = {};
	sendJson.ordrIdxx	= $("#ordr_idxx").val();
	sendJson.mobYn		= "Y";
	sendJson.goodName	= $("#good_name").val();
	sendJson.amount		= $("#good_mny").val() * $("#quantity").val();
	sendJson.quantity   = $("#quantity").val();
	sendJson.buyrName	= $("#buyr_name").val();
	sendJson.buyrMail	= $("#buyr_mail").val();
	sendJson.buyrTel1	= $("#buyr_tel1").val();
	sendJson.buyrTel2	= $("#buyr_tel2").val();
	sendJson.custNo		= $("#cust_no").val();
	sendJson.moduleDesc = $("#module_desc").val();
	
	/* 리퀘스트 함수 */
	AjaxUtil.call(
			url,
			JSON.stringify(sendJson),
			function(result){
				ComUtil.unloading();
		    	console.log('success callback : ' + reqId, result);
		    	cfnRequestSuccessCallback(reqId, result);
			},
			{
				contentType:"application/json;charset=UTF-8",
				dataType:"text",
			    fcb: function (request, status, error) {
					ComUtil.unloading();
					console.log('error callback : ' + reqId, status);
					cfnRequestErrorCallback(reqId, status);
				}
			}
	);
}
</script>