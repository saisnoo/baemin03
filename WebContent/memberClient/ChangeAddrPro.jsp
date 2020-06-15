<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ChangeAddrPro.jsp");
%>

<%
	int no = Integer.parseInt((session.getAttribute("no") + "").trim());
	String addr = request.getParameter("addr");
	String addr2 = request.getParameter("addr2");
	Double memberX = Double.parseDouble(request.getParameter("memberX")
			.trim());
	Double memberY = Double.parseDouble(request.getParameter("memberY")
			.trim());

	MemberDAO dao = MemberDAO.getInstance();

	MemberDTO dto = new MemberDTO();

	dto.setAddr(addr);
	dto.setAddr2(addr2);
	dto.setMemberX(memberX);
	dto.setMemberY(memberY);
	dto.setNo(no);

	System.out.println();
	System.out.println();
	System.out.println(dto.toString());
	System.out.println();
	System.out.println();

	int result = dao.changeAddr(dto);

	if (result == 1) {
		session.setAttribute("memberX", memberX);
		session.setAttribute("memberY", memberY);
	}

	System.out.println("result" + result);

	response.sendRedirect("../baemin/Main.jsp");
%>