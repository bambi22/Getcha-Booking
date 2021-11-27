<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.email }">
	<script>
		location.href="index?formpath=main";
	</script>
</c:if>
<script type="text/javascript">
var message="${msg}";
alert(message);
</script>
<center>
	<form action="memberDeleteProc" method="post">
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
					<input type=text name='PwCheck' id='PwCheck' placeholder='비밀번호 확인'/>
				</td>
			</tr>
			<tr>
				<td colspan=2 align='center'>
					<input type=submit value='확인' style="width:80px;"/>
					<input type="button" style="width:80px;" value="취소" onclick="location.href='${root}memberViewProc'"/>
			</tr>
		</table>
	</form>
</center>