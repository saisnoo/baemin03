<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<%
ShopDAO dao = ShopDAO.getInstance();
ShopDTO dto = new ShopDTO();

int no = Integer.parseInt(session.getAttribute("no")+"");
String shopTel = request.getParameter("shopTel");
String pw = request.getParameter("password");

System.out.println("no :" + no);
System.out.println("shopTel :" + shopTel);
System.out.println("pw :" + pw);

dto.setNo(no);
dto.setShopTel(shopTel);
dto.setPw(pw);

int c = dao.changeShopInfo(dto);

if(c == 1){
	%>
	<script>
	alert("변경 성공");
	location="../shop/Main.jsp"
	</script>
	<%
}else{
	%>
	<script>
	alert("변경 실패");
	location="../shop/Main.jsp"
	</script>
	<%	
}

%>