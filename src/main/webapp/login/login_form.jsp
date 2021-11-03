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

<div style="width:200px; margin: 10% 0px 14% 8%;">
	<form action="login_action.jsp" method="post" name="frm"">
		<table class="">
    
     <tr height="3px"></tr>
    
	<tr height="80px">
	
		<td colspan="2" align="left">
			<input type="checkbox" name="chsave" style="margin-right: 5px; margin-left: 20px;">
			<b style="font-size: 1.2em;">아이디 저장</b>
		</td>
	</tr>
    
    <tr height="10px"></tr>
    
	<tr height="50px">
		<td>
			<input type="text" name="id" class="form-control" style="width: 230px; height: 40px; margin-left: 20px;"
			autofocus="autofocus" required="required" placeholder="Id">
		</td>
	</tr>
    
    <tr height="10px"></tr>
    
	<tr height="50px">
		<td>
			<input type="password" name="pass" class="form-control" style="width: 230px; height: 40px; margin-left: 20px;"
			required="required" placeholder="PassWord">
		</td>
	</tr>
    
    <tr height="30px"></tr>
    
	<tr>
		<td colspan="2" style="padding-left: 20px;">
			<button type="submit" class="btn btn-warning" style="width: 230px;">로그인</button>
		</td>
	</tr>
    
   </table>
 </form>
</div>

</body>
</html>