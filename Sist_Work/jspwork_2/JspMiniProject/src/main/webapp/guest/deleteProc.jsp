<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
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
	String currentPage=request.getParameter("currentPage");
	String num=request.getParameter("num");
	String size=request.getParameter("size");
	
	int newCurrentPage=0;
	if(Integer.parseInt(size)<2)
		newCurrentPage=Integer.parseInt(currentPage)-1;
	else
		newCurrentPage=Integer.parseInt(currentPage);
	
	GuestDao dao=new GuestDao();
	dao.deleteGuest(num);
	
	String photoname=dao.getSingleData(num).getPhotoname();
	
	//파일 삭제
	String realPath=getServletContext().getRealPath("/save");
	//파일 객체 생성
	File file=new File(realPath+"\\"+photoname);
	//파일삭제
	file.delete();
	
	response.sendRedirect("../index.jsp?main=guest/guestList.jsp?currentPage="+newCurrentPage);
	%>
</body>
</html>




