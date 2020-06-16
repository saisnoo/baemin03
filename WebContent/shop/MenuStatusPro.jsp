<%@page import="com.baemin.menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int no = Integer.parseInt(request.getParameter("menuno"));
int menuStatus = Integer.parseInt(request.getParameter("menustatus"));

System.out.println("menustatuspro:"+no);
System.out.println("menustatuspro:"+menuStatus);
MenuDAO dao=MenuDAO.getInstance();
int result=dao.updateStatus(no,menuStatus);
%>
${result}