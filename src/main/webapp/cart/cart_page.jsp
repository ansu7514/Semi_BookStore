<%@page import="java.text.DecimalFormat"%>
<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.CartDTO"%>
<%@page import="db.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script type="text/javascript">

	
</script>
</head>

<%
	String user_id = (String)session.getAttribute("myid");
	
	CartDAO cart = new CartDAO();
	ArrayList<CartDTO> list = cart.selectCart(user_id);
	request.setAttribute("list", list);
	
	DecimalFormat df = new DecimalFormat("###,###");
%>

<!-- 가격 자릿수 콤마, 총가격 -->
<script type="text/javascript">
	function tot(num,price,book_id) {
		var a=(String)(num*price);
		a=a.replace(/\B(?=(\d{3})+(?!\d))/g,",");
		
		$("#"+book_id).text(a);
	}

/* 배열 저장을 위한 객체선언 */
var row_book_id = new Array();
var row_book_ea = new Array();
var row_book_price = new Array();

document.getElementById("btn1").click(function(){
	$("input:checkbox[id=chk]:checked").each(function(){
		
		var book_id= $(this).attr("book_id");
		var book_ea= $(this).attr("ea");
		var book_price= $(this).attr("row_book_price");
		/* 
			*** 제이슨으로 배열 넘기기 ***
			1. 배열을 선언하고 배열안에 checkbox 선택에 따른 값추가
			2. 정리된 배열을 제이슨 형태로 변환하여 로컬저장소에 입력
			3. 출력, 검산을 위해 2차례의 변환
		*/
		
		/* 배열에 우선적으로 저장 */
		/* book_id, book_ea값 배열에 추가 */
		row_book_id.push(book_id);
		row_book_ea.push(book_ea);
		row_book_price.push(book_price);
	});
	
	/* 로컬스토리지에 배열을 JSON 오브젝트로 값 저장 */
	localStorage.setItem("book_id", JSON.stringify(row_book_id));
	localStorage.setItem("book_ea", JSON.stringify(row_book_ea));
	localStorage.setItem("book_price", JSON.stringify(row_book_price));
	}
})
</script>
<body>



<script type="text/javascript">

	function del_data(user_id,book_id) {
		
		$.ajax({
			type:"post",
			dataType:"html",
			url:"cart/cart_delete.jsp",
			data:{"user_id":user_id, "book_id":book_id},
			success:function(){
				location.reload();
			}
		});
	}

</script>
	<!-- 전체 div -->
	<div class="wrapper">

		<!-- 제목 div -->
		<div class="cart_title">
			<h2 id="cart_title_de">
				<b style="padding-top: 15px;">장바구니</b>
				<img src="image/cart_img.png" class="img">
			</h2>

			<!-- 점선 -->
			<hr>

		</div>

		<!-- 체크박스 , 상품명, 총가격, 수량, 삭제 th , 캡션 -->
		<div class="tableone">
			<table id="cart_table" class="table table-bordered" style="border: 3px solid #CCCC66;">
				<tr>
					<th class="th1" width="10px">선택</th>
					<th class="th1" width="80px">상품명</th>
					<th class="th1" width="50px">총가격</th>
					<th class="th1" width="40px">수량</th>
					<th class="th1" width="30px">삭제</th>
				</tr>

				<c:forEach items="${list }" var="dto">
					<tr>
						<!-- 체크박스 , 상품명, 총가격, 수량, 삭제 td -->
						<td>
							<input type="checkbox" name="chk" book_id="${dto.book_id }" ea="${dto.ea }" book_price="${dto.book_price }" style="padding-top: 50px;">
						</td>
						
						<td>${dto.book_name }</td>
						
						<td>
							<fmt:formatNumber var="fmt" groupingUsed="true" value="${dto.book_price*dto.ea }"/>
							<span id="${dto.book_id }"><c:out value="${fmt }"/></span>원
						</td>
						
						<td>
							<input type="number" class="ea" min="1" value="${dto.ea }" onchange="tot(this.value,${dto.book_price },${dto.book_id })">
						</td>
	
						<!-- 삭제 버튼 -->
						<td>
							<button class="delbtn" id="del" onclick="del_data('${dto.user_id }','${dto.book_id }%>')">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		
		<!-- 선택상품주문, 이전 페이지 클릭하는 버튼 div -->
		<div class="btndiv">
			<button type="button" id="btn1" class="btn1" onclick="location.href='index.jsp?main=payment/payform.jsp'">선택 상품 주문</button>

			<!-- 쇼핑 계속하기 클릭시 메인으로 이동하기 ? -->
			<button type="button" class="btn2"
				onclick="location.href='index.jsp'">쇼핑 계속하기</button>
		</div>
		
	</div>

</body>
</html>