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
			<c:when test="${not empty sessionScope.email }">
			<td>
			<div class="dropdown">
			 <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color:black">
			    <img src="resources/img/icon/profileIcon.png" style="width:30px">
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			    <li><a class="dropdown-item" href="${root}memberViewProc">회원정보</a></li>
			    <li><a class="dropdown-item" href="${root }reservationViewProc">예약 확인</a></li>
			    <li><a class="dropdown-item" href="${root }reviewProc">내 리뷰</a></li>
			    <li> <a class="dropdown-item" href="${root }myCollectProc">관심 식당</a></li>
			  </ul>
			</div>
            </td>	 
			<td><a href="${root}logout">로그아웃</a></td>
			</c:when>
			<c:otherwise>
				<td><a href="${root}index?formpath=login">로그인</a></td>
				<td><a href="${root}index?formpath=member">회원가입</a></td>
			</c:otherwise>
		</c:choose>
		<td width=50></td>
	</tr>
	
</table>