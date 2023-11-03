<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

	<c:if test="${sessionScope.loginok!=null }">
		<button type="button" class="btn btn-outline-primary"
			onclick="location.href='form'">글쓰기</button>
	</c:if>
	<c:if test="${sessionScope.loginok==null }">
		<h3>로그인 후 이용가능합니다</h3>
	</c:if>
	<br>
	<br>
	<table class="table table-bordered" style="width: 125vh;">
		<tr class="table-secondary">
			<th style="width: 60px;">번호</th>
			<th style="width: 520px;">제목</th>
			<th style="width: 160px;">작성자</th>
			<th style="width: 100px;">조회</th>
			<th style="width: 230px;">등록일</th>
		</tr>
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="5" align="center"><b>등록된 글이 없습니다</b></td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${no }</td>
				<c:set var="no" value="${no-1 }"/>
				<td><a href="content?num=${dto.num }&currentPage=${currentPage}">${dto.subject }
				<c:if test="${dto.uploadfile!='NoFile' }">
					<i class="bi bi-paperclip"></i>
				</c:if>
				</a></td>
				<td>${dto.content }</td>
				<td>${dto.readcount }</td>
				<td>
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!--페이징  -->
    <c:if test="${totalCount>0 }">
       <div style="width: 800px; text-align: center;">
         <ul class="pagination justify-content-center">
           <!-- 이전 -->
           <c:if test="${startPage>1}">
             <li class="page-item "><a href="list?currentPage=${startPage-1}">이전</a></li>
           </c:if>
           
           
           <c:forEach var="pp" begin="${startPage }" end="${endPage }">
             <c:if test="${currentPage==pp }">
                <li class="page-item active">
                <a class="page-link" href="list?currentPage=${pp }">${pp }</a></li>
             </c:if>
             <c:if test="${currentPage!=pp }">
                <li class="page-item">
                <a class="page-link" href="list?currentPage=${pp }">${pp }</a></li>
             </c:if>
           </c:forEach>
           
           
           <!-- 다음 -->
           <c:if test="${endPage<totalPage}">
             <li class="page-item "><a href="list?currentPage=${endPage+1}">다음</a></li>
           </c:if>
         </ul>
       </div>
    </c:if>
</body>
</html>