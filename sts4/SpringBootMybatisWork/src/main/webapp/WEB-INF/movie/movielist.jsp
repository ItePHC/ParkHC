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
div.movie{
float: left
}
</style>
</head>
<body>
	<c:if test="${totalCount==0 }">
		<div class="alert alert-info">
			<b>저장된 상품정보가 없습니다</b>
			<button type="button" class="btn btn-outline-success" style="float: right;"
		onclick="location.href='insert'">영화 추가</button>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-info">
			<b>총 ${totalCount }개의 영화가 있습니다</b>
			<button type="button" class="btn btn-outline-success" style="float: right; width: 200px;"
		onclick="location.href='insert'">영화 추가</button>
		</div>
	</c:if>
	<table class="table table-bordered" style="width: 800px;">
		<c:forEach var="dto" items="${list }" varStatus="i">
			<a href="detail?num=${dto.mv_num }"> 
			<div style="width: 180px;" class="form-control movie">
			<c:if test="${dto.mv_poster=='no'}">
				<img alt="" src="../save/NoImage.png" style="width: 120px; height: 160px; border: 1px solid gray;">
			</c:if>
			<c:if test="${dto.mv_poster!='no'}">
				<img alt="" src="../save/${dto.mv_poster }" style="width: 120px; height: 160px; border: 1px solid gray;">
			</c:if>
			<hr><b>${dto.mv_title }</b>
			</div></a>
		</c:forEach>
	</table>
	
	
</body>
</html>