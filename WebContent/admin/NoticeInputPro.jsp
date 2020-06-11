<%@page import="com.baemin.notice.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("utf-8");
System.out.println("------NoticeInputPro.jsp");
%>
<jsp:useBean id="dto" class="com.baemin.notice.NoticeDTO">
  <jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%  
NoticeDAO dao=NoticeDAO.getInstance();
dao.writeNotice(dto);
response.sendRedirect("NoticeList.jsp");
%>