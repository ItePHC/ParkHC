<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="Oracle_DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	DBConnect db = new DBConnect();
	Connection conn = db.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String sql = "select * from myfriend order by num";
	try{
	stmt = conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	JSONArray arr = new JSONArray();
	
		while(rs.next()){
			String num = rs.getString("num");
			String fname = rs.getString("fname");
			String fhp = rs.getString("fhp");
			String faddr = rs.getString("faddr");
		//	String gaipday = rs.getString("gaipday");	
			String gaipday = sdf.format(rs.getTimestamp("gaipday"));	//
//에러원인??			String gaipday = sdf.format(rs.getString("gaipday"));	
			JSONObject ob = new JSONObject();
			
			ob.put("num",num);
			ob.put("fname",fname);
			ob.put("fhp",fhp);
			ob.put("faddr",faddr);
			ob.put("gaipday",gaipday);
			
			arr.add(ob);
		}	%>
		<%=arr.toString() %>
	<%}
	catch(SQLException e){
		
	}
%>
