<%@page import="member.model.memberDto"%>
<%@page import="member.model.memberDao"%>
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
		String realPath = getServletContext().getRealPath("/upload");
		
		System.out.println(realPath);					
	
		int uploadSize=1024*1024*3;
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
	
		
		//dao선언
		memberDao dao = new memberDao();
		
		//dto
		memberDto dto = new memberDto();
		
		dto.setId(multi.getParameter("id"));
		dto.setPass(multi.getParameter("pass"));
		dto.setName(multi.getParameter("name"));
		dto.setHp(multi.getParameter("hp"));
		String photo = multi.getOriginalFileName("uploadImage");
		
		
		if(photo==null){
			dto.setPhoto("../Image/noImage.png");
		}else{
			dto.setPhoto("../Image/avata/"+photo);
		}
			
		dao.insertMember(dto);
			
		response.sendRedirect("memberList.jsp");
	%>	
	
	
</body>
</html>