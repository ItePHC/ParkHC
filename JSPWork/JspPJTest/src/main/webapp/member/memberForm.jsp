<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<script>
	$(function(){
		
		//id중복체크
		$("#btncheck").click(function(){
			//id읽기
			var id=$("#id").val();
			//alert(id);
			
			$.ajax({
				type:"get",
				url:"member/idSearch.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					//alert(res.count);
					if(res.count==1){
						//alert("이미 가입된 아이디입니다\n다시 입력해주세요");
						$("span.idsuccess").text("Fail").css("color","red");
						$("#id").val("");
						$("#id").focus();
					}else{
						//alert("가입 가능한 아이디입니다");
						$("span.idsuccess").text("Success").css("color","blue");
					}
				}
			});
		});
		
		$("#selemail").change(function(){
			if($(this).val()=="-")
			{
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val($(this).val());
			}
		});
	});

	function check(c){
		if(c.pass.value!=c.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			c.pass.value="";
			c.pass2.value="";
			
			return false; //action이 호출되지 않는다
		}
	}
</script>
<body>
	<form action="member/memberProc.jsp" method="post" onsubmit="return check(this)">
		<table class="table table-bordered" style="width: 500px">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th style="width: 100px;background-color: gray">아이디</th>
				<td>
					<input type="text" name="id" id="id" class="form-group" required="required" style="width: 120px">
					<button type="button" class="btn btn-danger btn-sm" id="btncheck">중복체크</button>
					<span class="idsuccess"></span>
				</td>
			</tr>
			<tr>
				<th style="width: 100px;background-color: gray">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-group" required="required" placeholder="비밀번호" style="width: 120px">
					<input type="password" name="pass2" class="form-group" required="required" placeholder="비밀번호 확인" style="width: 120px">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;background-color: gray">이름</th>
				<td>
					<input type="text" name="name" required="required" placeholder="이름" style="width: 150px">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;background-color: gray">연락처</th>
				<td>
					<input type="text" name="hp" required="required" placeholder="연락처" style="width: 200px">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;background-color: gray">주소</th>
				<td>
					<input type="text" name="addr" required="required" placeholder="주소" style="width: 350px">
				</td>
			</tr>
			<tr>
				<th style="width: 100px;background-color: gray">이메일</th>
				<td>
					<input type="text" name="email1" class="form-group" required="required" style="width: 130px">
					<b>@</b>
					<input type="text" name="email2" id="email2" class="form-group" required="required" style="width: 120px">
					<select id="selemail">
						<option value="-">직접입력</option>
						<option value="naver.com">naver</option>
						<option value="gmail.com">gmail</option>
						<option value="hanmail.net">daum</option>
						<option value="nate.com">nate</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info" style="width: 100px">회원가입</button>
					<button type="reset" class="btn btn-outline-info" style="width: 100px">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>