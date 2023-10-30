<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
img.photo{
width:200px;
height:230px;
border:1px solid gray;
border-radius: 20px;
margin-bottom:10px;}

tr{
padding: 10px;}
</style>
<title>Insert title here</title>
</head>
<%
   ShopDao dao=new ShopDao();
   List<ShopDto> list=dao.getAllSangpums();
%>
<body>
<div class="container mt-3">
  <h2>Toggleable Tabs</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-1">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-2">아우터</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-3">상의</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-4">하의</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-5">액세서리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-6">세트</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-1" class="container tab-pane fade"><br>
      <p>
      <table class="table table-bordered" style="width: 700px;">
        <caption align="top"><b>전체상품목록</b></caption>
        <tr>
           <%
           NumberFormat nf=NumberFormat.getCurrencyInstance();
           int i=0;
           for(ShopDto dto:list)
           {
              String photo=dto.getPhoto();
              
              //20~50까지 랜덤 할인율
              int sale=(int)(Math.random()*31)+20;
              %>
              <td>
                <img src="shopsave/<%=photo%>" class="photo">
                <br>
                <%=dto.getSangpum() %><br>
                <b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
                <span style="float: right;">
                  <div style="color: gray; font-size: 13px;">
                    <%
                      int price=(int)(dto.getPrice()-(dto.getPrice()*(sale/100.0))); //sale 백분율적용
                    %>
                    <strike><%=nf.format(dto.getPrice()) %></strike> <!-- 원래가격 -->
                  </div>
                  <div style="color: black; font-size: 16px;">
                     <%=nf.format(price) %> <!-- 할인된가격 -->
                  </div>
                </span>
              </td>
              <% 
              if((i+1)%4==0)
              {%>
               </tr>
               <tr>
                 
              <%}
              i++;
              %>
           <%}
           %>
        </tr>
      </table>
      </p>
    </div>
    <div id="tabs-2" class="container tab-pane fade"><br>
      <p>아우터</p>
    </div>
    <div id="tabs-3" class="container tab-pane fade"><br> 
      <p>상의</p>
    </div>
    <div id="tabs-4" class="container tab-pane fade"><br>
      <p>하의</p>
    </div>
    <div id="tabs-5" class="container tab-pane fade"><br>
      <p>액세서리</p>
    </div>
    <div id="tabs-6" class="container tab-pane fade"><br>
      <p>세트</p>
    </div>
    
    
  </div>
</div>

</body>
</html>