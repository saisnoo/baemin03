<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int no = Integer.parseInt(request.getParameter("shopNo"));
int minute = Integer.parseInt(request.getParameter("minute"));
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.updateCompleteTime(no, minute);

%>
