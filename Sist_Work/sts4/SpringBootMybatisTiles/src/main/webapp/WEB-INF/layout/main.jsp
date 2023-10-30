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
<script type="text/javascript">
	/*
	 var color = [
	 '#000000',
	 '#ffffff',
	 ]

	 var container = document.getElementById('container');
	 var color = document.getElementById('color');

	 var colorIndex = 0;
	 var scrollValue = 0;		//get mouse wheel value
	 var dateNow = Date.now();
	 $(function() {
	 $(function changeBgColor(e) {
	 scrollValue += e.deltaY * 0.01;
	 console.log(scrollValue);
	
	 //위로 Scroll
	 if (scrollValue > 10 && timePassed > 500) {
	 dateNow = Date.now();
	 colorIndex += 1;
	 if (colorIndex > colors.length-1) colorIndex = 0;
	 container.style.backgroundColor = colors[colorIndex];	//배경색 변경
	 scrollValue = 0;	//스크롤 값 초기화
	 }

	 //아래로 Scroll
	 if (scrollValue < -10 && timePassed > 500) {
	 dateNow = Date.now();
	 colorIndex -= 1;
	 if (colorIndex < 0) colorIndex = colors.length-1;
	 container.style.backgroundColor = colors[colorIndex];	//배경색 변경
	 scrollValue = 0;	//스크롤 값 초기화
	 }
	 e.preventDefault(); // disable the actual scrolling
	 }
	 });
	 });
	 */
</script>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
	<h2>
		<b style="size: 2vh; height: 4vh;">MainPage입니다</b>
		<c:if test="${sessionScope.loginok==null }">
			<button type="button" class="btn btn-success"
				onclick="location.href='${root}/login/main'">Login</button>
		</c:if>
		<c:if test="${sessionScope.loginok!=null }">
			<b>${sessionScope.myid}님이 로그인 중...</b>
			<button type="button" class="btn btn-success"
				onclick="location.href='${root}/login/logoutprocess'">
				LogOut</button>
		</c:if>
	</h2>

	<img alt="" src="${root }/image/oneday01.jpg">
	<br>
	<img alt="" src="${root }/image/oneday02.jpg">
	<br>
	<img alt="" src="${root }/image/oneday03.jpg">
	<br>
</body>
</html>
