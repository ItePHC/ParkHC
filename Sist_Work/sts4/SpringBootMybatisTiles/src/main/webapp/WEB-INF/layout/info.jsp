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
img {
	width: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />

	<!-- 로그인 안하면 기본사진, 로그인하면 자기사진으로 변경 -->
	<div class="loginmenu" style="text-align: center;">
		<b style="font: Dongle;">각종 정보 나타나게 해올 것!</b>
		<c:if test="${sessionScope.loginok==null }">
			<img alt="" src="${root }/image/oneday01.jpg" style="width: 10vh; border-radius: 60px;">
			<br>
		</c:if>
		<c:if test="${sessionScope.loginok!=null }">
			<img alt="" src="${root }/upload/${sessionScope.loginphoto }" style="width: 10vh; border-radius: 60px;">
			<br>
		</c:if>

		<button type="button" onclick="location.href='${root }/login/main'"
			class="btn btn-outline-primary">로그인페이지</button>
		<button type="button" onclick="location.href='${root }/member/myinfo'"
			class="btn btn-outline-info">나의정보</button>
		<button type="button" onclick="location.href='${root }/member/list'"
			class="btn btn-outline-secondary">회원목록</button>

	</div>
</body>
</html>