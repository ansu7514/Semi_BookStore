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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">

</head>

<%
//1) db 선언
BookDAO dao=new BookDAO();
BookDTO Bdto=new BookDTO();
CartDAO db=new CartDAO();
%>

<!-- 가격 자릿수 콤마, 총가격 -->
<script type="text/javascript">
function tot(num,price,i) {
	var a=(String)(num*price);
	a=a.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	
	console.log(num);
	console.log(price);
	console.log(i);
	console.log(a);
	
	document.getElementById(i).innerText=a;
	
}

/* 체크 박스 */
window.onload = function(){
    for(var i = 0; i < document.getElementsByTagName('chk').length; i++){
        if(document.getElementsByTagName('chk')[i].getAttribute('chk') == 'checkbox'){
            document.getElementsByTagName('chk')[i].checked = true;
        }
    }
};
</script>
<body>


<%
String user_id=request.getParameter("user_id");

user_id="apple"; //검사용도


//	2) dao에서 list 가져오기
ArrayList<CartDTO>list=db.selectCart(user_id);  

//	돈 자릿수포맷
DecimalFormat df = new DecimalFormat("###,###"); 

/* 예시 */
int val = 34567;
System.out.println(df.format(val));
%>

<!-- 전체 div -->
<div class="wrapper">

<!-- 제목 div -->
<div class="title">
	<h2>장바구니
		<img src="cart_img.png" class="img">
	</h2>
	
<!-- 점선 -->
<hr>

</div>

<!-- 체크박스 , 상품명, 총가격, 수량, 삭제 th , 캡션 -->
<div class="tableone" id="orderF">
<table class="table table-bordered">
<caption class="title2">장바구니 목록</caption>
<tr>
	<th class="th1" width="10px">선택</th>
	<th class="th1" width="80px">상품명</th>
	<th class="th1" width="50px">총가격</th>
	<th class="th1" width="40px">수량</th>
	<th class="th1" width="30px">삭제</th>               
</tr>

<% 
for(int i=0; i<list.size(); i++){ 
	
	CartDTO dto=list.get(i); 
	Bdto=dao.getBook(dto.getBook_id());	
	
%>

	<tr>
		<!-- 체크박스 , 상품명, 총가격, 수량, 삭제 td -->
		<td>
			<input type="checkbox" name="chk" id="chk<%=(i) %>" value="<%=dto.getBook_id()%>"
			onclick="">
		</td>
		<td><%=Bdto.getBook_name() %></td>
		<td><span id="print_totP<%=(i) %>"><%=df.format(Bdto.getBookPrice() * dto.getEa()) %></span>원</td>
		<td>
			<input type="number" id="ea<%=(i) %>" style="width: 70px; height: 40px; text-align: center;" 
			min="1" value="<%=dto.getEa() %>" onchange="tot(this.value, <%=Bdto.getBookPrice()%>,'print_totP<%=(i)%>')">
		</td>
		
		<!-- 삭제 버튼 -->
		<td>
			<button type="submit" class="delbtn" 
      		 onclick="location.href=cart_delete.jsp?user_id=?<%=dto.getUser_id() %>&book_id=?<%=dto.getBook_id()%>'">
      		 삭제</button>
		</td>
	</tr>
	
<%}
%>
</table>

</div>

<%
/* String []chk=request.getParameterValues("chk"); */

/* 	if(chk==null || chk.length<=0)
	{
		 out.println("<script>alert(''선택한 항목이 없습니다.'');history.back();</script>");
		 return;
	}
	for(int i=0; i<chk.length; i++)
	{
		out.println(chk[i]);
	} */

%>


<!-- 선택상품주문, 이전 페이지 클릭하는 버튼 div -->
<div class="btndiv">
	<button type="submit" class="btn1">선택 상품 주문</button>&nbsp;&nbsp;
	
<!-- 이전 페이지는 클릭시 -> bookinfo로 보내는? -->
	<button type="button" class="btn2"
	onclick="location.href='../book/book_info.jsp'">이전 페이지</button>
</div>

</div>

</body>
</html>