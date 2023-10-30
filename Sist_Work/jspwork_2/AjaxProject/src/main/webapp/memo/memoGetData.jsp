<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.memo.memoDto"%>
<%@page import="db.memo.memoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memoDao dao = new memoDao();

	String num = request.getParameter("num");
	memoDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	JSONObject ob = new JSONObject();
	
	
		ob.put("num", dto.getNum());
		ob.put("writer", dto.getWriter());
		ob.put("story", dto.getStory());
		ob.put("avata", dto.getAvata());
		ob.put("writeday", sdf.format(dto.getWriteday()));

%>
<%=ob.toString()%>