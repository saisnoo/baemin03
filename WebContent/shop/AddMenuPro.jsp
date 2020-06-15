<%@page import="com.baemin.menu.MenuDAO"%>
<%@page import="com.baemin.menu.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object no=session.getAttribute("no");
<<<<<<< HEAD
int shop_no=Integer.parseInt(no+""); 
=======
int shopNo=Integer.parseInt(no+""); 
>>>>>>> master
String menuName=request.getParameter("menuName");
String menuCategory= request.getParameter("menuCategory");
String menuEx= request.getParameter("menuEx");
int menuPrice= Integer.parseInt(request.getParameter("menuPrice"));

MenuDTO menudto= new MenuDTO();
<<<<<<< HEAD
menudto.setShop_no(shop_no);
=======
menudto.setShop_no(shopNo);
>>>>>>> master
menudto.setMenuName(menuName);
menudto.setMenuCategory(menuCategory);
menudto.setMenuEx(menuEx);
menudto.setMenuPrice(menuPrice);

MenuDAO menudao=MenuDAO.getInstance();
menudao.insertMenu(menudto);
%>