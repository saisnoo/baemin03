<%@page import="com.baemin.shop.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------loginShopPro.jsp");
%>

<%

	String shopID = request.getParameter("shopID");
	String shopPW = request.getParameter("shopPW");
	System.out.println("shopID=" + shopID);
	System.out.println("shopPW=" + shopPW);

	ShopDAO dao = ShopDAO.getInstance();
	ShopDTO dto = dao.login(shopID, shopPW);

	System.out.println(dto.toString());

	if (shopID == null) {
		System.out.println(" !!! shop shopID null");
	} else {
		System.out.println(" !!! shop shopID=" + shopID);
		session.setAttribute("shopID", dto.getShopNo());
	}
%>