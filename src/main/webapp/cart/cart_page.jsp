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
<link rel="stylesheet" href="../css/cart.css">
<link href="cart_style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script type="text/javascript">
/* 그냥 체크여부 한번 테스트해봄  */
/* $(document).ready(function(){
    $("#rowcheck").change(function(){
        if($("#rowcheck").is(":checked")){
            alert("체크 되었음");
        }else{
            alert("해제 되었음");
        }
    });
}); */
</script>

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
<h2>장바구니</h2>
<hr>
</div>

<table class="one">
<caption>장바구니 목록</caption>
<tr>
	<th width="10px">선택</th>
	<th width="80px">상품명</th>
	<th width="50px">총가격</th>
	<th width="40px">수량</th>
	<th width="30px">삭제</th>               
</tr>

<% 
for(int i=0; i<list.size(); i++){ 
	
	CartDTO dto=list.get(i); 
	Bdto=dao.getBook(dto.getBook_id());	
	
%>

	<tr>
		<td>
		<input type="checkbox" name="rowcheck" value=""
		onclick="">
		</td>
		<td><%=Bdto.getBook_name() %></td>
		<td><%=df.format((Bdto.getBookPrice() * dto.getEa())) %>원</td>
		<td>
		<input type="number" id="ea" style="width: 70px; height: 40px; text-align: center;" 
		min="1" value="<%=dto.getEa() %>">
		</td>
		<td>
		<button type="button" class="btn btn-warning btn-xs" 
       onclick="location.href='cart_delete.jsp?user_id=?<%=dto.getUser_id() %>&book_id=?<%=dto.getBook_id()%>'">
       삭제</button>
		</td>
	</tr>
	
<%}
%>

</table>

<table class="two">

	<tr>
		<td>
		<button type="submit" class="btn btn-warning">선택 상품 주문</button>
		</td>
	</tr>
	
	<tr>
		<td>
		<button type="submit" class="btn btn-warning">이전 페이지</button>
		</td>
	</tr>
	
</table>

</body>
</html>