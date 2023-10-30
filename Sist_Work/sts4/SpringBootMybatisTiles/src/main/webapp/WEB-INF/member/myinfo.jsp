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
	});

</script>
</head>
<body>

	<div style="margin: 25vh;">
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list}">
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id}">
					<tr>
						<td style="width: 30vh;" align="center" rowspan="4">
							<img src="../upload/${dto.photo}" width="30vh;" height="40vh;" border="1">
							<br> 
							<input type="file" style="display: none;" num=${dto.num } id="newphoto"> <!-- 사진 수정시 호출 -->
							<button type="button" class="btn btn-info btnnewphoto">사진수정</button>
						</td>
						<td style="width: 37.5vh">회원명 : ${dto.name}</td>
						<td rowspan="4" align="center" valign="bottom"
							style="width: 25vh;; vertical-align: middle;">
							<button type="button" class="btn btn-outline-secondary">수정</button>
							<br>
						<br>
							<button type="button" class="btn btn-outline-secondary" onclick="location.href=''">삭제</button>
						</td>
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
				</c:if>
			</c:forEach>

		</table>
	</div>
</body>
</html>
