<%@page import="db.CartDTO"%>
<%@page import="db.CartDAO"%>
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
삭제
<%
//user_id , book_id 읽기
String user_id=(String)request.getParameter("user_id");
String book_id=(String)request.getParameter("book_id");

//dao선언
CartDAO dao=new CartDAO();

//dto선언
CartDTO dto=new CartDTO();

//삭제 메소드 호출
dao.deleteCart(dto);

//삭제후 다시 장바구니로 이동
response.sendRedirect("../index.jsp?main=cart/cart_page.jsp");
%>

</body>
</html>