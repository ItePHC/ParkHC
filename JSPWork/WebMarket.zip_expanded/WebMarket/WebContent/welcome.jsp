<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Date" %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<title>welcome</title></head>
<body>
	<%@include file="menu.jsp" %>
	<%!String greeting="웹 쇼핑몰에 오신것을 환영합니다." ;
		String tagline="Welcome to Web Market";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	
	
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
			<%
				response.setIntHeader("Refresh",1);
				
				// response.setIntHeader("location.href='addBook.jsp'",20);
				Date day=new java.util.Date();
				String am_pm;
				int hour=day.getHours();
				int minute=day.getMinutes();
				int second=day.getSeconds();
				if(hour/12==0){
					am_pm="오전";
				}else{
					am_pm="오후";
					hour=hour-12;
				}
				if(second/10==0){
					String CT=am_pm +"  "+ hour+":"+minute+":0"+second;
					out.println("현재 접속 시각: "+CT+"\n");
				}else{
					String CT=am_pm +"  "+ hour+":"+minute+":"+second;
					out.println("현재 접속 시각: "+CT+"\n");
				}
				
				
				
			
			%>
		</div>
		<hr>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>