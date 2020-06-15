<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("------CancelOrderPro.jsp");
int no = Integer.parseInt(request.getParameter("orderList_No"));
String whyCancel = request.getParameter("whyCancel");
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.orderCancel(no, whyCancel);

%>
<%=result%>