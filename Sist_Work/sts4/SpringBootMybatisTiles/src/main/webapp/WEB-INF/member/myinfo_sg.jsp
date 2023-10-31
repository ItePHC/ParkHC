<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
   
   $(".btnnewphoto").click(function(){
      
      $("#newphoto").trigger("click");
   });
   
   $("#newphoto").change(function(){
      
      var num=$(this).attr("num");
      /* console.log(num); */
      
      var form = new FormData();
      form.append("photo",$(this)[0].files[0]);
      form.append("num",num); //넘어온 num값을 num으로 넘긴다
      
      console.dir(form);
      
      $.ajax({
         
         type:"post",
         dataType:"html",
         url:"updatephoto",
         processData:false,
         contentType:false,
         data:form,
         success:function(){
            location.reload();
         }
      });
   });
   
   
   //탈퇴
   $(".btndelete").click(function(){
      
      var num = $(this).attr("num");
      //alert(num);
      
      var ans=confirm("정말 탈퇴하시겠습니까?");
      
      if(ans){
         
         $.ajax({
            
            type:"get",
            dataType:"html",
            url:"deleteme",
            data:{"num":num},
            success:function(){
               
               alert("삭제되었습니다");
               location.href="/"; 
            }
         })
      }
   });
   
   $("#btnupdate2").click(function(){
      
   	var num = $("#num").val();
	var name = $("#name").val();
	var email = $("#email").val();
	var addr = $("#addr").val();
		
//		alert(mnum);
//		alert(name+"//"+email+"//"+addr+"//"+num);
      
//      var up=confirm("수정하시겠습니까?");
//     
//      if(up){
         
         $.ajax({
            
            type:"get",
            dataType:"json",
            url:"/member/myinfo", //모달창은 중간경로를 써줘야함
            data:{"name":name,"email":email,"hp":hp,"addr":addr,"num":num},
            success:function(res){
               
               location.reload();
            }
         })
//      }
      
   });
});
</script>
</head>
<body>
	<div style="margin: 200px;">
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list }">
				<!--리스트형식으로 받아옴  -->
				<c:if
					test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
					<tr>
						<!--또는 &&  -->
						<td style="width: 250px;" align="center" rowspan="5"><img
							src="../membersave/${dto.photo }" width="230" height="250"
							border="1"> <br> <input type="file"
							style="display: none;" id="newphoto">
							<button type="button" class="btn btn-info btnnewphoto">사진수정</button></td>
						<td style="width: 300px">회원명: ${dto.name }</td>
						<td rowspan="5" align="ceneter" valign="botton"
							style="width: 200px; vertical-align: middle;">
							<button type="button" class="btn btn-outline-secondary"
								id="btnupdate" data-bs-toggle="modal"
								data-bs-target="#ModalUpdate" num=${dto.num }>수정</button> <br>
							<br>
							<button type="button" class="btn btn-outline-secondary btndelete"
								num=${dto.num }>삭제</button>
						</td>
					</tr>
					<tr>
						<td>아이디:${dto.id }</td>
					</tr>
					<tr>
						<td>이메일: ${dto.email }</td>
					</tr>
					<tr>
						<td>핸드폰: ${dto.hp }</td>
					</tr>
					<tr>
						<td>주소: ${dto.addr }</td>
					</tr>
				</c:if>

				<div class="modal" id="ModalUpdate">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">회원정보 수정</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<input type="hidden" name="num" id="num" value="${dto.num }"> <input
									type="text" class="form-control" id="name" placeholder="회원명"
									value="${dto.name }"><br> <input type="text"
									class="form-control" id="email" placeholder="이메일"
									value="${dto.email }"><br> <input type="text"
									class="form-control" id="hp" placeholder="연락처"
									value="${dto.hp }"><br> <input type="text"
									class="form-control" id="addr" placeholder="주소"
									value="${dto.addr }"><br>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="btnupdate2"
									data-bs-dismiss="modal">수정</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</table>
	</div>


</body>
</html>