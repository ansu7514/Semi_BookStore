<%@page import="db.HeartDAO"%>
<%@page import="db.HeartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	HeartDTO dto = new HeartDTO();

	String user_id = request.getParameter("user_id");
	String re_user_id = request.getParameter("re_user_id");
	String book_id = request.getParameter("book_id");
	
	HeartDAO dao = new HeartDAO();
	
	dto.setLike_user_id(user_id);
	dto.setRe_user_id(re_user_id);
	dto.setBook_id(book_id);
	
	dao.like(dto);
	
	out.println(dao.getLike(dto));
%>