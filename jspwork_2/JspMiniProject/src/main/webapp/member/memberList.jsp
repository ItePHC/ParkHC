<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1;
	%>
	<table class="table table-bordered">
		<tr>
			<th>번호</th><th>성명</th><th>아이디</th><th>연락처</th><th>주소</th><th>이메일</th><th>가입일</th><th>편집</th>
		</tr>
		<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="8" align="center">회원이 아무도 없어요</td>
			</tr>
		<%}else{
			for(MemberDto dto:list)
			{%>
				<tr>
					<td><%=no++ %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td>
						<button type="button" class="btn btn-outline-danger btn-sm"
						onclick="funcDel(<%=dto.getNum()%>)">강퇴</button>
					</td>
				</tr>
		<%}
		}%>
	</table>
	<script>
		function funcDel(num){
			if(confirm("강퇴 처리하시겠어요?"))
			{
				location.href="member/memberDelete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>