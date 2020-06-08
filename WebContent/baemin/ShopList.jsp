<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ ShopList.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>ShopList.jsp</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#topnav {
	position: fixed;
	top: 0;
	width: 100%;
	overflow: hidden;
}
</style>
</head>

<body>
	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<div class="sw-container-500 w3-section">
			<div class="w3-container">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->

				<select name="category" id="category" class="w3-select w3-border"
					onchange="listReload(this)">
					<option value="korean">한식</option>
					<option value="western">양식</option>
					<option value="chinese">중식</option>
					<option value="japanese">일식</option>
					<option value="pizza">피자</option>
					<option value="chicken">치킨</option>
					<option value="hamburger">햄버거</option>
					<option value="cafe">카페</option>
				</select>

				<script>
					function listReload(e) {
						var a1 = e.value;
						console.log(a1);
						$("#shopListHere").load(
								"ShopListContent.jsp?category=" + a1);
					}
				</script>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>

		<script>
			function go2Shop(e) {
				var a1 = e.children[0].children[1].children[1].value.trim();
				console.log(a1);
				location.href = "ShopPage.jsp?shopNo=" + a1;
			}
		</script>

		<!-- 단락구분선-----------------------------------------------------------------------------/-/-/-/-/-/--/-/------------------------------------- -->
		<div class="sw-container-500 w3-section">
			<div id="shopListHere" class="">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->






				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
		<!-- 단락구분선-----------------------------------------------------------------------------/-/-/-/-/-/--/-/------------------------------------- -->


		<!-- HEAD ------------------------------------------------------------------------------------ -->
		<!-- head가 맨 나중?나중에 나온 요소가 레이어 맨위로... ---------------------------------------->
		<div class="w3-card-4 w3-center w3-baemint" id="topnav">
			<div class="w3-baemint">
				<h3 style="font-family: baemin_font;">배달의 인종</h3>
			</div>
		</div>

		<script>
			/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
		</script>
		<div class="w3-bottom w3-center w3-border-top"
			style="padding-bottom: 5px; background: #ffffffdd;">
			<div class="w3-row sw-container-500"
				style="margin-top: 5px; height: 20px;">
				<!-- ///////////////// -->
				<a href="Main.jsp" class="w3-button w3-col s3 w3-center"
					style="padding: 0px;"> <i class="material-icons"
					style="font-size: 48px; color: #45c1bf;">home</i>
				</a>
				<!-- ///////////////// -->
				<a href="../notice/NoticeList.jsp"
					class="w3-button w3-col s3 w3-center" style="padding: 0px;"> <i
					class="material-icons" style="font-size: 48px; color: #45c1bf;">notifications</i>
				</a>
				<!-- ///////////////// -->
				<a href="#" class="w3-button w3-col s3 w3-center"
					style="padding: 0px;"> <i class="material-icons"
					style="font-size: 48px; color: #45c1bf;">local_grocery_store</i>
				</a>
				<!-- ///////////////// -->
				<a href="../memberClient/MyPageClient.jsp"
					class="w3-button w3-col s3 w3-center" style="padding: 0px;"> <i
					class="material-icons" style="font-size: 48px; color: #45c1bf;">account_circle</i>
				</a>
			</div>

			<div class="w3-row sw-container-500">
				<div class="w3-col s3 w3-center" onclick="toHome()">Home</div>
				<div class="w3-col s3 w3-center">Notice</div>
				<div class="w3-col s3 w3-center">Order</div>
				<div class="w3-col s3 w3-center">Mypage</div>
			</div>

			<script>
				function toHome() {
					location.href = "";
				}
			</script>

		</div>
</body>

</html>