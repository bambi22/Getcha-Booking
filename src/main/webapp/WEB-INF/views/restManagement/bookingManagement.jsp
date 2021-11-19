<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<style>
	div.reserveTable{
		overflow: auto;
		white-space: nowrap;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	$( function() {
	  $( "#datepicker" ).datepicker({ minDate: 0, maxDate: "+1M" });
	} );
</script>
<script>
function popup(){
	var url = "insertSales";
    var name = "주문 정보 입력";
    var option = "width = 500, height = 500, top = 100, left = 200"
    window.open(url, name, option);
}
</script>
</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	
	<nav style="float:left; text-align:center; margin:30px">
		<h3> Seated </h3>
		<div><b>김소희</b><br>5명<br><br></div>
		<div><b>이윤경</b><br>4명<br><br></div>
		<div><b>김새봄</b><br>10명<br><br></div>
		<div><b>남웅식</b><br>10명<br><br></div>
	</nav>
	<div class="reserveTable">
		<input type="text" id="datepicker" value="날짜 선택">
		<table border="1" style="margin:10px;">
			<tr>
				<td>테이블</td>
				<td>11:00-12:00</td>
				<td>12:00-13:00</td>
				<td>13:00-14:00</td>
				<td>14:00-15:00</td>
				<td>15:00-16:00</td>
				<td>16:00-17:00</td>
				<td>17:00-18:00</td>
				<td>18:00-19:00</td>
				<td>19:00-20:00</td>
				<td>20:00-21:00</td>
			</tr>
			<tr>
				<td>1</td>
				<td></td>
				<td onclick="popup()"><b>김소희</b><br>5명<br></td>
				<td></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>김소희</b><br>5명<br></td>
				<td></td>
				<td><b>김새봄</b><br>10명<br></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2</td>
				<td><b>김새봄</b><br>10명<br></td>
				<td><b>김소희</b><br>5명<br></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td></td>
				<td><b>김소희</b><br>5명<br></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>3</td>
				<td></td>
				<td><b>김소희</b><br>5명<br></td>
				<td></td>
				<td></td>
				<td></td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>4</td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>김소희</b><br>5명<br></td>
				<td></td>
				<td></td>
				<td><b>김새봄</b><br>10명<br></td>
				<td></td>
				<td><b>김소희</b><br>5명<br></td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td></td>
			</tr>
			<tr>
				<td>5</td>
				<td></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td></td>
				<td><b>김새봄</b><br>10명<br></td>
				<td></td>
				<td><b>김소희</b><br>5명<br></td>
				<td><b>김소희</b><br>5명<br></td>
				<td></td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>남웅식</b><br>10명<br></td>
			</tr>
			<tr>
				<td>6</td>
				<td></td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>이윤경</b><br>4명<br></td>
				<td></td>
				<td></td>
				<td><b>김소희</b><br>5명<br></td>
				<td><b>김소희</b><br>5명<br></td>
				<td></td>
				<td><b>남웅식</b><br>10명<br></td>
				<td><b>김새봄</b><br>10명<br></td>
			</tr>
			<tr>
			</tr>
		</table>
	</div>

</body>
</html>