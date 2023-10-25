<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
ul.menu {
	text-align: center;
	position: relative;
	list-style: none;
	display: table;
	width:100%;
}

ul.menu li {	
	
	position: relative;
	width: 10%;
	float: left;
	border: 0.1vh solid gray;
	margin-top: 1.5%;
	text-align: center;
	font-size: 3vh;
	font-family: Nanum Pen Script;
	background-color: #ffc;
	cursor: pointer;
	margin: 2%;
}

ul.menu li a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>" />
<body>
	<ul class="menu">
		<li><a href="${root }">Home</a></li>
		<li><a href="${root }/ipgo/ipgoform">상품등록</a></li>
		<li><a href="${root }/ipgo/list">상품목록</a></li>
		<li><a href="${root }/board/list">게시판</a></li>
		<li><a href="${root }/member/list">회원목록</a></li>
		<li><a href="${root }/member/form">회원가입</a></li>
		<li><a href="${root }/load/map">오시는길</a></li>
	</ul>
</body>
</html>