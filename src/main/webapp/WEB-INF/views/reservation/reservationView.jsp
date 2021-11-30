<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.email}">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="index?formpath=login";
	</script>
</c:if>
<c:url var="root" value="/"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.container{display:flex;}
	.btn_btn{color:white; background-color:black; border-color:black; font-size:15px; border-radius:5px; padding:5px 10px;}
	.btn_btnd{color:white; background-color:#D5D5D5; border-color:#D5D5D5; font-size:15px; border-radius:5px; padding:5px 10px;}
</style>
<center>
<!-- <form id ="f" method="post">
<input type="hidden" id="resNum" name="resNum"/> -->
	<table class="container">
		<tr>
			<td colspan=2>
			<h2>예약정보</h2>
			</td>
		</tr>
		<c:forEach var = "reservationView" items="${reservationView }">
		<tr>
			<td style="width:100px; height:40px;"><b>예약번호</b></td>
			<td style="width:250px; height:40px;"><b>${reservationView.resNum}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>이메일</b></td>
			<td style="width:250px; height:40px;"><b>${reservationView.email}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>식당이름</b></td>
			<td style="width:250px; height:40px;"><b>${reservationView.restName}</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>예약시간</b></td>
			<td style="width:250px; height:40px;"><b>${reservationView.resDay}	${reservationView.hours }</b></td>
		</tr>
		<tr>
			<td style="width:100px; height:40px;"><b>상태</b></td>
			<td style="width:250px; height:40px;"><b>${reservationView.status}</b>
			
			<c:choose>
				<c:when test="${reservationView.status eq '예약확인'}">
					<input type="button" style="width:80px;" value="예약취소" class="btn_btn" id="btn_cancle" onclick="location.href='${root}resDelete?resNum=${reservationView.resNum}'"/>
				</c:when>
				<c:otherwise>
					<input type="button" style="width:80px;" value="예약취소" class="btn_btnd" disabled="disabled"/>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${reservationView.status eq '완료상태'}">
					<button type="button" class="btn_btn" onclick="location.href='index?formpath=write&restNum=${reservationView.resNum}'">리뷰 쓰기</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn_btnd" disabled="disabled">리뷰 쓰기</button>
				</c:otherwise>
			</c:choose>
			
			
			
			<hr>
			</td>
		</tr>
		</c:forEach>
	</table>
</center>