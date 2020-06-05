<%@page import="com.baemin.shop.ShopDAO"%>
<%@page import="com.baemin.shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ShopListContent.jsp");
%>

<%
	String category = (String) request.getParameter("category");
	ShopDAO dao = ShopDAO.getInstance();
%>