<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Document</title>

	<!-- CDN OFFLINE- sw_topNav.css -->
	<link rel="stylesheet" href="./sw_css/sw-1.0.0.css" />
	<!-- CDN - W3CSS -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />

	<style>
		* {
			font-family: baemin_font;
			font-size: 105%;
		}


		body {
			text-align: center;
		}

		h1 {
			transition: 1s;
			color: #f1f1f1;
		}

		button {
			font-weight: 500;
		}

		/* Style the tab */
		.tab {
			overflow: hidden;
			border: 1px solid #ccc;
			background-color: #f1f1f1;
			display: grid;
			grid-template-columns: 1fr 1fr;
		}

		.grid {
			display: grid;
			grid-template-columns: 1fr 1fr;
		}

		/* Style the buttons inside the tab */
		.tab button {
			background-color: #555;
			float: left;
			border: none;
			outline: none;
			cursor: pointer;
			padding: 14px 16px;
			transition: 0.3s;
			font-size: 17px;
			color: #f1f1f1;
		}

		/* Style the tab content */
		.tabcontent {
			display: none;
			padding: 6px 12px;
		}
	</style>
</head>

<body>


	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-section w3-container w3-card-4 w3-baemint">
				<!-- 1 main content start here!!!----------------------------------------------------------- -->

				<h1 class="w3-section">베달의 민족</h1>

				<div class="tab">
					<button id="btn1" class="tablinks" onclick="clientFormOpen()">사용자
					</button>
					<button id="btn2" class="tablinks" onclick="shopFormOpen()">가맹점</button>
				</div>

				<div id="tab1" class="tabcontent">
					<form action="./memberClient/loginClientPro.jsp" method="POST" name="loginFormClient">
						<!-- ------------------------------------------------------------- -->
						<label class="w3-left w3-section">아이디</label>
						<!-- ------------------------------------------------------------- -->
						<input type="text" class="w3-input" name="id" id="id" />
						<!-- ------------------------------------------------------------- -->
						<label class="w3-left w3-section">비밀번호</label>
						<!-- ------------------------------------------------------------- -->
						<input type="password" class="w3-input" style="font-family: Arial, Helvetica, sans-serif;" name="pw" id="pw" />
						<!-- ------------------------------------------------------------- -->

						<div class="grid w3-section">
							<button class="w3-button w3-baemint w3-border" type="submit">
								로그인</button>
							<button class="w3-button w3-baemint w3-border" type="button"
								onClick="location.href='./memberClient/JoinFormCilent.jsp'">
								회원가입</button>
						</div>
					</form>
				</div>

				<div id="tab2" class="tabcontent">
					<form action="./memberShop/loginShopPro.jsp" method="POST" name="LoginFormShop">
						<label class="w3-left w3-section">아이디</label>
						<!-- ------------------------------------------------------------- -->
						<input type="text" class="w3-input" name="shopID" id="shopID" />
						<!-- ------------------------------------------------------------- -->
						<label class="w3-left w3-section">비밀번호</label>
						<!-- ------------------------------------------------------------- -->
						<input type="password" class="w3-input" style="font-family: Arial, Helvetica, sans-serif;" name="shopPW" id="shopPW" />
						<!-- ------------------------------------------------------------- -->
						<div class="grid w3-section">
							<button class="w3-button w3-baemint w3-border" type="submit">
								사장님 로그인</button>
							<button class="w3-button w3-baemint w3-border" type="button"
								onClick="location.href='./memberShop/JoinFormShop.jsp'">가맹점
								가입</button>
						</div>
					</form>
				</div>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>

	<script>
		window.onload = function () {
			clientFormOpen();
		};

		var tabPage1 = document.getElementById("tab1");
		var tabPage2 = document.getElementById("tab2");
		var btn1 = document.getElementById("btn1");
		var btn2 = document.getElementById("btn2");

		function clientFormOpen() {
			tabPage1.style.display = "block";
			tabPage2.style.display = "none";
			btn1.style.border = "3px solid white";
			btn2.style.border = "3px solid black";
			btn1.style.background = "#45c1bf";
			btn2.style.background = "#555";
		}

		function shopFormOpen() {
			tabPage1.style.display = "none";
			tabPage2.style.display = "block";
			btn1.style.border = "3px solid black";
			btn2.style.border = "3px solid white";
			btn1.style.background = "#555";
			btn2.style.background = "#45c1bf";
		}
	</script>
</body>

</html>