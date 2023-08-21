<%@page import="kiosk.KioskDao"%>
<%@page import="kiosk.KioskDto"%>
<%@page import="Admin.adminDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Admin.adminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	adminDao dao=new adminDao();
	ArrayList<adminDto> list = dao.getAllMenus();
	adminDto dto = dao.getDetail(num);
			
	%>

	<table class="table table-hover" style="width: 800px;">
	
		<tr align="center" valign="middle" class="table-success">
			<th colspan="2" width="180px">메뉴명</th>
			<th width="100px">가격</th>
			<th width="100px">수량</th>
			<th width="180px">수정/삭제</th>
		</tr>
		<tr valign="middle" align="center">
			<td><%=dto.getName() %></td>
			<td><img src="../<%=dto.getImage() %>" style="border-radius:80px; width: 150px; height: 150px;"></td>
			<td col align="center" valign="middle"><%=dto.getPrice() %></td>
			<td align="center" valign="middle"><%=dto.getStock() %></td>
			<td align="center" valign="middle" >
			<button type="button" class="btn btn-outline-primary btn-sm" 
			onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" class="btn btn-outline-danger btn-sm" 
			onclick="location.href='deleteForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>