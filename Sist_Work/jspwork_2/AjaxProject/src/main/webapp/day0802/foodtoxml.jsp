<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Oracle_DB.DBConnect"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
	<%
	DBConnect db = new DBConnect();
	Connection conn = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from myfood order by num";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			String num = rs.getString("num");
			String name = rs.getString("foodname");
			String photo = rs.getString("foodphoto");
			int price = rs.getInt("price");
			int cnt = rs.getInt("cnt");
			%>
			
			<myfood num = "<%=num %>">
			<foodname><%=name %></foodname>
			<foodphoto><%=photo %></foodphoto>
			<price><%=price %></price>
			<cnt><%=cnt %></cnt>
			</myfood>
			<%}
		
		
		}catch(SQLException e){
		
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
	%>
</data>
    