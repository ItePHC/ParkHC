<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
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
<%-- <%
	request.setCharacterEncoding("utf-8");

	String image = request.getParameter("image");
	String nick = request.getParameter("nick");
	String pass = request.getParameter("pass");
	String story = request.getParameter("story");
	
	SimpleGuestDto dto = new SimpleGuestDto();
	dto.setImage(image);
	dto.setNick(nick);
	dto.setPass(pass);
	dto.setStory(story);
	
	SimpleGuestDao dao = new SimpleGuestDao();
	dao.insertGuest(dto);
	
	response.sendRedirect("guest_list.jsp");
%> --%>

	<!-- 자바빈즈로 변경하려면? -->
	<%-- useBean:new로 객체를 생성하는 것과 같다 --%>
		
	<%
	request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="dao" class="db.simpleguest.SimpleGuestDao"/>
	<jsp:useBean id="dto" class="db.simpleguest.SimpleGuestDto"/>
	
	<%-- name = id역할 / property에 *이 들어갈 경우 dto에 있는 모든 멤버값을 불러오도록 세팅 / *안에 Num값도 들어가 있음 --%>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	
	//db에 insert
	dao.insertGuest(dto);
	//목록으로 이동
	response.sendRedirect("guest_list.jsp");
	%>
</body>
</html>