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
</head>
<body>
<!-- include : 이동했다가 돌아오는 것 -->
<!-- redirect : 값이 변했을떄 -->
<h2>다른 폴더의 파일 include하기</h2>
<h4>구구단 가져오기</h4>
<jsp:include page="./guguWrite.jsp"/>
<hr>
<h4>퀴즈 이미지 가져오기</h4>
<jsp:include page="./QuizArrImage.jsp"/>

<h3>현재파일 종료!!</h3>
</body>
</html>