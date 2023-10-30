<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<form action="result" method="post">
		<table class="table table-bordered" style="width: 500px;">
		<caption align="top">학생정보</caption>
			<tr>
				<th style="width: 200px;">이름</th>
				<td>
					<input type="text" name="name" style="width: 300px;">
				</td>
			</tr>
			
			<tr>
				<th style="width: 200px;">좋아하는 색</th>
				<td>
				<input type="color" name="color" style="width: 300px;">
				</td>
			</tr>
			
			<tr>
				<th style="width: 200px;">취미</th>
				<td>
					<input type="checkbox" name="hobby" value="게임">게임
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="운동">운동
					<input type="checkbox" name="hobby" value="여행" >여행
					<input type="checkbox" name="hobby" value="음악감상">음악감상
				</td>
			</tr>
			<tr>
				<th style="width: 200px;">가장 좋아하는 언어</th>
				<td>
					<input type="radio" name="lng" value="java">Java
					<input type="radio" name="lng" value="html">html
					<input type="radio" name="lng" value="oracle">Oracle
					<input type="radio" name="lng" value="jsp">JSP
					<input type="radio" name="lng" value="spring">Spring
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit">데이터 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>