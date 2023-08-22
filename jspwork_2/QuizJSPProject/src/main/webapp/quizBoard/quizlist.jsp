<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quizBoard.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quizBoard.QuizBoardDao"%>
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
#listStyle{
list-style: none;
}

</style> 
<script type="text/javascript">
$(function(){
	$("#TextList").show();
	$("ImgList").hide();
})
</script>
</head>
	<%
		QuizBoardDao dao = new QuizBoardDao();
		
		int totalCount = dao.getTotalCount();
		int totalPage;	// 총 페이지 수
		int startPage;	// 각 블럭에서 보여질 시작 페이지(페이지에서의 첫 글)
		int endPage;	// 각 블럭에서 보여질 끝 페이지(페이지에서의 마지막 글)
		int start;		// db에서 가져올 글의 시작 번호 (mySQL은 첫 글이 0, 오라클응 1)
		int perPage=5;	// 한 페이지당 보여질 글의 갯수
		int perBlock=5; // 한 블럭당 보여질 페이지 갯수(ex: "이전 1~10 다음") 
		int currentPage;
		int printNum;	// 각 페이지당 출력할 시작번호
		int startNum;	// 페이지 별 시작번호
		
		if(request.getParameter("currentPage")==null)
			currentPage=1;
		else
	        currentPage=Integer.parseInt(request.getParameter("currentPage"));
		
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		if(endPage>totalPage)
		   		endPage=totalPage;
		 
		startNum = (currentPage-1)*perPage ;
		printNum = totalCount - (currentPage-1)*perPage;
		 
		List<QuizBoardDto> list = dao.getPagingList(startNum, perPage);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>
<body>
	<div id="TextList">
		<br>
		<table class="table table-bordered" style="width: 600px; margin: 30px">
		<caption align="top"><h6><b>전체 글 보기</b></h6>
			<br>
			<div align="right">
		<ul id="listStyle">
			<li>
			<a class="page-link" href="quizimagelist.jsp">이미지 리스트 형식으로 보기</a>
			<a class="page-link" href="quizlist.jsp">텍스트 리스트 형식으로 보기</a>
			</li>
		</ul>
		<button type="button" style="width: 150px;" class="btn btn-info" onclick="location.href='quizform.jsp'"><b>글쓰기</b></button>
		</div>
		</caption>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
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
					for(int i = 0; i<list.size(); i++){
						QuizBoardDto dto = list.get(i);
						%>
						<tr>
							<td align="center"><%=printNum--%></td>
							<td><a href="contentview.jsp?num=<%=dto.getQ_num()%>"><%=dto.getTitle() %></a></td>
							<td><%=dto.getWriter() %></td>
							<td><%=sdf.format(dto.getWriteday()) %></td>
							<td align="center"><%=dto.getReadcount() %></td>
						</tr>
					<%}
				}
			%>
		</table>
		
		<div>	
			<ul class="pagination justify-content-center">
				<% 
				
				if(startPage-1!=0){%>
				<li class="page-item">
			      <a class="page-link" href="quizlist.jsp?currentPage=<%=startPage-perBlock%>" >Previous</a>
			    </li>
				<%}				
				for(int pp=startPage; pp<=endPage; pp++){
					if(pp==currentPage){%>
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="quizlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}else{%>
						<li class="page-item">
							<a class="page-link" href="quizlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}
				}
				if(endPage<totalPage){%>
				<li class="page-item">
			     <a class="page-link" href="quizlist.jsp?currentPage=<%=endPage+1%>">Next</a>
			   	</li>	
				<%}
				%>
			</ul>
		</div>
	</div>
	
	

</body>
</html>