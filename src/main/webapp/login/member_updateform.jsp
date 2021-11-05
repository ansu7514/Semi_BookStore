<%@page import="db.UserDTO"%>
<%@page import="db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300;600;700&display=swap"
	rel="stylesheet">
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
</script>
<style type="text/css">
#member_update_form {
	background-color: #FAF7EB;
	padding-left: 5%;
}

html {
	background-color: #FAF7EB !important;
}

body {
	background-color: #FAF7EB !important;
	font-family: 'Noto Serif KR', serif;
	font-size: 20px;
}
</style>
</head>

<%
//id 읽기
String myid = (String)session.getAttribute("myid");
//dao 선언
UserDAO dao = new UserDAO();
//dto 얻기
UserDTO dto = dao.getUser(myid);
%>

<!-- 수정할 부분 : 사용자이름, 비밀번호, 생년월일, 주소, 전화번호 => 회원정보 설정화면으로 돌아감 -->

<form action="login/member_updateproc.jsp" method="post"
	id="member_update_form" style="width: 100%;">

	<!-- hidden -->
	<input type="hidden" name="myid" value="<%=myid%>">

	<div>
		<!-- 아이디 -->
		<div class="form-group" style="width: 200px; margin-bottom: 20px;">
			<label style="font-size: 25px;">아이디 : <%= dto.getUser_id() %></label>
		</div>

		<!-- 비밀번호 -->
		<div class="form-group"
			style="display: inline-flex; margin-bottom: 20px;">
			<table id="pw_table" class="form-inline">
				<tr>
					<td><label style="font-size: 15pt;">비밀번호</label></td>
					<td width="20px;"></td>
					<td><label style="font-size: 15pt;">비밀번호 재확인</label></td>
				</tr>

				<tr>
					<td><input type="password" name="user_pass1"
						style="width: 200px;" id="pw" class="form-control"
						onchange="check_pw()" required="required" placeholder="비밀번호 입력">
					</td>

					<td width="20px;"></td>

					<td><input type="password" name="user_pass2" id="pw2"
						style="width: 200px;" class="form-control" onchange="check_pw()"
						required="required" placeholder="비밀번호 재입력"></td>
				</tr>

				<tr>
					<td><span id="check" style="font-weight: bold"></span></td>
				</tr>
			</table>
		</div>
		<div class="form-group" style="width: 180px;">
			<label>이름</label> <input type="text" name="user_name"
				class="form-control" required="required"
				value="<%=dto.getUser_name()%>">
		</div>

		<div class="form-group" style="width: 180px;">
			<label>주소</label> <input type="text" name="addr" class="form-control"
				required="required" value="<%=dto.getAddr()%>">
		</div>

		<div class="form-group" style="width: 180px;">
			<label>생년월일</label> <br> <input type="text" name="birthday1"
				class="form-inline" style="width: 50px; height: 20px;"
				placeholder="년(4자)"> <b>-</b> <select name="birthday2"
				id="birthday2" class="form-inline"
				style="width: 50px; height: 20px;">
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select> <b>-</b> <input type="text" name="birthday3" class="form-inline"
				style="width: 50px; height: 20px;" placeholder="일">
		</div>


		<div class="form-group" style="width: 180px;">
			<label>휴대전화</label> <input type="text" name="hp" class="form-control"
				required="required" value="<%=dto.getHp()%>">
		</div>


		<div style="margin-left: 50px;">
			<button type="submit" class="btn btn-warning">수정하기</button>
		</div>
	</div>
</form>