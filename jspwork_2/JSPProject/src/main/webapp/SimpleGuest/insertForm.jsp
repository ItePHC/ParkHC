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
<div style="margin: 50px; 100px">
	<form action="insertAction.jsp" method="post">
		<table class="table table-bordered" style="width:500px;">
			<caption align="top"><b>간단 방명록</b></caption>
			<tr>
				<th width="80" style="background-color: #b0e0e6">닉네임</th>
				<td>
					<input type="text" name="nick" required="required" style="width: 120px">					
				</td>
				<th width="100" style="background-color: #b0e0e6">비밀번호</th>
				<td>
					<input type="password" name="pass" required="required" style="width: 120px">					
				</td>
			</tr>
			
			<tr>
				<td colspan="4">
					<%
					for(int i=1;i<=10;i++){
					%>
						<input type="radio" value="<%=i%>" style="width : 30px;" name="image" <%=i==3?"checked":"" %>> &nbsp; 						
					<%}
					%>
				
					<br>
				
					<%
					for(int i=1;i<=10;i++){
					%>
						<img src="../Image/avata/b<%=i%>.png" style="width: 40px;"> 						
					<%}
					%>
				</td>
			</tr>
			
			<tr>
				<td colspan="4">
					<textarea style="width:480px; height: 150px;" name="story"></textarea>
				</td>
			</tr>	
			
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="저장" class="btn btn-outline-info">
					<input type="button" value="목록" class="btn btn-outline-success" onclick="location.href='guest_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>