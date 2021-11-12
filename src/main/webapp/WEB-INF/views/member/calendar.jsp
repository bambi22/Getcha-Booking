<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	Calendar cal = Calendar.getInstance();
	int year = request.getParameter("year") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("year"));
	int month = request.getParameter("month") == null ? cal.get(Calendar.MONTH) +1 : Integer.parseInt(request.getParameter("month"));
	cal.set(year, month - 1, 1);
	int week = cal.get(Calendar.DAY_OF_WEEK);
	int first_day = cal.get(Calendar.DAY_OF_MONTH);
	int last_day = cal.getActualMaximum(Calendar.DATE);
	int count = 0;
	int i = 0;
	int day = 0;
%>
<body>
<div id="container" style="width:1130px; position:relative; padding-top:60px; margin:auto;">
<div id = "calendar" style="width:55%; float:left; text-align:center;" >
	<form name="calform" method="post">
		<input type="hidden" name="year" value="<%=year%>"/>
		<input type="hidden" name="month" value="<%=month%>"/>
		<table style="width:90%; height:80%; text-align:center;" align="center">
		<tr>
		<td colspan="2" border="none">
		<input type="button" value="지난달" onclick="preMonth()"/>
		</td>
		<td colspan="3">
		<%=year %>년
		<%=month %>월
		</td>
		<td colspan="2">
		<input type="button" value="다음달" onclick="nextMonth()"/>
		</td>
		</tr>
		
<script>
		function nextMonth(){
			var calform = document.calform;
			var year = Number(calform.year.value);
			var month = Number(calform.month.value);
			if(month == 12){
				calform.year.value = year + 1;
				calform.month.value = 1;
			}else{
				calform.month.value = month + 1;
			}
			calform.submit();
		}
		
		function preMonth(){
			var calform = document.calform;
			var year = Number(calform.year.value);
			var month = Number(calform.month.value);
			if(month == 1){
				calform.year.value = year - 1;
				calform.month.value = 12;
			}else{
				calform.month.value = month - 1;
			}
			calform.submit();
		}
</script>
			
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
<%
	while(first_day <= last_day){
		++i;
		if(first_day > last_day){
			break;
		}
		if(count % 7 == 0){
%>
		<tr>
<% 		
			System.out.println();
			count=0;
		}
		if(i>=week){
			
%>
			<td>
			
			<input type="button" id="btn" name="btn" value=<%=first_day %> onclick="day_alert();">
			
<%
			System.out.println(first_day+"\t");
			++first_day;
%>
			</td>
<%
		}else{
%>
			<td></td>
<%			
			System.out.print("\t");
		}
		++count;
		}
%>
			</tr>
		</table>
	</form>
</div>

<div id = "reservation" style="width:40%; float:right;" >
	<table border="1" style="width:100%; height:70%; layout:fixed">
		<tr><th>시간</th></tr>
		<tr>
			<td>11:00</td><td>13:00</td><td>15:00</td><td>16:00</td>
		</tr>
		<tr><th>인원</th>
		<tr>
			<td>1명</td><td>2명</td><td>3명</td><td>4명</td><td>5명</td><td>6명</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="예약하기">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</div>
</div>
</body>