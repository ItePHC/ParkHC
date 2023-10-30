<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="db.quizBoard.QuizBoardDao"%>
<%@page import="db.quizBoard.QuizBoardDto"%>
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
		request.setCharacterEncoding("utf-8");
   	
	 	ServletContext context = getServletContext();
	   	String realFolder = context.getRealPath("/fileupload");
	   	
	   	System.out.println(realFolder);
	   	
	    int filesize = 1024 * 1024 * 3; //3mb

		try{
	 	MultipartRequest multi = null;
	 	
		multi = new MultipartRequest(request, realFolder, filesize, "utf-8", new DefaultFileRenamePolicy());
		
       	String writer = multi.getParameter("writer");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String imgname = multi.getFilesystemName("imgname");
		
		QuizBoardDto dto = new QuizBoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content.replace("\n", "<br>"));
		dto.setImgname(imgname);
		
		QuizBoardDao dao = new QuizBoardDao();
		dao.insertBoard(dto);
		
		response.sendRedirect("quizlist.jsp");
		
		}catch (Exception e) {
			System.out.println("업로드 오류: "+e.getMessage());
	   }

	%>
</body>
</html>