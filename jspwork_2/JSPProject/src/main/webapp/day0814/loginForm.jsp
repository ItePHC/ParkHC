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
<style type="text/css">
	div.loginform{
		width: 500px;
		margin-top: 100px;
		margin-left : 33%;
	}
</style>
</head>
<body>
<%
	//세션으로부터 id랑 savechk값 얻기
	String id = (String)session.getAttribute("idok");
	String saveid = (String)session.getAttribute("saveok");
	
	boolean save = true;
	if(saveid==null){
		id = "";	// 아이디 저장하기를 체크하지 않을 경우 아이디값을 비워둔다
		save=false;	// 체크하지 않을 경우 false 그 외에는 초기값이 true이므로 true
		
	}
%>

	<div class="loginform">
		<form action="loginAction.jsp" method="post" style="border: 2px solid green">
			<input type="text" name="id" style="width: 200px;" class="form-control" placeholder="로그인 할 아이디" required="required" value="<%=id%>"><br>
			
			<input type="password" name="pass" style="width: 200px;" class="form-control" placeholder="로그인 할 비밀번호" required="required"><br>
			
			
			<button type="submit" class="btn btn-outline-success btn-lg" style="width: 200px; margin-bottom: 20px">로그인</button><br>
			<input type="checkbox" name="savechk" <%=save?"checked":"" %>>아이디 저장하기<br>
		</form>
	</div>
</body>
</html>