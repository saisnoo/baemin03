<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<%
ShopDAO dao = ShopDAO.getInstance();

String pw = request.getParameter("pw");
String pwc = request.getParameter("pwc");

int no = Integer.parseInt(request.getParameter("no"));

int c = dao.changePw(pw, no);

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