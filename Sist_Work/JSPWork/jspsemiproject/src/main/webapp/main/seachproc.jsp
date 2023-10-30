<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.TestAddrDto"%>
<%@page import="data.dao.TestAddrDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("myname");
TestAddrDao dao=new TestAddrDao();

List<TestAddrDto> list =dao.getname(name);
JSONArray arr=new JSONArray();
for(TestAddrDto dto:list){
   JSONObject ob = new JSONObject();
    
    ob.put("b_name", dto.getB_name());
    ob.put("b_id", dto.getB_id());
    ob.put("addr", dto.getAddr());
    ob.put("image", dto.getImage());
    ob.put("b_hp", dto.getB_hp());
    ob.put("s_hp", dto.getS_hp());
    arr.add(ob);

}

%>
<%=arr.toString()%>