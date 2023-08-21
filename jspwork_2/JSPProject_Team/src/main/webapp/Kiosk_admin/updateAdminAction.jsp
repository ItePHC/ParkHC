<%@page import="Admin.adminDao"%>
<%@page import="Admin.adminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%
	
	String type = request.getParameter("type");
	String name = request.getParameter("name");
	String image = request.getParameter("image");
	String price = request.getParameter("price");
	String stock = request.getParameter("stock");
	String num = request.getParameter("num");
	
	adminDto dto = new adminDto();
	dto.setType(type);
	dto.setName(name);
	dto.setImage(image);
	dto.setPrice(price);
	dto.setStock(stock);
	dto.setNum(num);
	
	adminDao dao = new adminDao();
	dao.updateadmin(dto);
	
	response.sendRedirect("list_admin.jsp");
	
%>
</body>
</html>