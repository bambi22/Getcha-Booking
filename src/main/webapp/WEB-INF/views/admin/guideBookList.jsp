<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>가이드북 선정 리스트</title>
<style>
* {box-sizing: border-box}

/* Set a style for all buttons */
button {
  background-color: #343642;
  color: white;
  padding: 5px;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.8;
  height: 40px;
  margin-top:50px;
}

button:hover {
  opacity:1;
}

/* Float cancel and add buttons and add an equal width */
.cancelbtn, .addbtn {
  float: left;
  width: 50%;
}

/* Add a color to the cancel button */
.cancelbtn {
  background-color: #ccc;
  color: black;
}

/* Add a color to the add button */
.addbtn {
  background-color: #343642;
}

/* Add padding and center-align text to the container */
.container {
  padding: 16px;
  text-align: center;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 30%;
  top: 20%;
  width: 50%; /* Full width */
  height: 50%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #BCBCBC;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
  height:80%
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and add button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .addbtn {
    width: 100%;
  }
}
</style>
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
					$('#restNum').val(result.resultNum);
					$('#resultInfo').text(result.resultType+"·"+result.resultDong);
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
	
<c:if test="${!empty msg }">
	<script>alert("${msg}");</script>
</c:if>
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
		<input type="text" id="keyword" placeholder="추가할 식당 번호 혹은 식당명 입력" style="height:40px; width:300px">
		<button type="button" onclick="addGuide()">추가</button>
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