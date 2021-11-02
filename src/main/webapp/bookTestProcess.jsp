<%@page import="java.sql.Date"%>
<%@page import="db.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String bookName = request.getParameter("bookName");
	String bookImage= request.getParameter("bookImage");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String publisher = request.getParameter("publisher");
	String year = request.getParameter("year");
	int ea = Integer.parseInt(request.getParameter("ea"));
	int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
	String chapter = request.getParameter("chapter");
	String accum = request.getParameter("accum");
	
	byte[] byteArray = bookImage.getBytes();
	String bBookImage = byteArray
	
	BookDTO dto = new BookDTO(bookName, bookImage, writer, content, publisher, year, ea, bookPrice, chapter, accum);
	
%>