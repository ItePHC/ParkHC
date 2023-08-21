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
		request.setCharacterEncoding("utf-8");
		
		//세션이 있는지 확인 후 없으면 꽝 으로 출력
		String msg = (String)session.getAttribute("msg");
		String travel = request.getParameter("travel");
		
		if(msg == null || !msg.equals("happy")){
			%>
			<h3 style="color: red">시간초과로 꽝 입니다</h3>
			
			<%
		}else{%>
			<h3>축!!! <%=travel %>상품에 당첨됨</h3>
		<%}
	%>
	<a href="SessionForm.jsp">다시 선택</a>
</body>
</html>