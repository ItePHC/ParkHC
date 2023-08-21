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
<!-- f1~f20.png 를 4행 5열로 출력하세요-->
<table class = "table table-bordered" style = "width : 600px">
<%
	
	/* String [] str = {"f1.png", "f2.png", "f3.png", "f4.png", "f5.png", "f6.png", "f7.png", "f8.png", "f9.png", "f10.png", "f11.png", "f12.png", "f13.png", "f14.png", "f15.png", "f16.png", "f17.png", "f18.png", "f19.png", "f20.png"}; */
	int n = 0;

	for(int i=1;i<=4;i++)
	{%>
		 <tr>
		 <%
			for(int j=1;j<=5;j++)
			{
			n++;
			%>
				<td>
					<img src="../Image/flower_ani/f<%=n %>.png" width="150" height="150">
				</td>
			<%}
			 %>
	 	</tr>
	<%}
	%>
	</table>
</body>
</html>