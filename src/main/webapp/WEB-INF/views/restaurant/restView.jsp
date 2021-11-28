<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="<c:url value="/resources/css/common/restview.css" />" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<c:url var="root" value="/" />
<title>식당 정보 보기</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="member/image/favicon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" >
<script src="resources/js/restaurant/restView.js"></script>
<script>
window.onload=function() {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	var addr = document.getElementById('addr').innerHTML;
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${rest.restName}</div>'
	        });
	        
	        infowindow.open(map, marker);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
}
</script>
</head>
<body>
	<header>
	<div class="restMainImg_wrap">
		<c:forEach var="image" items="${restImgList}">
			<img src="${root }upload/restaurant/${image.restImage }" width="200">
		</c:forEach>
	</div>
	<br><br>
		<div class="restTitle">
			<h2 id="restName">${rest.restName }</h2>
			<button id="share_btn"><img src="resources/img/icon/ic_share.png" width="30"></button>
			<c:if test="${not empty sessionScope.email}">
	            <button id="collect_btn" data-num="${restNum }">
		            <c:if test="${collection == 0}">
		            	<img src="resources/img/icon/empty_ht.png" alt="빈 하트 이미지">
		            </c:if>
		            <c:if test="${collection == 1}">
		            	<img src="resources/img/icon/full_ht.png" alt="검정 하트 이미지">
		            </c:if>
	            </button>
	        </c:if>
      	</div>
			 <div class="status_branch">
                <span class="cntReview"><img src="resources/img/icon/ic_review.png"> ${cntReview }</span>
                <span class="cntCollection"><img src="resources/img/icon/full_ht.png"> ${cntCollection }</span>
				<p>${rest.restIntro }</p>
				<span>${rest.type }·${rest.dong }</span>
				<br>
				<img src="resources/img/icon/star.png" width="20" /><label>${rest.avgPoint }</label>
			</div> 
		<br>
		<hr align="left" width="700px">
		<br>
	</header>
	
	<div id="container">
		<table id="rest_detail">
			<tr>
			<td> 주소 </td>
			<td><p id="addr">${rest.address }</p></td>
			</tr>
			<tr>
				<td colspan="2">
				<div id="map" style="width:400px;height:300px;"></div>
				</td>
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
				<td> 부대시설 </td>
				<td class="facil_wrap">
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
				
		<br>
		<hr align="left" width="700px">
		<br>
		
		<c:if test="${rest.promotion != '파일 없음' }">
		<h4>진행 중인 프로모션</h4>
			<p><img src="${root }upload/promotion/${rest.promotion }" width="200"></p>
			<br><hr align="left" width="700px"><br>
		</c:if>
		<h3>메뉴</h3>
		<div>
		<c:if test="${wholeMenuList != '파일 없음' }">
			<c:forEach var="menu" items="${wholeMenuList}">
				<img src="${root }upload/wholeMenu/${menu.wholeMenu }" width="200">
			</c:forEach>
		</c:if>
		</div>
		<table style="border: 1px solid; width: 600px;">
			<c:forEach var="i" begin="0" end="${fn:length(menuList) }">
				<c:if test="${menuList[i].category != menuList[i-1].category}">
					<tr><th>${menuList[i].category }</th></tr>
				</c:if>	
				<tr>
					<td>${menuList[i].menuName }<br>${menuList[i].menuDescript }</td>
					<td>${menuList[i].unitPrice }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		
		<h3>후기</h3>
		<table id="reviewList">
		<c:choose>
			<c:when test="${fn:length(reviewList) != 0 }">
			<caption class="cap">최신순</caption>
			<c:forEach var="rew" items="${reviewList}" varStatus="vs" end="${fn:length(reviewList) }">
			<tr>
				<td rowspan="3">
					<div class="profile_wrap" style="text-align:center">
						<img class="profile_img" src="resources/img/icon/profileIcon.png" style="width:50px;">
						<p>${rew.nickName}</p>
					</div>
				</td>
				<td>
				<c:forEach begin="1" end="${rew.point }" step="1">
					<img src="resources/img/icon/star.png" style="width:18px;">
				</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2"><pre>${rew.content }</pre></td>
			</tr>
			<tr>
				<td>
				<c:if test="${rew.fileNames != '파일없음' }">
					<c:forTokens var="fileName" items="${rew.fileNames }" delims=",">
						<div class="review_image">
							<img src="${root }upload/${fileName }" style="height:100%; width:100%; "/>
						</div>
					</c:forTokens>
				</c:if>
				</td>
			</tr>
			<tr class="date_row"><td colspan="2"><p>${rew.writeDate }</p></td></tr>
				<c:choose>
					<c:when test="${vs.count != vs.end }"><tr><td class="line" colspan="2"><hr align="left" width="800px"></td></tr></c:when>
					<c:otherwise><tr><td></td></tr></c:otherwise>
				</c:choose>
			</c:forEach>
			<tr>
				<td colspan="2" align="center"><nav class="pageNav">${page }</nav></td>
			</tr>
			</c:when>
			<c:otherwise><span class="cap">등록된 후기가 없습니다.</span></c:otherwise>
		</c:choose>
		</table>
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd93e659890d767f6ef2a30852c7410c&libraries=services"></script>