<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.simpleBoardDto"%>

<%@page import="db.simpleboard.simpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
body *{
	font-family: 'Dongle'
}

a:link,a:visited{
	text-decoration: none;
	color:black;
}
a:hover{
	text-decoration: underline;
	color: magenta;
}
</style> 
</head>
<%
	simpleBoardDao dao = new simpleBoardDao();
	// List<simpleBoardDto> list = dao.getAllBoards();
	
	int totalCount = dao.getTotalCount();
	int totalPage;	// 총 페이지 수
	int startPage;	// 각 블럭에서 보여질 시작 페이지(페이지에서의 첫 글)
	int endPage;	// 각 블럭에서 보여질 끝 페이지(페이지에서의 마지막 글)
	int start;		// db에서 가져올 글의 시작 번호 (mySQL은 첫 글이 0, 오라클응 1)
	int perPage=3;	// 한 페이지당 보여질 글의 갯수
	int perBlock=5; // 한 블럭당 보여질 페이지 갯수(ex: "이전 1~10 다음") 
	int currentPage;
	int no;			// 각 페이지당 출력할 시작번호
	int startNum;	// 페이지 별 시작번호
	
	// 현재 페이지 읽기(단 현재페이지가 null일 경우 1로 준다)
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	// if(request.getParameter("currentPage")=<perPage)
	//	currentPage=1;
	else
        currentPage=Integer.parseInt(request.getParameter("currentPage"));

	// 총 페이지 수
	// 총 글의 갯수 / 한 페이지당 보여질 갯수로 나누기 (7/5 = 1)
	// 나머지가 1이라도 있으면 무조건 1페이지 추가
  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	// 각 블럭당 보여야 할 시작페이지
	// perBlock = 5 일 경우, 현재 페이지가 1~5 -> 시작 : 1, 끝 : 5
	// 현재 페이지 13 -> 시작 : 11, 끝 : 15
  	startPage=(currentPage-1)/perBlock*perBlock+1;
 	// 시작페이지 = (13 - 1) / (5) * (6)  
	
	// 총 페이지 13 -> 끝 페이지가 13이다
	
  	endPage=startPage+perBlock-1;
	    
	     
    if(endPage>totalPage)
   		endPage=totalPage;
    		
	// 각 페이지에서 보여질 시작번호
	// 1페이지 : 0, 2페이지 : 5, 3페이지 : 10, ...
	startNum = (currentPage-1)*perPage ;
	
	// 각 페이지 당 출력할 시작번호 구하기
	// 총 글 갯수가 23이면 1페이지 : 23, 2페이지는 18, 3페이지는 13.....
	no = totalCount - (currentPage-1)*perPage;
	
	// 페이지에서 보여질 글만 가져오기
	List<simpleBoardDto> list = dao.getPagingList(startNum, perPage);
%>

<body>
	<div style="margin: 30px; 30px; width: 800px;">
		<button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'"><i class="bi bi-pencil-fill"></i>글쓰기</button>
	
	<br>
	<h6><b>총 <%=list.size() %>개의 게시글이 있습니다</b></h6>
	<br>
		<table class="table table-bordered">
		<caption align="top"><b>간단 게시판 목록</b></caption>
			<tr>
				<th width="60">번호</th>
				<th width="360">제목</th>
				<th width="100">작성자</th>
				<th width="120">작성일</th>
				<th width="60">조회</th>
			</tr>
			<%
				if(list.size()==0){
					%>
					<tr>
						<td colspan="5" align="center">
							<h6><b>등록된 게시글이 없습니다.</b></h6>
						</td>
					</tr>
				<%}
				else{
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for(int i = 0; i<list.size(); i++){
						simpleBoardDto dto = list.get(i);
						%>
						<tr>
							<%-- <td align="center"><%= list.size()-i %></td> --%>
							<td align="center"><%=no--%></td>
							<td><a href="detailView.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a></td>
							<td><%=dto.getWriter() %></td>
							<td><%=sdf.format(dto.getWriteday()) %></td>
							<td align="center"><%=dto.getReadcount() %></td>
						</tr>
					<%}
				}
			%>
		</table>
	<!-- 페이지 번호 입력 -->
		<div>	
			<ul class="pagination justify-content-center">
				<% 
				
				if(startPage-1!=0){%>
				<li class="page-item">
			      <a class="page-link" href="boardList.jsp?currentPage=<%=startPage-perBlock%>" >Previous</a>
			    </li>
				<%}				
				for(int pp=startPage; pp<=endPage; pp++){
					if(pp==currentPage){%>
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}else{%>
						<li class="page-item">
							<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}
				}
				if(endPage<totalPage){%>
				<li class="page-item">
			     <a class="page-link" href="boardList.jsp?currentPage=<%=endPage+1%>">Next</a>
			   	</li>	
				<%}
				%>
			</ul>
		</div>
	</div>
</body>
</html>
