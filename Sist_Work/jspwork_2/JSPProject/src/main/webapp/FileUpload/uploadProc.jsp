<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
   <%
   ServletContext context = getServletContext();
   String realFolder = context.getRealPath("/upload");

   System.out.println(realFolder);

   int filesize = 1024 * 1024 * 3; //3mb

   MultipartRequest multi = null;

   try {
      multi = new MultipartRequest(request, realFolder, filesize, "utf-8", new DefaultFileRenamePolicy());

      String writer = multi.getParameter("writer");
      String subject = multi.getParameter("subject");
      String uploadName = multi.getFilesystemName("uFile");
      String originalFileName = multi.getOriginalFileName("uFile");
   %>

   <table class="table" style="width: 700px;">
      <tr>
         <th>글쓴이</th>
         <td><%=writer%></td>
      </tr>

      <tr>
         <th>제목</th>
         <td><%=subject%></td>
      </tr>

      <tr>
         <th>업로드파일명</th>
         <td><img src="../upload/<%=uploadName %>"></td>
      </tr>

      <tr>
         <th>원래 파일명</th>
         <td><%=originalFileName %></td>
      </tr>

      <tr>
         <td colspan="2" align="center"><input type="button"
            value="다시업로드" onclick="location.href='uploadForm.jsp'"></td>
      </tr>
   </table>
   <%
   } catch (Exception e) {

      System.out.println("업로드 오류: "+e.getMessage());
      
   }
   %>
</body>
</html>