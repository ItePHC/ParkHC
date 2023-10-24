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
	<h3>상품정보 입력</h3>
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${dto.num }">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<th style="width: 120px">상품명</th>
				<td><input type="text" name="sang" class="form-control"
					style="width: 300px;" value="${dto.sang }" required="required"></td>
			</tr>
			<tr>
				<th style="width: 120px">가격</th>
				<td><input type="text" name="price" class="form-control"
					style="width: 300px;" value="${dto.price }" required="required"></td>
			</tr>
			<tr>
				<th style="width: 120px">사진</th>
				<td><input type="file" name="upload" class="form-control"
					style="width: 300px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">저장</button>
					<button type="button" onclick="location.href='list'"
						class="btn btn-info">목록으로 이동</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
