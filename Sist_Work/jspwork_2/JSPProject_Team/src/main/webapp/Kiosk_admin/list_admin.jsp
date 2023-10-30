
<%@page import="Admin.adminDto"%>
<%@page import="java.util.ArrayList"%>
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
<style>
.btn{ 
margin-top:5px;
}
</style>
</head>
<%
	adminDao dao = new adminDao();
	ArrayList<adminDto> list = dao.getAllMenus();
%>

<body>
<div>
<button type="button" class="btn btn-outline-success" onclick="location.href='insertAdminForm.jsp'">상품 추가</button>
<table class="table table-bordered" style="width: 900px; margin-top: 10px; margin-left: 320px;">
<tr class="table-success" style="text-align: center;">
	
	<th width="450px">상품명</th>
	<th width="180px">상품 종류</th>
	<th width="120px">이미지</th>
	<th width="160px">가격</th>
	<th width="200px">재고</th>
	<th width="200px">재고관리</th>
</tr>
<%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		%>
	<tr style="text-align: center; ">
		<td><%=dto.getName() %></td>
		<td><%=dto.getType() %></td>
		<td><img src="../<%=dto.getImage() %>"  style="width:100px"></td>
		<td><%=dto.getPrice() %></td>
		<td><%=dto.getStock() %></td>
		<td class="btn">
		<button type="button" class="btn btn-outline-warning" onclick="location.href='updateAdminForm.jsp?num=<%=dto.getNum() %>'" style="width:100px">재고 관리</button><br>
		 <button type="button" class="btn btn-outline-danger" onclick="location.href='deleteAdmin.jsp?num=<%=dto.getNum() %>'" style="width:100px">상품 삭제</button>
		</td>
	</tr>	
	<%}
%>
</table>
</div>
</body>
</html>