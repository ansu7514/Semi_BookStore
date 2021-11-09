<%@page import="db.OrderDAO"%>
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
	String location = request.getParameter("addr1") + " " + request.getParameter("addr2");
	int book_price = Integer.parseInt(request.getParameter("book_price"));
	int ea = Integer.parseInt(request.getParameter("ea"));
	String pay_method = request.getParameter("pay_radio");
	int use_point = Integer.parseInt(request.getParameter("usepoint"));
	
	dto.setUser_id(user_id);
	dto.setBook_id(book_id);
	dto.setRecipient(recipient);
	dto.setLocation(location);
	dto.setBook_price(book_price);
	dto.setEa(ea);
	dto.setPay_method(pay_method);
	dto.setUse_point(use_point);
	
	OrderDAO dao = new OrderDAO();
	dao.insertOrder(dto);
	
	response.sendRedirect("../index.jsp?main=payment/pay_endform.jsp");
%>
</body>
</html>