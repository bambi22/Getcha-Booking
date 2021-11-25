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
<!-- 다음 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- javascript 파일 링크 -->
<script type="text/javascript" src="resources/js/restManagement/restRegister.js" ></script>
<script type="text/javascript" src="resources/js/restManagement/restInfo.js" ></script>
<script type="text/javascript" src="resources/js/restManagement/menuRegister.js" ></script>
<!-- timepicker 플러그인 링크 -->
<script type="text/javascript" src="resources/js/restManagement/jquery.timepicker.min.js" ></script><!-- 타이머js -->
<link type="text/css" rel="stylesheet" href="resources/css/restManagement/jquery.timepicker.css" media=""/><!-- 타이머css -->
<!-- 카카오 주소 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ca9e6dca916cb522a752c40d791a9b9&libraries=services"></script>

</head>
<body style="display:flex;">
	<script>
		//내비에 선택된 탭 색깔 변경
		document.getElementById('restInfoTab').className = 'nav-link active';
	</script>

	<br><br>
<div>
	<!-- 식당 사진 보여주기 -->
	<div>
		<c:forEach var="image" items="${restImgList}">
			<img src="resources/img/restaurant/${image.restImage }" width="200">
		</c:forEach>
	</div>
	<br><br>
	
	<!-- 식당 기본 정보 출력 -->
	<div>
	<h3>${rest.restName }</h3>
	<p>${rest.restIntro }</p>
	<span>${rest.type }·${rest.dong }</span>
	<br>
	<c:forEach var="cnt" begin="1" end="5">
		<c:choose>
			<c:when test="${rest.ratePoint < cnt && rest.ratePoint > (cnt-1) }">
				<img src="resources/img/icon/rating.png" width="20">
			</c:when>
			<c:when test="${rest.ratePoint <= (cnt-1) }">
				<img src="resources/img/icon/emptystar.png" width="20" height="20">
			</c:when>
			<c:otherwise>
				<img src="resources/img/icon/star.png" width="20"> 						
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<p>평점 : ${rest.ratePoint }</p>
	
	</div>
	<br>
	<a href="javascript:showModify('modifyForm')">수정하기</a>
	
	<!-- 식당 기본 정보 수정 -->
	<div id="modifyForm" style="display:none">
		<form action="modifyBasicInfoProc"  method="post" enctype="multipart/form-data" >
			<table>
				<tr>
					<td>식당 이름</td><td><input type="text" name="restName" value="${rest.restName }"></td>
				</tr>
				<tr>
					<td> 한줄 소개 글 </td>
					<td> <textarea name="restIntro" cols="50" rows="4">${rest.restIntro }</textarea>
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
					<td>
						<input type="file" id="restImage" name="restImage" style="display:none;" multiple onchange="previewRestImage(this)"> 
       					<label for="restImage">레스토랑 사진 업로드 <img src="resources/img/icon/upload.png" width="20"></label>
					</td>
				</tr>	
			</table>
				<div class="previewImgs">

				</div>
			<input type="submit" value="수정">
		</form>
	</div>
	<br>
	<hr align="left" width="500px">
	<br>
	
	<!-- 식당 상세 정보 출력 -->
	<table>
		<tr>
			<td> 주소 </td>
			<td> ${rest.address } </td>
		</tr>
		<tr>
			<td> 영업 시간 </td>
			<td>
				<div>
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
				</div>
			</td>
		</tr>
		<tr>
			<td> 수용 가능 인원 </td>
			<td> ${rest.capacity } 인</td>
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
	
	<!-- 식당 상세 정보 수정 -->
	<div id="detailsForm" style="display:none">
		<form id="modifyDetail" action="modifyDetailProc"  method="post">
			<table>
				<tr>
					<td> 식당 주소 </td>
					<td>
						<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
						<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
						<input type="text" name="address" placeholder="주소" id="addr1" readonly="readonly" style="width:300px;"><br>
						<input type="text" name="address" placeholder="상세주소" id="addr2" onchange="findCor()"><br>
						<input type="hidden" id="corX">
						<input type="hidden" id="corY">
						<input type="hidden" id="dong" name="dong">
					</td>
				</tr>
				<tr>
					<td> 영업 시간 </td>
					<td>
						<div id="openHour">
							<c:forEach var="open" items="${openList }">
								<c:if test="${open.daySelection != '휴무' }">
									<div>
										<input type='text' name='openHour' style='border:none;' value="${open.weekSelection } ${open.daySelection } ${open.hours }">
										<button name='delMenu'>삭제</button>
									</div>
								</c:if>
							</c:forEach>
							<c:forEach var="open" items="${openList }">
								<c:if test="${open.daySelection == '휴무' }">
									<div>
										<input type='text' name='openHour' style='border:none;' value="${open.weekSelection } ${open.daySelection }">
										<button name='delMenu'>삭제</button>
									</div>
								</c:if>
							</c:forEach>
						</div>
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
			<input type="button" value="수정" onclick="modifyDetailInfo()">
		</form>
	</div>
	<br>
	<hr align="left" width="500px">
	<br>
	
	<!-- 포로모션 보여주기 & 수정 -->
	<h4>진행 중인 프로모션</h4>
	<c:if test="${rest.promotion != '파일 없음' }">
		<p><img src="resources/img/promotion/${rest.promotion }" width="300"></p>
	</c:if>
	
	<a href="javascript:showModify('promotionForm')">수정하기</a>
	<div id="promotionForm" style="display:none">
		<form id="modifyPromotionForm"  method="post" enctype="multipart/form-data" >
			<span>식당 사진</span>
			<input type="file" id="promotion" name="promotion" style="display:none;" multiple> 
       		<label for="promotion">프로모션 이미지 업로드 <img src="resources/img/icon/upload.png" width="20"></label>
			<div id="previewImg">	
				<img id="previewPromotion" >
			</div>
			<input type="button" value="수정" onclick="modifyPromotion()">
			<input type="button" value="삭제" onclick="deletePromotion()">
		</form>
	</div>
	
	<br>
	<hr align="left" width="500px">
	<br>
	
	<!--  메뉴 보여주기  -->
	<h3>메뉴</h3>
	<div>
		<c:if test="${wholeMenuList != null }">
			<c:forEach var="menu" items="${wholeMenuList}">
				<img src="resources/img/wholeMenu/${menu.wholeMenu }" width="200">
			</c:forEach>
		</c:if>
	</div>
	<table style="border: 1px solid; width: 600px;">
		<c:if test="${fn:length(menuList) != 0 }">
		<c:forEach var="i" begin="0" end="${fn:length(menuList)-1 }">
			<c:if test="${menuList[i].category != menuList[i-1].category}">
				<tr><th>${menuList[i].category }</th></tr>
			</c:if>	
				<tr>
					<td>${menuList[i].menuName }<br>${menuList[i].menuDescript }</td>
					<td>${menuList[i].priceStr }</td>
					<td>
						<c:if test="${menuList[i].menuImage != '파일 없음'}">
							<img src="resources/img/menu/${menuList[i].menuImage }" width="100">
						</c:if>
					</td>
				</tr>
		</c:forEach>
		</c:if>
	</table>
	<br>
	<a href="javascript:showModify('menuModifyForm')">수정하기</a>
	
	<!-- 메뉴 수정하기 -->
	<div id="menuForm" style="display:none">
		<form id="menuModifyForm" action="menuModifyProc" method="post" enctype="multipart/form-data">
			<input type="hidden" id="length" value="${fn:length(menuList)-1}">
			<br>
			<input type="file" id="inWholeMenu" name="wholeMenu" style="display:none;" multiple onchange="previewWholeMenu(this)"> 
       		<label for="inWholeMenu">메뉴판 사진 업로드 <img src="resources/img/icon/upload.png" width="20"></label>
       		<button type="button" onclick="location.href='deleteWholeMenuProc'">메뉴판 사진 삭제</button>
			<div class="wholeMenuPreview">
			
			</div>
			<br>
			<table border="1" id="registerTable">
				<tr id="trMenu">
					<th style="width:100px">분류</th><th style="width:150px">메뉴명</th><th style="width:200px">메뉴 소개</th><th style="width:100px">가격</th><th>메뉴 이미지</th><th></th>
				</tr>
				<c:if test="${fn:length(menuList) != 0 }">
			 	<c:forEach var="i" begin="0" end="${fn:length(menuList)-1}">
					<c:if test="${menuList[i].menuName != null }">
						<tr>
							<c:if test="${menuList[i].category == null }">
								<td><input type="text" name="category" style="width:80" placeholder="분류"></td>
							</c:if>	
							<c:if test="${menuList[i].category != null }">
								<td><input type="text" name="category" style="width:80" value="${menuList[i].category }"></td>
							</c:if>
							<td><input type="text" name="menuName" style="width:135px" value="${menuList[i].menuName }"></td>
							<c:if test="${menuList[i].menuDescript == null }">
								<td><input type="text" name="menuDescript" style="width:190" placeholder="메뉴 소개"></td>
							</c:if>	
							<c:if test="${menuList[i].menuDescript != null }">
								<td><input type="text" name="menuDescript" style="width:80" value="${menuList[i].menuDescript }"></td>
							</c:if>
							<td><input type="number" name="unitPrice" style="width:90px" value="${menuList[i].unitPrice }"></td>
							<td>
								<input type="file" id="menuImage${i }" name="menuImage" style="display:none;" onchange="previewImg(this)">
  								<label for="menuImage${i }"><img name="menuImage${i }" src="resources/img/icon/upload.png" width="20"></label>
							</td>
							<td><button type="button" name="delMenu" onclick="deleteRow(this)">삭제</button></td>
						</tr>
					</c:if>
				</c:forEach>
				</c:if>
			</table>
			<button type="button" id="addRow" onclick="addModifyRow()">행 추가</button>
			<button type="button" onclick="modifyMenu()">메뉴 수정</button>
			<br>
		</form>
	</div>
</div>
</body>
<script>
//메뉴 이미지 이미보기
function previewImg(input){
	if(input.files && input.files[0]){
		var imgName = input.getAttribute('id');
		var reader = new FileReader();
		reader.onload = function (e){
			$('img[name='+imgName+']').attr('src',e.target.result);
			$('img[name='+imgName+']').attr('width',100);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>

</html>