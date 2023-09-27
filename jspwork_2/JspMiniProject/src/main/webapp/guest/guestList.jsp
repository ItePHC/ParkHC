<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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
</head>
<script>
$(function() {
	$("span.likes").click(function() {
		var num = $(this).attr("num");
		//	alert(num);
		var tag = $(this);
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:"guest/ajaxlikes.jsp",
			data:{"num":num},
			success:function(data){
				// alert(data.likes)
				tag.next().text(data.likes);
				
				tag.next().next().animate({"font-size":"20px"},1000,function(){
					$(this).css("font-size","0px");
				});
			}
		});
	});
	
	//댓글 부분은 무조건 안보이게 처리
	 $("div.answer").hide();
	
	//댓글 클릭 시 댓글부분이 보였다 안보였다 하기
	$("span.answer").click(function() {
		
		// $(this).prev().toggle();
		$(this).parent().find("div.answer").toggle();			//parent() : <td>를 의미
		
	});
	
	$("i.adel").click(function() {
		var idx = $(this).attr("idx");
		// alert(idx);
		var a = confirm("정말 삭제하시겠습니까?");
			
		if(a){
			$.ajax({
			type:"get",
			dataType:"html",
			url:"guest/answerDelete.jsp",
			data:{"idx":idx},
			success:function(){
				location.reload();			// 새로고침
			}
			});
		}
		}); 
	/*	
	$("i.aedit").click(function() {
		var idx = $(this).attr(
		// 댓글수정폼의 hidden에 idx 넣어주기
		$("#idx").val(idx)

		$.ajax({
			type:"get",
			dataType : "json",
			url : "guest/answerContent.jsp"
			data:{"idx":idx},
			success:function(res){
				$("#idx").val(res.idx);
				$("#content").val(res.story);
			}
		});	
	}); 
	*/
	
	
	
	
	
	
	$("i.aedit").click(function() {
		var idx = $(this).attr("idx");
		var content = $(this).siblings("#prev").text();
		$(".idx").val(idx);
		$(".editText").val(content);
		
		
	});
		
	
	$("button.btnUpdate").click(function() {
		var idx = $("input.idx").val();
		alert(idx);
		var content = $("textarea.editText").val();
		//<textarea style="width: 480px; height: 80px;" id="content" required="required" class="form-control editText"></textarea>
		alert(content);
		$.ajax({
			type:"post",
			dataType:"html",
			url:"guest/answerUpdate.jsp",
			data:{"idx":idx, "content":content},
			success:function(){
				location.reload();
			}
		})
		
	});
	
});
</script>


<style>
	span.day{
		float: right;
		font-size: 11pt;
		color: gray;
	}
</style>

<body>
	<%
	//로그인 상태 확인후 입력폼 나타낼것_회원만 보이게
	String loginOk=(String)session.getAttribute("loginOk");
	
	GuestDao dao=new GuestDao();
	
	int totalCount=dao.getTotalCount(); //전체개수
	int totalPage; //총 페이지수
	int startPage; //각블럭에서 보여질 시작페이지
	int endPage; //각블럭에서 보여질 끝페이지
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
	int perPage=3; //한페이지당 보여질 글의 개수
	int perBlock=5; //한블럭당 보여질 페이지 개수
	int currentPage; //현재페이지
	
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
	startNum=(currentPage-1)*perPage;
	
	List<GuestDto> list=dao.getPagingList(startNum, perPage);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//if(list.size()==0)
	//{%>
		<%-- <script>
			location.href="index.jsp?main=guest/guestList.jsp?currentPage=<%=currentPage-1%>";
		</script> --%>
	<%//}
	
	if(loginOk!=null)
	{%>
		<jsp:include page="addForm.jsp"/>
		<hr align="left" width="700">
	<%}
	%>
	<div>
		<b>총 <%=dao.getTotalCount() %>개의 방명록 글이 있습니다</b>
		<%
		MemberDao mdao=new MemberDao();
		for(GuestDto dto:list)
		{
			String name=mdao.getNameFromId(dto.getMyid());%>
			
			<table class="table table-bordered" style="width: 600px">
				<tr>
					<td><i class="bi bi-person-circle"></i><b> <%=name %>(<%=dto.getMyid() %>)</b>
						<%
						if(loginOk!=null&&dto.getMyid().equals((String)session.getAttribute("myId")))
						{%>
							<a href="index.jsp?main=guest/updateForm.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: black"><i class="bi bi-pencil">수정</i></a>
							<a href="guest/deleteProc.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>&size=<%=list.size() %>" style="color: black"><i class="bi bi-trash">삭제</i></a>
						<%}%>
					
						<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					</td>
				</tr>
				<tr height="120">
					<td>
						<!-- 이미지가 null이 아닌경우만 출력 -->
						<%
						if(dto.getPhotoname()!=null)
						{%>
							<a href="save/<%=dto.getPhotoname()%>" target="_blanck"><img src="save/<%=dto.getPhotoname()%>" align="left" style="width: 100px" hspace="20"></a>
						<%}
						%>
						<%=dto.getContent().replace("\n", "<br>") %>
					</td>
				</tr>
				<!-- 댓글,추천 -->
				<!-- 추천수 클릭 시 추천 숫자 옆에 하트 커졌다 사라지게 animate -->
				<tr>
					<td>
						<%
							//각 방명록에 달린 댓글 목록 가져오기
							AnswerDao adao = new AnswerDao();	
							
							List<AnswerDto> alist = adao.getAllAnswers(dto.getNum());
						%>
						<div class="answer">
							<%
								if(loginOk!=null){
									%>
									<div class="answerform">
										<form action="guest/answerInsert.jsp" method="post">
											<table class="table table-bordered" style="width: 500px;">
												<tr>
													<td>
														<textarea style="width: 500px; height: 80px;" name="content" required="required" class="form-control"></textarea>
													</td>
													<td>
														<button type="submit" class="btn btn-info" style="width: 80px; height: 80px">등록</button>
														<!-- hidden값 3개(db2개, 현재페이지 1개) -->
														<input type="hidden" name="num" value="<%=dto.getNum()%>">
														<input type="hidden" name="myid" value="<%=(String)session.getAttribute("myId")%>">
														<input type="hidden" name="currentPage" value="<%=currentPage%>">
													</td>
												</tr>
											</table>
										</form>
									</div>
								<%}
							%>
							
							<div>
								<table class="table" style="width: 480px;">
									<%
										for(AnswerDto adto:alist){
											%>
											<tr>
												<td width="60">
													<i class="bi bi-person-circle"></i>
												</td>
												<td>
												<%	
													String aname = mdao.getNameFromId(adto.getMyid());
												 %>	
												
												 <b><%=aname %></b>
												 &nbsp;
												 <%	
												 	
												 	if(adto.getMyid().equals((String)session.getAttribute("myId"))){%>
												 		<b><span style="color: red; border: 1px solid red; border-radius: 20px;">작성자</span></b>
												 	<%}
												 %>
												 <br>
												 <span style="font-size: 9pt; color: gray; margin-left: 20px"><%=sdf.format(adto.getWriteday()) %></span>
												 <br>
												 <span id="prev"><%=adto.getContent() %></span>
												 <%
												 	//수정 삭제는 로그인 중 이면서 아이디가 같은 경우에만 보이게 설정
												 	if(loginOk!=null && adto.getMyid().equals((String)session.getAttribute("myId"))){%>
												 		<i class="adel bi bi-trash-fill" style="cursor: pointer; margin-left: 100px;" idx=<%=adto.getIdx() %>></i> &nbsp;
												 		<i class="aedit bi bi-pencil-square" style="cursor: pointer; margin-left: 100px;" idx=<%=adto.getIdx() %> data-bs-toggle="modal" data-bs-target="#myModal"></i>
												 		<%-- <i class="aedit bi bi-pencil-square" style="cursor: pointer; margin-left: 100px;" idx=<%=adto.getIdx() %> data-bs-toggle="modal" data-bs-target="#myModal"></i> --%>
												 		
												 	<%}
												 %>
												 
												</td>
											</tr>
										<%}
									%>
								</table>
							</div>
							
						</div>
					
						<span class="answer" style="cursor: pointer" num="<%=dto.getNum() %>">댓글 <%=alist.size() %>개</span>
						
						<span class="likes" style="margin-left: 20px;cursor: pointer;" num="<%=dto.getNum() %>">추천</span>
						<span><%=dto.getLikes() %></span>
						<i class="bi bi-heart-fill" style="color: red; font-size: 0px;"></i>
					</td>
				</tr>
			</table>
		<%}
		%><div style="width: 600px;text-align: center">
			<ul class="pagination justify-content-center">
				<%
				if(startPage>1)
				{%>
					<li>
						<a href="index.jsp?main=guest/guestList.jsp?currentPage=<%=startPage-1%>" class="page-link">이전</a>
					</li>
				<%}			
				for(int pp=startPage;pp<=endPage;pp++)
				{
					if(pp==currentPage)
					{%>
						<li class="page-item active">
							<a href="index.jsp?main=guest/guestList.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
						</li>
					<%}else
					{%>
						<li>
							<a href="index.jsp?main=guest/guestList.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
						</li>
					<%}
				}
				if(endPage<totalPage)
				{%>
					<li>
						<a href="index.jsp?main=guest/guestList.jsp?currentPage=<%=endPage+1%>" class="page-link">다음</a>
					</li>
				<%}	
				%>
			</ul>
		</div>
	</div>
	
	<div class="modal" id="myModal">
  		<div class="modal-dialog">
    		<div class="modal-content">
			    <!-- Modal Header -->
		    	<div class="modal-header">
			        <h4 class="modal-title">수정하기</h4>
		    	    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			    </div>
				      
			    <!-- Modal body -->
		      	<div class="updateform">
					<%-- <textarea style="width: 480px; height: 80px;" name="content" required="required" class="form-control"></textarea> --%>
					<input type="hidden" id="idx" class="idx">
					<textarea style="width: 480px; height: 80px;" id="content" required="required" class="form-control editText"></textarea>
				</div>
		
			     <!-- Modal footer -->
			     <div class="modal-footer">
			      	<button type="button" class="btn btn-info btnUpdate">수정 하기</button>
			        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">수정 취소</button>
			      </div>
			      
	    	</div>
	  	</div>  	
	</div>
</body>
</html>