<%@page import="data.dto.SmartDto"%>
<%@page import="java.text.SimpleDateFormat"%>

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
<style>
	span.day{
	color: gray; font-size:0.8em; float: right;
	}
	img {
	max-width: 300px; max-height: 300px;
}
</style>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>

<body>
<%
	String num = request.getParameter("num");

	String currentPage = request.getParameter("currentPage");
	dao.updateReadCount(num);
	
	SmartDto dto = dao.getDate(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<tr>
			<td>
				<b><h2>제목 : <%=dto.getSubject() %></h2></b>
				<span class="day">
				<b>작성자 : <%=dto.getWriter() %></b>
				<br>
				<%=sdf.format(dto.getWriteday())%>
				&nbsp;&nbsp;&nbsp;&nbsp;조회수 : <%=dto.getReadcount() %></span>
			</td>
		</tr>
		<tr height="150">
			<td>
				<b><%=dto.getContent() %></b>
			</td>
		</tr>
		<tr>	
			<td align="right">
				<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>'">수정</button>
				<button type="button" class="btn btn-outline-success" onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	function funcdel(num, currentPage) {
		// alert(num + ", " + currentPage);
		
		var a = confirm("삭제를 원하시면 [확인]을 눌러주세요");
		if(a){
			location.href="board/deleteaction.jsp?num="+num+"&currentPage="+currentPage
		}
	}
</script>
</body>
</html>