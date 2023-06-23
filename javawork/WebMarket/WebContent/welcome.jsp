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
				response.setIntHeader("Refresh",5);
				Date day=new java.util.Date();
				String am_pm;
				int hour=day.getHours();
				int minute=day.getMinutes();
				int second=day.getSeconds();
				if(hour/12==0){
					am_pm="AM";
				}else{
					am_pm="PM";
					hour=hour-12;
				}
				String CT=hour+":"+minute+":"+second+" "+am_pm;
				out.println("현재 접속 시각: "+CT+"\n");
			
			%>
		</div>
		<hr>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>