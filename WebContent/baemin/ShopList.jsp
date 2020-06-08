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

	<%
		String category = request.getParameter("category");

		if (category == null) {
			category = "korean";
		}
	%>

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<div class="sw-container-500 w3-section">
			<div class="w3-container">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->

				<select name="category" id="category" class="w3-select w3-border"
					onchange="listReload()">
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
					window.onload = function() {
						setInterval(listReload, 2000);
					}

					function listReload() {
						var a1 = document.getElementById("category").value;
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


		<!-- responsive template by SW ----------------------------------------------------------- -->
		<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
		<div class="sw-topnav-margin">&nbsp;</div>
		<div class="sw-topnav-margin">&nbsp;</div>
		<%-- 사이트 공통 부분 Include - topnav --%>
		<jsp:include page="../sw_css/memberTopNav.jsp" />
</body>

</html>