<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository" %>
<!--<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/>-->
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<title>도서 목록</title></head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
		BookRepository dao=BookRepository.getInstance();
		ArrayList<Book> listOfBooks=dao.getAllBooks();
	%>
	<div class="container">		
			<%
				for(int i=0;i<listOfBooks.size();i++){
					Book book=listOfBooks.get(i);
			%>
			<div class="row">
				<div class="col-md-3" align="center">
				</div>
				<div class="col-md-7">
					<p><h5><b>[<%=book.getCategory() %>]<%=book.getName() %></b></h5>
					<p style="padding-top:20px"><%=book.getDescription()%>...
					<p><%=book.getAuthor() %>|<%=book.getPublisher() %>|<%=book.getUnitPrice() %>원
				</div>
				<div class="col-md-2" style="padding-top:70px">
					<a href="./book.jsp?id=<%=book.getBookId() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				</div>
			</div>
			<hr>
			<%} %>
	</div>
			
		<jsp:include page="footer.jsp"/>
</body>

</html>