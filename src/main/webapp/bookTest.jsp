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

<title>Insert title here</title>
</head>
<body>
<form action="bookTestProcess.jsp" method="post">
	책이름	<input type="text" name="book_name">
	책이미지	<input type="file" name="book_image">
	저자	<input type="text" name="writer">
	내용	<input type="text" name="content">
	출판사	<input type="text" name="publisher">
	출판일	<input type="datetime" name="year">
	남은갯수	<input type="text" name="ea">
	가격	<input type="text" name="book_price">
	목차	<input type="text" name="chapter">
	누적판매량	<input type="text" name="accum">
</form>
</body>
</html>