<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------Logout.jsp");
%>

<%
	session.invalidate();
	response.sendRedirect("../index.html");
%>