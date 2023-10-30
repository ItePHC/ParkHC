<%@page import="AjaxBoard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AjaxBoardDao dao = new AjaxBoardDao();
	
	String num = request.getParameter("num");
	dao.deleteBoard(num);
%>