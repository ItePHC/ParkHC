<%@page import="db.simpleboard.simpleBoardDao"%>
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
	// num, pass
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	
	simpleBoardDao dao = new simpleBoardDao();
	boolean check = dao.getCheckPass(num, pass);
	
	//true면 수정폼으로 false면 경고창
	if(check==true){
		response.sendRedirect("deleteAction.jsp?num="+num);
	}else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
	<%}
%>
</body>
</html>