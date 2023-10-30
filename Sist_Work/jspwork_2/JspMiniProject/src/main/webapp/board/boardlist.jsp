<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$(".allcheck").click(function() {
		//전체 체크값 얻기
		var chk=$(this).is(":checked");
		console.log(chk);
		
		//얻은 전체 체크값을 글 앞의 체크에 일괄적으로 전달 (prop : 이벤트 속성 전달)
		$(".delcheck").prop("checked",chk)
	});
	
	$("#btndel").click(function() {
		//체크된 길이
		var len = $(".delcheck:checked").length;
		// alert(len);
		
		if(len == 0){
			alert("최소 1개 이상을 체크해 주세요")
		}
		else{
			var a = confirm(len + "개의 글을 삭제하려면 [확인]을 눌러주세요")
			//체크된 곳의 value값 얻기
			var n = "";
			
			$(".delcheck:checked").each(function(idx){
				n+= $(this).val()+",";
				
				//마지막 글자(컴마) 제거하기  ***
				n = n.substring(0, n.length-1);
				// alert(n);
			});
			
			location.href="board/alldelete.jsp?nums="+n;
		}
	});
});
</script>
<style>
	a:link, a:visited{
		text-decoration: none;
		color: black;
	}
	
	a:hover{
		text-decoration: underline;
		color: blue;
	}
	
	span.day{
		float: right;
		font-size: 11pt;
		color: gray;
	}
</style>
</head>

<body>
	<%
	SmartDao dao=new SmartDao();
	
	int totalCount=dao.getTotalCount(); //전체개수
	int totalPage; //총 페이지수
	int startPage; //각블럭에서 보여질 시작페이지
	int endPage; //각블럭에서 보여질 끝페이지
	int no; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
	int perPage=3; //한페이지당 보여질 글의 개수
	int perBlock=5; //한블럭당 보여질 페이지 개수
	int currentPage; //현재페이지
	int startNum;
	
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총페이지수 구하기
	//총글의 개수/한페이지당 보여질 개수
	//나머지가 하나라도 있으면 무조건 1페이지 추가
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각블러당 보여야할 시작페이지
	//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
	//현재페이지 13 시작:11 끝:15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	     
	endPage=startPage+perBlock-1;
	
	//총페이지가 23일경우 마지막블럭은 25가 아니라 23이다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각페이지에서 보여질 시작번호
	//1페이지:0,2페이지:5,3페이지:10
	startNum = (currentPage-1)*perPage;
	no=totalCount-(currentPage-1)*perPage;
	
	
	List<SmartDto> list=dao.getPagingList(startNum, perPage);
	
	SmartAnswerDao adao = new SmartAnswerDao();
	for(SmartDto dto:list){
		//댓글변수에 댓글의 총 갯수 넣기
		int acount = adao.getAllAnswers(dto.getNum()).size();
		dto.setAnswercount(acount);
	}
	
	
	%>
	<div style="margin: 30px 30px; width: 800px;">
		<br>
		<h5><b>총 <%=totalCount %>개의 게시글이 있습니다</b></h5>
		<table class="table table-bordered">
			<caption align="top"><b>스마트 게시판 목록</b></caption>
			<caption align="top"><button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button></caption>
			<tr class="table-light">
				<th width="80">번호</th>
				<th width="450">제목</th>
				<th width="90">작성자</th>
				<th width="130">작성일</th>
				<th width="100">조회수</th>
			</tr>
		
		<%
		if(totalCount==0){
			%>	
			<tr>
				<td colspan="5" align="center">
					<h6>등록된 게시글이 없습니다</h6>
				</td>
			</tr>	
		<%}else{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
			for(SmartDto dto : list){
			%>
			<tr>
				<td align="center"><input type="checkbox" value="<%=dto.getNum() %>" class="delcheck">
				&nbsp;
				<%=no-- %>
				</td>
				
				<td>
					<a href="index.jsp?main=board/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"><%=dto.getSubject() %></a>
					
					<!-- 댓글 갯수 출력 -->
					<%
						if(dto.getAnswercount()>0){
							%>
							<a href="index.jsp?main=board/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>#alist" style="color: red;"> [<%=dto.getAnswercount()%>] </a>		
						<%}
					%>
				</td>
				<td><%=dto.getWriter() %>
				</td>
				<td><%=sdf.format(dto.getWriteday()) %>
				</td>
				<td align="center"><%=dto.getReadcount() %>
				</td>
			</tr>
			<%}
			}
			%>
			<tr>
				<td colspan="5">
					<input type="checkbox" class="allcheck">전체선택
				 	<span style="float: right;">
						<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/smartform.jsp'" style="width: 80px;">글쓰기</button>
						<button type="button" class="btn btn-outline-danger" onclick="" id="btndel" style="width: 80px;">삭제</button>					
					</span>	
				</td>
			</tr>
	</table>
	<!-- 페이지 번호 -->
		<div>	
			<ul class="pagination justify-content-center">
				<% 
				
				if(startPage-1!=0){%>
				<li class="page-item">
			      <a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-perBlock%>" >Previous</a>
			    </li>
				<%}				
				for(int pp=startPage; pp<=endPage; pp++){
					if(pp==currentPage){%>
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}else{%>
						<li class="page-item">
							<a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
						</li>
					<%}
				}
				if(endPage<totalPage){%>
				<li class="page-item">
			     <a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1%>">Next</a>
			   	</li>	
				<%}
				%>
			</ul>
		</div>
	</div>
</body>
</html>