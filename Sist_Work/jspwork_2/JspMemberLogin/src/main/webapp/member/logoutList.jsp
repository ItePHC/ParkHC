<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.memberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function delBtn(num) {
	//alert(num);
	$("#btnmdel").attr("num",num);
	$("#myModal").modal();
}

</script>

</head>
<body>
<%
	String id = (String)session.getAttribute("idok");

	request.setCharacterEncoding("utf-8");
	
	memberDao dao = new memberDao();
	ArrayList<memberDto> list = dao.getAllMember();
	String name = dao.getName(id);
	
%>
<div style="margin: 50px; 100px">	
	<table class="table table-bordered" style="width: 1100px">
		<tr style="border: 0px;">
		<td colspan="5" style="border: 0px">
		<h4>총 <b style="color: green"><%=list.size() %></b>명의 멤버가 있습니다.</h4>
		<h5><b style="color: green"><%=name %></b>님이 로그인 하셨습니다</h5>
		</td>
		<td colspan="2" align="right" style="border: 0px">
		<br>
		<button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'" style="width: 160px;">멤버 추가</button>
		<button type="button" class="btn btn-outline-danger" onclick="location.href='logoutAction.jsp'" style="width: 160px;">로그아웃</button>	
		</td>
		</tr>
		<tr class="table-success">
			<th>번호</th>
			<th>아이디</th>
			<th>회원명</th>
			<th>전화번호</th>
			<th>사진</th>
			<th>가입일</th>
			<th>편집</th>
		</tr>
		<%
		if(list.size()>0){
			for(int i=0; i<list.size();i++){
			memberDto dto = list.get(i);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년-MM월-dd일");
		%>
				
		<tr>
			<td align="center" style="width: 80px"><%=i+1 %>번</td>
			<td align="center" style="width: 100px"><%=dto.getId() %></td>
			<td style="width: 120px"><%=dto.getName() %></td>
			<td style="width: 150px"><%=dto.getHp() %></td>
			<td style="width: 200px"><img src="<%=dto.getPhoto() %>" style="width: 200px; height: 200px; border-radius: 100px; border: 2px solid green"> </td>
			<td style="width: 200px"><%=sdf.format(dto.getGaip()) %></td>
			<td style="width: 120px">
			<%
			/* 로그인한 본인꺼만 수정/삭제가 보이도록 하기 */
			String loginok = (String)session.getAttribute("loginok");
			String idx = (String)session.getAttribute("idok");
			
			//로그인 한 본인꺼만 나오도록
			if(loginok!=null && dto.getId().equals(idx)){
			%>
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='updateCheck.jsp?num=<%=list.get(i).getNum()%>'">회원정보 수정</button><br>
				<%-- <button type="button" class="btn btn-danger btn-sm" onclick="location.href='deleteForm.jsp?num=<%=list.get(i).getNum()%>'">회원정보 삭제</button> --%>
				<button type="button" class="btn btn-danger btn-sm" id="del" onclick="delBtn(<%=dto.getNum()%>)">회원정보 삭제</button>	
			<%}else{%>
				<button type="button" class="btn btn-success btn-sm" onclick="alert('본인의 회원정보만 수정 가능합니다')">회원정보 수정</button><br>
				<button type="button" class="btn btn-danger btn-sm" onclick="alert('본인의 회원정보만 삭제 가능합니다')">회원정보 삭제</button>	
			<%}
			%>
			
			<%-- <button type="button" class="btn btn-danger btn-sm" onclick="del()">회원정보 삭제</button> --%>
			</td>
		</tr>
			<%}
		}
		%>
	</table>
</div>

	 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
            <p>회원정보 삭제를 원하시면<br>[삭제확인]을 눌러주세요.</p>
			<button type="button" class="btn btn-danger btn-sm" id="btnmdel" num="">삭제확인</button>
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<script type="text/javascript">
$("#btnmdel").click(function(){
	var num = $(this).attr("num");
	location.href="deleteAction.jsp?num="+num;
})
</script>
</body>
</html>