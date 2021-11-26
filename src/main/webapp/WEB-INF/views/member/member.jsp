<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
			$('msg').text('이메일을 입력하세요.');
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

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,100,700,500);
body {
  padding-top: 90px;
  background:#F7F7F7;
  color:#666666;
  font-family: 'Roboto', sans-serif;
  font-weight:100;
}

body{
  width: 100%;
   background: -webkit-linear-gradient(left,#B0B1B2,#747678,#1D1E1E, #B0B1B2);
  background: linear-gradient(to right,#B0B1B2, #747678,#1D1E1E,#B0B1B2);
  background-size: 600% 100%;
  -webkit-animation: HeroBG 20s ease infinite;
          animation: HeroBG 20s ease infinite;
}

@-webkit-keyframes HeroBG {
  0% {
    background-position: 0 0;
  }
  50% {
    background-position: 100% 0;
  }
  100% {
    background-position: 0 0;
  }
}

@keyframes HeroBG {
  0% {
    background-position: 0 0;
  }
  50% {
    background-position: 100% 0;
  }
  100% {
    background-position: 0 0;
  }
}


.panel {
  border-radius: 5px;
}
label {
  font-weight: 300;
}
.panel-login {
   border: none;
  -webkit-box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  -moz-box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  box-shadow: 0px 0px 49px 14px rgba(188,190,194,0.39);
  }
.panel-login .checkbox input[type=checkbox]{
  margin-left: 0px;
}
.panel-login .checkbox label {
  padding-left: 25px;
  font-weight: 300;
  display: inline-block;
  position: relative;
}
.panel-login .checkbox {
 padding-left: 20px;
}
.panel-login .checkbox label::before {
  content: "";
  display: inline-block;
  position: absolute;
  width: 17px;
  height: 17px;
  left: 0;
  margin-left: 0px;
  border: 1px solid #cccccc;
  border-radius: 3px;
  background-color: #fff;
  -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
  -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
  transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
}
.panel-login .checkbox label::after {
  display: inline-block;
  position: absolute;
  width: 16px;
  height: 16px;
  left: 0;
  top: 0;
  margin-left: 0px;
  padding-left: 3px;
  padding-top: 1px;
  font-size: 11px;
  color: #555555;
}
.panel-login .checkbox input[type="checkbox"] {
  opacity: 0;
}
.panel-login .checkbox input[type="checkbox"]:focus + label::before {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
.panel-login .checkbox input[type="checkbox"]:checked + label::after {
  font-family: 'FontAwesome';
  content: "\f00c";
}
.panel-login>.panel-heading .tabs{
  padding: 0;
}
.panel-login h2{
  font-size: 20px;
  font-weight: 300;
  margin: 30px;
}
.panel-login>.panel-heading {
  color: #848c9d;
  background-color: #e8e9ec;
  border-color: #fff;
  text-align:center;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border-bottom: 0px;
  padding: 0px 15px;
}
.panel-login .form-group {
  padding: 0 30px;
}
.panel-login>.panel-heading .login {
  padding: 20px 30px;
  border-bottom-leftt-radius: 5px;
}
.panel-login>.panel-heading .register {
  padding: 20px 30px;
  background: #2d3b55;
  border-bottom-right-radius: 5px;
}
.panel-login>.panel-heading a{
  text-decoration: none;
  color: #666;
  font-weight: 300;
  font-size: 16px;
  -webkit-transition: all 0.1s linear;
  -moz-transition: all 0.1s linear;
  transition: all 0.1s linear;
}
.panel-login>.panel-heading a#register-form-link {
  color: #fff;
  width: 100%;
  text-align: right;
}
.panel-login>.panel-heading a#login-form-link {
  width: 100%;
  text-align: left;
}

.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
  height: 45px;
  border: 0;
  font-size: 16px;
  -webkit-transition: all 0.1s linear;
  -moz-transition: all 0.1s linear;
  transition: all 0.1s linear;
  -webkit-box-shadow: none;
  box-shadow: none;
  border-bottom: 1px solid #e7e7e7;
  border-radius: 0px;
  padding: 6px 0px;
}
.panel-login input:hover,
.panel-login input:focus {
  outline:none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  border-color: #ccc;
}
#btn-login {
  background-color: #E8E9EC;
  outline: none;
  color: #2D3B55;
  font-size: 14px;
  height: auto;
  font-weight: normal;
  padding: 14px 0;
  text-transform: uppercase;
  border: none;
  border-radius: 0px;
  box-shadow: none;
}
.btn-login:hover,
.btn-login:focus {
  color: #fff;
  background-color: #2D3B55;
}
.forgot-password {
  text-decoration: underline;
  color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
  text-decoration: underline;
  color: #666;
}

.btn-register {
  background-color: #E8E9EC;
  outline: none;
  color: #2D3B55;
  font-size: 14px;
  height: auto;
  font-weight: normal;
  padding: 14px 0;
  text-transform: uppercase;
  border: none;
  border-radius: 0px;
  box-shadow: none;
}
.btn-register:hover,
.btn-register:focus {
  color: #fff;
  background-color: #2D3B55;
}
.btn-reset {
  background-color: #E8E9EC;
  outline: none;
  color: #2D3B55;
  font-size: 14px;
  height: auto;
  font-weight: normal;
  padding: 14px 0;
  text-transform: uppercase;
  border: none;
  border-radius: 0px;
  box-shadow: none;
  margin-top:10px;
}
.btn-reset:hover,
.btn-reset:focus {
  color: #fff;
  background-color: #2D3B55;
}

</style>
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