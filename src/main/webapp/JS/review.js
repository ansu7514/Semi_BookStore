$(function(){
	//리뷰작성
	/*$("#submit-review").on("click", function(){
		
		if($('#comment-content').val() == ""){
			return;
		}
		
		if("<%=session.getAttribute('myid')%>" == "null"){
			return;
		}
		
		var user_id = "apple";//localStorage.getItem("user_id");
		var book_id = localStorage.getItem("book_id");
		var rating = $(".rating-value-box").val();
		var content = $('#comment-content').val();
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
				
		var review = {
			book_id : book_id,
			content : content,
			rating : rating,
			user_id : user_id
		};
		
		console.log(review.content);
		console.log(review.book_id);
		console.log(review.rating);
		console.log(review.user_id);
		
		$.ajax({
			url:"review/reviewAction.jsp",
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
	});*/
	
	//리뷰작성
	$(document).on("click", ".submit-review", function(){
		
		var user_id = localStorage.getItem("user_id");
		var book_id = localStorage.getItem("book_id");
		var rating = $(".rating-value-box").text();
		var content = $('#review-content').val();
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
		//공백체크
		if(content == null || content == ""){
			console.log(content.length);
			return;
		}
		
		var review = {
			book_id : book_id,
			content : content,
			rating : rating,
			user_id : user_id
		};
		
		console.log(review.content);
		console.log(review.book_id);
		console.log(review.rating);
		console.log(review.user_id);
		
		$.ajax({
			url:"review/reviewAction.jsp",
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
	
	
	
/*	//댓글보기
	$(document).on("click", "#show-comment", function(){
		showCon()
	});*/
});