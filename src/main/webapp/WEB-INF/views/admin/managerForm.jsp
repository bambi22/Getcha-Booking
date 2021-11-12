<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<title>식당관리자 등록</title>
<script>
	function checkId(){
		var i = document.getElementById('id').value;
		var info = {id:i}
		$.ajax({
			url: "IsExistId", type: "POST",
			data: JSON.stringify(info),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			
			success: function(map){
				$('#msg').text(map.msg);
			},
			error: function(){
				$('#msg').text('error');
			}
		})
		
	}
	
	function sendAuth(){
		var e = document.getElementById('email').value;
		var info = {email:e}
		$.ajax({
			url: "sendAuth", type: "POST",
			data: JSON.stringify(info),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			
			success: function(map){
				$('#msg').text(map.msg);
			},
			error: function(){
				$('#msg').text('error');
			}
		})
	}
		function sendConfirm(){
		var num = document.getElementById('confirmNum').value;
		var info = {confirmNum:num}
		$.ajax({
			url: "sendConfirm", type: "POST",
			data: JSON.stringify(info),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			
			success: function(map){
				$('#msg').text(map.msg);
			},
			error: function(){
				$('#msg').text('e');
			}
		})
	}
		function daumPost(){
			new daum.Postcode({
				oncomplete:function(data){
					var addr = "";
					if(data.userSelectedType === "R"){
						addr = data.roadAddress;
					}else{
						addr = data.jibunAddress;
					}
					document.getElementById("zipcode").value = data.zonecode;
					document.getElementById("addr1").value = addr;
					document.getElementById("addr2").focus();
				}
			}).open();
		}
		
		function pwCheck(){
			pw = document.getElementById('pw').value;
			pwOk = document.getElementById('pwOk').value;
			if(pw!=pwOk){
				$('#pwCheck').text('비밀번호가 일치하지 않습니다.');
			}else
				$('#pwCheck').text('비밀번호가 일치합니다.');
		}
</script>
</head>
<center>
<c:if test="${not empty msg }">
	<script>alert('${msg}');</script>
</c:if>
<h3><font color="red" id="msg"></font></h3>
<form action="managerProc" method="post">
<table>
	<tr>
		<td align='right' height=40>아이디</td>
		<td>
			<input type=text name='id' id='id' placeholder='id 입력'/> 
		</td>
		<td colspan="2"><input type="button" value="중복 확인" onclick="checkId()"/></td>
	</tr>
	<tr>
		<td align='right' height=40>패스워드</td>
		<td>
			<input type=text name='pw' id='pw' placeholder='pw 입력'/> 
		</td>
		<td align='right'>패스워드 확인</td>
		<td>
			<input type=text name='pwOk' id='pwOk' onchange='pwCheck()' placeholder='pw 입력'/>
		</td>
	</tr>
	<tr><td colspan="2" align='right'><h5 id="pwCheck"></h5></td></tr>
	
	<tr>
		<td align='center' height=40 colspan=4>
			<input type=submit value='식당관리자 등록' style="width: 120px; "/>
			<input type=reset value='취소' onclick="javascript:location.href='admin/managerListForm.jsp';"style="width: 120px; "/>	 
		</td>
	</tr>
</table>
</form>
</center>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>