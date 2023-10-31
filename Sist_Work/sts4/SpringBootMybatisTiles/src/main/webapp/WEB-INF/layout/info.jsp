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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
img {
	width: 100%;
	object-fit: cover;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#btnloginok").click(function() {
			
			//ID 비번 읽기
			var id = $("#loginid").val();
			var pass = $("#loginpass").val();
			
//			alert(id+"//"+pass);
			
//			var root = '${root}';
//			console.log("root" + root);
			
			$.ajax({
				type:"get",
				url:"/member/login",
				dataType:"json",
				data:{"id":id, "pass":pass},
				success:function(res){
					if(res.result=='fail'){
						alert("아이디와 비밀번호를 확인해 주세요")
					}else{
						location.reload();
					}
				}
			});
		});
		$("#btnlogout").click(function() {
			$.ajax({
				type:"get",
				url:"/member/logout",
				dataType:"html",
				success:function(){
					location.reload();
				}
			});
		});
	});
</script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />

	<!-- 로그인 안하면 기본사진, 로그인하면 자기사진으로 변경 -->
	<div class="loginmenu" style="text-align: center;">
		<b style="font: Dongle;">각종 정보 나타나게 해올 것!</b>
		<c:if test="${sessionScope.loginok==null }">
			<img alt="" src="${root }/image/oneday01.jpg" style="width: 10vh; border-radius: 60px;">
			<br>
		</c:if>
		<c:if test="${sessionScope.loginok!=null }">
			<img alt="" src="${root }/upload/${sessionScope.loginphoto }" style="width: 10vh; border-radius: 60px;">
			<br>
		</c:if>

		<button type="button" onclick="location.href='${root }/login/main'"
			class="btn btn-outline-success">로그인페이지</button>
		<button type="button" onclick="location.href='${root }/member/myinfo'"
			class="btn btn-outline-info">나의정보</button>
		<button type="button" onclick="location.href='${root }/member/list'"
			class="btn btn-outline-secondary">회원목록</button>
			<c:if test="${sessionScope.loginok==null }">
				<div class="container mt-3">
					<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">Ajax로그인</button>
				</div>
			</c:if>
			<c:if test="${sessionScope.loginok!=null }">
				<div class="container mt-3">
					<button type="button" class="btn btn-outline-primary" id="btnlogout">Ajax로그아웃</button>
				</div>
			</c:if>
		
	</div>
	
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<input type="text" class="form-control" id="loginid" placeholder="아이디 입력"><br>
					<input type="password" class="form-control" id="loginpass" placeholder="비밀번호 입력">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnloginok" data-bs-dismiss="modal">login</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	
</body>
</html>