<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object no=session.getAttribute("no");
int shop_No=Integer.parseInt(no+""); 
OrderListDAO orderlistdao=OrderListDAO.getInstance();
int result = orderlistdao.getMaxNoOfShop_No(shop_No);
System.out.println("reload = >"+result);
%>
<%=result%> 
