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
<style type="text/css">
div {
	float: left;
}
</style>
</head>
<body>
	<table class="table table-bordered"
		style="width: 600px; height: 200px;">
		<div class="mv_info">
			<div class="poster" class="form form-control">
				<c:if test="${dto.mv_poster=='no'}">
					<img alt="" src="../save/NoImage.png"
						style="width: 240px; height: 360px;">
				</c:if>
				<c:if test="${dto.mv_poster!='no'}">
					<img alt="" src="../save/${dto.mv_poster }"
						style="width: 240px; height: 360px;">
				</c:if>
			</div>
			<div class="info" class="form form-control">
				<h3>영화제목 : ${dto.mv_title }</h3>
				<br>
				<h5>감독 : ${dto.mv_director }</h5>
				<br>
				<h5>개봉일 : ${dto.mv_opendate }</h5>
				<br>
				<button type="button" class="btn btn-outline-success" onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href=''">삭제</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
			</div>
		</div>
	</table>
</body>
</html>