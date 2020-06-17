<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../util/ContextPath.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>MyPageShop.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
</head>
<body>
	<!-- 내용 -->
	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin w3-section">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-500">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<!--사업자 마이 페이지-->
				<div class="w3-container w3-card">

					<h2 align="center">회원정보</h2>
					<form class="w3-container" method="post" action="${ctxpath}/memberShop/UpdateShopForm.do"
						name="clientMyPage">

						<!--  -->
						<label><b>아이디</b></label> <input class="w3-input w3-border" name="shopId" id="shopId" readonly="readonly" type="text" value="${dto.id }">
						<!--  -->
						<br>
						<!--  -->
						<label><b>분류</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopCategory" id="shopCategory" readonly="readonly" type="text" value="${dto.shopCategory}">
						<!--  -->
						<br>
						<!--  -->
						<label><b>매장명</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopName" id="shopName" readonly="readonly" type="text" value="${dto.shopName}">
						<!--  -->
						<br>
						<!--  -->
						<label><b>전화번호</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopTel" id="shopTel" readonly="readonly" type="text" value="${dto.shopTel}">
						<!--  -->
						<br>
						<!--  -->
						<label><b>주소</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopAddr" id="shopAddr" readonly="readonly" type="text" value="${dto.shopAddr}">
						<!--  -->
						<br>
						<!--  -->
						<label><b>상세주소</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopAddr1" id="shopAddr1" readonly="readonly" type="text" value="${dto.shopAddr2}">
						<!--  -->
						<br>
						<div class="w3-section w3-center">
							<input type="submit" class="w3-button w3-baemint" value="회원정보수정">
						    <input type="button" class="w3-button w3-baemint" value="뒤로가기" onclick="javascript:history.back()'">
						    <input type="button" class="w3-button w3-baemint" value="로그아웃" onClick="location='${ctxpath}/util/Logout.do'">
						</div>
						<br>
					</form>
				</div>
				<!-- ------------------------------------------------------------------------------------------- -->


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