<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../util/ContextPath.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>UpdateShopForm.jsp</title>


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
	function pwCheck(){
		var pw = $("#password").val();
		var pw2 = $("#password2").val();
		
		if(!pw || !pw2 || pw.length<4 || pw.length>8 || pw2.length<4 || pw2.length>8){
			$(".pwtx").text("비밀번호가 틀립니다.");
		}else{
			$(".pwtx").text("비밀번호가 같습니다.");
		}
	}
	
</script>
</head>
<body>
	<!-- 내용 -->
	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<form method="post" action="${ctxpath}/memberShop/UpdateShopPro.do">
	<div class="sw-center" style="margin-top: 2%">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-500">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<!--사용자 마이 페이지-->
				<div class="w3-container w3-card">
					<div class="w3-section w3-center">
					  <h2>회원정보수정</h2>
					</div>
						  <p>
						  	<label><b>아이디</b></label>
							  <input type="text" class="w3-input w3-border" readonly value="${dto.id }">
						  </p>
						  
						  <p>
						  	<label><b>분류</b></label>
							  <input type="text" class="w3-input w3-border" readonly value="${dto.shopCategory }">
						  </p>
						  
						  <p>
						  	<label><b>이름</b></label>
							  <input type="text" class="w3-input w3-border" readonly value="${dto.shopName }">
						  </p>
					  
					  
						  <p>
						  	<label><b>전화번호</b></label>
							  <input type="text" class="w3-input w3-border" name="shopTel" id="shopTel" value="${dto.shopTel }">
						  </p>
					  
						  <p>
						  	<label><b>주소</b></label>
							  <input type="text" class="w3-input w3-border" readonly value="${dto.shopAddr }">
							  <input type="text" class="w3-input w3-border" readonly value="${dto.shopAddr2 }">
						  </p>
					  
						  <p>
						  	<label><b>비밀번호</b></label>
							  <input type="password" class="w3-input w3-border" size="10" id="password" name="password" onChange="pwCheck()">
							  <input type="password" class="w3-input w3-border" size="10" id="password2" name="password2" onChange="pwCheck()">
						  </p>
							  <div class="pwtx"></div>
					  
					  <div class="w3-section w3-center">
	   				  	<input class="w3-button w3-border w3-baemint" type="submit" value="회원정보수정">
	   				  	<input class="w3-button w3-border w3-baemint" type="reset" value="다시쓰기">
					  	<input class="w3-button w3-border w3-baemint" type="button" value="취소" onclick="javascript:history.back()">
					  </div>
				</div>
				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	</form>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/topnav.jsp" />


</body>
</html>