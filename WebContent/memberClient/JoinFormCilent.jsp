<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------ JoinFormCilent.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> JoinFormCilent.jsp  </title>
 <!-- CDN - Font Awesome 4 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <!-- CDN - jquery 3.4.1 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <!-- CDN - W3CSS -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <!-- CDN OFFLINE- sw_topNav.css -->
 <link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
 
<style>
 * { margin: 0px;   padding: 0px;  } 
 
</style>
<script>
// 스크립트
function checkIt(){
	var int i = 0;
	var pw = $("#pw").val();
	var pwc = $("#pwc").val();
	
	if(pw != "" || pwc != ""){
		if(pw == pwc){
			i = 1;
		}
	}
	
}

function startCk(){
	setInterval(checkIt(), 500);
	alert(i);
}
  
  
</script>
</head>
<body>
<!-- 내용 -->
<h2> JoinFormCilent.jsp </h2><br>
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
<div class="sw-container-400">
<div class="w3-container">
<!--  main content start here!!!----------------------------------------------------------- -->


    <div class="w3-container w3-card-4">

        <div class="w3-container w3-blue">
            <h2>사용자 회원가입</h2>
        </div>
			<br>
        <form class="w3-container">
            <p>
                <label>아이디</label>
                <input class="w3-input" type="text" name="id"></p>
                <p><input type="button" value="ID체크" onClick="checkIt()"></p>
				<br>
            <p>
                <label>비밀번호</label>
                <input class="w3-input" type="password" name="pw" id="pw"></p>
				<br>
            <p>
                <label>비밀번호 확인</label>
                <input class="w3-input" type="password" name="pwc" id="pwc"></p>
				<br>
            <p>
                <label>이름</label>
                <input class="w3-input" type="text" name="name"></p>
				<br>
            <p>
                <label>전화번호</label>
                <input class="w3-input" type="text" name="tel"></p>
				<br>
            <p>
                <label>주소</label>
                <input class="w3-input" type="text" name="addr"></p>
				<br>
            <p>
                <input class="w3-button w3-blue w3-margin" type="button" value="회원가입" onClick="location='./memberShop/JoinShopPro.jsp'" disabled>
                <input class="w3-button w3-blue w3-margin" type="button" value="뒤로가기" onClick="history.back()">
            </p>
        </form>
    </div>


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