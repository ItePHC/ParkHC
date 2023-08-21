<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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
<div style="margin-left: 100px; margin-top: 30px"> 
<a class="alert alert-info">상품목록&nbsp;</a>
<button type="button" class="btn btn-info" onclick="location.href='addForm.jsp'">데이터 추가</button>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	MallDao dao = new MallDao();
	Vector<MallDto> list = dao.getAllMyMall();
	
	%>
	<table class="table table-bordered" style="width: 800px">
	<tr class="table-success">
		<th>번호</th>
		<th>상품명</th>
		<th>상품사진</th>
		<th>가격</th>
		<th>입고일</th>
		<th>작성일</th>
		<th>수정 | 삭제</th>
	</tr>
	<%
	if(list.size()==0){
		%>
		<tr>
			<td colspan="7" align="center">
			<h5>등록된 상품이 없습니다</h5>
			</td>
		</tr>
		<%}else{			
			for(int i=0;i<list.size();i++){
				MallDto dto = list.get(i);
				NumberFormat nf = NumberFormat.getCurrencyInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH시");
				
			%>
			
			
			<tr>
				<td align="center"><%=i+1 %></td>
				
				<td><%=list.get(i).getSangpum() %></td>
				<td><img src="<%=list.get(i).getPhoto()%>" onclick="location.href='detailPage.jsp?no=<%=dto.getNo() %>'" style="border:2px solid green; width: 100px; height: 150px; border-radius: 60px"></td>
<%--		 	<td><%=nf.format(Integer.parseInt(dto.getPrice()))%></td> --%>
				<td><%=list.get(i).getPrice() %> </td>
				<td><%=dto.getIpgoday()%></td>
				<td><%=dto.getWriteday() %></td>
				<td>
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='updateForm.jsp?no=<%=dto.getNo()%>'">수정</button>
				<button type="button" class="btn btn-danger btn-sm" onclick="location.href='deleteMall.jsp?no=<%=dto.getNo()%>'">삭제</button>
				</td>
			</tr> 
			<%}
			}
	%>
	
</table>
</div>
</body>
</html>