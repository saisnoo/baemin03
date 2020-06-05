<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------ MyPageClient.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> MyPageClient.jsp  </title>
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
 
</style>
<script>
// 스크립트
  
</script>
</head>
<body>
<!-- 내용 -->
<h2> MyPageClient.jsp </h2><br>
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



        <!--사용자 마이 페이지-->
        <div class="w3-container w3-card">
                <h2>XXX님의 마이페이지</h2>
            <br>
                <p>
                    ID : kildong
                </p>
                <p>
                    비밀번호 : ********
                </p>
                <p>
                    이름 : 홍길동
                </p>
                <p>
                    전화번호 : 010-8282-5959
                </p>
                <p>
                    주소 : 사랑시 고백구 행복동
                </p>
                <br>
            <p>
                <!-- 변경창을 이용할때는 모달을 이용하자 -->
                <script>
                function modalOn(){
                	document.getElementById('update').style.display='block'
                }
                function modalOff(){
                	document.getElementById('update').style.display='none'
                }
                </script>
        <button onClick="modalOn()" class="w3-button w3-black">개인정보 수정</button>
            </p>
        </div>
        <!-- ------------------------------------------------------------------------------------------------ -->
        <!-- 모달창 시작 -->
        <div id="update" class="w3-modal">
          <div class="w3-modal-content">
            <div class="w3-container">
              <span onClick="modalOff()" class="w3-button w3-display-topright">X</span>
              <form method="post" action="UpdateClientPro.jsp">
                  <p>비밀번호 변경</p>
                  <p><input type="password" name="pw"></p>
                  
                  <!-- Ajax 처리로 비밀번호 체크 -->
                  <p>비밀번호 확인</p>
                  <p><input type="password" name="pwc"></p>
                  
                  <!-- 기존의 전화번호를 value값에 집어넣어 수정하고싶으면 하고 아니면 원래값 그대로 넘기기 -->
                  <p>전화번호 변경</p>
                  <p><input type="text" name="tel" value="010-5252-8282"></p>
                  
                  <p>
                      <input class="w3-button w3-border" type="submit" value="변경">
                      <input class="w3-button w3-border" type="button" value="취소" onclick="modalOff()">
                    </p>
                </form>
            </div>
          </div>
        </div>
        <!-- 모달창 끝 -->
        <!-- ------------------------------------------------------------------------------------------------ -->





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