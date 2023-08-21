<%@page import="Admin.adminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   adminDao dao=new adminDao();
   String num=request.getParameter("num");
   dao.deleteadmin(num);
   
   response.sendRedirect("list_admin.jsp");
%>