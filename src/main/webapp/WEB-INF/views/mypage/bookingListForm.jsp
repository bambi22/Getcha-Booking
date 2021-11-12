<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:if test="${not empty msg}">
	<script>alert('${msg}')</script>
</c:if>
<script>
</script>
<center>
<div><h2>나의 예약</h2></div>
<form id="f" method="post">
	<input type="hidden" id="writeNo" name="writeNo"/>
	<input type="hidden" id="proc" name="deletes"/>
	<input type="hidden" id="formpath" name="boardDelete"/>
<table style="width: 650px; ">
	<tr>
		<td rowspan=3><img src="resources/restaurant/icon1.png"></td>
		<td><div id="${list.no }" class="title">식당 이름1</div></td>
	</tr>
	<tr>
		<td>성수동 / 카페</td>
	</tr>
	<tr>
		<td>2021.11.30 18시 2명</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<button formaction="/index" style="width: 100px; ">예약 취소</button>
			<input type="button" value='리뷰쓰기' class="btn btn-default" onclick="location.href='${root }index?formpath=write'"/>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	
	<tr>
		<td rowspan=3><img src="resources/restaurant/icon1.png"></td>
		<td><div id="${list.no }" class="title">식당 이름2</div></td>
	</tr>
	<tr>
		<td>가로수길 / 식당</td>
	</tr>
	<tr>
		<td>2021.11.31 19시 4명</td>
	</tr>
	<tr>
		<td colspan=3 align="right">
			<button formaction="/index" style="width: 100px; ">예약 취소</button>
			<input type="button" value='리뷰쓰기' onclick="location.href='${root }index?formpath=write'" style="width: 100px; "/>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	
	<c:forEach var="list" items="${boardList }">
		<input type="hidden" name="no" value="${list.no }"/>
	<tr>
		<td rowspan=3></td>
		<td><div id="${list.no }" class="title">식당 이름</div></td>
	</tr>
	<tr>
		<td class="">성수동,카페</td>
	</tr>
	<tr>
		<td class="booking_detail">2021.11.30 18시 2명</td>
	</tr>
	</c:forEach>
</table>
</form>
${page }
</center>