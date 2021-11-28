<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="root" value="/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<c:if test="${empty sessionScope.email }">
	 <script>location.href='index?formpath=login';</script>
</c:if>
<head>
<title>Getcha Table</title>
<link href="<c:url value="/resources/css/review/write.css" />" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="resources/js/myPage/reviewUpdate.js"></script>
</head>
<body>
<form id="f" method="post" enctype="multipart/form-data">
	<div id="ReviewWritingPage_Container">
	    <div class="ReviewWritingPage_Row">
	    <input type="hidden" name="reviewNum" value="${reviewNum }" />
	    <input type="hidden" name="restNum" value="${restNum }" />
	    <input type="hidden" name="restName" value="${restName }" />
	    <input type="hidden" name="fileNames" value="${fileNames }" />
	      <strong class="RestaurantName">${restName }</strong>
	    </div>
		<textarea name="content" id="content" rows="10" style="width:100%;">${content }</textarea>
		<p class="bytes" align="right">0 / 500</p>
		
		<div class="rate_wrap">
			<input type="hidden" name="point" id="point" value="0"/>
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점" />
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점" />
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" />
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점" />
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점" />
                <label for="rating5"></label>
            </div>
       	 </div>
		<div class="upload_wrap">
		<c:choose>
			<c:when test="${fileNames == '파일없음'}">
			<!-- 이미지 등록 안한 경우 -->
				<c:forEach var="count" begin="1" end="4" step="1">
					<div class="img_regi">
				   	 	<div class="ph"><img id="ph${count }" src="#" alt="" /></div>
				   		<input type="file" accept="image/*" id="img_file${count }" name="uploadFile${count }" />
			      		<a href="#self">+ 사진 등록</a>
					</div>
				</c:forEach>
			</c:when>	
			
			<c:otherwise>
				<c:forTokens var="fileName" items="${fileNames }" delims="," varStatus="st">
				<c:if test="${st.last}">
		      		<c:if test="${st.count ne 4}">
		      			<c:forEach var="count" begin="${st.count+1 }" end="4" step="1">
		      			<div class="img_regi">
					   	 	<div class="ph"><img id="ph${count }" src="#" alt="" /></div>
					   		<input type="file" accept="image/*" id="img_file${count }" name="uploadFile${count }" />
				      		<a href="#self">+ 사진 등록</a>
						</div>
						</c:forEach>
		      		</c:if>
		      	</c:if>
		      	</c:forTokens>
			</c:otherwise>
		</c:choose>
		</div>
       	
       	<c:if test="${fileNames != '파일없음' }">
			<label class="subtitle">등록한 리뷰 사진</label>
			<label class="caution">(*사진 삭제 시, 수정 완료하지 않아도 삭제 됩니다)</label>
			<div class="upload_wrap">
		       	<c:forTokens var="fileName" items="${fileNames }" delims="," varStatus="st">
			       	<div>
				       	<div class="pre_img"><img id="ph${st.count }" src="${root }upload/${fileName }" /></div><br/>
			      		<button type="button" id="${reviewNum }" data-fileName="${fileName }" class="delBtn" style="width: 60px; ">삭제</button>
			      	</div>
		       	</c:forTokens>
	 		</div>
       	</c:if>
	 	<div class="button_wrap">
			<button onclick="submitCheck()" style="width: 60px;">수정</button>
			<input type="button" style="width: 60px;" value='취소' onclick="location.href='${root}reviewProc'"/>
		</div>
		</div>
	</form>
</body>
</html>