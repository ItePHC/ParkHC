<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
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
<form action="deleteAction.jsp">
<%
	String num = request.getParameter("num");
	SimpleGuestDao dao = new SimpleGuestDao();
	SimpleGuestDto dto = dao.getData(num);
%>
	<table class="table table-bordered" style="width:500px;">
			<tr><%=dto.getNum() %>번 게시물 삭제</tr>
			<tr><input type="hidden" name="num" value="<%=dto.getNum()%>"></tr>
			<tr align="center">
				<td><input type="password" name="pass" required="required" style="width: 260px"></td>
			</tr>
			<tr>	
				<td align="right">
					<button type="submit" class="btn btn-danger">삭제</button>
					<input type="button" value="목록" class="btn btn-outline-success" onclick="location.href='guest_list.jsp'">
				</td>
			</tr>
	</table>
</form>
</body>
</html>