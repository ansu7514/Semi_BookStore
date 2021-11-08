<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.ReviewDAO"%>
<%@page import="db.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 별점 -->
<link rel="stylesheet" href="css/jquery.rateyo.min.css"/>

<!-- 리뷰 -->
<link rel="stylesheet" href="css/review.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<%
	String book_id = request.getParameter("book_id");
	ReviewDAO dao = new ReviewDAO();
	ArrayList<ReviewDTO> list = dao.readReview(book_id);
	request.setAttribute("list", list); //값 등록
%>
</head>
<body>
	<div class="review">

		<!-- 리뷰 출력 -->
		<div class="review-box">
			<c:forEach var="dto" items="${list }">
				${dto.book_id }
			</c:forEach>
		</div>
		
		<!-- 별점 및 리뷰-->
		<div class="rating-box">
			<div class="rateyo-readonly-widg" style="padding:0;"></div>
			<div class="rating-value-box">0</div>
		</div>

		<script type="text/javascript" src="JS/jquery.min.js"></script>
		<script type="text/javascript" src="JS/jquery.rateyo.js"></script>	  
		  
		<script src="JS/rating.js"></script>
	  
		<div class="input-review">
			<textarea name="review-content" id="review-content" placeholder="리뷰를 입력해주세요"></textarea>
			<button class="submit-review" id="submit-review" onclick="return false">입력</button>
		</div>
      
		<!-- 댓글 -->
		<div class="comment">
			<div class="show-box">
				<span id="show-comment" class="show-comment">댓글보기</span>
			</div>
		      	
			<div class="input-comment">
				<textarea id="comment-content" name="comment-content" placeholder="댓글을 입력해주세요"></textarea>
				<button id="submit-comment" class="submit-comment" onclick="return false">입력</button>
			</div>
		</div>
		<script src="JS/review.js?after"></script>
	</div>
</body>
</html>