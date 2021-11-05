window.onload = function() {
	click_mem();
}

function click_mem() {
	var order_see = document.getElementById("order_see");
	var my_mem = document.getElementById("my_mem");
	
	order_see.onclick = function() {
		document.getElementById("show_menu").src = "";
	}
	
	my_mem.onclick = function() {
		document.getElementById("show_menu").src = "login/member_updateform.jsp";
	}
}