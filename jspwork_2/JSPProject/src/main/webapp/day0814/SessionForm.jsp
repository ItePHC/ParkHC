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
	session.setAttribute("msg", "happy");
	session.setMaxInactiveInterval(5);		
%>
	<h2>10초 안에 눌러주세요</h2>
	<form action="SessionAction.jsp" method="post">
	<h2>가고싶은 여행지</h2>
	<input type="radio" value="베트남 3박4일" name="travel">베트남 3박4일&nbsp;
	<input type="radio" value="일본 3박4일" name="travel">일본 3박4일&nbsp;
	<input type="radio" value="중국 3박4일" name="travel">중국 3박4일&nbsp;
	<input type="radio" value="유럽 1박2일" name="travel">유럽 1박2일&nbsp;
	<input type="radio" value="미국 1박2일" name="travel">미국 1박2일&nbsp;
	<input value="여행당첨" type="submit">
	</form>
</body>
</html>