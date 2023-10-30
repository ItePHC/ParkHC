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
	<div style="margin: 100px; 50px;">
		<form action="update" method="post">
			<table class="table table-bordered" style="width: 350px;">
				
				<input type="hidden" name="num" value="${dto.num }" class="form-control">
				
				<tr>
					<th>자동차 명</th>
					<td>
						<input type="text" name="carname" value="${dto.carname }" required="required" class="form-control">
					</td>
				</tr>
				<tr>
					<th>자동차 가격</th>
					<td>
						<input type="text" name="carprice" value="${dto.carprice }" required="required" class="form-control">
					</td>
				</tr>
				<tr>
					<th>자동차 색상</th>
					<td>
						<input type="color" name="carcolor" value="${dto.carcolor }" required="required" class="form-control">
					</td>
				</tr>
				<tr>
					<th>구입일</th>
					<td>
						<input type="date" name="carguip" value="${dto.carguip }" required="required" class="form-control">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">DB에 저장</button>
						<button type="button" class="btn btn-success" onclick="location.href='list'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>