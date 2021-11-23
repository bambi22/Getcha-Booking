<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	body{background:gray; margin:0 0 0 20px; padding:0;}
	#wrap{width:100%; height:100px; background:white;}
	#sidebar{background:white; width:300px; height:100%; top0; left:-300px; position:fixed;}
	#sidebar>table{margin:0; padding:0; top:50px; left:40px; position:absolute; text-align:center;}
	#sidebar td{margin: 0 0 20px; list-style:none;}
	#sidebar>button{background:#333; position:absolute; top:150px; left:300px; width:52px; height:52px; border:none; color:white;}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function(){
		var duration = 300;
		var $side=$('#sidebar');
		var $sidebt = $side.find('button').on('click',function(){
			$side.toggleClass('open');
			if($side.hasClass('open')){
				$side.stop(true).animate({left:'0px'},duration);
				$side.find('span').text('CLOSE');
			}else{
				$side.stop(true).animate({left:'-300px'},duration);
				$side.find('span').text('OPEN');
			};
		});
	});
</script>
<div id = "wrap">
	<aside id="sidebar">
		<table>
			<tr>
				<td colspan="2"><h1>Logologologo</h1></td>
			</tr>
			
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<tr>
						<td colspan="2">
							<input type="button" name="login" id="login" value="로그인 후 이용해주세요." onclick="location.href='index?formpath=login'"/>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td><h3>이미지</h3></td>
						<td><h3>**님 환영합니다.</h3>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" name="update" id="update" value="회원정보" onclick="location.href='memberView.jsp'" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" name="reservation" id="reservation" value="예약내역"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" name="interest" id="interest" value="관심식당" onclick="location.href='collectionForm.jsp'"/>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<button><span class="btn_t">OPEN</span></button>
	</aside>
</div>