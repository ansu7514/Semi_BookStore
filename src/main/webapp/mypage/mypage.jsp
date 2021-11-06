<%@page import="db.UserDTO"%>
<%@page import="db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<!-- 전체 css -->
<link rel="stylesheet" href="css/mypage.css">
<!-- js -->
<link rel="stylesheet" href="JS/mypage.js">
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
			<h4 id="user_name"><b style="color : #55661c;">🏠 <%= user_dto.getUser_name() %></b>의 My Page</h4>
		</div>	
		
		<!-- 전체 화면 -->
		<div class="mypage_main">
			<!-- 메뉴 -->
			<div class="mypage_menu">
				<!-- 주문 관리 -->
				<table class="mypage_menu_table">
					<tr>
						<td id="table_name_td"><label id="table_name">📦 주문 관리</label></td>
					</tr>
					
					<tr>
						<td class="table_sub_td">
							<span class="table_sub" id="order_see">-  주문 배송 / 조회</span>
						</td>
					</tr>
					
					<tr>
						<td class="table_sub_td">
							<span class="table_sub" id="order_del">-  취소 / 교환 / 반품 조회</span>
						</td>
					</tr>
					
					<!-- 회원 정보 관리 -->
					<tr>
						<td id="table_name_td">
							<%
							String user_gender = user_dto.getGender();
							
							if(user_gender.equals("남자")) {
							%>
								<label id="table_name">🧑 회원 정보 관리</label>
							<%
							} else {
							%>
								<label id="table_name">👧 회원 정보 관리</label>
							<%
							}
							%>
						</td>
					</tr>
					
					<tr>
						<td class="table_sub_td">
							<span class="table_sub" id="my_mem_up">-  회원 정보 수정</span>
						</td>
					</tr>
					
					<tr>
						<td class="table_sub_td">
							<span class="table_sub" id="my_mem_del">-  회원 탈퇴</span>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 출력 화면 -->
			<div class="mypage_print">
				<script src="JS/mypage.js"></script>
				<embed id="show_menu" type="text/html" src="">
			</div>
		</div>
	</div>
</body>
</html>