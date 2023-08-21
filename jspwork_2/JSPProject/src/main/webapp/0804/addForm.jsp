<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div>
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered" style="width: 600px">
		<th colspan="2" style="text-align: center"><%-- ?의 이름 출력 --%>자기소개</th>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="intro_name" class="form-control" required="required" style="width: 400px">
			</td>
		</tr>
		
		<tr>
			<th>혈액형</th>
			<td>
			
			<select id="intro_blood" class="form-control" style="width: 100px" name="intro_blood">
				<option value="A">A형</option>
				<option value="B">B형</option>
				<option value="O">O형</option>
				<option value="AB">AB형</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td>
				<select name="hp1" style="width: 80px" > 
					<option value="010" selected>010</option>
					<option value="010">011</option>
					<option value="010">016</option>
					<option value="017">017</option>
				</select> 
					<b> &nbsp;-&nbsp; </b><input type="text" name="hp2" style="width: 100px" maxlength="4" size="4"><b> &nbsp;-&nbsp; </b>  
					<input type="text" name="hp3" style="width: 100px" maxlength="4" size="4">	
			</td>
		</tr>
		
		<tr>
			<th>지역</th>
			<td>
				<input type="radio" name="intro_city" value="서울">서울&nbsp;
				<input type="radio" name="intro_city" value="경기">경기&nbsp;
				<input type="radio" name="intro_city" value="인천">인천&nbsp;<br>
				<input type="radio" name="intro_city" value="대전">대전&nbsp;
				<input type="radio" name="intro_city" value="대구">대구&nbsp;
				<input type="radio" name="intro_city" value="부산">부산&nbsp;<br>
			</td>
		</tr>
		

		<td colspan="2" align="center">
			<button type="submit" class="btn btn-success">정보 저장</button>
			<button type="button" class="btn btn-info" onclick="location.href='list.jsp'">목록으로 이동</button>
		</td>
		</table>
	</form>
	</div>
</body>
</html>