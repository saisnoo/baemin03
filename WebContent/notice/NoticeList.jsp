<%@page import="com.baemin.notice.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
 
<%
request.setCharacterEncoding("utf-8");
System.out.println("------ Notice.jsp --- ");

NoticeDAO dao=NoticeDAO.getInstance();
List<NoticeDTO> list = dao.getList();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> Notice.jsp  </title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - jquery 3.4.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

 
<style>
 * { margin: 0px;   padding: 0px;  } 
 
  .contentLine:HOVER {
  background-color: #eeeeee;
  cursor: pointer;
 }

 
</style>
<script>
// 스크립트
  $(function(){
	  $(".contentLine").click(function(){
		 var no=$(this).find(".noticeNo").text().trim();
		 //console.log(no);
		 location.href="NoticeView.jsp?no="+no;		  
	  });  
  });

  
</script>
</head>
<body>
<!-- 내용 -->
<h2> Notice.jsp </h2><br>
<%

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
<div class="sw-container-1000">
<div class="w3-container">
<!--  main content start here!!!----------------------------------------------------------- -->

<table class="w3-table w3-bordered">

  <tr>
    <th width="15%">공지번호</th>
    <th width="55%">공지글제목</th>
    <th width="15%">공지시작일</th>
    <th width="15%">공지종료일</th>
  </tr>
  
    <%
    for(int i=0; i<list.size(); i++){
    	%>
      <tr class="contentLine" onclick="click(this)">
    	<td class="noticeNo"><%=list.get(i).getNo() %></td>
    	<td><%=list.get(i).getTitle() %></td>
    	<td><%=list.get(i).getStartDate() %></td>
    	<td><%=list.get(i).getEndDate() %></td>   	
      </tr>
    	<%    	
    }       
    %>  
  
  <tr>
    <td colspan="5">
      <button class="w3-button w3-blue" onclick="location='NoticeInputForm.jsp'">글쓰기</button>                       
    </td>
  </tr>

</table>


<!-- main content end----------------------------------------------------------------------- -->
</div>
</div>
</div>
<!-- main content end----------------------------------------------------------------------- -->

<!-- 모든페이지 공통 -->
<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
<jsp:include page="../sw_css/topnav.jsp" />  
 
</body>
</html>