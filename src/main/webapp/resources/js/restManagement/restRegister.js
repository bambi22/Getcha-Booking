
//주소 가져오기
function daumPost(){
	new daum.Postcode({
		oncomplete:function(data){
			var addr = "";
			if(data.userSelectedType === "R"){//도로명 주소일 경우( R )
				addr = data.roadAddress;
			}else{//지번일 경우( J )
				addr = data.jibunAddress;
			}
			document.getElementById("zipcode").value = data.zonecode;
			document.getElementById("addr1").value = addr;
			document.getElementById("addr2").focus();
		
		}
	}).open();
	
}

// 카카오 제공 : 주소로 좌표 가져와서 hidden값에 넣어놓기-> 행정동 가져오기 위함
function findCor(){
	var addr = document.getElementById("addr1").value;
	var geocoder = new kakao.maps.services.Geocoder();
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        console.log(result);
	        document.getElementById("corX").value= result[0].x;
	        document.getElementById("corY").value= result[0].y;
	    }
	};
	geocoder.addressSearch(addr, callback); 
} 


$(function(){
	$('#typeDirect').hide();
	$('#type').change(function(){
		if($('#type').val() == "direct"){
			$('#typeDirect').show();
		}else{
			$('#typeDirect').hide();
		}
	})
});

$(function(){
	$('#openingSel').change(function(){
		if($('#openingSel').val() == "휴무"){
			$('#hours').hide();
			$('#start').val("");
			$('#end').val(""); 
		}else{
			$('#hours').show();
		}
	})
});

// 오프닝 시간 start-end 설정
$(document).ready(function() {
    // INPUT 박스에 들어간 ID값을 적어준다.
    $("#start,#end").timepicker({
        'minTime': '08:00am', // 조회하고자 할 시작 시간 ( 09시 부터 선택 가능하다. )
        'maxTime': '24:00pm', // 조회하고자 할 종료 시간 ( 20시 까지 선택 가능하다. )
        'timeFormat': 'H:i',
        'step': 30 // 30분 단위로 지정. ( 10을 넣으면 10분 단위 )
	});
	$(window).scroll(function(){
	    $(".ui-timepicker-wrapper").hide();
	});

});


function addOpening(){
 	var day = document.getElementById("openingDay").value;
	var st = document.getElementById("start").value;
	var en = document.getElementById("end").value; 
	var sel = document.getElementById("openingSel").value; 
	var op = document.getElementById("openHour").innerHTML;
	var openStr;
	if(sel == "휴무"){
		openStr = "<div><input type='text' name='openHour' style='border:none;' value='"+ day + " " + sel + "'> <button name='delMenu'>삭제</button></div>"; 
	}else{
		if(st=="" || end==""){
			return;
		}else{
			openStr = "<div><input type='text' name='openHour' style='border:none;' value='"+day+" "+sel+" "+st+"-"+en+"'><button name='delMenu'>삭제</button></div>"; 		
		}
	}
	if(op ==""){
		document.getElementById("openHour").innerHTML = openStr;	
	}else{
		document.getElementById("openHour").innerHTML = op+openStr;
	}

}
$(document).on("click","button[name=delMenu]",function(){
    var trHtml = $(this).parent();
    trHtml.remove(); //tr 테그 삭제
    
});

function submitBtn(){
	$('#warnRestName').html("");
	$('#warnRestIntro').html("");
	$('#warnAddr').html("");
	$('#warnType').html("");
	$('#warnOpenHour').html("");
	$('#warnCapacity').html("");
	
	
	if($('#restName').val() ==""){
		$('#restName').focus();
		$('#warnRestName').html("식당 이름을 입력하세요.");		
		return;
	}else if($('#restIntro').val() ==""){
		$('#restIntro').focus();
		$('#warnRestIntro').html("한줄 소개 글을 입력하세요.");		
		return;
	}else if($('#addr1').val() =="" || $('#addr2').val() ==""){
		$('#addr2').focus();
		$('#warnAddr').html("주소를 입력하세요.");		
		return;
	}else if($('#type').val() =="" || $('#type').val() =="direct" && $('#typeDirect').val()==""){
		$('#warnType').html("식당 종류를 선택하세요.");		
		return;
	}else if($('#openHour').text()==""){
		$('#warnOpenHour').html("영업 시간을 선택하세요.");		
		return;
	}else if($('#capacity').val()==""){
		$('#warnCapacity').html("수용가능 인원 입력하세요.");		
		return;
	}
	
	var corX = document.getElementById("corX").value;
    var corY = document.getElementById("corY").value;
	var geocoder = new kakao.maps.services.Geocoder();
 	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var strResult = result[0].address_name;
	    	var strArray = strResult.split(' ');
	    	document.getElementById("dong").value = strArray[2];
			console.log(strArray[2]);
			document.getElementById("f").submit(); 
	    }
	};
	if(corX=="" || corY==""){
		document.getElementById("f").submit(); 
	}else{
		geocoder.coord2RegionCode(corX, corY, callback);		
	}
	
}