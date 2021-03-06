<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>

<%@page import="db.BookDAO"%>
<%@page import="db.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/order_form.css">
<title>Insert title here</title>
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
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Roboto+Mono:ital,wght@1,200&family=Zen+Antique&display=swap"
	rel="stylesheet">
</head>


<body>

	<!-- 주문 내역 리스트 jsp -->

	<%
	//dao 선언
	OrderDAO db = new OrderDAO();

	//세션값
	String user_id = (String)session.getAttribute("myid");
	
	//날짜 담을 리스트선언
	ArrayList<OrderDTO> date_list = new ArrayList<OrderDTO>();
	
	//특정기간 조회리스트
/* 	Date date = new Date();
	
	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	Date from = from;
	String to=format.format(to);
	
	List<OrderDTO> day_list = db.orderDateList(user_id, from, to); */

	//페이징 처리시 주석처리 해놓기 , 전체주문 조회리스트
	/* ArrayList<OrderDTO> order_list = db.orderList(user_id);*/
	
	/* --- 페이징 처리 --- */
	int totalCount;
	// 총 페이지 수
	int totalPage;
	// 각 블럭의 시작 페이지
	int startPage;
	// 각 블럭의 끝 페이지
	int endPage;
	// 각 페이지의 시작 번호
	int start;
	
	// 한 페이지에 보여질 글의 개수
	int perPage = 10;
	// 한 페이지에 보여지는 페이지 개수
	int perBlock = 3;
	// 현재 페이지
	int currentPage;
	int no;

	//총갯수
	totalCount = db.getTotalCount(user_id);

	//현재 페이지번호 읽기(null일경우는 1페이지 설정)
	if (request.getParameter("currentPage") == null) {
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	//총페이지갯수 구하기
	totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

	//각 블럭의 시작페이지 , 끝페이지
	//예)현재페이지:3이면 startPage:1 , endPage:5
	//예)현재페이지:6이면 startPage:6 , endPage:10
	startPage = (currentPage - 1) / perBlock * perBlock + 1;

	endPage = startPage + perBlock - 1;

	//만약 총페이지 수가 8일경우
	//2번째 블럭은 st:6 end:10이 되야 한다
	//이땐 end를 8로 수정해주어야 한다
	if (endPage > totalPage) {
		endPage = totalPage;
	}

	//각 페이지에서 불러올 시작번호
	//현재 페이지가 1일경우 st:1 , 2일경우 st:6
	start = (currentPage - 1) * perPage;

	//각 페이지에서 필요한 게시글 가져오기...dao에서 만들었음
	List<OrderDTO> list = db.orderList(user_id,start, perPage);

	//각 글 앞에 붙힐 시작번호 구하기
	//총글이 20개일경우 1페이지 20, 2페이지 15부터
	//출력해서 1씩 감소하며 출력
	no = totalCount - (currentPage - 1) * perPage;
	%>

	<div id="order_wrapper">

		<div class="order_title">주문 내역
			<img class="order_title_img" src="image/order_form_img.png">
		</div>

		<!-- 지정한 날짜 조회하기 -->
		<div class="order_table_date">
			<!-- 시작점 , 최소시작일 : 2021-01-01 -->
			<input id="input_start" name="input_start" type="date" min="2021-01-01">
			
			<b>~</b>
			<!-- 마감시점 , 최대막날 : 2021-11-10 -->
			<input id="input_end" name="input_end" type="date" max="2021-12-31" value="">&nbsp;&nbsp;
			
			<input id="input_submit" type="button" onclick="input()" value="조회">
		
		</div>
		

		<div class="order_table_list">

			<!-- 주문 내역이 출력될 테이블 -->
			<table class="table table-bordered" id="order_table">
				<tr>
					<th class="order_th">주문한 책</th>
					<th class="order_th">권수</th>
					<th class="order_th">결제 가격</th>
					<th class="order_th">수령인</th>
					<th class="order_th">배송지</th>
					<th class="order_th">결제일</th>
					<th class="order_th">결제 방법</th>
				</tr>
				<%
				//결제일
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				//00,000 자릿수
				DecimalFormat df = new DecimalFormat("###,###");
				
				for(int i = 0; i < list.size(); i++ ) {
					
					OrderDTO order_dto = list.get(i);
				%>
					<tr>
						<!-- 책 명 -->
						<%
						BookDAO book_dao = new BookDAO();
						BookDTO book_dto = book_dao.getBook(order_dto.getBook_id());
						%>
						<td><%= book_dto.getBook_name() %></td>
						
						<!-- 권수 -->
						<td><%= order_dto.getEa() %></td>
						
						<!-- 결제 가격 -->
						<td><%=df.format(order_dto.getBook_price())%>원</td>
						
						<!-- 수령인 -->
						<td><%=order_dto.getRecipient()%></td>
						
						<!-- 배송지 -->
						<td><%=order_dto.getLocation()%></td>
						
						<!-- 결제일 -->
						<td><%=sdf.format(order_dto.getPayDay())%></td>
						
						<!-- 결제방법 -->
						<td><%=order_dto.getPay_method()%></td>
					</tr>
				<%
				}
				%>
			</table>
		</div>

		<!-- 페이징 처리 -->
		<div class="page_container">
			<ul class="pagination">
				<%
				// 이전
				if(startPage > 1) {
				%>
				
				<li>
					<a href="index.jsp?main=order/order_form.jsp?currentPage=<%=startPage - 1%>">이전</a>
				</li>
				
				<%
				}
				
				for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) {
				%>
				
				<li class="active">
					<a href="index.jsp?main=order/order_form.jsp?currentPage=<%=p%>"><%=p%></a>
				</li>
				
				<%
					} else {
				%>
				
				<li>
					<a href="index.jsp?main=order/order_form.jsp?currentPage=<%=p%>"><%=p%></a>
				</li>
				
				<%
					}
				}
				
				// 다음
				if(endPage < totalPage) {
				%>
				
				<li>
					<a href="index.jsp?main=order/order_form.jsp?currentPage=<%=endPage+1%>">▶</a>
				</li>
				
				<%
				}
				%>
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
	<!-- 지정한 날짜 조회하기 (스크립트) -->
	function input(){
		const dday = document.querySelector("#input_start").value;
		const ddday =document.querySelector("#input_end").value;
		
		var dday_month = dday.substring(5, 6);
		var ddday_month = ddday.substring(5, 6);
		
		var dday_day = dday.substring(8, 9);
		var ddday_day = ddday.substring(8, 9);
		
		if((dday_month > ddday_month) || (dday_month = ddday_month) && (dday_day > ddday_day)) {
			alert("날짜를 다시 선택해주세요");
		} else if(dday_month < ddday_month || (dday_month = ddday_month && dday_day <= ddday_day)) {
			/* alert((dday, ddday)); */
			
		      $.ajax({
		          type:"post",
		          dataType:"html",
		          url:"order/order_date_add.jsp",
		          data:{"user_id":"<%=user_id%>", "input_start": dday, "input_end": ddday},
		          success:function(data){	        	  
		        	 
		        	  var obj = JSON.parse(data);
		        	  var s = "";
		        	  
		        	  var obj_count = Object.keys(obj).length;
		        	  
		             /* location.reload(); */
		             
		             /* 출력할 값들 json으로 변환후 넣음 */
		             console.log(JSON.stringify(obj));
		            
		             	//key :"list", value: 배열 안의 obj
		             	//v[index].book_price
						$.each(obj, function(k,v){
							
							/* 여기 테이블 대체하면 됨 */
							s+= "<table class='table table-bordered' id='order_table'>";
							s+= "<tr>";
							s+=	"<th class='order_th'>주문한 책</th>";
							s+=	"<th class='order_th'>권수</th>";
							s+=	"<th class='order_th'>결제 가격</th>";
							s+=	"<th class='order_th'>수령인</th>";
							s+=	"<th class='order_th'>배송지</th>";
							s+=	"<th class='order_th'>결제일</th>";
							s+=	"<th class='order_th'>결제 방법</th>";
							s+=	"</tr>";
							
							$.each(v, function(index,item){
								s+=	"<tr>";
										
								<!-- 책이름 -->
								s+= "<td>" + item.book_name + "</td>";
								
								<!-- 권수 -->
								s+= "<td>" + item.book_ea + "</td>";
										
								<!-- 결제 가격 -->
								s+= "<td>" + item.book_price + "</td>";
										
								<!-- 수령인 -->
								s+= "<td>" + item.book_recipient + "</td>";
								
								<!-- 배송지 -->
								s+= "<td>" + item.book_location + "</td>";
										
								<!-- 결제일 -->
								s+= "<td>" + item.book_pay_day + "</td>";
										
								<!-- 결제방법 -->
								s+= "<td>" + item.book_pay_method + "</td>";
								s+=	"</tr>";
							});
						});
					
					
						s+="</table>";
						
						$(".order_table_list").html(s);
		          }
		       });  
			
		} else if(dday == "null" || dday == "" || ddday == "null" || ddday == "") {
			alert("날짜를 입력해주세요");
		}
		
		
	}
	
	</script>
</body>
</html>