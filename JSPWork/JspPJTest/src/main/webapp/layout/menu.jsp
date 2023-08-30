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
	<%
	//절대경로잡기
	String root=request.getContextPath();
	%>
<link rel="stylesheet" type="text/css" href="<%=root %>/menu/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=root %>/menu/css/menu.css">
    
	<script type="text/javascript" src="<%=root %>/menu/js/jquery.js"></script>
	<script type="text/javascript" src="<%=root %>/menu/js/function.js"></script>
</head>
<body>
	<%-- <a href="<%=root%>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=member/memberForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=guest/guestList.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">회원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">shop</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>

<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="#"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li><a href="<%=root%>/index.jsp">Home</a></li>
					<li class="parent">
						<a href="#">About 회원</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=login/loginMain.jsp"><i class="bi bi-box-arrow-in-left"></i> <%=(String)session.getAttribute("loginOk")!=null?"로그아웃":"로그인" %></a></li>
							<li><a href="<%=root%>/index.jsp?main=member/memberForm.jsp"><i class="bi bi-door-open"></i> 회원가입</a></li>
							<%
							if(session.getAttribute("loginOk")==null){}else if(session.getAttribute("myId").equals("admin"))
							{%>
								<li><a href="<%=root%>/index.jsp?main=member/memberList.jsp"><i class="bi bi-card-list"></i> 회원목록</a></li>
							<%}%>
							<li><a href="<%=root%>/index.jsp?main=member/myInfo.jsp"><i class="bi bi-file-person"></i> 마이페이지</a></li>
						</ul>
					</li>
					<li><a href="<%=root%>/index.jsp?main=guest/guestList.jsp">회원방명록</a></li>
					<li class="parent"><a href="#">고객의소리</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=board/boardlist.jsp">스마트게시판</a></li>
							<li><a href="#">비회원게시판</a></li>
							<li><a href="#">Q&A</a></li>
						</ul>
					</li>
					<li><a href="<%=root%>/index.jsp?main=road/map.jsp">찾아오시는길</a></li>
				</ul>
			</nav>

		</div>
	</header>	
</div>    
</body>
</html>