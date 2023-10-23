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
	<div style="width: 100px 100px;">
		<form action="update" method="post">
			<input type="hidden" name="num" value="${dto.num }">
			<table class="table table-bordered" style="width: 800px;">
				<tr>
					<th style="width: 100px">자동차명</th>
					<td><input type="text" name="carname" class="form-control"
						style="width: 300px;" value="${dto.carname }" required="required">
					</td>
				</tr>
				<tr>
					<th style="width: 100px">가격</th>
					<td><input type="text" name="carprice" class="form-control"
						style="width: 300px;" value="${dto.carprice }" required="required">
					</td>
				</tr>
				<tr>
					<th style="width: 100px">색상</th>
					<td><input type="color" name="carcolor" class="form-control"
						style="width: 300px;" value="${dto.carcolor }"></td>
				</tr>
				<tr>
					<th style="width: 100px">구입일</th>
					<td><input type="date" name="carguip" class="form-control"
						style="width: 300px;" value="${dto.carguip }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">수정</button>
						<button type="button" onclick="location.href='carlist'"
							class="btn btn-info">목록으로 이동</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>