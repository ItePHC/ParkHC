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
div.barlist{
	position: absolute;
	width: 100%;
	height:8vh;
	background-color: black ;
}

.navbar {
	position: absolute;
	text-align: center;
	list-style: none;
	display: flex;
	align-content:center;
	width:80%;
	height:8vh;
	margin-left: 10%;
}
.menulist {	
	position: relative;
	float: left;
	width: 10vh;
	text-align: center;
	font-size: 3vh;
	font-family: Nanum Pen Script;
	cursor: pointer;
	text-decoration: 0.03vh solid underline;
	color: white;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>" />
<body>
	<div class="barlist">
		<nav class="navbar navbar-dark">
	  		<a class="menulist" href="${root }/">Home</a>
			<a class="menulist" href="${root }/ipgo/ipgoform">상품등록</a>
			<a class="menulist" href="${root }/ipgo/list">상품목록</a>
			<a class="menulist" href="${root }/memboard/list">회원게시판</a>
			<a class="menulist" href="${root }/member/list">회원목록</a>		
			<a class="menulist" href="${root }/load/map">오시는길</a>
		</nav>
	</div>
	
	
</body>
</html>