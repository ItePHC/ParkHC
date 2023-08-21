<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered" style="width: 300px">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" class="form-control"
				required="required" style="width: 120px;" placeholder="이름">
			</td>
		</tr>
		
		<tr>
			<th>운전면허</th>
			<td>
				<input type="checkbox" name="dirver">있음
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="addr" class="form-control"
				required="required" style="width: 180px;" placeholder="주소">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success">팀원정보저장</button>
				<button type="button" class="btn btn-info" onclick="location.href='list.jsp'">목록으로 이동</button>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>