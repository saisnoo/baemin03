<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NewOrderList.jsp");

OrderListDAO dao= OrderListDAO.getInstance();
List<OrderListDTO> list = dao.getListOfCurrent("shopno");

%>

<%  
// 처리되지 않은 주문 목록 표시하는 페이지
// Main.jsp에서   load() 하여 사용


  %>