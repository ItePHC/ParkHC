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
	<h3 class="alert alert-info">4번예제</h3>
	<br>
	<h4>메뉴명을 입력 후 엔터를 쳐주세요</h4>
	<input type="text" id="search" class="form-control"
		style="width: 150px;">
	<br>
	<br>	
	<h2 id="foodname"></h2>
	<div>
		<img alt="" src="" id="foodphoto" style="width: 200px;">
	</div>
	<script type="text/javascript">
		$("#search").keypress(function(e) {
			if(e.keyCode==13){
				
				var name=$(this).val();
			//	alert(name);
			
			
			$.ajax({
				type : "get",
				dataType : "json",
				url : "list4",
				data:{"name",name},
				success : function(res) {
					$("#foodname").text(res.name);
					$("#foodphoto").attr("src","image/"+res.photo);
					$("#search").val('')
				}
			});
			}
		});
	</script>
</body>
</html>