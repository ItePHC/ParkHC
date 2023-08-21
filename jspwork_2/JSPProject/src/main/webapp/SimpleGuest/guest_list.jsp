<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		SimpleGuestDao dao = new SimpleGuestDao();
		ArrayList<SimpleGuestDto> list = dao.getAllGuest();
		
	%>
	<div style="margin: 50px; 100px">
		<button type="button" class="btn btn-outline-success" onclick="location.href='insertForm.jsp'">글쓰기</button>
	</div>
	
	<%
		for(int i=0;i<list.size();i++){
		SimpleGuestDto dto = list.get(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년-MM월-dd일");
	%>
	
	<table class="table table-bordered" style="width : 600px;">
		<tr>
			<td>
			<b>번호 : <%=dto.getNum() %></b>
			
			</td>
			<td>
			<b>작성자 : </b><%=dto.getNick() %>
			</td>
			<td align="right">
			<b style="color: gray"><%=sdf.format(dto.getWriteday())%></b>
			<br>
			<button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='deleteForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
			</td>
		</tr>
		<tr height="100">	
			<td colspan="2" valign="top">
				<img src="../Image/avata/b<%=dto.getImage()%>.png" style="width: 80px;">
				<pre>
					<%=dto.getStory() %>
				</pre>
			</td>			
		</tr>
	<%}
	%>	
	</table>
</body>
</html>