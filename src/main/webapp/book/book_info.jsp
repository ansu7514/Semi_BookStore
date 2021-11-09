<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link rel="stylesheet" href="css/book.css?after">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<!-- 별점 -->
<link rel="stylesheet" href="css/jquery.rateyo.min.css"/>

<%@ page import="java.text.DecimalFormat"%>

<title>Insert title here</title>
</head>
	<!-- 기본틀 -->

	<%
		request.setCharacterEncoding("utf-8");

		//파라미터값 가져오기 - book_id
		String book_id = request.getParameter("book_id");
		
		//파라미터값 가져오기 - user_id
		String myid = (String)session.getAttribute("myid");
	
		//DAO 객체선언
		BookDAO dao = new BookDAO();
	
		//해당 book_id에 해당하는 dto 가져오기
		BookDTO dto = dao.getBook(book_id);
		
		//돈 자릿수포맷
		DecimalFormat df = new DecimalFormat("###,###");
		
		double avg = dao.averageStar(book_id);
	%>
	

<script type="text/javascript">

	window.onload=function(){
		
		localStorage.setItem("user_id", "<%=(String)session.getAttribute("myid")%>");
		localStorage.setItem("book_id", <%=dto.getBook_id()%>);
		
		/* 실행시 상품 기본가격 출력 */
		var a = (String)($("#ea").val()*<%=dto.getBookPrice()%>);
		a = a.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
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
	$(function(){
		<!-------------------------->
		//리뷰
		$(".input-comment").hide();

		//댓글보기 버튼
		var triger = true;
		$(".show-comment").on("click",function(){
			if(triger){ //true
				$(".input-comment").show();
				triger = false;
			} else { //false
				$(".input-comment").hide();
				triger = true;
			}	
		});
	});
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
					<img src="image/book/<%=dto.getBook_name()%>.jpg" id="bookImg">
				</div>
			
			
				<div id="selInfo">
				
						<!-- 별점-얼마나 차있는지 위에 함수로 줘야함 -->
						<div calss="book-rate-box">
							<div id="book-rate" class="jq-ry-container" style="padding:0;" data-rateyo-read-only="true"></div>
						</div>
						<script type="text/javascript" src="JS/jquery.min.js"></script>
						<script type="text/javascript" src="JS/jquery.rateyo.js"></script>	  
		
						<script type="text/javascript">
							$("#book-rate").rateYo({rating: <%=avg%>});
						</script>
						
<!-- 						<div class="star-ratings-fill" id="star">
							<span class="star">⭐</span>
							<span class="star">⭐</span>
							<span class="star">⭐</span>
							<span class="star">⭐</span>
							<span class="star">⭐</span>
						</div> -->
					
						<div id="summary"></div>
						
						<div id="detail">
						
							판매가 :&nbsp; <%=df.format(dto.getBookPrice()) %> 원 <br>
							
							포인트 :&nbsp; <%=dto.getBookPrice()*2/100 %> point <br>
							
							재고량 :&nbsp; <%=dto.getEa() %> 권 <br>
							
							<!-- 재고가 수량보다 적어 음수가 될 경우, 구매불가 메시지 출력-->
							주문량 :&nbsp; <input type="number" name="ea" id="ea" style="width: 70px; height: 40px; text-align: center;" min="1" max="100" value="1" onchange="tot(this.value)"> 권 <br>
					
							총금액 :&nbsp; <font id="totP"></font> 원
						
						</div>	
		
							<!-- 장바구니, 바로구매 버튼 -->
		
						<div id="btns">
							<script type="text/javascript">
							function buyclick() {
								var myid = "<%= myid %>";
								
								if(myid == "null" || myid == ""){
									alert("로그인 후 결제가 가능합니다 😊");
								} else {
									location.href='index.jsp?main=payment/payform_direct.jsp?book_id=<%= dto.getBook_id() %>&ea=' + document.getElementById("ea").value;
								}
							}
							
							function cartclick() {
								var myid = "<%= myid %>";
								
								if(myid == "null" || myid == ""){
									alert("로그인 후 결제가 가능합니다 😊");
								} else {
									location.href='index.jsp?main=cart/cart_add.jsp?book_id=<%= dto.getBook_id() %>&ea=' + document.getElementById("ea").value;
								}
							}
							</script>
							
							
							<button id="buy" class="btns fourth" onclick="buyclick()" style="background-color: transparent;">바로구매</button>
							
							<button id="goCart" class="btns fourth" onclick="cartclick()" style="background-color: transparent; margin-left: 2%;">장바구니</button>
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
		
		<!-- 리뷰 -->
		<jsp:include page="../review/review.jsp">
			<jsp:param value="<%=book_id %>" name="book_id"/>
		</jsp:include>
		
	</div>
</body>
</html>
