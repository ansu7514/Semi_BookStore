<%@page import="db.ReviewDAO"%>
<%@page import="db.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String book_id = request.getParameter("book_id");
	String content = request.getParameter("content");
	double rating = Double.parseDouble(request.getParameter("rating"));
	String user_id = request.getParameter("user_id");
	
	ReviewDTO dto = new ReviewDTO();
	dto.setBook_id(book_id);
	dto.setContent(content);
	dto.setRating(rating);
	dto.setUser_id(user_id);
	
	ReviewDAO dao = new ReviewDAO();
	dao.writeReview(dto);
%>