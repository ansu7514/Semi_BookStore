<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 별점 -->
<link rel="stylesheet" href="css/jquery.rateyo.min.css"/>

<!-- 리뷰 -->
<link rel="stylesheet" href="css/review.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
   <div class="review">
      <!-- 별점 및 리뷰-->
      <div class="rating-box">
		  <div class="rateyo-readonly-widg" style="padding:0;"></div>
		  <div class="rating-value-box">0</div>
	  </div>
	  
	  <script type="text/javascript" src="JS/jquery.min.js"></script>
	  <script type="text/javascript" src="JS/jquery.rateyo.js"></script>	  
	  
	  <script src="JS/rating.js"></script>
	  
      <div class="input-review">
         <textarea name="review-content" placeholder="리뷰를 입력해주세요"></textarea>
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
      <script>
		
		//리뷰작성
		$(document).on("click", ".submit-review", function(){
			
/* 			//공백체크
			if($('#comment-content').val() == ""){
				return;
			} */
			
			console.log($(".rating-value-box").text);
			
			var user_id = "apple";//localStorage.getItem("user_id");
			var book_id = localStorage.getItem("book_id");
			var rating = $(".rating-value-box").text;
			var content = $('#comment-content').text;
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			
					
			var review = {
				book_id : book_id,
				content : content,
				rating : rating,
				user_id : user_id
			};
			
			console.log(review.content);
			console.log(review.book_id);
			console.log(review.rating);
			console.log(review.user_id);
			
			$.ajax({
				url:"review/reviewAction.jsp",
				type:"post",
				dataType:"html",
				data:{
					"book_id" : review.book_id,
					"content" : review.content,
					"rating" : review.rating,
					"user_id" : review.user_id
				},
				success:function(){
					location.reload();
				}
			});
		});
		
      </script>
      <!-- <script src="JS/review.js?after"></script> -->
   </div>
</body>
</html>