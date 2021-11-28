<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드북 선정 리스트</title>
<link rel="stylesheet" href="resources/css/admin/guideBook.css" >

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
				if(result.resultList == null){
					$('#resultName').text("찾는 결과가 없습니다.");
					document.getElementById('resultModal').style.display='block';					
				}else{
					var count = result.count;
					for(var i=0; i<count; i++){
				//		$('#restNum').val(result.(restNum+i));
						
					}
		/* 			$('#resultInfo').text(result.resultType+"·"+result.resultDong);
					$('#resultName').text(result.resultName);
					$("#resultAddr").text(result.resultAddr); */
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
<body>
	<script>
		//내비에 선택된 탭 색깔 변경
		document.getElementById('guideTab').className = 'nav-link active';
	</script>
	
<c:if test="${!empty msg }">
	<script>alert("${msg}");</script>
</c:if>
<div style="padding-left:100px">
	<c:forEach var="i" begin="0" end="${max-min}" step="1" >
	<h5>${max-i } 가이드북 선정 레스토랑</h5>
		<table class="bluetop">
			<tr>
				<th>식당 번호</th><th>식당 이름</th><th>지역</th><th>평점</th>
			</tr>
			<c:forEach var="guide" items="${ guideList}">
				<c:if test="${guide.guideBook == (max-i) }">
					<tr>
						<td style="text-align:center;">${guide.restNum }</td>
						<td style="width:300px;text-align:center;">${guide.restName }</td>
						<td style="width:100px;text-align:center;">${guide.dong }</td>
						<td style="width:80px;text-align:center;">${guide.avgPoint }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<p/>
		<p/>
	</c:forEach>
</div>

<div style="padding-left:100px;">	
	<form>
		<input type="text" id="keyword" placeholder="추가할 식당 번호 혹은 식당명 입력" style="height:40px; width:300px">
		<button type="button" onclick="addGuide()">찾기</button>
	</form>
	<div id="resultModal" class="modal">
	  <span onclick="document.getElementById('resultModal').style.display='none'" class="close" title="Close Modal">&times;</span>
	  <form class="modal-content" action="addGuideBookProc">
	  	<input type="hidden" id="restNum" name="restNum">
	    <div class="container">
	      <h2 id="resultName"></h2>
			<span id="resultInfo"></span><br>
			<span id="resultAddr"></span><br>
	      <div class="clearfix">
	        <button type="button" class="cancelbtn" onclick="document.getElementById('resultModal').style.display='none'" >취소</button>
	        <button type="submit" class="addbtn">추가하기</button>
	      </div>
	    </div>
	  </form>
	</div>
</div>	
<script>
//Get the modal
var modal = document.getElementById('resultModal');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>


</body>
</html>