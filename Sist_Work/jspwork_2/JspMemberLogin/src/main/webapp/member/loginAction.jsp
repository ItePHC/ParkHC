<%@page import="member.model.memberDao"%>
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
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String save = request.getParameter("savechk");
	
	
	memberDao db = new memberDao();
	boolean flag=db.isLogin(id, pass);
			
	
	if(flag){
		 
		session.setAttribute("loginok", "yes");
		
		session.setAttribute("idok", id);
		
		session.setAttribute("saveok", save);
		
		session.setMaxInactiveInterval(60*30);	//최대 30분동안 로그인 상태 유지
		
	
		response.sendRedirect("memberList.jsp");
	}else{%>
		<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않습니다");
		history.back();
		</script>
	<%}
%>
</body>
</html>