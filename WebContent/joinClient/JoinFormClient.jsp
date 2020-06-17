<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../util/ContextPath.jsp" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>JoinFormClient.jsp</title>



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
				document.getElementById('addr').value = data.address;
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
				<form class="w3-container" name="inputForm" action="${ctxpath}/joinClient/JoinClientPro.do" method="post">
					<!-- 아이디 .................. -->
					<div class="w3-row w3-section">
						<div class="w3-col w3-center w3-right" style="width: 70px;">
							<input type="button" value="체크" class="w3-button w3-baemint"
								onClick="checkId()" tabindex="2">
						</div>
						<div class="w3-rest">
							<input class="w3-input" type="text" name="id" id="id"
								onkeypress="idValueChange()" pattern="^[a-z0-9]{4,15}$" required
								placeholder="아이디 영어소문자, 숫자 4~15" tabindex="1">
						</div>
					</div>
					<!-- 비밀번호 .................. -->
					<div class="w3-row w3-section">
						<input class="w3-input" type="password" name="pw" id="pw"
							pattern="^[a-z0-9]{4,12}$" required onkeypress="pwValueChange() "
							placeholder="비밀번호 영어소문자, 숫자 4~12">
					</div>
					<!-- 비밀번호 체크 .................. -->
					<div class="w3-row w3-section">
						<input class="w3-input" type="password" name="pw2" id="pw2"
							pattern="^[a-z0-9]{4,12}$" required onkeypress="pwValueChange() "
							placeholder="비밀번호 확인용">
					</div>
					<!-- 비밀번호 체크 결과 .................. -->
					<div id="passwordCheckResultDisplay" class="w3-row w3-section"></div>
					<!-- 이름 .................. -->
					<div class="w3-row w3-section">
						<input class="w3-input" type="text" name="name" id="name"
							pattern="^[^;]{1,30}$" required placeholder="이름">
					</div>
					<!-- 전화번호 .................. -->
					<div class="w3-row w3-section">
						<div class="w3-col s4">
							<select name="tel1" id="tel1" class="w3-input w3-border"
								style="height: 40px;">
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
						<input type="text" name="addr" id="addr" class="w3-input" placeholder="주소"
							readonly>
					</div>
					<div class="w3-row w3-center w3-section">
						<input type="text" name="addr2" id="addr2" class="w3-input"
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
					<input type="text" name="memberX" id="memberX"> <input type="text"
						name="memberY" id="memberY">
				</form>
				<!-- formformformformformformformformform -->
				<script>
					function back2index() {
						location.href = "../index.html";
					}

					var geocoder = new kakao.maps.services.Geocoder();

					function juso2coord() {
						var addr = document.getElementById("addr").value;
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
							document.getElementById("memberX").value = result[0].address.x;
							document.getElementById("memberY").value = result[0].address.y;
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
			var p1 = document.getElementById("pw").value;
			var p2 = document.getElementById("pw2").value;

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
			console.log("--checkId()" + document.getElementById("id").value);
			var data1 = {
				// 항목이름 : 값(변수)
				id : document.getElementById("id").value,
			}

			$
					.ajax({
						type : "get",
						//dataType : "text",
						url : "${ctxpath}/joinClient/IdCheck.do",
						data : data1,
						dataType : "text",
						success : function(result) {
							console.log("result=" + result);
							var temp_response = result.trim() + "";
							console.log("temp_response=" + temp_response);
							console.log("temp_response.length="
									+ temp_response.length);
							if (temp_response == 0) {
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