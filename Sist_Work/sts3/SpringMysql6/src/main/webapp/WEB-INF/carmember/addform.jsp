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
	<form action="insert" method="post">
		<table class="table table-bordered" style="width: 400px">
			<tr style="width: 150px">
				<th>이름</th>
				<td><input type="text" name="name" required="required"
					class="form-control"></td>
			</tr>
			<tr style="width: 150px">
				<th>전화번호</th>
				<td><input type="text" name="hp" required="required"
					class="form-control"></td>
			</tr>
			<tr style="width: 150px">
				<th>주소</th>
				<td><input type="text" name="addr" required="required"
					class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">DB에 저장하기</button>
					<button type="button" class="btn btn-success" onclick="location.href='list'">목록으로 돌아가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>