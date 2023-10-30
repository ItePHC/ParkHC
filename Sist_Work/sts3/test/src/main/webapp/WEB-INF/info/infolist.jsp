<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<button type="button" class="btn btn-info btn-sm"
onclick="location.href='addform'">글쓰기</button>
<br><br>
<div class="alert alert-danger">
<c:if test="${totalcount==0 }">
		<h2>저장된 정보가 없습니다</h2>
	</c:if>
	<c:if test="${totalcount>0 }">
		<h2>총${totalcount }개의 정보가 있습니다</h2>
	</c:if>
</div>
<hr>
<div style="text-align: center">
<table class="table table-dark" style="width: 800px;">
  <tr valign="middle">
    <th width="100px;">번호</th>
    <th width="120px;">이름</th>
    <th width="120px;">운전면허</th>
    <th width="160px;">주소</th>
    <th width="150px;">사진</th>
    <th width="160px;">가입일</th>
    <th width="200px;">편집</th>
  </tr>
  <c:forEach var="dto" items="${list }" varStatus="i">
  	<tr valign="middle">
  	  <td><b>${i.count }</b></td>
  	  <td><b>${dto.name }</b></td>
  	  <td><b>${dto.driver }</b></td>
  	  <td><b>${dto.addr }</b></td>
  	  <c:if test="${dto.photo!='no' }">
  	   <td><img src="../photo/${dto.photo }" style="width: 75px; height: 75px;"
  	  class="img-circle"></td> <!-- list에 출력해야하므로 하나 상위인 info -->
  	  </c:if>
  	   <c:if test="${dto.photo=='no' }">
  	   <td><img src="../photo/no.png" style="width: 75px; height: 75px;"
  	  class="img-circle"></td>
  	  </c:if>
  	   <td><b>${dto.gaipday }</b></td>
  	  <td>
  	    <button type="button" class="btn btn-success"
  	    onclick="location.href='uform?num=${dto.num}'">수정</button>
  	    <button type="button" class="btn btn-danger"
  	    onclick="location.href='delete?num=${dto.num}'">삭제</button>
  	  </td>
  	</tr>
  </c:forEach>
</table>

<div style="width: 900px; text-align: center;"> <!-- 검색툴 -->
  <form action="list" class="d-inline-flex">
    <select name="title" class="form-control" style="width: 120px;">
      <option value="name" ${title=='name'?"selected":"" }>이름</option>
      <option value="addr" ${title=='addr'?"selected":"" }>주소</option>
      <option value="driver" ${title=='driver'?"selected":"" }>운전면허</option>
    </select>
    <input type="text" name="search" class="form-control"
    placeholder="검색단어" style="width: 150px;" value="${search }">
    
    <button type="submit" class="btn btn-success">검색</button> <!-- 컨트롤러로 넘겨야해서 submit -->
  </form>
</div>

</div>
</body>
</html>