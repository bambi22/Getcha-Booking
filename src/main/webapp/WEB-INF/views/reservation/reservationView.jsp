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
<script>
	$("document").ready(function(){
		$('.deleteBtn').css("cursor", "pointer").click(function(){
			let no = $(this).attr("id");
			$("#resNum").val(no);
			$("#f").attr("action", "${root}resDelete");
			$("#f").submit();
		})
	})
</script>
<center>
<form id="f" method="get">
	<input type="hidden" id="resNum" name="resNum"/>
	<table>
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
			<input type="button" style="width:80px;" value="예약취소" class="deleteBtn" id="${reservationView.resNum}"/>
			<hr>
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</center>