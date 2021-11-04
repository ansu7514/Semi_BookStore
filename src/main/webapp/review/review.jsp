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

<script type="text/javascript">
	$(".my-rating-4").starRating({
		  totalStars: 5,
		  starShape: 'rounded',
		  starSize: 40,
		  emptyColor: 'lightgray',
		  hoverColor: 'salmon',
		  activeColor: 'crimson',
		  useGradient: false
	});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="review">
	<div class="total">
		<div class="my-rating-4" data-rating="2.5"></div>
	</div>
</div>

</body>
</html>