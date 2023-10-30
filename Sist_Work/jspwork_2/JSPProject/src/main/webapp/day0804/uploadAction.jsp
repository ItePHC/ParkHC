
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	
	<%
	ServletContext context = getServletContext();
	String realFolder=context.getRealPath("/Save");
	
	System.out.println(realFolder);
	
	int fileSize = 1024*1024*5;						//5MB
	
	MultipartRequest multi = null;
	try{
		multi=new MultipartRequest(request,realFolder,fileSize,"utf-8",new DefaultFileRenamePolicy());

		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String uploadFileName = multi.getFilesystemName("uploadFile");
		String originalFileName = multi.getOriginalFileName("uploadFile");
		%>
			<table class="table table-bordered" style="width: 300px">
				<tr>
					<th>이름</th>
					<td><%=name %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=title %></td>
				</tr>
				<tr>
					<th>업로드 파일</th>
					<td><img src = '../Save/<%=uploadFileName %>'></td>
				</tr>
				<tr>
					<th>업로드 파일명</th>
					<td><%=originalFileName %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="업로드 다시하기" onclick="location.href='uploadForm.jsp'">
					</td>
				</tr>
			</table>
		<%
	}catch(Exception e){
	
	

	} finally{
		
	}
	%>
	


	
</body>
</html>
