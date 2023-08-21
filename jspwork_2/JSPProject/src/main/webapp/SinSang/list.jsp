<%@page import="model.sinsang.SinsangDto"%>
<%@page import="java.util.Vector"%>
<%@page import="model.sinsang.SinsangDao"%>
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
	SinsangDao dao = new SinsangDao();
	Vector<SinsangDto> list = dao.getAllDatas();
%>
<body>
<script type="text/javascript">
	$("#delete").click(function(){
		var resultDelete = confirm("정말로 삭제하시겠습니까?");
		
		if(result) {
			console.log("삭제했습니다");
		}
	})
</script>
<button type="button" class="btn btn-info" onclick="location.href='insertForm.jsp'">데이터 추가</button>
<br><br>
<table class="table table-bordered" style="width: 700px;">
<tr class="table-warning" style="text-align: center;">
	<th width="60">번호</th>
	<th width="100">이름</th>
	<th width="250">주소</th>
	<th width="150">날짜</th>
	<th width="150">편집</th>
</tr>
<%
	for(int i=0;i<list.size();i++){
		SinsangDto dto = list.get(i);
		%>
	<tr>
		<td><%=i+1 %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getAddr() %></td>
		<td><%=dto.getSdate() %></td>
		<td>
		<button type="button" class="btn btn-info btn-sm" onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
		<button type="button" class="btn btn-info btn-sm" onclick="confirm('정말 삭제하시겠습니까')?location.href='delete.jsp?num=<%=dto.getNum() %>':alert('취소하였습니다')">삭제</button>		
		</td>
	</tr>
	<%}
%>
</table>

</body>
</html>
