<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="shortcut icon" type="image/x-icon" href="member/image/favicon.ico">
<body>
<c:import url="nav.jsp" />
<div align="center">
	<table style="width:100%;">
		<tr>
			<td><!-- <%@ include file="top.jsp" %>--></td>
		</tr>
		<tr>
			<td style="height:400px;"><c:import url="/${formpath }" /> </td>
		</tr>
		<tr>
			<td style="height:50px; "><%@ include file="footer.jsp" %></td>
		</tr>
	</table>
	</div>
</body>
</html>