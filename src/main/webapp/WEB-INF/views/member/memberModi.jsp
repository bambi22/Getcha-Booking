<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.email }">
	<script>
		alert("로그인 후 이용 가능합니다.");
		location.href='index?formpath=login'
	</script>
</c:if>
<script type="text/javascript">
var message="${msg}";
alert(message);
</script>
<center>
	<form action=memberModiProc method="post">
		<table>
			<tr>
				<td colspan=2 >
				<h2>회원수정</h2>
			</tr>
			<tr>
				<td align='right' height=40>이메일</td>
				<td><input type=text name='email' id='email' value='${memberView.email }' disabled="disabled"/></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td height=40>닉네임</td>
				<td>
					<input type='text' name='nickname' id='nickname' value='${memberView.nickname }'/>
				</td>
			</tr>
			<tr>
				<td align='right' height=40>패스워드</td>
				<td><input type=text name='pw' id='pw' placeholder='pw 입력'/>
					<div class="alert-length" id="alert-length">비밀번호는 8자리 이상으로 입력해주세요.</div>
                    <div class="alert-space" id="alert-space">비밀번호는 공백 없이 입력해주세요.</div>
                    <div class="alert-eng" id="alert-eng">비밀번호는 영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.</div>
				</td>
				<td align='right'>패스워드 확인</td>
				<td><input type=text name='pwCheck' id='pwCheck' placeholder='pw 입력'/>
					<div class="alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                    <div class="alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				</td>
			</tr>
			<tr>
				<td height=40>휴대폰 번호</td>
				<td>
					<input type=text name='mobile' id='mobile' placeholder='휴대폰번호 입력'/>
				</td>
			</tr>
			<tr>
				<td align='right' height=40>생일</td>
				<td><input type=text name='birth' id='birth' value='${memberView.birth }'disabled="disabled"/></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td align='right' width=120>성별</td>
				<td colspan="3">
				<c:if test="${memberView.gender == 'n' }">
					<input type=radio name='gender' value='n' checked="checked"/>선택안함
					<input type=radio name='gender' value='m' disabled="disabled"/>남자
					<input type=radio name='gender' value='w' disabled="disabled"/>여자
				</c:if>
				<c:if test="${memberView.gender == 'm' }">
					<input type=radio name='gender' value='n' disabled="disabled"/>선택안함
					<input type=radio name='gender' value='m' checked="checked"/>남자
					<input type=radio name='gender' value='w' disabled="disabled"/>여자
				</c:if>
				<c:if test="${memberView.gender == 'w' }">
					<input type=radio name='gender' value='n' disabled="disabled"/>선택안함
					<input type=radio name='gender' value='m' disabled="disabled"/>남자
					<input type=radio name='gender' value='w' checked="checked"/>여자
				</c:if>
				</td>
			</tr>
			<tr>
				<td align='center' height=40 colspan=4>
				<input type=submit value='수정' style="width:120px;"/>
				<input type="button" style="width:120px;" value="취소" onclick="location.href='${root}memberViewProc'"/>
				</td>
			</tr>
		</table>
	</form>
</center>
<script>
$(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#pwCheck").keyup(function(){
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		if(pw != "" || pwCheck != ""){
			if(pw == pwCheck){
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});

$(function(){
	$("#alert-length").hide();
	$("#alert-space").hide();
	$("#alert-eng").hide();
	$("#pw").blur(function(){
		var pw = $("#pw").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if(pw.length<8){
			$("#alert-length").show();
			$("#alert-space").hide();
			$("#alert-eng").hide();
		}else if(pw.search(/\s/)!=-1){
			$("#alert-length").hide();
			$("#alert-space").show();
			$("#alert-eng").hide();
		}else if((num<0&&eng<0)||(eng<0&&spe<0)||(spe<0&&num<0)){
			$("#alert-length").hide();
			$("#alert-space").hide();
			$("#alert-eng").show();
		}else{
			$("#alert-length").hide();
			$("#alert-space").hide();
			$("#alert-eng").hide();
			console.log("통과");
		}
	});
});
</script>