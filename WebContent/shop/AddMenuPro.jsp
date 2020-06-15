<%@page import="com.baemin.menu.MenuDAO"%>
<%@page import="com.baemin.menu.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object no=session.getAttribute("no");

int shopNo=Integer.parseInt(no+""); 
String menuName=request.getParameter("menuName");
String menuCategory= request.getParameter("menuCategory");
String menuEx= request.getParameter("menuEx");
int menuPrice= Integer.parseInt(request.getParameter("menuPrice"));

MenuDTO menudto= new MenuDTO();
menudto.setShop_no(shopNo);
menudto.setMenuName(menuName);
menudto.setMenuCategory(menuCategory);
menudto.setMenuEx(menuEx);
menudto.setMenuPrice(menuPrice);

MenuDAO menudao=MenuDAO.getInstance();
menudao.insertMenu(menudto);
%>