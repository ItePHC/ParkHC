<%@page import="member.model.memberDto"%>
<%@page import="member.model.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<%
	String num = request.getParameter("num");
	memberDao dao = new memberDao();
	memberDto dto = dao.getData(num);
%>
<body>
<div style="margin: 20px; 100px;">
	<form action="updateProc.jsp" method="post"  enctype="multipart/form-data" class="form-inline">
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>정보 수정</b></caption>			
			<input type="hidden" name="num" value="<%=num %>">
			<tr>
				<td style="background-color: #66ccff" width="120">아이디</td>
				<td>
					<b><%=dto.getId() %></b>
				</td>
			</tr>
			<tr>
				<td style="background-color: #66ccff" width="120">이름</td>
				<td>
					<input type="text" class="form-control" name="name" style="width: 120px;" value="<%=dto.getName() %>" required="required">
				</td>
			</tr>
			
			<tr>
				<td style="background-color: #66ccff" width="120">사진</td>
				<td>
					<input type="file" class="form-control" name="photo" style="width: 250px;">
				</td>
			</tr>
			
			<tr>
				<td style="background-color: #66ccff" width="120">핸드폰</td>
				<td>
					<input type="text" class="form-control" value="<%=dto.getHp() %>" name="hp" style="width: 200px;" required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">저장하기</button>
					<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>