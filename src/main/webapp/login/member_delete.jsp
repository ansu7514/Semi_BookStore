<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

<%--  <!-- dao에서 만든 비번체크,삭제 메서드를 가져와서 처리 -->
  <%
  String num=request.getParameter("num"); <-id로 처리할거임
  String pass=request.getParameter("pass");
  
  //dao선언
  MemberDao dao=new MemberDao();
  
  //비번체크후 맞을경우 삭제 틀릴경우 경고후 이전으로 가기
  boolean b=dao.isPassEqual(num, pass);
  
  if(b)
  {
          dao.deleteMember(num);                   경로는 회원정보 설정으로 이동하기
          response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
  }else
  {%>
          <script type="text/javascript">
          alert("비밀번호가 틀립니다");
          history.back();
          </script>
  <%}
  
  %> --%>

</body>
</html>