window.onload = function() {
	click_mem();
}

function click_mem() {
	var my_mem_up = document.getElementById("my_mem_up");
	var my_mem_del = document.getElementById("my_mem_del");
	
	my_mem_up.onclick = function() {
		document.getElementById("show_menu").src = "login/member_updatepass.jsp";
	}
	
	my_mem_del.onclick = function() {
		document.getElementById("show_menu").src = "login/member_delete.jsp";
	}
}