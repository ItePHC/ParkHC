<%--
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.myteam.TeamDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.myteam.TeamDao"%>
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
<%
	TeamDao dao = new TeamDao();
	ArrayList<TeamDto> list = dao.getAllMyTeams();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<a href="addForm.jsp">팀원 추가</a>
	<br>
	<table class="table table-bordered" style="width: 800px;">
		<tr align="center" class="table-success">
			<th width="60px">번호</th>
			<th width="80px">이름</th>
			<th width="160px">운전면허 여부</th>
			<th width="260px">주소</th>
			<th width="160px">작성일</th>
			<th width="120px">수정 | 삭제</th>
		</tr>
<%
		for(int i=0;i<list.size();i++){
		TeamDto dto = list.get(i);
		%><tr>
		<td><%=i+1 %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDriver() %></td>
		<td><%=dto.getAddr() %></td>
 		<td><%=sdf.format(dto.getWriteday()) %></td> %>
		<td><%=dto.getWriteday() %></td>
		<td>
		<button type="button" class="btn btn-info btn-sm" onclick="location.href='teamUpdate.jsp?num=<%=dto.getNum() %>'">수정</button>
		<button type="button" class="btn btn-danger btn-sm" onclick="confirm('정말 삭제하시겠습니까')?location.href='teamDelete.jsp?num=<%=dto.getNum() %>':alert('취소하였습니다')">삭제</button>		
		</td>
	</tr>
	<%}
%>
	</table>
</body>
</html>
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.myteam.TeamDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.myteam.TeamDao"%>
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
<script type="text/javascript">
function funD(num){
	var ans=confirm("정말 삭제하시겠습니까?");
	if(ans){
		location.href="teamDelete.jsp?num="+num;
		alert("삭제되었습니다");
	}
	else{
		alert("취소하였습니다");
	}

	}

</script>
</head>

<body>
<%
	TeamDao dao = new TeamDao();
	ArrayList<TeamDto> list = dao.getAllMyTeams();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	<a href="addForm.jsp">팀원 추가</a>
	<br>
	<table class="table table-bordered" style="width: 800px;">
		<tr align="center" class="table-success">
			<th width="60px">번호</th>
			<th width="80px">이름</th>
			<th width="160px">운전면허 여부</th>
			<th width="260px">주소</th>
			<th width="160px">작성일</th>
			<th width="120px">수정 | 삭제</th>
		</tr>
<%
		for(int i=0;i<list.size();i++){
		TeamDto dto = list.get(i);
		%><tr>
		<td><%=i+1 %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDriver() %></td>
		<td><%=dto.getAddr() %></td>
		<td><%=sdf.format(dto.getWriteday()) %></td>
		<td>
		<button type="button" class="btn btn-info btn-sm" onclick="location.href='teamUpdate.jsp?num=<%=dto.getNum() %>'">수정</button>
		<button type="button" class="btn btn-danger btn-sm" onclick="funD('<%=dto.getNum()%>')">삭제</button>		
		</td>
	</tr>
	<%}
%>
	</table>
</body>
</html>