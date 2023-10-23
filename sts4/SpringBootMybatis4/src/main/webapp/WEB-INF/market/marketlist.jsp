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
</head>
<body>
	<c:if test="${totalCount==0 }">
		<div class="alert alert-info">
			<b>저장된 상품정보가 없습니다</b>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-info">
			<b>총 ${totalCount }개의 상품정보가 있습니다</b>
		</div>
	</c:if>
	<table class="table table-bordered" style="width: 800px;">
		<tr align="center">
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>입고일자</th>
			<th>편집</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td><a href="detail?num=${dto.num }"> <img
						style="width: 40px; height: 40px; border: 1px; border-radius: 60px;"
						alt="" src="../save/${dto.photoname }"> ${dto.sang }
				</a></td>
				<td align="center"><fmt:formatNumber value="${dto.price }"
						type="currency"></fmt:formatNumber></td>
				<td align="center"><fmt:formatDate value="${dto.ipgoday }"
						pattern="yyyy-MM-dd" /></td>
				<td align="center">
					<button type="button" class="btn btn-info btn-sm"
						onclick="location.href='updateform?num=${dto.num}'">수정</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-danger btn-sm"
						onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>

		</c:forEach>
	</table>
	<div style="margin: 50px 50px;">
		<button type="button" onclick="location.href='writeform'"
			class="btn btn-success">글쓰기</button>
	</div>
</body>
</html>