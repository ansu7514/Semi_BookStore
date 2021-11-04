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
<title>title</title>
</head>
<body>
	<div class="title_de">
		<div class="title_text">
			<a id="title_de" href="<c:url value='/' />index.jsp">
				<div class="title_text_de">
					<img id="title_book" alt="" src="<c:url value='/' />/image/title_book.png">
					<b id="title_text_1">가을</b>
					<b id="title_text_2"> 책방</b>
					<img id="title_leaves" alt="" src="<c:url value='/' />/image/title_leaves.png">	
				</div>
				
			</a>
		</div>
	</div>
</body>
</html>