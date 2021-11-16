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
	<form action="menuRegisterProc" id="f" method="post" enctype="multipart/form-data">
		<table border="1" style="width:1000px; " id="registerTable">
			<tr id="trMenu">
				<td style="width:60px"><strong>메뉴1</strong></td>
	            <td style="width:800px">
	                <input type="text" id="category" name="category" placeholder="분류" style="width:100px">
	                <input type="text" id="menuName" name="menuName" placeholder="메뉴명" style="width:100px">
	                <input type="text" id="menuDescript" name="menuDescript" placeholder="메뉴 소개">
	                <input type="number" id="unitPrice" name="unitPrice" placeholder="가격" style="width:100px">
	                <input type="file" id="menuImage1" name="menuImage" style="display:none;" onchange="previewName(this)"> 
	                <label for="menuImage1"><i class="fas fa-upload">Photo</i> </label>
	                <span id="menuImage1name"></span>
	                <button type="button" onclick="delFirst()">삭제</button>
	            </td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="addMenu()">메뉴 추가</button>
		<button type="button" onclick="showList()">메뉴 확인</button>
		<button type="button" name="registerMenu" onclick="submitMenu()">메뉴 등록하기</button>
		<input type="button" value="메뉴 등록하지 않기" onclick="location.href='restInfo'">
	</form>
	<br><br>
	<hr><br>
	<div id="showList" style="display:none">
		<h3>메뉴 목록</h3>
		<table id="menuList" border="1px"></table>
	</div>
</body>
</html>