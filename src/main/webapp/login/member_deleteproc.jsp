<%@page import="db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	String myid = (String) session.getAttribute("myid");
	String key = request.getParameter("key");

	//비번읽기
	String user_pass = request.getParameter("user_pass");

	//비번맞는지 체크
	UserDAO dao = new UserDAO();

	boolean b = dao.isPassEqual(myid, user_pass);

	if (b) {
		dao.deleteUser(myid);

		response.sendRedirect("../login/member_delete_end.jsp");
		
		// 로그아웃
		session.removeAttribute("myid");
		session.invalidate();
	} else {
	%>
	<script type="text/javascript">
		alert("❌ 비밀번호가 틀렸습니다. ❌");
		history.back();
	</script>
	<%
	}
	%>

</body>
</html>