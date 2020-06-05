<%@page import="com.baemin.notice.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NoticeDeletePro.jsp");

int no=Integer.parseInt(request.getParameter("no"));

NoticeDAO dao=NoticeDAO.getInstance();

int result = dao.deleteNotice(no);

System.out.println(result);
response.sendRedirect("NoticeList.jsp");
%>
