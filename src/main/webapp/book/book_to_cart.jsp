<%@page import="db.CartDAO"%>
<%@page import="db.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Insert title here</title>
</head>
<body>

	<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//dto 에 담기
	CartDTO dto=new CartDTO();
	
	String user_id=request.getParameter("user_id");
	String book_id=request.getParameter("book_id");
	int ea=Integer.parseInt(request.getParameter("ea"));
	
	dto.setUser_id(user_id);
	dto.setBook_id(book_id);
	dto.setEa(ea);
	
	//dao 선언하고 insert 불러오기
	CartDAO dao=new CartDAO();
	dao.insertCart(dto);
	
	//페이지 이동 : 장바구니담기 버튼이 눌렸을때 여기서 처리하고 cart_page(list)로 이동
	response.sendRedirect("../index.jsp?main=cart/cart_page.jsp");
%>

</body>
</html>
