<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="AjaxBoard.AjaxBoardDto"%>
<%@page import="AjaxBoard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AjaxBoardDao dao = new AjaxBoardDao();

	String num = request.getParameter("num");
	AjaxBoardDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	JSONObject ob = new JSONObject();
	
	ob.put("num", dto.getNum());
	ob.put("writer", dto.getWriter());
	ob.put("subject", dto.getSubject());
	ob.put("story", dto.getStory());
	ob.put("avata", dto.getAvata());
	ob.put("writeday", sdf.format(dto.getWriteday()));
%>
<%=ob.toString()%>