
<%@page import="java.util.List"%>
<%@page import="db.quizBoard.QuizBoardDto"%>
<%@page import="db.quizBoard.QuizBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
   div.col-md-2{
      cursor: pointer;
   }
</style>
<body>
   <%
   QuizBoardDao dao=new QuizBoardDao();
   List<QuizBoardDto> list=dao.getAllBoards();
   %>
   <button type="button" class="btn btn-outline-dark  btn-sm" style="width: 35px;height: 30px;margin-left: 5px" onclick="location.href='quizList.jsp'"><i class="bi bi-card-list"></i></button>
   <button type="button" class="btn btn-outline-success btn-sm" style="width: 35px;height: 30px;margin-left: 1px" onclick="location.href='quizForm.jsp'"><i class="bi bi-pencil-square"></i></button><br>
   <div class="row">
      <%for(int i=0;i<list.size();i++)
      {%>
         <div class="col-md-2">
            <%if(list.get(i).getImgname()==null) 
            {continue;}
            else{%>
            <img src="../fileupload/<%=list.get(i).getImgname() %>" style="width: 80px"><br>
            <b>작성자:<%=list.get(i).getWriter() %></b><br>
            <b>제목:<%=list.get(i).getTitle() %></b>
            <b style="visibility: hidden" class="thisNum"><%=list.get(i).getQ_num() %></b>
         </div>
      <%}
      }%>
   </div>
</body>
</html>