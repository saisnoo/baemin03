<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ MyPageClient.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>MyPageClient.jsp</title>


<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - jquery 3.4.1 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - bootstrap 3.4.1 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
/* *{
    margin: 0px;
	padding: 0px;
} */
</style>
<script>
	function pwCheck() {
		var pw = document.modalForm.pw.value;
		var pwc = document.modalForm.pwc.value;
		if (pw == pwc && pw.length > 3) {
			console.log("비밀번호 일치");
			document.getElementById("btn").disabled = false;
			pwCk = 1;
		} else {
			console.log("비밀번호 틀림");
			document.getElementById("btn").disabled = true;
			pwCk = 0;
		}
	} //  pwCheck() end

	function rePwCheck() {
		document.getElementById("btn").disabled = true;
	}
</script>
</head>
<body>
	<!-- 내용 -->
	<%
		Object no_ob = session.getAttribute("no");
		int no = Integer.parseInt(no_ob + "");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getDTO(no);
	%>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center" style="margin-top: 2%">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<!--사용자 마이 페이지-->
				<div class="w3-container w3-card">
					<div class="w3-section w3-center">
					  <h2>회원정보</h2>
					</div>
					  <div class="w3-panel w3-border-bottom">
						  <label><b>이름 :</b></label>
						  <p><%=dto.getName() %></p>
					  </div>
					  
					  <div class="w3-panel w3-border-bottom">
						  <label><b>아이디 :</b></label>
						  <p><%=dto.getId() %></p>
					  </div>
					  
					  <div class="w3-panel w3-border-bottom">
						  <label><b>전화번호 :</b></label>
						  <p><%=dto.getTel() %></p>
					  </div>
					  
					  <div class="w3-panel w3-border-bottom">
						  <label><b>주소 :</b></label>
						  <p><%=dto.getAddr() %></p>
						  <p><%=dto.getAddr2() %></p>
					  </div>
					  
					  <div class="w3-panel w3-border-bottom">
						  <label><b>가입일 :</b></label>
						  <p><%=dto.getRegDate() %></p>
					  </div>
					  <div class="w3-section w3-center">
	   				  	<input class="w3-button w3-border w3-baemint" type="button" value="회원정보수정" onclick="location='UpdateClientForm.jsp'">
					  	<input class="w3-button w3-border w3-baemint" type="button" value="취소" onclick="javascript:history.back()">
					  <!-- ------------------------------------------------------------------------------------------------ -->
						<button onClick="location = '../util/logout.jsp'"
							class="w3-button w3-border w3-baemint">로그아웃</button>
					  
					  </div>
				</div>
				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />

</body>
</html>