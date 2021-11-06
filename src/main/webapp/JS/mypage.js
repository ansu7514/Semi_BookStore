window.onload = function() {
	click_mem();
}

function click_mem() {
	var order_see = document.getElementById("order_see");
	var my_mem_up = document.getElementById("my_mem_up");
	
	order_see.onclick = function() {
		document.getElementById("show_menu").src = "";
	}
	
	my_mem_up.onclick = function() {
		document.getElementById("show_menu").src = "login/member_updatepass.jsp";
	}
}