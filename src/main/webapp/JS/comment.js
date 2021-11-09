var triger="true";
function showCon(e){
	var re_user_id = $(e).attr("re_user_id");
	var book_id = $(e).attr("book_id");
	triger = $(e).attr("triger");
/* 				var content = $('#comment-content').val();
				content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>'); */
	if(triger=="true"){
		$.ajax({
			url:"review/commentAction.jsp",
			type:"post",
			dataType:"html",
			data:{
				"book_id" : book_id,
				"re_user_id" : re_user_id
			},
			async: false,
			success:function(data){
				var obj = JSON.parse(data);
				
				var s="";
				$.each(obj, function(k,v){
					s += '\
						<div class="comments"> \
							<span class="comment-name">' + v[0].user_id+ '</span> \
							<span class="comment-date">' + v[0].writeday + '</span> \
						</div> \
						<div class="comments-content"> \
							' + v[0].content + '\
						</div>\
					';
				});
				$(".print-comments").html(s);
				$("#re_user_id:"+re_user_id).css("display", "block");
				$(e).attr("triger","false");
			}
		});
	} else {
		$("#re_user_id:"+re_user_id).hide();
		$(".print-comments").html("");
		$(e).attr("triger","true");
	}

}