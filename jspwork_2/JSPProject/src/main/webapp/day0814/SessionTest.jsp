<%@page import="java.util.Date"%>
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
	session.setAttribute("msg", "Happy Monday!!");		// 이름, 내용...?
	session.setMaxInactiveInterval(60);			//60초 동안 유지시간 지정
%>

<h3>세션값 얻기</h3>
세션값 : <%=session.getAttribute("msg") %>	<br>		<!-- Happy Monday -->
세션 유지시간 : <%=session.getMaxInactiveInterval() %>초<br>
세션 생성시간 : <%=session.getCreationTime() %><br>
세션 생성시간 : <%=new Date(session.getCreationTime()) %>
</body>
</html>