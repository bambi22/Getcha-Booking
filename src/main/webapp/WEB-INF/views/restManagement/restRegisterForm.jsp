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


<script>

//주소 가져오기
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

// 카카오 제공 : 주소로 좌표 가져와서 hidden값에 넣어놓기-> 행정동 가져오기 위함
function findCor(){
	var addr = document.getElementById("addr1").value;
	var geocoder = new kakao.maps.services.Geocoder();
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        console.log(result);
	        document.getElementById("corX").value= result[0].x;
	        document.getElementById("corY").value= result[0].y;
	    }
	};
	geocoder.addressSearch(addr, callback); 
} 


$(function(){
	$('#typeDirect').hide();
	$('#type').change(function(){
		if($('#type').val() == "direct"){
			$('#typeDirect').show();
		}else{
			$('#typeDirect').hide();
		}
	})
});

$(function(){
	$('#hours').hide();
	$('#openingHour').change(function(){
		if($('#openingHour').val() == "day off"){
			$('#hours').hide();
		}else{
			$('#hours').show();
		}
	})
});

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

function submitBtn(){
	var corX = document.getElementById("corX").value;
    var corY = document.getElementById("corY").value;
	var geocoder = new kakao.maps.services.Geocoder();
 	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var strResult = result[0].address_name;
	    	var strArray = strResult.split(' ');
	    	document.getElementById("dong").value = strArray[2];
			console.log(strArray[2]);
			document.getElementById("f").submit(); 
	    }
	};

	geocoder.coord2RegionCode(corX, corY, callback);
	
}
</script>



<!-- 페이지 넘길 때 정기 휴무일과 영업시간 겹치는지 확인 -->

</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	
	<h3 style="text-align:middle">메뉴 등록</h3>
	<form id="f" action="restRegisterProc" >
		<table>
			<tr>
				<td> 식당 등록 </td>
				<td> <input type="text" name="restName"></td>
			</tr>
			<tr>
				<td> 한줄 소개 글 </td>
				<td> <textarea cols="50" rows="4" name="restDetail"></textarea>
			</tr>
			<tr>
				<td> 식당 주소 </td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
					<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
					<input type="text" name="addr1" placeholder="주소" id="addr1" readonly="readonly" style="width:300px;" onchange="findCor()"><br>
					<input type="text" name="addr2" placeholder="상세주소" id="addr2" onchange="findCor()"><br>
					<input type="hidden" id="corX">
					<input type="hidden" id="corY">
					<input type="hidden" id="dong" name="dong">
				</td>
			</tr>		
			<tr>
				<td> 식당 종류 </td>
				<td>
					<select name="type" id="type"> 
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
					<input type="text" id="typeDirect" name="typeDirect">
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
						<option value="월요일">월요일</option>
						<option value="화요일">화요일</option>
						<option value="수요일">수요일</option>
						<option value="목요일">목요일</option>
						<option value="금요일">금요일</option>
						<option value="토요일">토요일</option>
						<option value="일요일">일요일</option>					
					</select>
					<select name="openingHour" id="openingHour">
						<option value="lunch">lunch</option>
						<option value="dinner">dinner</option>
						<option value="no break">no break</option>				
						<option value="day off">day off</option>				
					</select>
					<div id="hours" style="display:inline;">
						<input type="text" name="start" id="start"> - 
						<input type="text" name="end" id="end">
					</div>
					<input type="button" onclick="addOpening()" value="추가">
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
		<input type="button" value="다음 : 메뉴등록" onclick="submitBtn()">
	</form>
</body>
</html>