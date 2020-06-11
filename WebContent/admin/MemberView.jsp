<%@page import="com.baemin.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
int memberNo = Integer.parseInt(request.getParameter("memberNo"));

MemberDAO dao=MemberDAO.getInstance();
MemberDTO dto=dao.getDTO(memberNo);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShopView.jsp</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>

<body>

<div class="sw-container-600 w3-padding">  
<div class="w3-card-4 w3-light-gray">


  <p>      
    <label class="w3-text-blue"><b>회원ID</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getId() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>회원이름</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getName() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>전화번호</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getTel() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>주소</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getAddr() %>&nbsp;<%=dto.getAddr2() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>가입일</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getRegDate() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>회원등급</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getGrade() %>" readonly>
  </p>


</div>
</div>


</body>
</html>