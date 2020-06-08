<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------joinShopPro.jsp");
%>

<%
	String shopID = request.getParameter("shopID").trim();
	String shopPW = request.getParameter("shopPW").trim();
	String shopName = request.getParameter("shopName").trim();
	String shopEx = request.getParameter("shopEx");

	String tel1 = request.getParameter("tel1").trim();
	String tel2 = request.getParameter("tel2").trim();
	String tel3 = request.getParameter("tel3").trim();

	String shopTel = tel1 + "-" + tel2 + "-" + tel3;

	String shopAddr = request.getParameter("shopAddr").trim();
	String shopAddr2 = request.getParameter("shopAddr2").trim();

	String shopX_ = request.getParameter("shopX").trim();
	String shopY_ = request.getParameter("shopY").trim();

	double shopX = Double.parseDouble(shopX_);
	double shopY = Double.parseDouble(shopY_);

	String shopCategory = request.getParameter("shopCategory");

	System.out.println(shopCategory);
%>