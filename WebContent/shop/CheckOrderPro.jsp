<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------CheckOrderPro.jsp");
int no = Integer.parseInt(request.getParameter("shopNo"));
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.updateStatusTo1(no);
%>
<%=result%>