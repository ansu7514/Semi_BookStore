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
<title>Main</title>
<script type="text/javascript">
	$("#slideshow > div:gt(0)").hide();

	setInterval(function() {
		$('#slideshow > div:first').fadeOut(1000).next().fadeIn(1000).end().appendTo('#slideshow');
	}, 3000);
</script>
</head>
<body class="form-inline">
	<div style="float: left;">
		<div id="slideshow">
			<div id="bigad">
				<img src="image/bigad_0.png" width="760px">
			</div>
			
			<div id="bigad">
				<img src="image/bigad_1.png" width="760px">
			</div>
			
			<div id="bigad">
				<img src="image/bigad_2.png" width="760px">
			</div>
			
			<div id="bigad">
				<img src="image/bigad_3.png" width="760px">
			</div>
			
			<div id="bigad">
				<img src="image/bigad_4.png" width="760px">
			</div>
		</div>
	</div>

	<div class="login_box">
		<div class="lgin_form">
			<jsp:include page="../login/login_form.jsp" />
		</div>

		<img id="main_leaves" src="image/title_leaves.png">
	</div>

	<div class="book_list"></div>
</body>
</html>