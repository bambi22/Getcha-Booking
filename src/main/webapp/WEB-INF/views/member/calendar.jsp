<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<script>
function search(){
	var i = document.getElementById("resDay").value;
	var e = {resDay:i}
	var time_data;
	$.ajax({
		url :"SearchDay", type:"POST",
		//async:false;
		data:JSON.stringify(e),
		contentType:"application/json; charset=utf-8",
		dataType:'json',
		success:function(data){
			console.log(data);
			var str="<tr>";
			var list = data.datas;
			$(list).each(function(ind,obj){
				console.log(obj["time"]);
				console.log(obj["capa"]);
				str+="<td onclick='setTime(obj['time']);' style='cursor:pointer;'>"+obj["time"]+"</td>";
			});
			str+="</tr>"
				$("#showTime").html(str);
			$("#showTime td").click(function(){
				
				var str=""
				var ctr=""
				var td=$(this);
				console.log("선택된 데이터:"+td.text());
				$("#hours").val(td.text());
				str = td.text();
				$("#hours").html(str)
				$('#capacity').children('option').remove()
				$(list).each(function(ind,obj){
					if(obj["time"]==str){
						console.log(obj["time"]);
						var ctr=obj["capa"];
						var capanum = parseInt(ctr);
						console.log("capanum:"+capanum);
						for(var i=1; i<=capanum; i++){
							$("select[name='capacity']").append('<option value="'+i+'">'+i+'</option>');
						}
						
					}
				});
			});
		},
		error:function(){
			alert("문제발생")
		}
	});
}



</script>
<body>
<div class="container" style="width:1130px; position:relative; padding-top:60px; margin:auto;">
	
	<div style="width:55%; float:left; text-align:center;">
		<div>
			<button type="button" onclick="changeMonth(-1);"><i class="fa fa-chevron-left"></i></button>
			<input type="number" id="year" value="2020" style="width:80px; display:initial;" class="form-control"/>
			<select id="month" class="form-control" style="width:80px; display:initial;" onchange="changeMonth();">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			<button type="button" onclick="changeMonth(1);"><i class="fa fa-chevron-right"></i></button>
		</div>
		<table class="table table-bordered" style="width:90%; height:80%; text-align:center;" align="center">
			<thead>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody id="tb_body">
			</tbody>
		</table>
	</div>
	<form action="reservationProc" method="post">
	<div id = "reservation" style="width:40%; float:right;" >
	<table style="width:100%; height:70%; layout:fixed" class="checkTab">
		<tr><th>날짜</th></tr>
		<tr>
			<td><input type="text" id="resDay" name="resDay"/></td>
			<td colspan="2"><input type="button" value="조회" onclick="search();"></td>
		</tr>
		<tr><th>시간</th></tr>
		<tr id=showTime>
		</tr>
		<tr>
			<td>
			<input type="text" id="hours" name="hours"/>
			</td>
		</tr>
		<tr><th>인원</th>
		<tr id="showData">
			<td>
				<select name="capacity">
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="예약하기">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</div>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

	function checkLeapYear(year){
		if(year%400 == 0){
			return true;
		}else if(year%100==0){
			return false;
		}else if(year%4 == 0){
			return true;
		}else{
			return false;
		}
	}
	function getFirstDayOfWeek(year,month){
		if(month < 10) month = "0" + month;
		
		return (new Date(year+"-"+month+"-01")).getDay();
	}
	function changeYearMonth(year,month){
		let month_day = [31,28,31,30,31,30,31,31,30,31,30,31]
		if(month == 2){
			if(checkLeapYear(year)) month_day[1] = 29;
		}
		let first_day_of_week = getFirstDayOfWeek(year,month);
		let arr_calendar=[];
		for(let i=0; i<first_day_of_week; i++){
			arr_calendar.push("");
		}
		for(let i=1; i<=month_day[month-1]; i++){
			arr_calendar.push(String(i));
		}
		let remain_day=7 -(arr_calendar.length%7);
		if(remain_day < 7){
			for(let i=0; i<remain_day; i++){
				arr_calendar.push("");
			}
		}
		renderCalendar(arr_calendar);
	}
	function renderCalendar(data){
		let h = [];
		for(let i = 0; i<data.length; i++){
			if(i==0){
				h.push('<tr>');
			}else if(i%7 == 0){
				h.push('</tr>');
				h.push('<tr>');
			}
			h.push('<td onclick="setDate('+data[i]+');" style="cursor:pointer;">'+data[i]+'</td>');
		}
		h.push('</tr>');
		$("#tb_body").html(h.join(""));
	}
	
	function setDate(day){
		if(day<10) day="0" +day;
		$("#resDay").val(current_year + "-" + current_month + "-" + day);
	}
	
	function changeMonth(diff){
		if(diff == undefined){
			current_month = parseInt($("#month").val());
		}else{
			current_month = current_month +diff;
			if(current_month == 0){
				current_year = current_year -1;
				current_month = 12;
			}else if(current_month == 13){
				current_year = current_year +1;
				current_month = 1;
			}
		}
		loadCalendar();
	}

	function loadCalendar(){
		$("#year").val(current_year);
		$("#month").val(current_month);
		changeYearMonth(current_year,current_month);
	}
	let current_year=(new Date()).getFullYear();
	let current_month = (new Date()).getMonth()+1;
	$("#year").val(current_year);
	$("#month").val(current_month);
	
	changeYearMonth(current_year,current_month);
	

</script>
</body>
</html>