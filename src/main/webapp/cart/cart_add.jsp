<%@page import="db.CartDAO"%>
<%@page import="db.CartDTO"%>
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
	request.setCharacterEncoding("utf-8");

	//dto 에 담기
	CartDTO dto=new CartDTO();
	
	String user_id = (String)session.getAttribute("myid");
	String book_id=request.getParameter("book_id");
	int ea=Integer.parseInt(request.getParameter("ea"));
	
	dto.setUser_id(user_id);
	dto.setBook_id(book_id);
	dto.setEa(ea);
	
	//dao 선언하고 insert 불러오기
	CartDAO dao=new CartDAO();
	dao.insertCart(dto);
%>
<script>
location.href='index.jsp?main=cart/cart_page.jsp?user_id=<%= user_id %>';
</script>
</body>
</html>