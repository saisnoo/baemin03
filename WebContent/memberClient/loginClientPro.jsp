<%@page import="com.baemin.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------loginClientPro.jsp");
%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println("id=" + id);
	System.out.println("pw=" + pw);

	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.login(id, pw);

	System.out.println(dto.toString());

	int no = dto.getNo();

	System.out.println("no=" + no);

	if (no > 0) {
		System.out.println(" !!! member id=" + id);
		session.setAttribute("memberNo", no);
		session.setAttribute("id", dto.getId());
		session.setAttribute("grade", dto.getGrade());
		session.setAttribute("memberX", dto.getMemberX());
		session.setAttribute("memberY", dto.getMemberY());
		response.sendRedirect("../baemin/Main.jsp");
	} else {
		System.out.println(" !!! member null");
%>
<script>
	alert("로그인에 실패하였습니다");
	location.href = "../index.html";
</script>
<%
	}
%>