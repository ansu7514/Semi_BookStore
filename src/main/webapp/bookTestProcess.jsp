<%@page import="java.io.File"%>
<%@page import="db.BookDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Date"%>
<%@page import="db.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
 	String bookName = request.getParameter("bookName");
	String content = request.getParameter("content");
	String chapter = request.getParameter("chapter");
		
	BookDTO dto = new BookDTO();
	dto.setBook_name(bookName);//책이름
	dto.setContent(content);//내용
	dto.setChapter(chapter);//목차
	
	BookDAO dao = new BookDAO();
	dao.updateBook(dto);
	
	response.sendRedirect("bookTest.jsp");

%>