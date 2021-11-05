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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300;600;700&display=swap" rel="stylesheet">
<style type="text/css">
	@import url("css/index.css");
	@import url("css/title.css");
	@import url("css/adver.css");
	@import url("css/main.css"); 
	@import url("css/copyright.css");
</style>
<style type="text/css">
* {
	font-family: 'Noto Serif KR', serif;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		setTimeout(function(){
			slide_show();
		},3000);
	}
</script>
<title>가을 책방</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	// 프로젝트 경로 구하기
	String root = request.getContextPath();
	
	// 기본 페이지
	String mainPage = "layout/main.jsp";
	
	// url을 통해서 main값을 읽어서 출력
	if(request.getParameter("main") != null) {
		mainPage = request.getParameter("main");
	}
	%>
	
	<div class="index">
		<!-- 타이틀 -->
		<jsp:include page="layout/title.jsp"/>
		
		<!-- 광고 -->
		<jsp:include page="layout/adver.jsp"/>
		
		<!-- 책들(내용) -->
		<jsp:include page="<%= mainPage %>"/>
		
		<!-- copyright -->
		<jsp:include page="layout/copyright.jsp"/>
	</div>
</body>
</html>