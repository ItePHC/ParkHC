<%@page import="data.dto.SmartDto"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<style>
	span.day{
	color: gray; font-size:0.8em; float: right;
	}
	div.alist{
		margin-left: 20px;
	}
	img {
	max-width: 300px; max-height: 300px;
	}
	i.adel{
	margin-left: 10px; color: red; cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function() {
		//시작할 때
		list();
		//댓글부분 ajax insert
		var num = $("#num").val();
		// alert(num);
		
		$(document).on("click","i.adel",function(){
		var idx = $(this).attr("idx");
		
		alert(idx);
	
		$.ajax({
			type:"post",
			url:"board/deleteAnswer.jsp",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
				//리스트 호출
				list();
			}
			});	
		});	
		
		$("#btnadd").click(function(){
		
			//trim() : 공백에 대해 상관하지 않음
			var nickname = $("#nickname").val(); //.trim();
			var content = $("#content").val()//.trim();
			
			if(nickname.length==0){
				swal ("Nope", "닉네임을 꼭 써주세요!!!" ,  "error");
				return;
			}
			if(content.length==0){
				swal ("Nope", "내용을 입력해 주세요" ,  "error");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"board/insertAnswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					//기존 입력 값 지우기
					$("#nickname").val("");
					$("#content").val("");
					
					//리스트 호출
					list();
				},
				statusCode:{
						404:function(){
							alert("json파일을 찾을 수 없어요")
						},
						500:function(){
							alert("서버 오류 발생 코드 확인")
						}
					}
				});
			});
		
		
	});
	
	function list() {
		// console.log("list num : " +$("#num").val())
		
		$.ajax({
			type:"get",
			url:"board/listAnswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){
				//댓글 갯수 출력
				$("b.acount>span").text(res.length);
				
				var s = "";
				$.each(res,function(idx,item){
					s+="<div>"+item.nickname+":"+item.content;
					s+="<span class='day'>"+item.writeday+"</span>";
					s+="<i idx="+item.idx+" class='bi bi-trash3-fill adel'></i>";
					s+="</div>";
				});
				
				$("div.alist").html(s);
			}
			
			
		});
	}
</script>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>

<body>
<%
	String num = request.getParameter("num");

String currentPage = request.getParameter("currentPage");
dao.updateReadCount(num);

SmartDto dto = dao.getDate(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
	<input type="hidden" id="num" value="<%=num%>">
		<tr>
			<td>
				<b><h2>제목 : <%=dto.getSubject() %></h2></b>
				<span class="day">
				<b>작성자 : <%=dto.getWriter() %></b>
				<br>
				<%=sdf.format(dto.getWriteday())%>
				&nbsp;&nbsp;&nbsp;&nbsp;조회수 : <%=dto.getReadcount() %></span>
			</td>
		</tr>
		<tr height="150">
			<td>
				<b><%=dto.getContent()%></b>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<b class="acount" id="alist">댓글 갯수 : <span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<div>
					<input type="text" id="nickname" class="form-control" style="width: 130px" placeholder="닉네임 입력">
					<input type="text" id="content" class="form-control" style="width: 300px" placeholder="댓글메세지">
					<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
				</div>
			</td>
		</tr>
		
		<tr>	
			<td align="right">
				<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>'">수정</button>
				<button type="button" class="btn btn-outline-success" onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	function funcdel(num, currentPage) {
		// alert(num + ", " + currentPage);
		
		var a = confirm("삭제를 원하시면 [확인]을 눌러주세요");
		if(a){
			location.href="board/deleteaction.jsp?num="+num+"&currentPage="+currentPage
		}
	}
</script>
</body>
</html>