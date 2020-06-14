<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

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

#selecter {
	position: fixed;
	top: 50px;
	width: 100%;
}
</style>

</head>

<body>

	<%
		String category = request.getParameter("category");

		if (category == null) {
			category = "korean";
		}

		System.out.println("category=" + category + "----");
	%>

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin" style="margin: 30px">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<script>
			window.onload = function() {
				category_first_select();
				setTimeout(listReload, 700);
			}

			function listReload() {
				var a1 = document.getElementById("category").value;
				console.log(a1);
				$("#shopListHere").load("ShopListContent.jsp?category=" + a1);
				window.scroll(0, 0);
			}

			function go2Shop(e) {
				var a1 = e.children[0].children[1].children[1].value.trim();
				console.log(a1);
				location.href = "ShopPage.jsp?shopNo=" + a1;
			}

			// get방식 파라미터로 초기   SELCET
			function category_first_select() {
				var selec = document.getElementById("category");
				console.log(selec);
				var selec_val = "<%=category%>";
				console.log("selec_val " + selec_val);
				console.log("selec.value " + selec.value);

				for (var i = 0; i < 8; i++) {
					console.log(i + " " + selec[i].value + "  " + selec_val);
					if (selec[i].value == selec_val) {
						selec.selectedIndex = i;
						console.log(i + "" + i + "" + i + "" + i + "" + i + ""
								+ i)
						break;
					}
				}
			}
		</script>

		<!-- 단락구분선-----------------------------------------------------------------------------/-/-/-/-/-/--/-/------------------------------------- -->
		<div class="sw-container-500 w3-section" id="contentBox">
			<div id="shopListHere" class="">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->


				<!-- 로딩 화면 -->
				<div class="w3-center w3-section">
					<br /> <br /> <br /> <i class="fa fa-spinner fa-spin"
						style="font-size: 70px"></i>
				</div>


				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
		<!-- 단락구분선-----------------------------------------------------------------------------/-/-/-/-/-/--/-/------------------------------------- -->


		<div id="selecter" class="w3-row w3-center" style="background: #fff">
			<div class="sw-container-500" style="margin-top: 35px">
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
			</div>
		</div>



		<!-- responsive template by SW ----------------------------------------------------------- -->
		<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
		<div class="sw-topnav-margin">&nbsp;</div>
		<div class="sw-topnav-margin">&nbsp;</div>
		<%-- 사이트 공통 부분 Include - topnav --%>
		<jsp:include page="../sw_css/memberTopNav.jsp" />
</body>

</html>