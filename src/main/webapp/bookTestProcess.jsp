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
	
	int uploadSize=1024*1024*2; //2mb
	MultipartRequest multi=null;
	
	String realPath=getServletContext().getRealPath("/image/book");

	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
				new DefaultFileRenamePolicy());
	 	String bookName = multi.getParameter("bookName");
		String content = multi.getParameter("content");
		String chapter = multi.getParameter("chapter");
		String book_image = multi.getFilesystemName("bookImage"); //실제업로드된 파일명	
		String writer = multi.getParameter("writer");
		String publisher = multi.getParameter("publisher");
		Date year = Date.valueOf(multi.getParameter("year"));
		int ea =Integer.parseInt(multi.getParameter("ea"));
		int bookPrice = Integer.parseInt(multi.getParameter("bookPrice"));
		int accum = Integer.parseInt(multi.getParameter("accum"));
		
		out.println(book_image);
		
		BookDTO dto = new BookDTO();
		dto.setBook_name(bookName);//책이름
		dto.setContent(content);//내용
		dto.setChapter(chapter);//목차
		dto.setBook_image(book_image);
		dto.setWriter(writer);//목차
		dto.setPublisher(publisher);//목차
		dto.setYear(year);
		dto.setEa(ea);
		dto.setBookPrice(bookPrice);
		dto.setAccum(accum);
		
		BookDAO dao = new BookDAO();
		dao.insertBook(dto);
		
		response.sendRedirect("bookTest.jsp");
	} catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
%>