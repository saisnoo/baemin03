<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int no = Integer.parseInt(request.getParameter("orderList_No"));
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.updateStatusTo2(no);

%>
