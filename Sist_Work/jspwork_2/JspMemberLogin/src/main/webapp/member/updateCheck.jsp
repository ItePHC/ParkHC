<%@page import="member.model.memberDao"%>
<%@page import="member.model.memberDto"%>
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
	String num = request.getParameter("num");
	memberDao dao = new memberDao();
	memberDto dto = dao.getData(num);
	
%>
<script type="text/javascript">
	var pass = prompt("비밀번호를 입력해주세요.");
	console.log(<%=dto.getPass()%>);
	
	if(pass == <%=dto.getPass()%>){
		location.href="updateForm.jsp?num=<%=num%>";
	}else{
		alert("비밀번호를 확인해 주세요.");
		location.href="memberList.jsp";		
	}
</script>
</body>
</html>