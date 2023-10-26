<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@	taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
div.layout {
	margin: auto;
}

div.layout div.title {
	position: absolute; 
	width: 100%;
	height: 20vh;
}

div.layout div.menu {
	margin-top:20vh;
	position: absolute;
	width: 100%;
}

div.layout div.info {
	border: 0.12vh solid gray;
	position: absolute;
	margin-top: 36vh;
	margin-left: 2%;
	height: 65%;
	font-family: 'Dongle';
	font-size: 3vh;
	width: 14%;
}

div.layout div.main {
	border: 0.12vh solid gray;
	position: absolute;
	margin-left: 2%;
	left: 16%;
	height: 60vh;
	font-family: 'Dongle';
	font-size: 3vh;
	width: 63%;
	margin-top: 30vh;
}
</style>
</head>
<body>
	<div class="layout">


		<div class="title">
			<tiles:insertAttribute name="title" />
		</div>

		<div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>

		<div class="info">
			<tiles:insertAttribute name="info" />
		</div>

		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>

	</div>
</body>
</html>