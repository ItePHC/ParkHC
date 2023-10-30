<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- jstl 변수선언 -->
	<c:set var="name" value="김영준" />
	<c:set var="age" value="22" />
	<c:set var="today" value="<%=new Date()%>" />

	<!-- JSTL 출력법 _1 -->
	<h2>
		이름 :
		<c:out value="${name }" />
	</h2>

	<!-- JSTL 출력법 _2 -->
	<h2>이름 : ${name }</h2>
	<h2>나이 : ${age }</h2>
	<h2>오늘 날짜 : ${today }</h2>

	<!-- pattern 이용한 fmt 날짜형식 -->
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm" />
	<br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a HH:mm" />
	<br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEE" />
	<br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEEE" />
	<br>
	<fmt:formatDate value="${today }" pattern="yyyy년MM월dd일" />
	<br>

	<c:set var="money" value="27000" />
	<c:set var="num1" value="123.45678" />

	<!-- 숫자출력 -->
	<pre>
	${money }
	${num1 }
	
	<!-- 1000단위 구분기호 , 넣기 -->
	<fmt:formatNumber value="${money }" type="number" />
	
	<!-- currency : 3자리 마다 , 화폐단위 -->
	<fmt:formatNumber value="${money }" type="currency" />
	
	<!-- pattern -->
	<fmt:formatNumber value="1.5" pattern="0.00" />
	<fmt:formatNumber value="1.5" pattern="0.##" />
	<fmt:formatNumber value="1.5" pattern="##" />
	
	<fmt:formatNumber value="${num1 }" pattern="0.00" />
	
	<!-- if문 -->
	<c:set var="num1" value="7" />
	<c:set var="num2" value="4" />
	
	<!-- 출력 : c:out은 생략가능 -->
	숫자 1 : ${num1 }<br>
	숫자 2 : ${num2 }<br> 
	
	<!-- 조건문 c:if .... else없음 -->
	<c:if test="${num1>num2 }">
		<h2>숫자1이 더 큽니다.</h2>
	</c:if>
	<c:if test="${num1<num2 }">
		<h2>숫자2가 더 큽니다.</h2>
	</c:if>
	
	<!-- if문 -->
	<c:set var="nara" value="프랑스" />
	
	<c:if test="${nara=='체코' }">		<!-- 문자열 비교도 ==으로 비교한다 -->
		<h2>체코에서 한달살기</h2>
	</c:if>
	<c:if test="${nara=='프랑스' }">
		<h2>프랑스의 에펠탑에서 와인마시기</h2>
	</c:if>
	
	</pre>
</body>
</html>