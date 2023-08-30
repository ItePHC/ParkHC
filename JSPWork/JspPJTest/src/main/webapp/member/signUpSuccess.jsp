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
<body>
	<%
	String id=request.getParameter("id");
	MemberDao dao=new MemberDao();
	String name=dao.getNameFromId(id);
	%>
	<div style="margin: 200px 200px;">
		<img alt="" src="image/cartoon/20.png">
		<b><%=name %> 님의 회원가입을 축하합니다</b><br><br>
		<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginMain.jsp'">로그인</button>
		<button type="button" class="btn btn-success" onclick="location.href='index.jsp'">Home</button>
	</div>
</body>
</html>