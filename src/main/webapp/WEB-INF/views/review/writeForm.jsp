<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<head>
<title>리뷰 작성하기</title>
<link href="<c:url value="/resources/css/review/write.css" />" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#img_file").change(function(){
			readURL(this);
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#ph').attr('src', e.target.result);
					$('#ph').css('visibility', 'visible');
					$('#ph').parent().parent().addClass('on');
				}                    
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#img_file2").change(function(){
			readURL2(this);
		});
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#ph2').attr('src', e.target.result);
					$('#ph2').css('visibility', 'visible');
					$('#ph2').parent().parent().addClass('on');
				}                    
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#img_file3").change(function(){
			readURL3(this);
		});
		function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#ph3').attr('src', e.target.result);
					$('#ph3').css('visibility', 'visible');
					$('#ph3').parent().parent().addClass('on');
				}                    
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#img_file4").change(function(){
			readURL4(this);
		});
		function readURL4(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#ph4').attr('src', e.target.result);
					$('#ph4').css('visibility', 'visible');
					$('#ph4').parent().parent().addClass('on');
				}                    
				reader.readAsDataURL(input.files[0]);
			}
		}
	});

	$(function(){
		$('#content').keyup(function(){
		bytesHandler(this);
		});
	});
	
	function getTextLength(str) {
	var len = 0;
	
	for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
			len++;
			}
		len++;
		}
	return len;
	}
	
	function bytesHandler(obj){
	var text = $(obj).val();
	$('p.bytes').text(getTextLength(text) + "/ 500");
	if (getTextLength(text) > 500) {
		alert("최대 500bytes까지 입력 가능합니다.");
		//$(obj).val(text.substring(0, 50));
		}
	}
	
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	let rating = new Rating();//별점 인스턴스 생성
	
	document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	        }
	        $("#point").val(parseInt(elem.value));
	    })
	});
</script>
</head>
<body>
<section>
<form action="writeProc" method="post" enctype="multipart/form-data">
	<div id="ReviewWritingPage_Container">
	    <div class="ReviewWritingPage_Row">
	    <input type="hidden" name="restNum" value="21" />
	      <strong class="RestaurantName">식당 이름21</strong>
	    </div>
		<textarea name="content" id="content" rows="10" style="width:100%;" placeholder="음식은 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
		<p class="bytes" align="right">0 / 500</p>
		
		<div class="rate_wrap">
			<input type="hidden" name="point" id="point" />
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
		<div class="img_regi">
		    <div class="ph"><img id="ph" src="#" alt="" /></div>
		    <input type="file" accept="image/*" id="img_file" name="uploadFile1" />
		    <a href="#self">+ 사진 등록</a>
		</div>
		<div class="img_regi">
		    <div class="ph"><img id="ph2" src="#" alt="" /></div>
		    <input type="file" accept="image/*" id="img_file2" name="uploadFile2" />
		    <a href="#self">+ 사진 등록</a>
		</div>
		<div class="img_regi">
		    <div class="ph"><img id="ph3" src="#" alt="" /></div>
		    <input type="file" accept="image/*" id="img_file3" name="uploadFile3" />
		    <a href="#self">+ 사진 등록</a>
		</div>
		<div class="img_regi">
		    <div class="ph"><img id="ph4" src="#" alt="" /></div>
		    <input type="file" accept="image/*" id="img_file4" name="uploadFile4" />
		    <a href="#self">+ 사진 등록</a>
		</div>
		</div>
		<div class="button_wrap">
			<button type="submit" class="">리뷰 작성</button>
			<button type="reset" class="btn btn-defualt">새로입력</button>
		</div>
	</div>
</form>
</section>
</body>
</html>