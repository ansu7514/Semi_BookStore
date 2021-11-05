$(function(){
	
	$(".input-comment").hide();
	
	//리뷰작성
	$("#submit-review").click(function(){
		
		if($('input[name="review-content"]').val() == ""){
			return;
		}
		
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
	
	//댓글보기 버튼
	var triger = true;
	$(".show-comment").on("click",function(){
		if(triger){ //true
			$(".input-comment").show();
			triger = false;
		} else { //false
			$(".input-comment").hide();
			triger = true;
		}	
	});
});