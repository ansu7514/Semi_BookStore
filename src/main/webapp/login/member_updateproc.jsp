<%@page import="db.UserDAO"%>
<%@page import="db.UserDTO"%>
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
//인코딩 , /사용자id,사용자이름,비밀번호,생년월일,주소,전화번호/ 받아오기
//dto선언 , 이후에 dto에 담기
request.setCharacterEncoding("utf-8"); 
	
	String user_id=request.getParameter("user_id");
	String user_pass=request.getParameter("user_pass1");
	String user_name=request.getParameter("user_name");
	String addr=request.getParameter("addr");
	String birthday=request.getParameter("birthday1")+ "-" +
			request.getParameter("birthday2") + "-" +
			request.getParameter("birthday3");
	String hp=request.getParameter("hp");
	
	java.sql.Date birth = java.sql.Date.valueOf(birthday);
	
	UserDTO dto=new UserDTO();
	
	out.println(user_id);
	out.println(user_pass);
	out.println(user_name);
	out.println(addr);
	out.println(birth);
	out.println(hp);
	
	dto.setUser_id(user_id);
	dto.setUser_pass(user_pass);
	dto.setUser_name(user_name);
	dto.setAddr(addr);
	dto.setBirthday(birth);
	dto.setHp(hp);

//dao선언 , dao 의 update 작성한 부분 (dto) 가져오기
UserDAO dao=new UserDAO();
dao.updateUser(dto);

//response -> 회원정보 설정화면으로 이동하기 : member_updateform ?으로 ??
/* response.sendRedirect("../index.jsp?main=login/member_updateform.jsp"); */
%>
</body>
</html>