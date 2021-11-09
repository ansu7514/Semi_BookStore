<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.CommentDAO"%>
<%@page import="db.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String book_id = request.getParameter("book_id");
	String re_user_id = request.getParameter("re_user_id");
	
	CommentDTO dto = new CommentDTO();
	dto.setBook_id(book_id);
	dto.setUser_id(re_user_id);
	
	CommentDAO dao = new CommentDAO();
	ArrayList<CommentDTO> list = dao.readComment(re_user_id, book_id);

	JSONObject obj = new JSONObject();
	JSONArray array = new JSONArray();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(int i=0; i<list.size(); i++){
		JSONObject sObj = new JSONObject();
		sObj.put("user_id", list.get(i).getUser_id());
		sObj.put("writeday", sdf.format(list.get(i).getWriteday()));
		sObj.put("content", list.get(i).getContent());
		
		array.add(sObj);
	}
	
	obj.put("list", array);

	out.println(obj.toString());
%>