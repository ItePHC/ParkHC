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
<h2>JSP는 HTML5 구조의 자바 코드를 사용할 수 있는 서버 언어이다</h2>
<h3>Servlet은 확장자가 java이며 자바 클래스 구조에 <br>html, css, js도 사용할 수 있다</h3>
<h3>jsp주석은 2가지 기능을 가진다</h3>
<!-- 주석 1 : 소스보기에서는 보인다 -->
<%-- jsp주석 : 소스보기에서도 안보인다 --%>
<%-- <%=name %>님의 나이는 <%=age %>입니다 --%>

<%!	//선언문		(!는 매서드를 출력하기 위해 사용)
// 스크립트릿(Scriptlet)
// 여기서 선언하는 변수는 지역변수로 등록된다
// 그래서 이곳의 변수를 html에서 사용하려면 선언한 곳보다 아래에서 사용가능 하다
// 주석도 자바.... 자바코드 사용가능
	int age=17;
	String name="김영환";
	
	//매서드
	public String getCheck(){
		
		if(age>=20)
			return "성인 입니다";
		else
			return "미성년자 입니다";
	}
	
%>
<!-- 표현식 -->
<%-- <%=name %>님의 나이는 <%=age %>입니다 --%>

<h3 class="alert alert-info">멤버변수 출력</h3>
<b>이름 : <%=name %></b><br>		<!-- 표현식 -->
<b>나이 : <%=age %>세 (<%= getCheck() %>)</b><br>

</body>
</html>