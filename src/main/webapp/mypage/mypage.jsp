<%@page import="db.UserDTO"%>
<%@page import="db.UserDAO"%>
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
<!-- 전체 css -->
<link rel="stylesheet" href="css/mypage.css">
<title>My page</title>
</head>
<%
//id 읽어오기
String myid = (String)session.getAttribute("myid");

UserDAO user_dao = new UserDAO();
UserDTO user_dto = user_dao.getUser(myid);
%>
<body>
	<div class="mypage_wrapper">
		<!-- 타이틀 -->
		<div class="mypage_title">
			<h4 id="user_name">🏠 <b><%= user_dto.getUser_name() %></b>의 My Page</h4>
		</div>	
		
		<!-- 전체 화면 -->
		<div class="mypage_main">
			<!-- 메뉴 -->
			<div class="mypage_menu">
				<!-- 주문 관리 -->
				<table class="mypage_menu_table">
					<tr>
						<td><a href=""><label id="table_name">📦 주문 관리</label></a></td>
					</tr>
					
					<tr>
						<td>
							<a href="">-  주문 배송 / 조회</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<a href="">-  취소 / 교환 / 반품 조회</a>
						</td>
					</tr>
					
					<!-- 회원 정보 관리 -->
					<tr>
						<td>
							<a href="">
								<%
								if(user_dto.getGender().equals("남자")) {
								%>
									<label id="table_name">🧑 회원 정보 관리</label>
								<%
								} else {
								%>
									<label id="table_name">👧 회원 정보 관리</label>
								<%
								}
								%>
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<a href="">-  회원 정보 수정 / 탈퇴</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>