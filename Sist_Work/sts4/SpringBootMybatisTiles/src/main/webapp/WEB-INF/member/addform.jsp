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
<title>Insert title here</title>
<style type="text/css">
#showimg {
	border: 1px solid white;
	width: 15vh;
	height: 25vh;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#btnphoto").click(function() {
			$("#myphoto").trigger("click");
		});

		//사진 미리보기
		$("#myphoto").on("change", function(event) {

			var file = event.target.files[0];

			var reader = new FileReader();
			reader.onload = function(e) {

				$("#showimg").attr("src", e.target.result);
			}

			reader.readAsDataURL(file);
		});

		//아이디 입력시 아이디 체크
		$("#btnidcheck").click(function() {

			//alert($("#id").val());
			$.ajax({
				type : "get",
				dataType : "json",
				url : "idcheck",
				data : {"id" : $("#id").val()},
				success : function(res) {
					if (res.count == 0) {
						$("span.idcheck").text("사용 가능한 아이디 입니다");
					} else {
						$("span.idcheck").text("이미 사용중인 아이디 입니다");

					}
				}
			});
		});

		$("#pass2").keyup(function() {
			var p1 = $("#pass1").val();
			var p2 = $(this).val();

			if (p1 == p2) {
				$("span.passcheck").text('비밀번호가 일치합니다')
			} else {
				$("span.passcheck").text('비밀번호가 일치하지 않습니다')
			}

		});
	});

	function check() {
		// 사진
		if ($("#myphoto").val() == '') {
			alert("사진을 넣어주세요");
			return false;
		}
		// id
		if ($("span.idcheck").text() != '사용 가능한 아이디 입니다') {
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		// pass
		if ($("span.passcheck").text() != '비밀번호가 일치합니다') {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
	}
</script>
</head>
<body>
	<div style="margin: 150px 150px;">
		<form action="insert" method="post" enctype="multipart/form-data"
			onsubmit="return check()">
			<table class="table table-bordered" style="width: 75vh;">
				<caption align="top">
					<b>회원가입</b>
				</caption>
				<tr>
					<td rowspan="5" align="center" style="width: 20vh;"><input
						type="file" id="myphoto" name="myphoto" style="display: none;">
						<button type="button" id="btnphoto" class="btn btn-outline-info">사진선택</button>
						<br> <img id="showimg"
						style="display: block; object-fit: cover;"></td>
					<td>
						<div class="d-inline-flex">
							<input type="text" placeholder="아이디입력" name="id" id="id"
								class="form-control" style="width: 15vh;" required="required">
							<button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>
							&nbsp;&nbsp; <span class="idcheck"
								style="width: 30vh; color: green"></span>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="d-inline-flex">
							<input type="password" style="width: 15vh;" class="form-control"
								name="pass" id="pass1" placeholder="비밀번호 입력" maxlength="4"
								required="required"> <input type="password"
								style="width: 15vh;" class="form-control" id="pass2"
								placeholder="비밀번호 확인" maxlength="4" required="required">
							&nbsp;&nbsp; <span class="passcheck"
								style="width: 30vh; color: green"></span>
						</div>
					</td>
				</tr>

				<tr>
					<td><input type="text" name="name" class="form-control"
						placeholder="이름 입력" required="required" style="width: 15vh;">
					</td>
				</tr>

				<tr>
					<td><input type="text" name="email" class="form-control"
						placeholder="이메일 입력" required="required" style="width: 15vh;">
					</td>
				</tr>

				<tr>
					<td><input type="text" name="addr" class="form-control"
						placeholder="주소 입력" required="required" style="width: 15vh;">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">회원가입</button>
						<button type="button" class="btn btn-outline-success"
							onclick="location.href=''">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>