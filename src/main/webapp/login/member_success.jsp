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
<%	//id읽어오기

	String user_id=request.getParameter("user_id");
	
	//dao선언
	
	UserDAO dao=new UserDAO();
%> 
</head>
<body>
<div style="border: 2px dotted #55661C; width: 300px; height: 100px;">
	<br> 
	<b style="font-size: 9pt; padding: 60px;">< 회원 가입이 완료 되었습니다 ></b>
	
	<br><br>
	
	<!-- 회원가입이 완료되었을 경우 , 로그인 버튼을 누를 시 메인페이지로 이동해 로그인하기 -->
	<button type="button" style="background-color: #55661C; width: 90px; margin-left: 100px;"
	onclick="location.href=''">로그인</button>
	 
</div>
</body>
</html>