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
	String checksave=(String)session.getAttribute("saveOk");
	String myId="";
	if(checksave!=null)
		myId=(String)session.getAttribute("myId");
	%>
	<div style="margin: 100px 200px">
		<form action="login/loginProc.jsp" method="post">
			<table class="table table-bordered" style="width: 300px">
				<caption align="top">로그인 세션</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" class="form-control" required="required" style="width: 120px" value="<%=myId%>">
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" class="form-control" required="required" style="width: 120px">
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">로그인</button>&nbsp;<input type="checkbox" name="checksave" <%=checksave!=null?"checked":"" %>>아이디저장
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>