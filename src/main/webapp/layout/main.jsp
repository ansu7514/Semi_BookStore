<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Main</title>
<script type="text/javascript">
	// $("#slideshow > div:gt(0)").hide();

	setInterval(function() {
		$('#slideshow > div:first').fadeOut(1000).next().fadeIn(1000).end().appendTo('#slideshow');
	}, 3000);
</script>
</head>
<body class="form-inline">
	<!-- 메인 창 광고 -->
	<div style="float: left;">
		<div id="slideshow">
			<div>
				<img src="image/bigad_0.png" width="760px">
			</div>
			
			<div>
				<img src="image/bigad_1.png" width="760px">
			</div>
			
			<div>
				<img src="image/bigad_2.png" width="760px">
			</div>
			
			<div>
				<img src="image/bigad_3.png" width="760px">
			</div>
			
			<div>
				<img src="image/bigad_4.png" width="760px">
			</div>
		</div>
	</div>

	<!-- 로그인 화면 include -->
	<div class="login_box">
		<div class="lgin_form">
			<jsp:include page="../login/login_form.jsp" />
		</div>

		<img id="main_leaves" src="image/title_leaves.png">
	</div>

	<div class="book_list">
		<!-- 베스트 셀러 -->
		<h2 id="bk_list_title">베스트 셀러</h2>
		<h4 id="bk_list_title" style="color: #55661c">가을 책방 Top 4</h4>
		<br>
		
		<div id="best_seller">
			<ul class="best_sell_list">
				<li class="best_sell_book">
					<img alt="" src="test/flower.jpg">
					<h4><b>안녕하세요책1</b></h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5>
				</li>
				
				<li class="best_sell_book">
					<img alt="" src="test/flower.jpg">
					<h4><b>안녕하세요책1</b></h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5>
				</li>
				
				<li class="best_sell_book">
					<img alt="" src="test/flower.jpg">
					<h4><b>안녕하세요책1</b></h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5>
				</li>
				
				<li class="best_sell_book">
					<img alt="" src="test/flower.jpg">
					<h4><b>안녕하세요책1</b></h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5>
				</li>
			</ul>
		</div>
		
		<!-- 총 책 리스트 출력 -->
		<h2 id="bk_list_title">가을 책방이 소개하는 책</h2>
		<h4 id="bk_list_title" style="color: #55661c">가을 책방과 함께하는 독서의 습관</h4>
		<br>
		<div>
			
		</div>
	</div>
</body>
</html>