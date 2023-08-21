<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.simpleBoardDto"%>
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
	span.day{color: gray; font-size: 0.8em}
</style>
</head>
<body>
<jsp:useBean id="dao" class="db.simpleboard.simpleBoardDao"/>
<%
	// num을 읽는다	
	String num = request.getParameter("num");
	
	// dao선언
	// 조회수 1 증가
	dao.updateReadCount(num);
	
	// dto
	simpleBoardDto dto = dao.getBoard(num);
	
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
	<div style="margin: 30px 30px; width: 500px">
		<table class="table table-bordered">
			<caption align="top"><b><%=dto.getSubject() %></b></caption>
			<tr>
				<td>
					<b>작성자 : <%=dto.getWriter() %></b><br>
					<span class="day" ><%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;&nbsp;&nbsp;조회 : <%=dto.getReadcount() %></span>
				</td>
			</tr>
			
			<tr height="150">
				<td>
					<%=dto.getStory().replace("\n", "<br>") %>				<%-- pre태그 안에 쓰거나 replace()를 이용한다 : db저장시 br태그가 \n 으로 저장된다.. 그러므로 출력시 다시 br로 변환 --%>
					
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-success" onclick="location.href='addForm.jsp'"><i class="bi bi-pencil"></i>글쓰기</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='boardList.jsp'"><i class="bi bi-list-ul"></i>목록</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='updatePassForm.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-pencil-square"></i>수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-trash3"></i>삭제</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>