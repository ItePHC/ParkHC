
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Admin.adminDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Admin.adminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo:wght@400;700&family=Noto+Sans+KR:wght@100;300;400&family=Noto+Serif+KR:wght@200;300&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
   .pone img,.ptwo img,.pthree img{
      width: 100px;
      height: 150px;  
      margin-left: 10px;
      margin-top: 10px;
      cursor: pointer;
   }
   
   .product{
      width: 460px;
      margin-left: 520px;
   }
   
   #btn1, #btn2, #btn3
   {
   	border-radius: 10px;
   	background-color: #e9967a;
    font-weight: bold;
    
   }
</style>
<script type="text/javascript">

$(function (){
   
   $(".pone").hide();
   $(".ptwo").hide();
   $(".pthree").hide();
   $(".pout").show();
   $("#myModal").hide();
   
   
});
</script>

</head>
   <%
      adminDao dao=new adminDao();
   	 
      ArrayList<adminDto> list=dao.getAllMenus();
      
   %>
   <body style="background-color:#d2b48c;">
	
   <div style="background-color: white; width: 460px; border-radius: 24px; margin-top: 70px" 
   align="center" class="product">
   
   <h3 style="font-family: Notoserif">SISTCAFE</h3>
   
   &nbsp;&nbsp;
   <button class="btn btn-warning" id="btn1" style="width:80px">커피</button>&nbsp;&nbsp;
   <button class="btn btn-warning" id="btn2" style="width:120px">스무디&프라페</button>&nbsp;&nbsp;
   <button class="btn btn-warning" id="btn3" style="width:120px">에이드&주스</button>&nbsp;&nbsp;
	
   <table class="pone">
   	<%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		if(dto.getType().equals("pone")){
		%>
	<tr class="col-md-4">	
	<td align="center">
	   <img src="../<%=dto.getImage()%>" style="width:110px; height:120px"><br>
	   <b><%=dto.getName () %></b><br>
	   <b style="color: red;"><%=dto.getPrice()%>원</b>
	</td>
   	<script type="text/javascript">
	$("img").click(function() {
		window.open("kioskList.jsp?num=<%=dto.getNum()%>","e","left=400px, top=100px, width=800px, height=500px");
	})
	</script>
   	</tr>
   	<%}
 	}
   	%>
   </table>
   
   
   
   
   <table class="ptwo">
   <%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		if(dto.getType().equals("ptwo")){
		%>
	<tr class="col-md-4">
		<td align="center">
		   <img src="../<%=dto.getImage()%>" style="width:110px; height:120px" title="<%=dto.getNum()%>"><br>
		   <b><%=dto.getName () %></b><br>
		   <b style="color: red;"><%=dto.getPrice()%>원</b>
		   
   		</td>
   		
   	<script type="text/javascript">
	$("img").click(function() {
		window.open("kioskList.jsp?num=<%=dto.getNum()%>","e","left=400px, top=100px, width=800px, height=500px");
	})
	</script>	
	</tr>	
   	<%}
 	}
   	%>
   </table>   
   
   
   
   
   
   
    <table class="pthree">
   <%
	for(int i=0;i<list.size();i++){
		adminDto dto = list.get(i);
		if(dto.getType().equals("pthree")){
		%>
	<tr class="col-md-4">
		<td align="center">
		   <img src="../<%=dto.getImage()%>" style="width:110px; height:120px" title="<%=dto.getNum()%>"><br>
		   <b><%=dto.getName () %></b><br>
		   <b style="color: red;"><%=dto.getPrice()%>원</b>
   		</td>
   	<script type="text/javascript">
	$("img").click(function() {
		window.open("kioskList.jsp?num=<%=dto.getNum()%>","e","left=400px, top=100px, width=800px, height=500px");
	})
	</script>	
	</tr>	
   	<%}
 	}
   	%>
   </table>   
   
   </div>   
   
   

  
	
</body>
</html>
   
<script>

   $("#btn1").click(function () {
      
      $(".pone").show();
      $(".ptwo").hide();
      $(".pthree").hide();
      
   });
   
   $("#btn2").click(function () {
      
      $(".ptwo").show();
      $(".pone").hide();
      $(".pthree").hide();
      
   });
   
   $("#btn3").click(function () {
      
      $(".pthree").show();
      $(".pone").hide();
      $(".ptwo").hide();
         
   });
</script>



