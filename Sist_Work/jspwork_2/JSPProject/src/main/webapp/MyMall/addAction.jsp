<%@page import="model.mymall.MallDao"%>
<%@page import="model.mymall.MallDto"%>
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
	
	String sangpum = request.getParameter("sangpum");
	String photo = request.getParameter("photo");
	String price = request.getParameter("price");
	String ipgoday = request.getParameter("ipgoday");
	String no = request.getParameter("no");
	
	MallDto dto = new MallDto();
	dto.setSangpum(sangpum);			//dto에서 가져오는것이 아닌 dto로 보내는 것이기 때문에 set 사용 
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	dto.setNo(no);
	
	MallDao dao = new MallDao();
	dao.insertMyMall(dto);				
	
	response.sendRedirect("list.jsp");
	%>
</body>
</html>