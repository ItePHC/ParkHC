<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
	div.layout{
		border: 0px solid gray;
		position: absolute;
	}
	div.title{
		width: 100%;
		height: 220px;
		line-height: 80px;
		font-size: 30px;
		font-family: Dongle;
		text-align: center;
	}
	div.menu{
		width: 100%;
		height: 80px;
		font-family: Nanum Pen Script;
		font-size: 40px;
		text-align: center;
		top: 220px;
	}
	div.info{
		width: 180px;
		height: 500px;
		line-height: 10px;
		font-family: Nanum Pen Script;
		left: 30px;
		top: 330px;
		padding: 20px 10px;
		border: 5px groove gray;
		border-radius: 30px;
	}
	div.main{
		width: 1200px;
		height: 1000px;
		font-size: 13pt;
		font-family: Noto Serif KR;
		left: 250px;
		top: 330px;
	}
</style>
</head>
	<%
	//절대경로잡기
	String root=request.getContextPath();
	String mainPage="layout/main.jsp"; //기본페이지
	
	//url을 통해서 main값을 얻어서 메인웹페이지에 출력
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}
	%>
<body>
	<div class="layout title" style="background-image: url('<%=root%>/image2/bgf.png');background-size:cover">
		<jsp:include page="layout/title.jsp"/>
	</div>
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	<div class="layout info">
		<jsp:include page="layout/info.jsp"/>
	</div>
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/>
	</div>
</body>
</html>