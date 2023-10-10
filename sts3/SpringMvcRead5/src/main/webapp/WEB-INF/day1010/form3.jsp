<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<form action="read3" method="post">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th style="width: 200px;">상품명</th>
				<td>
					<input type="text" name="sang" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td>
					<input type="color" name="color" value="#ff0000" class="form-control">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="price" class="form-control">
				</td>
			</tr>
			
			<tr>
				<th>이미지</th>
				<td>
					<select name="image" >
						<option value="01">사진1</option>
						<option value="02">사진2</option>
						<option value="03">사진3</option>
						<option value="04">사진4</option>
						<option value="05">사진5</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">데이터 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>