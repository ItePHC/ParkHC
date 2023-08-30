<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		
		String idx = request.getParameter("idx");
		String content = request.getParameter("content");
		
		System.out.println(idx);
		System.out.println(content);
		
		AnswerDto dto = new AnswerDto();
		dto.setIdx(idx);
		dto.setContent(content);
		
		AnswerDao dao = new AnswerDao(); 
		dao.updateAnswer(dto);
		
		/*
		//방명록 목록으로 이동
		response.sendRedirect("../index.jsp?main=guest/guestList.jsp");
		*/
	%>