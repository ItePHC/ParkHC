<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getSingleData(num);
%>
<script>
	$(function(){
		$("i.bi-camera").click(function(){
			$("#photo").trigger("click"); //이벤트 강제 클릭 효과
		});
	});
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
            $('#showimg').attr('src', e.target.result);
            }
            //File내용을 읽어 dataURL형식의 문자열로 저장 
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<body>
	<img src="save/<%=dto.getPhotoname()==null?"":dto.getPhotoname() %>" id="showimg" style="position: absolute;left: 800px;top: 100px;max-width: 200px">
	<form action="guest/updateProc.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="currentPage" value="<%=currentPage %>">
		<input type="hidden" name="num" value="<%=num %>">
		<table class="table table-bordered" style="width: 600px">
			<caption align="top">
				<b>방명록 등록 </b><i class="bi bi-camera" style="font-size: 30px"></i>
				<input type="file" name="photo" id="photo" style="visibility: hidden;" onchange="readURL(this)">
			</caption>
			<tr height="100">
				<td width="520">
					<textarea style="width: 500px;height: 100px" name="content" required="required"><%=dto.getContent() %></textarea>
				</td>
				<td>
					<button type="submit" class="btn btn-outline-info" style="width: 100px;height: 100px">등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>