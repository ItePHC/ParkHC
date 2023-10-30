<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SmartAnswerDao dao = new SmartAnswerDao();
	
	String idx = request.getParameter("idx");
	
	dao.deleteSmartAnswer(idx);
%>