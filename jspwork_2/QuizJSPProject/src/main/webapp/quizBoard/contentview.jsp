<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quizBoard.QuizBoardDto"%>
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
<jsp:useBean id="dao" class="db.quizBoard.QuizBoardDao"/>
<%
	// num을 읽는다	
	String num = request.getParameter("num");
	
	// dao선언
	// 조회수 1 증가
	dao.updateReadCount(num);
	
	// dto
	QuizBoardDto dto = dao.getBoard(num);
	
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<div>
	<table>
		<table class="table table-bordered" style="width: 800px">
		<caption align="top"><b><%=dto.getTitle() %></b></caption>
			<tr>
				<td align="right">
					<b>작성자 : <%=dto.getWriter() %></b><br>
					<b>조회 : <%=dto.getReadcount() %></b>
				</td>
			</tr>
			<tr height="150">
				<td>
					<%=dto.getContent().replace("\n", "<br>") %><br>
					<img src="../fileupload/<%=dto.getImgname() %>" style="width: 100px; height: 100px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="location.href='quizlist.jsp'" style="width: 100px" value="목록" class="btn btn-info">
				</td>
			</tr>
		</table>
	</table>
</div>
</body>
</html>