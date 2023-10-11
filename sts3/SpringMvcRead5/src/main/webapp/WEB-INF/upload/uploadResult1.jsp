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
	<h2>제목 : ${title }</h2>
	<h2>업로드 한 실제경로 : ${path }</h2>
	<h2>업로드 한 이미지명 : ${fileName }</h2>
	
	<c:if test="${fileName != 'no' }">
		<img alt="" src="../photo/${fileName }" style="max-width: 300px;">
	</c:if>
	<c:if test="${fileName == 'no' }">
		<img alt="" src="../photo/NoImage.png">
	</c:if>
	
	
	
</body>
</html>