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
<div><h2>나의 리뷰</h2></div>
<form id="f" method="post">
	<input type="hidden" id="writeNo" name="writeNo"/>
	<input type="hidden" id="proc" name="deletes"/>
	<input type="hidden" id="formpath" name="boardDelete"/>
<table style="width: 650px; ">
	<tr>
		<td><div id="${list.no }" class="title">식당 이름1</div></td>
	</tr>
	<tr>
		<td><pre>리뷰 내용
		보여지는 칸입니다.
		</pre></td>
	</tr>
	<tr>
		<td>
			<img src="resources/upload/icon1.png">
			<img src="resources/upload/icon1.png">
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type="button" value='수정' onclick="location.href='${root }index?formpath=write'" style="width: 100px; "/>
			<button formaction="/index" style="width: 100px; ">삭제</button>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	
	<tr>
		<td><div id="${list.no }" class="title">식당 이름2</div></td>
	</tr>
	<tr>
		<td><pre>리뷰 내용</pre></td>
	</tr>
	<tr>
		<td>
			<img src="resources/upload/icon1.png">
			<img src="resources/upload/icon1.png">
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type="button" value='수정' onclick="location.href='${root }index?formpath=write'" style="width: 100px; "/>
			<button formaction="/index" style="width: 100px; ">삭제</button>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	
	<c:forEach var="list" items="${boardList }">
		<input type="hidden" name="no" value="${list.no }"/>
	<tr>
		<td><div id="${list.no }" class="title">식당 이름1</div></td>
	</tr>
	<tr>
		<td><pre>리뷰 내용</pre></td>
	</tr>
	<tr>
		<td>
			<img src="resources/upload/icon1.png">
			<img src="resources/upload/icon1.png">
		</td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type="button" value='수정' onclick="location.href='${root }index?formpath=write'" style="width: 100px; "/>
			<button formaction="/index" style="width: 100px; ">삭제</button>
		</td>
	</tr>
	<tr><td colspan=5><hr/></td></tr>
	</c:forEach>
</table>
</form>
${page }
</center>