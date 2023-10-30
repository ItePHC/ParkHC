<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 30px; width: 350px;">
		<form action="quizaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<caption align="top"><b><i class="bi bi-pencil"></i>게시글 작성</b></caption>
				<tr>
					<th style="background-color: pale green">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" required="required"  style="width: 200px">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: pale green">제목</th>
					<td>
						<input type="text" name="title" class="form-control" required="required"  style="width: 200px">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<textarea style="width: 300px; height: 150px;" class="form-control" required="required" name="content" ></textarea>
					</td>
				</tr>
				
				<tr>
					<th style="background-color: pale green">이미지</th>
					<td>
						<input type="file" name="imgname" class="form-control" style="width: 200px">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" style="width: 100px" value="제출" class="btn btn-success">
						<input type="button" onclick="location.href='quizlist.jsp'" style="width: 100px" value="목록" class="btn btn-info">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>