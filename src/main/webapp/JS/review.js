$(function(){
	//별점
	$(".my-rating-4").starRating({
		totalStars: 5,
		starShape: 'rounded',
		starSize: 40,
		emptyColor: 'lightgray',
		hoverColor: 'crimson',
		activeColor: 'crimson',
		useGradient: false
	});
	
	//리뷰작성
	$("#submit-review").click(function(){
		
		var content = $('input[name="review-content"]').val();
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
		var review = {
			book_id : "<%=book_id%>",
			content : content,
			rating : $(".my-rating-4").getRating(),
			user_id : "<$=user_id$>"
		};
		
		console.log(review.content);
		console.log(review.book_id);
		console.log(review.rating);
		console.log(review.user_id);
		
		$.ajax({
			url:"reviewAction.jsp",
			type:"post",
			dataType:"html",
			data:{
				"book_id" : review.book_id,
				"content" : review.content,
				"rating" : review.rating,
				"user_id" : review.user_id
			},
			success:function(){
				location.reload();
			}
		});
	});
	
});