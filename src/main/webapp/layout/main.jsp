<%@page import="db.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<%
BookDAO dao = new BookDAO();

ArrayList<BookDTO> bk_list = dao.getAllBook();
ArrayList<BookDTO> best_list = dao.getBestSeller();

String loginok = (String)session.getAttribute("loginok");
%>
</head>
<body>
	<!-- 광고, 로그인 -->
	<div class="main_login">
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
			<%
			if(loginok == "yes") {
			%>
				<jsp:include page="../login/logout_form.jsp" />
			<%
			} else {
			%>
				<jsp:include page="../login/login_form.jsp" />
			<%
			}
			%>
		</div>
	</div>
	
	<!-- 베스트셀러 -->
	<div class="best_seller">
		<h2 class="bk_list_title">🍁 베스트 셀러</h2>
		<h4 class="bk_list_title" style="color: #55661c; margin-left: 4.4%;">가을 책방 Top 4</h4>

		<div class="best_sell_list">
			<ul>
				<%
				for(int i = 0; i < 4; i++) {
					BookDTO bk_dto = best_list.get(i);
				%>
				<div class="best_sell_book">
					<li>
						<a href="index.jsp?main=book/book_info.jsp?book_id=<%= bk_dto.getBook_id() %>">
							<img src="image/book/<%= bk_dto.getBook_image() %>">
						</a>
						
						<div style="width: 180px;">
							<h4><a href="index.jsp?main=book/book_info.jsp?book_id=<%= bk_dto.getBook_id() %>">
								<b><%= bk_dto.getBook_name() %></b>
							</a></h4>
							<h5><a href="index.jsp?main=book/book_info.jsp?book_id=<%= bk_dto.getBook_id() %>">저자 : <%= bk_dto.getWriter() %><br>출판사 : <%= bk_dto.getPublisher() %></a></h5>
						</div>
					</li>
				</div>
				<%
				}
				%>
			</ul>
		</div>
	</div>
	
	<!-- 전체 책 스크롤 리스트 -->
		<div class="book_list" style="width: 100%;">
			<!-- 책 출력 위치 -->
			<h2 class="bk_list_title">🍂 가을 책방이 소개하는 책</h2>
			<h4 class="bk_list_title" style="color: #55661c; margin-left: 4.5%;">가을 책방과 함께하는 독서의
				습관</h4>
			<br>
			<div id="slideShow">
				<ul class="slides">
					<%
					for(int i = 0; i < 10; i++) {
						BookDTO bk_dto = bk_list.get(i);
					%>
						<li>
							<a href="index.jsp?main=book/book_info.jsp?book_id=<%= bk_dto.getBook_id() %>">
								<img class="book_list_de" src="image/book/<%= bk_dto.getBook_image() %>">
							</a>
						</li>
					<%
					}
					%>
				</ul>
				<p class="controller">
					<!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
					<span class="prev">&lang;</span>
					<span class="next">&rang;</span>
				</p>
			</div>
			<script src="JS/slide_show.js"></script>
		</div>
</body>
</html>