<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<%
MemberDAO dao = MemberDAO.getInstance();
MemberDTO dto = new MemberDTO();

int no = Integer.parseInt(session.getAttribute("no")+"");
String tel = request.getParameter("tel");
String pw = request.getParameter("password");

System.out.println("no :" + no);
System.out.println("tel :" + tel);
System.out.println("pw :" + pw);

dto.setNo(no);
dto.setTel(tel);
dto.setPw(pw);

int c = dao.changeInfo(dto);

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