<%@page import="db.CartDAO"%>
<%@page import="db.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	
	response.sendRedirect("index.jsp?main=cart/cart_page.jsp");
%>
