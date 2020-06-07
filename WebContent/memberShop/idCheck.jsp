<%@page import="com.baemin.shop.ShopDAO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------idCheck.jsp");
%>


<%
	String shopID = request.getParameter("shopID");

	System.out.println("shopID=" + shopID);

	ShopDAO dao = ShopDAO.getInstance();
	int result = dao.getNoByID(shopID);

	System.out.println("result=" + result);

	String output = "";

	if (result == 0) {
		output = "yesyesyesyes";
	}

	out.clear();
	out.print(output);
%>