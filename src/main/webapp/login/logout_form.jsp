<%@page import="db.UserDTO"%>
<%@page import="db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<%
//id 읽어오기
String myid=(String)session.getAttribute("myid");

UserDAO user_dao = new UserDAO();
UserDTO user_dto = user_dao.getUser(myid);
%>
</head>
<body>
	<div class="logpout_form" style="padding-left: 7%; padding-top: 30px; padding-right: 4%;">
		<table style="width: 100%; height: 100%">
			<tr>
				<td width="68%"><h3><b>📙 <%= user_dto.getUser_name() %> 📙</b>님</h3></td>
				<td width="32%">
					<button type="button" class="btn btn-warning" style="margin-top: 10px;"
					onclick="location.href='login/logout_action.jsp'">로그아웃</button>
				</td>
			</tr>
			
			<tr height="35px"></tr>
			
			<tr>
				<td colspan="2">
					<ul style="display: flex; justify-content: center; padding:0px;">
						<li style="float: left; cursor: pointer;">
							<a href="index.jsp?main=mypage/mypage.jsp?my_id=<%= user_dto.getUser_id() %>" style="color: #55661c; font-size: 16pt;"><b>🙌 내 정보</b></a>
						</li>
					</ul>
				</td>
			</tr>
			
			<tr height="10px"></tr>
			
			<tr>
				<td colspan="2">
					<ul style="display: flex; justify-content: center; padding:0px;">
						<li style="float: left; margin-right: 5%; cursor: pointer;">
							<a href="" style="color: #55661c; font-size: 16pt;"><b>🧾 구매 내역</b></a>
						</li>
						
						<li style="float: left; margin-right: 3%; cursor: pointer;">
							<a href="index.jsp?main=cart/cart_page.jsp?my_id=<%= user_dto.getUser_id() %>" style="color: #55661c; font-size: 16pt;"><b>🛒 장바구니</b></a>
						</li>
					</ul>
				</td>
			</tr>
			
			<tr height="35px"></tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<b style="font-size: 20px;">🍁 Autumn Points 🍁</b>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<h4 style="color: #6d3b1c;">
						<b style="font-size: 20pt; color: #55661c;"><%= user_dto.getPoint() %></b>
						<b>Points</b>
					</h4>
				</td>
			</tr>
			
			<tr height="20px"></tr>
		</table>
	</div>
</body>
</html>