<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 
<c:if test="${empty sessionScope.id }">
	 <script>
		location.href='index?formpath=login';
	</script>
</c:if> -->
<style>
	#list{width:450px; align:center}
	th{heigth: 20px; align: center}
	.i{width:120px;}
</style>
</head>
<center>
<table id="list">
	<tr>
	<th>아이디</th><th class="num">식당 번호</th><th>식당 이름</th>
	</tr>
	<c:forEach var="m" items="${all }">
		<tr>
			<td class="i">${m.id }</td>
			<td class="restnum">${m.restnum }</td>
			<td class="restname">${m.restname }</td>
		</tr>
	</c:forEach>
</table>
</center>