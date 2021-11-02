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
		책이름	<input type="text" name="bookName"><br>
		책이미지	<input type="file" name="bookImage"><br>
		저자	<input type="text" name="writer"><br>
		내용	<input type="text" name="content"><br>
		출판사	<input type="text" name="publisher"><br>
		출판일	<input type="date" name="year"><br>
		남은갯수	<input type="text" name="ea"><br>
		가격	<input type="text" name="bookPrice"><br>
		목차	<input type="text" name="chapter"><br>
		누적판매량	<input type="text" name="accum"><br>
		<input type="submit" value="입력">
	</form>
</body>
</html>