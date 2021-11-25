<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="shortcut icon" type="image/x-icon" href="member/image/favicon.ico">
<body>
<c:import url="adminNav.jsp" />
<div align="center" >
	<table style="width:100%;">
		<tr>
			<td style="height:100px;"><%@ include file="../common/top.jsp" %></td>
		</tr>
		<tr>
			<td style="padding: 40px; padding-left:300px"><c:import url="/${formpath }" /> </td>
		</tr>
		<tr>
			<td style="height:50px;"><%@ include file="../common/footer.jsp" %></td>
		</tr>
	</table>
	</div>
</body>
</html>