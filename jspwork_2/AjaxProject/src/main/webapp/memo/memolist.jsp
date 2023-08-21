<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="db.memo.memoDto"%>
<%@page import="java.util.List"%>
<%@page import="db.memo.memoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memoDao dao = new memoDao();
	List<memoDto> list = dao.getAllMemos();
	JSONArray arr = new JSONArray();
	
	//arr에 먼저 size를 보내보자
	/*
	JSONObject size = new JSONObject();
	size.put("size", list.size());
	arr.add(size);
	*/
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	for(memoDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("num", dto.getNum());
		ob.put("writer", dto.getWriter());
		ob.put("story", dto.getStory());
		ob.put("avata", dto.getAvata());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		
		//arr에 추가
		arr.add(ob);
	}
%>
<%=arr.toString()%>