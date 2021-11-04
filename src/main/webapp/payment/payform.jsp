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
<link rel="stylesheet" href="../css/payform.css?after">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Insert title here</title>
</head>
<body>

	<!-- 전체 div -->
	<div id="wrapper">
		<span id="title">주문결제</span>
		
		<hr id="top_hr">
		
		<!-- container -->
		<div id="container">
			<!-- 문구가 있으면 div가 문구를 보여주기 위해 밀려서 보인다 -->
			<!-- div container -->
			
			
			<!-- 배송정보 & 상품정보 -->
			<div id="left_info">
			
				<!-- 배송정보 div -->
				<div id="transport_info">
					
					<table id="transport_form">
						<caption class="captions">배송지 선택</caption>
						
							<tr></tr>
							<tr></tr>
						
					</table>	
				</div>
				
				
				<!-- 삼품정보 div -->
				<div id="product_info">
					div product_info<br>
					나는 내용입니다.<br>
					여기가 늘어나면 payment_info div도 늘어날까요?
				</div>			
			</div>
			
			
			<!-- 결제정보 div -->
			<div id="payment_info">
				div payment_info
			</div>	
					
		</div>
		
	</div>

</body>
</html>
