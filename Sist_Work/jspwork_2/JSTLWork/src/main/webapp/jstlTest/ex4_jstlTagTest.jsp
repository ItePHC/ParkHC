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
	<fmt:requestEncoding value="utf-8" />
	<form action="" method="post" style="width: 400px;">
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control"
					style="width: 120px;"></td>
			</tr>

			<tr>
				<th>나이</th>
				<td><input type="text" name="age" class="form-control"
					style="width: 120px;"></td>
			</tr>

			<tr>
				<th>급여</th>
				<td><input type="text" name="pay" class="form-control"
					style="width: 120px;"></td>
			</tr>

			<tr>
				<th>가고싶은 나라</th>
				<td><input type="text" name="nara" class="form-control"
					style="width: 120px;"></td>
			</tr>

			<tr>
				<td>
					<button type="submit" class="btn btn-success">결과확인</button>
				</td>
			</tr>
		</table>
	</form>

	<!-- 이름을 입력했을 경우에만 div방식으로 출력 -->
	<!-- 
		이름 : 김영환
		나이 : 19세(미성년자)... 조건문 (20살 이상이면 성인 아니면 미성년자)
		월 급여 : 1,800,000원 ... 화폐단위와 천단위 구분 기호 사용
		가고싶은 나라 : choose 이용해서 출력
	 -->
	<div style="width: 1000px;">
		<c:if test="${!empty param.name }">
			<h3>이름 : ${param.name }</h3>
			<h3>
				나이 : ${param.age }
				<c:if test="${param.age<20 }">
					<span style="color: blue;">(미성년자)</span>></c:if>
				<c:if test="${param.age>=20 }">
					<span style="color: blue;">(성인)</span>
				</c:if>
			</h3>
			<h3>
				급여 :
				<fmt:formatNumber value="${param.pay }" type="currency" />
			</h3>
			<h3>가고싶은 나라 : ${param.nara }</h3>
			<c:choose>
				<c:when test="${param.nara == '미국' }">
					<h4 style="color: red;">미국의 뉴욕</h4>
				</c:when>
				<c:when test="${param.nara == '캐나다' }">
					<h4 style="color: red;">캐나다의 토론토</h4>
				</c:when>
				<c:when test="${param.nara == '중국' }">
					<h4 style="color: red;">중국의 상해</h4>
				</c:when>
				<c:when test="${param.nara == '일본' }">
					<h4 style="color: red;">일본의 오사카</h4>
				</c:when>
				<c:otherwise>
					<h4>그 외의 나라</h4>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>

</body>
</html>
