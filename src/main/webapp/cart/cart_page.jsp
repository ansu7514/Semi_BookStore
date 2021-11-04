<%@page import="java.text.DecimalFormat"%>
<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.CartDTO"%>
<%@page import="db.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="cart_style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
</head>
<body>



<%
String user_id=request.getParameter("user_id");

user_id="apple"; //검사용도

//	1) db 선언
BookDAO dao=new BookDAO();
BookDTO Bdto=new BookDTO();
CartDAO db=new CartDAO();

//	2) dao에서 list 가져오기
ArrayList<CartDTO>list=db.selectCart(user_id);  

//	돈 자릿수포맷
DecimalFormat df = new DecimalFormat("###,###");
/* 예시 */
int val = 34567;
System.out.println(df.format(val));
%>



<div class="title">
<h2 class="text" style="margin-left: 580px; padding-top: 40px;">장바구니</h2>
</div>

<table class="table table-bordered" style="width: 800px; margin-left: 250px; height: 100px;">
<caption>장바구니 목록</caption>
<tr>
	<th width="10px">선택</th>
	<th width="80px">상품명</th>
	<th width="50px">총가격</th>
	<th width="40px">수량</th>
	<th width="30px">주문/삭제</th>               
</tr>
<%
for(int i=0; i<list.size(); i++){ 
	
	CartDTO dto=list.get(i); 
	Bdto=dao.getBook(dto.getBook_id());
	
	
	%>

	<tr style="text-align: center;">
		<td>
		<input type="checkbox" name="rowcheck" value="">
		</td>
		<td><%=Bdto.getBook_name() %></td>
		<td><%=df.format((Bdto.getBookPrice() * dto.getEa())) %></td> 
		<td>
		<input type="number" id="ea" style="width: 70px; height: 40px; text-align: center;" 
		min="1" value="<%=dto.getEa() %>">
		</td>
		<td>
		<button type="button" class="btn btn-warning btn-xs"
		onclick="location.href=''">주문</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-warning btn-xs" 
       onclick="location.href='cart_delete.jsp?user_id=?<%=dto.getUser_id() %>&book_id=?<%=dto.getBook_id()%>'">
       삭제</button>
		</td>
	</tr>
	
<%}
%>
</table>

<!-- <div style="margin-left: 750px;">
	<b style="">결제 예정 금액 :</b>
</div> --><br>

<table class="table table-bordered" style="width: 300px; margin-left: 750px;">

	<tr>
	<td align="center">
		<a href="">선택 상품 주문</a> <!-- 결체페이지로 이동 -->
	</td>
	</tr>
	
	<tr>
	<td align="center">
		<a href="index.jsp?main=book/book_info">이전 페이지</a> <!-- 제품상세로 이동 -->
	</td>
	</tr>
</table>

</body>
</html>