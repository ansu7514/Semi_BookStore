<%@page import="db.HeartDAO"%>
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
	String user_id = (String)session.getAttribute("myid");

	String book_id = request.getParameter("book_id");
	ReviewDAO dao = new ReviewDAO();
	ArrayList<ReviewDTO> list = dao.readReview(book_id);
	request.setAttribute("list", list); //값 등록
	
	HeartDAO heart_dao = new HeartDAO();
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
					
					<div class="heart_div">
						<span class="glyphicon glyphicon-heart" id="heart_tag" style="color: red; margin-top: 18px;"></span>
						<span id="heart_tag" style="margin-top: 15px;" onclick="getLike('<%= user_id %>', '${dto.user_id }', ${dto.book_id })">Likes</span>
						<span class="review-like" style="margin-left: 10px;"></span>			
					</div>
					
					<script type="text/javascript">
						// 좋아요 체크
						function getLike(user_id, re_user_id, book_id) {
							$.ajax({
								url:"review/review_like.jsp",
								type:"post",
								dataType:"html",
								data:{
									"user_id" : user_id,
									"re_user_id" : re_user_id,
									"book_id" : book_id
								},
								success:function(e){
									$(".review-like").text(e);
								}
							});
						}
					</script>
					
					<span class="review-date">${dto.writeday }</span>
				</div>
				<div class="review-content">
					${dto.content }
				</div>
				<div class="show-box">
					<span id="show-comment" class="show-comment" onclick="showCon(this)" triger="false" book_id="${dto.book_id }" re_user_id="${dto.user_id }">댓글보기</span>
				</div>
			</div>
			
			<!-- 댓글 -->
			<div class="comment" id="re_user_id:${dto.user_id }">
				<div class="print-comments"></div>
				
				<div class="input-comment1" style="display: flex;">
					<textarea id="comment-content" name="comment-content" placeholder="댓글을 입력해주세요"></textarea>
					<button id="submit-comment" class="submit-comment" onclick="return false">입력</button>
				</div>
			</div>
			
			<script type="text/javascript" src="JS/jquery.min.js"></script>
			<script type="text/javascript" src="JS/jquery.rateyo.js"></script>	  
			<script src="JS/rating.js"></script>
			
			<%
			ReviewDAO re_dao = new ReviewDAO();
			
			ArrayList<ReviewDTO> re_list = dao.readReview(book_id);
			
			for(int i = 0; i < re_list.size(); i++) {
				ReviewDTO re_dto = re_list.get(i);
			%>
			
			<script type="text/javascript">
				$(".rateyo").rateYo({rating: <%= re_dto.getRating() %> });			
			</script>
				
			<%
			}
			%>
			
			
		</c:forEach>
		
		<!-- 별점 & 리뷰-->
		<div class="rating-box">			
			<div class="rateyo-readonly-widg" style="padding:0;"></div>
			<div class="rating-value-box">0</div>
		</div>

		<script type="text/javascript" src="JS/jquery.min.js"></script>
		<script type="text/javascript" src="JS/jquery.rateyo.js"></script>	  
		<script src="JS/rating.js"></script>
		
		<hr class="white-gray-hr">
		
			<div class="input-review">
				<textarea name="review-content" id="review-content" placeholder="리뷰를 입력해주세요"></textarea>
				<button class="submit-review" id="submit-review" onclick="return false">입력</button>
			</div>
		<script src="JS/review.js"></script>
		<script src="JS/comment.js"></script>
	</div>
</body>
</html>