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
<link rel="stylesheet" href="css/index.css">
<style type="text/css">
@import url("css/title.css");
@import url("css/adver.css");
body {
	background-color: #FAF7EB;
}
</style>
<title>가을 책방</title>
</head>
<body>
	<%
	// 프로젝트 경로 구하기
	String root = request.getContextPath();
	
	// 기본 페이지
	String mainPage = "layout/main.jsp";
	
	// main 값 읽어서 출력
	if(request.getParameter("main") != null) {
		mainPage = request.getParameter("main");
	}
	%>
	
	<div class="layout title">
		<jsp:include page="layout/title.jsp"/>
	</div>
	
	<div class="layout adver">
		<jsp:include page="layout/adver.jsp"/>
	</div>
</body>
</html>