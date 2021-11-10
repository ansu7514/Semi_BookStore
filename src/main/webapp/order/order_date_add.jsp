<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.OrderDAO"%>
<%@page import="db.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%
		request.setCharacterEncoding("utf-8");
	
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		BookDAO Bdao = new BookDAO();
		BookDTO Bdto = new BookDTO();
		
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
		
		
		
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();
		
		for(int i=0; i<date_list.size(); i++){
			JSONObject sObj = new JSONObject();
			sObj.put("book_name", Bdao.getBook(date_list.get(i).getBook_id()).getBook_name()); //책이름
			sObj.put("book_ea", date_list.get(i).getEa()); //매수
			sObj.put("book_price", date_list.get(i).getBook_price()); //가격
			sObj.put("book_recipient", date_list.get(i).getRecipient()); //수령인
			sObj.put("book_location", date_list.get(i).getLocation()); //배송지
			sObj.put("book_pay_day", sdf.format(date_list.get(i).getPayDay())); //결제일
			sObj.put("book_pay_method", date_list.get(i).getPay_method()); //결제방법
			
			
			
			array.add(sObj);
		}
		
		
		/* 해당되는 order_id값 조회 */
		System.out.println(start);
		System.out.println(end);
		System.out.println(date_list.size());
		
		
		obj.put("list", array);
		out.println(obj.toString());
	%>
