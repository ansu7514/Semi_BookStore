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
<link rel="stylesheet" href="../css/order_form.css">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Roboto+Mono:ital,wght@1,200&family=Zen+Antique&display=swap" rel="stylesheet">
</head>
<body>

<!-- 주문 내역 리스트 jsp -->

<%
//dao 선언
OrderDAO db=new OrderDAO();

//전체 주문 조회 -> 세션 !! 바꾸기 !!
String user_id=request.getParameter("user_id");
//검산용 
user_id="apple";

//페이징 처리시 주석처리 해놓기
//ArrayList<OrderDTO>list=db.orderList(user_id);

//나중에 바꿔놓을것
/* String user_id = (String)session.getAttribute("myid"); */


/* --- 페이징 처리 --- */
int totalCount; //총글수
int totalPage;  //총페이지수
int startPage;  //각블럭의 시작페이지
int endPage;    //각블럭의 끝페이지
int start;      //각페이지의 시작번호
int perPage=2;  //한페이지의 보여질 글의 갯수
int perBlock=3; //한페이지의 보여질 페이지 갯수
int currentPage;//현재 페이지
int no;         //모두 다 구한 후에 넘버값을 구할수 있음

//총갯수
totalCount=db.getTotalCount();

//현재 페이지번호 읽기(null일경우는 1페이지 설정)
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//총페이지갯수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지 , 끝페이지
//예)현재페이지:3이면 startPage:1 , endPage:5
//예)현재페이지:6이면 startPage:6 , endPage:10
startPage=(currentPage-1)/perBlock*perBlock+1;

endPage=startPage+perBlock-1;

//만약 총페이지 수가 8일경우
//2번째 블럭은 st:6 end:10이 되야 한다
//이땐 end를 8로 수정해주어야 한다
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 시작번호
//현재 페이지가 1일경우 st:1 , 2일경우 st:6
start=(currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 가져오기...dao에서 만들었음
List<OrderDTO>list=db.getList(start, perPage);

//각 글 앞에 붙힐 시작번호 구하기
//총글이 20개일경우 1페이지 20, 2페이지 15부터
//출력해서 1씩 감소하며 출력
no=totalCount-(currentPage-1)*perPage;

%>
<script type="text/javascript">
<!-- 지정한 날짜 조회하기 (스크립트) -->

 function input(){
	
	const dday=document.querySelector("#input_date").value;
	const ddday=document.querySelector("#input_date2").value;
	console.log(dday,ddday);
}
</script>


<div id="order_wrapper">

<div class="order_title">주문 내역</div>
<br>

<!-- 지정한 날짜 조회하기 -->
<div class="order_table_date">
	<input id="input_date" type="date">
	<b>~</b>
	<input id="input_date2" type="date" min="" max="" value="">&nbsp;&nbsp;
	<input id="input_submit" type="submit" onclick="input()" value="조회">
</div> 
<br>

<div class="order_table_list">

<!-- 주문 내역이 출력될 테이블 -->
<table class="table table-bordered" id="order_table">
		<tr>
			<th class="order_th">주문번호</th>
			<th class="order_th">아이디</th>
			<th class="order_th">책번호</th>
			<th class="order_th">수령인</th>
			<th class="order_th">배송지</th>
			<th class="order_th">책가격</th>
			<th class="order_th">권수</th>
			<th class="order_th">결제일</th>
			<th class="order_th">결제방법</th>
		</tr>
<%
//결제일
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//00,000 자릿수
DecimalFormat df = new DecimalFormat("###,###");

for(OrderDTO dto:list)
{
	%>
	<tr>
		<!-- 주문번호 -->
			<td><%=dto.getOrder_id() %></td>
		<!-- 아이디 -->
			<td><%=dto.getUser_id() %></td>
		<!-- 책번호 -->
			<td><%=dto.getBook_id() %></td>
		<!-- 수령인 -->
			<td><%=dto.getRecipient() %></td>
		<!-- 배송지 -->
			<td><%=dto.getLocation() %></td>
		<!-- 책가격 -->
			<td><%=df.format(dto.getBook_price()) %>원</td>
		<!-- 권수 -->
			<td><%=dto.getEa() %></td>
		<!-- 결제일 -->
			<td><%=sdf.format(dto.getPayDay()) %></td>
		<!-- 결제방법 -->
			<td><%=dto.getPay_method() %></td>
	</tr>
	
<%}
%>
</table>
</div>

<!-- 페이징 처리 -->
<div class="container">
	<ul class="pagination">
<%
	//이전
	if(startPage>1)
{%>
	<li>
		<a href="order_form.jsp?currentPage=<%=startPage-1%>">◀</a>
	</li>  
<%}
   
  	for(int p=startPage; p<=endPage; p++)
{
	if(p==currentPage)
{%>
	<li class="active">
		<a href="order_form.jsp?currentPage=<%=p%>"><%=p %></a>
	</li>  
<%}else
{%>
	<li>
		<a href="order_form.jsp?currentPage=<%=p%>"><%=p %></a>
	</li>
<%}
}
	//다음
	if(endPage<totalPage)
{%>
	<li>
		<a href="order_form.jsp?currentPage=<%=endPage+1%>">▶</a>
	</li>
<%}
   
%>
	</ul>
</div>

</div>


</body>
</html>