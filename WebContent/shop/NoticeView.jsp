<%@page import="com.baemin.notice.NoticeDTO"%>
<%@page import="com.baemin.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>NoticeUpdateForm.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-900">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->
  
<div class="w3-card-4 w3-light-gray">
<div class="main w3-padding">

 <p>      
    <label class="w3-text-blue"><b>글번호</b></label>
    <input class="w3-input w3-border" name="no" id="no" type="text" value="${dto.No()}" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>글제목</b></label>
    <input class="w3-input w3-border" name="title" name="title" type="text" value="${dto.Title()}" readonly>
  </p>
  
  <p>      
    <label class="w3-text-blue"><b>글내용</b></label>
    <textarea class="w3-input w3-border" rows="5" cols="50" name="content" id="content" style="resize:none;" readonly>${dto.Content()}</textarea>
  </p>
  
   <p>      
    <label class="w3-text-blue"><b>작성일</b></label>
    <input class="w3-input w3-border" name="startdate" name="startdate" type="text" value="${dto.StartDate()}" readonly>
  </p>
  
   <p>      
    <label class="w3-text-blue"><b>종료일</b></label>
    <input class="w3-input w3-border" name="enddate" name="enddate" type="text" value="${dto.EndDate()}" readonly>
  </p>  
  &nbsp;
    
  <p align="center">          
    <button class="w3-button w3-blue" onclick="noticeload2()">글목록</button>   
  </p>
  
</div>
</div>


				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
	

</body>
</html>