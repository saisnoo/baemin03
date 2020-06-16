<%@page import="com.baemin.shop.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("utf-8");

int shopNo = Integer.parseInt(request.getParameter("shopNo"));

ShopDAO dao=ShopDAO.getInstance();
ShopDTO dto=dao.getShopInfo(shopNo);
request.setAttribute("dto", dto);
System.out.println(dto.toString());
%>
<div class="w3-card-4 w3-border" style="margin-bottom: 2%">
  <p>      
    <label class="w3-text" style="padding: 1%"><b>매장번호</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="${dto.no }" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>매장이름</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="${dto.shopName }" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>매장분류</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="${dto.shopCategory }" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>매장주소</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="${dto.shopAddr }&nbsp;${dto.shopAddr2 }" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>매장전화번호</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="${dto.shopTel }" readonly>
  </p>
  
  <p>      
    <label class="w3-text" style="padding: 1%"><b>매장상태</b></label>
    <input class="w3-input w3-border-top w3-border-bottom" name="shopNo" id="shopNo" type="text" value="${dto.shopStatus }" readonly>
  </p>
  


</div>
