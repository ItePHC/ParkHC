<%@page import="org.json.simple.JSONObject"%>
<%@page import="AjaxBoard.AjaxBoardDto"%>
<%@page import="AjaxBoard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AjaxBoardDao dao = new AjaxBoardDao();

	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("unum");
	String writer = request.getParameter("uwriter");
	String subject = request.getParameter("usubject");
	String story = request.getParameter("ustory");
	String avata = request.getParameter("uavata");
	
	AjaxBoardDto dto = new AjaxBoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setStory(story);
	dto.setAvata(avata);
	

	dao.updateBoard(dto);

%>