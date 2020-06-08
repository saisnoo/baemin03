<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@page import="com.baemin.notice.NoticeDTO"%>
<%@page import="com.baemin.notice.NoticeDAO"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NoticeUpdatePro.jsp");
int no=Integer.parseInt(request.getParameter("no"));
%>

<jsp:useBean id="dto" class="com.baemin.notice.NoticeDTO">
  <jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
NoticeDAO dao = NoticeDAO.getInstance();
dao.updateNotice(dto);
response.sendRedirect("NoticeView.jsp?no="+no);
%>