<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<style>
/* *{
  font-family:'GowunDodum-Regular'  ;
}
@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/SF_IceLemon.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} */
#index {position:relative; display:flex; flex-direction: column;}
#head{margin-bottom:auto;}
#foot{margin-top:auto;}
</style>

<body>
<c:import url="nav.jsp" />
<div id="index">
	<div id="head"> <c:import url="top.jsp" /></div>
	<div id="formpath"><c:import url="/${formpath }" /> </div>
	<div id="foot"> <c:import url="footer.jsp" /></div>
</div>
</body>
</html>