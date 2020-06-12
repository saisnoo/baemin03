<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------CancelOrderPro.jsp");
int no = Integer.parseInt(request.getParameter("no"));
String whyCancel = request.getParameter("whyCancel");
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.orderCancel(no, whyCancel);
%>
<%=result  %>