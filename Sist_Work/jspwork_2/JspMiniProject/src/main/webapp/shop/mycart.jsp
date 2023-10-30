<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
<style type="text/css">
	div.sangpum{
	cursor: pointer;
	}
	div.saangpum img{
	width: 50px;
	height: 70px;
	border: 1px solid gray;
	}
	i.del{
	cursor: pointer;
	}
</style>
</head>
<%
	String id = (String)session.getAttribute("myId");
	ShopDao dao = new ShopDao();
	List<HashMap<String,String>> list = dao.getcartList(id);
	
	MemberDao mdao = new MemberDao();
	String name = mdao.getNameFromId(id);
%>
<body>
	<h4 class="alert alert-warning"><%=name %>님의 장바구니 목록</h4>
	<table class="table table-striped" style="width: 1000px;">
		<tr>
			<th style="width: 30px"><input type="checkbox" id="allcheck"></th>
			<th style="width: 200px">상품정보</th>
			<th style="width: 200px">상품금액</th>
		</tr>
		<%
			int allmoney=0;
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			
			for(int i=0;i<list.size();i++){
				HashMap<String,String> map = list.get(i);
				
				//사진 얻어오기
				String photo = map.get("photo");
				
				int cnt = Integer.parseInt(map.get("cnt"));
				%>
				<tr>
					<td>
						<input type="checkbox" idx="<%=map.get("idx")%>">
					</td>
					<td>
						<div class="sangpum" shopnum="<%=map.get("shopnum") %>">
							<img alt="" src="shopsave/<%=photo%>">
							<h6>상품명 : <%=map.get("sangpum") %></h6>
							<h6>갯수 : <%=cnt%>개</h6>
							<h6>날짜 : <%=map.get("cartday") %></h6>
							
							
						</div>
					</td>
					<td>
						<%
							int price = Integer.parseInt(map.get("price"));
							price*=cnt;
							allmoney+=price;
						%>
						<h4><%=nf.format(price) %>
						<i class="bi bi-trash3-fil" idx="<%=map.get("idx")%>"></i>
						</h4>
					</td>
		 		</tr>
			<%}
		%>
		
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-danger" id="btncartdel">선택상품삭제</button>
				<span style="font-size: 2em; float: right;">
				총 주문금액 : <b style="color: green;">
				<%=nf.format(allmoney) %>원
				</b>
				</span>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	//전체선택 시 체크박스 선택 해제
	$("#allcheck").click(function() {
		var chk = $(this).is(":checked");
		console.log(chk);			// true/flase 체크
		
		//전체 체크값을 글 앞의 체크에 일괄 전달
		$(".idx").prop("checked",chk)
	});
	
	//상품 클릭시 detail로
	$("div.sangpum").click(function() {
		var shopnum=$(this).attr("shopnum");
		location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
	});
	
	$("#btncartdel").click(function() {
		//체크한 갯수
		var cnt=$(".idx:checked").length;
		alert(cnt);	//확인 후 진행
		
		if(cnt==0){
			alert("삭제할 상품을 선택해 주세요")
			return;
		}else{
			
		}
	});
	</script>
</body>
</html>