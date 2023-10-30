<%@page import="db.memo.memoDto"%>
<%@page import="db.memo.memoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memoDao dao = new memoDao();
	
	//인코딩
	request.setCharacterEncoding("utf-8");
	
	//데이터 읽기(writer, story, avata)
	String writer = request.getParameter("writer");
	String story = request.getParameter("story");
	String avata = request.getParameter("avata");
	
	//dto로 묶기
	memoDto dto = new memoDto();
	dto.setWriter(writer);
	dto.setStory(story);
	dto.setAvata(avata);
	
	//insert
	dao.insertMemo(dto);
	%>