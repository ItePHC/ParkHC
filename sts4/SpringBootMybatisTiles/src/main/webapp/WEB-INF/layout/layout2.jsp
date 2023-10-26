<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@	taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.layout div {
		
		margin: auto;
	}
	div.layout div.title {
		border: 0.12vh solid gray;
		width: 40%;
		height: 4vh;
		
	}
	div.layout div.menu {
		/* border: 0.12vh solid gray;*/
		position: absolute;
		margin-top: 2%;
		left:7.5%;
		height: 2%;
		right:10%;
		/* align-items: center; */
		
		width: 80%;
	}
	

	
	div.layout div.main {
		border: 0.12vh solid gray;
		position: absolute;
		
		margin-left : 2%;
		left: 16%;
		height: 60vh;
		font-family: 'Dongle';
		font-size: 3vh;
		width: 63%;
		margin-top : 9%;	
	}
	
</style>
</head>
<body>
<div class="layout">
	<div class="title">
		<tiles:insertAttribute name="title2"/>
	</div>
	
	<div class="menu">
		<tiles:insertAttribute name="menu2"/>
	</div>
	
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
	
</div>
</body>
</html>