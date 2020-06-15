<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object no=session.getAttribute("no");
int shopNo=Integer.parseInt(no+""); 
OrderListDAO orderlistdao=OrderListDAO.getInstance();
int result = orderlistdao.getMaxNoOfShop_No(shopNo);
System.out.println("reload = >"+result);
%>
<%=result%> 
