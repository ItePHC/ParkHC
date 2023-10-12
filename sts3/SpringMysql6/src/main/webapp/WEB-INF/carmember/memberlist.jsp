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
	<c:if test="${count==0 }">
		<h3 class="alert alert-info"><b style="color: red">등록된 고객 정보가 없습니다</b><button>회원 추가</button></h3>
	</c:if>
	<c:if test="${count!=0 }">
		<h3 class="alert alert-info">총 ${count }명의 고객이 있습니다<div align="right"><button type="button" onclick="location.href='insertform'" class="btn btn-success" >회원 추가</button></div></h3>
	</c:if>
	
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>회원명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>수정 및 삭제</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${dto.name }</td>
			<td>${dto.hp }</td>
			<td>${dto.addr }</td>
			<td> <fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/> </td>
			<td>
			<button type="button" onclick="location.href='updateform?num=${dto.num}'" class="btn btn-success">수정</button>
			<button type="button" onclick="location.href='deleteform?num=${dto.num}'" class="btn btn-danger">삭제</button>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>