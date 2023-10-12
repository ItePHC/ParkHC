<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<h3>2번예제</h3>
<br>
<button type="button" id="btn" class="btn btn-info">list2 json데이터 출력</button>
<div id="out"></div>
<script type="text/javascript">
	$("#btn").click(function() {
		$.ajax({
			type:"get",
			dataType : "json",
			url : "list2",
			success:function(res){
				$("#out").empty();
				$("#out").append("이름 : " + res.sang + "<br>");
				$("#out").append("가격 : " + res.price + "<br>");
				$("#out").append("색상 : " + res.color + "<br>");
			}
		});
	});
</script>
</body>
</html>