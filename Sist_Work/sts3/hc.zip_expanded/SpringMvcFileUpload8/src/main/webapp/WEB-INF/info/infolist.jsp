<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="alert alert-danger">
<b>${totalCount }개의 데이터가 있습니다</b>
</div>
<br>
<button type="button" class="btn btn-outline-info btn-sm"
onclick="location.href='addform'">글쓰기</button>

<hr>
<table class="table table-bordered" style="width: 900px;">
  <tr>
    <th width="60">번호</th>
    <th width="120">이름</th>
    <th width="100">사진</th>
    <th width="120">운전면허</th>
    <th width="360">주소</th>
    <th width="260">작성일</th>
    <th width="160">편집</th>
  </tr>
  <c:forEach var="dto" items="${list }" varStatus="i">
    <tr>
      <td align="center">${i.count }</td>
      <td align="center">${dto.name }</td>
      <td align="center">
        <c:if test="${dto.photo!='no' }">
          <img alt="" src="../photo/${dto.photo }" width="50" height="50"
          class="img-circle">
        </c:if>
        
        <c:if test="${dto.photo=='no' }">
          <img alt="" src="../photo/noimage.PNG" width="50" height="50"
          class="img-circle">
        </c:if>
      </td>
      <td>${dto.driver }</td>
      <td>${dto.addr }</td>
      <td>
         <fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd HH:mm"/>
      </td>
      <td>
        <button type="button" class="btn btn-outline-info btn-sm"
        onclick="location.href='uform?num=${dto.num}'">수정</button>
        <button type="button" class="btn btn-outline-danger btn-sm"
        onclick="location.href='delete?num=${dto.num}'">삭제</button>
      </td>
    </tr>
  </c:forEach>
</table>

<div style="width: 900px; text-align: center;" >
  <form action="list" class="d-inline-flex">
    <select name="title" class="form-control" style="width: 120px;">
       <option value="name" ${title=='name'?"selected":"" }>이름</option>
       <option value="addr" ${title=='addr'?"selected":"" }>주소</option>
       <option value="driver" ${title=='driver'?"selected":"" }>운전면허</option>
    </select>
    <input type="text" name="search" class="form-control"
    placeholder="검색단어" style="width: 150px;" value="${search }">
    
    <button type="submit" class="btn btn-success">검색</button>
  </form>
</div>

</body>
</html>