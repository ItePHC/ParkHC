<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kiosk.KioskDto"%>
<%@page import="kiosk.KioskDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<%
		KioskDao dao=new KioskDao();
		ArrayList<KioskDto> list=dao.getAllMenus();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	%>
<body>
	<a href="insertForm.jsp">???</a>
	<br>
	<table class="table table-bordered" style="width: 800px">
		<tr align="center" class="table-warning">
			<th width="100px">메뉴명</th>
			<th width="100px">메뉴이미지</th>
			<th width="100px">가격</th>
			<th width="100px">수량</th>
			<th width="100px">주문시간</th>
		</tr>
	<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="6" align="center">
				<h5>주문정보가 없습니다</h5>
				</td>
			</tr>
		
		<%}else{
			
			for(int i=0;i<list.size();i++)
			{
				KioskDto dto=list.get(i);
				%>
				
				<tr>
				
				<td align="center" valign="middle"><%=i+1 %></td>
				<td align="center" valign="middle" onclick="location.href='detailpage.jsp?intro_num=<%=dto.getNum()%>'">
				<b><%=dto.getName() %></b></td>
				<td align="center" valign="middle"><%=dto.getImage() %></td>
				<td align="center" valign="middle"><%=dto.getPrice() %></td>
				<td align="center" valign="middle"><%=dto.getStock() %></td>
				<td align="center" valign="middle"><%=sdf.format(dto.getBday()) %></td>
				<td align="center" valign="middle">
				<button type="button" class="btn btn-info btn-sm" 
				onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn btn-danger btn-sm" 
				onclick="location.href='deleteForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
				</td>
				</tr>
					
			<%}
		}
	%>
</table>
</body>
</html>