<%@page import="model.myteam.TeamDao"%>
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
<%--
리스트의 삭제버튼에 경로 지정
삭제 메서드 만들기 (deleteMyTeam)
teamdelete.jsp에서 삭제 처리 한 후 목록으로 이동 
테스트해보기
 --%>
<%
	
	String num = request.getParameter("num");
	TeamDao dao = new TeamDao();	

	dao.deleteMyTeam(num);
	
	response.sendRedirect("list.jsp");
	
	
%>
</body>
</html>