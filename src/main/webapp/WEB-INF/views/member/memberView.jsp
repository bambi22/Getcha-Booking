<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.email }">
	<script>
		location.href="index?formpath=member"
	</script>
</c:if>
<c:url var="root" value="/"/>
<center>
	<table>
		<tr>
			<td colspan=2 >
			<h2>회원정보</h2>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>닉네임</b></td>
			<td style="width:250px; height:40px;"><b>${memberView.nickname}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>이메일</b></td>
			<td style="width:250px; height:40px;"><b>${memberView.email}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>휴대폰 번호</b></td>
			<td style="width:250px; height:40px;"><b>${memberView.mobile}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>생일</b></td>
			<td style="width:250px; height:40px;"><b>${memberView.birth}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>성별</b></td>
			<c:choose>
				<c:when test="${memberView.gender == 'm' }">
					<td style="width:100px; height:40px;" align="left" valign="bottom">남</td>
				</c:when>
				<c:when test="${memberView.gender == 'w' }">
					<td style="width:100px; height:40px;" align="left" valign="bottom">여</td>
				</c:when>
				<c:otherwise>
					<td style="width:100px; height:40px;" align="left" valign="bottom">선택안함</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan=2 align="right">
				<input type="button" style="width:60px;" value="수정" onclick="location.href='memberModi'"/>
				<input type="button" style="width:60px;" value="홈" onclick="location.href='${root}index?formpath=main2'"/>
				<input type="button" style="width:60px;" value="탈퇴" onclick="location.href='deleteForm'"/>
			</td>
		</tr>
	</table>
</center>