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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<td>
				<h4>
					<b>${dto.subject }</b> 
					<span style="font-size: 12pt; float: right;"> 
					<b style="color: black;">조회수 : ${dto.readcount }</b>&nbsp;&nbsp;&nbsp;
						<b style="color: red;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" /></b>
					</span>
				</h4>
				<span>작성자 : ${dto.name }(${dto.myid })</span>
				<c:if test="${dto.uploadfile!='NoFile' }">
					<span style="float: right;">
						<a href="download?clip=${dto.uploadfile }"><i class="bi bi-cloud-download"></i>&nbsp;<b>${dto.uploadfile }</b></a>
					</span>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${bupload==true }">
					<img src="../savefile/${dto.uploadfile }" style="width: 200px;">
					<br>
				</c:if>
				<br>
				<div>
					${dto.content }
				</div>
			</td>
		</tr>
		
		<!-- 버튼추가 -->
		<tr>
			<td align="right">
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-outline-info" onclick="location.href='form'">글쓰기</button>
				</c:if>
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.myid }">
					<button type="button" class="btn btn-outline-info" onclick="location.href='update'">수정</button>
					<button type="button" class="btn btn-outline-info" onclick="location.href='delete'">삭제</button>
				</c:if>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</body>
</html>