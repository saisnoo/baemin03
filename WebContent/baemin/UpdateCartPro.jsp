<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.baemin.orderlist.cart.CartMgr"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------UpdateCartPro.jsp");

	int protocol = Integer.parseInt(request.getParameter("protocol")
			.trim());

	CartMgr cart = (CartMgr) session.getAttribute("cart");

	int count = 0;
	int menu_No = 0;

	switch (protocol) {

	case 1:
		count = Integer.parseInt(request.getParameter("count").trim());
		menu_No = Integer.parseInt(request.getParameter("menu_No")
				.trim());
		cart.updateCart(count, menu_No);
		session.setAttribute("cart", cart);
		break;

	case 2:
		menu_No = Integer.parseInt(request.getParameter("menu_No")
				.trim());
		cart.deleteCart(menu_No);
		session.setAttribute("cart", cart);
		break;
	}
%>