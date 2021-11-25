<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="<c:url value="/resources/css/collection/collection.css" />" rel="stylesheet" />
<c:url var="root" value="/" />
<script type="text/javascript">
	$(document).ready(function(){
		$('.calBtn').on('click',function(){
			var answer = confirm("정말 취소하겠습니까?");
			if(answer){
			var n = $(this).attr('data-id');
			alert(n);
			var info = {restNum:n}
			$.ajax({	
		 	   url : "delCollect", type: "POST",
		 	   data : JSON.stringify(info),
		 	   contentType: "application/json; charset=utf-8",
		 	   dataType: "json",
		 	   success : function(map) {
		 		   if(map.result == "success"){
		 			   location.reload();
		 			   }	
				},
		 	   error: function(e){
		 		   alert("error");
		 	   }
			});
			}
		});
	});
</script>
<body>
	<div align="center"><h2>관심 식당</h2></div>
	<div id="CollectionPage_Container">
	<c:forEach var="list" items="${collectionList }">
		<div class="container_Row">
			<table class="rest_summary">
				<tr>
					<td rowspan="3">
						<div class="representImg_wrap">
							<a href="restViewProc?restNum=${list.restNum }">
							<img src="resources/img/restaurant/${list.representImage }" style="height:100%; width:100%;">
							</a>
						</div>
					</td>
					<td>
						<a href="restViewProc?restNum=${list.restNum }">${list.restName }</a>
						<span><img src="resources/img/icon/star.png" width="20"> ${list.avgPoint }</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>${list.type } / ${list.dong }</span>
					</td>
				</tr>
				<tr><td></td></tr>
			</table>
			<div class="button_wrap">
				<button data-id="${list.restNum }" class="calBtn">취소</button>
			</div><hr>
		</div>
	</c:forEach>
	</div>
	<a href="myCollectProc">조회</a>
</body>