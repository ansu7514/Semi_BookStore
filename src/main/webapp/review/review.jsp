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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="../JS/jquery.star-rating-svg.js"></script>
<link rel="stylesheet" type="text/css" href="../css/star-rating-svg.css">
<link rel="stylesheet" type="text/css" href="../css/review.css">

<script type="text/javascript">
$(function(){
	var a = true;
	if(a){
		$(".my-rating-4").starRating({
			totalStars: 5,
			starShape: 'rounded',
			starSize: 40,
			emptyColor: 'lightgray',
			hoverColor: 'crimson',
			activeColor: 'crimson',
			useGradient: false
		});
	} else {
		$(".my-rating-4").starRating('unload');
	}
	
	$(".my-rating-4").on("click",function(){
		if(a){
			a = false;
		} else {
			a = true;
		}
	});
});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="review">
	<form id="frm-review">
		<div class="my-rating-4"></div>
		<div class="input-review">
			<textarea placeholder="리뷰를 입력해주세요"></textarea>
			<button id="submit-review">입력</button>
		</div>
	</form>
</div>
</body>
</html>