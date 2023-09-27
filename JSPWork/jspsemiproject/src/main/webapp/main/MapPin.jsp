
<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@page import="data.dao.TestAddrDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.TestAddrDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&family=Gaegu:wght@300&family=Noto+Serif+KR:wght@200&family=Single+Day&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75b7b99c0e29c84eac2f8969566e5830&libraries=services"></script>
<title>Insert title here</title>
<style type="text/css">
#map {
   margin-left: 20%;
   margin-top: 8%;
   width: 650px;
   height: 800px;
}

.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}
</style>
<script type="text/javascript">
   function setmap(){
      $(".map_wrap").toggle();
   }
  
   
   
</script>
</head>
<% 
request.setCharacterEncoding("UTF-8");

TestAddrDao dao=new TestAddrDao();
TestAddrDto dto=new TestAddrDto();

//String aaa=null;
ArrayList<TestAddrDto> list=dao.getIdyo();
//List<TestAddrDto> list2=dao.getname();
%>
<body>
   <button type="button" onclick="setmap()">지도오픈</button>
   <button type="button" onclick="setback()">지도초기화</button>
   <button type="button" onclick="setgido()">지도이동</button>
   <div class="map_wrap">
      <div id="map"></div>
      <div id="menu_wrap" class="bg_white">
         <div class="option">
            <input type="text" placeholder="검색 할 휴게소 입력" id="keyword"
               name="hugesoname" size="20">
            <button type="button" onclick="qwer()">검색하기</button>

         </div>
         <hr>

         <div class="alist">
            <table >
            </table>
         </div>

         <div id="pagination"></div>
      </div>
   </div>
   <script>
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(36.41960, 127.84205), // 지도의 중심좌표
         level : 13,      // 지도의 확대 레벨
      
         disableDoubleClickZoom: true  //지도더블클릭확대 막기
         
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      
    
       // 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
      //map.setDraggable(false);      

      // 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
      map.setZoomable(false);

      function setback() {
        
       
         var moveLatLon = new kakao.maps.LatLng(36.41960, 127.84205);
         map.setLevel(13);
         

         map.panTo(moveLatLon);
      }

      function setgido() {
         var moveLatLon = new kakao.maps.LatLng(36.41960, 127.84205);
         map.setLevel(4);

         map.panTo(moveLatLon);
      }

      // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
      function makeOverListener(map, marker, infowindow) {
         return function() {
            infowindow.open(map, marker);
         };
      }

      // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
      function makeOutListener(infowindow) {
         return function() {
            infowindow.close();
         };
      }
      function qwer(){
        alert("dddd");
         $.ajax({
            type:"post",
            url:"seachproc.jsp",
            dataType:"json",
            data:{"myname":$("#keyword").val()},
             success:function(res){
               
                var s = "";
               $.each(res,function(idx,item){
                 
                      s+="<table style='width:200px;' >";
                      s+="<tr style=' border: 2px solid black;'><td style='font-size: 1.2em;'>"+item.b_name+"<br>"+item.addr+"<br>s_HP:"+item.s_hp;
                      s+="</td>";
                      s+="</tr>";
                      s+="</table>";
                      
                      //주소로 마커찍기
                      geocoder.addressSearch("'"+item.addr+"'", function(result, status) {
                         
                          // 정상적으로 검색이 완료됐으면 
                           if (status === kakao.maps.services.Status.OK) {

                              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                              // 결과값으로 받은 위치를 마커로 표시합니다
                              marker = new kakao.maps.Marker({
                                  map: map,
                                  position: coords
                              });

                              var myimage=item.image;
                              var mycontent ='<div style="width:150px;text-align:center;padding:6px 0;">';
                                 mycontent += '<b>'+item.b_name+'</b>';
                                 mycontent += '<br>';
                                 mycontent += '<img src="'+myimage+'" style="width:100%; height:70px">';
                                 mycontent += '<b>'+item.b_hp+'</b>';
                                 mycontent += '<br>';
                                 mycontent += '<b>'+item.s_hp+'</b>';
                                 mycontent += '</div>';
                              // 인포윈도우로 장소에 대한 설명을 표시합니다
                              var infowindow = new kakao.maps.InfoWindow({
                                  content: mycontent
                              });
                              //infowindow.open(map, marker);

                              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                             // map.setCenter(coords);
                              
                              kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                              //kakao.maps.event.addListener($("#"), 'mouseover', makeOverListener(map, marker, infowindow));
                              kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                              kakao.maps.event.addListener(marker, 'click', function () {
                                 //map.setLevel(4, {anchor: this.getPosition()});
                                   document.getElementById('maplevel');//맵 레벨 읽어오기
                                 //alert(map.getLevel());
                                 var ml=map.getLevel();//선언 안하면 데이터 타입 알수없어 if문 작동안함
                                 if(ml=='4'){
                                     var myid = item.b_id;
                                           //alert("if문 성공");
                                           //location.href='index.jsp?main =board/supage.jsp';
                                           location.href = '../board/supage.jsp?id='
                                                 + myid;
                   
                                        }
                                 map.setLevel(4);

                                 map.panTo(this.getPosition());
                      
                            });
                              var moveLatLon = new kakao.maps.LatLng(36.41960, 127.84205);
                              map.setLevel(13);

                              map.panTo(moveLatLon);
                      
                           }
                      });
               });
                   $("div.alist").html(s);

             
         }
       });
      }

      
      

   </script>
</body>
</html>