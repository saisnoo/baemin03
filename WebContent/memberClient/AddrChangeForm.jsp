<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ AddrChangeForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>AddrChangeForm.jsp</title>

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
	// 스크립트
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



				<!--사용자 마이 페이지-->
				<div class="w3-container w3-card">

					<form method="post" action="ChangeAddrPro.jsp">
						<table class="w3-table">
							<tr>
								<td colspan="2"><h4>새로운 주소를 검색하세요</h4></td>
							</tr>
							<tr>
								<td width="50%">
									<!-- ---------------------------------------------------------------------------------- -->
									<input type="text" id="zipcode" name="zipcode" class="w3-input"
									readonly />
								</td>
								<td width="50%">
									<!-- ---------------------------------------------------------------------------------- -->
									<input type="button" class="w3-button w3-baemint w3-block"
									value="주소 검색" onclick="openDaumPostcode()" /> <!-- ---------------------------------------------------------------------------------- -->

								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- ---------------------------------------------------------------------------------- -->
									<input type="text" id="addr" name="addr" class="w3-input"
									readonly /> <!-- ---------------------------------------------------- -->
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- ---------------------------------------------------------------------------------- -->
									<input type="text" id="addr2" name="addr2" class="w3-input" />
									<!-- ---------------------------------------------------- -->
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- ---------------------------------------------------------------------------------- -->
									<input type="text" id="memberX" name="memberX" class="w3-input" />
									<input type="text" id="memberY" name="memberY" class="w3-input" />
									<!-- ---------------------------------------------------- -->
								</td>
							</tr>
							<tr>
								<td>
									<!-- ------------------------------------------------------------------------------ -->
									<input type="submit" value="주소 변경하기"
									class="w3-button w3-baemint w3-block" /> <!-- ------------------------------------------------------------------------------ -->
								</td>
								<td>
									<!-- ------------------------------------------------------------------------------ -->
									<input type="button" value="돌아가기" onclick="back2Main()"
									class="w3-button w3-baemint w3-block" />
								</td>

							</tr>
						</table>
					</form>



				</div>
				<!-- ------------------------------------------------------------------------------------------------ -->





				<script>
					var preZipcode = "";

					window.onload = function() {
						setInterval(
								function() {
									var a1 = document.getElementById("addr").value.length;

									if (a1 > 0) {
										juso2coord()
									}
								}, 1500);
					}

					//DAUM 주소 openAPI
					function openDaumPostcode() {

						new daum.Postcode(
								{
									oncomplete : function(data) {
										document.getElementById('zipcode').value = data.zonecode;
										document.getElementById('addr').value = data.address;
									}
								}).open();
					}//openDaumPostcode()---

					function back2Main() {
						location.href = "../baemin/Main.jsp";
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

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />




</body>
</html>