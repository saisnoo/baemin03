<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------CancelOrderPro.jsp");
int no = Integer.parseInt(request.getParameter("no"));
String whyCancel = request.getParameter("whyCancel");
System.out.println("no: "+no+" why : "+whyCancel);
OrderListDAO dao = OrderListDAO.getInstance();
int result = dao.orderCancel(no, whyCancel);
System.out.println(" result :"+result);
%>
${result}