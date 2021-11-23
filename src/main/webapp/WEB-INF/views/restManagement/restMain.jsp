<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 메인</title>
</head>
<body style="display:flex;">
	<c:import url="restNav.jsp"/>
	<script>
		//내비에 선택된 탭 색깔 변경
		document.getElementById('restMainTab').className = 'nav-link active';
	</script>
	<div>
		<table>
			<tr><td><img src="resources/img/restaurant/${restDto.representImage }" width="200"></td></tr>
			<tr><td><h3>${restDto.restName }</h3></td></tr>
			<tr><td><span>${restDto.type }·${restDto.dong }</span></td></tr>
			<tr><td><span>${restDto.address }</span></td></tr>
		</table>
	</div>
	
</body>
</html>