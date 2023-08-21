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
	String sangname = request.getParameter("sangname");
	String phone = request.getParameter("phone");
	String [] color = request.getParameterValues("color");
	String sangpum = request.getParameter("sangpum");
	%>
	<h3>장바구니</h3>
	상품명 : <%=sangname %><br>
	기종 : <%=phone %><br>
	색상 : 
	<%
	if(color == null)
	{%>
			투명 케이스<br>
			<div style="width : 170px; height : 360px; border-radious : 40px; border : 2px solid black; background-color : white; "></div>
	<%}else{
		for(int i=0;i<color.length;i++)
		{%>
		 <br><%=color[i] %><%=sangname %><br>
		 
		<div style= "width : 170px; height: 360px; border-radius: 40px; border: 2px solid black; background-color:<%=color[i] %>"></div>
		<%}
		}
	%>
	<br>추가상품 : <%=sangpum %>
</body>
</html>