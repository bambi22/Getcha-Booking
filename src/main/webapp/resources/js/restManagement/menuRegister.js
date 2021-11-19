
  
  	function addMenu(){
		var html = '';
					
		var category = $("#inCategory").val();
		var name = $("#inMenuName").val();
		var descript = $("#inMenuDescript").val();
		var price = $("#inUnitPrice").val();
		
		if(name==""){
			alert('메뉴명은 필수 입력 항목입니다.');
			return;
		}else if(price==""){
			alert('가격은 필수 입력 항목입니다.');
			return;
		}
		console.log("추가" + name);
		
		html = '<tr>'+
		 '<td><input type="text" name="category" style="width:80" value="'+category+'"></td>'+
		 '<td><input type="text" name="menuName" style="width:135px" value="'+name+'"></td>'+
		 '<td><input type="text" name="menuDescript" style="width:180px" value="'+descript+'"></td>'+
		 '<td><input type="text" name="unitPrice" style="width:90px" value="'+price+'"></td>'+
		 '<td></td>'+
		 '<td><button type="button" "name="delMenu" onclick="delMenu(this)">삭제</button></td>'+
		 '</tr>';
					
		$("#registerTable").append(html);

		$("#inCategory").val('');
		$("#inMenuName").val('');
		$("#inMenuDescript").val('');
		$("#inUnitPrice").val('');
		$("#inMenuImage").val('');

	}
	
    //삭제 버튼
    function delMenu(del){
		$(del).parent().parent().remove();
	}
    
    function previewName(file){
		var fileName = file.getAttribute('id');
		for(f of file.files){
			let reader = new FileReader();
			document.getElementById(fileName+'name').innerHTML = f.name;
		}
	}
	
function submitMenu() {
    $('form[name="f"]').attr('method', 'POST');
    $('form[name="f"]').attr('enctype', 'multipart/form-data');
    $('form[name="f"]').attr('action', 'menuRegisterProc');
    $('form[name="f"]').submit();
}
