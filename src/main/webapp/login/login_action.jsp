<%@page import="db.UserDAO"%>
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

</head>
<body>

<%
String user_id=request.getParameter("user_id");
String user_pass=request.getParameter("user_pass");
String chsave=request.getParameter("chsave"); //체크 안하면 null

//dao 선언
UserDAO dao=new UserDAO();

//id,pass
boolean b=dao.isPassEqual(user_id, user_pass);

if(b)
{
	//1) id,pass 일치하면 위 세개 세션 저장하고 이동시키기
	//2) 로그인 성공시 loginok,yes
	//3) Remember Me 체크할시 myid,user_id
	//4) 체크값 saveok,yes
	//5) 세션유지시간은 생략 -> 30분 기본
	session.setAttribute("loginok", "yes");
	session.setAttribute("myid", user_id);
	session.setAttribute("saveok", chsave==null?null:"yes");
	
	//로그인 성공시 -> 로그인된 메인화면으로 이동하기
	response.sendRedirect("../index.jsp?login/logout_form.jsp");
}else
{%>
	<script type="text/javascript">
	alert("⚠ 아이디 또는 비밀번호가 일치하지 않습니다. ⚠");
	history.back();
	</script>
<%}
%>


</body>
</html>