<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
String myId=(String)session.getAttribute("myId");

MemberDao dao=new MemberDao();
String name=dao.getNameFromId(myId);
%>
<body>
	<div style="background-image: url('image2/bg.png')">
		<img src="image/cartoon/13.png"><%=name %> 님이 로그인하셨습니다
	</div><br>
	<button type="button" class="btn btn-danger" onclick="location.href='login/logoutProc.jsp'">로그아웃</button>
</body>
</html>