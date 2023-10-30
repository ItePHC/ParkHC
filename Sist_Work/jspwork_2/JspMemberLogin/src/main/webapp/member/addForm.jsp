<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#btnGaip").click(function() {
			if(mfrm.mid.value.length==0){
				alert("아이디 입력 버튼을 눌러주세요");
				return false;
			}			
		})
	})
</script>
</head>
<body>
<%--회원가입 (Form/Proc/check) --%>
<div style="margin: 20px; 100px;">
	<form action="addProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>회원 가입</b></caption>
			<tr>
				<td style="background-color: #66ccff; width: 120">아이디</td>
				<td>
					<input type="text" class="form-control" name="id" style="width: 120px;" readonly="readonly" required="required" id="mid">	<!-- readonly : 읽기전용 -->
					<button type="button" class="btn btn-danger btn-sm" onclick="openId()">아이디 입력</button>
				</td>
			</tr>
			
			<tr>
				<td style="background-color: #66ccff" width="120">비밀번호</td>
				<td>
					<input type="password" class="form-control" name="pass" style="width: 120px;" required="required">
				</td>
			</tr>
			
			<tr>
				<td style="background-color: #66ccff" width="120">이름</td>
				<td>
					<input type="text" class="form-control" name="name" style="width: 120px;" required="required">
				</td>
			</tr>
			
			<tr>
				<td style="background-color: #66ccff" width="120">사진</td>
				<td>
					<input type="file" class="form-control" name="uploadImage" style="width: 250px;">
				</td>
			</tr>
			
			<tr>
				<td style="background-color: #66ccff" width="120">핸드폰</td>
				<td>
					<input type="text" class="form-control" name="hp" style="width: 200px;" required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success" id="btnGaip">회원가입</button>
					<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
				</td>
			</tr>
			
		</table>
	</form>
</div>

<script type="text/javascript">
	function openId() {
		window.open("idcheck.jsp","e","left=400px, top=100px, width=400px, height=250px");
	}
</script>

</body>
</html>