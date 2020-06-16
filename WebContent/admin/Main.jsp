<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------ Main.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> Main.jsp  </title>
 
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - Google Icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


<style>
 * { margin: 0px;   padding: 0px;  } 
 
</style>
<script>
// 스크립트
  
</script>
</head>
<body>
<!-- 내용 -->
<h2> Main.jsp </h2><br>
<%
 
%>
 <div class="w3-row sw-container-900" style="margin-top: 10%; height: 20px;">
			<a href="NoticeList.jsp" class="w3-button w3-col s4 w3-center" style="padding: 0px;">
				<i class="material-icons" style="font-size:200px;color:#45c1bf;">notifications</i><br>
				<h3>공지사항</h3>
			</a>
			<a href="ShopList.jsp" class="w3-button w3-col s4 w3-center" style="padding: 0px;">
				<i class="material-icons" style="font-size:200px;color:#45c1bf;">restaurant_menu</i><br>
				<h3>매장관리</h3>
			</a>
			<a href="MemberList.jsp" class="w3-button w3-col s4 w3-center" style="padding: 0px;">
				<i class="material-icons" style="font-size:200px;color:#45c1bf;">account_circle</i><br>
				<h3>회원관리</h3>
			</a>
		</div>
  
 <!-- 모든페이지 공통 -->
<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
 <jsp:include page="../sw_css/admintopnav.jsp" />
</body>
</html>