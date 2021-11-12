<%@ page contentType="text/html; charset=UTF-8" %>
<center>
	<form action="">
		<table>
			<tr>
				<td height=40>이름</td>
				<td>
					<input type=text name='name' id='name' placeholder='이름 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>닉네임</td>
				<td>
					<input type='text' name='nick' id='nick' placeholder='닉네임 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>이메일</td>
				<td>
					<input type=text name='email' id='email' placeholder='이메일 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>비밀번호</td>
				<td>
					<input type=text name='pw' id='pw' placeholder='비밀번호 입력'/>
				</td>
			</tr>
			<tr>
				<td height=40>비밀번호 확인</td>
				<td>
					<input type=text name='pwChk' id='pwChk' placeholder='비밀번호 확인'/>
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
					<select name = "birth-year" id="birth-year" required="required">
						<option value="">년</option>
					</select>
					<select name = "birth-month" id="" required="required">
						<option value="">월</option>
					</select>
					<select name = "birth-day" id="birth-day" required="required">
						<option value="">일</option>
					</select>
				</td>
			</tr>
			<tr>
				<td height=40>생일</td>
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
	var selectYear = document.querySelector('select[name="birth-year"]');
	for(var i=1900; i<=2002; i++){
		var option=document.createElement('option');
		option.innerHTML=i+'년';
		option.value=i;
		selectYear.appendChild(option);
	}

	var selectMonth = document.querySelector('select[name="birth-month"]');
	for(var i=1; i<=12; i++){
		var option=document.createElement('option');
		option.innerHTML=i+'월';
		option.value=i;
		selectMonth.appendChild(option);
	}
	
	var selectDay = document.querySelector('select[name="birth-day"]');
	for(var i=1; i<=31; i++){
		var option=document.createElement('option');
		option.innerHTML=i+'일';
		option.value=i;
		selectDay.appendChild(option);
	}
</script>