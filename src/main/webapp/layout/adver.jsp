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
<link rel="stylesheet" href="../css/adver.css">
<script>
	var index = 0; // 이미지에 접근하는 인덱스
	
	window.onload = function() {
		slide_show();
	}

	function slide_show() {
		var i;
		
		var x = document.getElementsByClassName("advers"); // adver에 대한 dom 참조
		
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none"; // 처음에 전부 display를 none으로 한다.
		}
		
		index++;
		
		if (index > x.length) {
			index = 1; // 인덱스가 초과되면 1로 변경
		}
		
		x[index - 1].style.display = "block"; // 해당 인덱스는 block으로
		setTimeout(slide_show, 3000); // 함수를 3초마다 호출
	}
</script>
<title>Advertisement</title>
</head>
<body onload="slide_show()">
	<img class="advers" src="image/adver_1.png">
	<img class="advers" src="image/adver_2.png">
  	<img class="advers" src="image/adver_3.png">
</body>
</html>