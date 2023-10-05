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
<h3>안녕하세요 우리는 오늘부터<br>스프링 MVC에 대해 공부합니다</h3>
<h2>StartController로 부터 포워드</h2>
<b>이름 : ${requestScope.name }</b><br>
<b>주소 : ${addr }</b><br>

<h1 class="alert alert-info">매핑연습</h1>
<ul>
	<li><a href="apple/list">Apple/List</a></li>
	<li><a href="apple/list.do">Apple/List.do</a></li>
	<li><a href="apple/list.nhn">Apple/List.nhn</a></li>
	
	<li><a href="banana/insert">Banana/Insert</a></li>
	<li><a href="orange/delete">Orange/Delete</a></li>
</ul>

<h1 class="alert alert-success">이미지연습</h1>
<ul>
	<li><a href="shop/detail">resource의 이미지 출력</a></li>
	<li><a href="board/insert/data">WEB-INF의 이미지 출력</a></li>
	<li><a href="">resource의 이미지 출력</a></li>
	<li><a href="">resource의 이미지 출력</a></li>
</ul>
</body>
</html>

