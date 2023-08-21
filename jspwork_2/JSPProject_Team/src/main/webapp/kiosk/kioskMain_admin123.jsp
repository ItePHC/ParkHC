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
<script type="text/javascript">
	var rightId="admin";
	var rightPw="1234";
	
	function login(id,pw){
        if(id==rightId)
        {
            if(pw==rightPw)
            {
                alert("로그인 성공");
               	window.open("../Kiosk_admin/list_admin.jsp")
            }else{
                alert("잘못된 비밀번호입니다");
            }
        }else{
            alert("존재하지 않는 아이디입니다");
        }
    }


    var userId=prompt("관리자 아이디 입력","아이디");
    var userPw=prompt("비밀번호 입력","비밀번호");

    login(userId,userPw);
	
</script>
</body>
</html>