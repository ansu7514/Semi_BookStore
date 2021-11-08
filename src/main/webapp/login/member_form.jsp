<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: 'Noto Serif KR', serif;
	font-size: 20px;
}
</style>
<script type="text/javascript">
/* 비밀번호 입력조건 , 일치여부 확인 */
	function check_pw(){
		 
	    var pw = document.getElementById('pw').value;
	    var SC = ["!","@","#","$","%"];
	    var check_SC = 0;
	
	    if(pw.length < 6 || pw.length>16){
	        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	        document.getElementById('pw').value='';
	    }
	    for(var i=0;i<SC.length;i++){
	        if(pw.indexOf(SC[i]) != -1){
	            check_SC = 1;
	        }
	    }
	    if(check_SC == 0){
	        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
	        document.getElementById('pw').value='';
	    }
	    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
	        if(document.getElementById('pw').value==document.getElementById('pw2').value){
	            document.getElementById('check').innerHTML='일치합니다.'
	            document.getElementById('check').style.color='blue';
	        }
	        else{
	            document.getElementById('check').innerHTML='일치하지 않습니다.';
	            document.getElementById('check').style.color='red';
	        }
	    }
	}
	
	function check_recaptcha(){
		var v = grecaptcha.getResponse();
		
		if (v.length == 0) {
			alert ("'로봇이 아닙니다.'를 체크해주세요.");
			return false;
		} else {
			location.href='login/member_add.jsp';
			
			return true;
		}
	}
</script>


</head>
<body>
	<form action="login/member_add.jsp" method="post" id="frm">
		<div class="member_form" style="display: flex; justify-content: center;">
			<div class="member_form_de" style="padding-top: 50px;">
				<div class="member_form_de_center">
					<!-- 아이디 -->
					<div class="form-group" style="width: 200px; margin-bottom: 20px;">
						<label style="font-size: 15pt;">아이디</label> <input type="text" name="user_id"
							class="form-control" required="required" placeholder="아이디 입력">
					</div>
					
					<!-- 비밀번호 -->
					<div class="form-group" style="display: inline-flex; margin-bottom: 20px;">
						<table id="pw_table" class="form-inline">
							<tr>
								<td><label style="font-size: 15pt;">비밀번호</label></td>
								<td width="20px;"></td>
								<td><label style="font-size: 15pt;">비밀번호 재확인</label></td>
							</tr>
							
							<tr>
								<td>
									<input type="password" name="user_pass1" style="width: 200px;"
									id="pw" class="form-control" onchange="check_pw()"
									required="required" placeholder="비밀번호 입력">
								</td>
								
								<td width="20px;"></td>
								
								<td>
									<input type="password" name="user_pass2" id="pw2"
									style="width: 200px;" class="form-control"
									onchange="check_pw()" required="required" placeholder="비밀번호 재입력">
								</td>
							</tr>
							
							<tr>
								<td><span id="check" style="font-weight: bold"></span></td>
							</tr>
						</table>
					</div>
					
					<!-- 이름 -->
					<div class="form-group" style="width: 200px; margin-bottom: 20px;">
						<label style="font-size: 15pt;">이름</label> <input type="text" name="user_name"
							class="form-control" required="required" placeholder="이름 입력">
					</div>

					<!-- 주소 -->
					<div class="form-group" style="width: 425px; margin-bottom: 20px;">
						<label style="font-size: 15pt;">주소</label> <input type="text" name="addr"
							class="form-control" required="required" placeholder="주소 입력">
					</div>
					
					<!-- 생년월일 -->
					<div class="form-group" style="margin-bottom: 20px;">
						<table>
							<tr>
								<td><label style="font-size: 15pt;">생년월일</label></td>
							</tr>
							
							<tr>
								<td class="form-inline">
									<input type="text" name="birthday1"
									class="form-control" style="width: 100px;"
									placeholder="년(4자)"> 
								</td>
								
								<td width="30px;" style="text-align: center;"><b>-</b></td>
								
								<td class="form-inline">
									<select name="birthday2"
									id="birthday2" class="form-control"
									style="width: 100px;">
										<option value="">월</option>
										<c:forEach var="i" begin="1" end="12">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
								</td>
								
								<td width="30px;" style="text-align: center;"><b>-</b></td>
								
								<td class="form-inline">
									<input type="text" name="birthday3" class="form-control"
									style="width: 100px;" placeholder="일">
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 성별 -->
					<div class="form-group" style="width: 200px; margin-bottom: 20px;">
						<label style="font-size: 15pt;">성별</label> <select name="gender" class="form-control">
							<option value="">성별</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</div>
					
					<!-- hp -->
					<div class="form-group" style="width: 200px; margin-bottom: 20px; margin-bottom: 50px;">
						<label style="font-size: 15pt;">휴대전화</label> <input type="text" name="hp"
							class="form-control" required="required" placeholder="핸드폰 번호 입력">
					</div>
				</div>

				<!-- 캡챠 -->
				<div id="google_recaptha" style="display: flex; justify-content: center;">
					<script src='https://www.google.com/recaptcha/api.js?onload=onloadCallback' async defer></script>
					<div class="g-recaptcha"
						data-sitekey="6LcZ5R4dAAAAAGu3UuaIaftofKjy1mapuGf9Jr0L"></div>
				</div>

				<div style="display: flex; justify-content: center; margin-top: 35px; margin-bottom: 30px;">
					<button id="sub" onclick="return check_recaptcha();" class="btn btn-warning">회원가입</button>
				</div>
			</div>
		</div>
	</form>

</body>
</html>