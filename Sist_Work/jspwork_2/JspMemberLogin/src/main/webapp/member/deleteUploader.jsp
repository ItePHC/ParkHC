<%@page import="member.model.memberDto"%>
<%@page import="member.model.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">

</script>
</head>
<body>


	<%
	//db삭제
	String num = request.getParameter("num");
	
	memberDao dao = new memberDao();
	dao.deleteMember(num);

	
	//redirect...
	response.sendRedirect("memberList.jsp");
	%>
</body>
</html>