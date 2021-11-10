$(function(){

	var book_id = JSON.parse(localStorage.getItem("book_id"));
	var book_ea = JSON.parse(localStorage.getItem("book_ea"));
	var book_price = JSON.parse(localStorage.getItem("book_price"));
	var book_name = JSON.parse(localStorage.getItem("book_name"));
	var book_image = JSON.parse(localStorage.getItem("book_image"));
	
	console.log(book_id);
	console.log(book_ea);
	console.log(book_price);
	console.log(book_name);
	console.log(book_image);
	
	var total_price = 0;
	
	for(var i=0; i<book_id.length; i++){
		
		total_price += book_ea[i]*book_price[i];
		
		var book_price = (String)(book_ea[i]*book_price[i]);
		book_price = book_price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
		
		var s='\
			<tr>\
				<td>\
					<input type="hidden" name="book_id" value="' + book_id[i] + '">\
					<input type="hidden" name="book_price" value="' + book_price[i] + '">\
					<input type="hidden" name="ea" value="'+ book_ea[i] +'">\
					<img src="image/book/' + book_image[i] + '" style="width: 70px;">\
					<b style="margin-left: 5%;">' + book_name[i] + '</b> | <%= Bdto.getWriter() %>\
				</td>\
				\
				<td>\
					<h4 style="display: flex; justify-content: center; text-align: center; margin-top: 40px;">\
						<b>' + book_price + ' 원</b>\
					</h4>\
				</td>\
				\
				<td>\
					<h5 style="margin-top: 40px;">' + book_ea[i] + ' 권</h5>\
				</td>\
			</tr>\
		';
		
		$(print-cart-books).append(s);
	}
	
	$("#payment-total").html('\
		<div id="total_price">' + total_price + '</div>\
		<font class="unit">원</font>\
	');
	
	$("#get_point").html('\
		<div id="total_point">' + total_price*2/100 +'</div>\
		<font class="unit"> Point</font>\
	');

	$("#left_point").html('\
		<div id="left_point">' + total_point +'</div>\
		<font class="unit"> Point</font>\
	');

	$("#totP").html('\
		<div id="left_point">' + total_point +'</div>\
		<font class="unit" style="color: black;"> 원</font>\
	');
	
});

	/*$(document).ready(function(){
	
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
	});*/
	

