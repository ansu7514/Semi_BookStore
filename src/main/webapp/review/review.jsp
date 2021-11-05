<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 별점 -->

<!-- 리뷰 -->
<link rel="stylesheet" href="css/review.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="JS/review.js"></script>

</head>
<body>
   <div class="review">
      <!-- 별점 및 리뷰-->
	  
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
			<textarea name="comment-content" placeholder="댓글을 입력해주세요"></textarea>
			<button class="submit-comment" id="submit-comment" onclick="return false">입력</button>
		</div>
      </div>
      
   </div>
</body>
</html>