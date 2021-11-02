<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/adver.css">
<script type="text/javascript">
	window.onload = function() {
		slide_show();
	}
	
	var i = 1;
	
	function slide_show() {	
		if(i > 3)
			i = 1;
		
		document.getElementById("adver_img").src = "image/adver_" + i + ".png";
		
		setTimeout(slide_show, 3000); // 함수를 3초마다 호출
		i++;
	}
</script>
<title>Advertisement</title>
</head>
<body onload="slide_show()">
	<img id="adver_img" src="">
</body>
</html>