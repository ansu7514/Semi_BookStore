<%@page import="db.UserDAO"%>
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
	String myid = (String)session.getAttribute("myid");
	String key = request.getParameter("key");

	if (key == null) {
	%>
	<div style="display: flex; justify-content: center;">
		<form action="member_updatepass.jsp" method="post">
			<input type="hidden" name="user_id" value="<%= myid %>"> <input
				type="hidden" name="key" value="yes">
			
			<div style="margin-bottom: 20px; margin-left: 3%">
				<b>🔒 수정시 필요한 비밀번호를 입력해주세요 🔒</b>
			</div>
			
			<div class="form-inline" style="display: flex; justify-content: center;">
				<input type="password" name="user_pass" class="form-control"
					style="width: 400px;" required="required" autofocus="autofocus">
			</div>
			
			<div style="display: flex; justify-content: center; margin-top: 30px;">
				<button type="submit" class="btn btn-warning" style="width: 100px;">수정하기</button>
			</div>
		</form>
	</div>

	<%
	} else //action처리
	{
	//비번읽기
	String user_pass = request.getParameter("user_pass");

	//비번맞는지 체크
	UserDAO dao = new UserDAO();

	boolean b = dao.isPassEqual(myid, user_pass);

	if (b) {
		response.sendRedirect("../login/member_updateform.jsp?user_id="+myid);
	} else {
	%>
	<script type="text/javascript">
		alert("❌ 비밀번호가 틀렸습니다 ❌");
		history.back();
	</script>
	<%
	}

	}
	%>

</body>
</html>