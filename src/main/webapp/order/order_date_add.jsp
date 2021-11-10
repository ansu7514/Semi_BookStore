<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.OrderDAO"%>
<%@page import="db.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		ArrayList<OrderDTO> date_list = new ArrayList<OrderDTO>();
		
		String user_id = (String)session.getAttribute("myid");
	
		String start = request.getParameter("input_start");
	
		String end = request.getParameter("input_end");
	
		
		/* String to Date */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		/* cannot convert from java.util.date to java.sql.date */
		/* java.sql.Date start_input = new java.sql.Date(sdf.parse(start).getTime());
		java.sql.Date end_input = new java.sql.Date(sdf.parse(end).getTime()); */
		
		date_list = dao.orderDateList(user_id, start, end);
		
		/* 해당되는 order_id값 조회 */
		System.out.println(start);
		System.out.println(end);
		System.out.println(date_list.size());
		
	%>

</body>
</html>
