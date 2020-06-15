<%@page import="com.baemin.review.ReviewDTO"%>
<%@page import="com.baemin.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ReviewWritePro.jsp");
%>

<%
	String member_No_ = session.getAttribute("no") + "";
	int member_no = Integer.parseInt(member_No_.trim());

	String rank_ = request.getParameter("rank");
	int rank = Integer.parseInt(rank_.trim());

	String shop_No_ = request.getParameter("shop_No");
	int shop_no = Integer.parseInt(shop_No_.trim());

	String content = request.getParameter("content");

	System.out.println("content=" + content);
	System.out.println("rank=" + rank);
	System.out.println("shop_No=" + shop_no);

	ReviewDTO dto = new ReviewDTO();

	dto.setContent(content);
	dto.setMember_no(member_no);
	dto.setRank(rank);
	dto.setShop_no(shop_no);

	ReviewDAO dao = ReviewDAO.getInstance();

	int c = dao.writeReview(dto);

	System.out.println("결과 :" + c);

	response.sendRedirect("ShopPage.jsp?shopNo=" + shop_no);
%>