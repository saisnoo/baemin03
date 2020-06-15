<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<%
MemberDAO dao = MemberDAO.getInstance();

String pw = request.getParameter("pw");
String pwc = request.getParameter("pwc");

int no = Integer.parseInt(request.getParameter("no"));

int c = dao.changePW(pw, no);

if(c == 1){
	%>
	<script>
	alert("변경 성공");
	location="../baemin/Main.jsp"
	</script>
	<%
}else{
	%>
	<script>
	alert("변경 실패");
	location="../baemin/Main.jsp"
	</script>
	<%	
}

%>