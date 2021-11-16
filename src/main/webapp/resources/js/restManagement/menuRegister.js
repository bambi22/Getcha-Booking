
    //추가 버튼
    var i=2;
    function addMenu(){
        var addMenuText ='<tr id="trMenu">'+
            '    <td style="width:60px"><strong>메뉴'+i+'</strong></td>'+
            '     <td style="width:800px">'+
            '        <input type="text" name="category" placeholder="분류" style="width:100px">'+
            '        <input type="text" name="menuName" placeholder="메뉴명" style="width:100px">'+
            '        <input type="text" name="menuDescript" placeholder="메뉴 소개">'+
            '        <input type="text" name="unitPrice" placeholder="가격" style="width:100px">'+
            '		 <input type="file" id="menuImage'+i+'" name="menuImage" style="display:none;" onchange="previewName(this)"> '+
            '		 <label for="menuImage'+i+'"><i class="fas fa-upload">Photo</i></label>' +
            '		 <span id="menuImage'+i+'name"></span>'+	
            '        <button type="button" "name="delMenu" onclick="delMenu(this)">삭제</button>'+
            '    </td>'+
            '</tr>';
        $( "#trMenu:last" ).after(addMenuText);
        
        //$("#registerTable").append(addMenuText);
        i++;
	
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
	
    
    function delFirst(){
        $("#category").val("");
        $("#menuName").val("");
        $("#menuDescript").val("");
        $("#unitPrice").val("");
        $("#menuImage1").val("");
        $("#menuImage1name").html("");    
    }
    
    
// 메뉴 확인 리스트
function showList(){
	var form = document.getElementById("showList");
	if(form.style.display=='none'){
		//값들의 갯수 -> 배열 길이를 지정
		var count = $("input[name=menuName]").length;
		//배열 생성
		var nameList = new Array(count);
		var descriptList = new Array(count);
		var categoryList = new Array(count);
		var priceList = new Array(count);
		var imageList = new Array(count);
		
		
		//배열에 값 주입
		for(var i=0; i<count; i++){                          
			nameList[i] = $("input[name=menuName]").eq(i).val();
			descriptList[i] = $("input[name=menuDescript]").eq(i).val();
			categoryList[i] = $("input[name=category]").eq(i).val();
			priceList[i] = $("input[name=unitPrice]").eq(i).val();
			
			imageList[i] = $("input[name=menuImage]").eq(i).val();
	    }
		
		var menuText="";
		for(var i=0; i<count; i++){     
			var addMenuText ='<tr name="menu">'+
           '<td style="width:200px"><strong>'+nameList[i]+'</strong><br>'+descriptList[i]+'</td>' +
           '<td style="width:150px">'+priceList[i]+'</td>'+
           '<td id="previewImg"'+i+'>'+imageList[i]+'</td>'+
           '</tr>';  
            menuText = menuText + addMenuText;				                   
	    }
       	$( "#menuList" ).html(menuText);
		form.style.display = 'block';
		

		    		
	}else{    		
		$("tr[name=menu]").remove();
		form.style.display = 'none';
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