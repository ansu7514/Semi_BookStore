<%@page import="db.UserDAO"%>
<%@page import="java.sql.Date"%>
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
	request.setCharacterEncoding("utf-8"); 
	
	//dto 선언, 불러오고 , 담기
	UserDTO dto=new UserDTO();
	
	String user_id=request.getParameter("user_id");
	String user_pass=request.getParameter("user_pass1");
	String user_name=request.getParameter("user_name");
	String gender=request.getParameter("gender");
	String birthday=request.getParameter("birthday1")+ "-" +
			request.getParameter("birthday2") + "-" +
			request.getParameter("birthday3");
	String addr=request.getParameter("addr");
	String hp=request.getParameter("hp");
	
	
	java.sql.Date birth = java.sql.Date.valueOf(birthday);
	
	/* out.println(user_id);
	out.println(user_pass);
	out.println(user_name);
	out.println(birth);
	out.println(gender);
	out.println(addr);
	out.println(hp); */
	
	dto.setUser_id(user_id);
	dto.setUser_pass(user_pass);
	dto.setUser_name(user_name);
	dto.setGender(gender);
	dto.setBirthday(birth);
	dto.setAddr(addr);
	dto.setHp(hp);
	
	//dao 선언, insert 불러오기
	UserDAO dao=new UserDAO();
	dao.insertUser(dto);
	
	//가입 완료 페이지로 이동하기 -> member_success
	response.sendRedirect("../index.jsp");	
	
%>
</body>
</html>