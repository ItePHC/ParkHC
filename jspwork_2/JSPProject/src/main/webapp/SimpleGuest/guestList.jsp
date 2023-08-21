<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
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
	<%
	SimpleGuestDao dao=new SimpleGuestDao();
	ArrayList<SimpleGuestDto> list=dao.getAllGuest();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	%>
<body>
	<div style="margin:50px">
		<button type="button" class="btn btn-outline-success" onclick="location.href='insertForm.jsp'">방명록 쓰기</button>
	</div>
	<div>
		<table class="table table-bordered" style="width: 400px; margin-left: 100px">	
			<%
			if(list.size()==0)
			{%>
				<tr>
					<td align="center">
						<b>등록된 데이터가 없습니다</b>
					</td>
				</tr>
			<%}
			else
			{
				for(int i=list.size()-1;i>=0;i--)
				{%>
				<tr>
					<td colspan="2">
						<b>NO.<%=i+1 %></b>&nbsp;&nbsp;<b>name:<%=list.get(i).getNick() %></b><b style="float: right;color: gray"><%=sdf.format(list.get(i).getWriteday()) %></b>
					</td>
				</tr>
				<tr>
					<td style="width:100px">
						<img src="../image/cartoon/<%=list.get(i).getImage() %>.png" width="100" height="100">
					</td>
					<td>
						<pre><%=list.get(i).getStory() %></pre>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<button type="button" class="btn btn-outline-success" onclick="location.href='authentificationMod.jsp?num=<%=list.get(i).getNum() %>'">수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='authentificationDel.jsp?num=<%=list.get(i).getNum() %>'">삭제</button>
					</td>
				</tr>
			<%}
			}%>
		</table>
	</div>
</body>
</html>