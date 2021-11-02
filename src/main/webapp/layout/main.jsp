<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript">
	window.onload = function() {
		slide_bigad();
	}
	
	var big = 0;
	
	function slide_bigad() {	
		if(big > 4)
			big = 0;
		
		document.getElementById("bigad_img").src = "image/bigad_" + big + ".png";
		
		setTimeout(slide_bigad, 3000); // 함수를 3초마다 호출
		big++;
	}
</script>
<title>Main</title>
</head>
<body onload="slide_bigad()" class="form-inline">
	<div style="float: left;">
		<img id="bigad_img" src="">
	</div>
	
	<div class="login_box">
		<div class="lgin_form">
			<jsp:include page="../login/login_form.jsp"/>
		</div>
	</div>
</body>
</html>