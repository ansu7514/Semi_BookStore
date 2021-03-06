<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <style type="text/css">
 body {
	font-family: 'Noto Serif KR', serif;
}
 </style>
<%
// 아이디 저장 체크박스
// 세션값 얻어오기
String saveok=(String)session.getAttribute("saveok");
String myid="";

if(saveok!=null)
	myid=(String)session.getAttribute("myid");
%>
</head>

<body>

<div style="width:100%; display: flex; justify-content: center; margin-top: 15px;">
	<form action="login/login_action.jsp" method="post" name="frm">
		<table>
    
     <tr height="3px"></tr>
    
	<tr height="60px">
		<td colspan="2" align="left">
			<input type="checkbox" name="chsave" style="margin-right: 5px;">
			<b style="font-size: 1.2em;">아이디 저장</b>
		</td>
	</tr>
    
    <tr height="8px"></tr>
    
	<tr height="50px">
		<td>
			<input type="text" name="user_id" class="form-control" style="width: 230px; height: 40px;"
			autofocus="autofocus" required="required" placeholder="Id">
		</td>
	</tr>
    
    <tr height="8px"></tr>
    
	<tr height="50px">
		<td>
			<input type="password" name="user_pass" class="form-control" style="width: 230px; height: 40px;"
			required="required" placeholder="PassWord">
		</td>
	</tr>
    
    <tr height="30px"></tr>
    
	<tr>
		<td colspan="2">
			<button type="submit" class="btn btn-warning" style="width: 230px;">로그인</button>
		</td>
	</tr>
	
	<tr height="15px"></tr>
    
	<tr>
		<td colspan="2">
			<button type="button" class="btn btn-warning" style="width: 230px;"
			onclick="location.href='index.jsp?main=login/member_form.jsp'">회원 가입</button>
		</td>
	</tr>
    
   </table>
 </form>
</div>

</body>
</html>