<%@page import="java.text.DecimalFormat"%>
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
<link rel="stylesheet" href="css/pay_endform.css?after">
<title>pay_endform</title>
</head>
<%

String user_id = (String)session.getAttribute("myid");
String book_id = request.getParameter("book_id");
String ea = request.getParameter("ea");

OrderDAO dao=new OrderDAO();

String order_id=dao.getMaxnum();

ArrayList<OrderDTO> list=dao.orderSelectList(order_id);

DecimalFormat df = new DecimalFormat("###,###");

%>
<body>
	<div class="pay_end_wrapper">
	
	<table class="pay_end_table table-bordered">
			<caption>주문 완료
				<img src="image/pay_endform_img.png" class="pay_img">
			</caption>
			
<%
for(OrderDTO dto:list)
{
	%>
	 		<tr>
				<th class="pay_end_th">결제 정보</th>
				<td class="pay_info1"> <b class="b1">결제 방법-  </b> <b class="b2"><%=dto.getPay_method() %></b><br><!-- 결제 방법 -->
				<b class="b3">결제 가격-</b> <b class="b4"><%=df.format(dto.getBook_price() * dto.getEa()) %></b>원</td>	<!-- 결제 가격 -->
			</tr>
	 
	 		<tr>
	 			<th class="pay_end_th">배송 정보</th> 
	 			<td class="pay_info2"> <b class="b5">수령인-   </b> <%=dto.getRecipient() %><br><!-- 수령인 -->
	 			<b class="b6">배송지-  </b> <%=dto.getLocation() %></td>	<!-- 배송지 -->
	 		</tr>	
<%}

%>
		</table>
</div>
	
		<table class="pay_list">
		<!-- 구매내역 조회 -->
		<tr>
			<td colspan="2" align="center" class="listtd">
				<button type="button" class="listbtn"
				onclick="location.href='index.jsp?main=order/order_form.jsp?order_id=<%=order_id%>'">구매 내역 조회</button>
			</td>
		</tr>	
		</table>
</body>
</html>