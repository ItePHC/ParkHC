<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//front에서 보낸 데이터 읽어오기

//총점 ==> String을 int로 변환
//평균

//front형태로 만들어서 다시 front로 보내기(JSon)
//ob.put("", ../Food/...)

	String photono = request.getParameter("photono");
	String photoname = request.getParameter("photoname");
	String like1 = request.getParameter("like1"); 
	String like2 = request.getParameter("like2");
	String like3 = request.getParameter("like3");
	
	int tot = Integer.parseInt(like1) + Integer.parseInt(like2) +Integer.parseInt(like3);
	double avg = tot/3.0; 
			
	JSONObject ob = new JSONObject();
	ob.put("tot", tot);
	ob.put("avg", avg);
	ob.put("photo" ,"../Image/Food/"+photono+".jpg");
	ob.put("food", photoname);		//photoname을 food로 반환
	ob.put("like1", like1);
	ob.put("like2", like2);
	ob.put("like3", like3);
%>
<%=ob.toString() %>