<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------CheckOrderPro.jsp");
int no = Integer.parseInt(request.getParameter("no"));
int minute = Integer.parseInt(request.getParameter("minute"));
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.updateStatusTo1(no, minute);
%>
${result}