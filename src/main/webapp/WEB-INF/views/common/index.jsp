<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style>
*{
  font-family:'GowunDodum-Regular'  ;
}
@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/SF_IceLemon.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<link rel="shortcut icon" type="image/x-icon" href="member/image/favicon.ico">
<body>
<c:import url="nav.jsp" />
<div>
	<table style="width:100%;">
		<tr>
			<td><!-- <%@ include file="top.jsp" %>--></td>
		</tr>
		<tr>
			<td><c:import url="/${formpath }" /> </td>
		</tr>	
		<tr>
			<td><%@ include file="footer.jsp" %></td>
		</tr>
	</table>
	</div>
</body>
</html>