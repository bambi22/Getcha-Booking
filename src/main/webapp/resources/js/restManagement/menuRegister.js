
  	function addMenu(){
		var tc = new Array();
		var html = '';
					
		var category = $("#inCategory").val();
		var name = $("#inMenuName").val();
		var descript = $("#inMenuDescript").val();
		var price = $("#inUnitPrice").val();
		
		console.log("카테고리 : "+category);	
			
		html += '<tr>';
		html += '<td name="category">'+category+'</td>';
		html += '<td name="menuName">'+name+'</td>';
		html += '<td name="menuDescript">'+descript+'</td>';
		html += '<td name="unitPrice">'+price+'</td>';
		html += '<td></td>';
		html += '<td><button type="button" "name="delMenu" onclick="delMenu(this)">삭제</button></td>';
		html += '</tr>';
					
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
		var name = file.getAttribute('id');
		for(f of file.files){
			let reader = new FileReader();
			document.getElementById(name+'name').innerHTML = f.name;
		}
	}
	

    
function submitMenu(){
	
	$('input[name="menuName"]').each(function(idx, item) {
		if($(item).val()==""){
			alert('메뉴명은 필수 입력항목입니다.');
			return;
		}else{
			$('input[name="unitPrice"]').each(function(idx, item) {
				if($(item).val()==""){
					alert('가격은 필수 입력항목입니다.');
					return;
				}else{
					$('#f').submit();								
				}
			});	
		}
	});					
}