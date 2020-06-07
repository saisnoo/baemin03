<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ JoinFormShop.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>JoinFormShop.jsp</title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- daum주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 카카오맵 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83e40c4e40825188941c71c9755c0bb7&libraries=services">
	
</script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	//DAUM 주소 openAPI
	function openDaumPostcode() {

		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('shopAddr').value = data.address;
			}
		}).open();

	} //openDaumPostcode()---
</script>
</head>

<body>
	<!-- 내용 -->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<!-- formformformformformformformformform -->
				<form class="w3-container" name="inputForm" action="joinShopPro.jsp"
					method="post">
					<!-- 아이디 .................. -->
					<div class="w3-row w3-section">
						<div class="w3-col w3-center w3-right" style="width: 70px;">
							<input type="button" value="체크" class="w3-button w3-baemint"
								onClick="checkId()" tabindex="2">
						</div>
						<div class="w3-rest">
							<input class="w3-input" type="text" name="ShopID" id="ShopID"
								onkeypress="idValueChange()" pattern="^[a-z0-9]{4,15}$" required
								placeholder="아이디 영어소문자, 숫자 4~15" tabindex="1">
						</div>
					</div>
					<!-- 비밀번호 .................. -->
					<div class="w3-row w3-section">
						<input class="w3-input" type="password" name="shopPW" id="shopPW"
							pattern="^[a-z0-9]{4,12}$" required onkeypress="pwValueChange() "
							placeholder="비밀번호 영어소문자, 숫자 4~12">
					</div>
					<!-- 비밀번호 체크 .................. -->
					<div class="w3-row w3-section">
						<input class="w3-input" type="password" name="shopPW2" id="shopPW2"
							pattern="^[a-z0-9]{4,12}$" required onkeypress="pwValueChange() "
							placeholder="비밀번호 확인용">
					</div>
					<!-- 비밀번호 체크 결과 .................. -->
					<div id="passwordCheckResultDisplay" class="w3-row w3-section"></div>
					<!-- 이름 .................. -->
					<div class="w3-row w3-section">
						<input class="w3-input" type="text" name="shopName" id="shopName"
							pattern="^[^;]{1,30}$" required placeholder="상호">
					</div>

					<!-- 카데고리.................. -->
					<div class="w3-row w3-section">
						<input type="checkbox" class="w3-input" name="shopCategory" value="한식">한식
						<input type="checkbox" class="w3-input" name="shopCategory" value="양식">양식
						<input type="checkbox" class="w3-input" name="shopCategory" value="중식">중식
						<input type="checkbox" class="w3-input" name="shopCategory" value="일식">일식
						<input type="checkbox" class="w3-input" name="shopCategory" value="피자">피자
						<input type="checkbox" class="w3-input" name="shopCategory" value="치킨">치킨
						<input type="checkbox" class="w3-input" name="shopCategory" value="햄버거">햄버거
						<input type="checkbox" class="w3-input" name="shopCategory" value="까페">까페
					</div>

					<!-- 가게 소개 .................. -->
					<div class="w3-row w3-section">
						<textarea rows="10" class="w3-input w3-border" placeholder="매장 소개글 입력"
							name="shopEx" style="width: 100%"></textarea>
					</div>

					<!-- 전화번호 .................. -->
					<div class="w3-row w3-section">
						<div class="w3-col s4">
							<select name="tel1" id="tel1" class="w3-input w3-border"
								style="height: 40px;">
								<option value="02">02</option>

								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>

								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>

								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>

								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">064</option>

								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
						</div>
						<div class="w3-col s4">
							<input type="text" class="w3-input w3-border" name="tel2" id="tel2"
								pattern="^\d{3,4}$">
						</div>
						<div class="w3-col s4">
							<input type="text" class="w3-input w3-border" name="tel3" id="tel3"
								pattern="^\d{4,4}$">
						</div>
					</div>
					<!-- 주소 .................. -->
					<div class="w3-row w3-center w3-section">
						<div class="w3-col w3-left" style="width: 100px;">
							<input type="text" name="zipcode" id="zipcode" placeholder="우편번호"
								readonly class="w3-input">
						</div>
						<div class="w3-col w3-right" style="width: 100px;">
							<button type="button" onclick="openDaumPostcode()"
								class="w3-button w3-baemint">주소검색</button>
						</div>
					</div>
					<div class="w3-row w3-center w3-section">
						<input type="text" name="shopAddr" id="shopAddr" class="w3-input"
							placeholder="주소" readonly>
					</div>
					<div class="w3-row w3-center w3-section">
						<input type="text" name="shopAddr2" id="shopAddr2" class="w3-input"
							pattern="^[^;]{1,30}$" placeholder="상세주소" required>
					</div>
					<!-- 버튼 .................. -->
					<div class="w3-row w3-center w3-section">
						<input id="btn" name="btn" class="w3-button w3-baemint" type="submit"
							value="회원가입" disabled>
						<!-- ................................................................ -->
						<input class="w3-button w3-baemint" type="button" value="뒤로가기"
							onClick="back2index()">
						<!-- ................................................................ -->
						<input class="w3-button w3-baemint" type="reset" value="리셋">
					</div>
					<!-- 버튼 .................. -->
					<!-- ................................................................ -->
					<input type="text" name="shopX" id="shopX">
					<!-- ................................................................ -->
					<input type="text" name="shopY" id="shopY">
					<!-- ................................................................ -->
				</form>
				<!-- formformformformformformformformform -->
				<script>
					function back2index() {
						location.href = "../index.html";
					}

					var geocoder = new kakao.maps.services.Geocoder();

					function juso2coord() {
						var addr = document.getElementById("shopAddr").value;
						console.log("addr" + addr);
						if (addr.length > 4) {
							geocoder.addressSearch(addr, getCoord);
						}
					}

					var getCoord = function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							// console.log(result);
							console.log(result[0].address.x);
							console.log(result[0].address.y);
							document.getElementById("shopX").value = result[0].address.x;
							document.getElementById("shopY").value = result[0].address.y;
						}
					};
				</script>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->


	<script>
		//상태 check 위한 전역변수
		var whereShowPwCheckResult = document
				.getElementById("passwordCheckResultDisplay");
		var isIdOK = 0; // 1= 사용가능
		var isPwOk = 0; // 1=패스워드 조건 ok

		/// 비밀번호 일치 checking interval
		function passwordChecking() {
			console.log("비밀번호 체킹중")
			var p1 = document.getElementById("shopPW").value;
			var p2 = document.getElementById("shopPW2").value;

			if (p1 == p2 && p1.length > 3) {
				console.log("비밀번호 일치 AND >3");
				isPwOk = 1;
			} else {
				console.log("비밀번호 not OK");
				isPwOk = 0;
			}
		} //  passwordChecking() end

		//아이디변경check
		function idValueChange() {
			console.log("아이디 변경. re-check required");
			whereShowPwCheckResult.innerHTML = "";
			isIdOK = 0;
		} //  idValueChange() end

		//비밀번호변경check
		function pwValueChange() {
			console.log("비밀번호 변경. re-check required");
			isPwOk = 0;
		} //  idValueChange() end

		function checkId() {
			console.log("--checkId()"+ document.getElementById("ShopID").value);
			var data1 = {
				// 항목이름 : 값(변수)
				id : document.getElementById("ShopID").value,
			}

			$
					.ajax({
						type : "get",
						//dataType : "text",
						url : "idCheck.jsp",
						data : data1,
						success : function(result) {
							console.log("result=" + result);
							var temp_response = result.trim() + "";
							console.log("temp_response=" + temp_response);
							console.log("temp_response.length="
									+ temp_response.length);
							if (temp_response.length > 3) {
								whereShowPwCheckResult.innerHTML = '<div class="w3-green"> 사용가능 </div>';
								isIdOK = 1;
							} else {
								whereShowPwCheckResult.innerHTML = '<div class="w3-red"> 사용불가 </div>';
							}

						}
					});
		} // checkId() end

		window.onload = function() {
			setInterval(passwordChecking, 301);
			setInterval(canSubmit, 1001)
			setInterval(juso2coord, 450)
		}

		function canSubmit() {
			console.log("------------canSubmit????   isIdOK " + isIdOK
					+ " isPwOk " + isPwOk);
			var idpw = isIdOK + isPwOk;
			console.log(idpw);
			if (idpw == 2) {
				document.getElementById("btn").disabled = false;
			} else {
				document.getElementById("btn").disabled = true;
			}
		}
	</script>

</body>

</html>