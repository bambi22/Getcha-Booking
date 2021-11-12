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
<div><h2>관심 레스토랑</h2></div>
<form id="f" method="post">
	<input type="hidden" id="writeNo" name="writeNo"/>
	<input type="hidden" id="proc" name="deletes"/>
	<input type="hidden" id="formpath" name="boardDelete"/>
<table style="width: 650px; ">
	<tr>
		<td rowspan=3><a><img src="resources/restaurant/icon1.png"></a></td>
		<td><div id="${restnum }" class="title"><a>restname</a></div></td>
	</tr>
	<tr>
		<td>district / type</td>
	</tr>
	<tr>
		<td>avgpoint</td>
	</tr>
	<tr>
		<td colspan=3 align="right">
			<button formaction="/index" style="width: 100px; ">컬렉션 취소</button>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	
	<tr>
		<td rowspan=3><img src="resources/restaurant/icon1.png"></td>
		<td><div id="${list.no }" class="title">식당 이름2</div></td>
	</tr>
	<tr>
		<td>가로수길 / 양식</td>
	</tr>
	<tr>
		<td>별점 3.8</td>
	</tr>
	<tr>
		<td colspan=3 align="right">
			<button formaction="/index" style="width: 100px; ">컬렉션 취소</button>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	
	<c:forEach var="list" items="${boardList }">
	</c:forEach>
</table>
</form>
${page }
</center>