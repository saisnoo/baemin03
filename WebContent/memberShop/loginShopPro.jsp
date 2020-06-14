<%@page import="com.baemin.shop.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------loginShopPro.jsp");
%>

<%
	String shopID = request.getParameter("shopID");
	String shopPW = request.getParameter("shopPW");
	System.out.println("shopID=" + shopID);
	System.out.println("shopPW=" + shopPW);

	ShopDAO dao = ShopDAO.getInstance();
	ShopDTO dto = dao.login(shopID, shopPW);

	System.out.println(dto.toString());

	int no = dto.getNo();

	if (no > 0) {
		System.out.println(" !!! shop id=" + shopID);
		session.setAttribute("no", no);
		session.setAttribute("id", dto.getId());
		session.setAttribute("grade", 2);
		session.setAttribute("name", dto.getShopName());
		System.out.println(session.getAttribute("no"));
		response.sendRedirect("../shop2/Main.jsp");
	} else {
		System.out.println(" !!! shop null");
%>
<script>
	alert("로그인에 실패하였습니다");
	location.href = "../index.html";
</script>
<%
	}
%>