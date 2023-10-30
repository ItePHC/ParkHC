<%@page import="model.Hw0804.Hw0804Dao"%>
<%@page import="model.Hw0804.Hw0804Dto"%>
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
	request.setCharacterEncoding("utf-8");

	String intro_num = request.getParameter("intro_num");
	String intro_name = request.getParameter("intro_name");
	String intro_blood = request.getParameter("intro_blood");
	String intro_hp = request.getParameter("hp1")+request.getParameter("hp2")+request.getParameter("hp3");
	String intro_city = request.getParameter("intro_city");
	
	Hw0804Dto dto = new Hw0804Dto();
	
	dto.setIntro_num(intro_num);
	dto.setIntro_name(intro_name);
	dto.setIntro_city(intro_city);
	dto.setIntro_hp(intro_hp);
	dto.setIntro_blood(intro_blood);
	
	Hw0804Dao dao = new Hw0804Dao();
	dao.getUpdate(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>