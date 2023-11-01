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
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$(".btnnewphoto").click(function() {
			$("#newphoto").trigger("click");

		});

		$("#newphoto").change(function() {
			var num = $(this).attr("num");
			console.log(num);

			var form = new FormData();
			form.append("photo", $("#newphoto")[0].files[0]); //선택한 1개 추가
			form.append("num", num);

			console.dir(form);

			$.ajax({
				type : "post",
				dataType : "html",
				url : "updatephoto",
				processData : false,
				contentType : false,
				data : form,
				success : function() {
					location.reload();
				}

			});
		});
		
		$(".btndelete").click(function() {
			var num = $(this).attr("num");
//			alert(num);
			
			var ans = confirm("정말 탈퇴하시겠습니까");
			
			if(ans){
				
				$.ajax({
					type : "get",
					dataType : "html",
					url : "delMyInfo",
					data : {"num":num},
					success : function() {
						alert("삭제되었습니다");
						location.href="/";
					}
				});
			}
		});
		
		$("#updatebtn").click(function() {
			//ID 비번 읽기
			var num = $("#num").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var addr = $("#addr").val();

			$.ajax({
				type:"get",
				url:"/member/updatemember",
				dataType:"html",
				data:{"num":num, "name":name, "email":email, "addr":addr},
				
				success:function(){
						alert("수정되었습니다");
						location.reload();
						}
					});
			});
	});
</script>
</head>
<body>
	<div style="margin: 25vh;">
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list}">
				<c:if test="${sessionScope.loginok==null}">
					<h3 class="alert alert-danger">로그인 후 이용 가능합니다</h3>
					<button type="button" class="btn btn-outline-success" onclick="location.href='${root}/login/main'">Login</button>
				</c:if>
			
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id}">
				<%-- <b>${dto.id }			//세션: ${sessionScope.myid }</b> --%>
					<tr>
						<td style="width: 30vh;" align="center" rowspan="5">
							<img src="../upload/${dto.photo}" width="30vh;" height="40vh;" border="1">
							<br> 
							<input type="file" style="display: none;" num=${dto.num } id="newphoto"> <!-- 사진 수정시 호출 -->
							<button type="button" class="btn btn-info btnnewphoto">사진수정</button>
						</td>
						<td style="width: 37.5vh">회원명 : ${dto.name}</td>
					</tr>
					<tr>
						<td>아이디:${dto.id}</td>
					</tr>
					<tr>
						<td>이메일:${dto.email}</td>
					</tr>
					<tr>
						<td>주소:${dto.addr}</td>
					</tr>
					<tr>
						<td align="center" valign="bottom"
							style="width: 25vh;; vertical-align: middle;">
							<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#updateModal" num=${dto.num }>수정</button>
							<button type="button" class="btn btn-outline-secondary btndelete" num=${dto.num }>삭제</button>
						</td>
					</tr>
				</c:if>
				
				<!-- The Modal -->
				<div class="modal" id="updateModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">Modal Heading</h4>
				        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				       
				        	<div class="form-control">
				        	<input type="hidden" id="num" value="${dto.num }" style="width: 30vh;">
				        		<div>
				        		<label>회원명</label>
				        		<br>
				        			<input type="text" id="name" value="${dto.name }" style="width: 30vh;"> 
				        		<br>
				        		<label>이메일</label>
				        		<br>
				        			<input type="text" id="email" value="${dto.email }" style="width: 30vh;">
				        		<br> 
								<label>주소</label>
								<br>
									<input type="text" id="addr" value="${dto.addr }" style="width: 30vh;">
								</div>
				        	</div>
				       
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				      <button type="button" class="btn btn-primary" id="updatebtn" data-bs-dismiss="modal">수정하기</button>
				      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
				      </div>
				
				    </div>
				  </div>
				</div>	
			</c:forEach>
		</table>
	</div>
</body>
</html>
