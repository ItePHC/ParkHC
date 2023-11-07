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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
	.likes{cursor: pointer;}
</style>
<script type="text/javascript">
	$(function() {
		$("div.likes").click(function() {
			
		
		var num = ${dto.num};
//			alert(num);
			
			$.ajax({
				type:"get",
				url:"likes",
				datraType:"json",
				data:{"num":num},
				success:function(res){
					$("div.likes").find("b").text(res.likes);
				}
			});
			
			var thum = $(this).find("i").attr("class");
//			alert(thum);
			if(thum=='bi bi-hand-thumbs-up'){
				$(this).find("i").attr("class","bi bi-hand-thumbs-up-fill")
//				$(this).find("i").attr("class","bi bi-hand-thumbs-up-fill").css("color","red")
			}
			if(thum=='bi bi-hand-thumbs-up-fill'){
				$(this).find("i").attr("class","bi bi-hand-thumbs-up")
			}
		});
	});
</script>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<td>
				<h1>${dto.subject }</h1>
				<b style="float: right;">${dto.name }(${dto.id })</b><br>
				<span style="float: right;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					조회:${dto.readcount }
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<div style="float: left;">
					${dto.content }
				</div><br><br>
				<c:if test="${dto.photo!='no' }">
					<c:forEach var="photo" items="${dto.photo }">
						<img alt="" src="../rephoto/${photo }" style="width: 200px;">
					</c:forEach>
				</c:if>
				<br><br>
				<div class="likes" >
					<i class="bi bi-hand-thumbs-up" ></i>
					&nbsp;&nbsp; 좋아요<b>${dto.likes }</b>
				 </div>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${sessionScope.loginok!=null&&sessionScope.myid==dto.id }">
					<button type="button" class="btn btn-outline-success" onclick="location.href='form'">글쓰기</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep} &relevel=${dto.relevel}&currentPage=${currentPage }'">답글</button>
				</c:if>
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
					<button type="button" class="btn btn-outline-success" onclick="location.href='update?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</c:if>
				
				<button type="button" class="btn btn-outline-success" onclick="location.href='list?'">목록</button>
				
				
			</td>
		</tr>	
	</table>
</body>
</html>