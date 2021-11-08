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
<link rel="stylesheet" href="css/review.css?after">
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

		<!-- 리뷰 & 댓글 -->
		<c:forEach items="${list }" var="dto">
			<!-- 리뷰 -->
			<div class="review-box">
					<div class="review-name-rating">
						<span class="review-name">${dto.user_id }</span>
						<div class="review-rate">
							<div class="rateyo jq-ry-container" style="padding:0px;margin:0px;display:inline" data-rateyo-read-only="true" ></div>
						</div>
						<span class="review-date">${dto.writeday }</span>
					</div>
					<div class="review-content">
						${dto.content }
					</div>
			</div>
		
			<!-- 댓글 -->
			<div class="comment">
				<div class="show-box">
					<span id="show-comment" class="show-comment">댓글보기</span>
				</div>
				
				<hr class="white-gray-hr">
				
				<!-- 여기서부터 돌리기 -->
				<div class="print-comments">
					<div class="comments">
						<span class="comment-name"></span>
						<span class="comment-date"></span>
					</div>
					<div class="comments-content">
						
					</div>
				</div>
				<!-- 여기까지 -->
				
				<div class="input-comment">
					<textarea id="comment-content" name="comment-content" placeholder="댓글을 입력해주세요"></textarea>
					<button id="submit-comment" class="submit-comment" onclick="return false">입력</button>
				</div>
			</div>
			
		</c:forEach>
		
		<!-- 별점 & 리뷰-->
		<div class="rating-box">`				
			<div class="rateyo-readonly-widg" style="padding:0;"></div>
			<div class="rating-value-box">0</div>
		</div>

		<script type="text/javascript" src="JS/jquery.min.js"></script>
		<script type="text/javascript" src="JS/jquery.rateyo.js"></script>	  
		<script src="JS/rating.js"></script>
		<script type="text/javascript">
			$(".rateyo").rateYo({rating:/* 점수넣기*/5 });
		</script>
		
		<hr class="white-gray-hr">
		
		<div class="input-review">
			<textarea name="review-content" id="review-content" placeholder="리뷰를 입력해주세요"></textarea>
			<button class="submit-review" id="submit-review" onclick="return false">입력</button>
		</div>

		<script src="JS/review.js?after"></script>
	</div>
</body>
</html>