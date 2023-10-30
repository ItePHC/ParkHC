<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
#selphoto{
	position: absolute;
	left: 600px;
	top: 50px;
	width: 200px;
	height: 300px;
	border: 2px solid black;
	border-radius: 60px;
}
</style>
<script type="text/javascript">
	$(function(){
		var srcImg=$("#photo").val();
		// 첫 이미지를selphoto에 넣기
		$("#selphoto").attr("src",srcImg);
		
		
		$("#photo").change(function(){
			// 바꾼 이미지를 출력시키기
			var s=$(this).val();
			$("#selphoto").attr("src",s);
		}); 
	});
</script>
</head>
<body>
	<div style="margin-left: 100px; margin-top: 30px"> 
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered" style="width: 400px">
		<th colspan="2" style="text-align: center">상품등록</th>
		<tr>
			<th>상품명</th>
			<td>
				<input type="text" name="sangpum" class="form-control" required="required" style="width: 250px">
			</td>
		</tr>
		
		<tr>
			<th>상품사진</th>
			<td>
			<select id="photo" class="form-control" style="width: 100px" name="photo">
				<option value="../Image/shoppingmall/28.jpg">원피스</option>
				<option value="../Image/shoppingmall/22.jpg">반지</option>
				<option value="../Image/shoppingmall/21.jpg">귀걸이</option>
				<option value="../Image/shoppingmall/20.jpg">시계</option>
				<option value="../Image/shoppingmall/34.jpg">반바지</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<th>가격</th>
			<td>
				<input type="text" name="price" class="form-control" required="required" style="width: 250px">
			</td>
		</tr>
		
		<tr>
			<th>입고일</th>
			<td>
				<input type="date" name="ipgoday" class="form-control" required="required" style="width: 250px">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success">상품 입고 정보 저장</button>
				<button type="button" class="btn btn-info" onclick="location.href='list.jsp'">목록으로 이동</button>
			</td>
		</tr>
		</table>
		<img alt="" src="" id="selphoto" >
	</form>
	</div>
</body>
</html>