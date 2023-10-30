<%@page import="AjaxBoard.AjaxBoardDto"%>
<%@page import="AjaxBoard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AjaxBoardDao dao = new AjaxBoardDao();

	request.setCharacterEncoding("utf-8");
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String story = request.getParameter("story");
	String avata = request.getParameter("avata");
	
	AjaxBoardDto dto = new AjaxBoardDto();
	
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setStory(story);
	dto.setAvata(avata);
	

	dao.insertBoard(dto);
%>
