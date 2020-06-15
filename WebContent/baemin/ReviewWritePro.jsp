<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ReviewWritePro.jsp");
%>

<%
	String rank_ = request.getParameter("rank");

	String content = request.getParameter("content");
	int rank = Integer.parseInt(rank_);

	System.out.println("content=" + content);
	System.out.println("rank=" + rank);
%>