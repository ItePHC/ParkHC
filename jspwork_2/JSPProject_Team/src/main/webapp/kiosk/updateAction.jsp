
<%@page import="kiosk.KioskDao"%>
<%@page import="kiosk.KioskDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String stock=request.getParameter("stock");
		
		KioskDto dto=new KioskDto();
		
		dto.setNum(num);
		dto.setName(name);
		dto.setPrice(price);
		dto.setStock(stock);
		
		KioskDao dao=new KioskDao();
		dao.updateKiosk(dto);
		
		response.sendRedirect("kioskMain.jsp");
	%>
</body>
</html>