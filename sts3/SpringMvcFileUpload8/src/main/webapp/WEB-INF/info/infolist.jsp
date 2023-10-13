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
		<h3 class="alert alert-info"><b style="color: red">등록된 데이터가 없습니다</b><div align="right"><button type="button" onclick="location.href='addform'" class="btn btn-success" >글쓰기</button></div></h3>
	</c:if>
	<c:if test="${count!=0 }">
		<h3 class="alert alert-info">${count }개의 데이터가 있습니다<div align="right"><button type="button" onclick="location.href='addform'" class="btn btn-success" >글쓰기</button></div></h3>
	</c:if>
	
	<hr>
	<table class="table table-bordered" style="width: 800px;">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>사진</th>
			<th>운전면허</th>
			<th>주소</th>
			<th>작성일</th>
			<th>편집</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.name}</td>
				<td>
					<c:if test="${dto.photo!='no'}">
						<img alt="" src="../photo/${dto.photo }" width="50" height="50" class="img-circle">
					</c:if>
					<c:if test="${dto.photo=='no'}">
						<img alt="" src="../photo/NoImage.png" width="50" height="50" class="img-circle">
					</c:if>
				</td>
				<td>${dto.driver }</td>
				<td>${dto.addr }</td>
				<td>
					<%-- ${dto.gaipday } --%>
					<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd HH시mm분"/>
				</td>
				<td>
					<button class="btn btn-outline-info" onclick="location.href='uform?num=${dto.num}'">수정</button>
					<button class="btn btn-outline-danger" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>