<%@page import="idx.model.IdxDao"%>
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
	
	//id와 pass가 맞는지 확인
	IdxDao db = new IdxDao();
	boolean flag=db.isLogin(id, pass);
			
	//맞다면 세션 지정 후 LoginMain으로 이동
	if(flag){
		//보안 로그인 중인지 알 수 있는 세션 저장 
		session.setAttribute("loginok", "yes");
		//id 세션 저장
		session.setAttribute("idok", id);
		//savechk값 세션저장
		session.setAttribute("saveok", save);	//체크시 값으로 on을 받아오고 아니면 null값 획득
		
		session.setMaxInactiveInterval(60*60*8);	//8시간 동안 유지 (생략시 30분(60*30) 유지)
		
		//로그인 메인으로 이동
		response.sendRedirect("loginMain.jsp");
	}else{%>
		<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않습니다");
		history.back();
		</script>
	<%}
%>
</body>
</html>