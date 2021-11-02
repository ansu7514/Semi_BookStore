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
// Remember Me(아이디 저장 체크)
// 세션값 얻어오기
String saveok=(String)session.getAttribute("saveok");
String myid="";

if(saveok!=null)
	myid=(String)session.getAttribute("myid");
%>

</head>

<body>

<div style="margin-left: 100px;">
	<form action="login_action.jsp" method="post" class="form-inline" name="frm">
		<table class="table table-bordered" style="width: 250px;">
    
	<tr>
		<td colspan="2" align="left">
			<input type="checkbox" name="chsave">Remember Me
		</td>
	</tr>
    
    
	<tr>
		<th width="100" bgcolor="#C8AB42">아이디
			<span class="glyphicon glyphicon-user"></span>
		</th>
		<td>
			<input type="text" name="id" class="form-control" style="width: 120px;"
			autofocus="autofocus" required="required" placeholder="Id">
		</td>
	</tr>
    
    
	<tr>
		<th width="100" bgcolor="#C8AB42">비밀번호
			<span class="glyphicon glyphicon-lock"></span>
		</th>
		<td>
			<input type="password" name="pass" class="form-control" style="width: 120px;"
			required="required" placeholder="PassWord">
		</td>
	</tr>
    
    
	<tr>
		<td colspan="2" align="center">
			<button type="submit" class="btn btn-default" style="width: 100px;">LogIn</button>
		</td>
	</tr>
    
   </table>
 </form>
</div>

</body>
</html>