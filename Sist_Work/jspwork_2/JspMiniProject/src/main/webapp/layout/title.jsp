<%@page import="data.dao.ShopDao"%>
<%@page import="java.util.Date"%>
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
<style type="text/css">
	div.cart{
		float: right;
		cursor: pointer;
	}
	.count{
		width:30px;
		color:white;
		height: 30px;
		float: right;
		background-color: red;
		border-radius:100px;
		text-align: center;
		z-index: 10;
		position: relative;
		left: -20px;
		top: 10px;
		line-height: 30px;
		font-size: 0.8em;
	}
</style>
<script type="text/javascript">
$(function() {
	$("div.cart").click(function() {
		location.href="index.jsp?main=shop/mycart.jsp"
	})
	});
</script>
<title>Insert title here</title>
	<%
	//절대경로잡기
	String root=request.getContextPath();
	MemberDao dao=new MemberDao();
	String loginOk=(String)session.getAttribute("loginOk");
	String name="";
	if(loginOk!=null)
	{
		String id=(String)session.getAttribute("myId");
		name=dao.getNameFromId(id);
	}
	%>
</head>
<body>
	<a href="<%=root %>" style="color: black;"><img src="<%=root%>/image2/sistgood.png" style="width: 200px;"></a>
	<%
	if(loginOk!=null)
	{%>
		<b><%=name %> 님이 로그인 중입니다</b>
		<button type="button" class="btn btn-danger" onclick="location.href='login/logoutProc.jsp'">로그아웃</button>
	<%}else
	{%>
		<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginForm.jsp'">로그인</button>
	<%}%>
	
	<div class="cart">
		<%
			ShopDao sdao = new ShopDao();
			//카트 갯수 구하기
			String id=(String)session.getAttribute("myId");
			int cartSize = sdao.getcartList(id).size();
		%>
		<i class="bi bi-cart3 carticon" style="font-size: 1.2em"></i>
		<div class="count"><%=cartSize %></div>
	</div>
		
	<br>쌍용교육센터
	 	<%--
		<div class="text-center">
			 <%
				// response.setIntHeader("Refresh",1); ???
				
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
				if(minute/10==0){
					if(second/10==0){
						String CT=am_pm +"  "+ hour+":0"+minute+":0"+second;
						out.println("현재 접속 시각: "+CT+"\n");
					}else{
						String CT=am_pm +"  "+ hour+":0"+minute+":"+second;
						out.println("현재 접속 시각: "+CT+"\n");
					}	
				}else{
					if(second/10==0){
						String CT=am_pm +"  "+ hour+":"+minute+":0"+second;
						out.println("현재 접속 시각: "+CT+"\n");
					}else{
						String CT=am_pm +"  "+ hour+":"+minute+":"+second;
						out.println("현재 접속 시각: "+CT+"\n");
					}	
				}
			%>
		</div>
		 --%>
		
</body>
</html>