<%@page import="Admin.adminDto"%>
<%@page import="Admin.adminDao"%>
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
	adminDao dao = new adminDao();
	adminDto dto = dao.getData(num);
	
%>
<body>
<form action="updateAdminAction.jsp" method="post">
<input type="hidden" name="num" value="<%=dto.getNum()%>">
	<table class="table table-bordered" style="width: 550px;">

		<%-- select type으로 만들어보기 --%>
		
		
		<tr>
			<th style="width: 160px; text-align:center;">상품명</th>
			<td>
				<b><%=dto.getName()%></b>
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align:center;">상품 종류</th>
			<td style="width: 300px;">
				<b><%=dto.getType() %></b>
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align:center;">상품 이미지</th>
			<td>
			<img src="../<%=dto.getImage()%>" style="width: 150px; height: 150px">
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align:center;">가격 변경</th>
			<td>
				<input type="text" name = "price" style="width: 300px;" placeholder="변경할 가격"
				 required="required" class="form form-control" value="<%=dto.getPrice()%>"> 
			</td>
		</tr>
		
		<tr>
			<th style="width: 160px; text-align:center;">수량 변경</th>
			<td>
				<input type="number" name="stock" style="width: 300px;" placeholder="수량 입력"
				 required="required" class="form form-control" value="<%=dto.getStock()%>" min="0"> 
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-info">
				<input type="button" value="관리자 페이지로 이동" onclick="location.href = 'list_admin.jsp'"
				class="btn btn-success">
			</td>
		</tr>
	</table>
</form>
</body>
</html>