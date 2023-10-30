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
이름 : ${dto.name }<br>
<div style="color: ${dto.color}">좋아하는 색 : ${dto.color }</div>
<c:set var="hobby" value="${dto.hobby }"/>
<c:if test="${empty dto.hobby }">취미 : 없음<br></c:if>
<c:if test="${!empty dto.hobby }">
	취미 : 
	<c:forEach var="h" items="${dto.hobby }">
	[${h}]
	</c:forEach>
</c:if>
<br>
<%-- 취미 : ${hobby!=null?hobby :"없음" }<br> --%>
좋아하는 언어 : ${dto.lng }
</body>
</html>