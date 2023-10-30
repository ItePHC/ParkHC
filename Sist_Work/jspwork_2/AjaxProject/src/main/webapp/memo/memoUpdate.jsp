<%@page import="db.memo.memoDto"%>
<%@page import="db.memo.memoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memoDao dao = new memoDao();
	
	//인코딩
	request.setCharacterEncoding("utf-8");
	
	//데이터 읽기(writer, story, avata)
	String writer = request.getParameter("uwriter");
	String story = request.getParameter("ustory");
	String avata = request.getParameter("uavata");
	String num = request.getParameter("unum");
	
	
	//dto로 묶기
	memoDto dto = new memoDto();
	dto.setWriter(writer);
	dto.setStory(story);
	dto.setAvata(avata);
	dto.setNum(num);
	
	//update
	dao.updateMemo(dto);
	%>