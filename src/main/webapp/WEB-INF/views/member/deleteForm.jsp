<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.email }">
	<script>
		location.href="index?formpath=main";
	</script>
</c:if>
<c:if test="${not empty msg }">
	<script>
		var message="${msg}";
		alert(message);
	</script>
</c:if>
<center>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/member/member.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<body>
<div class="container">
   <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-login">
        <div class="panel-body">
          <div class="row">
            <div class="col-lg-12">
            <h3><font color="red" id="msg">${msg}</font></h3>
              <form   action="memberDeleteProc" method="post" role="form" style="display: block;">
                <h2>회원탈퇴</h2>
                  <div class="form-group">
                    
                 
                  <div class="form-group">
                    <input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder='비밀번호'>
                   
                  </div>
                  <div class="form-group">
                    <input type="password" name="pwCheck" id="pwCheck" tabindex="2" class="form-control" placeholder="비밀번호 확인">
                   
                  </div>
              
			<tr>
				<td colspan=2 align='center'>
					<input type=submit value='확인' style="width:80px;"/>
					<input type="button" style="width:80px;" value="취소" onclick="location.href='${root}memberViewProc'"/>
			</tr>
		</table>
	</form>
</center>