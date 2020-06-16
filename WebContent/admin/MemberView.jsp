<%@page import="com.baemin.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
int memberNo = Integer.parseInt(request.getParameter("memberNo"));

MemberDAO dao=MemberDAO.getInstance();
MemberDTO dto=dao.getDTO(memberNo);

%>
<div class="w3-card-4 w3-border" style="margin-bottom: 2%">
  <p>      
    <label class="w3-text" style="padding: 1%"><b>회원ID</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="<%=dto.getId() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>회원이름</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="<%=dto.getName() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>전화번호</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="<%=dto.getTel() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>주소</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="<%=dto.getAddr() %>&nbsp;<%=dto.getAddr2() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>가입일</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="<%=dto.getRegDate() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>회원등급</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="<%=dto.getGrade() %>" readonly>
  </p>
</div>
