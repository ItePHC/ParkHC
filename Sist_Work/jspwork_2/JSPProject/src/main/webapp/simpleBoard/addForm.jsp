<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">		<%-- 아이콘  --%>
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 30px; 30px; width: 400px;">
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered">
				<caption align="top"><b><i class="bi bi-pencil"></i>글쓰기</b></caption>
				<tr>
					<th style="background-color: lightpink">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" required="required" autofocus="autofocus" style="width: 150px">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: lightpink">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control" required="required" autofocus="autofocus" style="width: 150px">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: lightpink">제목</th>
					<td>
						<input type="text" name="subject" class="form-control" required="required" autofocus="autofocus" style="width: 150px">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<textarea style="width: 390px; height: 150px;" class="form-control" required="required" name="story" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="image" src="../Image/submitImg.png" style="100px">  <%-- 타입이 이미지일경우 자동으로 submit --%>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="image" src='../Image/listImg.png'  style="width: 100px" onclick="location.href='boardList.jsp'; return false;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>