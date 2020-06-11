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
System.out.println(dto.toString());
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
    <label class="w3-text-blue"><b>매장번호</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getNo() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>매장이름</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getShopName() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>매장분류</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getShopCategory() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>매장주소</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getShopAddr() %>&nbsp;<%=dto.getShopAddr2() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>매장전화번호</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getShopTel() %>" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>매장상태</b></label>
    <input class="w3-input w3-border" name="shopNo" id="shopNo" type="text" value="<%=dto.getShopStatus() %>" readonly>
  </p>


</div>
</div>


</body>
</html>