
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	SmartAnswerDao dao = new SmartAnswerDao();
	List<SmartAnswerDto> list = dao.getAllAnswers(num);
	
	JSONArray arr = new JSONArray();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	for(SmartAnswerDto dto :list){
		JSONObject ob = new JSONObject();
		
		ob.put("idx", dto.getIdx());
		ob.put("num", dto.getNum());
		ob.put("nickname", dto.getNickname());
		ob.put("content", dto.getContent());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>