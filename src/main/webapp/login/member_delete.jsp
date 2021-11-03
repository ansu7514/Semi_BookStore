<%@page import="db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

</head>
<body>

<%
String user_id=request.getParameter("user_id");  
String key=request.getParameter("key");

if(key==null)
{%>
<div style="margin-left: 500px;">
	<form action="member_delete.jsp" method="post">
		<input type="hidden" name="user_id" value="<%=user_id%>">
		<input type="hidden" name="key" value="yes">
	<b>탈퇴시 필요한 비밀번호를 입력해주세요</b>
	<br><br>
	   
<div class="form-inline" style="margin-left: 10px;">
		<input type="password" name="user_pass" class="form-control" style="width: 100px;"
		required="required" autofocus="autofocus">
		
		&nbsp;&nbsp;
		<button type="submit" class="btn btn-delfault" style="width: 100px;">탈퇴하기</button>
</div>
</form>
</div>
	
<%}else //action처리
{
	//비번읽기
	String user_pass=request.getParameter("user_pass");
	
	//비번맞는지 체크
	UserDAO dao=new UserDAO();
	
	boolean b=dao.isPassEqual(user_id, user_pass);
	
	if(b)
	{
		dao.deleteUser(user_id);
		//response.sendRedirect("");
	}else
	{%>
		<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.back();
		</script>
	<%}
	
}

%>

</body>
</html>