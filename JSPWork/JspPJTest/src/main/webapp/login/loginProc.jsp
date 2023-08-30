<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String checksave=request.getParameter("checksave"); //체크안하면 null
	
	MemberDao dao=new MemberDao();
	boolean flag=dao.authentification(id, pass);
	
	if(flag)
	{
		session.setMaxInactiveInterval(60*60*3); //3시간
		session.setAttribute("loginOk", "yes");
		session.setAttribute("myId", id);
		session.setAttribute("saveOk", checksave==null?null:"yes");
		
		response.sendRedirect("../index.jsp?main=login/loginMain.jsp");
	}
	else{%>
		<script>
			alert("아이디와 비밀번호가 일치하지 않습니다");
			history.back();
		</script>
	<%}
	%>
</body>
</html>