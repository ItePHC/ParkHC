<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.day{
	color: gray;
	margin-left: 30px;
	margin-right: 30px;
	font-size: 9px;
}

.amod, .adel{
	cursor:pointer;
}
</style>
<script>
$(function(){
	
	list();
	
	num=$("#num").val();
	idx=$("#idx").val();
	loginok="${sessionScope.loginok}";
	myid = "${sessionScope.myid}";
	
	//alert(num+","+loginok+","+myid);

	
	//insert	
	
	$("#btnansweradd").click(function(){
		
		var content=$("#content").val();
		
		//alert(num);
		
		if(content.length==0){
			
			alert("댓글을 입력해주세요");
			return;
		}
		
		//입력했을 때 ajax
		
		
		
		$.ajax({
			
			data:{"num":num,"content":content},
			dataType:"html",
			type:"post",
			url:"/mbanswer/ainsert",
			success:function(res){
				
			//	alert("인서트 성공");
			
//				list();
				$("#content").val(""); 
			}
			
		}); 
		
	}); 
	
	
	//댓글 수정창 띄우기
	
	$(document).on("click",".amod",function(){
		
		idx=$(this).attr("idx");
		//alert(idx);
	
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
		//alert(idx+","+content);
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"/mbanswer/aupdate",
			data:{"idx":idx,"content":content},
			success:function(){
				
				list();

			}
		});
	});
	
	//댓글 삭제  //댓글 휴지통과 수정버튼은 자동으로 생성된 버튼. 따라서 document.on을 써서 해줘야함
	$(document).on("click","i.adel",function(){
		
		var idx = $(this).attr("idx");
		alert(idx);
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
			})
		}  
	});
	
});

//list 수시로 호출해줘야되기 때문에 밖에다 빼줌

function list(){
	
	num=$("#num").val();
	//alert(num);
	
	$.ajax({
		
		type:"get",
		dataType:"json",
		url:"/mbanswer/alist",
		data:{"num":num},
		success:function(data){
						//성공했을 때 alist를 data라는 이름으로 불러옴
			$("span.acount").text(data.length);
			
			var s="";
			$.each(data,function(i,dto){
				//따라서 data를 넣어줘야함
				s+="<b>"+dto.name+"</b>:"+dto.content;
				s+="<span class='day'>"+dto.writeday+"</span>";
				
				if(loginok=='yes' && myid == dto.myid){
					
					s+="<i class='bi bi-pencil-square amod'  idx='"+dto.idx+"'></i>";
					s+="&nbsp";
					s+="<i class='bi bi-trash adel'  idx='"+dto.idx+"'></i>"
				}
				s+="<br>";
				$("div.alist").html(s);	
			});
			
			
				
		}
	}); 

} 
		

</script>
</head>
<body>
<div style="margin: 50px 150px">
	<table class="table table-bordered" style="width:600px;">
	<tr>
		<td>
		<h4><b>${dto.subject }</b>
		<span style="font-size: 10pt; color: gray; float:right;">
		<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
		</span>
		</h4>
		<span>작성자:${dto.name }(${dto.myid })</span>
		
		<c:if test="${dto.uploadfile!='no' }">
		<span style="float:right;"><i class="bi bi-cloud-download" style="cursor:pointer;"></i>
		&nbsp;<a href="download?clip=${dto.uploadfile }"><b>${dto.uploadfile }</b></a></span>
		</c:if>
		</td>
	</tr>
	
	<tr>
		<td>
		<div class="d-inline-flex">
		<c:if test="${bupload==true }">
			<img alt="" src="../savefile/${dto.uploadfile }" style="width: 200px; height:200px;">
			&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>	
			<br><br>
			
			<pre>${dto.content }</pre>
			
			<br>
			</div>
			<span style="float:right;"><b>조회: ${dto.readcount }</b><br></span>
			<b>댓글: <span class="acount"></span></b>
		</td>
	</tr>
	
	<!-- 댓글  -->
	<tr>
		<td>
			<div class="alist"></div>
			
			<input type="hidden" id="num" value="${dto.num }">
			
			<c:if test="${sessionScope.loginok!=null }">
				<div class="aform">
					<div class="d-inline-flex">
				<input type="text" class="form-control" style="width:500px;"
				placeholder="댓글을 입력하세요" id="content">&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info"
				id="btnansweradd">등록</button>
					</div>
				</div>
			</c:if>
		</td>
	</tr>
	
	<!-- 버튼들 추가  -->
	<tr>
		<td align="right">
		<c:if test="${sessionScope.loginok!=null }">
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='form'">글쓰기</button>
		</c:if>
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
		</c:if>						<!--ajax가 아니라 그냥 넘기는 것  -->		
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
		</c:if>
		<button type="button" class="btn btn-outline-success" 
		onclick="location.href='list?currentPage=${currentPage}'">목록</button>
		</td>
	</tr>
	
	</table>
</div>

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