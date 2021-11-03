<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 광고 link -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>
<script type="text/javascript">
	// $("#slideshow > div:gt(0)").hide();

	setInterval(function() {
		$('#slideshow > div:first').fadeOut(1000).next().fadeIn(1000).end()
				.appendTo('#slideshow');
	}, 3000);
</script>
</head>
<body>
	<div style="width: 100%">
		<!-- 메인 창 광고 -->
		<div class="main_ad" style="width: 70%">
			<div id="slideshow" style="width: 100%">
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
		<div class="login_box" style="width: 27%; float: left;">
			<jsp:include page="../login/login_form.jsp" />
		</div>

		<div class="best_seller" style="width: 100%;">
			<!-- 베스트 셀러 -->
			<h2 class="bk_list_title">베스트 셀러</h2>
			<h4 class="bk_list_title" style="color: #55661c">가을 책방 Top 4</h4>
			<br>

			<ul class="best_sell_list" style="width: 100%; height: 100%;">
				<li class="best_sell_book"><img alt="" src="image/test.jpg">
					<h4>
						<b>안녕하세요책1</b>
					</h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5></li>

				<li class="best_sell_book"><img alt="" src="image/test.jpg">
					<h4>
						<b>안녕하세요책1</b>
					</h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5></li>

				<li class="best_sell_book"><img alt="" src="image/test.jpg">
					<h4>
						<b>안녕하세요책1</b>
					</h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5></li>

				<li class="best_sell_book"><img alt="" src="image/test.jpg">
					<h4>
						<b>안녕하세요책1</b>
					</h4>
					<h5>저자 : 안수현 / 출판사 : sist</h5></li>
			</ul>
		</div>

		<div class="book_list" style="width: 100%;">
			<!-- 책 출력 위치 -->
			<h2 class="bk_list_title">가을 책방이 소개하는 책</h2>
			<h4 class="bk_list_title" style="color: #55661c">가을 책방과 함께하는 독서의
				습관</h4>
			<br>
			<div id="slideShow">
				<ul class="slides">
					<c:forEach var="i" begin="1" end="10">
						<li><img src="image/book/그냥 하지 말라.jpg"></li>
					</c:forEach>
				</ul>
				<p class="controller">
					<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
					<span class="prev">&lang;</span> <span class="next">&rang;</span>
				</p>
			</div>
			<script src="JS/slide_show.js"></script>
		</div>
		
		<div class="copyright" style="width: 50%">
			<h6>Copyright ⓒ 2021 by 가을 책방 All Pictures cannot be copied without permission.</h6>
		</div>
	</div>
</body>
</html>