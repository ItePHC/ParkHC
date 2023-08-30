<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<script>
	$(function(){
		$(".btn-del").click(function(){
			var num=$(this).attr("num");
			
			if(confirm("정말 탈퇴하시겠습니까?"))
			{
				location.href="member/deleteMyInfo.jsp?num="+num;
			}
		})
	});
</script>
<body>
	<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1;
	%>
	<div style="float: left;margin-right: 50px"><img src="image/cartoon/18.png"><br>소개요정 김소개</div>
	<div>
		<table class="table table-bordered" style="width: 500px">
			<%for(MemberDto dto:list)
			{
				if(session.getAttribute("loginOk")!=null&&dto.getId().equals((String)session.getAttribute("myId"))){%>
				<tr>
					<td rowspan="5" valign="middle"><img src="image/cartoon/<%=no<10?"0"+no++:no++ %>.png"></td>
					<td><%=dto.getId() %></td>
					<td rowspan="5" valign="middle">
						<button type="button" class="btn btn-outline-info" style="margin-bottom: 10px"
						onclick="location.href='index.jsp?main=member/updateForm.jsp?num=<%=dto.getNum()%>'">수정</button><br>
						<button type="button" class="btn btn-outline-danger btn-del" num="<%=dto.getNum()%>">탈퇴</button>
					</td>
				</tr>
				<tr><td><%=dto.getName() %></td></tr>
				<tr><td><%=dto.getHp() %></td></tr>
				<tr><td><%=dto.getAddr() %></td></tr>
				<tr><td><%=dto.getEmail() %></td></tr>
				<%} 
			}%>
		</table>
	</div>
</body>
</html>