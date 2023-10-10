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
	<div style="margin: 200px; margin-top: 50px;">
		<button type="button" class="btn btn-info" style="width: 200px" onclick="location.href='naver/form1'">각각 읽기</button><br><br>
		<button type="button" class="btn btn-info" style="width: 200px" onclick="location.href='naver/form2'">DTO로 읽기</button><br><br>
		<button type="button" class="btn btn-info" style="width: 200px" onclick="location.href='naver/form3'">Map으로 읽기</button><br><br>
		<button type="button" class="btn btn-info" style="width: 200px" onclick="location.href='naver/form4'">이미지 업로드</button><br><br>
	</div>
</body>
</html>