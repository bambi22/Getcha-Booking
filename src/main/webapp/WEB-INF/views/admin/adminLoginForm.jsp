<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<center>
<c:if test="${msg != null }">
	<script>alert('${msg}');</script>
</c:if>
<form action="adminLoginProc" method="post">
	<table>
		<tr>
			<th colspan="2" style="text-align:center;">관리자 로그인</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type=text  name="adminId" placeholder='ID 입력'/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type=password  name="adminPw" placeholder='PW 입력'/></td>
		</tr>
		<tr>
			<td colspan=2 align='center'>
				<input type=submit value='로그인' style="width: 86px; "/>
				<input type="button" value='취소' style="width: 86px;" onclick="javascript:window.history.back();"/> 
			</td>
		</tr>
	</table>
</form>
</center>
