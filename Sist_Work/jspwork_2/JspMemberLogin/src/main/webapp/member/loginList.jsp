<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.memberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.memberDao"%>
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
<body>
<%-- 로그인 안했을 때 --%>
	<%
		request.setCharacterEncoding("utf-8");
		
		memberDao dao = new memberDao();
		ArrayList<memberDto> list = dao.getAllMember();
	%>
	<div style="margin: 50px; 100px">	
		
		<table class="table table-bordered" style="width: 1100px">
			<tr style="border: 0px;">
			<td colspan="5" style="border: 0px">
			<h4>총 <b style="color: green"><%=list.size() %></b>명의 멤버가 있습니다.</h4>
			<h5>로그인이 필요합니다</h5>
			</td>
			<td colspan="2" align="right" style="border: 0px">
			<br>
			<button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'" style="width: 160px;">멤버 추가</button>
			<button type="button" class="btn btn-outline-success" onclick="location.href='loginForm.jsp'" style="width: 160px;">로그인</button>
			</td>
			</tr>
			<tr class="table-success">
				<th>번호</th>
				<th>아이디</th>
				<th>회원명</th>
				<th>전화번호</th>
				<th>사진</th>
				<th>가입일</th>
				<th>편집</th>
			</tr>
			<%
			if(list.size()==0){
			%>
			<tr>
				<td colspan="7">
				<h5>등록된 회원 정보가 없습니다</h5>
				</td>
			</tr>	
			<%}else{
				for(int i=0; i<list.size();i++){
					memberDto dto = list.get(i);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy년-MM월-dd일");
			%>		
			<tr>
				<td align="center" style="width: 80px"><%=i+1 %>번</td>
				<td align="center" style="width: 100px"><%=dto.getId() %></td>
				<td style="width: 120px"><%=dto.getName() %></td>
				<td style="width: 150px"><%=dto.getHp() %></td>
				<td style="width: 200px"><img src="<%=dto.getPhoto() %>" style="width: 200px; height: 200px; border-radius: 100px; border: 2px solid green"> </td>
				<td style="width: 200px"><%=sdf.format(dto.getGaip()) %></td>
				<td style="width: 120px">
				<button type="button" class="btn btn-success btn-sm" onclick="alert('로그인 후 이용 가능합니다.')">회원정보 수정</button>
				<button type="button" class="btn btn-danger btn-sm" onclick="alert('로그인 후 이용 가능합니다.')">회원정보 삭제</button>
				</td>
			</tr>
				<%}
			}
			%>
			
		</table>
	</div>
</body>
</html>