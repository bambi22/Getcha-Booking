var i = 1;
function addModifyRow(){
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
  newCell1.innerHTML = '<input type="text" name="category" style="width:80" placeholder="분류">';
  newCell2.innerHTML = '<input type="text" name="menuName" style="width:135px" placeholder="메뉴명">';
  newCell3.innerHTML = '<input type="text" id="inMenuDescript"  placeholder="메뉴 소개" style="width:190px">';
  newCell4.innerHTML = '<input type="number" id="inUnitPrice" placeholder="가격" style="width:100px">';
  newCell5.innerHTML = '<input type="file" id="inMenuImage" name="menuImage" style="display:none;" onchange="previewName(this)"><label for="inMenuImage"><i class="fas fa-upload">Photo</i></label><span id="menuImagename"></span>';
  newCell6.innerHTML = "<button type='button' name='delMenu' onclick='deleteRow(this)'>삭제</button>";

	i++;
}

function previewName(file){
	var fileName = file.getAttribute('id');
	for(f of file.files){
		let reader = new FileReader();
		document.getElementById(fileName+'name').innerHTML = f.name;
	}
}


	
	
	
	