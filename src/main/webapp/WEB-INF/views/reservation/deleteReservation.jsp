<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	/*$("document").ready(function(){
		$('.deleteBtn').css("cursor", "pointer").click(function(){
			let no = $(this).attr("id");
			$("#resNum").val(no);
			$("#f").attr("action", "${root}DeleteProc");
			$("#f").submit();
		})
	})*/
</script>
<center>
	<table>
		<tr>
			<td colspan=2 >
			<h2>회원삭제</h2>
		</tr>
		<tr>
			<td align='right' height=40>식당</td>
			<td><input type=text name='restName' id='restName' value='${res.restName }' disabled="disabled"/></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td align='right' height=40>예약일</td>
			<td><input type=text name='resDay' id='resDay' value='${res.resDay }' disabled="disabled"/></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td align='right' height=40>예약시간</td>
			<td><input type=text name='hours' id='hours' value='${res.hours }' disabled="disabled"/></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td align='right' height=40>예약인원</td>
			<td><input type=text name='capacity' id='capacity' value='${res.capacity }' disabled="disabled"/></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td align='right' height=40>
				<input type="button" style="width:80px;" value="예약취소" onclick="location.href='${root}DeleteProc?resNum=${res.resNum}'"/>
				<input type="button" value="예약 내역" onclick="location.href='${root}reservationViewProc'"/>
			</td>
		<tr>
	</table>
</center>