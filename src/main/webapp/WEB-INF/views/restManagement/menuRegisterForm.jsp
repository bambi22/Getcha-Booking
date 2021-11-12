<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 정보 등록</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
    //추가 버튼
    var i=2;
    $(document).on("click","button[name=addMenu]",function(){
        var addMenuText ='<tr name="trMenu">'+
            '    <td style="width:60px"><strong>메뉴'+i+'</strong></td>'+
            '     <td style="width:800px">'+
            '        <input type="text" name="menuName" placeholder="메뉴명">'+
            '        <input type="text" name="menuDescript" placeholder="메뉴 소개">'+
            '        <input type="text" name="category" placeholder="분류">'+
            '        <input type="text" name="unitPrice" placeholder="가격">'+
            '		 <input type="file" name="menuImage"> '+	
            '        <button name="delMenu">삭제</button>'+
            '    </td>'+
            '</tr>';
            
        var trHtml = $( "tr[name=trMenu]:last" ); //last를 사용하여 trMenu라는 명을 가진 마지막 태그 호출
        
        trHtml.after(addMenuText); //마지막 trMenu명 뒤에 붙인다.
        i++;
    });
    
    //삭제 버튼
    $(document).on("click","button[name=delMenu]",function(){
        var trHtml = $(this).parent().parent();
        trHtml.remove(); //tr 테그 삭제
        
    });
    
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
    			var addMenuText ='<div id="menu">'+
                '   <h4>'+nameList[i]+'</h4>'+
                '	<span>'+descriptList[i]+'<span><br>'+
                '	<span>'+categoryList[i]+'<span><br>'+
                '	<span>'+priceList[i]+'<span>'+
                '	<h6>'+imageList[i]+'</h6>'+
                '</div>';
                menuText = menuText + addMenuText;
    	    }
           	$( "#menuList" ).html(menuText);
    		form.style.display = 'block';
    	}else{    		
    		$("#menu").remove();
    		form.style.display = 'none';
    	}    	
    }
</script>
</head>
<body>
	<c:import url="restTop.jsp"/>
	<hr>
	<br>
	<h3>메뉴 등록</h3>
	<form action="#">
		<table border="1" style="width:1000px; ">
			<tr name="trMenu">
				<td style="width:60px"><strong>메뉴1</strong></td>
	            <td style="width:800px">
	                <input type="text" name="menuName" placeholder="메뉴명">
	                <input type="text" name="menuDescript" placeholder="메뉴 소개">
	                <input type="text" name="category" placeholder="분류">
	                <input type="text" name="unitPrice" placeholder="가격">
	                <input type="file" name="menuImage"> 
	            </td>
			</tr>
		</table>
		<br>
		<button type="button" name="addMenu">메뉴 추가</button>
		<button onclick="showList()">메뉴 확인</button>
		<button name="registerMenu" >메뉴 등록</button>
	</form>
	<br><br>
	<hr><br>
	<div id="showList" style="display:none">
		<h3>메뉴 목록</h3>
		<div id="menuList"></div>
	</div>
</body>
</html>