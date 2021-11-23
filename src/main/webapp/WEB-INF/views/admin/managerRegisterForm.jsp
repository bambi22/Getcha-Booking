<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<title>식당관리자 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script>
function checkId(){
	var i = document.getElementById('id').value;
	if(i == ""){
		alert('아이디를 입력하세요.')
		return;
	}
	var info = {id:i};
	$.ajax({
		url: "isExistId", type: "POST",
		data: JSON.stringify(info),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		
		success: function(result){
			$('#idMsg').text(result.idMsg);
		},
		error: function(){
			$('#idMsg').text('error');
		}
	})	
}

function changeId(){
	$('#idMsg').text('');
}

function pwCheck(){
	pw = document.getElementById('pw').value;
	pwOk = document.getElementById('pwOk').value;
	if(pw!=pwOk){
		$('#pwMsg').text('비밀번호가 일치하지 않습니다.');
	}else
		$('#pwMsg').text('');
}


function managerRegister(){
	var id = document.getElementById('id').value;
	var pw = document.getElementById('pw').value;
	var pwOk = document.getElementById('pwOk').value;
	if(id == "" || pw == "" || pwOk == ""){
		alert('필수 입력 항목들입니다.');
		return;
	}
	
	var msgId = document.getElementById('idMsg').innerHTML;
	var msgPw = document.getElementById('pwMsg').innerHTML;
	if(msgId == "" || msgId == null){
		alert("아이디 중복확인을 하십시오.");
		return;
	}else if(pw != pwOk || msgId== "중복된 아이디입니다."){
		alert('입력한 아이디와 비밀번호를 다시 확인하십시오.');
		return;
		
	}else{
		document.getElementById('registerForm').submit();		
	}
}

</script>


</head>
<center>
<c:if test="${empty sessionScope.adminId }">
	<script>
		alert('최고 관리자 로그인이 필요합니다.');
		location.href='adminLogin';
	</script>
</c:if> 

<c:if test="${!empty msg }">
	<script>alert(${msg});</script>
</c:if>

<c:import url="adminNav.jsp"/>
<script>
	// 내비에 선택된 탭 색깔 변경 
	document.getElementById('managerRegisterTab').className = 'nav-link active';
</script>
<form action="managerRegisterProc" id="registerForm" method="post">
<table>
	<tr>
		<td align='right' height=40>아이디</td>
		<td>
			<input type=text name='restId' id='id' placeholder='id 입력' onchange="changeId()"/><br> 
			<label for="id"><font color="red" id="idMsg"></font></label>
		</td>
		<td colspan="2"><input type="button" value="중복 확인" onclick="checkId()"/></td>
	</tr>
	<tr>
		<td align='right' height=40>패스워드</td>
		<td>
			<input type=password name='restPw' id='pw' placeholder='pw 입력'/> 
		</td>
	</tr>
	<tr>
		<td align='right'>패스워드 확인</td>
		<td>
			<input type=password name='pwOk' id='pwOk' onchange='pwCheck()' placeholder='pw 입력'/><br>
			<label for="pwOk"><font color="red" id="pwMsg"></font></label>
		</td>
	</tr>
	<tr>
		<td align='right'>전화번호1</td>
		<td>
			<select id="phone1" name="phoneStr1">
				<option value="010">010</option>
				<option value="02">02</option>
				<option value="031">031</option>
			</select>
			 - <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
					name="phoneStr1" id="capacity" style="width:60px"/>
			 - <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
					name="phoneStr1" id="capacity" style="width:60px"/>
		</td> 
	</tr>
	<tr>
		<td align='right'>전화번호2</td>
		<td>
			<select id="phone1" name="phoneStr2">
				<option value="010">010</option>
				<option value="02">02</option>
				<option value="031">031</option>
			</select>
			 - <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
					name="phoneStr2" id="capacity" style="width:60px"/>
			 - <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
					name="phoneStr2" id="capacity" style="width:60px"/>
		</td> 
	</tr>
	<tr>
		<td align='center' height=40 colspan=4>
			<input type=button value='식당관리자 등록' style="width: 120px;" onclick="managerRegister()"/>	 
		</td>
	</tr>
</table>
</form>

</center>

