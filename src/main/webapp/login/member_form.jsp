<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">


<%
//

//
%>
<script type="text/javascript">
//비밀번호 입력조건 , 일치여부 확인
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

</head>
<body>

<form action="member_add.jsp" method="post">

<div class="form-group" style="width: 180px;">
	<label>아이디</label>
	<input type="text" name="user_id" class="form-control">
</div>
 
<div class="form-group" style="width: 180px;">
	<label>비밀번호</label>
	<input type="password" name="user_pass1" id="pw" class="form-control"
	onchange="check_pw()">
</div>
 
<div class="form-group" style="width: 180px;">
	<label>비밀번호 재확인</label>
	<input type="password" name="user_pass2" id="pw2" class="form-control"
	onchange="check_pw()">&nbsp;<span id="check"></span>
</div>
 
<div class="form-group" style="width: 180px;">
	<label>이름</label>
	<input type="text" name="user_name" class="form-control">
</div>

<div class="form-group" style="width: 180px;">
	<label>주소</label>
	<input type="text" name="addr" class="form-control">
</div>
 
<div class="form-group" style="width: 180px;">
	<label>생년월일</label> <br>
  
	<input type="text" name="birthday1" class="form-inline" 
	style="width: 57px; height: 20px;" placeholder="년(4자)">
  
	<select name="birth2" id="birthday2" class="form-inline"
	style="width: 57px; height: 20px;">
	<option value="">월</option>
	<c:forEach var="i" begin="1" end="12">
	<option value="${i}">${i}</option>
	</c:forEach>
	</select>
  
	<input type="text" name="birthday3" class="form-inline" 
	style="width: 57px; height: 20px;" placeholder="일">
</div> 

<div class="form-group" style="width: 180px;">
	<label>성별</label>
	<select id="gender" class="form-control">
	<option value="">성별</option>
	<option value="남자">남자</option>
	<option value="여자">여자</option>
	</select>
</div>
 
<div class="form-group" style="width: 180px;">
	<label>휴대전화</label>
	<input type="text" name="hp" class="form-control">
</div>
 
<!-- 캡챠 -->
 <div id="google_recaptha">
	 <script src='https://www.google.com/recaptcha/api.js'></script>
	 <div class="g-recaptcha" data-sitekey="6LfQugsdAAAAAMsc4blU0sNU9CBZdnflfGNKYveI"></div>
 </div>
 
<div style="margin-left: 50px;">
	<button type="submit" class="btn btn-default"
	onclick="location.href=''">회원가입</button>
</div>
 
 
</form>

</body>
</html>