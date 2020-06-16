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
 
 #ys {
  height: 400px;
  overflow-y:auto;
}


.th-text {
        position: absolute;        
        width: inherit;
        top:135px;             
        
    }
    
  .btn {
    background-color: #45c1bf;
    color: white;
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
  
  function myFunction() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
	}
  

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
<div class="sw-container-800">
<div class="w3-container">
<!--  main content start here!!!----------------------------------------------------------- -->

<div id="ys">
<table class="w3-table w3-bordered" id="myTable">

  <tr>
    <th width="15%"><div class="th-text">#</div></th>
    <th width="50%"><div class="th-text">공지글제목</div></th>
    <th width="35%"><div class="th-text">공지일</div></th>    
  </tr>
  
    <%
    for(int i=0; i<list.size(); i++){
    	%>
      <tr class="contentLine" onclick="click(this)">
    	<td class="noticeNo" width="5%"><%=list.get(i).getNo() %></td>
    	<td width="55%"><%=list.get(i).getTitle() %></td>
    	<td width="40%"><%=list.get(i).getStartDate() %>~<br><%=list.get(i).getEndDate() %></td>    	
      </tr>
    	<%    	
    }       
    %> 
 

</table>
</div>
<div>&nbsp;</div>

 <div class="w3-row">
              
        <div class="w3-bar w3-col m2">
          <button class="w3-bar-item w3-button btn" onclick="location='NoticeInputForm.jsp'">공지쓰기</button>        
        </div>
        
        <div class="w3-col m8">
          <input class="w3-input w3-border w3-padding" type="text" placeholder="공지글제목 검색" id="myInput" onkeyup="myFunction()">
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