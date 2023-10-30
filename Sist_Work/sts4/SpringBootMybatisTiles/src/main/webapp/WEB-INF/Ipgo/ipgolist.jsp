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
	<c:if test="${totalCount==0 }">
		<div class="alert alert-info" style="width: 836px;">
			<b>저장된 상품정보가 없습니다</b>
			<caption align="top">
				<span style="float: right;">
					<button type="button" class="btn btn-success" onclick="location.href='ipgoform'">상품추가</button>
				</span>
			</caption>
		</div>
	</c:if>
	<c:if test="${totalCount>0 }">
		<div class="alert alert-info" style="width: 800px;">
			<b>총 ${totalCount }개의 상품정보가 있습니다</b>
			<caption align="top">
				<span style="float: right;">
					<button type="button" class="btn btn-success" onclick="location.href='ipgoform'">상품추가</button>
				</span>
			</caption>
		</div>
	</c:if>	 
	<div class="alert alert-dark" style="width: 836px;">
	<table class="table table-bordered" style="width: 800px;">
		<c:forEach items="${list }" var="dto">
			<tr>
				<c:if test="${dto.photoname != 'no' }">
					<td width="400" rowspan="4">
						<c:forTokens var="pho" items="${dto.photoname }" delims="," begin="0" end="0">
							<a href="content?num=${dto.num }">
								<img alt="" src="../upload/${pho }" style="width: 200px; height: 300px;">
							</a>
						</c:forTokens>
					</td>
				</c:if>
				
				<c:if test="${dto.photoname == 'no' }">
					<td width="400" rowspan="4">
						<a href="content?num=${dto.num }">
							<img alt="" src="../image/NoImage.png" style="width: 200px; height: 300px;">
						</a>
					</td>
				</c:if>
			</tr>
			<tr>
				<td>
					<b>상품명 : ${dto.sangpum }</b>
				</td>
			</tr>
			<tr>
				<td>
					<b>단가 : <fmt:formatNumber value="${dto.price }" type="currency"/></b>
				</td>
			</tr>
			<tr>
				<td>
					<b>입고일 : <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/> </b>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="float: right;">
						<button type="button" class="btn btn-outline-success" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-success" onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>