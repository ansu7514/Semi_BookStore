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
<link rel="stylesheet" href="../css/title.css">
<title>title</title>
</head>
<body>
	<div id="title">
		<a href="<c:url value='/' />/index.jsp">
			<img id="title_img" alt="" src="<c:url value='/' />/image/title_book.png">
			<b id="title_text_1">가을</b>
			<b id="title_text_2"> 책방</b>
		</a>
	</div>
</body>
</html>