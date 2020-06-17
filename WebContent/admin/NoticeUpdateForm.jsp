<%@page import="com.baemin.notice.NoticeDTO"%>
<%@page import="com.baemin.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ include file="../util/ContextPath.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> NoticeUpdateForm.jsp  </title>
 <!-- CDN - Font Awesome 4 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <!-- CDN - jquery 3.4.1 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <!-- CDN OFFLINE- sw_topNav.css -->
 <link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
 <!-- CDN - W3CSS -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
<style>
 * { margin: 0px;   padding: 0px;  } 
</style>
<script>
// 스크립트
  
</script>
</head>
<body>
<!-- 내용 -->
<h2> NoticeUpdateForm.jsp </h2><br>
  
<!-- responsive template by SW ----------------------------------------------------------- -->
<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
<div class="sw-topnav-margin">
&nbsp;
</div>

<!-- CONTENT ------------------------------------------------------------------------------------ -->
<div class="sw-center">
<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
<div class="sw-container-500">
<div class="w3-container">
<!--  main content start here!!!----------------------------------------------------------- -->


<div class="w3-card-4">
  <div class="w3-container w3-baemint">
    <h2 align="center">공지사항수정</h2>    
  </div>
  
  <div class="w3-container w3-padding">
  
    <form class="w3-container" action="${ctxpath }/admin/NoticeUpdatePro.do?no=${dto.no }" name="noticeUpdateForm" method="post">
    <p>      
      <label class="w3-text"><b>공지글제목</b></label>
      <input class="w3-input w3-border" name="title" id="title" type="text" value="${dto.title }" required>
    </p>
    <br>
    <p>        
      <label class="w3-text"><b>공지글내용</b></label>
      <textarea class="w3-input w3-border" rows="5" id="content" name="content">${dto.content }</textarea>    
    </p>
    <br>
    <p>
      <label class="w3-text"><b>공지시작일</b></label>
      <input class="w3-input w3-border" name="startDate" id="startDate" type="date" value="${dto.startDate }" required>
    </p>
    <br>
     <p>
      <label class="w3-text"><b>공지시작일</b></label>
      <input class="w3-input w3-border" name="endDate" id="endDate" type="date" value="${dto.endDate }" required>
    </p>
      <div class="w3-center w3-section">
      <input type="submit" class="w3-button w3-baemint" value="확인">
      <input type="button" class="w3-button w3-baemint" value="취소" onclick="history.back()">
      </div>
    
  </form>
  </div>
  
</div>


<!-- main content end----------------------------------------------------------------------- -->
</div>
</div>
</div>
<!-- main content end----------------------------------------------------------------------- -->

<!-- 모든페이지 공통 -->
<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
<jsp:include page="../sw_css/admintopnav.jsp" />    
 
</body>
</html>