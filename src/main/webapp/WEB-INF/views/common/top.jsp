<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/"/>
<style>
	a:link{color:black; text-decoration:none;}
</style>
<table>
	<tr>
		<td align="center" colspan=5><h1><a href="${root}index?formpath=main">Getcha</a></h1></td>
	</tr>
	<tr>
		<td align="center" colspan=5 width=100%><hr/></td>
	</tr>
	<tr align="right">
		<td width=700></td>
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<td><a href="${root}index?formpath=login">로그인</a></td>
			</c:when>
			<c:otherwise>
				<td><a href="${root}logout">로그아웃</a></td>
			</c:otherwise>
		</c:choose>
		<td><a href="${root}index?formpath=member">회원가입</a></td>
		<td width=50></td>
	</tr>
	
</table>