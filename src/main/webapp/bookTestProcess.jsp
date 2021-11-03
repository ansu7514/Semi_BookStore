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
	
/* 	String bookName = request.getParameter("bookName");
	String bookImage= request.getParameter("bookImage");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String publisher = request.getParameter("publisher");
	String year = request.getParameter("year");
	int ea = Integer.parseInt(request.getParameter("ea"));
	int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
	String chapter = request.getParameter("chapter");
	String accum = request.getParameter("accum"); */
	
	String realPath=getServletContext().getRealPath("/image");
	System.out.println(realPath);
	
	int uploadSize = 1024*1024*5; //5mb;
	
	MultipartRequest multi = null;
	
	try{
		multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
	
		String bookName = multi.getParameter("bookName");
		String bookImage = multi.getFilesystemName("bookImage");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String publisher = multi.getParameter("publisher");
		Date year = Date.valueOf(multi.getParameter("year"));
		int ea = Integer.parseInt(multi.getParameter("ea"));
		int bookPrice = Integer.parseInt(multi.getParameter("bookPrice"));
		String chapter = multi.getParameter("chapter");
		int accum = Integer.parseInt(multi.getParameter("accum"));		
		
		BookDTO dto = new BookDTO();
		dto.setBookName(bookName);//책이름
		dto.setBookImage(bookImage); //책이미지
		dto.setWriter(writer);//저자
		dto.setContent(content);//내용
		dto.setPublisher(publisher);//출판사
		dto.setYear(year);//출간년도
		dto.setEa(ea);//권수
		dto.setBookPrice(bookPrice);//책가격
		dto.setChapter(chapter);//목차
		dto.setAccum(accum); //누적
		
		BookDAO dao = new BookDAO();
		dao.insertBook(dto);
		
		response.sendRedirect("bookTest.jsp");
	} catch(Exception e){
		e.printStackTrace();
	}
%>