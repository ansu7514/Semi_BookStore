<%@page import="db.OrderDTO"%>
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
	request.setCharacterEncoding("utf-8");
	
	OrderDTO dto = new OrderDTO();
	
	String user_id = (String)session.getAttribute("myid");
	String book_id = request.getParameter("book_id");
	String recipient = request.getParameter("name");
	String location = request.getParameter("add1") + " " + request.getParameter("add2");
	Integer book_price = Integer.parseInt(request.getParameter("book_price"));
%>
</body>
</html>