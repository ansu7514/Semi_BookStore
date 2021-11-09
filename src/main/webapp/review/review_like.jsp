<%@page import="db.HeartDAO"%>
<%@page import="db.HeartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String user_id = request.getParameter("user_id");
	int book_id = Integer.parseInt(request.getParameter("book_id"));
	
	HeartDTO dto = new HeartDTO();
	
	HeartDAO dao = new HeartDAO();
	
	int like = dao.getLike(dto);
	
	System.out.println(like);
	
	out.println(like);
%>