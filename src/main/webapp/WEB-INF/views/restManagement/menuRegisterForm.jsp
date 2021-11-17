<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대표 메뉴 등록</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- fontawsome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" >
<script type="text/javascript" src="resources/js/restManagement/menuRegister.js" ></script>
</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	<h3>메뉴 등록</h3>
	<form name="f">
		<table border="1" id="registerTable">
			<tr id="trMenu">
				<th style="width:100px">분류</th><th style="width:150px">메뉴명</th><th style="width:200px">메뉴 소개</th><th style="width:100px">가격</th><th>메뉴 이미지</th><th></th>
			</tr>
		</table>
		<br>
		<div>
			<input type="text" id="inCategory"  placeholder="분류" style="width:95px">
            <input type="text" id="inMenuName"  placeholder="메뉴명" style="width:145px">
            <input type="text" id="inMenuDescript"  placeholder="메뉴 소개" style="width:190px">
            <input type="number" id="inUnitPrice" placeholder="가격" style="width:100px">
            <input type="file" id="inMenuImage" name="menuImage" style="display:none;" onchange="previewName(this)"> 
            <label for="inMenuImage"><i class="fas fa-upload">Photo</i></label>
            <span id="menuImagename"></span>
			<button type="button" onclick="addMenu()">추가</button>
		</div>
		<button type="button" onclick="submitMenu()">메뉴 등록하기</button>
		 <input type="file" id="inWholeMenu" name="wholeMenu" style="display:none;" multiple> 
            <label for="inWholeMenu"><i class="fas fa-upload">메뉴판</i></label><br>
            
		<input type="button" value="메뉴 등록하지 않기" onclick="location.href='restInfo'">
	</form>
	<br><br>
	<hr><br>

</body>
</html>