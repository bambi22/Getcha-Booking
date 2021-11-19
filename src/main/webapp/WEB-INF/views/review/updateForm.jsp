<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="root" value="/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<head>
<title>리뷰 작성하기</title>
<link href="<c:url value="/resources/css/write.css" />" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".img_file").change(function(){
			readURL(this);
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					var img = document.createElement('img');
					img.src = e.target.result;
					$(input).closest('div').appendChild(img);
					$(input).closest('div').css('visibility', 'visible');
					$(input).parent().parent().addClass('on');
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
	$('p.bytes').text(getTextLength(text) + "/ 1000");
	if (getTextLength(text) > 1000) {
		alert("최대 1000bytes까지 입력 가능합니다.");
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
	
	
	
	function preview(target) {
		var files = target.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
			var img = document.createElement('img');
			img.src = e.target.result;
			$(target).prev('div').append(img);
		}
		reader.readAsDataURL(files);
				}
	
	
	function setThumbnail(event) {
		var reader = new FileReader();
		var name = target.attr('name');
		reader.onload = function(event){
			$(name).attr("src", event.target.result);
		}
		
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
<section>
<form action="writeProc" method="post" enctype="multipart/form-data">
	<div id="ReviewWritingPage_Container">
	    <div class="ReviewWritingPage_Row">
	      <strong class="RestaurantName">${restName }</strong>
	    </div>
		<textarea name="content" id="content" rows="10" style="width:100%;">${content }</textarea>
		<p class="bytes" align="right">0 / 1000</p>
		
	
      	<div class="upload_wrap">
      	<c:choose>
	       	<c:when test="${fileNames != '파일없음' }">
		       	<c:forTokens var="fileName" items="${fileNames }" delims=",">
			       	<div class="pre_img"><img src="${root }upload/${fileName }" /></div><br/>
					<input type="file" accept="image/*" class="img_file" name="uploadFile1" onchange="preview(this);" />
		       	</c:forTokens>
	       	</c:when>
			
			
			<c:otherwise>
			<div class="pre_div">
			<div class="pre_img"></div>
			<input type="file" name="image1" onchange="preview(this);" />
			</div>
			<div class="pre_div">
			<div class="pre_img"></div>
				<input type="file" name="image2" onchange="preview(this);" />
			</div>
			</c:otherwise>	
		</c:choose>
		</div>
	</div>

	



		</div>
		<div class="button_wrap">
			<button type="submit" style="width: 60px;">수정</button>
			<input type="button" style="width: 60px;" value='취소' onclick="location.href='${root}reviewProc'"/>
		</div>
		
	</div>
</form>
</section>
</body>
</html>