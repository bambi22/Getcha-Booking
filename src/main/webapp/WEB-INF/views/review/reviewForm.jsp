<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/review.css" />" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/" />
<c:if test="${not empty msg}">
	<script>alert('${msg}')</script>
</c:if>
<script>
	$(document).ready(function(){
		$('.delBtn').on('click',function(){
			var answer = confirm("정말 삭제하겠습니까?");
			if(answer){
			var n = $(this).attr('id');
			var f = $(this).attr('data-fileName');
			alert(f);
			$.ajax({	
		 	   url : "deleteProc", type: "POST",
		 	   data : "reviewNum="+n + "&fileNames="+f,
		 	   //{'reviewNum' : n}
		 	   contentType: "application/x-www-form-urlencoded; charset=utf-8",
		 	   success : function(data) {
				if(data.result == "success"){
					location.reload();
					}else{
						alert("삭제 실패했습니다. 관리자에게 문의바랍니다.");
						}
				},
		 	   error: function(e){
		 		   alert("error: " + e);
		 	   }
			});
			}
		});
	});
</script>
<body>
<section>
	<div align="center"><h2>나의 리뷰</h2></div>

	<div id="ReviewPage_Container">
	<c:forEach var="list" items="${reviewList }">
	<form action="" method="post">
	<input type="hidden" name="reviewNum" value="${list.reviewNum }" />
	<input type="hidden" name="restName" value="${list.restName }" />
	<input type="hidden" name="content" value="${list.content }" />
	<input type="hidden" id="fileNames" name="fileNames" value="${list.fileNames }" />
		<div class="Review_Row">
		<div class="title"><a href="#">${list.restName }</a></div>
		<div><pre>${list.content }</pre></div>
		<c:if test="${list.fileNames != '파일없음' }">
			<div class="image_wrap">
				<c:forTokens var="fileName" items="${list.fileNames }" delims=",">
				<div class="review_image">
					<img src="${root }upload/${fileName }" style="height:100%; width:100%; ">
				</div>
				</c:forTokens>
			</div>
		</c:if>
		<div>
			<p class="date">${list.writeDate }</p>
		</div>
		<div class="button_wrap">
			<button formaction="${root }update" style="width: 100px">수정</button>
			<input type="button" id="${list.reviewNum }" data-fileName="${list.fileNames }" class="delBtn" value="삭제" style="width: 100px; "/>
		</div><hr>
	</div>
	</form>
	</c:forEach>
	</div>
		<a href="reviewProc">조회</a>
</section>
</body>