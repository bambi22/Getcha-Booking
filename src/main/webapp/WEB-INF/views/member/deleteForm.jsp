<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--<c:if test="${empty sessionScope.id }">
	<script>
		location.href=""
	</script>
</c:if>-->
<center>
	<form action="deleteProc" method="post">
		<table>
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
				<td colspan=2 align='center'>
					<input type=submit value='확인' style="width:80px;"/>
					<input type=reset value='취소' style="width:80px;"/>
			</tr>
		</table>
	</form>
</center>