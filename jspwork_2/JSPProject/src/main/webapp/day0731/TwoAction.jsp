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
	String per1=request.getParameter("person");
	String [] per2 = request.getParameterValues("person2");
	%>
	조장 1순위 : <%=per1 %><br><br>
	예비조장 : 
	<%
		if(per2 ==null)
		{%>
			<b style="color:green;">예비조장 없음</b>
		<%}else{
			for(int i=0;i<per2.length;i++)
			{%>
				[<%=per2[i] %>] &nbsp;
				
			<%}%>
			<b>총 예비조장 : <%=per2.length %>명 선택함</b>
			<%
			
		}
	%>
	
</body>
</html>