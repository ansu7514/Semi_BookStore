<%@page import="java.util.ArrayList"%>
<%@page import="db.OrderDAO"%>
<%@page import="db.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/pay_endform.css">
<title>pay_endform</title>
</head>
<%

String user_id = (String)session.getAttribute("myid");
String book_id = request.getParameter("book_id");
String ea = request.getParameter("ea");

OrderDAO dao=new OrderDAO();

String order_id=dao.getMaxnum();

ArrayList<OrderDTO> list=dao.orderSelectList(order_id);

%>
<body>
	<div class="pay_end_wrapper">
		<table class="pay_end_table table-bordered">
			<caption>주문 완료</caption>
			<tr>
				<th class="pay_end_th">결제 정보</th>
			</tr>
			<tr>
				<th class="pay_end_th">결제 방법</th>
			</tr>
			<tr>
				<th class="pay_end_th">결제 가격</th>
			</tr>
			<tr>
				<th class="pay_end_th">수령인</th>
			</tr>
			<tr>
				<th class="pay_end_th">배송지</th>
			</tr>
			
<%
for(OrderDTO dto:list)
{
	
}

%>
			
		</table>
	</div>
</body>
</html>