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
<script type="text/javascript">
$(function(){
	$("#frm").click(function(){
		var content = $('#content').val();
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#content").val(content);
		
		var chapter = $('#chapter').val();
		chapter = chapter.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#chapter").val(chapter);
		
		$("#btn").submit();
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="bookTestProcess.jsp" method="post" id="frm" enctype="multipart/form-data">
		책이름	<input type="text" name="bookName"><br>
		책이미지	<input type="file" name="bookImage"><br>
		저자	<input type="text" name="writer"><br>
		내용	<textarea id="content" name="content" cols="10" rows="10" style="width: 300px;"></textarea><br>
		출판사	<input type="text" name="publisher"><br>
		출판일	<input type="date" name="year"><br>
		남은갯수	<input type="text" name="ea"><br>
		가격	<input type="text" name="bookPrice"><br>
		목차	<textarea id="chapter" name="chapter" cols="10" rows="10" style="width: 300px;"></textarea><br>
		누적판매량	<input type="text" name="accum"><br>
		<button id="btn">입력</button>
	</form>
	
	<div id="con"></div>
</body>
</html>