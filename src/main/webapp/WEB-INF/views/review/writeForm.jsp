<%@ page contentType="text/html; charset=UTF-8"%>
<head>
<title>리뷰 쓰기</title>
<script>

</script>
</head>
<body>
<form action="writeProc" method="post" enctype="multipart/form-data">
	<section class="ReviewWritingPage__Container">
	    <div class="ReviewWritingPage__Row">
	      <strong class="RestaurantSubMessage__RestaurantName">식당 이름1</strong>
	    </div>
		<textarea name="content" id="content" rows=10 style="width:100%;" placeholder="음식은 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
		<p class="ReviewEditor__TextLengthStateBox" align="right">
              <span class="ReviewEditor__CurrentTextLength">0</span>
              <span class="ReviewEditor__TextLengthStateDivider">/</span>
              <span class="ReviewEditor__MaxTextLength">5000</span>
         </p>
         <div class="form-group">
         	<input type="file" name="fileName" />
         	<input type="file" name="fileName" />
         </div>
		<div class=></div>
			<input type=submit value='리뷰 작성' class="btn btn-defualt"/>
			<button type="submit" class="btn btn-defualt">리뷰 작성</button>
			<button type="reset" class="btn btn-defualt">새로입력</button>
	</section>
</form>
</body>