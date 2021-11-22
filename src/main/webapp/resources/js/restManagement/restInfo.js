
/* 메뉴 수정 시 행 추가 */
/*
var i=1;
function addRow(){
	// table element 찾기
  const table = document.getElementById('modifyTable');
  
  // 새 행(Row) 추가
  const newRow = table.insertRow();
  
  // 새 행(Row)에 Cell 추가
  const newCell1 = newRow.insertCell(0);
  const newCell2 = newRow.insertCell(1);
  const newCell3 = newRow.insertCell(2);
  const newCell4 = newRow.insertCell(3);
  const newCell5 = newRow.insertCell(4);
  const newCell6 = newRow.insertCell(5);
  
  // Cell에 텍스트 추가
  newCell1.innerHTML = '<input type="text" id="category'+i+'" name="category" style="width:80" placeholder="분류">';
  newCell2.innerHTML = '<input type="text" id="menuName'+i+'" name="menuName" style="width:135px" placeholder="메뉴명">';
  newCell3.innerHTML = '<input type="text" id="menuDescript'+i+'" name="menuDescript"  placeholder="메뉴 소개" style="width:190px">';
  newCell4.innerHTML = '<input type="number" id="unitPrice'+i+'" name="unitPrice" placeholder="가격" style="width:100px">';
  newCell5.innerHTML = '<input type="file" id="menuImage'+i+'" name="menuImage" style="display:none;" onchange="previewImg(this)">'+
  						'<label for="menuImage'+i+'"><img name="menuImage'+i+'" src="resources/img/icon/upload.png" width="20"></label>';
  newCell6.innerHTML = "<button type='button' name='delMenu' onclick='deleteRow(this)'>삭제</button>";

  i++;
}
*/

/* 메뉴 수정 시 행 삭제 */
function deleteRow(del){
	$(del).parent().parent().remove();
}


/* 수정하기 눌렀을 때 수정 정보 보여주기 + 숨기기 */
function showModify(data){
	if(data=="modifyForm"){
		var form = document.getElementById("modifyForm");		
	}else if(data=="detailsForm"){
		var form = document.getElementById("detailsForm");
	}else if(data=="promotionForm"){
		var form = document.getElementById("promotionForm");
	}else if(data=="menuModifyForm"){
		var form = document.getElementById("menuForm");
	}
	if(form.style.display=='none'){
		form.style.display = 'block';
	}else{
		form.style.display = 'none';
	}
}


/* 식당 상세 정보 수정 submit */
function modifyDetailInfo(){
	if($('#addr1').val() != ""){
		if($('#addr2').val() == ""){
			alert('상세주소는 필수 입력 항목입니다.');
			return;
		}
	}
	var corX = document.getElementById("corX").value;
    var corY = document.getElementById("corY").value;
	var geocoder = new kakao.maps.services.Geocoder();
 	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var strResult = result[0].address_name;
	    	var strArray = strResult.split(' ');
	    	document.getElementById("dong").value = strArray[2];
			document.getElementById('modifyDetail').submit();
	    }
	};
	if(corX=="" || corY==""){
		document.getElementById('modifyDetail').submit();
	}else{
		geocoder.coord2RegionCode(corX, corY, callback);		
	}
	
}

function modifyPromotion(){
	$('#modifyPromotionForm').attr('action', 'modifyPromotionProc');
	$('#modifyPromotionForm').submit();	
}

function deletePromotion(){
	$('#modifyPromotionForm').attr('action', 'deletePromotionProc');
	$('#modifyPromotionForm').submit();	
}
	
	
/* 메뉴 수정  */
function modifyMenu(){
	var menuNameArr = document.getElementsByName('menuName');
	var unitPriceArr = document.getElementsByName('unitPrice');
	for(var i=0 ; i<menuNameArr.length; i++){
		if(menuNameArr[i].value ==""){
			alert('메뉴명은 필수 입력 항목입니다.');
			return;
		}else if(unitPriceArr[i].value == ""){
			alert('가격은 필수 입력 항목입니다.');
			return;
		}
	}
	document.getElementById('menuModifyForm').submit();
}