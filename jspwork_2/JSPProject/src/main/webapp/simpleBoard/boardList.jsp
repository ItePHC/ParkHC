<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.simpleBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.simpleboard.simpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
body *{
	font-family: 'Dongle'
}

a:link,a:visited{
	text-decoration: none;
	color:black;
}
a:hover{
	text-decoration: underline;
	color: magenta;
}
</style> 
</head>
<%
	simpleBoardDao dao = new simpleBoardDao();
	List<simpleBoardDto> list = dao.getAllBoards();
%>
<body>
	<div style="margin: 30px; 30px; width: 800px;">
		<button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'"><i class="bi bi-pencil-fill"></i>글쓰기</button>
	</div>
	<br>
	<h6><b>총 <%=list.size() %>개의 게시글이 있습니다</b></h6>
	<br>
	<table class="table table-bordered">
	<caption align="top"><b>간단 게시판 목록</b></caption>
		<tr>
			<th width="60">번호</th>
			<th width="360">제목</th>
			<th width="100">작성자</th>
			<th width="120">작성일</th>
			<th width="60">조회</th>
		</tr>
		<%
			if(list.size()==0){
				%>
				<tr>
					<td colspan="5" align="center">
						<h6><b>등록된 게시글이 없습니다.</b></h6>
					</td>
				</tr>
			<%}
			else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				for(int i = 0; i<list.size(); i++){
					simpleBoardDto dto = list.get(i);
					%>
					<tr>
						<td align="center"><%=list.size()-i%></td>
						<td><a href="detailView.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a></td>
						<td><%=dto.getWriter() %></td>
						<td><%=sdf.format(dto.getWriteday()) %></td>
						<td align="center"><%=dto.getReadcount() %></td>
					</tr>
				<%}
			}
		%>
	</table>
	
</body>
</html>
