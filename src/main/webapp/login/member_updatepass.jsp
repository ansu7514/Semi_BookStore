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

</head>
<body>

<%-- <%
String num=request.getParameter("num");  <-id로 가져오기
String key=request.getParameter("key");

if(key==null) //form만 표시
{%>
	<div style="margin-left: 200px;">
	 <form action="member/updatepassform.jsp" method="post">
	   <input type="hidden" name="num" value="<%=num%>">
	   <input type="hidden" name="key" value="yes">
	   <b>수정시 필요한 비밀번호를 입력해주세요</b>
	   <br><br>
	   
	   <div class="form-inline">
	   <input type="password" name="pass" class="form-control" style="width: 120px;"
	   required="required" autofocus="autofocus">
	   
	   <button type="submit" class="btn btn-info">확인</button>
	   </div>
	 </form>
	</div>
	
<%}else //action처리
{
	//비번읽기
	String pass=request.getParameter("pass");
	
	//비번맞는지 체크
	MemberDao dao=new MemberDao();
	
	boolean b=dao.isPassEqual(num, pass);
	
	if(b)
	{
		response.sendRedirect("../index.jsp?main=member/updateform.jsp?num="+num);
	}else
	{%>
		<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
		history.back();
		</script>
	<%}
	
}

%> --%>

</body>
</html>