<%@page import="db.simpleboard.simpleBoardDao"%>
<%@page import="db.simpleboard.simpleBoardDto"%>
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
		String writer = request.getParameter("writer");
		String pass = request.getParameter("pass");
		String subject = request.getParameter("subject");
		String story = request.getParameter("story");
		
		simpleBoardDto dto = new simpleBoardDto();
		dto.setWriter(writer);
		dto.setPass(pass);
		dto.setSubject(subject);
		dto.setStory(story);
		
		simpleBoardDao dao = new simpleBoardDao();
		dao.insertBoard(dto);
		
		response.sendRedirect("boardList.jsp");
		
		request.setCharacterEncoding("utf-8");
	%>
	
	<%-- <!-- useBean은 new로 객체생성하는 것과 같아서 id는 변수명이 된다 -->
	<jsp:useBean id="dao" class="db.simpleboard.simpleBoardDao"/>
	<jsp:useBean id="dto" class="db.simpleboard.simpleBoardDto"/>
	
	<!-- dto의 멤버랑 같은 이름의 폼태그는 자동으로 읽어서 dto에 반환한다 -->
	
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	dao.insertBoard(dto);
	
	//목록으로 이동
	// response.sendRedirect("boardList.jsp");
	// 내용보기로 이동하려면?
	int num = dao.getMaxNum();
	response.sendRedirect("boardList.jsp");
	%> --%>
	
		
</body>
</html>