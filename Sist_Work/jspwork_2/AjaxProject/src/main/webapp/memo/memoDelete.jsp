<%@page import="AjaxBoard.AjaxBoardDto"%>
<%@page import="db.memo.memoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memoDao dao = new memoDao();
	

	String num = request.getParameter("num");
	
	
	dao.deleteMemo(num);
	
%>