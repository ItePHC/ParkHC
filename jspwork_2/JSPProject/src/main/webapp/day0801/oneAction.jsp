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
<%
	String irum = request.getParameter("irum");
	String birth = request.getParameter("birth");
	
	// select가 multiple인 경우
	//getParameterValues로 읽는다 (반환타입은 String[])
	
	// 이떄 값이 선택되지 않으면 null로 가져오고 값이 선택되면 배열[]로 값을 가져온다
	
	String [] hobby = request.getParameterValues("hobby");
%>
<h3 class="alert alert-info">폼태그로부터 읽은 값</h3>
이름 : <%=irum %><br>
생년월일 : <%=birth %><br>
취미 : 
<%if(hobby == null){%>
	취미는 없습니다
<%}else{
	/* for(String h:hobby){ */
	for(int i=0;i<hobby.length;i++){
	%>
		[<%=hobby[i] %>]&nbsp;
		
	<%}
}%>
</body>
</html>