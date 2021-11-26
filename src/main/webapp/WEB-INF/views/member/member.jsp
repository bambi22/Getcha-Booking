<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/member/member.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->
<script>

    $('#login-form-link').click(function(e) {
    	$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	

});
</script>
<html>
<script>
	function sendAuthNum(){
		var e = document.getElementById("email").value;
		if(e == ""){
			$('#msg').text('이메일을 입력하세요.');
			return;
		}
		var s = {email:e};
		$.ajax({
			url: "sendAuth", type:"POST",
			data: JSON.stringify(s),
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			success: function(result){
				$('#msg').text(result.msg);
			},
			error:function(){
				$('#msg').text('error');
			}
		})
	}
	function sendAuthConfirm(){
		var i = document.getElementById("inputAuthNum").value;
		if(i == ""){
			$('#msg').text('인증번호를 입력하세요.');
			return;
		}
		var s = {inputAuthNum:i};
		$.ajax({
			url: "sendAuth", type:"POST",
			data: JSON.stringify(info),
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			success: function(result){
				$('#msg').text(result.msg);
			},
			error:function(){
				$('#msg').text('error');
			}
		})
	}

</script>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<body>
<div class="container">
   <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-login">
        <div class="panel-body">
          <div class="row">
            <div class="col-lg-12">
            <h3><font color="red" id="msg">${msg}</font></h3>
              <form id="login-form"  action="memberProc" method="post" role="form" style="display: block;">
                <h2>REGISTER</h2>
                  <div class="form-group">
                    <input type="text" name="email" id="email" tabindex="1" class="form-control" placeholder="이메일" value="">
                    <input type="button" value="Email 인증하기" onclick="sendAuthNum();">
                  </div>
                  <div class="form-group">
                    <input type="text" name="authNum" id="inputAuthNum" tabindex="1" class="form-control" placeholder="이메일인증 번호" value="">
                    <input type="button" value="Email 인증확인" onclick="sendAuthConfirm();">
                  </div>
                  <div class="form-group">
                    <input type="text" name="nickname" id="nickname" tabindex="1" class="form-control" placeholder="닉네임 입력" value="">
                  
                  </div>
                  <div class="form-group">
                    <input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder="비밀번호" onblur="pwchk()">
                  	<input type="text" style="border-width:0px" size="50" name="pwchk" id="pwchk" value="비밀번호는 8자리 이상의 영어+숫자조합이어야 합니다." readonly="readonly">
                  </div>
                  <div class="form-group">
                    <input type="password" name="pwCheck" id="pwCheck" tabindex="2" class="form-control" placeholder="비밀번호 확인">                  
                  </div>
                  <div class="form-group">
                    <input type="text" name="mobile" id="mobile" tabindex="2" class="form-control" placeholder="휴대폰 번호">                  
                   </div>
                    <div class="form-group">
                    <input type="password"  tabindex="2" class="form-control" placeholder="생일">                  
                <select name="birth1">
					<%for(int i=2002; i>=1900; i--){ %>
						<option value="<%=i %>"><%=i %></option><%} %>
					</select>년
					<select name="birth2">
					<%for(int i=1; i<=12; i++){ %>
						<option value="<%=i %>"><%=i %></option><%} %>
					</select>월
					<select name="birth3">
					<%for(int i=1; i<=31; i++){ %>
						<option value="<%=i %>"><%=i %></option><%} %>
					</select>일<br><br>
                  </div>
                    <div class="form-group">
                    <input type="text" tabindex="2" class="form-control" placeholder="성별">                  
                   	<input type=radio name='gender' value='n' checked="checked"/>선택안함
					<input type=radio name='gender' value='w' />여자
					<input type=radio name='gender' value='m' />남자
                   </div>
                  <div class="form-group">
                    <div class="row">
                      <div class="col-sm-6 col-sm-offset-3">
                        <!-- <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="회원가입"> -->
                          <input type="reset" name="register-reset" id="register-reset" tabindex="4" class="form-control btn btn-reset" value="취소">
                      </div>
                    </div>
                  </div>
              </form>
               
             
            </div>
          </div>
        </div>
        <div class="panel-heading">
          <div class="row"with  >
            <div class="col-xs-6 tabs">
              <a href="${root}index?formpath=login" class="active" id="login-form-link"><div class="login">로그인</div></a>
            </div>
            <div class="col-xs-6 tabs">
              <a id="register-form-link"><div class="register"><input type="submit" name="register-submit" id="register-submit" value="회원가입"></div></a>
           
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer>
    <div class="container">
        <div class="col-md-10 col-md-offset-1 text-center">
        </div>
    </div>
</footer>
<script>
	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
	
		/* 로그인 메서드 서버 요청 */
		$("#login-form").attr("action","login");
		$("#login-form").submit();
		
	});
</script>
</body>
<script>
	

	function pwchk(){
		var pw = document.getElementById("pw").value;
		var pwChk = document.getElementById("pwChk").value;
		if(pwChk.length == 0 || pwChk == null){
			document.getElementById("chk").value="비밀번호를 입력하세요.";
		}else if(pw !=pwChk){
			document.getElementById("chk").value="비밀번호가 일치하지않습니다.";
		}else{
			document.getElementById("chk").value="비밀번호가 동일합니다.";
		}
		return;
	}
</script>
</html>