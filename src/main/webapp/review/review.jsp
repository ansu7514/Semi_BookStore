<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 리뷰 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/star-rating-svg.css">
<link rel="stylesheet" type="text/css" href="css/review.css">
<script src="JS/review.js"></script>

</head>
<body>
   <div class="review">
      <div class="my-rating-4"></div>
      <div class="input-review">
         <textarea name="review-content" placeholder="리뷰를 입력해주세요"></textarea>
         <button class="submit-review" id="submit-review" onclick="return false">입력</button>
      </div>
   </div>
</body>
</html>