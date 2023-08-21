<%@page import="java.util.Enumeration"%>
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
	
	//프로젝트의 upload의 실제경로 구하기
	String realFolder = context.getRealPath("/upload");
	
	System.out.println(realFolder);
	
	//업로드시 허용되는 크기 지정
	int uploadSize=1024*1024*3;		//3MB
	MultipartRequest multi = null;
	
	try{
	multi = new MultipartRequest(request, realFolder, uploadSize, "utf-8", new DefaultFileRenamePolicy());
	
	//입력값 읽기
	String nick = multi.getParameter("nick");
	%>
	
	<h2>작성자명:<%=nick %></h2>
	<%
	//파일타입이 여러개인 경우 Enumeration:인터페이스
	Enumeration forNames = multi.getFileNames();		//file타입만 얻어옴
	
	while(forNames.hasMoreElements()){
		String fileName=(String)forNames.nextElement();		//반환값이 달라서 (String)을 붙여줌
		System.out.println("file type의 name : " + fileName);
		
		//실제 업로드 된 파일명 얻기
		String uploadName = multi.getFilesystemName(fileName);	//photo x`1, 2, 3
		
		//파일선택 안하면 null
		if(uploadName != null){%>
			<figure>
			<img src="../upload/<%=uploadName%>" style="max-width: 200px; border: 1 ">
			<figcaption><b><%=uploadName %></b><br></figcaption>
			</figure>
		<%}
		
	}
	%>
	
	<%
	}catch(Exception e){
		
	}
	
	
%>
</body>
</html>