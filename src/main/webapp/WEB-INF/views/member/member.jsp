<%@ page contentType="text/html; charset=UTF-8" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function ajaxCheckEmail(){
		var i = document.getElementById("email").value;
		var e = {email:i}
		$.ajax({
			url:"CheckEmail", type:"POST",
			data:JSON.stringify(e),
			contentType:"application/json; charset=utf-8",
			dataType:'json',
			success:function(result){
				$('#msg').text(result.msg)
			},
			error:function(){
				alert("문제발생")
			}
		})
	}

</script>
<center>
<h3><font color="red" id="msg">${msg}</font></h3>
	<form action="memberProc" method = "post">
		<table>
			<tr>
				<td height=40>이메일</td>
				<td>
					<input type=text name='email' id='email' placeholder='이메일 입력'/>
				</td>
				<td colspan="2"><input type="button" value="Email 중복 확인" onclick="ajaxCheckEmail();"></td>
			</tr>
			<tr>
				<td height=40>닉네임</td>
				<td>
					<input type='text' name='nickname' id='nickname' placeholder='닉네임 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>비밀번호</td>
				<td>
					<input type=password name='pw' id='pw' placeholder='비밀번호 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>비밀번호 확인</td>
				<td>
					<input type=password name='pwChk' id='pwChk' placeholder='비밀번호 확인' onblur="pwchk()"/><br>
					<input type="text" style="border-width:0px" size="20" name="chk" id="chk" value="비밀번호를 입력하세요." readonly="readonly">
				</td>
			</tr>
			<tr>
				<td height=40>휴대폰 번호</td>
				<td>
					<input type=text name='mobile' id='mobile' placeholder='휴대폰번호 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>생일</td>
				<td>
					<select name="birth1">
					<%for(int i=2002; i>=1900; i--){ %>
						<option value="<%=i %>"><%=i %></option><%} %>
					</select>년
					<select name="birth2">
					<%for(int i=1; i<=12; i++){ %>
						<option value="<%=i %>"><%=i %></option><%} %>
					</select>월
					<select name="birth3">
					<%for(int i=1; i<=31; i++){ %>
						<option value="<%=i %>"><%=i %></option><%} %>
					</select>일<br><br>
					
				</td>
			</tr>
			<tr>
				<td height=40>성별</td>
				<td colspan="3">
					<input type=radio name='gender' value='n' checked="checked"/>선택안함
					<input type=radio name='gender' value='w' />여자
					<input type=radio name='gender' value='m' />남자
				</td>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4>
					<input type=submit value='회원가입' style="width:120px;"/>
					<input type=reset value='취소' style="width:120px;"/>
			</tr>
		</table>
	</form>
</center>

<script>
	function pwchk(){
		var pw = document.getElementById("pw").value;
		var pwChk = document.getElementById("pwChk").value;
		if(pwChk.length == 0 || pwChk == null){
			document.getElementById("chk").value="비밀번호를 입력하세요.";
		}else if(pw !=pwChk){
			document.getElementById("chk").value="비밀번호가 일치하지않습니다.";
		}else{
			document.getElementById("chk").value="비밀번호가 동일합니다.";
		}
		return;
	}
</script>