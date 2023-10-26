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
.navbar {
	text-align: center;
	position: relative;
	list-style: none;
	display: table;
	width:80%;
	margin-left: 10%;
}

.navbar > a {	
	
	position: relative;
	width: 16%;
	float: left;
	margin-right : 3%;
	text-align: center;
	font-size: 2vh;
	font-family: Nanum Pen Script;
	cursor: pointer;
	margin: 2%;
	text-decoration: none;
	color: black;
	float: left;
}


</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>" />
<body>
	
		
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  
		<div>
			<a href="${root }/">Home</a>
			<a href="${root }/ipgo/ipgoform">상품등록</a>
			<a href="${root }/ipgo/list">상품목록</a>
			<a href="${root }/board/list">게시판</a>	
			<a href="${root }/load/map">오시는길</a>
		</div>
	
	</nav>
	
</body>
</html>