<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@page import="com.baemin.orderlist.*"%>
<%@page import="com.baemin.util.Ht2List"%>
<%@page import="com.baemin.orderlist.cart.CartMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------OrderPro.jsp");
%>

<%
	// 주문한 데이터 받아서, orderlist 테이블에 넣는다.
	CartMgr cartmgr = (CartMgr) session.getAttribute("cart");

	List<Order_MenuDTO> list = Ht2List.ht2List(cartmgr.getCartList());

	String comment = request.getParameter("comment");

	System.out.println("list.size()");
	System.out.println(list.size());

	int memberNo = Integer.parseInt(session.getAttribute("no") + "");
	int shopNo = Integer.parseInt(session.getAttribute("cart_shop_no")
	+ "");

	MemberDAO memberdao = MemberDAO.getInstance();
	MemberDTO memberdto = memberdao.getDTO(memberNo);

	System.out.println();
	System.out.println();
	System.out.println();

	System.out.println("memberdto.toString()");
	System.out.println(memberdto.toString());
	System.out.println();
	System.out.println();
	System.out.println();

	OrderListDAO dao = OrderListDAO.getInstance();
	OrderListDTO dto = new OrderListDTO();

	dto.setMenuList(list);
	dto.setName(memberdto.getName());
	dto.setAddr(memberdto.getAddr());
	dto.setAddr2(memberdto.getAddr2());
	dto.setComment(comment);
	dto.setMember_No(memberdto.getNo());
	dto.setShop_NO(shopNo);

	System.out.println("dto.toString()");
	System.out.println(dto.toString());
	System.out.println();
	System.out.println();
	System.out.println();

	int result = dao.insertOrder(dto);
	System.out.println();
	System.out.println("result=" + result);
	System.out.println();

	cartmgr.emptyCart();
	
	request.setAttribute("result", result);
%>

<div id="result" style="display: none">${result }</div>


<script>
	window.onload = function() {
		var result = document.getElementById("result").innerText;

		if (result == 1) {
			alert("주문이 성공적으로 접수되었습니다.");
		} else if (result == -1) {
			alert("매장과 연결이 불안정하거나, 영업이 종료되었습니다.");
		}

		location.href = "Main.jsp";
	}
</script>

