<%@page import="model.sinsang.SinsangDto"%>
<%@page import="model.sinsang.SinsangDao"%>
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
<%
	String num = request.getParameter("num");
	SinsangDao dao = new SinsangDao();
	SinsangDto dto = dao.getData(num);
%>
<body>
	<form action="updateAction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<table class = "table table-bordered" style="width: 400px;">
		<tr>
			<th>수정할 이름</th>
			<td>
				<input type="text" name = "name" value="<%=dto.getName() %>" required="required"> 
			</td>
		</tr>
		
		<tr>
			<th>변경할 주소</th>
			<td>
				<input type="text" name = "addr" style="width: 150px;" value="<%=dto.getAddr() %>"
				 required="required"> 
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value= "수정" class="btn btn-danger">
				<input type="button" value="목록" onclick="location.href = 'list.jsp'"
				class="btn btn-success">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>