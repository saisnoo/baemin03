<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("------CancelOrderPro.jsp");
int no = Integer.parseInt(request.getParameter("shop_no"));
int status = Integer.parseInt(request.getParameter("shopstatus"));
int result=0;
ShopDAO shopdao=ShopDAO.getInstance();
if(status==0){
result = shopdao.shopOpen(no);
}
if(status==1){
result = shopdao.magam(no);
}
%>
<%=result%>