<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 정보 등록</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
	new daum.Postcode({
		oncomplete:function(data){
			var addr = "";
			if(data.userSelectedType === "R"){//도로명 주소일 경우( R )
				addr = data.roadAddress;
			}else{//지번일 경우( J )
				addr = data.jibunAddress;
			}
			document.getElementById("zipcode").value = data.zonecode;
			document.getElementById("addr1").value = addr;
			document.getElementById("addr2").focus();
		}
	}).open();
}

function addOpening(){
 	var day = document.getElementById("openingDay").value;
	var st = document.getElementById("start").value;
	var en = document.getElementById("end").value; 
	var op = document.getElementById("opening").innerHTML;
	if(op ==""){
		document.getElementById("opening").innerHTML = day + " " + st +"-" + en;	
	}else{
		document.getElementById("opening").innerHTML = op+"<br>"+day + " " + st +"-" + en;
	}
}

function addClosed(){
	var day = document.getElementById("closedDay").value;
	var cl = document.getElementById("closed").innerHTML;
	if(cl ==""){
		document.getElementById("closed").innerHTML = day;	
	}else{
		document.getElementById("closed").innerHTML = cl+", "+ day;
	}
}


</script>



<!-- 페이지 넘길 때 정기 휴무일과 영업시간 겹치는지 확인 -->

</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	<h3 style="text-align:middle">메뉴 등록</h3>
	<form action="menuRegister" >
		<table>
			<tr>
				<td> 식당 이름 </td>
				<td> <input type="text"></td>
			</tr>
			<tr>
				<td> 한줄 소개 글 </td>
				<td> <textarea cols="50" rows="4"></textarea>
			</tr>
			<tr>
				<td> 식당 주소 </td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
					<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
					<input type="text" name="addr1" placeholder="주소" id="addr1" readonly="readonly" style="widtd:300px;"><br>
					<input type="text" name="addr2" placeholder="상세주소" id="addr2"><br>
				</td>
			</tr>			
			<tr>
				<td> 식당 종류 </td>
				<td>
					<select name="restType"> 
						<option value="korean">한식</option>
						<option value="western">양식</option>
						<option value="japanese">일식</option>
						<option value="chinese">중식</option>
						<option value="asian">동남아식</option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 영업 시간 </td>
				<td>
					<span id="opening"></span><br>
					<select name="openingDay" id="openingDay">
						<option value="매일">매일</option>
						<option value="주중">주중</option>
						<option value="주말">주말</option>
						<option value="토요일">토요일</option>
						<option value="일요일">일요일</option>						
					</select>
					<input type="time" name="start" id="start"> - 
					<input type="time" name="end" id="end">
					<input type="button" onclick="addOpening()" value="추가">
				</td>
			</tr>
			<tr>
				<td> 정기 휴무 </td>
				<td>
					<span id="closed"></span><br>
					<select name="closedDay" id="closedDay"> 
						<option value="월요일">월요일</option>
						<option value="화요일">화요일</option>
						<option value="수요일">수요일</option>
						<option value="목요일">목요일</option>
						<option value="금요일">금요일</option>
						<option value="토요일">토요일</option>
						<option value="일요일">일요일</option>
					</select>
					<input type="button" onclick="addClosed()" value="추가">
				</td>
			</tr>
			<tr>
				<td> 수용 가능 인원 </td>
				<td>
					<input type="text"> 명
				</td>
			</tr>
			<tr>
				<td> 부대시설 </td>
				<td>
				<input type="checkbox" name="facilities" value="parking">주차가능
				<input type="checkbox" name="facilities" value="babyseat">아기의자
				<input type="checkbox" name="facilities" value="corkage">콜키지 가능
				<input type="checkbox" name="facilities" value="privateroom">개별 룸
				
				</td>
			</tr>
			<tr>
				<td> 식당 사진 (최대 6장) </td>
				<td> <input type="file" name="representPhoto" style="width: 300px"></td>
			</tr>
			<tr>
				<td> 프로모션 </td>
				<td> <input type="file" name="promotion" style="width: 300px"></td>
			</tr>
		</table>
		<input type="submit" value="다음 : 메뉴등록">
	</form>
</body>
</html>