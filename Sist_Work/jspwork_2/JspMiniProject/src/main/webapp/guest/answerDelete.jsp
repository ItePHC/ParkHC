<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String idx=request.getParameter("idx");
	
	AnswerDao dao = new AnswerDao();
	dao.deleteAnswer(idx);
	
	response.sendRedirect("../index.jsp?main=guest/guestList.jsp");
	
%>