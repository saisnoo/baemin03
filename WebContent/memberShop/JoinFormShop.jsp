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
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
	function check() {
		$("#btn").attr("disabled", true);
	};

	function reCheck() {
		var int
		i = 0;
		var pw = document.getElementsByName("pw").value;
		var pwc = document.getElementsByName("pwc").value;

		setInterval(function() {
			if (pw == pwc) {
				$("#btn").attr("disabled", true);
			} else {
				$("#btn").attr("disabled", false);
			}
		}, 1000);
	};
</script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
								//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
								function sample4_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var roadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ''; // 참고 항목 변수

													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraRoadAddr += (extraRoadAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraRoadAddr !== '') {
														extraRoadAddr = ' ('
																+ extraRoadAddr
																+ ')';
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById('sample4_postcode').value = data.zonecode;
													document
															.getElementById("sample4_roadAddress").value = roadAddr;
													document
															.getElementById("sample4_jibunAddress").value = data.jibunAddress;

													// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
													if (roadAddr !== '') {
														document
																.getElementById("sample4_extraAddress").value = extraRoadAddr;
													} else {
														document
																.getElementById("sample4_extraAddress").value = '';
													}

													var guideTextBox = document
															.getElementById("guide");
													// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
													if (data.autoRoadAddress) {
														var expRoadAddr = data.autoRoadAddress
																+ extraRoadAddr;
														guideTextBox.innerHTML = '(예상 도로명 주소 : '
																+ expRoadAddr
																+ ')';
														guideTextBox.style.display = 'block';

													} else if (data.autoJibunAddress) {
														var expJibunAddr = data.autoJibunAddress;
														guideTextBox.innerHTML = '(예상 지번 주소 : '
																+ expJibunAddr
																+ ')';
														guideTextBox.style.display = 'block';
													} else {
														guideTextBox.innerHTML = '';
														guideTextBox.style.display = 'none';
													}
												}
											}).open();
								}
							</script>
</head>
<body>
	<!-- 내용 -->
	<h2>JoinFormShop.jsp</h2>
	<br>
	<%
		
	%>






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

				<div class="w3-card">

					<div class="w3-container w3-blue">
						<h2>사업자 회원가입</h2>
					</div>
					<br>
					<form>
						<p>
							<label>아이디</label> <input class="w3-input" type="text" name="id"
								required>
						</p>
						<br>
						<p>
							<label>비밀번호</label> <input class="w3-input" type="password"
								name="pw" id="pw" required>
						</p>
						<br>
						<p>
							<label>비밀번호 확인</label> <input class="w3-input" type="password"
								name="pwc" required>
						</p>
						<br> <input type="button" value="중복체크" onClick="reCheck()">
						<br>
						<p>
							<label>이름</label> <input class="w3-input" type="text" name="name"
								required>
						</p>
						<br>
						<p>
							<label>전화번호</label> <input class="w3-input" type="text"
								name="tel" required>
						</p>
						<br>
						<p>
							<input type="text" id="sample4_postcode" placeholder="우편번호">
							<!--  -->
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							<!--  -->
							<br> <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
							<!--  -->
							<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
							<!--  -->
							<span id="guide" style="color: #999; display: none"></span>
							<!--  -->
							<input type="text" id="sample4_detailAddress" placeholder="상세주소">
							<!--  -->
							<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							<!--  -->
						</p>
						<!--  -->
						<input type="text" name="shopX"> <input type="text"name="shopY">
						<!--  -->
						<br>
						<p>
							<label>매장명</label>
							<!--  -->
							<input class="w3-input" type="text" name="shopname" required>
							<!--  -->
						</p>
						<br>
						<p>
							<label>분류</label> <select class="w3-select" name="category">
								<option value="null" disabled selected>선택해주세요</option>
								<option value="chicken">치킨</option>
								<option value="pizza">피자</option>
								<option value="Pork">돈까스</option>
								<option value="jpfood">일식</option>
								<option value="chfood">중식</option>
								<option value="drink">술집</option>
							</select>
						</p>
						<br>
						<p>
							<label>설명</label> <input class="w3-input" type="text" name="ex"
								required>
						</p>
						<br>
						<p>
							<label>지역</label> <input class="w3-input" type="text"
								name="place" required>
						</p>
						<br>
						<p>
							<label>연락처</label> <input class="w3-input" type="text"
								name="shoptel" required>
						</p>
						<br>
						<p>
							<input name="btn" class="w3-button w3-blue w3-margin"
								type="button" value="회원가입" disabled="disabled"> <input
								class="w3-button w3-blue w3-margin" type="button" value="뒤로가기"
								onClick="history.back()">
						</p>
					</form>
				</div>




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