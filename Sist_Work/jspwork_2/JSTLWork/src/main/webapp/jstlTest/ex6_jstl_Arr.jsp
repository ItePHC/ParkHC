<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="s" begin="1" end="10">
	[${s }] &nbsp;
	</c:forEach>
	<br>

	<%
	String[] myColor = { "red", "blue", "yellow", "green", "orange", "purple", "gray" };
	%>

	<c:set var="mycolor" value="<%=myColor%>" />

	<table class="table table-bordered" style="width: 300px;">
		<caption align="top">
			<b>모든 값 출력</b>
		</caption>
		<tr>
			<th>index</th>
			<th>count</th>
			<th>color</th>
		</tr>

		<c:forEach var="a" varStatus="i" items="${mycolor }">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a}">${a }</td>
			</tr>
		</c:forEach>
	</table>

	<!-- 2~5번 출력 -->
	<table class="table table-bordered" style="width: 300px;">
		<caption align="top">
			<b>일부 값 출력</b>
		</caption>
		<tr>
			<th>index</th>
			<th>count</th>
			<th>color</th>
		</tr>
		<c:forEach var="a" varStatus="i" items="${mycolor }" begin="2" end="5">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a}">${a }</td>
			</tr>
		</c:forEach>
	</table>

	<hr>

	<c:set var="msg" value="민규,성신,영환,성경,희찬" />
	${msg}
	<br>

	<h2>msg값을 컴마로 분리해서 출력</h2>

	<c:forTokens var="s" items="${msg }" delims="," varStatus="i">
		<h3>${i.count }:${s }</h3>
	</c:forTokens>
</body>
</html>
