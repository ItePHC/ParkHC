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
<style>
	li{
		width:200px
		height: 20px;
	}
	li:hover{
		background-color: rgb(181, 201, 255);
        color: white;
        box-shadow: 5px 5px 5px rgba(128, 128, 128, 0.452);
        cursor: pointer;
	}
</style>
		<%
		request.setCharacterEncoding("utf-8");
		
		Hw0804Dao dao = new Hw0804Dao();
		Vector<Hw0804Dto> list = dao.getHw0804();
		%>
		<button type="button" class="btn btn-info" onclick="location.href='addForm.jsp'">정보 추가</button>
		
		<%
		
		
		if(list.size()==0) {
			 %>
			 
			<tr>
				<td colspan="2" align="center">
					<h5>등록된 정보가 없습니다</h5>
				</td> 
			</tr>
			<%}else{
			%>
			<h2 align="center">자기소개</h2>
			<%
			for(int i=0;i<list.size();i++){	
			Hw0804Dto dto = list.get(i);
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>
			<ul>
				<li type="submit" onclick="location.href='detail.jsp?intro_num=<%=dto.getIntro_num()%>'"><b><%=list.get(i).getIntro_name() %>의 자기소개</b></li>
			</ul>
		
		
		
		<% 
		}
	}
	%>

</body>
</html>