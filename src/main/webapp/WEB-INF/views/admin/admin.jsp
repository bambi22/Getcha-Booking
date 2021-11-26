<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="shortcut icon" type="image/x-icon" href="member/image/favicon.ico">
<body>
<c:import url="adminNav.jsp" />
<div align="center" >
	<table style="width:100%;">
		<tr>
			<td rowspan="3"><c:import url="adminNav.jsp" /></td>
			<td style="padding-left:280px; height: 50px"><%@ include file="../common/top.jsp" %></td>
		</tr>
		<tr>
			<td style="padding-left:280px; margin-top:40px;"><c:import url="/${formpath }" /> </td>
		</tr>
		<tr>
			<td style="padding-left:280px; height:50px;"><%@ include file="../common/footer.jsp" %></td>
		</tr>
	</table>
	</div>
</body>
</html>