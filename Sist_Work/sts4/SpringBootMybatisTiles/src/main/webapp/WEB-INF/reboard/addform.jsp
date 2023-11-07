<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<c:if test="${sessionScope.loginok==null }">
	<script type="text/javascript">
		alert("로그인 후 이용 가능합니다")
		history.back();
	</script>
</c:if>
</head>
<body>
	<form action="insert" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="regroup" value="${regroup }">
		<input type="hidden" name="restep" value="${restep }">
		<input type="hidden" name="relevel" value="${relevel }">
		<input type="hidden" name="currentPage" value="${currentPage }">
		<!-- hidden 2개 id, name -->
		<input type="hidden" name="id" value="${sessionScope.myid }">
		<input type="hidden" name="name" value="${sessionScope.loginname}">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" class="form-control" required="required" value="${subject }">
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="upload" class="form-control" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea style="width: 600px; height: 150px;" name="content" class="form-control">
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">게시글 저장</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>