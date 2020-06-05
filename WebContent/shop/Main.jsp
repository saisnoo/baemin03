<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>


<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Main.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Main.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	height: 700px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

.tablinks {
	height: 100px;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border-left: none;
	height: 700px;
	width: 100%;
}

.tabcontent2 {
	display: none;
}

.scroll-box {
	overflow-y: auto;
}
</style>
<script>
	// 스크립트
	function jumunBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[1].value;
		console.log(a1);
		document.getElementById("jumunSiganNo").value = a1;
		document.getElementById("jumunReady").style.display = "block";
	}
	function cancelBtn() {
		document.getElementById("jumunCancel").style.display = "block";
	}

	function cancelBtnIn() {
		var sel = document.getElementById("cancelSelect");

		var val = sel.options[sel.cancelSelect].value;
		alert(val)
	}
</script>
</head>
<body>
	<!-- 내용 -->
	<!-- 배달 주문 처리하는 메인 페이지-->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-1200">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<div class="w3-row w3-black">
					<a href="#" class="w3-button">
						<h3>배달의 인종</h3>
					</a>
				</div>
				<div class="w3-row w3-gray">
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab1')" id="defaultOpen2"
							class="w3-button w3-block w3-baemint w3-border">
							<h4>주문접수</h4>
						</button>
					</div>
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab2')"
							class="w3-button w3-block w3-black w3-border">
							<h4>매장관리</h4>
						</button>
					</div>
				</div>

				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div id="tabtab1" class="w3-row w3-gray tabcontent2">
					<div class="tab w3-col" style="width: 100px;">
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab1')" id="defaultOpen">
							접수대기<br /> <strong>3</strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab2')">
							배달중<br /> <strong>3</strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab3')">
							완료<br /> <strong>3</strong>
						</button>
					</div>
					<div class="w3-rest w3-white scroll-box">
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab1" class="tabcontent">



							<!-- 신규, 조리중 주문 목록  -->
							<!-- 신규, 조리중 주문 목록  -->
							<!-- 신규, 조리중 주문 목록  -->
							<div class="w3-section">
								<div class="w3-card w3-padding">
									<div class="w3-row">
										<div class="w3-col w3-container w3-left" style="width: 100px;">
											<h2>13:22</h2>
											<input type="text" value="338" />
										</div>
										<div class="w3-col w3-container w3-right"
											style="width: 200px; padding: 0px;">

											<button class="w3-button w3-blue h100"
												onclick="jumunBtn(this)">주문1</button>
											<button class="w3-button w3-yellow h100"
												onClick="cancelBtn(this)">주문취소</button>
										</div>
										<div class="w3-rest w3-container">
											<strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br /> 서울 구로구 구로동 구로빌딩
											254-14 402호
											<hr />
											김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 /
											스테이크 10 / 고등어자반 5
										</div>
									</div>
								</div>
							</div>
							<!-- load  new order  -->

							<!-- load  new order  -->
							<!-- 신규, 조리중 주문 목록  -->
							<div class="w3-section">
								<div class="w3-card w3-padding">
									<div class="w3-row">
										<div class="w3-col w3-container w3-left" style="width: 100px;">
											<h2>13:22</h2>
											<input type="text" value="999" />
										</div>
										<div class="w3-col w3-container w3-right"
											style="width: 200px; padding: 0px;">

											<button class="w3-button w3-blue h100"
												onclick="jumunBtn(this)">주문2</button>
											<button class="w3-button w3-yellow h100">주문취소</button>


										</div>

										<div class="w3-rest w3-container">
											<strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br /> 서울 구로구 구로동 구로빌딩
											254-14 402호
											<hr />

											김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 /
											스테이크 10 / 고등어자반 5
										</div>
									</div>
								</div>
							</div>
							<!-- load  new order  -->
							<!-- load  new order  -->
							<!-- load  new order  -->


						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab2" class="tabcontent">


							<!-- 배달중 목록 --//--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/ -->
							<div class="w3-section">
								<div class="w3-card w3-padding">
									<div class="w3-row">
										<div class="w3-col w3-container w3-left" style="width: 100px;">
											<h2>13:22</h2>
										</div>
										<div class="w3-col w3-container w3-right"
											style="width: 200px; padding: 0px;">
											<button class="w3-button w3-orange h100"
												onClick="cancelBtn(this)">취소</button>
										</div>

										<div class="w3-rest w3-container">
											<strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br /> 서울 구로구 구로동 구로빌딩
											254-14 402호
											<hr />

											김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 /
											스테이크 10 / 고등어자반 5
										</div>
									</div>
								</div>
							</div>
							<!-- load  new order --/--/-/-//-/--/-/-/-/-/-/-/-/-//-/-/-/ -->

						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab3" class="tabcontent">
							<!-- load  new order -/-/-/-/-/-/--/-/-/-/-/-/-/-/-/- -->
							<div class="w3-section">
								<div class="w3-card w3-padding">
									<div class="w3-row">
										<div class="w3-col w3-container w3-left" style="width: 100px;">
											<h2>13:22</h2>
										</div>
										<div class="w3-col w3-container w3-right"
											style="width: 200px; padding: 0px;">
											<button class="w3-button w3-blue h100">주문접수</button>
											<button class="w3-button w3-yellow h100">주문취소</button>
										</div>

										<div class="w3-rest w3-container">
											<strong>[메뉴 4개]</strong> &nbsp; 완료완료 <br /> 서울 구로구 구로동 구로빌딩
											254-14 402호
											<hr />

											김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 /
											스테이크 10 / 고등어자반 5
										</div>
									</div>
								</div>
							</div>
							<!-- load  new order /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ -->

						</div>
					</div>
				</div>
				<!--tabtab1 end-->

				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div id="tabtab2" class="w3-cyan w3-container tabcontent2">
					<h2 style="display:inline">메뉴구성</h2><br><h2 style="display:inline;"><input type="button" value="메뉴추가"></h2>
					
					<div style="width:50%;float:left">
					<input class="w3-input w3-border w3-padding" type="text"
						placeholder="Search for names.." id="myInput"
						onkeyup="myFunction()" style="width: 40%;">
					<table class="w3-table-all w3-margin-top" id="myTable">
						<tr>
							<th style="width: 20%;">이름</th>
							<th style="width: 80%;">재료</th>
						</tr>
						<tr>
							<td>김치찌개</td>
							<td>김치,물,돼지고기</td>
						</tr>
						<tr>
							<td>된장찌개</td>
							<td>된장,물,두부</td>
						</tr>
						<tr>
							<td>순댓국</td>
							<td>순대,물</td>
						</tr>
						<tr>
							<td>감자탕</td>
							<td>감자,돼지고기,야채</td>
						</tr>
						<tr>
							<td>불고기</td>
							<td>돼지고기</td>
						</tr>
						<tr>
							<td>김치전</td>
							<td>김치,식용유</td>
						</tr>
					</table>
					</div>
					<table border="1" style="width:50%;float:right">
						<tr>
							<th style="width: 20%;">목록</th>
							<th style="width: 80%;">입력창</th>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>설명</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><input type="text"></td>
						</tr>
					
					</table>
				</div>

				<script>
					function myFunction() {
						var input, filter, table, tr, td, i;
						input = document.getElementById("myInput");
						filter = input.value.toUpperCase();
						table = document.getElementById("myTable");
						tr = table.getElementsByTagName("tr");
						for (i = 0; i < tr.length; i++) {
							td = tr[i].getElementsByTagName("td")[0];
							if (td) {
								txtValue = td.textContent || td.innerText;
								if (txtValue.toUpperCase().indexOf(filter) > -1) {
									tr[i].style.display = "";
								} else {
									tr[i].style.display = "none";
								}
							}
						}
					}
				</script>


				<script>
					function openTab(evt, tabName) {
						var i, tabcontent, tablinks;
						tabcontent = document
								.getElementsByClassName("tabcontent");
						for (i = 0; i < tabcontent.length; i++) {
							tabcontent[i].style.display = "none";
						}
						tablinks = document.getElementsByClassName("tablinks");
						for (i = 0; i < tablinks.length; i++) {
							tablinks[i].className = tablinks[i].className
									.replace(" w3-white", "");
						}
						document.getElementById(tabName).style.display = "block";
						evt.currentTarget.className += " w3-white";
					}

					function openTab2(evt, tab2Name) {
						// Declare all variables
						var i, tabcontent2, tablink2;

						// Get all elements with class="tabcontent" and hide them
						tabcontent2 = document
								.getElementsByClassName("tabcontent2");
						for (i = 0; i < tabcontent2.length; i++) {
							tabcontent2[i].style.display = "none";
						}

						// Get all elements with class="tablink2" and remove the class "active"
						tablink2 = document.getElementsByClassName("tablink2");
						for (i = 0; i < tablink2.length; i++) {
							tablink2[i].className = tablink2[i].className
									.replace(" w3-baemint", "");
						}

						// Show the current tab, and add an "active" class to the button that opened the tab
						document.getElementById(tab2Name).style.display = "block";
						evt.currentTarget.className += " w3-baemint";
					}

					// Get the element with id="defaultOpen" and click on it
					document.getElementById("defaultOpen").click();
					document.getElementById("defaultOpen2").click();
				</script>
				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->
	<script>
		window.onresize = responsiveMenuClose;
		function responsiveMenuPopUp() {
			var x = document.getElementById("topNav");
			if (x.className === "topnav w3-card-4") {
				x.className += " responsive";
			} else {
				x.className = "topnav w3-card-4";
			}
		}

		function responsiveMenuClose() {
			var x = document.getElementById("topNav");
			x.className = "topnav w3-card-4";
		}
	</script>
	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
	<!-- 매장 main페이지는 별도의 상단바 필요할지도....????? -->
	<jsp:include page="../sw_css/topnav.jsp" />


	<!-- 주문접수 Modal시작 -->
	<div class="w3-modal" id="jumunReady">
		<div class="w3-modal-content">
			<div class="w3-container">
				<input id="jumunSiganNo" type="text" />
				<div class="w3-tag">주문접수시간</div>
				<div class="w3-tag w3-red">시간입력</div>
				<div class="w3-label w3-green">접수버튼처리</div>
				<div
					onclick="document.getElementById('jumunReady').style.display='none'"
					class="w3-button w3-display">닫기</div>
				<!-- w3-container 끝-->
			</div>
		</div>
	</div>
	<%--주문접수 모달 Modal끝 --%>
	<!--주문 취소 Modal시작 -->
	<div class="w3-modal" id="jumunCancel">
		<div class="w3-modal-content">
			<div class="w3-container">
				<div class="whyCancel">취소사유</div>
				<div class="cancelText">
					<select id="cancelSelect">
						<option class="cel" value="배달 사고">배달 사고</option>
						<option class="cel" value="거리멀음">거리 멀음</option>
						<option class="cel" value="재료없음">재료없음</option>
					</select>
				</div>
				<div class="cancelBtn" onclick="cancelBtnIn">취소버튼처리</div>
				<div
					onclick="document.getElementById('jumunCancel').style.display='none'"
					class="w3-button w3-display">닫기</div>
			</div>
			<!-- w3-container 끝-->
		</div>
	</div>
	<%--주문 취소 Modal끝 --%>


</body>
</html>