<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
</head>
<body style="display:flex;">
	<c:import url="adminNav.jsp"/>
	<script>
		//내비에 선택된 탭 색깔 변경
		document.getElementById('guideTab').className = 'nav-link active';
	</script>
	
	<h3>2021 가이드북 선정 레스토랑</h3>
	
	<table>
		<th>식당 번호</th><th>식당 이름</th>
	</table>
	
	<input type="text" name="add" placeholder="추가할 식당 번호 혹은 식당명 입력">
	<button type="submit">추가</button>
</body>
</html>