<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="insertAdminAction.jsp" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 550px; margin-left: 500px">
		
		<%-- select type으로 만들어보기 --%>
		
		<h1 style="margin-left: 570px">메뉴 추가</h1>
		<tr>
			<th style="width: 160px; text-align: center;" >메뉴명</th>
			<td>
				<input type="text" name = "name" style="width: 300px;" placeholder="이름 입력"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align: center;">종류</th>
			<td style="width: 300px;">
			<input type="radio" name="type" value="pone" >커피<br>
			<input type="radio" name="type" value="ptwo">스무디&프라페<br>
			<input type="radio" name="type" value="pthree">에이드&주스<br>
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align: center;">이미지</th>
			<td>
				<input type="file" name = "uploadImage" style="width: 300px;" placeholder="상품 이미지 업로드"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align: center;">가격</th>
			<td>
				<input type="text" name = "price" style="width: 300px;" placeholder="가격"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align: center;">수량</th>
			<td>
				<input type="number" name="stock" style="width: 300px;" placeholder="수량 입력"
				 min="1" required="required" class="form form-control"> 
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-outline-success">
				<input type="button" value="관리자 페이지로 이동" onclick="location.href = 'list_admin.jsp'"
				class="btn btn-outline-primary">
			</td>
		</tr>
	</table>
</form>
</body>
</html>