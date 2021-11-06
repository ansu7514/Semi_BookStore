<%@page import="db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300;600;700&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: #FAF7EB !important;
	font-family: 'Noto Serif KR', serif;
	font-size: 18px;
}
</style>
</head>
<body>
	<%
	String myid = (String) session.getAttribute("myid");
	%>
	<div style="display: flex; justify-content: center;">
		<form action="member_deleteproc.jsp" method="post">
			<input type="hidden" name="user_id" value="<%= myid %>"> <input
				type="hidden" name="key" value="yes">
			
			<div style="margin-bottom: 20px; margin-left: 3%">
				<b>🔒 삭제할 아이디의 비밀번호를 입력해주세요 🔒</b>
			</div>
			
			<div class="form-inline" style="display: flex; justify-content: center;">
				<input type="password" name="user_pass" class="form-control"
					style="width: 400px;" required="required" autofocus="autofocus">
			</div>
			
			<div style="display: flex; justify-content: center; margin-top: 30px;">
				<button type="submit" class="btn btn-danger" style="width: 100px;">삭제하기</button>
			</div>
		</form>
	</div>
</body>
</html>