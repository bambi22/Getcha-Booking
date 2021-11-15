<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 정보 등록</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- 다음 주소 창 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 주소 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ca9e6dca916cb522a752c40d791a9b9&libraries=services"></script>
<!-- timepicker 플러그인 링크 -->
<script type="text/javascript" src="resources/js/restManagement/jquery.timepicker.min.js" ></script><!-- 타이머js -->
<link type="text/css" rel="stylesheet" href="resources/css/restManagement/jquery.timepicker.css" media=""/><!-- 타이머css -->
<!-- 이 페이지 자바스크립트 링크 -->
<script type="text/javascript" src="resources/js/restManagement/restRegister.js" ></script>
<style>
#previewImgs{
	width: 660px;
	min-height:150px;
	padding:10px;
	border:1px dotted #00f;
}
#previewImgs:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}
#previewImg{
	width: 160px;
	min-height:150px;
	padding:10px;
	border:1px dotted #00f;
	
}
#previewImg:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
} 

#previewDiv{
	display:inline-block;position:relative;
	width:150px;height:120px;margin:5px;z-index:1; 
}
</style>
</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	
	<h3>식당 정보 등록</h3>
	<form id="f" action="restRegisterProc" method="post" enctype="multipart/form-data">
		<input type="hidden" value="8" name="restNum">
		<table>
			<tr>
				<td> 식당 이름 </td>
				<td> 
					<input type="text" name="restName" id="restName"><br>
					<label id="warnRestName" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 한줄 소개 글 </td>
				<td> 
					<textarea cols="50" rows="4" name="restIntro" id="restIntro"></textarea><br>
					<label id="warnRestIntro" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 식당 주소 </td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly="readonly" style="width:60px;">
					<input type="button" value="우편번호 검색" onclick="daumPost();"><br>
					<input type="text" name="address" placeholder="주소" id="addr1" readonly="readonly" style="width:300px;" onchange="findCor()"><br>
					<input type="text" name="address" placeholder="상세주소" id="addr2" onchange="findCor()"><br>
					<label id="warnAddr" style="color:red;"></label>
					<input type="hidden" id="corX">
					<input type="hidden" id="corY">
					<input type="hidden" id="dong" name="dong">
				</td>
			</tr>		
			<tr>
				<td> 식당 종류 </td>
				<td>
					<select name="type" id="type"> 
						<option value="">선택</option>
						<option value="한식">한식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
						<option value="이탈리아음식">이탈리아음식</option>
						<option value="인도음식">인도음식</option>
						<option value="태국음식">태국음식</option>
						<option value="베트남음식">베트남음식</option>
						<option value="프랑스음식">프랑스음식</option>
						<option value="스페인음식">스페인음식</option>
						<option value="퓨전음식">퓨전음식</option>
						<option value="direct">직접입력</option>
					</select>
					<input type="text" id="typeDirect" name="type"><br>
					<label id="warnType" style="color:red;"></label>
					
				</td>
			</tr>
			<tr>
				<td> 영업 시간 </td>
				<td>
					<div id="openHour"></div>
					<select id="openingDay">
						<option value="매일">매일</option>
						<option value="주중">주중</option>
						<option value="주말">주말</option>
						<option value="월요일">월요일</option>
						<option value="화요일">화요일</option>
						<option value="수요일">수요일</option>
						<option value="목요일">목요일</option>
						<option value="금요일">금요일</option>
						<option value="토요일">토요일</option>
						<option value="일요일">일요일</option>					
					</select>
					<select id="openingSel">
						<option value="">선택 안함</option>				
						<option value="점심">점심</option>
						<option value="저녁">저녁</option>
						<option value="휴무">휴무</option>				
					</select>
					<div id="hours" style="display:inline;">
						<input type="text" id="start"  maxlength="10" style="width:40px" class="setDatePicker">
			            -
			            <input type="text" id="end"  maxlength="10" style="width:40px" class="setDatePicker">
					</div>
					<input type="button" onclick="addOpening()" value="추가"><br>
					<label id="warnOpenHour" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 수용 가능 인원 </td>
				<td>
					<!-- 숫자만 입력 가능 정규 표현식 사용 -->
					<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
						name="capacity" id="capacity" style="width:30px"/> 명<br>
					<label id="warnCapacity" style="color:red;"></label>
				</td>
			</tr>
			<tr>
				<td> 부대시설 </td>
				<td>
					<input type="checkbox" name="facilities" value="주차 가능">주차 가능
					<input type="checkbox" name="facilities" value="발렛 가능">발렛 가능
					<input type="checkbox" name="facilities" value="단체석">단체석
					<input type="checkbox" name="facilities" value="아기의자">아기의자
					<input type="checkbox" name="facilities" value="콜키지 가능">콜키지 가능
					<input type="checkbox" name="facilities" value="개별 룸">개별 룸
					<input type="checkbox" name="facilities" value="전문 소믈리에">전문 소믈리에
					<input type="checkbox" name="facilities" value="대관 가능">대관 가능
					<input type="checkbox" name="facilities" value="노키즈존">노키즈존
					<input type="checkbox" name="facilities" value="심야 영업">심야 영업
				</td>
			</tr>
			<tr>
				<td> 식당 사진 (최대 6장) </td>
				<td> 
					<div>
						<div id="previewImgs" >
							
						</div>
					</div>
					<input multiple="multiple" type="file" id="restImage" name="restImage" style="width: 300px">
				</td>
			</tr>
			<tr>
				<td> 프로모션 </td>
				<td> 
					<div>
						<div id="previewImg">
							<div id="previewDiv">
								<img id="previewPromotion" style="width:100%;height:100%;"/>
							</div>
						</div>
					</div>
					<input type="file" id="promotion" name="promotion" style="width: 300px" accept="image/*">
				</td>
			</tr>
		</table>
		<input type="button" value="다음 : 메뉴등록" onclick="submitBtn()">
	</form>
</body>
<script>

$(document).on('input','#promotion', function () {
	readURL(this);
}); 
function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e){
			$('#previewPromotion').attr('src',e.target.result);
		}
		 reader.readAsDataURL(input.files[0]);
	}
}


imageView = function imageView(previewImgs, restImage){

	var preview = document.getElementById(previewImgs);
	var restImage = document.getElementById(restImage);
	var sel_files = [];
	
	// 이미지와 체크 박스를 감싸고 있는 div 속성
	var div_style = 'display:inline-block;position:relative;'
	              + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
	// 미리보기 이미지 속성
	var img_style = 'width:100%;height:100%;z-index:none';
	// 이미지안에 표시되는 체크박스의 속성
	var chk_style = 'width:40px;height:25px;position:absolute;font-size:12px;'
	              + 'right:0px;top:0px;background:none;color:#f00;border:none;';
	
	restImage.onchange = function(e){
		if ($('#restImage')[0].files.length > 6) {
		    alert('6개를 초과하였습니다.')
			return;
		}	
	    var files = e.target.files;
	    var fileArr = Array.prototype.slice.call(files)
	    for(f of fileArr){
	      imageLoader(f);
	    }
	}
	
	// 탐색기에서 드래그앤 드롭 사용
    preview.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    preview.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    preview.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)	
    
    
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.setAttribute('name', 'choice')
        img.src = ee.target.result;
        preview.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
	
    
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', '삭제')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        preview.files = dt.files;
        var p = ele.parentNode;
        preview.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
}('previewImgs', 'restImage') 

</script>
</html>