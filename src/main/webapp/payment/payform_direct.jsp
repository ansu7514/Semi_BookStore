<%@page import="db.UserDTO"%>
<%@page import="db.UserDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="db.BookDTO"%>
<%@page import="db.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.CartDAO"%>
<%@page import="db.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/payform.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
</head>
	<%
		/* CartDb에서 데이터를 출력하기 위해 user_id값 받아오기 */
		String user_id = (String)session.getAttribute("myid");
		String book_id = request.getParameter("book_id");
		String ea = request.getParameter("ea");
				
		/* 책이름과 가격, 이미지를 받아오기 위한 BookDAO, BookDTO 선언 */
		BookDAO Bdao = new BookDAO();
		BookDTO Bdto = Bdao.getBook(book_id);
		
		/* 금액에 , 표시를 할 포맷 선언 */
		DecimalFormat df = new DecimalFormat("###,###");
		
		/* 회원정보와 동일 체크할 경우, 가져올 user DAO, DTO 정보 */
		UserDAO Udao = new UserDAO();
		UserDTO Udto = Udao.getUser(user_id);
		
		/* 전화번호를 나누기 위해 전화번호를 변수로 저장합니다 */
		String hp = Udto.getHp();
		
		/* 총 상품금액을 계산하기 위한 변수를 선언 */
		int payment_totP = Bdto.getBookPrice() * Integer.parseInt(ea);
		int book_price = Bdto.getBookPrice() * Integer.parseInt(ea);
	%>
	

<body>
<form action="payment/payform_add.jsp" method="post">
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
					
					<!-- 배송지 선택 테이블 -->
					<table class="table table-hover" id="transport_form">
						<caption class="captions">배송지 선택</caption>
							<tr>
								<th colspan="2" style="text-align: left;" id="same_as">회원정보와 동일 &nbsp;&nbsp;
									<input type="checkbox" name="chk_info" onclick="same_info()">
								</th>
								<td></td>
							</tr>
						
							<tr>
								<th id="input_recipient">수령인</th>
								<td id="input_recipient"><input type="text" name="name" id="orderer" style="width: 150px;"></td>
							</tr>
							
							<tr>
								<th id="input_addr">배송지</th>
								<td id="input_addr">
									<input type="text" name="addr1" id="addr1" style="width: 300px;"><br>
									<input type="text" name="addr2" id="addr2" style="width: 300px;" placeholder="상세주소를 입력해주세요" >
								</td>
							</tr>

							<tr>
								<th id="input_hp">연락처</th>
								<td id="input_hp">
									<!-- 전화번호 앞자리 -->
									<select id="select_hp1">
										<option value="010" selected="selected">010</option>
										<option value="012">012</option>
										<option value="016">016</option>
										<option value="017">017</option>
									</select>
									-
									<input type="text" name="hp2" id="hp2" class="hp">
									-
									<input type="text" name="hp3" id="hp3" class="hp">
								</td>
							</tr>
					</table>	
				</div>
				
				
				<!-- 결제 방법 div -->
				<div id="pay_way">
					<table class="table table-hover" id="pay_table">
						<caption class="captions">결제정보</caption>
						
						<tr>
							<th id="input_recipient" style="width: 120px;">결제 방법</th>
							
							<td>
								<div id="pay_radio_div">
									<input type="radio" id="pay_radio" name="pay_radio" checked="checked" value="카드"><span class="pay_radio_val">카드</span>
									<input type="radio" id="pay_radio" name="pay_radio" value="현금"><span class="pay_radio_val">현금</span>
									<input type="radio" id="pay_radio" name="pay_radio" value="포인트"><span class="pay_radio_val">포인트</span>
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<!-- 상품정보 div -->
				<div id="product_info">
					<h4 class="captions">주문 정보</h4>
						<div class="order_form">
							<table class="table table-bordered">
								<tr>
									<th style="background-color: rgb(85, 102, 28, 0.5); width: 350px; text-align: center;">상품 정보</th>
									<th style="background-color: rgb(85, 102, 28, 0.5); padding-left: 5%;">판매가</th>
									<th style="background-color: rgb(85, 102, 28, 0.5); width: 100px; padding-left: -0.5px	;">수량</th>
								</tr>
								
								<tr>
									<td>
										<!-- hidden -->
										<input type="hidden" name="book_id" value="<%= book_id %>">
										<input type="hidden" name="book_price" value="<%= book_price %>">
										<input type="hidden" name="ea" value="<%= ea %>">
										<img src="image/book/<%= Bdto.getBook_image() %>" style="width: 70px;">
									
										<b style="margin-left: 5%;"><%= Bdto.getBook_name() %></b> | <%= Bdto.getWriter() %>
									</td>
									
									<td>
										<h4 style="display: flex; justify-content: center; text-align: center; margin-top: 40px;">
											<b><%= df.format(Bdto.getBookPrice()) %> 원</b>
										</h4>
									</td>
									
									<td style="display: flex; justify-content: center; margin-top: 30px; border: 1px solid #FAF7EB;">
										<h5 style="display: flex; justify-content: center; text-align: center;"><%= ea %> 권</h5>
									</td>
								</tr>
							</table>
						</div>
					</div>			
				</div>
			
			
			<!-- 결제정보 div -->
			<div id="payment_info">
				<h4 class="captions">최종결제 정보</h4>
				
				<div id="final_payment_info">
					<ul id="final_payment_ul">
						
						<!-- 총 상품금액: 돈, 포멧을 적용합니다-->
						<font class="payment_detail"><%=df.format((payment_totP)) %> 
							<font class="unit"> 원</font>
						</font>
						<li class="naming">총 상품금액</li>

						<!-- 적립 포인트 -->						
						<font class="payment_detail" id="get_point"><%=payment_totP*2/100 %> 
							<font class="unit"> Point</font>
						</font>
						<li class="naming">적립 포인트</li>
						
						<!-- 사용 포인트 -->						
						<font class="payment_detail">
						
							<!-- input에 입력 포인트가 바뀔때마다 함수호출 -->
							<!-- 숫자만 입력되도록 변경 - type을 number로 안한것은 위아래 버튼이 거추장스럽기때문 -->
							<input type="text" id="use_point" onchange="use_point(this.value)"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<font class="unit"> Point</font>
						</font>
						<li class="naming">사용 포인트</li>
						
						<!-- 남은 포인트 -->						
						<font class="payment_detail" id="left_point"><%=Udto.getPoint() %>
							<font class="unit"> Point</font>
						</font>
						<li class="naming">사용 가능한 포인트</li>
					</ul>
					
					<hr id="final_payment_hr">
						
					<ul id="final_payment_ul">	
						<font class="payment_detail" id="totP" style="color: red;"><%=df.format((payment_totP)) %>
							<font class="unit" style="color: black;"> 원</font>						
						</font>
						<li class="naming_pay">결제금액</li>
					</ul>
					
					
					<!-- 버튼 -->
					<div id="btns">
						<button id="buy" class="btn fourth" onclick="">결제하기</button>
					</div>
				</div>
			</div>	
					
		</div>
		
	</div>
</form>


	<!-- 회원정보와 동일 체크할 경우, 폼에 자동입력 -->
	<!-- !!!대신 입력할 경우엔 다시 합쳐줘야 함!!! -->
	<script type="text/javascript">
		function same_info(){
			
				/* 체크여부 확인 - check된 경우 */
				if($("input:checkbox[name=chk_info]").is(":checked")==true){
				
				$("#orderer").val("<%=Udto.getUser_name()%>");
				$("#addr1").val("<%=Udto.getAddr()%>");
				
				
				if(<%=hp.substring(0,3).equals("010")%>){
					$("#select_hp1").val("010").prop("selected", true);					
				} else if(<%=hp.substring(0,3).equals("012")%>){
					$("#select_hp1").val("012").prop("selected", true);										
				} else if(<%=hp.substring(0,3).equals("016")%>){
					$("#select_hp1").val("016").prop("selected", true);										
				} else if(<%=hp.substring(0,3).equals("017")%>){
					$("#select_hp1").val("017").prop("selected", true);										
				}
				
				
				$("#hp2").val("<%=hp.substring(3,7)%>");
				$("#hp3").val("<%=hp.substring(7)%>");
				
			/* check안 된 경우 */	
			}else{
				
				$("#orderer").val("");
				$("#addr1").val("");
				$("#select_hp1").val("010").prop("selected", true);	;
				$("#hp2").val("");
				$("#hp3").val("");
			}
		}
		
		
		/* 포인트 사용하기로하면 그만큼 빼주는 함수 정의 */
		function use_point(point){
			
			var left_point = <%=Udto.getPoint()%> - $("#use_point").val();

			
			/* 남은 포인트 정보 산정 */
			/* 단위 값은 폰트 사이즈 유지되도록 하기 */
			$("#left_point").html(left_point + "<font class='unit'> Point</font>");
			
			
			/* 남은 총 결제액 돈자릿수 포맷 포함 변수선언 */
			var totP = (String)(<%=payment_totP%> - point);
			
			/* javascript 내부에서 돈자릿수 콤마 더하기 작업 */
			totP = totP.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			/* 금액변경시 총 결제액 변경 */
			$("#totP").text(totP);
			
			/* 만약 포인트가 음수로 갈경우 */
			if(left_point < 0){
				
				/* 포인트란에 경고메시지 */
				$("#totP").html("<h3 style='color: red; font-weight: bold;'>포인트 부족으로 결제불가</h3>");
				
				/* 결제버튼 비활성화 */
				const target1 = document.getElementById("pay");
				target1.disabled = true;
			
			} else{
				
				/* 남은 포인트가 다시 양수로 돌아왔을 경우 */
				/* 돈의 단위는 무조건 원래 폰트와 색을 유지하도록 설정했음 */
				$("#totP").html(totP + "<font class='unit' style='color: black;'> 원</font>");
			}
			
		}
	</script>
	
	

</body>
</html>
