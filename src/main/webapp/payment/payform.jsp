<%@page import="java.text.DecimalFormat"%>
<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.CartDAO"%>
<%@page import="db.CartDTO"%>
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
<link rel="stylesheet" href="../css/payform.css?after">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bx 슬라이더용 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<title>Insert title here</title>

	<!-- bx 슬라이더용 추가 -->
	<!-- 가능하면 나중에 js로 따로 만들어서 뺄것 -->
	<script>
	
		$(document).ready(function(){
		
			$('.slider').bxSlider();
			
		    $('.bxslider').bxSlider({ // 클래스명 주의!

		        auto: false, // 자동으로 애니메이션 시작

		        speed: 500,  // 애니메이션 속도

		        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)

		        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)

		        autoControls: true, // 시작 및 중지버튼 보여짐

		        pager: true, // 페이지 표시 보여짐

		        captions: true, // 이미지 위에 텍스트를 넣을 수 있음

		    });
		
		});
	
	</script>


</head>

	<%
	
		/* 리스트값 출력 - 카트에 있는 값을 출력하기위한 DAO선언 */
		CartDAO Cdao = new CartDAO(); 

		/* 이제 카트에 있는걸 가져와서 이미지 등을 출력하면 됩니다. - DAO 수정전*/
		CartDTO Cdto = new CartDTO();
	
		/* CartDb에서 데이터를 출력하기 위해 user_id값 받아오기 */
		String user_id = request.getParameter("user_id");
		
		/* 임시값 */
		user_id= "apple";
				
		/* user_id에 따른 Cart 정보를 받을 list를 선언합니다. */
		ArrayList<CartDTO> cart_list = Cdao.selectCart(user_id);
		
		/* 책이름과 가격, 이미지를 받아오기 위한 BookDAO, BookDTO 선언 */
		BookDAO Bdao = new BookDAO();
		BookDTO Bdto = new BookDTO();
		
		
		/* 금액에 , 표시를 할 포맷 선언 */
		DecimalFormat df = new DecimalFormat("###,###");
		
		/* 이제 div prouct_info로 이동합니다 */
	%>

<body>

	<!-- 전체 div -->
	<div id="wrapper">
		<span id="title">주문결제</span>
		
		<hr id="top_hr">
		
		<!-- container -->
		<div id="container">
			<!-- 문구가 있으면 div가 문구를 보여주기 위해 밀려서 보인다 -->
			<!-- div container -->
			
			
			<!-- 배송정보 & 상품정보 -->
			<div id="left_info">
			
				<!-- 배송정보 div -->
				<div id="transport_info">
					
					<!-- 배송지 선택 테이블 -->
					<table class="table table-hover" id="transport_form">
						<caption class="captions">배송지 선택</caption>
							<tr>
								<th colspan="2" style="text-align: left;">회원정보와 동일 &nbsp;<input type="checkbox"></th>
								<td></td>
							</tr>
						
							<tr>
								<th>주문자 정보</th>
								<td><input type="text" id="orderer"></td>
							</tr>
							
							<tr>
								<th>주소</th>
								<td><input type="text" id="addr"></td>
							</tr>

							<tr>
								<th>연락처</th>
								<td>
									<input type="text" id="hp1" class="hp">&nbsp;-&nbsp;
									<input type="text" id="hp2" class="hp">&nbsp;-&nbsp;
									<input type="text" id="hp3" class="hp">
								</td>
							</tr>
					</table>	
				</div>
				
				
				<!-- 삼품정보 div -->
				<div id="product_info">
				
					<h4 class="captions">주문 정보</h4>
					
						<!-- bxSlider 조건에 맞춰 class명 부여 -->
						<div id="slider">
						
							<ul class="bxslider">
							
								<!-- list이기 때문에 for문 출력을 합니다 -->
								<%
									for(int i=0; i < cart_list.size(); i++){
										
										/* 각 i값마다 list에서 dto 가져옴 */
										Cdto = cart_list.get(i);
										
										/* book_id를 통해 BookDao에서 상세정보를 받을 DTO선언 */
										Bdto = Bdao.getBook(Cdto.getBook_id());
										
										/* 검산용 - book id check */
										System.out.println("책id(book_id): "+ Cdto.getBook_id());
										
										/* 검산용 - 갯수 ea check */
										System.out.println("주문수량(ea): "+ Cdto.getEa());
									
										/* 검산용 - CartDAO에서 뽑아온 book_id를 통해 BookDAO에서 값 가져옴 */
										/* 위에서 이미 book_id를 통해서 Bdto값을 선언해줬음 */
										System.out.println("책이름(book_name): " + Bdto.getBook_name());
										System.out.println("책이미지(book_image): " + Bdto.getBook_image());
										
										/* 총금액은 갯수 곱하기 책가격의 포맷형식 */
										System.out.println("총가격(book_price): " + df.format(Bdto.getBookPrice()*Cdto.getEa()));
			
										%>
										
										<!-- 회전판에 책 img 목록들 추가 -->
										<li class="img_div">
											<h5 class="img_name"><%=Bdto.getBook_name() %></h5>
											<img class="img" src="../image/book/<%=Bdto.getBook_image()%>">
											<h6 class="totP_ea"><%=df.format(Bdto.getBookPrice()*Cdto.getEa()) %>원 &nbsp;/ &nbsp;<%=Cdto.getEa() %>개</h6>
										</li>
										
									<%}
								%>
							
							</ul>
						</div>
					</div>			
				</div>
			
			
			<!-- 결제정보 div -->
			<div id="payment_info">
				div payment_info
			</div>	
					
		</div>
		
	</div>

</body>
</html>
