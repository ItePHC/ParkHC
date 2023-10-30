<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Hw0804.Hw0804Dto"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Hw0804.Hw0804Dao"%>
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
		String intro_num = request.getParameter("intro_num");
		Hw0804Dao dao = new Hw0804Dao();	
		Hw0804Dto dto = dao.getDetail(intro_num);
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>
<table class="table table-bordered" style="width: 800px">

	<tr class="table-info">
		<th colspan="2" ><%=dto.getIntro_name() %>의 자기소개</th>
	</tr>
	<tr>
		<th>이름</th>
		<td>
		<%=dto.getIntro_name() %>
		</td>
	</tr>
	
	<tr>
		<th>지역</th>
		<td>
		<%=dto.getIntro_city() %>
		</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>
		<%=dto.getIntro_hp() %>
		</td>
	</tr>
	
	<tr>
		<th>혈액형</th>
		<td>
		<%=dto.getIntro_blood() %>
		</td>
	</tr>
	
	<tr>
		<th>가입일</th>
		<td>
			<%=sdf.format(dto.getGaipday()) %>
		</td>
	</tr>
	
	<tr>	
		<td colspan="2" align="center">
			<button type="button" class="btn btn-success" onclick="location.href='updateForm.jsp?intro_num=<%=dto.getIntro_num()%>'">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='deleteForm.jsp?intro_num=<%=dto.getIntro_num()%>'">삭제</button>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<button type="button" class="btn btn-info" onclick="location.href='list.jsp'">목록으로 이동</button>
		</td>
	</tr>
</table>
</body>	
</html>