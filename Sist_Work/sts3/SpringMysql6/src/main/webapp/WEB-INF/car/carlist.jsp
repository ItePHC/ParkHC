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
	<c:if test="${totalCount==0 }">
		<h3 class="alert alert-info">저장된 차의 정보가 없습니다</h3>
	</c:if>

	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">${totalCount }개의차량이 등록되어 있습니다</h3>
	</c:if>

	<hr>

	<table class="table table-bordered" style="width: 800px;">
		<tr>
			<th width="60">번호</th>
			<th width="120">차량명</th>
			<th width="180">차 색상</th>
			<th width="120">차량가격</th>
			<th width="120">구매일자</th>
			<th width="120">수정&nbsp;&nbsp;|&nbsp;&nbsp;삭제</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.carname }</td>
				<td><div style="width: 20px; height: 20px; background-color: ${dto.carcolor};"></div>${dto.carcolor}</td>
				<td><fmt:formatNumber value="${dto. carprice}" type="currency"/></td>
				<td>${dto.carguip }</td>
				<td>
					<button type="button" class="btn btn-info btn-sm" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="location.href='deleteform?num=${dto.num}'">삭제</button>
				</td>
				
			</tr>
		</c:forEach>
	</table>

	<button type="button" onclick="location.href='writeform'">차 정보 입력</button>
</body>
</html>