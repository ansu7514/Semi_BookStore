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

<!-- bx 슬라이더용 추가 -->
	
<title>Insert title here</title>

	<!-- bx 슬라이더용 추가 -->
	<!-- 가능하면 나중에 js로 따로 만들어서 뺄것 -->
	<script type="text/javascript">
	
		$(document).ready(function(){
		
			$('.slider').bxSlider();
			
		    $('.bxslider').bxSlider({ // 클래스명 주의!
		        auto: true, // 자동으로 애니메이션 시작
		        speed: 500,  // 애니메이션 속도
		        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
		        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
		        autoControls: true, // 시작 및 중지버튼 보여짐
		        pager: true, // 페이지 표시 보여짐
		        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
		    });
		});
	
	</script>


</head>

	<%
	
		/* 리스트값 출력 - 카트에 있는 값을 출력하기위한 DAO선언 */
		CartDAO Cdao = new CartDAO(); 

		/* 이제 카트에 있는걸 가져와서 이미지 등을 출력하면 됩니다. - DAO 수정전*/
		CartDTO Cdto = new CartDTO();
	
		/* CartDb에서 데이터를 출력하기 위해 user_id값 받아오기 */
		String user_id = request.getParameter("user_id");
				
		/* user_id에 따른 Cart 정보를 받을 list를 선언합니다. */
		ArrayList<CartDTO> cart_list = Cdao.selectCart(user_id);
		
		/* 책이름과 가격, 이미지를 받아오기 위한 BookDAO, BookDTO 선언 */
		BookDAO Bdao = new BookDAO();
		BookDTO Bdto = new BookDTO();
		
		
		/* 금액에 , 표시를 할 포맷 선언 */
		DecimalFormat df = new DecimalFormat("###,###");
		
		
		/* 회원정보와 동일 체크할 경우, 가져올 user DAO, DTO 정보 */
		UserDAO Udao = new UserDAO();
		UserDTO Udto = Udao.getUser(user_id);
		
		
		/* 전화번호를 나누기 위해 전화번호를 변수로 저장합니다 */
		String hp = Udto.getHp();
		
		/* 총 상품금액을 계산하기 위한 변수를 선언 */
		int payment_totP = 0;
		
	%>
	
	


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
				
				
				<!-- 상품정보 div -->
				<div id="product_info">
				
					<h4 class="captions">주문 정보</h4>
					
						<!-- bxSlider 조건에 맞춰 class명 부여 -->
						<div class="slider">
						
							<ul class="bxslider">
							
								<!-- list이기 때문에 for문 출력을 합니다 -->
								<%
									for(int i=0; i < cart_list.size(); i++){
										
										/* 각 i값마다 list에서 dto 가져옴 */
										Cdto = cart_list.get(i);
										
										/* book_id를 통해 BookDao에서 상세정보를 받을 DTO선언 */
										Bdto = Bdao.getBook(Cdto.getBook_id());										
										
										/* for문 마다 앞서 선언한 변수에 더해줍니다 */
										/* 후에 돈자리 , 계산을 위해 포멧을 넣어줍니다 */
										payment_totP += (Bdto.getBookPrice()*Cdto.getEa());
			
										%>
										
										<!-- 회전판에 책 img 목록들 추가 -->
										<li class="img_div">
											<h5 class="img_name"><%=Bdto.getBook_name() %></h5>
											<img class="img" src="image/book/<%=Bdto.getBook_image()%>">
											<h6 class="totP_ea"><%=df.format(Bdto.getBookPrice()*Cdto.getEa()) %> 원 &nbsp;/ &nbsp;<%=Cdto.getEa() %> 권</h6>
										</li>
										
									<%}
								%>
							
							</ul>
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
						<button id="buy" class="btn fourth" onclick="location.href=''">결제하기</button>
					</div>
				</div>
			</div>	
					
		</div>
		
	</div>



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
