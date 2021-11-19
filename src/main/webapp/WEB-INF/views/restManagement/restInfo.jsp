<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>식당 정보 관리</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/restManagement/restRegister.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" >
<script>

function showModify(data){
	if(data=="modifyForm"){
		var form = document.getElementById("modifyForm");		
	}else if(data=="detailsForm"){
		var form = document.getElementById("detailsForm");
	}else if(data=="promotionForm"){
		var form = document.getElementById("promotionForm");
	}else if(data=="menuModifyForm"){
		var form = document.getElementById("menuModifyForm");
	}
	if(form.style.display=='none'){
		form.style.display = 'block';
	}else{
		form.style.display = 'none';
	}
}

function deleteRow(del){
	$(del).parent().parent().remove();
}

</script>
</head>
<body>
	<c:import url="restTop.jsp"/>
	<br>
	<hr>
	<br><br>
	<div>
		<c:forEach var="image" items="${restImgList}">
			<img src="resources/img/restaurant/${image.restImage }" width="200">
		</c:forEach>
	</div>
	<br><br>
	
	<div>
	<h3>${rest.restName }</h3>
	<p>${rest.restIntro }</p>
	<span>${rest.type }·${rest.dong }</span>
	<br>
	<c:forEach var="cnt" begin="1" end="5">
		<c:choose>
			<c:when test="${cnt==1 }">
				<img src="resources/img/icon/star.png" width="20"> 	
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${rest.avgPoint < cnt && rest.avgPoint > (cnt-1) }">
						<img src="resources/img/icon/rating.png" width="20">
					</c:when>
					<c:when test="${rest.avgPoint < (cnt-1) }">
						별
					</c:when>
					<c:otherwise>
						<img src="resources/img/icon/star.png" width="20"> 						
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>		
	</c:forEach>
	<p>평점 : ${rest.avgPoint }</p>
	
	</div>
	<br>
	<a href="javascript:showModify('modifyForm')">수정하기</a>
	<div id="modifyForm" style="display:none">
		<form action="#">
			<table>
				<tr>
					<td>식당 이름</td><td><input type="text" name="restName" value="${rest.restName }"></td>
				</tr>
				<tr>
					<td> 한줄 소개 글 </td>
					<td> <textarea cols="50" rows="4">${rest.restIntro }</textarea>
				</tr>
				<tr>
					<td> 식당 종류 </td>
					<td>
						<select name="type" id="type"> 
							<option value="">선택</option>
							<option id="한식" value="한식">한식</option>
							<option id="일식" value="일식">일식</option>
							<option id="중식" value="중식">중식</option>
							<option id="이탈리아음식" value="이탈리아음식">이탈리아음식</option>
							<option id="인도음식" value="인도음식">인도음식</option>
							<option id="태국음식" value="태국음식">태국음식</option>
							<option id="베트남음식" value="베트남음식">베트남음식</option>
							<option id="프랑스음식" value="프랑스음식">프랑스음식</option>
							<option id="스페인음식" value="스페인음식">스페인음식</option>
							<option id="퓨전음식" value="퓨전음식">퓨전음식</option>
							<option id="direct" value="direct">직접입력</option>
						</select>
						<input type="text" id="typeDirect" name="type"><br>
					</td>
				</tr>
				<tr>
					<td> 식당 사진 </td>
					<td> <input type="file" name="restImage" style="width: 300px" multiple></td>
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
			<td> ${rest.address } </td>
		</tr>
		<tr>
			<td> 영업 시간 </td>
			<td>
				<c:forEach var="open" items="${openList }">
					<c:if test="${open.daySelection != '휴무' }">
						${open.weekSelection } ${open.daySelection } ${open.hours } <br>
					</c:if>
				</c:forEach>
				<c:forEach var="open" items="${openList }">
					<c:if test="${open.daySelection == '휴무' }">
						${open.weekSelection } ${open.daySelection }
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td> 수용 가능 인원 </td>
			<td> ${rest.capacity } </td>
		</tr>
		<tr>
			<td> 부대시설 </td>
			<td>
				<c:forEach var="facil" items="${facilityList}">
					<c:if test="${facil.facility == '주차 가능' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_parking.svg" width="40"><br>주차 가능
						</div>
					</c:if>
					<c:if test="${facil.facility == '발렛 가능' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_valet_parking.svg" width="40"><br>발렛 가능
						</div>
					</c:if>
					<c:if test="${facil.facility == '단체석' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_group_seat.svg" width="40"><br>단체석
						</div>
					</c:if>
					<c:if test="${facil.facility == '아기의자' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_baby_seat.svg" width="40"><br>아기의자
						</div>
					</c:if>
					<c:if test="${facil.facility == '콜키지 가능' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_corkage.svg" width="40"><br>콜키지 가능
						</div>
					</c:if>
					<c:if test="${facil.facility == '개별 룸' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_room.svg" width="40"><br>개별 룸
						</div>
					</c:if>
					<c:if test="${facil.facility == '전문 소믈리에' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_sommelier.svg" width="40"><br>전문 소믈리에
						</div>
					</c:if>
					<c:if test="${facil.facility == '대관 가능' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_rent.svg" width="40"><br>대관 가능
						</div>
					</c:if>
					<c:if test="${facil.facility == '노키즈존' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_nokids.svg" width="40"><br>노키즈존
						</div>
					</c:if>
					<c:if test="${facil.facility == '심야 영업' }">
						<div style="display:inline; float:left;">
							<img src="resources/img/icon/ic_late_sales.svg" width="40"><br>심야 영업
						</div>
					</c:if>
					
				</c:forEach>
			</td>
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
					<input type="text" value="${rest.capacity }" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
						name="capacity" id="capacity" style="width:30px"/> 명<br>
				</td>
			</tr>
			<tr>
				<td> 부대시설 </td>
				<td>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="parking" name="facilities" value="주차 가능" >
					<label for="parking"><img src="resources/img/icon/ic_parking.svg" width="40"><br>주차 가능</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="valet" name="facilities" value="발렛 가능" >
					<label for="valet"><img src="resources/img/icon/ic_valet_parking.svg" width="40"><br>발렛 가능</label>
				</div>
				<div style="display:inline; float:left;">	
					<input type="checkbox" id="group" name="facilities" value="단체석">
					<label for="group"><img src="resources/img/icon/ic_group_seat.svg" width="40"><br>단체석</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="baby" name="facilities" value="아기의자">
					<label for="baby"><img src="resources/img/icon/ic_baby_seat.svg" width="40"><br>아기의자</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="corkage" name="facilities" value="콜키지 가능">
					<label for="corkage"><img src="resources/img/icon/ic_corkage.svg" width="40"><br>콜키지 가능</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="room" name="facilities" value="개별 룸">
					<label for="room"><img src="resources/img/icon/ic_room.svg" width="40"><br>개별 룸</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="sommelier" name="facilities" value="전문 소믈리에">
					<label for="sommelier"><img src="resources/img/icon/ic_sommelier.svg" width="40"><br>전문 소믈리에</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="rent" name="facilities" value="대관 가능">
					<label for="rent"><img src="resources/img/icon/ic_rent.svg" width="40"><br>대관 가능</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="nokids" name="facilities" value="노키즈존">
					<label for="nokids"><img src="resources/img/icon/ic_nokids.svg" width="40"><br>노키즈존</label>
				</div>
				<div style="display:inline; float:left;">
					<input type="checkbox" id="late" name="facilities" value="심야 영업">
					<label for="late"><img src="resources/img/icon/ic_late_sales.svg" width="40"><br>심야 영업</label>
				</div>
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
	<c:if test="${rest.promotion != '파일 없음' }">
		<p><img src="resources/img/promotion/${rest.promotion }" width="200"></p>
	</c:if>
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
	<div>
		<c:forEach var="menu" items="${wholeMenuList}">
			<img src="resources/img/wholeMenu/${menu.wholeMenu }" width="200">
		</c:forEach>
	</div>
	<table style="border: 1px solid; width: 600px;">
		<c:forEach var="i" begin="0" end="${fn:length(menuList) }">
			<c:if test="${menuList[i].category != menuList[i-1].category}">
				<tr><th>${menuList[i].category }</th></tr>
			</c:if>	
				<tr>
					<td>${menuList[i].menuName }<br>${menuList[i].menuDescript }</td><td>${menuList[i].unitPrice }</td>
				</tr>
		</c:forEach>
	</table>
	<br>
	<a href="javascript:showModify('menuModifyForm')">수정하기</a>
	<div id="menuModifyForm" style="display:none">
		<form name="f">
			<table border="1" id="modifyTable">
				<tr id="trMenu">
					<th style="width:100px">분류</th><th style="width:150px">메뉴명</th><th style="width:200px">메뉴 소개</th><th style="width:100px">가격</th><th>메뉴 이미지</th><th></th>
				</tr>
			 	<c:forEach var="i" begin="0" end="${fn:length(menuList) }">
					<tr>
						<c:if test="${menuList[i].category == null }">
							<td><input type="text" name="category" style="width:80" placeholder="분류"></td>
						</c:if>	
						<c:if test="${menuList[i].category != null }">
							<td><input type="text" name="category" style="width:80" value="${menuList[i].category }"></td>
						</c:if>
						<td><input type="text" name="menuName" style="width:135px" value="${menuList[i].menuName }"></td>
						<c:if test="${menuList[i].menuDescript == null }">
							<td><input type="text" name="menuDescript" style="width:80" placeholder="메뉴 소개"></td>
						</c:if>	
						<c:if test="${menuList[i].menuDescript != null }">
							<td><input type="text" name="menuDescript" style="width:80" value="${menuList[i].menuDescript }"></td>
						</c:if>
						<td><input type="number" name="unitPrice" style="width:90px" value="${menuList[i].unitPrice }"></td>
						<td></td>
						<td><button type="button" name="delMenu" onclick="deleteRow(this)">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
			<button type="button" id="addRow" onclick="addModifyRow()">행 추가</button>
			
			<br>
			<!-- <div>
				<input type="text" id="inCategory"  placeholder="분류" style="width:95px">
	            <input type="text" id="inMenuName"  placeholder="메뉴명" style="width:145px">
	            <input type="text" id="inMenuDescript"  placeholder="메뉴 소개" style="width:190px">
	            <input type="number" id="inUnitPrice" placeholder="가격" style="width:100px">
	            <input type="file" id="inMenuImage" name="menuImage" style="display:none;" onchange="previewName(this)"> 
	            <label for="inMenuImage"><i class="fas fa-upload">Photo</i></label>
	            <span id="menuImagename"></span>
				<button type="button" onclick="addMenu()">추가</button>
			</div>
			<button type="button" onclick="submitMenu()">수정</button>
			<input type="file" id="inWholeMenu" name="wholeMenu" style="display:none;" multiple> 
	        <label for="inWholeMenu"><i class="fas fa-upload">메뉴판</i></label><br> -->
		</form>
	</div>
</body>
<script>
function addModifyRow(){
	// table element 찾기
  const table = document.getElementById('modifyTable');
  
  // 새 행(Row) 추가
  const newRow = table.insertRow();
  
  // 새 행(Row)에 Cell 추가
  const newCell1 = newRow.insertCell(0);
  const newCell2 = newRow.insertCell(1);
  const newCell3 = newRow.insertCell(2);
  const newCell4 = newRow.insertCell(3);
  const newCell5 = newRow.insertCell(4);
  const newCell6 = newRow.insertCell(5);
  
  // Cell에 텍스트 추가
  newCell1.innerHTML = '<input type="text" name="category" style="width:80" placeholder="분류">';
  newCell2.innerHTML = '<input type="text" name="menuName" style="width:135px" placeholder="메뉴명">';
  newCell3.innerHTML = '<input type="text" id="inMenuDescript"  placeholder="메뉴 소개" style="width:190px">';
  newCell4.innerHTML = '<input type="number" id="inUnitPrice" placeholder="가격" style="width:100px">';
  newCell5.innerHTML = '<input type="file" id="inMenuImage" name="menuImage" style="display:none;" onchange="previewName(this)"><label for="inMenuImage"><i class="fas fa-upload">Photo</i></label><span id="menuImagename"></span>';
  newCell6.innerHTML = "<button type='button' name='delMenu' onclick='deleteRow(this)'>삭제</button>";
}

function previewName(file){
	var fileName = file.getAttribute('id');
	for(f of file.files){
		let reader = new FileReader();
		document.getElementById(fileName+'name').innerHTML = f.name;
	}
}
</script>
</html>