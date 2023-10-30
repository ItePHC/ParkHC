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
	String [] str={"15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg", "21.jpg", "22.jpg", "24.jpg"};
	int n = 0;
%>
<table class="table table-bordered" style="width: 460px">
	<%
	for(int i=0;i<3;i++)
	{%>
		<tr>
		<%
			for(int j=0;j<3;j++)
			{%>
				<td>
					<img alt="" src="../Image/<%=str[n]%>" width="150" height="150">
				</td>
			<%
				n++;
			}
		%>
		</tr>
	<%}
	%>
</table>
</body>
</html>