<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 정보 등록</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- 다음 주소 창 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 주소 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ca9e6dca916cb522a752c40d791a9b9&libraries=services"></script>
<!-- timepicker 플러그인 링크 -->
<script type="text/javascript" src="resources/js/restManagement/jquery.timepicker.min.js" ></script><!-- 타이머js -->
<link type="text/css" rel="stylesheet" href="resources/css/restManagement/jquery.timepicker.css" media=""/><!-- 타이머css -->
<!-- 이 페이지 자바스크립트 링크 -->
<script type="text/javascript" src="resources/js/restManagement/restRegister.js" ></script>

</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	
	<h3>메뉴 등록</h3>
	<form id="f" action="restRegisterProc" method="post">
		<input type="hidden" value="35" name="restNum">
		<table>
			<tr>
				<td> 식당 이름 </td>
				<td> 
					<input type="text" name="restName" id="restName"><br>
					<label id="warnRestName" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 한줄 소개 글 </td>
				<td> 
					<textarea cols="50" rows="4" name="restIntro" id="restIntro"></textarea><br>
					<label id="warnRestIntro" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 식당 주소 </td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
					<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
					<input type="text" name="address" placeholder="주소" id="addr1" readonly="readonly" style="width:300px;" onchange="findCor()"><br>
					<input type="text" name="address" placeholder="상세주소" id="addr2" onchange="findCor()"><br>
					<label id="warnAddr" style="color:red;"></label>
					<input type="hidden" id="corX">
					<input type="hidden" id="corY">
					<input type="hidden" id="dong" name="dong">
				</td>
			</tr>		
			<tr>
				<td> 식당 종류 </td>
				<td>
					<select name="type" id="type"> 
						<option value="">선택</option>
						<option value="한식">한식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
						<option value="이탈리아음식">이탈리아음식</option>
						<option value="인도음식">인도음식</option>
						<option value="태국음식">태국음식</option>
						<option value="베트남음식">베트남음식</option>
						<option value="프랑스음식">프랑스음식</option>
						<option value="스페인음식">스페인음식</option>
						<option value="퓨전음식">퓨전음식</option>
						<option value="direct">직접입력</option>
					</select>
					<input type="text" id="typeDirect" name="type"><br>
					<label id="warnType" style="color:red;"></label>
					
				</td>
			</tr>
			<tr>
				<td> 영업 시간 </td>
				<td>
					<div id="openHour"></div>
					<select id="openingDay">
						<option value="매일">매일</option>
						<option value="주중">주중</option>
						<option value="주말">주말</option>
						<option value="월요일">월요일</option>
						<option value="화요일">화요일</option>
						<option value="수요일">수요일</option>
						<option value="목요일">목요일</option>
						<option value="금요일">금요일</option>
						<option value="토요일">토요일</option>
						<option value="일요일">일요일</option>					
					</select>
					<select id="openingSel">
						<option value="">선택 안함</option>				
						<option value="점심">점심</option>
						<option value="저녁">저녁</option>
						<option value="휴무">휴무</option>				
					</select>
					<div id="hours" style="display:inline;">
						<input type="text" id="start"  maxlength="10" style="width:40px" class="setDatePicker">
			            -
			            <input type="text" id="end"  maxlength="10" style="width:40px" class="setDatePicker">
					</div>
					<input type="button" onclick="addOpening()" value="추가"><br>
					<label id="warnOpenHour" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 수용 가능 인원 </td>
				<td>
					<!-- 숫자만 입력 가능 정규 표현식 사용 -->
					<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
						name="capacity" id="capacity" style="width:30px"/> 명<br>
					<label id="warnCapacity" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 부대시설 </td>
				<td>
					<input type="checkbox" name="facilities" value="parking">주차 가능
					<input type="checkbox" name="facilities" value="valet">발렛 가능
					<input type="checkbox" name="facilities" value="groupSeats">단체석
					<input type="checkbox" name="facilities" value="babySeats">아기의자
					<input type="checkbox" name="facilities" value="corkage">콜키지 가능
					<input type="checkbox" name="facilities" value="privateRoom">개별 룸
					<input type="checkbox" name="facilities" value="sommelier">전문 소믈리에
					<input type="checkbox" name="facilities" value="spaceRental">대관 가능
					<input type="checkbox" name="facilities" value="noKids">노키즈존
					<input type="checkbox" name="facilities" value="lateNight">심야 영업
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
		<input type="button" value="다음 : 메뉴등록" onclick="submitBtn()">
	</form>
</body>
</html>