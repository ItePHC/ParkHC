<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 200px 200px;">
		<form action="delete" method="post">
			<input type="hidden" name="num" value="${num }"> <input
				type="hidden" name="currentPage" value="${currentPage }">
			<div class="alert alert-danger" style="width: 300px; font-size: 1.3em;">
				<b>비밀번호를 입력해 주세요</b>
				</div>
				<div class="d-inline-flex">
					<input type="password" name="pass" class="form-control"
						style="width: 120px;" required="required">

					<button type="submit" class="btn btn-outline-info">삭제하기</button>
					<button type="button" class="btn btn-outline-info"
						onclick="history.back()">이전으로 이동</button>
				</div>
			
		</form>
	</div>
</body>
</html>
