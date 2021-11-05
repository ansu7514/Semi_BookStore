<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.text.NumberFormat"%>
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
<link rel="stylesheet" href="css/book.css?after">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">


<%@ page import="java.text.DecimalFormat"%>


<title>Insert title here</title>
</head>


	<!-- 기본틀 -->

	<%
	
		request.setCharacterEncoding("utf-8");

		//파라미터값 가져오기 - book_id
		String book_id = request.getParameter("book_id");
		
		//파라미터값 가져오기 - user_id
		String user_id = request.getParameter("user_id");
	
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
		
		slide_show();
		
		/* 실행시 상품 기본가격 출력 */
		var a = (String)($("#ea").val()*<%=dto.getBookPrice()%>);
		a = a.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		console.log(a);
		
		document.getElementById("totP").innerText= a;
		
		document.getElementById("totP").innerText=	a;
		
		
		/* 랜덤으로 문구 생성해서 배치하기 */
		/* 랜덤배치 */
		var mentArr = ["인생을 바꾸는 책 한 권의 선택",
					   "독서는 사랑에 빠지는 것과 같다",
					   "은하수 달님 별님 떨어지는 소리",
					   "소중한 이에게 따뜻한 책한권"];
		
		/* 랜덤 수 생성 */
		var rnd = parseInt(Math.random()*4);
		
		document.getElementById("summary").innerText= mentArr[rnd];
		
	}

	
	/* 별점 산정 함수(예비) */
	function ratingToPercent() {
	      const score = +this.restaurant.averageScore * 20;
	      return score + 1.5;
	 }
	
	
	
	/* 구매한 수량에 따른 총가격 출력 함수 - 돈 자릿수 콤마 */
	function tot(num){
		
		var a = (String)($("#ea").val()*<%=dto.getBookPrice()%>);
		a = a.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		console.log(a);
		
		document.getElementById("totP").innerText= a;
		
		
		/* '구매수량 > 재고'일 경우, 장바구니 & 구매버튼 비활성화 */
		if(num><%=dto.getEa()%>){
			document.getElementById("totP").innerText= "재고가 부족합니다";
			
			const target1 = document.getElementById('goCart');
			  target1.disabled = true;
			  
			const target2 = document.getElementById('buy');
			  target2.disabled = true;
		}
		
		
		/* '구매수량 < 재고'일 경우, 장바구니 & 구매버튼 다시 활성화 */
		if(num<=<%=dto.getEa()%>){
			
			const target1 = document.getElementById('goCart');
			  target1.disabled = false;
			  
			const target2 = document.getElementById('buy');
			  target2.disabled = false;
		}
	}	 
</script>	
	
<body style="background-color: #FAF7EB">

	<div id="wrapper">
	
		<div id="container">
		
			<div id="book_title">
				<!-- JSTL 문법을 사용해 위의 값 출력 -->
				<font class="title"><b><%=dto.getBook_name() %></b></font></p>
				
				
				<font class="subInfo"><b><%=dto.getWriter() %></b></font> &nbsp;		
				<font class="subInfo"><b><%=dto.getPublisher() %></b></font> &nbsp;
				<font class="subInfo"><b><%=dto.getYear() %></b></font>		
			
			</div>
				
			<hr id="top_hr">
			
			<div id="content">
		
				<div id="img">
					<!-- 검산용 -->
					<% System.out.println("image/book/"+dto.getBook_image()); %>
					<img src="image/book/<%=dto.getBook_name()%>.jpg" id="bookImg">
				</div>
			
			
				<div id="selInfo">
				
						<!-- 별점-얼마나 차있는지 위에 함수로 줘야함 -->
						<div class="star-ratings-fill" id="star">
							<span class="star">⭐</span>
							<span class="star">⭐</span>
							<span class="star">⭐</span>
							<span class="star">⭐</span>
							<span class="star">⭐</span>
						</div>
					
						<div id="summary"></div>
						
						<div id="detail">
						
							판매가 :&nbsp; <%=df.format(dto.getBookPrice()) %> 원 <br>
							
							포인트 :&nbsp; <%=dto.getBookPrice()/10 %> point <br>
							
							재고량 :&nbsp; <%=dto.getEa() %> 권 <br>
							
							<!-- 재고가 수량보다 적어 음수가 될 경우, 구매불가 메시지 출력-->
							주문량 :&nbsp; <input type="number" id="ea" style="width: 70px; height: 40px; text-align: center;" min="1" max="100" value="1" onchange="tot(this.value)"> 권 <br>
					
							총금액 :&nbsp; <font id="totP"></font> 원
						
						</div>	
		
							<!-- 장바구니, 바로구매 버튼 -->
		
						<div id="btns">
							<button id="buy" class="btn fourth" onclick="location.href=''">바로구매</button>
							<button id="goCart" class="btn fourth" onclick="location.href='book_to_cart.jsp'">장바구니</button>
						</div>
						
				</div>
			</div>
		
		</div>

		<!-- 책소개 -->
		<div id="book_content">

			<!-- 내용나누는 줄 -->
			<hr id="blur_hr1">	
			
			<div id="book_summary">책소개</div>
			
			<div id="book_summary_detail"><%=dto.getContent() %></div>
			
		</div>
		
		
		<!-- 책 목차 -->
		<div id="index">
			
			<!-- 내용나누는 줄 -->
			<hr id="blur_hr2">	
			
			<div id="book_index">목차</div>
			
			<div id="book_index_detail"><%=dto.getChapter() %></div>
			
		</div>
		
		<jsp:include page="../review/review.jsp"/>
	</div>
</body>
</html>
