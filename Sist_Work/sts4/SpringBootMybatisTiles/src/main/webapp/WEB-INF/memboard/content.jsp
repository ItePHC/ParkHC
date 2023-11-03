<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.day{
color: gray;
float: right;
}
.icon{
float: right;
}
.amod, .adel{
cursor: pointer;
color: gray;
}
</style>
<script type="text/javascript">
	
	$(function() {
		
		list();
		
		content = $("#content").val();
		num =	$("#num").val();					// ${dto.num}
		loginok = "${sessionScope.loginok}"; 
		myid = "${sessionScope.myid}";				//?

//		name = "${sessionScope.name}";
//		alert(name);
		

		$("#btnaddanswer").click(function() {
		
			content = $("#content").val();
			
			if(content.length==0) {
				alert("댓글을 입력해 주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/mbanswer/ainsert", 
				dataType:"html", 
				data:{"content":content, "num":num},
				success:function(){
					
					//alert("인서트 성공");
					list();
							
					//입력값 초기화
					$("#content").val("");
				}
				
			});
			
			
			
		});
		
		//댓글 수정창 띄우기
		$(document).on("click",".amod",function(){
//		$(".amod").click(function() {
			idx=$(this).attr("idx");
//			alert(idx);
			
			$.ajax({
		
			type:"get",
			dataType:"json",
			url:"/mbanswer/adata",
			data:{"idx":idx},
			success:function(res){
				$("#ucontent").val(res.content);
			}
		});
		
		$("#mbUpdateModal").modal("show");
		}) ;
			
		//댓글 수정
		$(document).on("click","#btnupdate",function(){
		
		var content = $("#ucontent").val();
//		alert(idx+","+content);

		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"/mbanswer/aupdate",
			data:{"idx":idx,"content":content},
			success:function(){
				location.reload();
				list();
				
			}
		});
 });
		
		
		
		
		
	//댓글 삭제
	//댓글 삭제  //댓글 휴지통과 수정버튼은 자동으로 생성된 버튼. 따라서 document.on을 써서 해줘야함

	$(document).on("click","i.adel",function(){
			
		var idx = $(this).attr("idx");
//		alert(idx);
		var del = confirm("정말 삭제하시겠습니까?");
			
		if(del){				
			$.ajax({
				type:"get",
				dataType:"html",
				url:"/mbanswer/deleteasw",
				data:{"idx":idx},
				success:function(){
					alert("댓글이 삭제되었습니다");
					location.reload();	
					list();
					}
				});
			}  
		});
	
	});

	function list() {
		num = $("#num").val();					// ${dto.num}
		
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:"/mbanswer/alist",
			data:{"num":num},
			success:function(res){
				$("span.acount").text(res.length);
				
				var s ="";
				$.each(res, function(i,dto){
					s+="<div class='form-control'>"
					
					s+="<b class='name'>" + dto.name + "</b>";
					s+= "<div class='day'>" + dto.writeday + "</div>";
					
//					s+="<hr>"
					s+="<div class='content'>" + dto.content;
					s+="<div class='icon'>";
					if(myid==dto.myid){
						s+="<i class='bi bi-pencil-square amod'  idx='"+dto.idx+"'></i>";
						s+="&nbsp";
						s+="<i class='bi bi-trash adel' idx='"+dto.idx+"'></i>";
					}
					s+="</div>";
					s+="</div>";
					s+="</div>";
					s+="<br>";
				});
				
				$("div.alist").html(s);
			}
		});
	}
	
</script>
</head>
<body>
	<table class="table table-bordered" style="width: 90vh;">
		<tr>
			<td>
			
				<h4>
					<b>${dto.subject }</b> 
					<span style="font-size: 12pt; float: right;"> 
					<b style="color: black;">조회수 : ${dto.readcount }</b>&nbsp;&nbsp;&nbsp;
						<b style="color: red;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" /></b>
					</span>
				</h4>
				<span>작성자 : ${dto.name }(${dto.myid })</span>
				<c:if test="${dto.uploadfile!='NoFile' }">
					<span style="float: right;">
						<a href="download?clip=${dto.uploadfile }"><i class="bi bi-cloud-download"></i>&nbsp;<b>${dto.uploadfile }</b></a>
					</span>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${bupload==true }">
					<img src="../savefile/${dto.uploadfile }" style="width: 200px;">
					<br>
				</c:if>
				<br>
				<pre>
					${dto.content }
				</pre>
			</td>
		</tr>
		
		<tr>
			<td>댓글 : <span class="acount"></span>개</td>
		</tr>
		
		<!-- 댓글 출력 공간 -->
		<tr>
			<td>
				<div class="alist"></div>
				<input type="hidden" id="num" value="${dto.num }">
				<c:if test="${sessionScope.myid!=null }">
					<div class="aform d-inline-flex">
						<input type="text" class="form-control" style="width: 80vh; height: 10vh; " placeholder="댓글을 입력하세요" id="content">
						<button type="button" style="width: 8vh;" class="btn btn-outline-info" id="btnaddanswer">등록</button>
					</div>
				</c:if>
			</td>
		</tr>
		
		<!-- 버튼추가 -->
		<tr>
			<td align="right">
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-outline-info" onclick="location.href='form'">글쓰기</button>
				</c:if>
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.myid }">
					<button type="button" class="btn btn-outline-info" onclick="location.href='update?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button type="button" class="btn btn-outline-info" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
				</c:if>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list?currentPage=${currentPage }'">목록</button>
			</td>
		</tr>
	</table>
	
	<!-- The Modal -->
	<div class="modal" id="mbUpdateModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">댓글수정</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	       <input type="text" id="ucontent" class="form-control">
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      <button type="button" class="btn btn-success" id="btnupdate">수정</button>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>