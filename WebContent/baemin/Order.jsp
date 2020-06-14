<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------ Order.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> Order.jsp  </title>
 <!-- CDN - Font Awesome 4 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <!-- CDN - W3CSS -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <!-- CDN OFFLINE- sw_topNav.css -->
 <link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
 <!-- CDN - jquery 3.4.1 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<style>
 * { margin: 0px;   padding: 0px;  } 
 #topnav{
	position: fixed;
	top: 0;
	width: 100%;
	overflow: hidden;
}
</style>
<script>
// 스크립트
  
</script>
</head>
<body>
<!-- 내용 -->
<%
 // 최종 주문 전  확인 및 수량 조절, 항목 삭제 페이지
 // 생략할수도 있고,  탭으로 구분할수도 있고....
%>
 
<!-- responsive template by SW ----------------------------------------------------------- -->
<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
<div class="sw-topnav-margin">
&nbsp;
</div>

<!-- CONTENT ------------------------------------------------------------------------------------ -->
<div class="sw-center">
<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
<div class="sw-container-400">
<div class="w3-container">
<!--  main content start here!!!----------------------------------------------------------- -->



여기에 본 페이지를 작성하시오


<!-- main content end----------------------------------------------------------------------- -->
</div>
</div>
</div>
<!-- main content end----------------------------------------------------------------------- -->



<script>


</script>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />


 
</body>
</html>