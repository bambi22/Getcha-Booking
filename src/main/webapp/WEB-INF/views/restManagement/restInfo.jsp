<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 정보 관리</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
</script>
<script>
function showModify(data){
	if(data=="modifyForm"){
		var form = document.getElementById("modifyForm");		
	}else if(data=="detailsForm"){
		var form = document.getElementById("detailsForm");
	}else if(data=="promotionForm"){
		var form = document.getElementById("promotionForm");
	}
	if(form.style.display=='none'){
		form.style.display = 'block';
	}else{
		form.style.display = 'none';
	}
}
</script>
</head>
<body>
	<c:import url="restTop.jsp"/>
	
	<hr>
	<br><br>
	<img src="">[식당 사진(최대 6장)]
	<br><br>
	
	<div>
	<h3>셰프테이너</h3>
	<p>바쁜 일상에서 벗어나 도심 속 여유를 느낄 수 있는 공간 '셰프테이너'입니다.
	여러 특급 호텔 총주방장 경력을 쌓은 오너셰프의 차별화된 이탈리안
	요리를 즐싱 수 있는 곳입니다.</p>
	<span>양식·이태원</span>
	<br>
	<p>별점</p>
	</div>
	<br>
	<a href="javascript:showModify('modifyForm')">수정하기</a>
	<div id="modifyForm" style="display:none">
		<form action="#">
			<table>
				<tr>
					<td>식당 이름</td><td><input type="text" name="restName"></td>
				</tr>
				<tr>
					<td> 한줄 소개 글 </td>
					<td> <textarea cols="50" rows="4"></textarea>
				</tr>
				<tr>
					<td> 식당 종류 </td>
					<td>
						<select name="restType"> 
							<option value="korean">한식</option>
							<option value="western">양식</option>
							<option value="chinese">중식</option>
							<option value="asian">동남아식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td> 식당 주소 </td>
					<td>
						<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
						<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
						<input type="text" name="addr1" placeholder="주소" id="addr1" readonly="readonly" style="width:300px;"><br>
						<input type="text" name="addr2" placeholder="상세주소" id="addr2"><br>
					</td>
				</tr>
				<tr>
					<td> 식당 사진 </td>
					<td> <input type="file" name="representPhoto" style="width: 300px"></td>
				</tr>	
			</table>
			<input type="submit" value="수정">
		</form>
	</div>
	<br>
	<hr align="left" width="500px">
	<br>
	
	<table>
		<tr>
			<td> 주소 </td>
			<td> 서울특별시 용산구 이태원로27길 101 </td>
		</tr>
		<tr>
			<td> 영업 시간 </td>
			<td> 주중 : 오전 11:00 - 오후 22:00<br>
				 토요일 : 오전 11:00 - 오후 21:00<br>
				 일요일 휴무
			</td>
		</tr>
		<tr>
			<td> 수용 가능 인원 </td>
			<td> 30 명 </td>
		</tr>
		<tr>
			<td> 부대시설 </td>
			<td>주차가능·콜키지 가능</td>
		</tr>
	</table>
	<br>
	<a href="javascript:showModify('detailsForm')">수정하기</a>
	<div id="detailsForm" style="display:none">
		<form action="#">
			<table>
				<tr>
					<td> 식당 주소 </td>
					<td>
						<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
						<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
						<input type="text" name="addr1" placeholder="주소" id="addr1" readonly="readonly" style="width:300px;"><br>
						<input type="text" name="addr2" placeholder="상세주소" id="addr2"><br>
					</td>
				</tr>
				<tr>
					<td> 수용 가능 인원 </td>
					<td>
						<input type="text">
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
			</table>
			<input type="submit" value="수정">
		</form>
	</div>
	<br>
	<hr align="left" width="500px">
	<br>
	<h4>진행 중인 프로모션</h4>
	<p>[프로모션 사진]</p>
	<a href="javascript:showModify('promotionForm')">수정하기</a>
	<div id="promotionForm" style="display:none">
		<form action="#">
			<span>식당 사진</span>
			<input type="file" name="representPhoto" style="width: 300px"><br>
			<input type="submit" value="수정">
		</form>
	</div>
	
	<br>
	<hr align="left" width="500px">
	<br>
	<h3>메뉴</h3>
	<table style="border: 1px solid; width: 600px;">
		<tr>
			<th>No</th><th>인기</th><th>대표</th><th>메뉴명</th><th>분류</th><th>가격</th><th>사진</th>
		</tr>
		<tr>
			<td>1</td><td><input type="checkbox"><td><input type="checkbox"></td>
			<td>고구마피자</td><td>피자</td><td>14,000</td><td></td>
		</tr>
	</table>
</body>
</html>