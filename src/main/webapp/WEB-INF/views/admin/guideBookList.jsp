<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드북 선정 리스트</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function addGuide(){
		var i = document.getElementById('keyword').value;
		if(i == ""){
			alert('추가할 식당 정보를 입력하세요.');
			return;
		}
		var info = {keyword:i};
		$.ajax({
			url: "findRestaurant", type: "POST",
			data: JSON.stringify(info),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			
			success: function(result){
				if(result.resultNum == "none"){
					$('#resultName').text("찾는 결과가 없습니다.");
					document.getElementById('resultModal').style.display='block';					
				}else{
					$('#resultNum').text(result.resultNum);
					$('#resultName').text(result.resultName);
					$("#resultAddr").text(result.resultAddr);
					document.getElementById('resultModal').style.display='block';
				}
			},
			error: function(){
				$('#resultName').text('error');
			}
		})	 
	}
	
</script>

</head>
<body style="display:flex;">
	<script>
		//내비에 선택된 탭 색깔 변경
		document.getElementById('guideTab').className = 'nav-link active';
	</script>
	
	<c:forEach var="i" begin="0" end="${max-min}" step="1" >
	<h5>${max-i } 가이드북 선정 레스토랑</h5>
		<table>
			<tr>
				<th>식당 번호</th><th>식당 이름</th><th>지역</th><th>평점</th>
			</tr>
			<c:forEach var="guide" items="${ guideList}">
				<c:if test="${guide.guideBook == (max-i) }">
					<tr>
						<td>${guide.restNum }</td><td>${guide.restName }</td>
						<td>${guide.dong }</td><td>${guide.avgPoint }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<p/>
		<p/>
	</c:forEach>
	
	<form>
		<input type="text" id="keyword" placeholder="추가할 식당 번호 혹은 식당명 입력">
		<button type="button" onclick="addGuide()">추가</button>
	</form>
	<div id="resultModal" class="modal">
	  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	  <form class="modal-content" action="addGuideBookProc">
	    <div class="container">
	      <h1 id="resultNum"></h1>
	      <p id="resultName"></p>
			<span id="resultAddr"></span>
	      <div class="clearfix">
	        <button type="button" class="cancelbtn">취소</button>
	        <button type="button" class="addbtn" >추가하기</button>
	      </div>
	    </div>
	  </form>
	</div>
	
	


</body>
</html>