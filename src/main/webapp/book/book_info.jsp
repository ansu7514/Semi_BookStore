<%@page import="java.text.NumberFormat"%>
<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="../css/book.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<!-- 숫자포맷사용 -->
<%@ page import="java.text.*"%>

<title>Insert title here</title>
</head>


	<!-- 기본틀 -->

	<%
	
		//파라미터값 가져오기
		String book_id = request.getParameter("book_id");
		
		book_id="1";
	
		//DAO 객체선언
		BookDAO dao = new BookDAO();
	
		//해당 book_id에 해당하는 dto 가져오기
		BookDTO dto = dao.getBook(book_id);
		
		
		//돈 자릿수포맷
		DecimalFormat df = new DecimalFormat("###,###");
		/* 예시 */
		int val = 1234567;
		System.out.println(df.format(val));
		
	%>
	

<script type="text/javascript">

	window.onload=function(){
		
		document.getElementById("totP").innerText=	<%=dto.getBook_price()%>;
	}


	function ratingToPercent() {
	      const score = +this.restaurant.averageScore * 20;
	      return score + 1.5;
	 }
	
	
	function tot(num){
		
		
		document.getElementById("totP").innerText= num*<%=dto.getBook_price()%>;
	}	 

</script>	
	


<body>

	<div id="book_title" style="width: 800px;">
		<!-- JSTL 문법을 사용해 위의 값 출력 -->
		<font class="title"><b><%=dto.getBook_name() %></b></font></p>
		
		
		<font class="subInfo"><b><%=dto.getWriter() %></b></font> &nbsp;		
		<font class="subInfo"><b><%=dto.getPublisher() %></b></font> &nbsp;
		<font class="subInfo"><b><%=dto.getYear() %></b></font>		
	</div>
	
	<hr class="hr">
	
	
	<div>
		<!-- 검산용 -->
		<% System.out.println(dto.getBook_image()); %>
		<img src="<%=dto.getBook_image()%>" id="book_img">
	</div>
	
	<!-- 별점-얼마나 차있는지 위에 함수로 줘야함 -->
	<div class="star-ratings-fill space-x-2 text-lg" id="star"
	 style="{width: ratingToPercent +'%'}">
		<span class="star">★</span>
		<span class="star">★</span>
		<span class="star">★</span>
		<span class="star">★</span>
		<span class="star">★</span>
	</div>
	
	<div id="detail">
		<font>판매가: </font><%=df.format(dto.getBook_price()) %> 원 <br>
		<font>적립 포인트: </font><%=dto.getBook_price()/10 %> pt <br>
		<font>재고: </font><%=dto.getEa() %> 권 <br>
		
		<!-- 재고가 수량보다 적어 음수가 될 경우, 구매불가 메시지 출력-->
		<font>수량: <input type="number" id="ea" style="text-align: center;" min="1" max="100" value="1" onchange="tot(this.value)"> 권</font> <br>

		<font>총금액: </font> <font id="totP"></font>
		
		<br>

		<!-- 장바구니, 바로구매 버튼 -->
		<button type="button" class="btn btn-info" onclick="location.href=''">장바구니 담기</button>
		<button type="button" class="btn btn-danger" onclick="location.href=''">바로구매</button>
		
		<!-- 인풋 버튼 크게보이게 CSS에서 해결-->
		
		<!-- db에서 가지고 올때 3자리마다 돈 크기에 .붙이기 -->
		
	</div>

</body>
</html>
