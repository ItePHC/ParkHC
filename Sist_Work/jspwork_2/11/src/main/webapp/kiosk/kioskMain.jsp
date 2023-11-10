<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kiosk.KioskDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kiosk.KioskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	div.pone img,div.ptwo img,div.pthree img{
		width: 100px;
		height: 150px;
		margin-left: 10px;
		margin-top: 10px;
		cursor: pointer;
	}
	
	div{
		margin-left: 500px;
		background-color: white;
	}
	
	div.pone,div.ptwo,div.pthree{
	
		width: 460px;
		height: 300px;
	}
	
	div.ctgory{
		
		width: 460px;
	}
	
	div.pout{
		
		width: 460px;
	}
</style>
<script type="text/javascript">

$(function (){
	
	$("div.pone").hide();
	$("div.ptwo").hide();
	$("div.pthree").hide();
	$("div.pout").show();
	$("#myModal").hide();
	
});
</script>
</head>
	<%
		KioskDao dao=new KioskDao();
		ArrayList<KioskDto> list=dao.getAllMenus();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	%>
	<body style="background-color: black;">

	<div class="ctgory" align="center">
	<h3 align="center">ProjectKIOSK</h3>
	<button class="btn btn-warning" id="btn1">커피</button>&nbsp;
	<button class="btn btn-warning" id="btn2">스무디&프라페</button>&nbsp;
	<button class="btn btn-warning" id="btn3">에이드&주스</button>&nbsp;
	</div>

	<div class="pone">
	<table>
	<tr>
	<td align="center">
	<img src="../이미지/kiosk_img/c1.jpg"><br>
	<b>
	아메리카노<br><b style="color: red;">2,000원</b></b>

	</td>
	<td align="center">
	<img src="../이미지/kiosk_img/c2.jpg"><br>
	<b>
	카라멜마끼야또<br><b style="color: red;">3,500원</b></b>
	
	</td>
	<td align="center">
	<img src="../이미지/kiosk_img/c3.jpg"><br>
	<b>
	카페라떼<br><b style="color: red;">3,000원</b></b>
	
	</td>
	<td align="center"> 
	<img src="../이미지/kiosk_img/c4.jpg"><br>
	<b>
	에스프레소<br><b style="color: red;">4,000원</b></b>
	
	</td>
	</tr>
	</table>
	</div>	
	
	<div class="ptwo">
	<table>
	<tr>
	<td align="center">
	<img src="../이미지/kiosk_img/c5.jpg"><br>
	<b>
	오레오스무디<br><b style="color: red;">3,500원</b></b>
	
	</td>
	<td align="center">
	<img src="../이미지/kiosk_img/c6.jpg"><br>
	<b>
	딸기스무디<br><b style="color: red;">3,500원</b></b>
	
	</td>
	<td align="center">
	<img src="../이미지/kiosk_img/c7.jpg"><br>
	<b>
	민트초코프라페<br><b style="color: red;">4,000원</b></b>
	
	</td>
	<td align="center"> 
	<img src="../이미지/kiosk_img/c8.jpg"><br>
	<b>
	프라푸치노<br><b style="color: red;">4,000원</b></b>
		
	</td>
	</tr>
	</table>
	</div>	
	
	<div class="pthree">
	<table>
	<tr>
	<td align="center">
	<img src="../이미지/kiosk_img/c9.jpg"><br>
	<b>
	블루레몬에이드<br><b style="color: red;">2,000원</b></b>
	
	</td>
	<td align="center">
	<img src="../이미지/kiosk_img/c10.jpg"><br>
	<b>
	모히또<br><b style="color: red;">3,500원</b></b>
	
	</td>
	<td align="center">
	<img src="../이미지/kiosk_img/c11.jpg"><br>
	<b>
	오렌지주스<br><b style="color: red;">3,000원</b></b>

	</td>
	<td align="center"> 
	<img src="../이미지/kiosk_img/c12.jpg"><br>
	<b>
	포도주스<br><b style="color: red;">4,000원</b></b>
	
	</td>
	</tr>
	</table>
	</div>	
	
	
	<%
		String num=request.getParameter("num");
		
	%>
	
	
	<div class="container mt-3" align="center" style="width: 460px; margin-left: 500px">
  <h3>-주문내역-</h3>
  <p>등록된 상품이 없습니다</p>
  
  <button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
    주문하기
  </button>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <form action="/action_page.php">
    <div class="mb-3 mt-3">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
	
</body>
</html>
	
		
<script>
	$("#btn1").click(function () {
		
		$("div.pone").show();
		$("div.ptwo").hide();
		$("div.pthree").hide();
		
	});
	
	$("#btn2").click(function () {
		
		$("div.ptwo").show();
		$("div.pone").hide();
		$("div.pthree").hide();
		
	});
	
	$("#btn3").click(function () {
		
		$("div.pthree").show();
		$("div.pone").hide();
		$("div.ptwo").hide();
			
	});
	
	$("img").click(function () {
		
		$("#myModal").modal();
	})
</script>