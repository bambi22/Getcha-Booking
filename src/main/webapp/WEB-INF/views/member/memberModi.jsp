<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.email }">
	<script>
		location.href='index?formpath=login'
	</script>
</c:if>
<script>
	var message="${msg}";
	//var url = "${url}";
	alert(message);
	//document.location.href=url;
</script>
<center>
	<form action=memberModiProc method="post">
		<table>
			<tr>
				<td align='right' height=40>이메일</td>
				<td><input type=text name='email' id='email' value='${sessionScope.email }' disabled="disabled"/></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td height=40>닉네임</td>
				<td>
					<input type='text' name='nickname' id='nickname' value='${sessionScope.nickname }'/>
				</td>
			</tr>
			<tr>
				<td align='right' height=40>패스워드</td>
				<td><input type=text name='pw' id='pw' placeholder='pw 입력'/></td>
				<td align='right'>패스워드 확인</td>
				<td><input type=text name='pwChk' id='pwChk' placeholder='pw 입력'/></td>
			</tr>
			<tr>
				<td height=40>휴대폰 번호</td>
				<td>
					<input type=text name='mobile' id='mobile' placeholder='휴대폰번호 입력'/>
				</td>
			</tr>
			<tr>
				<td align='right' height=40>생일</td>
				<td><input type=text name='birth' id='birth' value='${sessionScope.birth }'disabled="disabled"/></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td align='right' width=120>성별</td>
				<td colspan="3">
				<c:if test="${sessionScope.gender == 'n' }">
					<input type=radio name='gender' value='n' checked="checked"/>선택안함
					<input type=radio name='gender' value='m' disabled="disabled"/>남자
					<input type=radio name='gender' value='w' disabled="disabled"/>여자
				</c:if>
				<c:if test="${sessionScope.gender == 'm' }">
					<input type=radio name='gender' value='n' disabled="disabled"/>선택안함
					<input type=radio name='gender' value='m' checked="checked"/>남자
					<input type=radio name='gender' value='w' disabled="disabled"/>여자
				</c:if>
				<c:if test="${sessionScope.gender == 'w' }">
					<input type=radio name='gender' value='n' disabled="disabled"/>선택안함
					<input type=radio name='gender' value='m' disabled="disabled"/>남자
					<input type=radio name='gender' value='w' checked="checked"/>여자
				</c:if>
				</td>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4>
				<input type=submit value='수정' style="width:120px;"/>
				<input type="button" style="width:120px;" value="취소" onclick="location.href='${root}index?formpath=memberView'"/>
				</td>
			</tr>
		</table>
	</form>
</center>