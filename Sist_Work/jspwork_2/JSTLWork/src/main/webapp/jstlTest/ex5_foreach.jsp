<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

	<h3>1~10 출력</h3>
	<c:forEach var="a" begin="1" end="10">
		${a }&nbsp;
	</c:forEach>

	<h3>0~30 출력 / 3의배수</h3>
	<c:forEach var="a" begin="0" end="30" step="3">
		${a }&nbsp;
	</c:forEach>

	<%
	List<String> list = new ArrayList<>();

	list.add("red");
	list.add("green");
	list.add("blue");
	list.add("yellow");
	list.add("orange");

	request.setAttribute("list", list);
	request.setAttribute("totalcount", list.size());
	// 세션에 아이디 저장
	session.setAttribute("id", "PHC");
	%>

	<h3>list에는 총 ${totalcount }개의 색상이 있습니다</h3>
	<h3>list에는 총 ${requestScope.totalcount }개의 색상이 있습니다</h3>
	<%-- 
	${변수명} 일 경우 requestScope가 생략된 것임... request에 저장된 데이터는 자바처럼 get Attribute로 얻지 않아도 바로 출력 가능하다
	하지만 세션은 sessionScope를 생략하지 않는다. (세션이 사용됨을 구분하기 위해서)
	--%>

	<h3>세션 아이디 출력</h3>
	<h4>현재 로그인한 아이디는 ${sessionScope.id }입니다</h4>


	<hr>
	<h3>list전체 출력</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>No.</th>
			<th>index</th>
			<th>color</th>
		</tr>
		<c:forEach var="s" items="${list }" varStatus="i">
			<%-- varStatus를 통해 i++로 할지 var로 받아올지 결정 가능하다 --%>
			<tr>
				<td>${i.count }</td>
				<!-- 무조건 1번부터 출력 -->
				<td>${i.index }</td>
				<!-- 실제 list의 index값 출력 -->
				<td><b style="color: ${s}">${s }</b></td>
			</tr>
		</c:forEach>
	</table>

	<h3>list index 2~4 출력</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>No.</th>
			<th>index</th>
			<th>color</th>
		</tr>
		<c:forEach var="s" items="${list }" varStatus="i" begin="2">
			<%-- varStatus를 통해 i++로 할지 var로 받아올지 결정 가능하다 --%>
			<tr>
				<td>${i.count }</td>
				<!-- 무조건 1번부터 출력 -->
				<td>${i.index }</td>
				<!-- 실제 list의 index값 출력 -->
				<td><b style="color: ${s}">${s }</b></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
